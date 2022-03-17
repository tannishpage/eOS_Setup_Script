#!/bin/bash
sudo apt -y install software-properties-common

#sudo add-apt-repository --yes ppa:nextcloud-devs/client
#sudo add-apt-repository --yes ppa:daniruiz/flat-remix
sudo add-apt-repository --yes ppa:papirus/papirus
sudo add-apt-repository --yes ppa:philip.scott/pantheon-tweaks

sudo apt update
sudo apt install -y git gcc g++ firefox net-tools vim make vlc papirus-icon-theme terminator texstudio libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6 snapd pantheon-tweaks ffmpeg graphviz lm-sensors dconf-editor python3-pip texlive libglib2.0-dev libgranite-dev libindicator3-dev libwingpanel-dev indicator-application kdeconnect

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#flatpak install flathub com.discordapp.Discord
flatpak install -y flathub com.slack.Slack
flatpak install -y flathub us.zoom.Zoom
flatpak install -y flathub io.atom.Atom
flatpak install -y flathub com.nextcloud.desktopclient.nextcloud
flatpak install -y flathub org.qownnotes.QOwnNotes
flatpak install -y flathub com.github.bajoja.indicator-kdeconnect


#wget "https://zoom.us/client/latest/zoom_amd64.deb" -O zoom.deb
#wget "https://atom.io/download/deb" -O atom.deb
#wget "https://discord.com/api/download?platform=linux&format=deb" -O discord.deb
#wget "https://downloads.slack-edge.com/linux_releases/slack-desktop-4.17.0-amd64.deb" -O slack.deb
wget "https://repo.anaconda.com/archive/Anaconda3-2021.11-Linux-x86_64.sh" -O anaconda.sh

# Adding support for the indicators for applications such as discord, etc.
echo "Adding indicator stuff..."
wget "https://github.com/Lafydev/wingpanel-indicator-ayatana/raw/master/com.github.lafydev.wingpanel-indicator-ayatana_2.0.8_odin.deb" -O indicator.deb
sudo dpkg -i indicator.deb

mkdir -p ~/.config/autostart
cp /etc/xdg/autostart/indicator-application.desktop ~/.config/autostart/
sed -i 's/^OnlyShowIn.*/OnlyShowIn=Unity;GNOME;Pantheon;/' ~/.config/autostart/indicator-application.desktop
sudo sed -i 's/^OnlyShowIn.*/OnlyShowIn=Unity;GNOME;Pantheon;/' /etc/xdg/autostart/indicator-application.desktop


#sudo dpkg -i zoom.deb
#sudo dpkg -i atom.deb
#sudo dpkg -i discord.deb
#sudo dpkg -i slack.deb

#sudo apt -y install -f

#sudo dpkg -i zoom.deb
#sudo dpkg -i atom.deb
#sudo dpkg -i discord.deb
#sudo dpkg -i slack.deb


#chmod +x anaconda.sh
# Chmod didn't work too well, rather run it in a new bash shell
bash ./anaconda.sh

# Adding "Open in terminator into the context menu"

echo "Adding Terminator to the context menu\n"
mkdir ~/.local/share/contractor/
cp ./terminator.contract ~/.local/share/contractor/terminator.contract

# Installing python packages I use regularly
python3 -m pip install virtualenv
python3 -m pip install matplotlib
python3 -m pip install numpy
python3 -m pip install opencv-python

echo "Checking for updates and updating to latest software"
sudo apt update

sudo apt -y upgrade

sudo apt -y autoremove

# Initializing conda
# Assuming this is the install directory of conda
~/anaconda3/bin/conda init
conda config --set auto_activate_base false

echo "Finished setup."
echo "Installed all essential applications and themes for elementary os"
read -p "Press any key to reboot... " -n1 -s
reboot
