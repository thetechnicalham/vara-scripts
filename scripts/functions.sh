#!/bin/bash
#
# Author     : Anthony Woodward
# Date       : 19 February 2025
# Updated    : 19 February 2025
# Purpose    : Global functions for install scripts

function exitIfNotRoot() {
  if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    echo "Try running: sudo ./$(basename $0)"
    exit
  fi
}
