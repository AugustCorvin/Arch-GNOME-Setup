#!/usr/bin/env bash

packages=(
    yelp
    gnome-tour

    gnome-weather
    gnome-contacts
    gnome-maps
    gnome-characters
    gnome-font-viewer

    cheese
    evince
    malcontent
    simple-scan
)

for pkg in "${packages[@]}"; do
    if pacman -Qi "$pkg" >/dev/null 2>&1; then
        echo "Removing $pkg"
        if sudo pacman -Rns --noconfirm "$pkg"; then
            echo "$pkg removed"
        else
            echo "Failed to remove $pkg"
        fi
    else
        echo "$pkg not installed"
    fi
done
