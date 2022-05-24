#!/bin/ash

apk add git openssh --no-cache
mkdir -p /root/.ssh
ssh-keyscan git >> /root/.ssh/known_hosts
ssh-keyscan github.com >> /root/.ssh/known_hosts

mkdir /gitsync

cd /gitsync
git clone https://github.com/BuoyantIO/emojivoto.git
cd emojivoto
git remote add local ssh://git/emojivoto
git push -u local main
