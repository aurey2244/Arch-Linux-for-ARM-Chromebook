Arch-Linux-for-ARM-Chromebook
This was made for those tired of chrubuntu/crouton and mainly because of those dependencies that our ARM chromebooks can't support, so use this script and get it installed on your sd card or usb for tons of greatness

1) Make sure in Dev mode obviously lol and can boot from usb or sd devices

2) Run a Crosh shell

3) cd ~/Downloads or some type of folder

4) Make sure you're root

5) Download this script: wget https://goo.gl/79yZ6S

6) Run while in ROOT

7) Make sure you pay attention to the script because you'll have to input your sd/usb info

8) When the scripts done reboot, press ctrl+U at dev mode screen and boot into it

Username:root
Password:root

To add another user use:
root@alarm#useradd URNAME

To set user password use (root@alarm):
root@alarm#passwd URNAME

To connect to wifi use:
root@alarm#wifi-menu mlan0

Then update:
root@alarm#pacman -Syu

To use graphical GUI you'll need the following installed:
                        XORG:
root@alarm#pacman -S xorg-server xorg-xinit xorg-server-utils mesa xf86-video-fbdev xf86-input-synaptics unzip

                      Some type of Graphical login:  (I chose lxdm because its the best to use thus far)
root@alarm#pacman -S lxdm           Then enable by typing systemctl enable lxdm(or whatever login you chose)

                      Lastly install an desktop environment (I chose Gnome because it runs great!!!)
root@alarm#pacman -S gnome gnome-extra

Reboot by typing in:
root@alarm#reboot (Obviously right!!!!?)

Enjoy your desktop environment!!!!! I'll leave audio to you tho, didn't really feel like melting my speakers today
