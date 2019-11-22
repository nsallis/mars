#!/bin/bash

# the best way to run this is with
# `bash <(curl https://raw.githubusercontent.com/nsallis/mars/master/installer.sh)`
# this will run the full installation for you automatically

# base packages are disabled by default because they aren't needed on a regular ubuntu installation
#echo "\
#****************************\
#Installing base packages...\
#****************************\
#"
#sudo apt-get -y -qq install xserver-xorg xserver-xorg-core xfonts-base xinit x11-xserver-utils x11-apps x11-session-utils x11-utils xinput xorg lightdm lightdm-gtk-greeter make update-manager > /dev/null

#sudo apt -qq update > /dev/null

echo "\
****************************\
Installing packages required by dotfiles\
****************************\
"
sudo apt -y -qq install terminator nitrogen vim git yadm rofi thunar lxappearance arandr imagemagick scrot python-pip fonts-font-awesome nautilus neovim gnome-control-center > /dev/null

echo "\
****************************\
Creating home directories...\
****************************\
"
mkdir Documents Pictures Desktop builds

# install exa (used in bashrc as ls replacement)
cd builds
wget -c https://github.com/ogham/exa/releases/download/v0.8.0/exa-linux-x86_64-0.8.0.zip
unzip exa-linux-x86_64-0.8.0.zip
sudo mv exa-linux-x86_64 /usr/local/bin/exa
cd

echo "\
****************************\
Installing i3-gaps\
****************************\
"
sudo apt -y -qq install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev xutils-dev autoconf i3-wm i3status libxcb-shape0-dev > /dev/null

cd /tmp
git clone https://github.com/Airblader/xcb-util-xrm
cd xcb-util-xrm
git submodule update --init
./autogen.sh --prefix=/usr
make
sudo make install

mkdir ~/builds
cd ~/builds
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps
autoreconf --force --install
mkdir build
cd build
../configure --prefix=/usr --sysconfdir=/etc
make
sudo make install

cd

echo "
****************************\
Installing custom dotfiles...\
****************************\
"
yadm clone https://github.com/nsallis/mars.git

echo "
****************************\
Installing additional packages...\
****************************\
"

# chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt update
sudo apt install google-chrome-stable

# powerline font
mkdir ~/.fonts
cd ~/.fonts
wget https://github.com/powerline/fonts/raw/master/DejaVuSansMono/DejaVu%20Sans%20Mono%20for%20Powerline.ttf
sudo fc-cache -f -v

# VimPlug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# bash powerline
pip install powerline-shell

sudo apt install clipit
