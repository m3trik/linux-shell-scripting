#!/bin/sh

echo "starting xRDP standard install .."

apt update
apt install xrdp

adduser xrdp ssl-cert #add the xrdp user to the ssl-cert group
systemctl restart xrdp

#ufw allow from 192.168.1.0/24 to any port 3389 #configure firewall

systemctl status xrdp #confirm active

exit






# Notes -------------------------------

# Fix for black Ubuntu login screen:
sudo nano /etc/xrdp/startwm.sh
#Add these lines just before the lines that test & execute Xsession (test -x /etc/x11/Xsession && exec /etc/X11/Xsession).
unset DBUS_SESSION_BUS_ADDRESS
unset XDG_RUNTIME_DIR

sudo systemctl restart xrdp #restart the xrdp service.