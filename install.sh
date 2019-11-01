#!/bin/bash

RED='\033[1;31m'

sudo apt update && sudo apt -y upgrade

sudo apt  install -y git curl wget gparted apt-transport-https build-essential vlc htop

# Google Chrome
echo ${RED} adding Google chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

# Typora
echo ${RED} adding Typora
wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
sudo add-apt-repository 'deb https://typora.io/linux ./'

# VS Code
echo ${RED} adding VS Code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# Sublime
echo ${RED} adding Sublime
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

# Papirus Icon theme
echo ${RED} adding Papirus Icon theme
sudo add-apt-repository ppa:papirus/papirus


echo ${RED} updating
sudo apt update

echo ${RED} Installing softwares
sudo apt install -y google-chrome-stable
sudo apt install -y typora
sudo apt install -y code
sudo apt install -y sublime-text
sudo apt install -y okular
sudo apt install -y papirus-icon-theme


# Installing Oh-My-Zsh
echo ${RED} Installing Oh-My-Zsh
sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
