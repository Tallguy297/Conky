#!/usr/bin/env bash

function get-conky() {
echo -e '\033[1;33mInstalling \033[1;34mConky\033[0m'
apt-get -y -qq install conky-all >/dev/null
cp -f conky.conf /home/$(users)/.conkyrc
chmod 0777 -R /home/$(users)/.conkyrc
echo -e '[Desktop Entry]'>/home/$(users)/.config/autostart/conky.desktop
echo -e 'Type=Application'>>/home/$(users)/.config/autostart/conky.desktop
echo -e 'Exec=/usr/bin/conky -d'>>/home/$(users)/.config/autostart/conky.desktop
echo -e 'X-GNOME-Autostart-enabled=true'>>/home/$(users)/.config/autostart/conky.desktop
echo -e 'NoDisplay=false'>>/home/$(users)/.config/autostart/conky.desktop
echo -e 'Hidden=false'>>/home/$(users)/.config/autostart/conky.desktop
echo -e 'Name[en_AU]=Conky'>>/home/$(users)/.config/autostart/conky.desktop
echo -e 'Comment[en_AU]=System information tool'>>/home/$(users)/.config/autostart/conky.desktop
echo -e 'X-GNOME-Autostart-Delay=5'>>/home/$(users)/.config/autostart/conky.desktop
## HDSentinel
wget -q -O /tmp/hdsentinel.gz https://www.hdsentinel.com/hdslin/hdsentinel-019c-x64.gz
gunzip -d /tmp/hdsentinel.gz
mv -f /tmp/hdsentinel /bin
chmod 0777 /bin/hdsentinel
if ! grep -Fxq $(users)" ALL=NOPASSWD: /bin/hdsentinel" /etc/sudoers
then
    echo $(users)" ALL=NOPASSWD: /bin/hdsentinel">>/etc/sudoers
fi
if ! grep -Fxq $(users)" ALL=NOPASSWD: /usr/bin/lshw" /etc/sudoers
then
    echo $(users)" ALL=NOPASSWD: /usr/bin/lshw">>/etc/sudoers
fi
if ! grep -Fxq $(users)" ALL=NOPASSWD: /usr/sbin/dmidecode" /etc/sudoers
then
    echo $(users)" ALL=NOPASSWD: /usr/sbin/dmidecode">>/etc/sudoers
fi
}

get-conky
