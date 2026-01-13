#!/usr/bin/env bash
set -u

NIGHT_TEMP=3500
DAY_TEMP=6500

have() { command -v "$1" >/dev/null 2>&1; }

ensure_running() {
  if have systemctl && systemctl --user list-unit-files hyprsunset.service >/dev/null 2>&1; then
    systemctl --user start hyprsunset.service >/dev/null 2>&1 || true
    return 0
  fi

  if ! pgrep -x hyprsunset >/dev/null 2>&1; then
    hyprsunset >/dev/null 2>&1 &
    disown 2>/dev/null || true
  fi
}

get_temp() {
  local out num
  out="$(hyprctl hyprsunset temperature 2>/dev/null || true)"
  num="$(printf '%s' "$out" | grep -oE '[0-9]+' | head -n1 || true)"
  if [[ -n "${num:-}" ]]; then
    printf '%s\n' "$num"
  else
    printf '%s\n' "$DAY_TEMP"
  fi
}

set_temp() {
  local t="$1"
  hyprctl hyprsunset temperature "$t" >/dev/null 2>&1 || true
}

toggle() {
  if ! have hyprctl; then
    exit 0
  fi

  ensure_running

  local cur
  cur="$(get_temp)"

  if [[ "$cur" -le $((DAY_TEMP - 1)) ]]; then
    set_temp "$DAY_TEMP"
  else
    set_temp "$NIGHT_TEMP"
  fi
}

status() {
  local icon tooltip cur

  icon="󰖨 "
  tooltip="Night Mode Off"

  if ! have hyprctl; then
    printf '{"text":"%s","tooltip":"%s"}\n' "$icon" "$tooltip"
    exit 0
  fi

  if ! pgrep -x hyprsunset >/dev/null 2>&1; then
    printf '{"text":"%s","tooltip":"%s"}\n' "$icon" "$tooltip"
    exit 0
  fi

  cur="$(get_temp)"

  if [[ "$cur" -le $((DAY_TEMP - 1)) ]]; then
    icon=" "
    tooltip="Night Mode On"
  fi

  printf '{"text":"%s","tooltip":"%s"}\n' "$icon" "$tooltip"
}

case "${1:-status}" in
  toggle) toggle ;;
  status) status ;;
  *) exit 1 ;;
esac

