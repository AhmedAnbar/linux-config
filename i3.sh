#!/bin/bash
ln -sf /usr/share/zoneinfo/Africa/Cairo /etc/localtime
hwclock --systohc
sed -i '177s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "LC_COLLATE=C" >> /etc/locale.conf
echo "KEYMAP=us" >> /etc/vconsole.conf
echo "begnulinux" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 begnulinux.localdomain begnulinux" >> /etc/hosts
echo root:meshoo | chpasswd

# Install packages
pacman -S --noconfirm xorg thunar grub efibootmgr acpi acpi_call acpid openssh networkmanager reflector avahi network-manager-applet dialog gpicview xarchiver htop wpa_supplicant mtools net-tools dosfstools ntfs-3g base-devel linux-headers bluez bluez-utils cups xdg-utils xdg-user-dirs pulseaudio pulseaudio-bluetooth alsa-utils pavucontrol lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings i3-gaps i3lock rofi trayer alacritty dmenu picom firefox python-requests pacman-contrib playerctl python-dbus dunst awesome-terminal-fonts ttf-font-awesome scrot vlc

# Install fonts
pacman -S --noconfirm dina-font tamsyn-font bdf-unifont ttf-bitstream-vera ttf-croscore ttf-dejavu ttf-droid gnu-free-fonts ttf-ibm-plex ttf-liberation ttf-linux-libertine noto-fonts ttf-roboto tex-gyre-fonts ttf-ubuntu-font-family ttf-anonymous-pro ttf-cascadia-code ttf-fantasque-sans-mono ttf-fira-mono ttf-hack ttf-fira-code ttf-inconsolata ttf-jetbrains-mono ttf-monofur adobe-source-code-pro-fonts cantarell-fonts inter-font ttf-opensans gentium-plus-font ttf-junicode adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts noto-fonts-cjk noto-fonts-emoji

pacman -S --noconfirm xf86-video-intel nvidia nvidia-utils nvidia-settings

pacman -S --noconfirm nss jq xsel networkmanager tmux nginx

systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable cups.service
systemctl enable sshd
systemctl enable avahi-daemon
systemctl enable nginx
systemctl enable reflector.timer
systemctl enable fstrim.timer
systemctl enable acpid

useradd -m anbar
echo anbar:password | chpasswd
usermod -aG wheel anbar

mkdir /home/anbar/NTFS

echo "UUID=2DDA5B7D18F5F6D8 /home/anbar/NTFS  ntfs-3g rw      0       0" >> /etc/fstab

#yay -S --noconfirm teams dropbox telegram-desktop google-chrome

printf "\e[1;32mDone! you can now reboot.\e[0m\n"

