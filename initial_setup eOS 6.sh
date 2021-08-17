#!/bin/bash
sudo apt -y install software-properties-common

sudo add-apt-repository --yes ppa:nextcloud-devs/client
sudo add-apt-repository --yes ppa:daniruiz/flat-remix
sudo add-apt-repository --yes ppa:papirus/papirus
sudo add-apt-repository --yes ppa:philip.scott/pantheon-tweaks

sudo apt update
sudo apt -y install git gcc g++ firefox net-tools vim make vlc nextcloud-desktop flat-remix-gtk papirus-icon-theme terminator texstudio libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6 snapd pantheon-tweaks ffmpeg graphviz lm-sensors dconf-editor python3-pip

wget "https://zoom.us/client/latest/zoom_amd64.deb" -O zoom.deb
wget "https://atom.io/download/deb" -O atom.deb
wget "https://discord.com/api/download?platform=linux&format=deb" -O discord.deb
wget "https://downloads.slack-edge.com/linux_releases/slack-desktop-4.17.0-amd64.deb" -O slack.deb
wget "https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh" -O anaconda.sh

sudo dpkg -i zoom.deb
sudo dpkg -i atom.deb
sudo dpkg -i discord.deb
sudo dpkg -i slack.deb

sudo apt -y install -f

sudo dpkg -i zoom.deb
sudo dpkg -i atom.deb
sudo dpkg -i discord.deb
sudo dpkg -i slack.deb


chmod +x anaconda.sh
./anaconda.sh

# Adding "Open in terminator into the context menu"

echo "Adding Terminator to the context menu\n"
mkdir ~/.local/share/contractor/
cp ./terminator.contract ~/.local/share/contractor/terminator.contract

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
