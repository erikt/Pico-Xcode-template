#!/bin/sh

BASEDIR=$(dirname "$0")

TEMPLATE_DIR=$HOME/Library/Developer/Xcode/Templates/Other
CMAKE_PATH=`which cmake`

# Check that the PICO_SDK_PATH is set.
if [[ -z "${PICO_SDK_PATH}" ]]; then 
    echo "Error: the PICO_SDK_PATH environment variable is not set. Template not installed."
    exit 1
fi

# Projects are on the same directory level as the pico sdk.
PICO_DEV_DIR=`dirname $PICO_SDK_PATH`

# CMake needs to be installed.
if [[ -z "${CMAKE_PATH}" ]]; then
    echo "Error: cmake not found."
    exit 1
fi

mkdir -p $TEMPLATE_DIR
echo "Installing template in $TEMPLATE_DIR"
cp -R "$BASEDIR/Raspberry Pi Pico.xctemplate" $TEMPLATE_DIR

# Substitute paths in template to match user's environment.
sed -i '' "s|##PICO_SDK_PATH##|$PICO_SDK_PATH|" $TEMPLATE_DIR/Raspberry\ Pi\ Pico.xctemplate/TemplateInfo.plist

sed -i '' "s|##CMAKE_PATH##|$CMAKE_PATH|" $TEMPLATE_DIR/Raspberry\ Pi\ Pico.xctemplate/TemplateInfo.plist

