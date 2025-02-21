#!/bin/bash
#
# Author     : Anthony Woodward
# Date       : 20 February 2025
# Updated    : 20 February 2025
# Purpose    : Install branding


#Install branding
echo "Installing branding..."

cp ~/vara-scripts/logo/ham-scripts_tth_logo.png ~/Pictures
gsettings set org.gnome.desktop.background picture-uri file:///~/Pictures/ham-scripts_tth_logo.png

echo "Branding installed"

