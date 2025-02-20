#!/bin/bash
#
# Author     : Anthony Woodward
# Date       : 19 February 2025
# Updated    : 19 February 2025
# Purpose    : Install VarAC


#Update sources
echo "Updating sources..."
sudo apt update

#Install VarAC
echo "Installing VarAC..."

mkdir ~/.wine/drive_c/VarAC
cd ~/vara-scripts/scripts
unzip VarAC_V10_4_3.zip -d $HOME/.wine/drive_c/VarAC
cd ~/vara-scripts/scripts
#wine ~/.wine/drive_c/VarAC/VarAC.exe

#Create Menu Shortcut for VarAC
echo "Creating menu shortcut..."
Echo """Create a shortcut using this line:

sudo nano /usr/local/share/applications/varac.desktop

Input this data into file:

[Desktop Entry]
Name=VarAC
GenericName=VarAC
Comment=Chat Program
Exec=/usr/bin/wine $HOME/.wine/drive_c/VarAC/VarAC.exe
Icon=
Terminal=false
Type=Application
Categories=Network;HamRadio;"""


#echo """Fix Menu Entry for VARA/VARA FM, change 'wine-stable' to 'wine' using in the following files:
#~/.local/share/applications/wine/Programs/VARA/VARA.desktop
#~/.local/share/applications/wine/Programs/VARA\ FM/VARA\ FM.desktop"""

echo "VarAC installed successfully!"

