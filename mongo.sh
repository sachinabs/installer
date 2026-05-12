#!/bin/bash

echo "========================================"
echo "Installing MongoDB 8 + Creating Admin User"
echo "========================================"

# CONFIG
MONGO_USER="imgod"
MONGO_PASS="X7mP2qL9vN4kT8sR"

# Remove old MongoDB repo
sudo rm -f /etc/apt/sources.list.d/mongodb-org-8.0.list

# Remove old key
sudo rm -f /usr/share/keyrings/mongodb-server-8.0.gpg

# Install dependencies
sudo apt update -y
sudo apt install -y curl gnupg

# Import MongoDB GPG key
curl -fsSL https://pgp.mongodb.com/server-8.0.asc | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/mongodb-server-8.0.gpg > /dev/null

# Force Ubuntu noble repo
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-8.0.gpg ] https://repo.mongodb.org/apt/ubuntu noble/mongodb-org/8.0 multiverse" | \
sudo tee /etc/apt/sources.list.d/mongodb-org-8.0.list

# Update packages
sudo apt update -y

# Install MongoDB
sudo apt install -y mongodb-org

# Reload systemd
sudo systemctl daemon-reload

# Start MongoDB
sudo systemctl start mongod
sudo systemctl enable mongod

# Wait for MongoDB
sleep 5

# Create admin user
mongosh --eval "
use admin
db.createUser({
  user: '$MONGO_USER',
  pwd: '$MONGO_PASS',
  roles: [{ role: 'root', db: 'admin' }]
})
"

# Enable authentication
sudo sed -i '/#security:/c\security:' /etc/mongod.conf

# Add authorization if not exists
grep -q "authorization:" /etc/mongod.conf || \
sudo sed -i '/security:/a\  authorization: enabled' /etc/mongod.conf

# Restart MongoDB
sudo systemctl restart mongod

echo ""
echo "========================================"
echo "MongoDB Installed Successfully"
echo "========================================"

echo ""
echo "USERNAME: $MONGO_USER"
echo "PASSWORD: $MONGO_PASS"

echo ""
echo "Connection Command:"
echo "mongosh -u $MONGO_USER -p --authenticationDatabase admin"
