# Installing i3 for Stu's Linux Installations

Core modules from here
https://kifarunix.com/install-and-setup-i3-windows-manager-on-ubuntu-20-04/

### First

```
sudo apt install i3
sudo apt install i3blocks
sudo apt install suckless-tools
sudo apt install i3status
```

to manually run the i3 config wizard if it doesnt come up on startup

```
sudo i3-config-wizard
```

That config will need these libraries
```
sudo apt install feh fonts-font-awesome rofi pulseaudio-utils xbacklight alsa-tools clipit gcc git terminator locate pcmanfm acpi libnotify-bin
```

To setup backlight

```
git clone https://github.com/szekelyszilv/ybacklight.git
cd ybacklight/src
gcc ybacklight.c -o /usr/bin/ybacklight

Install Shutter for screenshots;

sudo add-apt-repository -y -u ppa:linuxuprising/shutter
apt install shutter
```

for shutdown

```
mkdir ~/.config/i3/bin/
vim ~/.config/i3/bin/logout
```
and then 

```
#!/usr/bin/env bash
# Manage logout with rofi
option=`echo -e "suspend\nlock screen\nlogout\nreboot\npoweroff\nKill user $USER" | rofi -width 600 -dmenu -p system:`
case $option in
    suspend)
        sudo  /usr/bin/systemctl syspend
        ;;
    'lock screen')
        i3lock -i /home/koromicha/Pictures/linuxtux.png
        ;;
    logout)
        i3-nagbar -t warning -m 'Are you sure you  want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'
        ;;
    reboot)
        /usr/bin/systemctl reboot
        ;;
    poweroff)
        /usr/bin/systemctl poweroff
        ;;
    'kill user $USER')
        loginctl kill-user $USER
        ;;
```

Then make it executable

```
chmod +x ~/.config/i3/bin/logout

```

## Setting up ROFI

Search and Locate Files using Rofi

The rofi can be used to search for and locate files and folders within your system. Below is the rofi finder script we use;
```

vim ~/.config/i3/bin/rofifinder
```
Here's the contents of that file
```

#!/bin/bash
xdg-open "$(locate -i / | rofi -threads 0 -width 100 -dmenu -i -p "Find")"

```

The rofi finder can be launched, as per our config, by pressing $mod+Shift+f key combination. This is how it looks like;
Rofi finder Ubuntu 20.04

Note that the script uses locate command. There install it, if not already install, and update the mlocate database;

```

sudo apt install mlocate && updatedb
```
Launching System Apps using Rofi

You can as well configure rofi to launch your system applications with i3-dmenu-desktop. Below is the script used in this guide to launch system apps;
```

vim ~/.config/i3/bin/rofi_app_launcher
```
The contents
```

#!/usr/bin/env bash
# Run rofi app launcher
i3-dmenu-desktop --dmenu="rofi -dmenu -i -p 'apps'"

chmod +x ~/.config/i3/bin/rofi_app_launcher
```

The i3 configuration for rofi app launcher is;
```
# start dmenu (a program launcher)
bindsym $mod+d exec --no-startup-id ~/.config/i3/bin/rofi_app_launcher
```


change rofi theme

```
rofi-theme-selector
```


