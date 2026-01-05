#!/usr/bin/env bash
set -euo pipefail

NIGHT_TEMP=3500
DAY_TEMP=6500

running() {
  pgrep -x wlsunset >/dev/null 2>&1
}

start() {
  running && exit 0
  wlsunset -t "$NIGHT_TEMP" -T "$DAY_TEMP" >/dev/null 2>&1 &
}

stop() {
  pkill -x wlsunset >/dev/null 2>&1 || true
}

case "${1:-status}" in
  toggle)
    running && stop || start
    ;;
  status)
    if running; then
      echo " "
    else
      echo "󰖨 ️"
    fi
    ;;
  *)
    exit 1
    ;;
esac
