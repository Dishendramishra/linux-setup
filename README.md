### General

1. **Start applications in background**
   
    - Telegram: `/opt/telegram/Telegram -startintray`
    
    - Google Chrome: `google-chrome-stable --no-startup-window`
    
    - Xfdashboard: `xfdashboard -d`
    
      
    
2. **Git Settings**

   - Proxy:

     ```shell
     git config --global http.proxy http[s]://userName:password@proxyaddress:port
     ```

     

3. **Uninstall all modules installed by pip**

    ```shell
    pip freeze > dump.txt
    cat dump.txt | xargs sudo pip uninstall -y
    ```

    

4. **Softwares**

    - Libinput-Gestures

    ```shell
    sudo gpasswd -a $USER input
    sudo apt install -y libinput-tools xdotool wmctrl
    git clone https://github.com/bulletmark/libinput-gestures.git
    cd libinput-gestures
    sudo make install
    cp ./libinput-gestures.conf ~/.config/libinput-gestures.conf
    cd ..
    ```

    - R Language

    ```shell
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
    sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/'
    sudo apt update
    sudo apt install r-base
    ```
    
5. **Config Files**

    - ptipython: `cp ./config-files/ptipython_config.py ~/.ptpython/config.py`
    - VS Code: `settings.json`

---

#### XFCE

1. **Monokai Terminal**  

    ```shell
    sudo cp ./monokai-terminal/xfce-monokai.theme /usr/share/xfce4/terminal/colorschemes
    ```
    
2. **Mac Theme**

    Prerequisites:

    ``` shell
    sudo apt install ocs-url
    ```

    theme-link: https://www.gnome-look.org/p/1275087/

---

#### GNOME

1. **Monokai Terminal**

    ```shell
    sudo apt install -y dconf-cli uuid-runtime
    bash -c  "$(curl -sLo- https://git.io/vQgMr)"
    ```

2. **Enable hotcorners**  

    ```shell
    gsettings set org.gnome.shell enable-hot-corners true
    ```

3. **Isolate workspace windows**

    ```shell
    gsettings set org.gnome.shell.app-switcher current-workspace-only true
    gsettings set org.gnome.shell.extensions.dash-to-dock isolate-workspaces true
    ```

4. **Default Font Settings**

    ```shell
    gsettings reset org.gnome.desktop.interface font-name
    gsettings reset org.gnome.desktop.interface document-font-name
    gsettings reset org.gnome.desktop.interface monospace-font-name
    gsettings reset org.gnome.desktop.wm.preferences titlebar-font
    gsettings reset org.gnome.nautilus.desktop font
    gsettings reset org.gnome.desktop.interface text-scaling-factor
    ```
