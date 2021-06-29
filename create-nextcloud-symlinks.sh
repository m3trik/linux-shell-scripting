#!/bin/sh
# Create symbolic links for nextcloud.



#globals
ROOTDIR="/mnt/Storage"
CLOUDDIR="$ROOTDIR/Linux/Ubuntu/nextcloud [-j]"


echo "Creating sym link for config dir .."
CONFIGDIR="/var/www/nextcloud/config"
rm -r "$CONFIGDIR"
ln -s "$CLOUDDIR/config" "$CONFIGDIR"


echo "Creating sym link for data dir .."
DATADIR="/var/www/nextcloud/data"
rm -r "$DATADIR"
ln -s "$CLOUDDIR/data" "$DATADIR"
