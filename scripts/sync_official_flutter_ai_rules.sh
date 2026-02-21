#!/usr/bin/env bash

set -euo pipefail

profile="${1:-4k}"

case "${profile}" in
  10k|4k|1k) ;;
  *)
    echo "Usage: $0 [10k|4k|1k]" >&2
    exit 1
    ;;
esac

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
out_dir="${repo_root}/rules/official"
mkdir -p "${out_dir}"

url_10k="https://raw.githubusercontent.com/flutter/flutter/main/docs/rules/rules_10k.md"
url_4k="https://raw.githubusercontent.com/flutter/flutter/main/docs/rules/rules_4k.md"
url_1k="https://raw.githubusercontent.com/flutter/flutter/main/docs/rules/rules_1k.md"

download_rule() {
  local source_url="$1"
  local target_file="$2"
  local profile_name="$3"

  local tmp_file
  tmp_file="$(mktemp)"

  curl -fsSL "${source_url}" -o "${tmp_file}"

  {
    echo "---"
    echo "description: Official Flutter AI rules profile (${profile_name}) synced from flutter/flutter."
    echo "alwaysApply: false"
    echo "globs: [\"lib/**/*.dart\", \"test/**/*.dart\", \"**/*.dart\"]"
    echo "---"
    echo
    echo "<!--"
    echo "Synced from official Flutter AI rules."
    echo "Source: ${source_url}"
    echo "Profile: ${profile_name}"
    echo "Do not edit manually; run scripts/sync_official_flutter_ai_rules.sh."
    echo "-->"
    echo
    cat "${tmp_file}"
  } > "${target_file}"

  rm -f "${tmp_file}"
}

download_rule "${url_10k}" "${out_dir}/flutter-ai-rules-10k.mdc" "10k"
download_rule "${url_4k}" "${out_dir}/flutter-ai-rules-4k.mdc" "4k"
download_rule "${url_1k}" "${out_dir}/flutter-ai-rules-1k.mdc" "1k"

cp "${out_dir}/flutter-ai-rules-${profile}.mdc" "${repo_root}/rules/flutter-official-ai-rules.mdc"

echo "Synced official Flutter AI rules."
echo "Selected active profile: ${profile}"
echo "Active rule: rules/flutter-official-ai-rules.mdc"
