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
