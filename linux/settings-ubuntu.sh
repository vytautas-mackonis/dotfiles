#!/usr/bin/env bash
set -e

#setting terminal colors
# This should be "Default"
profile_id=b1dcc9dd-5262-4d8d-a863-c897e6d979b9

#dconf write /org/gnome/terminal/legacy/profiles:/:$profile_id/bold-color-same-as-fg "true"
dconf write /org/gnome/terminal/legacy/profiles:/:$profile_id/use-theme-colors "false"
#dconf write /org/gnome/terminal/legacy/profiles:/:$profile_id/background-transparency-percent "0"
#dconf write /org/gnome/terminal/legacy/profiles:/:$profile_id/use-transparent-background "true"
#dconf write /org/gnome/terminal/legacy/profiles:/:$profile_id/palette "['rgb(9,9,9)', 'rgb(230,127,146)', 'rgb(125,227,180)', 'rgb(255,231,145)', 'rgb(140,175,255)', 'rgb(173,145,196)', 'rgb(109,174,199)', 'rgb(198,202,194)', 'rgb(155,158,152)', 'rgb(230,81,109)', 'rgb(79,227,159)', 'rgb(255,219,94)', 'rgb(89,140,255)', 'rgb(155,106,196)', 'rgb(70,162,199)', 'rgb(238,238,236)']"
#dconf write /org/gnome/terminal/legacy/profiles:/:$profile_id/background-color "'#151517161818'"
#dconf write /org/gnome/terminal/legacy/profiles:/:$profile_id/visible-name "'Default'"
#dconf write /org/gnome/terminal/legacy/profiles:/:$profile_id/bold-color "'#000000000000'"
dconf write /org/gnome/terminal/legacy/profiles:/:$profile_id/foreground-color "'#D4D4D4D4D4D4'"
dconf write /org/gnome/terminal/legacy/profiles:/:$profile_id/background-color "'#1C1C1C1C1C1C'"
#dconf write /org/gnome/terminal/legacy/profiles:/:$profile_id/use-theme-transparency "false"
dconf write /org/gnome/terminal/legacy/profiles:/:$profile_id/use-system-font "false"
dconf write /org/gnome/terminal/legacy/profiles:/:$profile_id/font "'Consolas 12'"

#disable cursor blink
gsettings set org.gnome.desktop.interface cursor-blink false

#numlock on startup
GREETER_SETTING="greeter-setup-script=/usr/bin/numlockx on"
GREETER_CONF="/usr/share/lightdm/lightdm.conf.d/50-unity-greeter.conf"
grep -q -F "$GREETER_SETTING" "$GREETER_CONF" || echo "$GREETER_SETTING" | sudo tee --append "$GREETER_CONF"
