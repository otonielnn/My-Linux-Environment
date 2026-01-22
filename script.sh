#!/bin/bash

echo -e "\e[34;1mAtualizando o Sistema...\e[0m" && sleep 2
sudo apt update && sudo apt upgrade -y

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
source ~/.zshrc

echo -e "\e[34;1mPyenv...\e[0m" && sleep 2
curl -fsSL https://pyenv.run | bash
source ~/.zshrc

echo -e "\e[34;1mInstalando SDKMan, Java e Maven...\e[0m" && sleep 2
curl -s "https://get.sdkman.io" | bash
source ~/.zshrc
sdk install maven 3.9.9
sdk install java 21.0.5-amzn

echo -e "\e[34;1mInstalando Chromium...\e[0m" && sleep 2
flatpak install flathub org.chromium.Chromium -y
source ~/.zshrc

echo -e "\e[34;1mBaixando e Instalando docker...\e[0m" && sleep 2
sudo apt install docker.io docker-compose -y
sudo systemctl enable --now docker docker.socket containerd
sudo usermod -aG docker $USER
source ~/.zshrc

echo -e "\e[32;1mFinalizado Instalações!!!\e[0m" && sleep 3
