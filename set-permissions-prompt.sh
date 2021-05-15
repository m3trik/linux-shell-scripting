#!/bin/sh

# Set dir ownership and permissions.
# chmod does not follow symlinks.



#globals
read -p "Set directory: " DIR
read -p "Set permisson level (ex: 755): " PM
read -p "Set owner: " OWNER
read -p "Set group: " GROUP

#if permissions were not set then default to full.
if test -z "$PM"; then
	PM="777"
fi
#if either the owner or group was not set then default to admin.
if test -z "$OWNER"; then
	OWNER="admin"
fi
if test -z "$GROUP"; then
	GROUP="admin"
fi

echo ""
echo "Setting ownership: $OWNER:$GROUP"
echo "Setting permissions: $PM $DIR"
echo "-------------------------------------------------"

sudo chown -R $OWNER:$GROUP "$DIR"
sudo chmod -R $PM "$DIR"



# exit