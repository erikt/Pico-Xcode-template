# Pico-Xcode-template
An Xcode template for creating new Raspberry Pi Pico projects.

## Introduction
As a macOS and iOS/iPadOS developer in the Apple ecosphere, I wanted to be able to develop C/C++ code for the Raspberry Pi Pico using my favorite IDE, Xcode. The official toolchain and other options were not macOS native, like VSCode and therefore not appealing to me.

## Goals
The main goal of this work is to make the experience of developing C/C++ code for the pico less painful on macOS.

* Lower the barrier to start a new project.
* Be able to build C/C++ pico code in Xcode.
* Be able to navigate C/C++ code in Xcode.
*  

## Requirements
* Obviously [Xcode](https://developer.apple.com/xcode/) with the additional command line tools installed.
* The [Raspberry Pi Pico C/C++ SDK](https://github.com/raspberrypi/pico-sdk).
* The optional deploy script uses Raspberry Pi's [picotool](https://github.com/raspberrypi/picotool). `picotool` in turn, depends on `libusb-1.0`, which can be installed via Homebrew: 
```
    brew install libusb
````
* A directory structure where the Pico SDK and other possible dependencies, are placed on the same level as the new pico project:

```
    ...
     ├─ pico-sdk
     ├─ pico-examples
     ├─ pimoroni-pico
     ├─ other pico libs
     └─ your project
```

## Installation instructions
To install the template, copy `Raspberry Pi Pico.xctemplate` directory to your Xcode template directory.

    mkdir -p $HOME/Library/Developer/Xcode/Templates/Other
    cp -R Raspberry\ Pi\ Pico.xctemplate $HOME/Library/Developer/Xcode/Templates/Other
    
## Usage

This template is developed with the perquisite directory structure (found above in the requirements section).

1. Create a new project in Xcode (⇧ + ⌘ + N).
2. Pick the Raspberry Pi Pico project from the `other` tab if the template was copied like the installation instructions suggests.
3. 

 

## Future improvements
Here are a few things that would be great if it was possible to do in the future:
* Remove all manual usage steps.
* Stop Xcode from creating groups within the project.
* Deploying and running from within Xcode.
* Using LLDB and Xcode to debug running code.

At the moment, I have no idea if any of these are even possible. I greatly appreciate all feedback and suggestions for improvements. You most probably know much more than me about CMake, C/C++ and the Xcode build system ... 


