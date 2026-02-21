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

# Agents (4)
check "A1 flutter-app-builder output expectations" "rg -q '^## Output expectations' agents/flutter-app-builder.md"
check "A2 flutter-test-writer output expectations" "rg -q '^## Output expectations' agents/flutter-test-writer.md"
check "A3 flutter-code-reviewer output expectations" "rg -q '^## Output expectations' agents/flutter-code-reviewer.md"
check "A4 flutter-mobile-release-manager output expectations" "rg -q '^## Output expectations' agents/flutter-mobile-release-manager.md"

# Skills (11)
for skill in skills/*/SKILL.md; do
  base="$(basename "$(dirname "${skill}")")"
  check "S-${base} has workflow" "rg -q '^## Workflow' '${skill}'"
  check "S-${base} has output section" "rg -q '^## (Required output|Output format)' '${skill}'"
done

total=$((pass_count + fail_count))
echo
echo "SUMMARY | total=${total} passed=${pass_count} failed=${fail_count}"

if [ "${fail_count}" -gt 0 ]; then
  exit 1
fi
