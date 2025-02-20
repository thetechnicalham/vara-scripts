#!/bin/bash
#
# Author     : Anthony Woodward
# Date       : 19 February 2025
# Updated    : 19 February 2025
# Purpose    : Create master install command

./functions.sh

exitIfNotRoot

./install-wine.sh
./install-vara-hf.sh
./install-vara-fm.sh
./install-varac.sh
./install-winlink.sh

dialog ==textbox post-install-steps.txt 115 74

cp ~/vara-scripts/scripts/post-install-steps.txt ~/Desktop

