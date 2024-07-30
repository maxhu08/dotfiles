#!/bin/bash

screenshots_dir="$HOME/Pictures/screenshots"

mkdir -p "$screenshots_dir"

filename="$screenshots_dir/SS$(date +%Y-%m-%d_%H-%M-%S).png"

# for single-monitor setup
scrot -e "xclip -selection clipboard -t image/png -i $filename" "$filename"
