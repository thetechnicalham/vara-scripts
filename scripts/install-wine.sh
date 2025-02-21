#!/bin/bash
#
# Author     : Anthony Woodward
# Date       : 19 February 2025
# Updated    : 21 February 2025
# Purpose    : Install Wine and Winetricks

cd

#Update sources
echo "Updating sources..."
sudo apt update

WIN32_DIR="${HOME}/.win32"

#Install Wine
echo "Installing wine..."

# Check for an existing i386 architecture
ARCH_OUT=$(dpkg --print-foreign-architectures | grep i386)
[ $? -ne 0 ] && dpkg --add-architecture i386

apt install \
  wine \
  winetricks \
  exe-thumbnailer \
  -y

dialog --textbox wine.txt 15 74
tput sgr 0 && clear



#sudo dpkg --add-architecture i386
#sudo mkdir -pm755 /etc/apt/keyrings
#sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
#sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/bullseye/winehq-bullseye.sources
#sudo apt update
#sudo apt install --install-recommends winehq-stable -y

#Install Winetricks
#echo "Installing winetricks..."
#cd ${HOME}/Downloads
#wget  https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
#chmod +x winetricks
#sudo mv winetricks /usr/local/bin/


#Install some tricks
#echo "Installing some tricks..."
#should see mono install after running next command
#WINEARCH=win32 WINEPREFIX=$HOME/.wine/ winetricks -q vb6run
#vcrun20215 probably already installed
#WINEARCH=win32 WINEPREFIX=$HOME/.wine/ winetricks -q vcrun2015
#dotnet461 takes a LONG time to install
#WINEARCH=win32 WINEPREFIX=$HOME/.wine/ winetricks -q dotnet461
#WINEARCH=win32 WINEPREFIX=$HOME/.wine/ winetricks sound=alsa

cd ~/vara-scripts/scripts

