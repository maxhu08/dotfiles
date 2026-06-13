#!/usr/bin/env bash
set -euo pipefail

CURRENT_ENABLED="$(hyprctl getoption animations:enabled 2>/dev/null || true)"

if [[ "$CURRENT_ENABLED" == *"bool: true"* ]]; then
  hyprctl --quiet eval "hl.config({ animations = { enabled = false } })"
else
  hyprctl --quiet eval "hl.config({ animations = { enabled = true } })"
fi
