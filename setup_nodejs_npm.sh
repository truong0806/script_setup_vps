#!/bin/bash

# Step 1: Update and install necessary dependencies
echo "Updating package lists and installing necessary dependencies..."
sudo apt-get update
sudo apt-get install -y curl build-essential libssl-dev

# Step 2: Install nvm (Node Version Manager)
echo "Installing nvm (Node Version Manager)..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash

# Step 3: Load nvm into the current shell session
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Step 4: Install the latest version of Node.js
echo "Installing the latest version of Node.js..."
nvm install node

# Step 5: Verify installation
echo "Verifying Node.js and npm installation..."
node_version=$(node -v)
npm_version=$(npm -v)

echo "Node.js version: $node_version"
echo "npm version: $npm_version"

# Step 6: Set the installed version as default
nvm alias default node

echo "Setup complete. Node.js and npm have been installed successfully."
