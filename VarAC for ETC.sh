#!/bin/bash

echo "Installing VarAC..."

# Define Variables
VARAC_VERSION="10_2_1"
VARAC_ZIP="VarAC_V${VARAC_VERSION}.zip"
VARAC_URL="https://www.varac-hamradio.com/downloadlinux"  # Update if necessary
INSTALL_DIR="$HOME/.wine/drive_c/VarAC"
DOWNLOAD_DIR="$HOME/Downloads"

# Ensure Wine is installed
if ! command -v wine &> /dev/null; then
    echo "Wine is not installed. Installing Wine..."
    sudo apt update && sudo apt install -y wine winetricks
else
    echo "Wine is installed. Version: $(wine --version)"
fi

# Ensure necessary directories exist
mkdir -p "$INSTALL_DIR" "$DOWNLOAD_DIR"

# Download VarAC if not already present
cd "$DOWNLOAD_DIR"
if [ ! -f "$VARAC_ZIP" ]; then
    echo "Downloading VarAC..."
    wget -q --show-progress "$VARAC_URL/$VARAC_ZIP" -O "$VARAC_ZIP"
    if [ $? -ne 0 ]; then
        echo "Error downloading VarAC. Check the URL or network connection."
        exit 1
    fi
else
    echo "VarAC zip already exists. Skipping download."
fi

# Unzip and install VarAC
echo "Extracting VarAC..."
unzip -o "$VARAC_ZIP" -d "$INSTALL_DIR"

# Ensure Wine configuration is updated
echo "Updating Wine configuration..."
wineboot --update

# Run VarAC using Wine
cd "$INSTALL_DIR"
echo "Launching VarAC..."
wine VarAC.exe &

# Create Application Shortcut
DESKTOP_FILE="$HOME/.local/share/applications/varac.desktop"
echo "Creating VarAC shortcut..."
cat > "$DESKTOP_FILE" <<EOL
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

# Ensure permissions are set
chmod +x "$DESKTOP_FILE"

# Fix menu entry for VARA/VARA FM if they exist
echo "Fixing menu entries for VARA/VARA FM..."
VARA_PATHS=(
    "$HOME/.local/share/applications/wine/Programs/VARA/VARA.desktop"
    "$HOME/.local/share/applications/wine/Programs/VARA FM/VARA FM.desktop"
)
for VARA_FILE in "${VARA_PATHS[@]}"; do
    if [ -f "$VARA_FILE" ]; then
        sed -i 's/wine-stable/wine/g' "$VARA_FILE"
        echo "Fixed $VARA_FILE"
    fi
done

echo "VarAC installation complete!"
echo "You can launch VarAC from your applications menu or by running:"
echo "wine $INSTALL_DIR/VarAC.exe"
