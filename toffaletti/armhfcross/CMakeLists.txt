project(state-threads)

cmake_minimum_required(VERSION 2.6)

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE "Debug")
endif(NOT CMAKE_BUILD_TYPE)

###启用了gdb和调试
set(CMAKE_C_FLAGS_DEBUG "-DDEBUG -g3 -ggdb")

####
set(CROSS_PATH /home/zhangbin/android/tools/gcc-linaro-4.9-2014.11-x86_64_arm-linux-gnueabihf)

#SET(CMAKE_FIND_ROOT_PATH "/home/release/arm11/library/gnuarm-4.4.2/")
#SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
#SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
#SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

#home/zhangbin/android/tools/gcc-linaro-4.9-2014.11-x86_64_arm-linux-gnueabihf/bin
#SET(CMAKE_C_COMPILER "/home/zhangbin/android/tools/gcc-linaro-4.9-2014.11-x86_64_arm-linux-gnueabihf/bin/linux-gnueabihf-gcc")

# Name of C compiler.
#set(CMAKE_C_COMPILER "${CROSS_PATH}/bin/arm-linux-gnueabihf-gcc")
#set(CMAKE_CXX_COMPILER "${CROSS_PATH}/bin/arm-linux-gnueabihf-g++")
set(CMAKE_C_COMPILER "arm-linux-gnueabihf-gcc")
set(CMAKE_CXX_COMPILER "arm-linux-gnueabihf-g++")

# Where to look for the target environment. (More paths can be added here)
set(CMAKE_FIND_ROOT_PATH "${CROSS_PATH}" "/home/zhangbin/android/tools/gcc-linaro-4.9-2014.11-x86_64_arm-linux-gnueabihf")

# Adjust the default behavior of the FIND_XXX() commands:
# search programs in the host environment only.
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)

# Search headers and libraries in the target environment only.
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)

####


set(CMAKE_C_FLAGS
  "${CMAKE_C_FLAGS} -fPIC -std=gnu99 -pedantic -pthread -Wall -Wpointer-arith -Wno-format-y2k -Wstrict-prototypes -Wmissing-declarations -Wnested-externs -Wextra -Wundef -Wwrite-strings -Wold-style-definition -Wno-missing-field-initializers -Wredundant-decls -Wno-unused-parameter -Wno-sign-compare -Wmissing-prototypes")

add_definitions(-DMD_HAVE_EPOLL -DLINUX -D_GNU_SOURCE)

# check for valgrind. this should really be in FindValgrind.cmake
# http://www.itk.org/Wiki/CMake:How_To_Find_Installed_Software
find_file(VALGRIND_H valgrind.h /usr/include/valgrind /usr/local/include/valgrind)
message("valgrind headers: ${VALGRIND_H}")
if(NOT VALGRIND_H)
# this will remove valgrind stack tracking support from state-threads
  add_definitions(-DNVALGRIND)
endif(NOT VALGRIND_H)

exec_program(${CMAKE_COMMAND} ARGS -E copy ${CMAKE_CURRENT_SOURCE_DIR}/public.h ${CMAKE_CURRENT_BINARY_DIR}/st.h)
# use gcc for the asm file because it needs to be
# pre-processed by cpp first
SET_SOURCE_FILES_PROPERTIES(md.S PROPERTIES LANGUAGE C)
add_library(st STATIC md.S event.c io.c  key.c  sched.c  stk.c  sync.c)

include_directories(${CMAKE_CURRENT_BINARY_DIR})
add_executable(server examples/server.c examples/error.c)
target_link_libraries(server st)

add_executable(lookupdns examples/lookupdns.c examples/res.c)
target_link_libraries(lookupdns st resolv)

add_executable(threaded examples/threaded.c)
target_link_libraries(threaded st)

add_subdirectory(extensions)
