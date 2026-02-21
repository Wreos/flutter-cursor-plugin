#!/usr/bin/env bash

set -euo pipefail

base_ref="${GITHUB_BASE_REF:-main}"
diff_range="origin/${base_ref}...HEAD"

git fetch --no-tags --prune --depth=1 origin "${base_ref}"

api_name_status="$(git diff --name-status "${diff_range}" -- commands skills agents rules || true)"
if [[ -z "${api_name_status}" ]]; then
  echo "No API surface changes in commands/skills/agents/rules."
  exit 0
fi

echo "Detected API surface changes:"
echo "${api_name_status}"

if [[ ! -f plugin.json ]] || [[ ! -f .cursor-plugin/plugin.json ]]; then
  echo "plugin.json and .cursor-plugin/plugin.json must exist."
  exit 1
fi

if ! command -v jq >/dev/null 2>&1; then
  echo "jq is required for version parsing."
  exit 1
fi

base_root_version="$(git show "origin/${base_ref}:plugin.json" | jq -r '.version')"
head_root_version="$(jq -r '.version' plugin.json)"
base_canonical_version="$(git show "origin/${base_ref}:.cursor-plugin/plugin.json" | jq -r '.version')"
head_canonical_version="$(jq -r '.version' .cursor-plugin/plugin.json)"

if [[ "${head_root_version}" != "${head_canonical_version}" ]]; then
  echo "Version mismatch: plugin.json=${head_root_version}, .cursor-plugin/plugin.json=${head_canonical_version}"
  exit 1
fi

if [[ "${head_root_version}" == "${base_root_version}" && "${head_canonical_version}" == "${base_canonical_version}" ]]; then
  echo "API surface changed but manifest version was not bumped."
  exit 1
fi

if ! git diff --name-only "${diff_range}" | rg -q '^CHANGELOG\.md$'; then
  echo "API surface changed but CHANGELOG.md was not updated."
  exit 1
fi

breaking_change=false
if echo "${api_name_status}" | rg -q '^(D|R[0-9]*)\s'; then
  breaking_change=true
fi

override_breaking=false
if [[ -n "${GITHUB_EVENT_PATH:-}" ]] && [[ -f "${GITHUB_EVENT_PATH}" ]]; then
  if jq -e '.pull_request.labels[]?.name | select(. == "override-breaking")' "${GITHUB_EVENT_PATH}" >/dev/null; then
    override_breaking=true
  fi
fi

parse_major() {
  local version="$1"
  if [[ ! "${version}" =~ ^([0-9]+)\.([0-9]+)\.([0-9]+)$ ]]; then
    echo "Invalid semver: ${version}" >&2
    return 1
  fi
  echo "${BASH_REMATCH[1]}"
}

base_major="$(parse_major "${base_root_version}")"
head_major="$(parse_major "${head_root_version}")"

if [[ "${breaking_change}" == true ]]; then
  if [[ "${override_breaking}" == true ]]; then
    echo "Breaking change detected, override-breaking label present. Skipping major bump requirement."
    exit 0
  fi

  if (( head_major <= base_major )); then
    echo "Breaking API change detected (delete/rename) but major version was not bumped (${base_root_version} -> ${head_root_version})."
    exit 1
  fi

  if ! git diff -U0 "${diff_range}" -- CHANGELOG.md | rg -qi '^\+.*breaking'; then
    echo "Breaking API change detected; add a CHANGELOG line that includes the word 'breaking'."
    exit 1
  fi
fi

echo "API stability guard passed (${base_root_version} -> ${head_root_version})."
