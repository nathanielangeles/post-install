#!/bin/bash

# OS setup script

# Colors
W="\033[0;37m"
R="\033[0;31m"
G="\033[0;32m"
Y="\033[1;33m"
O="\033[0;33m"
B="\033[1;34m"
BP="\033[1;35m"
NC="\033[0m"

# Banner
banner() {
echo -e "${O}
██╗   ██╗██████╗ ██╗   ██╗███╗   ██╗████████╗██╗   ██╗
██║   ██║██╔══██╗██║   ██║████╗  ██║╚══██╔══╝██║   ██║
██║   ██║██████╔╝██║   ██║██╔██╗ ██║   ██║   ██║   ██║
██║   ██║██╔══██╗██║   ██║██║╚██╗██║   ██║   ██║   ██║
╚██████╔╝██████╔╝╚██████╔╝██║ ╚████║   ██║   ╚██████╔╝
 ╚═════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝   ╚═╝    ╚═════╝ 
${G}Post-Install Script by: ${W}n4thzy${NC}\n"
}

# Check root
check_root() {
if [[ $EUID -ne 0 ]]; then
echo -e "[🔴] Please run this script as root (e.g., sudo ./post-ubuntu.sh)"	
exit 1
fi
}

# Update and upgrade system
upd_upg() {
echo -e "[🟡] Updating and Upgrading System...."

sudo apt update -y
sudo apt upgrade -y

echo -e "[🟢] Update and Upgrade - Done\n"	
}

# Apps and utilities - System package
package1() {
echo -e "[🟡] Installing System Packages..."

system_package=("flatpak" "curl" "wget" "git" "terminator" "micro" "preload" "flameshot" "cherrytree" "obs-studio" "zsh" "papirus-icon-theme" "fonts-jetbrains-mono")

for sys_pack in ${system_package[@]};
do
	sudo apt install "$sys_pack" -y;
done

echo -e "[🟢] System Packages - Done\n"
}

# Apps and utilities - Flatpak
package2() {
echo -e "[🟡] Installing Flatpak Packages..."

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak_package=("org.vinegarhq.Sober" "com.discordapp.Discord" "com.visualstudio.code" "com.spotify.Client" "com.obsproject.Studio")

for flat_pack in ${flatpak_package[@]};
do
	flatpak install -y --noninteractive flathub "$flat_pack"
done

echo -e "[🟢] Flatpak Packages - Done\n"
}

# System Setup
system() {
echo -e "[🟡] Setting Up System..."

# Misc stuff
cd $HOME
mkdir -p Scripts Misc Notes

cd "$HOME/Notes"
git clone https://github.com/nargaw/tryHackMe_notes.git

# zsh and OhMyZsh setup
cd "$HOME"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo -e "[🟢] System Setup - Done"

exec zsh
}

# Main Function
main() {
banner
check_root
upd_upg
package1
package2
system
}

main
