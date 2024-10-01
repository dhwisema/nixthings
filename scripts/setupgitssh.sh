#!/usr/bin/env bash

# Generate SSH key
echo "Generating SSH key..."
ssh-keygen -t ed25519 -C "dhwisema@ncsu.edu"

# Start the SSH agent
echo "Starting SSH agent..."
eval "$(ssh-agent -s)"

# Add the SSH private key
echo "Adding SSH key to the agent..."
ssh-add ~/.ssh/id_ed25519

# Output the public key for manual copying
echo "Here is your SSH public key:"
cat ~/.ssh/id_ed25519.pub
echo
echo "Please copy the above public key and add it to your GitHub account."

# Wait for user to confirm they have copied the key
read -p "Press Enter to continue after copying the key..."

# Open Firefox and navigate to GitHub
echo "Opening Firefox and navigating to GitHub..."
firefox https://github.com

echo "All done!"
