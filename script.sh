#!/bin/bash

echo -e "\e[34;1mAtualizando o Sistema...\e[0m"
sudo rm /etc/apt/preferences.d/snap.pref
apt-get update
apt-get upgrade -y
sudo apt install snapd -y
sudo apt install git -y

echo -e "\e[34;1mBaixando e Instalando o Java...\e[0m"
sudo apt install openjdk-17-jdk-headless -y

echo -e "\e[34;1mBaixando e Instalando VsCode...\e[0m"
sudo snap install --classic code

echo -e "\e[32;1mFinalizado! A instalacao do Java e VsCode!\e[0m"
