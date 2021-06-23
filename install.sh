#!/bin/bash

RED='\033[1;31m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
Color_Off="\033[0m"

echo -e ${RED} "sudo apt update && sudo apt upgrade -y" ${Color_Off}
sudo add-apt-repository universe
sudo apt update && sudo apt upgrade -y

echo -e ${RED} "Installing Basic Utilities" ${Color_Off}
sudo apt  install -y git curl wget gparted apt-transport-https build-essential vlc htop easystroke intltool unrar-free unzip xdotool dconf-editor gdebi net-tools

# Google Chrome
echo -e ${RED} adding Google chrome ${Color_Off}
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

# Typora
echo -e ${RED} adding Typora ${Color_Off}
wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
sudo apt-add-repository -y 'deb https://typora.io/linux ./'

# VS Code
echo -e ${RED} adding VS Code ${Color_Off}
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# Sublime
echo -e ${RED} adding Sublime ${Color_Off}
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

# Albert
echo -e ${RED} adding Albert ${Color_Off}
curl https://build.opensuse.org/projects/home:manuelschneid3r/public_key | sudo apt-key add -
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_18.04/ /' > /etc/apt/sources.list.d/home:manuelschneid3r.list"
wget -nv https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_18.04/Release.key -O Release.key
sudo apt-key add - < Release.key

# Telegram
echo -e ${RED} adding Telegram ${Color_Off}
sudo add-apt-repository ppa:atareao/telegram

# Updating
echo -e ${RED} sudo apt update ${Color_Off}
sudo apt update

# =======================================================================
#               Installing Softwares
# =======================================================================

echo -e ${RED}+----------------------+
echo "| Installing softwares |"
echo -e '+----------------------+' ${Color_Off}

echo -e ${GREEN} Google Chrome ${Color_Off}
sudo apt install -y google-chrome-stable

echo -e ${GREEN} Typora ${Color_Off}
sudo apt install -y typora

echo -e ${GREEN} VS Code ${Color_Off}
sudo apt install -y code

echo -e ${GREEN} Sublime Text ${Color_Off}
sudo apt install -y sublime-text

echo -e ${GREEN} Albert ${Color_Off}
sudo apt install -y albert

echo -e ${GREEN} Telegram ${Color_Off}
sudo apt install -y Telegram
# =======================================================================


# =======================================================================
#               Installing Oh-My-Zsh
# =======================================================================
echo -e ${RED} Installing Oh-My-Zsh ${Color_Off}
sudo apt install -y zsh
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh

# adding plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

# adding plugins in zshrc
sed -i -e 's/^plugins=.*/plugins=(sudo git zsh-autosuggestions zsh-completions zsh-syntax-highlighting)/' ~/.zshrc
# =======================================================================

# changing default shell to zsh
chsh -s $(which zsh)
