# Command Namespacing

This plugin keeps canonical command names and provides namespaced aliases to reduce marketplace conflicts.

## Naming model

- Canonical command: `implement-flutter-feature`
- Namespaced alias: `flutter:implement-flutter-feature`

Both forms are supported and route to the same workflow.

## Alias generation

To regenerate aliases for all canonical commands:

```bash
scripts/generate_namespaced_command_aliases.py
```

This creates `commands/flutter-*.md` alias files for every canonical command.
