# Raspberry Pi Pico Xcode Template
An Xcode template for creating new Raspberry Pi Pico projects.

<img src="doc/xcode-template-picker.png" width="800">

## Introduction
As an Apple platform developer in general and macOS developer specifically, I wanted to be able to develop C/C++ code for the Raspberry Pi Pico using my favorite IDE, Xcode. The official toolchain and other options—Visual Studio Code et al—were not macOS native and therefore not appealing to me.

The Xcode template structure is not a public Apple API. The API is a—mostly undocumented—XML serialized property list (`TemplateInfo.plist`) and there are many limitations of which Xcode project features and settings can be set in the template. This leads to a few manual steps needed to be done when creating a new project with the template (see the usage instructions).

This is a work-in-progress, written by a Swift developer who vaguely remembers some of the innumerable C++ footguns and who's perplexed by how in the world CMake makes sense to anyone. Please, keep this in mind when using this project. 

Feedback, improvements, PRs—everything is more than welcome.

## Goals
The main goal of this work is to make the experience of developing C/C++ code for the Raspberry Pi Pico less painful on macOS.

I'm a simple man—I just want: 
* A low barrier to start a new project.
* To be able to build C/C++ pico code in Xcode.
* To be able to navigate C/C++ code in Xcode.
* Xcode code completion working properly.

## Requirements
* Obviously [Xcode](https://developer.apple.com/xcode/) with the additional command line tools installed.
* The [Raspberry Pi Pico C/C++ SDK](https://github.com/raspberrypi/pico-sdk). The SDK needs to be installed and the toolchain needs to be able to build with CMake.
* The `PICO_SDK_PATH` environment variable set to point to the Pico SDK.
* The optional deploy script uses Raspberry Pi's [picotool](https://github.com/raspberrypi/picotool). `picotool` in turn, depends on `libusb-1.0`, which can be installed via Homebrew. Then `picotool` needs to be cloned, compiled and installed:
```
    brew install libusb
    cd `dirname $PICO_SDK_PATH`
    git clone https://github.com/raspberrypi/picotool.git
    cd picotool
    mkdir build
    cmake ..
    make install
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

## Installation
1. Make sure the `PICO_SDK_PATH` environment variable is set and then:
```
    cd `dirname $PICO_SDK_PATH`
```
2. Clone the Pico-Xcode-template repository:
```
    git clone https://github.com/erikt/Pico-Xcode-template.git
```
3. Run the install script:
```
    Pico-Xcode-template/install_template.sh
```
The install script substitutes a placeholder in the template with the Pico SDK path and copies the template to the user's Xcode template directory.

## Using the template
Ideally, using the template would just involve creating a new Xcode project. At the moment, a few additional manual steps are also required.

1. Create a new project in Xcode (⇧ + ⌘ + N).

2. Pick the Raspberry Pi Pico project from the `other` tab.<br>
<img src="doc/xcode-template-picker.png" width="400">

3. Name the project.<br>
<img src="doc/xcode-new-project.png" width="400">

4. Create the project in the same directory where the Pico SDK is.

5. We now need to do create the build directory and let CMake generate the initial Makefile:
```
    cd `dirname $PICO_SDK_PATH`/MyPicoProject
    mkdir build
    cd build
    cmake ..
```

6. Back in Xcode, the target build directory needs to be set:
- Select the project in the Project Navigator
- Select the external build target.
- Select the Info tab. 
- Set the build tool directory to:
```
    ${PROJECT_DIR}/build
```
<img src="doc/xcode-build-dir.png" width="600"><br>

7. Xcode has automatically created a group we don't need (named the same as our project). First select all the files in the Project Navigator and drag them up one level to right below the top project node. Delete the empty unneccessary group.
<img src="doc/xcode-project-navigator.png" width="600">

8. Lastly, to be able to build, we need to fix the Xcode schemes. 
- Go to the `Product` menu, select `Scheme` and then `Manage Schemes`.<br/>
<img src="doc/xcode-menu-product-scheme.png" width="200"><br/>
<img src="doc/xcode-menu-manage-schemes.png" width="250">
- Select the only created scheme and delete it.<br/>
<img src="doc/xcode-remove-scheme.png" width="500">
- Add a new scheme and select the external build target (the one with the red and white bullseye icon).<br/>
<img src="doc/xcode-add-scheme.png" width="500">

9. Try building the project (⌘ + B). There should be no errors and we're done.<br/>
<img src="doc/xcode-build-worked.png" width="500">

## Deploying to the Pico hardware
The template includes a shell script to make deploying and running on the Pico nicer in macOS. The script `deploy_on_pico.sh`: 

1. Uses `picotool` to reboot a connected Pico as a USB Mass Storage device.
2. Uses `picotool` to load the project's `uf2` file on the device.
3. Unmounts the Pico disk volume.
4. Uses `picotool` to reboot the device and run the code.
 
## How to add a third party C++-library to the project

TBD

## Future improvements
Here are a few things that would be great if it was possible to do in the future:
* Remove all manual usage steps.
* Stop Xcode from creating groups within the project.
* Deploying and running from within Xcode.
* Using LLDB and Xcode to debug running code.

At the moment, I have no idea if any of these are even possible. I greatly appreciate all feedback and suggestions for improvements. You most probably know much more than me about CMake, C/C++ and the Xcode build system ... 

## Author
Copyright &copy; 2022 Erik Tjernlund <erik@tjernlund.net>
