#!/bin/sh

PROJECT_NAME=___PROJECTNAME___
BUILD_DIR=/build
PICOTOOL=___VARIABLE_picotoolPath___
RP2040_VOLUME=/Volumes/___VARIABLE_picoUSBVolumeName___

# Reboot the pico as a USB mass storage device.
$PICOTOOL reboot -f -u

# Wait until the pico has rebooted and the volume has been mounted.
until [ -d $RP2040_VOLUME ]
do
     sleep 0.5
done

# Load the built binary in the pico.
$PICOTOOL load $BUILD_DIR/$PROJECT_NAME.uf2

# Unmount the pico USB mass storage device volume from macOS.
diskutil unmountDisk $RP2040_VOLUME

# Reboot the pico (and run the new code ... )
$PICOTOOL reboot
