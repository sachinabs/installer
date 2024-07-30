sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y
sudo apt autoclean -y
sudo apt clean -y

echo ".................................................."
echo "Installing nvm ..."
echo ".................................................."

sudo apt install curl 
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash 
source ~/.profile   
nvm install node 
nvm install --lts

echo ".................................................."
echo "Installing Snap..."
echo ".................................................."

sudo apt install snapd -y

echo ".................................................."
echo "Installing Vs code..."
echo ".................................................."

sudo snap install code --classic

echo ".................................................."
echo "Installing Git..."
echo ".................................................."

sudo apt install git -y

echo ".................................................."
git --version
echo ".................................................."
echo "Installing Edge Browser"
sudo apt update
sudo apt install wget apt-transport-https software-properties-common
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" | sudo tee /etc/apt/sources.list.d/microsoft-edge-dev.list
sudo apt update
sudo apt install microsoft-edge-stable
