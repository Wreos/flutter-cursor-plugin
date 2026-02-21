#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "${repo_root}"

pass_count=0
fail_count=0

check() {
  local name="$1"
  local cmd="$2"
  if eval "${cmd}" >/dev/null 2>&1; then
    echo "PASS | ${name}"
    pass_count=$((pass_count + 1))
  else
    echo "FAIL | ${name}"
    fail_count=$((fail_count + 1))
  fi
}

canonical_commands=(
  "commands/implement-flutter-feature.md"
  "commands/implement-figma-screen.md"
  "commands/generate-flutter-tests.md"
  "commands/review-flutter-code.md"
  "commands/security-review.md"
  "commands/update-flutter-dependencies.md"
  "commands/resolve-flutter-build-error.md"
  "commands/prepare-mobile-release.md"
  "commands/integrate-firebase.md"
  "commands/migrate-flutter-code.md"
  "commands/scaffold-flutter-feature.md"
  "commands/setup-mobile-github-pipeline.md"
  "commands/sync-official-flutter-ai-rules.md"
  "commands/write-widget-test.md"
  "commands/write-bloc-test.md"
  "commands/write-e2e-test.md"
)

for cmd_file in "${canonical_commands[@]}"; do
  base="$(basename "${cmd_file}")"
  check "C-${base} has guardrails section" "rg -q '^Preconditions and guardrails:' '${cmd_file}'"
  check "C-${base} references prompt guardrails doc" "rg -q 'prompt-execution-guardrails\\.md' '${cmd_file}'"
  check "C-${base} references validation matrix" "rg -q 'validation-matrix\\.md' '${cmd_file}'"
done

for skill in skills/*/SKILL.md; do
  base="$(basename "$(dirname "${skill}")")"
  check "S-${base} has workflow" "rg -q '^## Workflow' '${skill}'"
  check "S-${base} has output contract" "rg -q '^## (Required output|Output format)' '${skill}'"
  check "S-${base} has guardrails or scope limits" "rg -q '^## (Guardrails|Scope guardrails|Quality defaults)' '${skill}'"
done

for agent in agents/*.md; do
  base="$(basename "${agent}")"
  check "A-${base} has output expectations" "rg -q '^## Output expectations' '${agent}'"
  check "A-${base} expects validation evidence" "rg -qi '(validation|commands and results|evidence)' '${agent}'"
done

check "Active Flutter rules are project-first for state management" "rg -q '\\* \\*\\*Project First:\\*\\* Follow the existing project architecture and state-management choice\\.' rules/flutter-official-ai-rules.mdc"
check "Active Flutter rules do not prohibit Riverpod/Bloc/GetX outright" "! rg -q 'Prohibited:\\*\\* NO Riverpod, Bloc, GetX unless explicitly requested\\.' rules/flutter-official-ai-rules.mdc"
check "Scaffold architecture skill enforces project-first state-management selection" "rg -q 'existing project state-management convention' skills/scaffold-flutter-architecture/SKILL.md"

total=$((pass_count + fail_count))
echo
echo "SUMMARY | total=${total} passed=${pass_count} failed=${fail_count}"

if [ "${fail_count}" -gt 0 ]; then
  exit 1
fi
