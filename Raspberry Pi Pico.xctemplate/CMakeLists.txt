cmake_minimum_required(VERSION 3.12)

# Name of executable.
set(NAME ___PRODUCT_NAME___)

#include(pimoroni_pico_import.cmake)
include(pico_sdk_import.cmake)

# C/C++ boilerplate.
project(${NAME} C CXX ASM)
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

# Initialize the SDK
pico_sdk_init()

# Add all source files here
add_executable(${NAME} main.cc)

# Include required libraries
# This assumes `pimoroni-pico` is stored alongside your project
#include(common/pimoroni_i2c)
#include(libraries/pico_explorer/pico_explorer)
#include(libraries/pico_display/pico_display)

# Don't forget to link the libraries you need!
target_link_libraries(${NAME}
	pico_stdlib
    # List libraries here.
)

# Enable usb output, disable uart output
pico_enable_stdio_usb(${NAME} 1)
pico_enable_stdio_uart(${NAME} 0)

# create map/bin/hex file etc.
pico_add_extra_outputs(${NAME})

# Set up files for the release packages
install(FILES
    ${CMAKE_CURRENT_BINARY_DIR}/${NAME}.uf2
    ${CMAKE_CURRENT_LIST_DIR}/README.md
    DESTINATION .
)

set(CPACK_INCLUDE_TOPLEVEL_DIRECTORY OFF)
set(CPACK_GENERATOR "ZIP" "TGZ")
include(CPack)
