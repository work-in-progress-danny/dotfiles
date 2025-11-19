#!/usr/bin/env sh

# Lock file to prevent multiple instances
lockFile="/tmp/wallpaper_lock_$(id -u).lock"
[ -e "$lockFile" ] && echo "An instance is already running..." && exit 1
touch "$lockFile"
trap 'rm -f "$lockFile"' EXIT

# Directory containing wallpapers
WALLPAPER_DIR="$HOME/dotfiles/wallpapers"

# Pick a random image
IMAGE=$(find "$WALLPAPER_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' -o -iname '*.jpeg' \) | shuf -n 1)

# Set the wallpaper with swww, stretching to fit the screen
if [ -n "$IMAGE" ]; then
    swww img "$IMAGE" --resize stretch
else
    echo "No wallpapers found in $WALLPAPER_DIR"
fi

