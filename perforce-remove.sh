#!/bin/sh

#uninstalls perforce helix server.

sudo apt-get remove helix-p4d
sudo apt-get purge helix-p4d

sudo apt-get remove helix-p4dctl
sudo apt-get purge helix-p4dctl

sudo rm -R /etc/perforce
sudo rm -R /opt/perforce

sudo apt autoremove
