#!/bin/bash
sudo rm -rf /var/lib/apt/lists/*
#sudo apt-get update -o Acquire::CompressionTypes::Order::=gz
sudo sed -i -re 's/\w+\.archive\.ubuntu\.com/archive.ubuntu.com/g' /etc/apt/sources.list
sudo apt update