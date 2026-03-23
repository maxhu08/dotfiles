#!/usr/bin/env bash
set -euo pipefail

if pgrep -x waybar >/dev/null 2>&1; then
  killall waybar
else
  waybar >/dev/null 2>&1 &
fi
