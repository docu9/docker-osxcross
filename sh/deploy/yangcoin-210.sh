#!/bin/sh
coin=yangcoin
version=0.14.5
src_file=../../deploy/${coin}-${version}.tar.gz
target_host=user@192.168.0.210
pm2_svc="yang1 yang2"
# echo "PATH=$PATH:/home/user/.nvm/versions/node/v6.12.0/bin &&pm2 stop ${pm2_svc}"
ssh ${target_host} "PATH=$PATH:/home/user/.nvm/versions/node/v6.12.0/bin &&pm2 stop ${pm2_svc}"

scp ${src_file} ${target_host}:~/
ssh 192.168.0.210 "PATH=$PATH:/home/user/.nvm/versions/node/v6.12.0/bin &&pm2 start ${pm2_svc}"
