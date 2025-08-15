#!/bin/bash

LOGFILE=~/mpvpaper.log
while [[ -z "$(hyprctl monitors | grep 'Monitor ')" ]]; do
	echo "Waiting for monitors to become active..."
	sleep 1
done

hyprshade on vibrancy
mpvpaper "eDP-1" "/mnt/d/wallpapers/honda-nsx-na1.1920x1080.mp4" &>$LOGFILE &

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
sleep 1
hyprctl dispatch workspace 4
telegram-desktop &
