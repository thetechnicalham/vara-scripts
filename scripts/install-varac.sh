#!/bin/bash
#
# Author     : Anthony Woodward
# Date       : 19 February 2025
# Updated    : 21 February 2025
# Purpose    : Install VarAC


#Update sources
echo "Updating sources..."
sudo apt update

#Install VarAC
echo "Installing VarAC..."

mkdir ~/.wine/drive_c/VarAC
cd ~/vara-scripts/scripts
unzip VarAC_V10_4_3.zip -d $HOME/.wine/drive_c/VarAC
cd ../overlay/shortcut/
cp varac.desktop ~/.local/share/applications/
cd ~/vara-scripts/scripts
#wine ~/.wine/drive_c/VarAC/VarAC.exe


#echo """Fix Menu Entry for VARA/VARA FM, change 'wine-stable' to 'wine' using in the following files:
#~/.local/share/applications/wine/Programs/VARA/VARA.desktop
#~/.local/share/applications/wine/Programs/VARA\ FM/VARA\ FM.desktop"""

echo "VarAC installed successfully!"

