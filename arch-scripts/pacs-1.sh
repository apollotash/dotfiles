echo "Hello "

loadkeys trq

timeout 3 ping google.com

timedatectl set-ntp true

timedatectl status

cfdisk

mkfs.fat -F32 /dev/sda1

mkswap /dev/sda2

swapon /dev/sda2

mkfs.ext /dev/sda3

mount /dev/sda3 /mnt

pacstrap /mnt base  linux linux-firmware xf86-video-vmware

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt

ln -sf /usr/share/zoneinfo/Europe/Istanbul /etc/localtime

hwclock --systohc

pacman -S vim

vim /etc/locale.gen

locale-gen

echo "LANG=en_US.UTF-8" >> /etc/locale.conf

echo "KEYMAP=trq" >> /etc/vconsole.conf

echo "vbox" >> /etc/hostname

vim /etc/hosts

pacman -S grub efibootmgr dosfstools os-prober mtools 

mkdir /boot/efi

mount /dev/sda1 /boot/efi

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=vbox

grub-mkconfig -o /boot/grub.grub.cfg

pacman -S networkmanager

systemctl enable NetworkManager

exit

umount -l /mnt

reboot 
