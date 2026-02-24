#!/bin/bash
set -e

echo "========================================"
echo " System update"
echo "========================================"
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y
sudo apt clean -y

echo "========================================"
echo " Installing curl"
echo "========================================"
sudo apt install -y curl

echo "========================================"
echo " Installing NVM"
echo "========================================"
curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Load nvm properly inside script
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

nvm install --lts
nvm use --lts

echo "Node version:"
node -v
echo "NPM version:"
npm -v

echo "========================================"
echo " Installing Snap"
echo "========================================"
sudo apt install -y snapd

echo "========================================"
echo " Installing VS Code"
echo "========================================"
sudo snap install code --classic

echo "========================================"
echo " Installing Git"
echo "========================================"
sudo apt install -y git
git --version

echo "========================================"
echo " Installing Microsoft Edge"
echo "========================================"

sudo install -d -m 0755 /etc/apt/keyrings

curl -fsSL https://packages.microsoft.com/keys/microsoft.asc \
 | sudo gpg --dearmor -o /etc/apt/keyrings/microsoft.gpg

sudo chmod a+r /etc/apt/keyrings/microsoft.gpg

echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/microsoft.gpg] \
https://packages.microsoft.com/repos/edge stable main" \
| sudo tee /etc/apt/sources.list.d/microsoft-edge.list

sudo apt update
sudo apt install -y microsoft-edge-stable

echo "========================================"
echo " Installation completed successfully 🎉"
echo "========================================"
