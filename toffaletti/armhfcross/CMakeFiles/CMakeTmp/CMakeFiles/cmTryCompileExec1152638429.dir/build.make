# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Produce verbose output by default.
VERBOSE = 1

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/zhangbin/nuf/nfshome/st/toffaletti/armhfcross/CMakeFiles/CMakeTmp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/zhangbin/nuf/nfshome/st/toffaletti/armhfcross/CMakeFiles/CMakeTmp

# Include any dependencies generated for this target.
include CMakeFiles/cmTryCompileExec1152638429.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/cmTryCompileExec1152638429.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/cmTryCompileExec1152638429.dir/flags.make

CMakeFiles/cmTryCompileExec1152638429.dir/CMakeCCompilerABI.c.o: CMakeFiles/cmTryCompileExec1152638429.dir/flags.make
CMakeFiles/cmTryCompileExec1152638429.dir/CMakeCCompilerABI.c.o: /usr/share/cmake/Modules/CMakeCCompilerABI.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/zhangbin/nuf/nfshome/st/toffaletti/armhfcross/CMakeFiles/CMakeTmp/CMakeFiles $(CMAKE_PROGRESS_1)
	@echo "Building C object CMakeFiles/cmTryCompileExec1152638429.dir/CMakeCCompilerABI.c.o"
	/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/cmTryCompileExec1152638429.dir/CMakeCCompilerABI.c.o   -c /usr/share/cmake/Modules/CMakeCCompilerABI.c

CMakeFiles/cmTryCompileExec1152638429.dir/CMakeCCompilerABI.c.i: cmake_force
	@echo "Preprocessing C source to CMakeFiles/cmTryCompileExec1152638429.dir/CMakeCCompilerABI.c.i"
	/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /usr/share/cmake/Modules/CMakeCCompilerABI.c > CMakeFiles/cmTryCompileExec1152638429.dir/CMakeCCompilerABI.c.i

CMakeFiles/cmTryCompileExec1152638429.dir/CMakeCCompilerABI.c.s: cmake_force
	@echo "Compiling C source to assembly CMakeFiles/cmTryCompileExec1152638429.dir/CMakeCCompilerABI.c.s"
	/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /usr/share/cmake/Modules/CMakeCCompilerABI.c -o CMakeFiles/cmTryCompileExec1152638429.dir/CMakeCCompilerABI.c.s

CMakeFiles/cmTryCompileExec1152638429.dir/CMakeCCompilerABI.c.o.requires:
.PHONY : CMakeFiles/cmTryCompileExec1152638429.dir/CMakeCCompilerABI.c.o.requires

CMakeFiles/cmTryCompileExec1152638429.dir/CMakeCCompilerABI.c.o.provides: CMakeFiles/cmTryCompileExec1152638429.dir/CMakeCCompilerABI.c.o.requires
	$(MAKE) -f CMakeFiles/cmTryCompileExec1152638429.dir/build.make CMakeFiles/cmTryCompileExec1152638429.dir/CMakeCCompilerABI.c.o.provides.build
.PHONY : CMakeFiles/cmTryCompileExec1152638429.dir/CMakeCCompilerABI.c.o.provides

CMakeFiles/cmTryCompileExec1152638429.dir/CMakeCCompilerABI.c.o.provides.build: CMakeFiles/cmTryCompileExec1152638429.dir/CMakeCCompilerABI.c.o

# Object files for target cmTryCompileExec1152638429
cmTryCompileExec1152638429_OBJECTS = \
"CMakeFiles/cmTryCompileExec1152638429.dir/CMakeCCompilerABI.c.o"

# External object files for target cmTryCompileExec1152638429
cmTryCompileExec1152638429_EXTERNAL_OBJECTS =

cmTryCompileExec1152638429: CMakeFiles/cmTryCompileExec1152638429.dir/CMakeCCompilerABI.c.o
cmTryCompileExec1152638429: CMakeFiles/cmTryCompileExec1152638429.dir/build.make
cmTryCompileExec1152638429: CMakeFiles/cmTryCompileExec1152638429.dir/link.txt
	@echo "Linking C executable cmTryCompileExec1152638429"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/cmTryCompileExec1152638429.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/cmTryCompileExec1152638429.dir/build: cmTryCompileExec1152638429
.PHONY : CMakeFiles/cmTryCompileExec1152638429.dir/build

CMakeFiles/cmTryCompileExec1152638429.dir/requires: CMakeFiles/cmTryCompileExec1152638429.dir/CMakeCCompilerABI.c.o.requires
.PHONY : CMakeFiles/cmTryCompileExec1152638429.dir/requires

CMakeFiles/cmTryCompileExec1152638429.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/cmTryCompileExec1152638429.dir/cmake_clean.cmake
.PHONY : CMakeFiles/cmTryCompileExec1152638429.dir/clean

CMakeFiles/cmTryCompileExec1152638429.dir/depend:
	cd /home/zhangbin/nuf/nfshome/st/toffaletti/armhfcross/CMakeFiles/CMakeTmp && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zhangbin/nuf/nfshome/st/toffaletti/armhfcross/CMakeFiles/CMakeTmp /home/zhangbin/nuf/nfshome/st/toffaletti/armhfcross/CMakeFiles/CMakeTmp /home/zhangbin/nuf/nfshome/st/toffaletti/armhfcross/CMakeFiles/CMakeTmp /home/zhangbin/nuf/nfshome/st/toffaletti/armhfcross/CMakeFiles/CMakeTmp /home/zhangbin/nuf/nfshome/st/toffaletti/armhfcross/CMakeFiles/CMakeTmp/CMakeFiles/cmTryCompileExec1152638429.dir/DependInfo.cmake
.PHONY : CMakeFiles/cmTryCompileExec1152638429.dir/depend
