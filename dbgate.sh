wget https://github.com/dbgate/dbgate/releases/latest/download/dbgate-latest.deb

sudo apt install ./dbgate-latest.deb
# sandbox issue
sudo chown root:root /opt/DbGate/chrome-sandbox
sudo chmod 4755 /opt/DbGate/chrome-sandbox