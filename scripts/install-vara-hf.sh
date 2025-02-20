#!/bin/bash
#
# Author     : Anthony Woodward
# Date       : 19 February 2025
# Updated    : 19 February 2025
# Purpose    : Install VARA HF Modem


#Update sources
echo "Updating sources..."
sudo apt update


#Install VARA HF Modem
echo "Installing VARA HF..."

mkdir ~/.wine/drive_c/VARA_HF
cd ~/vara-scripts/scripts
unzip VARA_HF_v4.8.9.zip -d $HOME/.wine/drive_c/VARA_HF
cd ~/.wine/drive_c/VARA_HF
wine 'VARA setup (Run as Administrator).exe'
cd

echo "VARA HF installed successfully!"

