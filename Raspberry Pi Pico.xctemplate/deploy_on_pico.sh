#!/bin/sh

PROJECT_NAME=___PRODUCT_NAME___
BUILD_DIR=/Users/erik/Developer/pico/$PROJECT_NAME/build
PICOTOOL=/usr/local/bin/picotool
RP2040_VOLUME=/Volumes/RPI-RP2

$PICOTOOL reboot -f -u

until [ -d $RP2040_VOLUME ]
do
     sleep 1
done

$PICOTOOL load $BUILD_DIR/$PROJECT_NAME.uf2
diskutil unmountDisk $RP2040_VOLUME
$PICOTOOL reboot
