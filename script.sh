#!/bin/bash

echo -e "\e[34;1mAtualizando o Sistema...\e[0m" && sleep 2
sudo apt update && sudo apt upgrade -y

if ! command -v curl &> /dev/null; then
    echo -e "\e[34;1mInstalando o Curl...\e[0m"  && sleep 2
    sudo apt install curl -y
    if [ $? -ne 0 ]; then
        echo -e "\e[31mErro ao instalar o Curl. Abortando...\e[0m"
        exit 1
    fi
    else
        echo -e "\e[33mO Curl já está instalado..\e[0m"  && sleep 1
fi

if ! command -v git &> /dev/null; then
    echo -e "\e[34;1mInstalando Git...\e[0m"  && sleep 2
    sudo apt install git -y
    if [ $? -ne 0 ]; then
        echo -e "\e[31mErro ao instalar o Git. Abortando...\e[0m"
        exit 1
    fi
    else
        echo -e "\e[33mO Git já está instalado..\e[0m"  && sleep 1
fi

echo -e "\e[34;1mInstalando ZSH...\e[0m"  && sleep 2
sudo apt install zsh -y

echo -e "\e[34;1mInstalando Oh My Zsh...\e[0m"  && sleep 2
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "0" | zsh-newuser-install

echo -e "\e[34;1mInstalando o Plugins do Oh My Zsh...\e[0m"  && sleep 2
git clone https://github.com/z-shell/F-Sy-H ~/path/to/f-sy-h
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo 'export ZSH="$HOME/.oh-my-zsh"' > ~/.zshrc
echo 'ZSH_THEME="robbyrussell"' >> ~/.zshrc
echo 'plugins=(git zsh-autosuggestions)' >> ~/.zshrc
echo 'source $ZSH/oh-my-zsh.sh' >> ~/.zshrc
echo 'source ~/path/to/f-sy-h/F-Sy-H.plugin.zsh' >> ~/.zshrc

echo -e "\e[34;1mInstalando o Java...\e[0m" && sleep 2
sudo apt install openjdk-21-jdk-headless -y

echo -e "\e[34;1mInstalando VsCode...\e[0m" && sleep 2
sudo snap install --classic code

echo -e "\e[34;1mInstalando NVM e Node...\e[0m" && sleep 2
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install --lts

echo -e "\e[34;1mBaixando e Instalando docker...\e[0m" && sleep 2
sudo apt install docker.io docker-compose -y
sudo systemctl enable --now docker docker.socket containerd

echo -e "\e[32;1mFinalizado Instalações!!!\e[0m" && sleep 3
