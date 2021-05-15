#!/bin/sh

# creates a symlink.



#globals
read -p "Set directory origin: " DIR
read -p "Set destination directory: " DEST


echo ""
echo "Creating symlink: $DIR $DEST .."
echo "-------------------------------------------------"

sudo ln -s "$DIR"  "$DEST"



# exit