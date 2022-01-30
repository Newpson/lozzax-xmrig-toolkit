#!/bin/sh

INST_DIR=/opt/lozzax-xmrig
set -e

killall xmrig
rm -r $INST_DIR
systemctl disable xmrig-lozzax.service
rm /etc/systemd/system/xmrig-lozzax.service

echo Success!
