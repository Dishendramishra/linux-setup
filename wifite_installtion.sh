#!/bin/bash

RED='\033[1;31m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
Color_Off="\033[0m"

mkdir ~/wifite
cd ~/wifite

echo -e ${RED}+----------------------+
echo "| Installing softwares |"
echo -e '+----------------------+' ${Color_Off}

echo -e ${GREEN} tshark ${Color_Off}
#tshark
sudo apt install -y tshark

echo -e ${GREEN} reaver ${Color_Off}
#reaver
sudo apt install -y reaver

echo -e ${GREEN} bully ${Color_Off}
#bully 
git clone https://github.com/aanarchyy/bully
cd bully*/
cd src
make
sudo make install
cd ~/wifite

echo -e ${GREEN} cowpatty ${Color_Off}
#cowpatty
git clone https://github.com/joswr1ght/cowpatty
cd cowpatty
sudo apt install -y cow
cd ~/wifite

echo -e ${GREEN} pyrit ${Color_Off}
#pyrit
sudo apt install -y pyrit

echo -e ${GREEN} hcxtools ${Color_Off}
#hcxtools
git clone https://github.com/ZerBea/hcxtools
cd hcxtools
make
sudo make install
cd ~/wifite

echo -e ${GREEN} machanger ${Color_Off}
#macchanger
sudo apt install -y macchanger

echo -e ${GREEN} hcxdumptool ${Color_Off}
#hcxdumptool
sudo apt install -y libcurl4-openssl-dev
sudo apt install -y libssl-dev
git clone https://github.com/ZerBea/hcxdumptool
make 
cd hcxdumptool
make
sudo make install
cd ~/wifite