#!/bin/bash
#
# Author     : Anthony Woodward
# Date       : 20 February 2025
# Updated    : 20 February 2025
# Purpose    : Install browser


# Add Brave repository.
  curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

  echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

  apt update

  apt install brave-browser -y
else
  echo "Brave already installed: $INSTALL_PATH. Skipping."
fi

echo "Brave installed!"

