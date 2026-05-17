#!/bin/bash

sudo curl -o /etc/yum.repos.d/beekeeper-studio.repo https://rpm.beekeeperstudio.io/beekeeper-studio.repo
sudo rpm --import https://rpm.beekeeperstudio.io/beekeeper.key
sudo dnf install -y beekeeper-studio
