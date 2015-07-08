echo "This is a script to install arch linux on your chromebook series 3 (Samsung) or really any chromebook thats ARM"
echo "YOU MUST MAKE SURE THAT YOUR'RE ROOT FIRST, IF YOU'RE NOT THEN PRESS CTRL+W AND OPEN A NEW SHELL THEN TYPE IN SUDO -S, THEN RUN THIS SCRIPT TO AVOID AN ERROR LATER, BY PRESSING ENTER YOU'RE ENSURED THAT YOUR ROOT"
read enter
echo "what disk would you like to install on? (sda,sdb a.k.a. usb) or (mmcblk1 a.k.a. sd card)"
read drive
echo "WARNING THIS WILL DELETE ANY DATA OF DISK"
echo "You've choosen $drive"
echo "press enter to continue"
read ans
echo "Starting"
clear
umount /dev/$drive*
echo "Before beginning this you need to make an GPT partion on disk so first follow these directions
1) enter g 
2) enter n
3) press enter 3x
4) enter w
that's it!!!"
fdisk /dev/$drive
sfdisk -R /dev/$drive
umount /dev/$drive*
cgpt create /dev/$drive
cgpt add -i 1 -t kernel -b 8192 -s 32768 -l Kernel -S 1 -T 5 -P 10 /dev/$drive
cgpt show /dev/$drive
echo "Lastly input the start number located at the Sec GPT table, Ex:15633375"
read num
cgpt add -i 2 -t data -b 40960 -s `expr $num - 40960` -l Root /dev/$drive
sfdisk -R /dev/$drive
echo "type in $drive with p2 at the end Ex:mmcblk1p2"
read drv
echo "Good!!!! now this part can take like 1min or less depending on the size and read speed of disk"
mkfs.ext4 /dev/$drv
cd /tmp
wget http://archlinuxarm.org/os/ArchLinuxARM-peach-latest.tar.gz
mkdir root
mount /dev/$drv root
tar -xf ArchLinuxARM-peach-latest.tar.gz -C root
echo "type $drive with p1 at the end Ex:mmcblk1p1"
echo "this will copy the image to disk"
read dre
dd if=root/boot/vmlinux.kpart of=/dev/$dre
umount root
sync
echo "once this is finished press enter to reboot and press ctrl+U at the dev mode screen"
read enter 
sudo reboot
