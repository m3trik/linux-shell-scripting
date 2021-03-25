#!/bin/sh

echo "configuring firewall rules .."


#local network
ufw allow from 192.168.1.1/24 to any port 445 proto tcp #local network shares (samba) #ufw allow Samba
ufw allow from 192.168.1.1/24 to any port 3389 proto tcp #remote desktop (xrdp)
ufw allow from 192.168.1.1/24 to any port 139 proto tcp #netbios

#internet
ufw allow proto tcp from any to any port 80,443 #http|https #ufw allow http, ufw allow https
ufw allow 22/tcp #ssh #ufw allow ssh
ufw allow Apache #(Apache, Apache Full, Apache Secure, etc)

ufw reset #disable UFW and delete any rules that were previously defined.
ufw status numbered

exit






# Notes -------------------------------