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



