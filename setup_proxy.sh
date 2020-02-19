#!/bin/bash

RED='\033[1;31m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
Color_Off="\033[0m"

# =======================================================================
#               Adding Commented Proxy
# =======================================================================
echo -e ${GREEN}+----------------------------------------------------+
echo "| Adding Commented Proxy to apt and /etc/environment |"
echo -e '+----------------------------------------------------+' ${Color_Off}

sudo echo '\n'
sudo echo '#http_proxy="http://user:passwd@172.16.0.1:3128/"' >> /etc/environment
sudo echo '#https_proxy="http://user:passwd@172.16.0.1:3128/"' >> /etc/environment
sudo echo '#ftp_proxy="http://user:passwd@172.16.0.1:3128/"' >> /etc/environment
sudo echo '#HTTP_PROXY="http://user:passwd@172.16.0.1:3128/"' >> /etc/environment
sudo echo '#HTTPS_PROXY="http://user:passwd@172.16.0.1:3128/"' >> /etc/environment
sudo echo '#FTP_PROXY="http://user:passwd@172.16.0.1:3128/"' >> /etc/environment
sudo echo '#no_proxy=localhost,127.0.0.1,*.my.lan.domain' >> /etc/environment
sudo echo '#NO_PROXY=localhost,127.0.0.1,*.my.lan.domain' >> /etc/environment

sudo echo '\n'
sudo echo '#Acquire::http::proxy "http://user:passwd@172.16.0.1:3128";' >> /etc/apt/apt.conf.d/proxy.conf
sudo echo '#Acquire::https::proxy "http://user:passwd@172.16.0.1:3128";' >> /etc/apt/apt.conf.d/proxy.conf
sudo echo '#Acquire::ftp::proxy "http://user:passwd@172.16.0.1:3128";' >> /etc/apt/apt.conf.d/proxy.conf
# =======================================================================


# =======================================================================
#               Adding proxy_on proxy_off functions
# =======================================================================
echo -e ${GREEN}'+-------------------------------------------+'
echo "| Adding proxy_on proxy_off to bashrc zshrc |"
echo -e '+-------------------------------------------+' ${Color_Off}
echo '\n' >> ~/.bashrc
echo 'proxy_on(){' >> ~/.bashrc
echo "	sudo sed -e '/h/ s/^#*//' -i /etc/environment /etc/apt/apt.conf.d/proxy.conf" >> ~/.bashrc
echo '}' >> ~/.bashrc

echo '\n' >> ~/.zshrc
echo 'proxy_on(){' >> ~/.zshrc
echo "	sudo sed -e '/h/ s/^#*//' -i /etc/environment /etc/apt/apt.conf.d/proxy.conf" >> ~/.zshrc
echo '}' >> ~/.zshrc

echo 'proxy_off(){' >> ~/.bashrc
echo "	sudo sed -e '/h/ s/^#*/#/' -i /etc/environment /etc/apt/apt.conf.d/proxy.conf" >> ~/.bashrc
echo '}' >> ~/.bashrc

echo 'proxy_off(){' >> ~/.zshrc
echo "	sudo sed -e '/h/ s/^#*/#/' -i /etc/environment /etc/apt/apt.conf.d/proxy.conf" >> ~/.zshrc
echo '}' >> ~/.zshrc
# =======================================================================