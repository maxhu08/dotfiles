#!/usr/bin/env bash
set -euo pipefail

# normal settings from hyprland.conf
NORMAL_BORDER=2
NORMAL_GAPS_IN=5
NORMAL_GAPS_OUT=10
NORMAL_ROUNDING=10

# read current border size
CURRENT_BORDER="$(
  hyprctl getoption general:border_size 2>/dev/null \
  | awk -F': ' 'NR==1{print $2}' \
  | awk '{print $1}'
)"

# fallback if parse fails
CURRENT_BORDER="${CURRENT_BORDER:-$NORMAL_BORDER}"

if [ "$CURRENT_BORDER" = "0" ]; then
  # restore normal
  hyprctl --quiet eval "hl.config({ general = { border_size = $NORMAL_BORDER, gaps_in = $NORMAL_GAPS_IN, gaps_out = $NORMAL_GAPS_OUT }, decoration = { rounding = $NORMAL_ROUNDING } })"
else
  # compact
  hyprctl --quiet eval "hl.config({ general = { border_size = 0, gaps_in = 0, gaps_out = 0 }, decoration = { rounding = 0 } })"
fi
