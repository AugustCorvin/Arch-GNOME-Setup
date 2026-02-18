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

removed=()
not_installed=()

for pkg in "${packages[@]}"; do
    if pacman -Qi "$pkg" >/dev/null 2>&1; then
        sudo pacman -Rns --noconfirm "$pkg" >/dev/null 2>&1
        removed+=("$pkg")
    else
        not_installed+=("$pkg")
    fi
done

for i in {1..10}; do
    echo
done

echo "===== Removal Summary ====="
if [ ${#removed[@]} -gt 0 ]; then
    echo "Removed packages:"
    for pkg in "${removed[@]}"; do
        echo " - $pkg"
    done
else
    echo "No packages were removed."
fi

if [ ${#not_installed[@]} -gt 0 ]; then
    echo "Packages not installed / already absent:"
    for pkg in "${not_installed[@]}"; do
        echo " - $pkg"
    done
fi
