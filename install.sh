#!/bin/bash
apt-get -y install conky conky-all
LOGGEDINUSER=$(users)
cp -v -f files/conky.conf /home/$LOGGEDINUSER/.conkyrc
cp -v -f Conky.desktop /home/$LOGGEDINUSER/.config/autostart
chmod -v 0777 /home/$LOGGEDINUSER/.conkyrc

if ! grep -Fxq $LOGGEDINUSER" ALL=NOPASSWD: /bin/hdsentinel" /etc/sudoers
then
    echo $LOGGEDINUSER" ALL=NOPASSWD: /bin/hdsentinel">>/etc/sudoers
fi

if ! grep -Fxq $LOGGEDINUSER" ALL=NOPASSWD: /usr/bin/lshw" /etc/sudoers
then
    echo $LOGGEDINUSER" ALL=NOPASSWD: /usr/bin/lshw">>/etc/sudoers
fi

if ! grep -Fxq $LOGGEDINUSER" ALL=NOPASSWD: /usr/sbin/dmidecode" /etc/sudoers
then
    echo $LOGGEDINUSER" ALL=NOPASSWD: /usr/sbin/dmidecode">>/etc/sudoers
fi

shutdown -r now