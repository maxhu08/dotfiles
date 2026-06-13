#!/usr/bin/env bash
set -euo pipefail

mode="${1:-status}"
slot="${2:?workspace slot required}"

monitor_name() {
  if [[ -n "${WAYBAR_OUTPUT_NAME:-}" ]]; then
    printf '%s\n' "$WAYBAR_OUTPUT_NAME"
    return
  fi

  hyprctl monitors -j | jq -r '.[] | select(.focused) | .name'
}

workspace_id() {
  local monitor="$1"
  local base=0

  case "$monitor" in
    DP-1) base=0 ;;
    DP-2) base=10 ;;
    DP-3) base=20 ;;
  esac

  printf '%d\n' $((base + slot))
}

monitor="$(monitor_name)"
target="$(workspace_id "$monitor")"

if [[ "$mode" == "click" ]]; then
  hyprctl dispatch "hl.dsp.focus({ workspace = \"$target\" })" >/dev/null
  exit 0
fi

monitors_json="$(hyprctl monitors -j)"
workspaces_json="$(hyprctl workspaces -j)"

active_on_monitor="$(jq -r --arg monitor "$monitor" '.[] | select(.name == $monitor) | .activeWorkspace.id' <<<"$monitors_json")"
is_visible="$(jq -r --argjson target "$target" 'any(.[]; .activeWorkspace.id == $target)' <<<"$monitors_json")"
is_occupied="$(jq -r --argjson target "$target" 'any(.[]; .id == $target)' <<<"$workspaces_json")"

classes=(workspace)
if [[ "$active_on_monitor" == "$target" ]]; then
  classes+=(active)
elif [[ "$is_visible" == "true" ]]; then
  classes+=(visible)
elif [[ "$is_occupied" == "true" ]]; then
  classes+=(occupied)
else
  classes+=(empty)
fi

jq -cn \
  --arg text "$slot" \
  --arg tooltip "Workspace $target" \
  --argjson class "$(printf '%s\n' "${classes[@]}" | jq -R . | jq -s .)" \
  '{text: $text, tooltip: $tooltip, class: $class}'
