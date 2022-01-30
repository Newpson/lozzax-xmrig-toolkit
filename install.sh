#!/bin/sh

INST_DIR=/opt/lozzax-xmrig
LATEST=$(curl --silent "https://api.github.com/repos/lozzax-project/xmrig/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
set -e
wget https://github.com/lozzax-project/xmrig/releases/download/$LATEST/lozzax-xmrig.tar.gz
tar xf lozzax-xmrig.tar.gz --strip-components 1
rm -v lozzax-xmrig.tar.gz

mkdir -pv $INST_DIR
cp -v xmrig miner.sh address $INST_DIR
read -p "Enter your wallet address: " addr
echo $addr > $INST_DIR/address
cp -v xmrig-lozzax.service /etc/systemd/system
systemctl enable xmrig-lozzax.service --now

echo Installed successfully.
