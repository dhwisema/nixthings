#!/usr/bin/env bash

# Define the repository URL and the destination directory
REPO_URL="git@github.com:dhwisema/nixthings.git"
CLONE_DIR="/home/howard/Documents/nix_things"

# Clone the repository
echo "Cloning the repository from $REPO_URL..."
git clone $REPO_URL $CLONE_DIR

# Check if the cloning was successful
if [ $? -ne 0 ]; then
    echo "Failed to clone the repository."
    exit 1
fi
echo "Repository cloned successfully!"

# Prompt the user to specify the host subdirectory
read -p "Enter the host subdirectory to use for symlinking (e.g., laptop, server): " HOST_SUBDIR

# Full path to the selected host subdirectory
HOST_PATH="$CLONE_DIR/$HOST_SUBDIR"

# Check if the host directory exists
if [ ! -d "$HOST_PATH" ]; then
    echo "Error: The directory $HOST_PATH does not exist."
    exit 1
fi

# Remove existing files in /etc/nixos/
echo "Removing existing files in /etc/nixos/..."
sudo rm -rf /etc/nixos/*

# Symlink files from the selected host directory to /etc/nixos/
echo "Creating symbolic links from $HOST_PATH to /etc/nixos/..."
sudo ln -s $HOST_PATH/* /etc/nixos/

# Check if symlinking was successful
if [ $? -eq 0 ]; then
    echo "Symbolic links created successfully!"
else
    echo "Failed to create symbolic links."
    exit 1
fi
