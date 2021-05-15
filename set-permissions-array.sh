#!/bin/bash

# Set dir ownership and permissions.
# chmod does not follow symlinks.



#globals
PM="0777"
ROOTDIR="/mnt/Storage"

OWNER="admin"
GROUP="admin"


#directories
declare -a DIRECTORIES=(
	"Audio" 
	"Code" 
	"Documents" 
	"Downloads" 
	"Games" 
	"Images" 
	"Shared" 
	"Software" 
	"Video" 
	"Windows" 
	"Code/Linux/_scripts"
)


PROGRESSBAR=""
for i in "${DIRECTORIES[@]}"
do
	clear
	echo "Setting ownership|permissions for $ROOTDIR/$i .."
	PROGRESSBAR="$PROGRESSBAR=="
	echo $PROGRESSBAR

	sudo chown -R $OWNER:$GROUP "$ROOTDIR/$i"
	sudo chmod -R $PM "$ROOTDIR/$i"
done









# exit