#!/bin/bash

LOGFILE=~/mpvpaper.log
while [[ -z "$(hyprctl monitors | grep 'Monitor ')" ]]; do
	echo "Waiting for monitors to become active..."
	sleep 1
done

hyprshade on vibrancy

WALLPAPER_DIR="/mnt/d/me/wallpaper/"
DISPLAY="eDP-1"

# Kill any existing mpvpaper instance (so the new one takes over)
pkill -x mpvpaper

# Pick a random file from the folder
RANDOM_WALL=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

# Run mpvpaper with it
mpvpaper "$DISPLAY" -o "no-audio loop" "$RANDOM_WALL" &

# Launch Kitty in workspace 1
hyprctl dispatch workspace 1
kitty &

# Launch Zen-Browser in workspace 2
sleep 1 # Add a short delay to prevent race conditions
hyprctl dispatch workspace 2
flatpak run app.zen_browser.zen &

# Launch Yandex-Music in workspace 3
sleep 2
hyprctl dispatch workspace 3
yandex-music &

# Launch Telegram in workspace 4
sleep 2
hyprctl dispatch workspace 4
telegram-desktop &
