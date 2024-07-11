#!/bin/bash

echo -e "\e[34;1mAtualizando o Sistema...\e[0m"
apt-get update
apt-get upgrade -y
sudo apt install git -y
sudo apt install curl -y
sudo apt install snapd -y

echo -e "\e[34;1mBaixando e Instalando o Java...\e[0m"
sudo apt install openjdk-21-jdk-headless -y

echo -e "\e[34;1mBaixando e Instalando VsCode...\e[0m"
sudo snap install --classic code

echo -e "\e[34;1mBaixando e Instalando NVM e Node...\e[0m"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install --lts

echo -e "\e[34;1mBaixando e Instalando docker...\e[0m"
sudo apt install docker.io docker-compose -y
sudo systemctl enable --now docker docker.socket containerd

echo -e "\e[32;1mFinalizado Instalações!!!\e[0m"
