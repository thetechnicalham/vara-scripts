chmod +x VarAC_for_ETC.sh
#Install VarAC
echo "Installing VarAC..."
#Download & unzip VarAC to .wine directory. Note: Substitute <VarAC_dir> with the actual zip file name. (https://www.varac-hamradio.com/downloadlinux) current version 10_2_1

mkdir ~/.wine/drive_c/VarAC
cd ~/vara-scripts/
unzip VarAC_V10_4_3.zip -d $HOME/.wine/drive_c/VarAC
cd ~/.wine/drive_c/VarAC
wine VarAC.exe

#Create Menu Shortcut for VarAC
echo "Creating shortcut..."
sudo nano /usr/local/share/applications/varac.desktop

[Desktop Entry]
Name=VarAC
GenericName=VarAC
Comment=Chat Program
Exec=/usr/bin/wine $HOME/.wine/drive_c/VarAC/VarAC.exe
Icon=
Terminal=false
Type=Application
Categories=Network;HamRadio;


#echo """Fix Menu Entry for VARA/VARA FM, change 'wine-stable' to 'wine' using in the following files:
#~/.local/share/applications/wine/Programs/VARA/VARA.desktop
#~/.local/share/applications/wine/Programs/VARA\ FM/VARA\ FM.desktop"""

echo "VarAC installed successfully!"
#wine ~/.wine/drive_c/VarAC/VarAC.exe

