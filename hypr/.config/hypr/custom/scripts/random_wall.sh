WALLPAPER_DIR="/mnt/d/me/wallpaper/"
DISPLAY="eDP-1"

# Kill any existing mpvpaper instance (so the new one takes over)
pkill -x mpvpaper

# Pick a random file from the folder
RANDOM_WALL=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

# Run mpvpaper with it
mpvpaper "$DISPLAY" -o "no-audio loop" "$RANDOM_WALL" &
