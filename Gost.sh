#!/bin/bash

# Directory where install.sh should reside
SCRIPT_DIR="/etc/gost"
SCRIPT_PATH="$SCRIPT_DIR/install.sh"

# Download install.sh only if it doesn't already exist
if [ ! -f "$SCRIPT_PATH" ]; then
    echo "Downloading install.sh..."
    temp_dir=$(mktemp -d)
    cd "$temp_dir" || exit
    wget https://github.com/masoudgb/Gost-ip6/raw/main/install.sh
    sudo mkdir -p "$SCRIPT_DIR"
    sudo mv install.sh "$SCRIPT_PATH"
    sudo chmod +x "$SCRIPT_PATH"
    rm -rf "$temp_dir"
else
    echo "install.sh found in $SCRIPT_DIR, skipping download."
fi

cd "$SCRIPT_DIR" || exit
sudo "$SCRIPT_PATH"
