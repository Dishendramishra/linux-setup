#!/bin/bash

RED='\033[1;31m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
Color_Off="\033[0m"

# =======================================================================
#  getting root previliges
# =======================================================================
if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi
# =======================================================================


# =======================================================================
#               Adding Commented Proxy
# =======================================================================
# echo -e ${GREEN}+----------------------------------------------------+
echo -e ${GREEN}  Adding Commented Proxy to apt and /etc/environment ${Color_Off}
# echo -e '+----------------------------------------------------+' ${Color_Off}

$USER
$PASSWD

echo Enter proxy username:
read USER
echo

echo Enter proxy password:
read PASSWD

sudo echo '' >> /etc/environment
sudo echo 'http_proxy="http://'${USER}':'${PASSWD}'@172.16.0.1:3128/"' >> /etc/environment
sudo echo 'https_proxy="http://'${USER}':'${PASSWD}'@172.16.0.1:3128/"' >> /etc/environment
sudo echo 'ftp_proxy="http://'${USER}':'${PASSWD}'@172.16.0.1:3128/"' >> /etc/environment

sudo echo 'HTTP_PROXY="http://'${USER}':'${PASSWD}'@172.16.0.1:3128/"' >> /etc/environment
sudo echo 'HTTPS_PROXY="http://'${USER}':'${PASSWD}'@172.16.0.1:3128/"' >> /etc/environment
sudo echo 'FTP_PROXY="http://'${USER}':'${PASSWD}'@172.16.0.1:3128/"' >> /etc/environment

sudo echo 'no_proxy=localhost,127.0.0.1,*.my.lan.domain' >> /etc/environment
sudo echo 'NO_PROXY=localhost,127.0.0.1,*.my.lan.domain' >> /etc/environment

echo '' >> ~/.bashrc
sudo echo 'http_proxy="http://'${USER}':'${PASSWD}'@172.16.0.1:3128/"' >> ~/.bashrc
sudo echo 'https_proxy="http://'${USER}':'${PASSWD}'@172.16.0.1:3128/"' >> ~/.bashrc
sudo echo 'ftp_proxy="http://'${USER}':'${PASSWD}'@172.16.0.1:3128/"' >> ~/.bashrc

sudo echo '' >> /etc/apt/apt.conf.d/proxy.conf
sudo echo 'Acquire::http::proxy "http://'${USER}':'${PASSWD}'@172.16.0.1:3128";' >> /etc/apt/apt.conf.d/proxy.conf
sudo echo 'Acquire::http::proxy "http://'${USER}':'${PASSWD}'@172.16.0.1:3128";' >> /etc/apt/apt.conf.d/proxy.conf
sudo echo 'Acquire::http::proxy "http://'${USER}':'${PASSWD}'@172.16.0.1:3128";' >> /etc/apt/apt.conf.d/proxy.conf
echo -e ${BLUE} Done
echo
# =======================================================================

echo -e ${RED} reboot system to apply proxy settings ! ${Color_Off}
