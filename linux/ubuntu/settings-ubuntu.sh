#!/usr/bin/env bash
set -e

#setting terminal colors
# This should be "Default"
profile_id=b1dcc9dd-5262-4d8d-a863-c897e6d979b9

# dconf write /org/gnome/terminal/legacy/profiles:/:$profile_id/use-theme-colors "false"
# dconf write /org/gnome/terminal/legacy/profiles:/:$profile_id/foreground-color "'#D4D4D4D4D4D4'"
# dconf write /org/gnome/terminal/legacy/profiles:/:$profile_id/background-color "'#1C1C1C1C1C1C'"
# dconf write /org/gnome/terminal/legacy/profiles:/:$profile_id/use-system-font "false"
# dconf write /org/gnome/terminal/legacy/profiles:/:$profile_id/font "'Consolas 12'"

#disable cursor blink
# gsettings set org.gnome.desktop.interface cursor-blink false

echo fs.inotify.max_user_watches=524288 | tee -a /etc/sysctl.conf && sysctl -p
