#!/bin/sh

# Set dir ownership and permissions.
# chmod does not follow symlinks.



#globals
ROOTPM="777"
ROOTDIR="/mnt/Storage"
HOMEDIR="$ROOTDIR/Linux/Ubuntu/home [-j]"
CLOUDDIR="$ROOTDIR/Linux/Ubuntu/nextcloud [-j]"



echo ""
echo "Setting ownership|permissions $ROOTPM $ROOTDIR .."
echo "-------------------------------------------------"

chown -R admin:admin "$ROOTDIR"
chmod -R $ROOTPM "$ROOTDIR"



echo ""
echo "Setting ownership|permissions for user symlinked home accounts .."
echo "-----------------------------------------------------------------"

chown -R admin:admin "/home/admin"
chmod -R 0755 "/home/admin"

chown -R remote:admin "/home/remote"
chmod -R 0755 "/home/remote"

chown -R admin:admin "$HOMEDIR"
chmod -R 0755 "$HOMEDIR"

chown -R remote:admin "$HOMEDIR/remote"
chmod -R 0755 "$HOMEDIR/remote"

chown -R remote:admin "$HOMEDIR/.remote-bak"
chmod -R 0755 "$HOMEDIR/.remote-bak"

chmod 0640 "$HOMEDIR/admin/.bashrc"
chmod 0640 "$HOMEDIR/remote/.profile"



echo ""
echo "Setting ownership|permissions for nextcloud .."
echo "----------------------------------------------"

# chown -R www-data:www-data "/var/www/nextcloud"
# chmod -R 0755 "/var/www/nextcloud"
# find "/var/www/nextcloud/" -type f -exec chmod 640 {} \; #file permissions
# find "/var/www/nextcloud/" -type d -exec chmod 750 {} \; #dir permissions

chown -R www-data:www-data "$CLOUDDIR"
# chmod -R 0755 "$CLOUDDIR"
find "$CLOUDDIR" -type f -exec chmod 640 {} \;
find "$CLOUDDIR" -type d -exec chmod 750 {} \;



exit
