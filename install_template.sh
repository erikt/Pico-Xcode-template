#!/bin/sh

TEMPLATE_DIR=$HOME/Library/Developer/Xcode/Templates/Other

mkdir -p $TEMPLATE_DIR
echo "Copying Raspberry Pi Pico Xcode template to $TEMPLATE_DIR"
cp -R "Raspberry Pi Pico.xctemplate" $TEMPLATE_DIR

