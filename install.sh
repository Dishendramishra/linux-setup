#!/bin/bash

RED='\033[1;31m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
Color_Off="\033[0m"

echo ${RED} "sudo apt update && sudo apt upgrade -y" ${Color_Off}
sudo apt update && sudo apt upgrade -y

echo ${RED} "Installing Basic Utilities" ${Color_Off}
sudo apt  install -y git curl wget gparted apt-transport-https build-essential vlc htop easystroke

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

# Albert
echo ${RED} adding Albert 
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_18.04/ /' > /etc/apt/sources.list.d/home:manuelschneid3r.list"
wget -nv https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_18.04/Release.key -O Release.key
sudo apt-key add - < Release.key

# Updating
echo ${RED} sudo apt update ${Color_Off}
sudo apt update

# =======================================================================
#               Installing Softwares
# =======================================================================

echo ${RED}+----------------------+
echo "| Installing softwares |"
echo +----------------------+ ${Color_Off}

echo ${GREEN} Google Chrome ${Color_Off}
sudo apt install -y google-chrome-stable

echo ${GREEN} Typora ${Color_Off}
sudo apt install -y typora

echo ${GREEN} VS Code ${Color_Off}
sudo apt install -y code

echo ${GREEN} Sublime Text ${Color_Off}
sudo apt install -y sublime-text

echo ${GREEN} Okular ${Color_Off}
sudo apt install -y okular

echo ${GREEN} Papirus Icon Theme ${Color_Off}
sudo apt install -y papirus-icon-theme

echo ${GREEN} Albert ${Color_Off}
sudo apt install -y albert
# =======================================================================


# =======================================================================
#               Installing Oh-My-Zsh
# =======================================================================
echo ${RED} Installing Oh-My-Zsh
sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# adding plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# adding plugins in zshrc
sed -i 's/plugins.*/plugins=(git sudo zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc
# =======================================================================