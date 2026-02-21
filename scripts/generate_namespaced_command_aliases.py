#!/usr/bin/env python3

import re
from pathlib import Path


FRONTMATTER_RE = re.compile(r"^---\n(.*?)\n---\n", re.DOTALL)


def extract_description(content: str) -> str:
    match = FRONTMATTER_RE.search(content)
    if not match:
        return "Namespaced alias command."
    frontmatter = match.group(1)
    for line in frontmatter.splitlines():
        if line.strip().startswith("description:"):
            return line.split(":", 1)[1].strip()
    return "Namespaced alias command."


def main() -> None:
    repo_root = Path(__file__).resolve().parents[1]
    commands_dir = repo_root / "commands"
    for cmd_file in sorted(commands_dir.glob("*.md")):
        stem = cmd_file.stem
        if stem.startswith("flutter-"):
            continue

        alias_file = commands_dir / f"flutter-{stem}.md"
        if alias_file.exists():
            continue

        content = cmd_file.read_text(encoding="utf-8")
        description = extract_description(content)
        alias_content = (
            "---\n"
            f"name: flutter:{stem}\n"
            f"description: Alias for `{stem}`. {description}\n"
            "---\n\n"
            f"Namespaced alias for `{stem}`.\n\n"
            "1. Run the canonical command with the same intent.\n"
            f"2. Follow `./{stem}.md`.\n"
            "3. Keep output and checks identical to the canonical command.\n"
        )
        alias_file.write_text(alias_content, encoding="utf-8")
        print(f"Created {alias_file.relative_to(repo_root)}")


if __name__ == "__main__":
    main()
