#Update sources
echo "Updating sources..."
sudo apt update

#Uninstall wine-stable winetricks
echo "Removing winetricks..."
sudo apt purge wine-stable winetricks -y


#Install Wine
echo "Installing wine..."
sudo dpkg --add-architecture i386
sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/bullseye/winehq-bullseye.sources
sudo apt update
sudo apt install --install-recommends winehq-stable -y


#Install Winetricks
echo "Installing winetricks..."
cd ${HOME}/Downloads
wget  https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
chmod +x winetricks
sudo mv winetricks /usr/local/bin/


#Install some tricks
echo "Installing some tricks..."
#should see mono install after running next command
WINEARCH=win32 WINEPREFIX=$HOME/.wine/ winetricks -q vb6run
#vcrun20215 probably already installed
WINEARCH=win32 WINEPREFIX=$HOME/.wine/ winetricks -q vcrun2015
#dotnet461 takes a LONG time to install
WINEARCH=win32 WINEPREFIX=$HOME/.wine/ winetricks -q dotnet461
WINEARCH=win32 WINEPREFIX=$HOME/.wine/ winetricks sound=alsa


#Install VarAC
echo "Installing VarAC..."

mkdir ~/.wine/drive_c/VarAC
cd ~/vara-scripts/
unzip VarAC_V10_4_3.zip -d $HOME/.wine/drive_c/VarAC
cd ~/.wine/drive_c/VarAC
#wine VarAC.exe

#Install VARA HF Modem
#echo "Installing VARA HF..."

#mkdir ~/.wine/drive_c/VARA_HF
#cd ~/vara-scripts/
#unzip VARA_HF_v4.8.9.zip -d $HOME/.wine/drive_c/VARA_HF
#cd ~/.wine/drive_c/VARA_HF
#wine 'VARA setup (Run as Administrator).exe'

#Create Menu Shortcut for VarAC
#echo "Creating shortcut..."
#Echo """Create a shortcut using this line:

#sudo nano /usr/local/share/applications/varac.desktop

#Input this data into file:

#[Desktop Entry]
#Name=VarAC
#GenericName=VarAC
#Comment=Chat Program
#Exec=/usr/bin/wine $HOME/.wine/drive_c/VarAC/VarAC.exe
#Icon=
#Terminal=false
#Type=Application
#Categories=Network;HamRadio;"""


echo """Fix Menu Entry for VARA/VARA FM, change 'wine-stable' to 'wine' using in the following files:
~/.local/share/applications/wine/Programs/VARA/VARA.desktop
~/.local/share/applications/wine/Programs/VARA\ FM/VARA\ FM.desktop"""

echo "VarAC installed successfully!"

