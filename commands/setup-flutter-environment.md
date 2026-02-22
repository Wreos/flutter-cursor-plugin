---
name: setup-flutter-environment
description: Prepare and verify Flutter development environment (SDK, doctor, MCP, and baseline repo checks).
---

Set up and validate Flutter environment before development work.

1. Follow `../skills/setup-flutter-environment/SKILL.md`.
2. Capture `flutter --version`, `dart --version`, and `flutter doctor -v`.
3. Verify Dart MCP availability with `dart mcp-server --help`.
4. Run repository baseline validations after setup changes.

Preconditions and guardrails:
- Enforce `../docs/prompt-execution-guardrails.md` before execution.
- Validate outcomes using `../docs/validation-matrix.md`.
