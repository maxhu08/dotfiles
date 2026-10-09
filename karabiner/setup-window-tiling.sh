#!/bin/sh
set -eu

tiling_menu_prefix=$(printf '\033Window\033Move & Resize\033')
/usr/bin/defaults write -g NSUserKeyEquivalents -dict-add "${tiling_menu_prefix}Left" '@~^$←'
/usr/bin/defaults write -g NSUserKeyEquivalents -dict-add "${tiling_menu_prefix}Right" '@~^$→'

printf '%s\n' 'Window tiling shortcuts configured. Reopen already-running apps if needed.'
