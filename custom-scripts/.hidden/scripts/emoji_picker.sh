#!/bin/bash

# Define the path to the emoji list
EMOJI_LIST=~/.hidden/scripts/emoji_list.txt

# Get the selected emoji from dmenu with right flags
selection=$(cat "$EMOJI_LIST" | dmenu -i -nb "#0a0a0a" -nf "#cdd6f4" -sb "#99f6e4" -sf "#0a0a0a" -l 30)
# selection=$(cat "$EMOJI_LIST" | dmenu -b -l 30)

# Extract the emoji character, remove the trailing newline, and copy to clipboard
echo "$selection" | awk '{print $1}' | tr -d '\n' | xclip -selection clipboard

# Send a notification with the selected emoji
# notify-send "$selection"
