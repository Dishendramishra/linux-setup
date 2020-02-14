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
    
    - Nemo  
      Change default terminal used by nemo  
      `org.cinnamon.desktop.applications.terminal.exec` to your choice
    
      Add open terminal here shortcut
      ```shell
      mkdir -p ~/.gnome2/accels
      touch ~/.gnome2/accels/nemo
      ```
      
      Then add the following line in that file (replace "F4" with whatever shortcut you want to use):
      ```shell
      (gtk_accel_path "<Actions>/DirViewActions/OpenInTerminal" "F4")
      ```
    - Python
      ```shell
      pip install setuptools
      pip install pandas jupyter matplotlib scipy astropy ptipython
      ```
    - IDL  
      lib = https://pkgs.org/download/libxp6 install library from here
    
5. **Config Files**

    - ptipython: `cp ./config-files/ptipython_config.py ~/.ptpython/config.py`
    - VS Code: `settings.json`

6. **Manually add PPA**
   ```shell
   sudo apt-add-repository '<ppa technical data>'
   ```

7. **Manually add PPA Signing Key**
   ```shell
   sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 00000000
   ```
   Replacing the `00000000` with the second part of the key informed in the PPA website that you want to add.

   For example, if you find this line:
   ```shell
    4096R/7BF576066
   ```
   Use only the second part (no matter its size), which in this example is `7BF576066`

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

    window-manager theme (install Mojave-dark.tar.xz): https://www.gnome-look.org/p/1275087/

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
    
## Gmail Filters
`{from:zomato ,from:swiggy, from:phonepe, from:paytm, slack, from:coursera, from:academia, from:decathlon, from:triaba, from:twitter, from:quora, from:notification, from:google, from:apple, from:amazon, from:mi, from:redhat,
from:redbus, from:codechef, from:teacheron, from:urbanpro, from:coinbase, from:vistara,from:github, from:ola, from:flipkart, from:prime minister,from:hackveda,from:linkedin, from:instructables, from:aliexpress, from:netgear,from:adobe}`
