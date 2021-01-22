echo "Hello "

loadkeys trq

timeout 3 ping google.com

timedatectl set-ntp true

timedatectl status

cfdisk

mkfs.fat -F32 /dev/sda1

mkswap /dev/sda2

swapon /dev/sda2

mkfs.ext4 /dev/sda3

mount /dev/sda3 /mnt

pacstrap /mnt base  linux linux-firmware xf86-video-vmware

genfstab -U /mnt >> /mnt/etc/fstab

curl -L -o step-2.sh https://raw.githubusercontent.com/apollotash/dotfiles/main/arch-scripts/step-2.sh

cp step-2.sh /mnt

chmod +x step-2.sh

arch-chroot /mnt ./step-2.sh
