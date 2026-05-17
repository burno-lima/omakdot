#!/bin/bash

cd /tmp
wget -O dbeaver.rpm https://dbeaver.io/files/dbeaver-ce-latest-stable.x86_64.rpm
sudo rpm -ivh dbeaver.rpm
rm dbeaver.rpm
cd -
