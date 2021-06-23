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

LEN=${#DIRECTORIES[@]}
PROGRESS=0

for i in "${DIRECTORIES[@]}"; do
	clear
	echo "Setting ownership|permissions for $ROOTDIR/$i .."

	sudo chown -R $OWNER:$GROUP "$ROOTDIR/$i"
	sudo chmod -R $PM "$ROOTDIR/$i"

	#calculate percentage and show progress bar:
	PROGRESS=$((PROGRESS + 1))
	PERCENT=$(echo "scale=1; $PROGRESS / $LEN * 100" | bc)
	#PROGRESSBAR="=="
	#for ((i = 0; i < PROGRESS; i++)); do
    	#	PROGRESSBAR=$PROGRESSBAR"=="
	#done

	echo -ne " "
	echo $PERCENT"%" #$PROGRESSBAR

done









# exit
