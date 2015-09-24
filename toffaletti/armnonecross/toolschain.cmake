####ref to http://www.kitware.com/blog/home/post/426
# this one is important
SET(CMAKE_SYSTEM_NAME Linux)

set(CROSS_PATH /opt/toolchain/arm-2009q3)
# Name of C compiler.
set(CMAKE_C_COMPILER "${CROSS_PATH}/bin/arm-none-linux-gnueabi-gcc")
set(CMAKE_CXX_COMPILER "${CROSS_PATH}/bin/arm-none-linux-gnueabi-g++")
#set(CMAKE_C_COMPILER "arm-linux-gnueabihf-gcc")
#set(CMAKE_CXX_COMPILER "arm-linux-gnueabihf-g++")

# Where to look for the target environment. (More paths can be added here)
#"/home/zhangbin/android/tools/gcc-linaro-4.9-2014.11-x86_64_arm-linux-gnueabihf"
set(CMAKE_FIND_ROOT_PATH "${CROSS_PATH}")

###print
message(CROSS_PATH  IS ${CROSS_PATH})
message(CMAKE_C_COMPILER IS  ${CMAKE_C_COMPILER})

#SET(CMAKE_FIND_ROOT_PATH "/home/release/arm11/library/gnuarm-4.4.2/")
#SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
#SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
#SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

#home/zhangbin/android/tools/gcc-linaro-4.9-2014.11-x86_64_arm-linux-gnueabihf/bin
#SET(CMAKE_C_COMPILER "/home/zhangbin/android/tools/gcc-linaro-4.9-2014.11-x86_64_arm-linux-gnueabihf/bin/linux-gnueabihf-gcc")


# Adjust the default behavior of the FIND_XXX() commands:
# search programs in the host environment only.
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)

# for libraries and headers in the target directories
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

####
