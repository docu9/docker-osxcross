#!/bin/sh
coin=qcity
user=user
host=192.168.0.210
version=0.14.5
node=v6.11.4
cd ~/src/${coin}/${coin}
git pull
pwd
make -j4
./pack.sh
ssh ${user}@${host}  "PATH=$PATH:/home/${user}/.nvm/versions/node/${node}/bin &&pm2 stop ${coin}d"
scp ./tmp/${coin}**/bin/* ${user}@${host}:~/${coin}/
ssh ${user}@${host} "PATH=$PATH:/home/${user}/.nvm/versions/node/${node}/bin &&pm2 start ${coin}d"
