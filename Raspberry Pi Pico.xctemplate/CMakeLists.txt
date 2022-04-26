cmake_minimum_required(VERSION 3.12)

# Name of executable.
set(NAME ___PROJECTNAME___)

include(pico_sdk_import.cmake)

# C/C++ boilerplate.
project(${NAME} C CXX ASM)
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

# Initialize the SDK
pico_sdk_init()

# Add all source files
add_executable(${NAME} main.cc)

# Libraries to link
target_link_libraries(${NAME}
	pico_stdlib
    # List libraries here.
)

# Enable usb output, disable uart output
# pico_enable_stdio_usb(${NAME} 1)
# pico_enable_stdio_uart(${NAME} 0)

# Create map/bin/hex/uf2 files 
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
