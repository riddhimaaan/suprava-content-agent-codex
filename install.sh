#!/bin/bash
# Install suprava-content-agent for ChatGPT Codex

set -euo pipefail

PLUGIN_NAME="suprava-content-agent"
SOURCE_ROOT="$(cd "$(dirname "$0")" && pwd)"
SOURCE_MANIFEST="$SOURCE_ROOT/.codex-plugin/plugin.json"
SOURCE_SKILLS="$SOURCE_ROOT/skills"
PLUGINS_ROOT="$HOME/plugins"
TARGET_ROOT="$PLUGINS_ROOT/$PLUGIN_NAME"
TARGET_MEMORY="$TARGET_ROOT/skills/suprava-content-agent/memory"
MARKETPLACE_DIR="$HOME/.agents/plugins"
MARKETPLACE_PATH="$MARKETPLACE_DIR/marketplace.json"
BACKUP_ROOT="$(mktemp -d)"
BACKUP_MEMORY="$BACKUP_ROOT/memory"

if [ ! -f "$SOURCE_MANIFEST" ]; then
  echo "Error: .codex-plugin/plugin.json not found. Run this script from the plugin root."
  exit 1
fi

if [ ! -d "$SOURCE_SKILLS" ]; then
  echo "Error: skills/ not found. Run this script from the plugin root."
  exit 1
fi

echo "Installing $PLUGIN_NAME into ChatGPT Codex..."

if [ -d "$TARGET_MEMORY" ]; then
  mkdir -p "$BACKUP_MEMORY"
  cp -R "$TARGET_MEMORY/." "$BACKUP_MEMORY/"
fi

mkdir -p "$TARGET_ROOT"
cp -R "$SOURCE_ROOT/.codex-plugin" "$TARGET_ROOT/"
cp -R "$SOURCE_SKILLS" "$TARGET_ROOT/"

for file_name in README.md LICENSE; do
  if [ -f "$SOURCE_ROOT/$file_name" ]; then
    cp "$SOURCE_ROOT/$file_name" "$TARGET_ROOT/"
  fi
done

if [ -d "$BACKUP_MEMORY" ]; then
  mkdir -p "$TARGET_MEMORY"
  cp -R "$BACKUP_MEMORY/." "$TARGET_MEMORY/"
fi

mkdir -p "$MARKETPLACE_DIR"

python3 - "$MARKETPLACE_PATH" "$PLUGIN_NAME" <<'PY'
import json
import pathlib
import sys

marketplace_path = pathlib.Path(sys.argv[1])
plugin_name = sys.argv[2]

if marketplace_path.exists():
    marketplace = json.loads(marketplace_path.read_text(encoding="utf-8"))
else:
    marketplace = {
        "name": "personal",
        "interface": {"displayName": "Personal"},
        "plugins": [],
    }

plugins = marketplace.get("plugins") or []
entry = {
    "name": plugin_name,
    "source": {"source": "local", "path": f"./plugins/{plugin_name}"},
    "policy": {"installation": "AVAILABLE", "authentication": "ON_INSTALL"},
    "category": "Writing",
}

updated_plugins = []
replaced = False

for plugin in plugins:
    if plugin.get("name") == plugin_name:
        updated_plugins.append(entry)
        replaced = True
    else:
        updated_plugins.append(plugin)

if not replaced:
    updated_plugins.append(entry)

marketplace["plugins"] = updated_plugins
marketplace_path.write_text(json.dumps(marketplace, indent=2) + "\n", encoding="utf-8")
PY

rm -rf "$BACKUP_ROOT"

echo
echo "Installed plugin root:"
echo "  $TARGET_ROOT"
echo
echo "Updated personal marketplace:"
echo "  $MARKETPLACE_PATH"
echo
echo "Restart ChatGPT Codex, then open Plugins and install 'Suprava Content Agent' from your Personal marketplace."
