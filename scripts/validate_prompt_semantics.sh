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
  "commands/integrate-mobile-api.md"
  "commands/integrate-firebase.md"
  "commands/migrate-flutter-code.md"
  "commands/scaffold-flutter-feature.md"
  "commands/setup-mobile-github-pipeline.md"
  "commands/setup-flutter-environment.md"
  "commands/sync-official-flutter-ai-rules.md"
  "commands/write-widget-test.md"
  "commands/write-bloc-test.md"
  "commands/write-e2e-test.md"
)

for cmd_file in "${canonical_commands[@]}"; do
  base="$(basename "${cmd_file}")"
  check "C-${base} has command name frontmatter" "rg -q '^name:\\s*' '${cmd_file}'"
  check "C-${base} has command description frontmatter" "rg -q '^description:\\s*' '${cmd_file}'"
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

check "Priority policy rule exists and is alwaysApply" "rg -q '^alwaysApply: true$' rules/flutter-plugin-policy-priority.mdc"
check "Priority policy enforces project-first state management" "rg -q 'Project First: follow the existing project architecture and state-management choice\\.' rules/flutter-plugin-policy-priority.mdc"
check "Priority policy allows Bloc/Riverpod style choices by project context" "rg -q 'Riverpod, Bloc, Cubit, GetX, and ValueNotifier are all allowed when justified by project context\\.' rules/flutter-plugin-policy-priority.mdc"
check "Sync script does not patch official state-management text" "! rg -q 'Prohibited:\\*\\* NO Riverpod, Bloc, GetX unless explicitly requested\\.' scripts/sync_official_flutter_ai_rules.sh"
check "Scaffold architecture skill enforces project-first state-management selection" "rg -q 'existing project state-management convention' skills/scaffold-flutter-architecture/SKILL.md"

total=$((pass_count + fail_count))
echo
echo "SUMMARY | total=${total} passed=${pass_count} failed=${fail_count}"

if [ "${fail_count}" -gt 0 ]; then
  exit 1
fi
