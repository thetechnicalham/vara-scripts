#!/bin/bash

echo "Installing VarAC..."

# Define Variables
VARAC_VERSION="10_2_1"
VARAC_ZIP="VarAC_V${VARAC_VERSION}.zip"
VARAC_URL="https://www.varac-hamradio.com/downloadlinux"  # Update with actual download URL if necessary
INSTALL_DIR="$HOME/.wine/drive_c/VarAC"

# Ensure Wine is installed
if ! command -v wine &> /dev/null; then
    echo "Wine is not installed. Installing Wine..."
    sudo apt update && sudo apt install -y wine
fi

# Create VarAC directory in Wine
mkdir -p "$INSTALL_DIR"

# Download VarAC if not already present
cd ~/Downloads/
if [ ! -f "$VARAC_ZIP" ]; then
    echo "Downloading VarAC..."
    wget "$VARAC_URL/$VARAC_ZIP"
else
    echo "VarAC zip already downloaded."
fi

# Unzip and install VarAC
echo "Extracting VarAC..."
unzip -o "$VARAC_ZIP" -d "$INSTALL_DIR"

# Run VarAC using Wine
cd "$INSTALL_DIR"
echo "Launching VarAC..."
wine VarAC.exe &

# Create Application Shortcut
echo "Creating VarAC shortcut..."
DESKTOP_FILE="/usr/local/share/applications/varac.desktop"
sudo tee "$DESKTOP_FILE" > /dev/null <<EOL
[Desktop Entry]
Name=VarAC
GenericName=VarAC
Comment=Ham Radio Chat Program
Exec=wine $INSTALL_DIR/VarAC.exe
Icon=
Terminal=false
Type=Application
Categories=Network;HamRadio;
EOL

echo "Fixing Menu Entry for VARA/VARA FM..."
sed -i 's/wine-stable/wine/g' ~/.local/share/applications/wine/Programs/VARA/VARA.desktop 2>/dev/null
sed -i 's/wine-stable/wine/g' ~/.local/share/applications/wine/Programs/VARA\ FM/VARA\ FM.desktop 2>/dev/null

echo "VarAC installation complete!"
