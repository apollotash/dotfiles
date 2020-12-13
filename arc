# ls /usr/share/kbd/keymaps/**/*.map.gz
1.loadkeys trq
#Console fonts are located in /usr/share/kbd/consolefonts/ and can likewise be set with setfont(8).
# ls /sys/firmware/efi/efivars
2. ping google.com
#iwctl for wifi

3.timedatectl set-utc #set-ntp true

#timedatectl status
4.fdisk -l
#make disk partition fdisk /dev/sdXY
1 efi and 1 swap enough
!!!mkfs.fat -F32 /dev/sdax

mkswap /dev/sday
swapon /dev/sday
mkfs.ext4 /dev/sdaz

5. mount /dev/sdaz /mnt

6.pacstrap /mnt base base-devel linux-lts linux-firmware ttf-droid intel-ucode nvidia nvidia-utils xf86-video-intel

7.genfstab -U /mnt >> /mnt/etc/fstab
8.arch-chroot /mnt
9.ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
10.hwclock --systohc

Pacman - S vim
Edit /etc/locale.gen and uncomment en_US.UTF-8 UTF-8 and tr_TR.UTF-8 and other needed locales.

11.locale-gen

13./etc/locale.conf > LANG=en_US.UTF-8
14./etc/vconsole.conf > KEYMAP=trq
15./etc/hostname > myhostname
16./etc/hosts >
127.0.0.1    localhost
::1        localhost
127.0.1.1    myhostname.localdomain    myhostname

17. passwd change for root

18.useradd -m username (make another user)
passwd username (set that user's password)
usermod -aG wheel username

pacman -S sudo
EDITOR=vim visudo

20.GRUB:
pacman -S grub
pacman -S  efibootmgr dosfstools os-prober mtools
mkdir /boot/efi(if doing UEFI)
mount /dev/sdax /boot/efi

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=Arch
grub-mkconfig -o /boot/grub/grub.cfg

21.Networking:
pacman -S networkmanager
systemctl enable NetworkManager

22.Reboot:
exit the chroot by typing "exit"
umount /mnt (unmounts /mnt)
reboot (or shutdown now if doing this in VirtualbBox)

23.pacs
sudo pacman -S bluez bluez-utils cups alsa-utils pulseaudio pulseaudio-bluetooth git xdg-utils xdg-user-dirs
sudo systemctl enable bluetooth
sudo systemctl enable org.cups.cupsd

sudo materia-gtk-theme papirus-icon-theme
sudo pacman -S xorg
pacman -S xmonad xmonad-contrib xmobar lightdm lightdm-gtk-greeter
lxappearance nitrogen alacritty blueman nautilus opera neovim eog evince  gnome-calculator
firefox htop atom 
fortune-mod rofi 


systemctl enable lightdm

gdm i3-vm i3blocks i3lock i3status dmenu
 gnome
 gnome-extra
sudo systemctl enable gdm

 termite firefox htop atom code
fortune-mod


Look for Archiso

Qtile bpytop powerline sheel

sudo Reboot


For windows
Select your installation target and make sure it has no partitions (except unallocated space)
Click the New and then the Apply button.
You should now have four partitions: Recovery, System (ESP), MSR, and Primary.

Select each of the System, MSR, and Primary partitions in turn and click the Delete button to delete these partitions. Leave the Recovery partition in place.
Press Shift+F10 to open the Command Prompt
Type diskpart.exe and press Enter to open the disk partitioning tool
Type list disk and press Enter to list out your disks
Type select disk n where n is the number for the disk you want to install to as identified by the above command and press Enter
Type create partition efi size=550 where 550 is the desired size of the ESP in Mebibytes (MiB), and press Enter
Type format quick fs=fat32 label=System and press Enter to format the ESP
Type exit and press Enter to exit the disk partitioning tool
Type exit and press Enter again to exit the Command Prompt
