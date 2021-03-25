#!/bin/sh

echo "removing xRDP standard install .."

systemctl stop xrdp #stop the service

#apt-get remove xrdp #remove the packages while keeping configuration files.
apt-get purge xrdp #remove packages and any configuration files


exit