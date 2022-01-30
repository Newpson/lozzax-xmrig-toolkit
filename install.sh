#!/bin/sh

INST_DIR=/opt/lozzax-xmrig
set -e

mkdir -pv $INST_DIR
cp -v xmrig miner.sh address $INST_DIR
read -p "Enter your wallet address: " addr
echo $addr > $INST_DIR/address
cp -v xmrig-lozzax.service /etc/systemd/system
systemctl enable xmrig-lozzax.service --now

echo Installed successfully.
