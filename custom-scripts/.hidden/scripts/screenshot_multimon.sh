#!/bin/bash

screenshots_dir="$HOME/Pictures/screenshots"

mkdir -p "$screenshots_dir"

filename="$screenshots_dir/SS$(date +%Y-%m-%d_%H-%M-%S).png"

# make sure to check monitor with `xrandr --listmonitors`
scrot -e "xclip -selection clipboard -t image/png -i $filename" --monitor "1" "$filename"
