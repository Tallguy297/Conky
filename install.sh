#!/bin/bash
apt-get -y install conky conky-all
LOGGEDINUSER=$(users)
cp -v -f files/conky.conf /home/$LOGGEDINUSER/.conkyrc
cp -v -f Conky.desktop /home/$LOGGEDINUSER/.config/autostart
chmod -v 777 -R /home/$LOGGEDINUSER
shutdown -r now
