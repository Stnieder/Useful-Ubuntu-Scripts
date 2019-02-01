#! /bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

function printQuestion {
	echo -e "$1(${GREEN}y${NC}/${GREEN}n${NC})"
}

function printInColor {
	echo -e "${$1} $2"
}

function installGnome {
	sudo apt-get dist-upgrade

	sudo add-apt-repository ppa:gnome3-team/gnome3-staging
	sudo add-apt-repository ppa:gnome3-team/gnome3

	sudo apt update
	
	sudo apt install gnome gnome-shell ubuntu-gnome-desktop ubuntu-session gdm3
	sudo apt autoremove
	
	wait
}

function uninstallUnity {
	sudo apt purge unity-session unity
	sudo apt autoremove
}

function uninstallLightDM {
	sudo apt-get purge lightdm
		
	sudo rm -rf /var/lib/lightdm-data
	sudo rm -rf /etc/lightdm
	
	sudo apt autoremove
}

function rebootComputer {
	sleep 3
	sudo reboot
}


if [[ $(id -u) -ne 0 ]]; then
	printInColor "RED" "Please run this script as sudo."
	exit
else
	
	installGnome
	
	printQuestion "Do you want to remove untiy completely?"
	read removeUnity

	if [ "$removeUnity" == "y" ]
	then
		
	fi
	
	printQuestion "Do you want to remove 'lightdm'?"
	read removeLightDM
	
	if [ "$removeLightDM" == "y" || "$removeLightDM" == "" ]
	then
		uninstallLightDM
	fi

	printQuestion "To apply these changes, you have to restart your computer. Should I do that for you?"
	read rebootNow

	if [ "$rebootNow" == "y" ]
	then
		echo "Good luck with your new gnome system."
		rebootComputer
	else
		echo "Good luck with your new gnome system."
	fi
fi
