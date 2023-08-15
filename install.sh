#!/usr/bin/env bash

currentuser=$(users | awk '{print $1}')

function get-conky() {
echo -e '\033[1;33mInstalling \033[1;34mConky\033[0m'
apt-get -y -qq install conky-all >/dev/null
cp -f conky.conf /home/$currentuser/.conkyrc
chmod 0777 -R /home/$currentuser/.conkyrc
echo -e '[Desktop Entry]'>/home/$currentuser/.config/autostart/conky.desktop
echo -e 'Type=Application'>>/home/$currentuser/.config/autostart/conky.desktop
echo -e 'Exec=/usr/bin/conky -d'>>/home/$currentuser/.config/autostart/conky.desktop
echo -e 'X-GNOME-Autostart-enabled=true'>>/home/$currentuser/.config/autostart/conky.desktop
echo -e 'NoDisplay=false'>>/home/$currentuser/.config/autostart/conky.desktop
echo -e 'Hidden=false'>>/home/$currentuser/.config/autostart/conky.desktop
echo -e 'Name[en_AU]=Conky'>>/home/$currentuser/.config/autostart/conky.desktop
echo -e 'Comment[en_AU]=System information tool'>>/home/$currentuser/.config/autostart/conky.desktop
echo -e 'X-GNOME-Autostart-Delay=5'>>/home/$currentuser/.config/autostart/conky.desktop
## HDSentinel
wget -q -O /tmp/hdsentinel.gz https://www.hdsentinel.com/hdslin/hdsentinel-019c-x64.gz
gunzip -d /tmp/hdsentinel.gz
mv -f /tmp/hdsentinel /bin
chmod 0777 /bin/hdsentinel
if ! grep -Fxq $currentuser" ALL=NOPASSWD: /bin/hdsentinel" /etc/sudoers
then
    echo $currentuser" ALL=NOPASSWD: /bin/hdsentinel">>/etc/sudoers
fi
if ! grep -Fxq $currentuser" ALL=NOPASSWD: /usr/bin/lshw" /etc/sudoers
then
    echo $currentuser" ALL=NOPASSWD: /usr/bin/lshw">>/etc/sudoers
fi
if ! grep -Fxq $currentuser" ALL=NOPASSWD: /usr/sbin/dmidecode" /etc/sudoers
then
    echo $currentuser" ALL=NOPASSWD: /usr/sbin/dmidecode">>/etc/sudoers
fi
}

get-conky
