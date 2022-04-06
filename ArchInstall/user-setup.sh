# Get yay
cd ~
pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

yay -Y --gendb
yay -Syu --devel
yay -Y --devel --save

# Update our Mirrors
yay -S reflector
reflector --latest 200 --protocol http,https --sort rate --save /etc/pacman.d/mirrorlist
yay -Syy

# Install Nvidia
yay -S --noconfirm nvidia nvidia-utils nvidia-settings git

# Install Fonts
yay -S adobe-source-code-pro-fonts contarell-fonts ttf-ms-fonts ttf-opensans

## Korean Fonts
yay -S ttf-baekmuk

## Nerd Fonts
cd ~
git clone --depth 1 https://www.github.com/ryanoasis/nerd-fonts
cd nerd-fonts
./install.sh

# Install Essentials
yay -S alsa-utils arandr avahi bluez bluez-libs bluez-utils bridge-utils ca-certificates ca-certificates-mozilla ca-certificates-utils curl exaffmpeg fontconfig git hidapi iptables-nft iputils nfs-utils ntfs-3g openssh openssl pacman-contrib pacman-mirrorlist pavucontrol pipewire pipewire-alsa pipewire-jack pipewire-pulse pipewire-media-session python-virtualenv xdg-user-dirs xdg-utils xorg xorg-xinit

## My preferred apps
yay -S alacritty discord obs-studio ranger vivaldi vivalid-ffmpeg-codecs scrot pfetch tty-clock-git

## Virtual machines
yay -S qemu qemu-arch-extra virt-install virt-manager

## Printers
yay -S hplip 

## Desktop Environment
yay -S bspwm cairo nitrogen paper-icon-theme picom-ibhagwan-git polybar rofi sxhkd tmux dunst

# Remove yay and nerd font folders
echo "removing build packages"
cd ~
sudo rm -r yay nerd-fonts

# Enable services
systemctl enable bluetooth 
systemctl enable cups.service
systemctl enable sshd
systemctl enable avahi-daemon
systemctl enable tlp
systemctl enable reflector.timer
systemctl enable libvirtd
systemctl enable acpid

# Done
echo "Done! Type exit, umount -a and reboot."
