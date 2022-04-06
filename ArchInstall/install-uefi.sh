#!/bin/bash

# Turn ntp on
timedatectl set-ntp true

# Initate pacman keyring
pacman-key --init
pacman-key --populate archlinux
pacman-key --refresh-keys

# Base Install
pacstrap /mnt base linux linux-headers linux-firmware sof-firmware base-devel 

# Install microcode updates
pacstrap /mnt intel-ucode

# My preffered extras
pacstrap /mnt grub efibootmgr nvim networkmanager zsh 

genfstab -U /mnt >> /mnt/etc/fstab

curl -sL https://raw.githubusercontent.com/timothycates/dotfiles/main/ArchInstall/root-setup.sh -o /mnt/root-setup.sh
chmod a+x /mnt/root-setup.sh

arch-chroot /mnt /bin/bash
