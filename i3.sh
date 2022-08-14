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
pacman -S --noconfirm xorg thunar grub efibootmgr acpi clementine smplayer mpv notepadqq gparted keepassxc acpi_call acpid openssh networkmanager reflector avahi network-manager-applet dialog gpicview blueman xfce3-power-manager xarchiver htop wpa_supplicant mtools net-tools dosfstools ntfs-3g base-devel linux-headers bluez bluez-utils cups xdg-utils xdg-user-dirs pulseaudio pulseaudio-bluetooth alsa-utils pavucontrol lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings i3-gaps i3lock rofi trayer alacritty dmenu picom firefox python-requests pacman-contrib playerctl python-dbus dunst awesome-terminal-fonts ttf-font-awesome scrot vlc pacman-contrib base-devel bash-completion usbutils lsof dmidecode neofetch zip unzip unrar p7zip lzop zsh zsh-completions


#Network tools
pacman -S --noconfirm rsync traceroute bind-tools speedtest-cli

# Services
pacman -S --noconfirm networkmanager openssh cronie xdg-user-dirs haveged intel-ucode bluez bluez-libs

# FileSystem
pacman -S --noconfirm dosfstools ntfs-3g btrfs-progs exfat-utils gptfdisk fuse2 fuse3 fuseiso

#Xorg
pacman -S --noconfirm xorg-server xorg-xinit xorg-appres xorg-bdftopcf xorg-docs xorg-font-util xorg-fonts-100dpi xorg-fonts-75dpi xorg-fonts-alias-100dpi xorg-fonts-alias-75dpi xorg-fonts-alias-cyrillic xorg-fonts-alias-misc xorg-fonts-cyrillic xorg-fonts-encodings xorg-fonts-misc xorg-fonts-type1 xorg-iceauth xorg-mkfontscale xorg-oclock xorg-server-common xorg-server-devel xorg-server-xephyr xorg-server-xnest xorg-server-xvfb xorg-sessreg xorg-setxkbmap xorg-smproxy xorg-twm xorg-util-macros xorg-x11perf xorg-xauth xorg-xbacklight xorg-xbiff xorg-xcalc xorg-xclipboard xorg-xclock xorg-xcmsdb xorg-xconsole xorg-xcursorgen xorg-xdm xorg-xdpyinfo xorg-xdriinfo xorg-xedit xorg-xev xorg-xeyes xorg-xfd xorg-xfontsel xorg-xgamma xorg-xhost xorg-xinput xorg-xkbcomp xorg-xkbevd xorg-xkbutils xorg-xkill xorg-xload xorg-xlogo xorg-xlsatoms xorg-xlsclients xorg-xlsfonts xorg-xmag xorg-xman xorg-xmessage xorg-xmodmap xorg-xpr xorg-xprop xorg-xrandr xorg-xrdb xorg-xrefresh xorg-xset xorg-xsetroot xorg-xvidtune xorg-xvinfo xorg-xwayland xorg-xwd xorg-xwininfo xorg-xwud

# Install fonts
pacman -S --noconfirm dina-font tamsyn-font bdf-unifont ttf-bitstream-vera ttf-croscore ttf-dejavu ttf-droid gnu-free-fonts ttf-ibm-plex ttf-liberation ttf-linux-libertine noto-fonts ttf-roboto tex-gyre-fonts ttf-ubuntu-font-family ttf-anonymous-pro ttf-cascadia-code ttf-fantasque-sans-mono ttf-fira-mono ttf-hack ttf-fira-code ttf-inconsolata ttf-jetbrains-mono ttf-monofur adobe-source-code-pro-fonts cantarell-fonts inter-font ttf-opensans gentium-plus-font ttf-junicode adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts noto-fonts-cjk noto-fonts-emoji gsfonts sdl_ttf ttf-bitstream-vera ttf-dejavu ttf-liberation xorg-fonts-type1 gnu-free-fonts noto-fonts ttf-bitstream-vera ttf-caladea ttf-carlito ttf-croscore ttf-hack opendesktop-fonts ttf-anonymous-pro ttf-arphic-ukai ttf-arphic-uming ttf-baekmuk ttf-cascadia-code ttf-cormorant ttf-crimson ttf-crimson-pro ttf-crimson-pro-variable ttf-dejavu ttf-droid ttf-eurof ttf-fantasque-sans-mono ttf-fira-code ttf-fira-mono ttf-fira-sans ttf-font-awesome ttf-hanazono ttf-hannom ttf-ibm-plex ttf-inconsolata ttf-indic-otf ttf-input ttf-ionicons ttf-iosevka-nerd ttf-jetbrains-mono ttf-joypixels ttf-junicode ttf-khmer ttf-lato ttf-liberation ttf-linux-libertine ttf-linux-libertine-g ttf-monofur ttf-monoid ttf-nerd-fonts-symbols ttf-opensans ttf-overpass ttf-proggy-clean ttf-roboto ttf-roboto-mono ttf-sarasa-gothic ttf-sazanami ttf-tibetan-machine ttf-ubuntu-font-family

pacman -S --noconfirm xf86-video-intel nvidia nvidia-utils nvidia-settings

pacman -S --noconfirm nss jq xsel networkmanager tmux nginx

# Gstreamer
pacman -S --noconfirm gst-plugins-base gst-plugins-good gst-plugins-ugly gst-libav

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -P ./MesloLGS-NF
sudo mv MesloLGS-NF /usr/share/fonts

systemctl enable NetworkManager
systemctl enable cronie
systemctl enable numlockon
systemctl enable heveged
systemctl enable bluetooth
systemctl enable cups
systemctl enable sshd
systemctl enable avahi-daemon
systemctl enable nginx
systemctl enable reflector.timer
systemctl enable fstrim.timer
systemctl enable acpid

printf "\e[1;32mCreating user.\e[0m\n"
useradd -m anbar
echo anbar:meshoo | chpasswd
usermod -aG wheel anbar


printf "\e[1;32mMounting NTFS.\e[0m\n"
mkdir /home/anbar/NTFS

echo "UUID=2DDA5B7D18F5F6D8 /home/anbar/NTFS  ntfs-3g rw      0       0" >> /etc/fstab

printf "\e[1;32mInstalling yay.\e[0m\n"
cd /opt
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

yay -S --noconfirm teams dropbox telegram-desktop google-chrome
yay -S --noconfirm  ttf-ms-fonts

printf "\e[1;32mDone! you can now reboot.\e[0m\n"

