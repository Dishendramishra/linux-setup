#!/bin/bash

# =======================================================================
#               Adding Commented Proxy
# =======================================================================
sudo su
echo '#http_proxy="http://user:passwd@172.16.0.1:3128/"' >> /etc/environment
echo '#https_proxy="http://user:passwd@172.16.0.1:3128/"' >> /etc/environment
echo '#ftp_proxy="http://user:passwd@172.16.0.1:3128/"' >> /etc/environment
echo '#HTTP_PROXY="http://user:passwd@172.16.0.1:3128/"' >> /etc/environment
echo '#HTTPS_PROXY="http://user:passwd@172.16.0.1:3128/"' >> /etc/environment
echo '#FTP_PROXY="http://user:passwd@172.16.0.1:3128/"' >> /etc/environment
echo '#no_proxy=localhost,127.0.0.1,*.my.lan.domain' >> /etc/environment
echo '#NO_PROXY=localhost,127.0.0.1,*.my.lan.domain' >> /etc/environment

echo '#Acquire::http::proxy "http://user:passwd@172.16.0.1:3128";' >> /etc/apt/apt.conf.d/proxy.conf
echo '#Acquire::https::proxy "http://user:passwd@172.16.0.1:3128";' >> /etc/apt/apt.conf.d/proxy.conf
echo '#Acquire::ftp::proxy "http://user:passwd@172.16.0.1:3128";' >> /etc/apt/apt.conf.d/proxy.conf
exit
# =======================================================================


# =======================================================================
#               Adding proxy_on proxy_off functions
# =======================================================================

echo 'proxy_on(){' >> ~/.bashrc
echo "	sudo sed -e '/h/ s/^#*//' -i /etc/environment /etc/apt/apt.conf.d/proxy.conf" >> ~/.bashrc
echo '}' >> ~/.bashrc

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
