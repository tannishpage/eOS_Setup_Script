#!/bin/bash
sudo apt -y install software-properties-common
sudo add-apt-repository ppa:philip.scott/elementary-tweaks
sudo add-apt-repository ppa:nextcloud-devs/client
sudo add-apt-repository ppa:daniruiz/flat-remix
sudo add-apt-repository ppa:papirus/papirus
sudo apt update
sudo apt -y install git gcc g++ firefox net-tools vim elementary-tweaks make vlc nextcloud-desktop flat-remix-gtk papirus-icon-theme evolution terminator texstudio libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6

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

#git clone https://github.com/daniruiz/flat-remix.git
#cd flat-remix
#sudo make install
#cd ..
#git clone https://github.com/vinceliuice/vimix-gtk-themes.git
#cd vimix-gtk-themes
#sudo ./install.sh -a
#cd ..

sudo apt -y autoremove

echo "Finished setup."
echo "Installed all essential applications and themes for elementary os"
echo "Have a nice day :)"
