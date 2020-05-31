#!/bin/bash

RED='\033[1;31m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
Color_Off="\033[0m"

echo -e ${RED} "sudo apt update && sudo apt upgrade -y" ${Color_Off}
sudo add-apt-repository universe
sudo apt update && sudo apt upgrade -y

echo -e ${RED} "Installing Basic Utilities" ${Color_Off}
sudo apt  install -y git curl wget gparted apt-transport-https build-essential vlc htop easystroke intltool unrar-free unzip xdotool dconf-editor gdebi

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

echo -e ${GREEN} ocs-url ${Color_Off}
wget "https://dllb2.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE1MzA3NzQ2MDAiLCJ1IjpudWxsLCJsdCI6ImRvd25sb2FkIiwicyI6IjM1MWI5OGQxZTc2YTgxMTdhZjUwODM2YWIzNjgyMmU1YjFmYjg0MTJlYmEzYTM3Yjk5ODFmMmZhZGUxMGU4Zjk2NTA3ZWFlODRmZDM5ZjEzM2MwMTk5NTVkYTU1ZTIxNTA0ZWIxMGQ1ZjYzMDQ5NTkyYmVlNDNjMTAxMGJhZWRiIiwidCI6MTU5MDkxODU3Niwic3RmcCI6IjU1ZTg3MWYzZTEwMGYyNjQ4MDEwYzk3ZTlmN2EzNTQ5Iiwic3RpcCI6IjEwMy44NS44LjI0In0.M-5J-8-K8FHfnkY41ZU5Jc86d-EsHb2KduOk5B1WDDM/ocs-url_3.1.0-0ubuntu1_amd64.deb"
echo "y" | sudo gdebi ./ocs-url*.deb
# =======================================================================


# =======================================================================
#               Installing Oh-My-Zsh
# =======================================================================
echo -e ${RED} Installing Oh-My-Zsh ${Color_Off}
sudo apt install -y zsh
echo "no" | sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# adding plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

# adding plugins in zshrc
sed -i 's/plugins.*/plugins=(sudo git zsh-autosuggestions zsh-completions zsh-syntax-highlighting)/' ~/.zshrc
# =======================================================================

# changing default shell to zsh
chsh -s $(which zsh)
