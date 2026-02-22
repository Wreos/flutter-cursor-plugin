# Enable Plugin Before Marketplace Release

Use this guide while the plugin is not yet published in Cursor Marketplace.

## Option A: Install from repository in Cursor

1. Open Cursor command/chat input.
2. Run `/add-plugin`.
3. Provide repository URL:
   - `https://github.com/Wreos/flutter-cursor-plugin`
4. Confirm installation and enable the plugin.

Notes:
- Exact UI prompts can differ by Cursor version.
- If your build does not support repository install in `/add-plugin`, use Option B.

## Option B: Enable manually in workspace settings

1. Ensure the plugin is available to Cursor in your environment.
2. Open or create `.cursor/settings.json` in your project.
3. Add plugin enable flag:

```json
{
  "plugins": {
    "flutter-cursor-plugin": {
      "enabled": true
    }
  }
}
```

4. Reload Cursor window.
5. Verify plugin commands are available (for example `implement-flutter-feature`).
