#!/bin/bash

screenshots_dir="$HOME/Pictures/screenshots"

mkdir -p "$screenshots_dir"

filename="$screenshots_dir/SS$(date +%Y-%m-%d_%H-%M-%S).png"

# Take a screenshot with Flameshot and save it to the filename
flameshot gui -p "$filename"

# Copy the screenshot to clipboard
xclip -selection clipboard -t image/png -i "$filename"

