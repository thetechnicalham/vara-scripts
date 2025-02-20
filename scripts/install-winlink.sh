#!/bin/bash
#
# Author     : Anthony Woodward
# Date       : 20 February 2025
# Updated    : 20 February 2025
# Purpose    : Install Winlink

#Update sources
echo "Updating sources..."
sudo apt update


#Install Winlink
echo "Installing Winlink..."

mkdir ~/.wine/drive_c/Winlink
cd ~/vara-scripts/scripts
unzip Winlink_1-7-21-0.zip -d $HOME/.wine/drive_c/Winlink
cd ~/.wine/drive_c/Winlink
wine 'Winlink_Express_install.exe'
cd

echo "Winlink installed successfully!"

