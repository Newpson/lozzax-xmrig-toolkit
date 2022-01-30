#!/bin/sh
INST_DIR=/opt/lozzax-xmrig

esudo="sudo"
if [ ! -f /usr/bin/sudo ]
then
	esudo=""
	if [ ! $(whoami) = "root" ]
	then
		echo You need to be root to execute this script or \'sudo\' must be installed.
		exit -1
	fi
fi

address=$(cat $INST_DIR/address)
worker=$(cat /etc/hostname)
tc=$(nproc)
echo "" > $INST_DIR/log

$INST_DIR/xmrig -a rx/lozz -o randomx.rplant.xyz:17089 -u $address.$worker --tls -t $tc -l $INST_DIR/log

