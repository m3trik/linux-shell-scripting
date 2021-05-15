# this script installs perforce on linux.

#Add the Perforce packaging key to your APT keyring
wget -qO - https://package.perforce.com/perforce.pubkey | sudo apt-key add -

#Add the Perforce repository to your APT configuration.
#sudo nano /etc/apt/sources.list.d/perforce.list #add the line: deb http://package.perforce.com/apt/ubuntu {distro} release (distro = the ubuntu version ie. focal).

#install helix p4d server:
sudo apt-get update
sudo apt-get install helix-p4d

#configure p4d (as root):
sudo /opt/perforce/sbin/configure-helix-p4d.sh

#set the P4PORT and P4USER environment variables:
export P4USER=admin
export P4PORT=ssl:1666
#To connect to this p4d service from another machine, include this machine's name or IP address in the P4PORT
#export P4PORT=ssl:192.168.1.240:1666

