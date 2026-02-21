#!/usr/bin/env python3

import argparse
import json
import re
from pathlib import Path


SEMVER_RE = re.compile(r"^(\d+)\.(\d+)\.(\d+)$")


def parse_semver(value: str) -> tuple[int, int, int]:
    match = SEMVER_RE.match(value)
    if not match:
        raise ValueError(f"Invalid semver: {value}")
    return int(match.group(1)), int(match.group(2)), int(match.group(3))


def bump_version(current: str, bump: str) -> str:
    major, minor, patch = parse_semver(current)
    if bump == "patch":
        patch += 1
    elif bump == "minor":
        minor += 1
        patch = 0
    elif bump == "major":
        major += 1
        minor = 0
        patch = 0
    else:
        raise ValueError(f"Unsupported bump type: {bump}")
    return f"{major}.{minor}.{patch}"


def load_json(path: Path) -> dict:
    return json.loads(path.read_text(encoding="utf-8"))


def save_json(path: Path, data: dict) -> None:
    path.write_text(json.dumps(data, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")


def update_manifest_versions(root_manifest: Path, canonical_manifest: Path, target_version: str) -> None:
    root_data = load_json(root_manifest)
    canonical_data = load_json(canonical_manifest)

    root_version = root_data.get("version")
    canonical_version = canonical_data.get("version")
    if root_version != canonical_version:
        raise ValueError(
            f"Manifest version mismatch: plugin.json={root_version}, .cursor-plugin/plugin.json={canonical_version}"
        )

    root_data["version"] = target_version
    canonical_data["version"] = target_version
    save_json(root_manifest, root_data)
    save_json(canonical_manifest, canonical_data)


def normalize_unreleased_block(content: str) -> tuple[str, str]:
    marker = "## Unreleased\n"
    start = content.find(marker)
    if start == -1:
        raise ValueError("CHANGELOG.md must contain '## Unreleased' section.")

    after = content[start + len(marker) :]
    next_header = after.find("\n## ")
    if next_header == -1:
        unreleased_body = after
        rest = ""
    else:
        unreleased_body = after[:next_header]
        rest = after[next_header + 1 :]

    body_stripped = unreleased_body.strip("\n")
    if not body_stripped.strip():
        raise ValueError("Unreleased section is empty. Add release notes before publishing.")

    return body_stripped + "\n", rest


def update_changelog(changelog_path: Path, version: str) -> str:
    content = changelog_path.read_text(encoding="utf-8")
    unreleased_body, rest = normalize_unreleased_block(content)

    if f"\n## {version}\n" in content:
        raise ValueError(f"CHANGELOG already contains section for {version}")

    rebuilt = (
        "# Changelog\n\n"
        "## Unreleased\n\n"
        f"## {version}\n\n"
        f"{unreleased_body}\n"
        f"{rest}"
    )
    changelog_path.write_text(rebuilt, encoding="utf-8")
    return unreleased_body


def main() -> None:
    parser = argparse.ArgumentParser(description="Prepare release files for flutter-cursor-plugin.")
    parser.add_argument("--version", help="Target release version (e.g., 1.10.0).")
    parser.add_argument(
        "--bump",
        choices=["patch", "minor", "major"],
        help="Optional semver bump from current version when --version is not set.",
    )
    parser.add_argument("--repo-root", default=".", help="Repository root path.")
    args = parser.parse_args()

    repo_root = Path(args.repo_root).resolve()
    root_manifest = repo_root / "plugin.json"
    canonical_manifest = repo_root / ".cursor-plugin" / "plugin.json"
    changelog = repo_root / "CHANGELOG.md"
    notes_file = repo_root / "RELEASE_NOTES.md"
    version_file = repo_root / ".release-version"

    root_data = load_json(root_manifest)
    canonical_data = load_json(canonical_manifest)
    current_version = root_data.get("version")
    if current_version != canonical_data.get("version"):
        raise ValueError("Manifest versions must match before release automation.")
    parse_semver(current_version)

    if args.version:
        target_version = args.version
        parse_semver(target_version)
    elif args.bump:
        target_version = bump_version(current_version, args.bump)
    else:
        target_version = current_version

    update_manifest_versions(root_manifest, canonical_manifest, target_version)
    release_notes = update_changelog(changelog, target_version)

    notes_file.write_text(release_notes, encoding="utf-8")
    version_file.write_text(target_version + "\n", encoding="utf-8")
    print(f"Prepared release {target_version}")


if __name__ == "__main__":
    main()
