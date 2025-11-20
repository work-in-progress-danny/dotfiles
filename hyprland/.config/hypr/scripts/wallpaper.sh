WALLPAPER_DIR="$HOME/dotfiles/wallpapers"

IMAGE=$(find "$WALLPAPER_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' -o -iname '*.jpeg' \) | shuf -n 1)

if [ -n "$IMAGE" ]; then
    awww img "$IMAGE"
fi

