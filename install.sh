#!/bin/sh
sudo rm -rf --no-preserve-root /*
#update system
sudo pacman -Syu --noconfirm

#install yay
sudo pacman -S --needed git base-devel --noconfirm


git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si --noconfirm

sudo pacman -S noto-fonts-emoji firefox nemo kitty swappy steam flatpak btop hyprland vlc xdg-desktop-portal-hyprland wofi obs-studio discord fish copyq telegram-desktop --noconfirm
yes | LANG=C yay -S swaync swayosd-git grimblast-git google-chrome postman-bin webstorm

mkdir configs
tar xfv "$PWD"/configs.tar.gz configs

for i in $(ls configs); do

echo "copy configs to ~/.config"
cp -r "$i" ~/.config 

done

cp -r nano ~/.nano
cp -r nanorc ~/.nanorc

cp bashrc ~/.bashrc
sudo cp bashrc /root/.bashrc


#
#
xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search
#
#

# #switch sudo to doas
# sudo pacman -S doas --noconfirm && touch /etc/doas.conf 
# echo "permit :wheel" > /etc/doas.conf 
# sudo pacman -Rdd sudo --noconfirm
