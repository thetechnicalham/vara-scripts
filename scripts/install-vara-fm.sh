#!/bin/bash
#
# Author     : Anthony Woodward
# Date       : 19 February 2025
# Updated    : 19 February 2025
# Purpose    : Install VARA FM Modem


#Update sources
echo "Updating sources..."
sudo apt update


#Install VARA HF Modem
echo "Installing VARA FM..."

mkdir ~/.wine/drive_c/VARA_FM
cd ~/vara-scripts/scripts
unzip VARA_FM_v4.3.8.zip -d $HOME/.wine/drive_c/VARA_FM
cd ~/.wine/drive_c/VARA_FM
wine 'VARA FM setup (Run as Administrator).exe'
cd ~/vara-scripts/scripts

echo "VARA FM installed successfully!"

