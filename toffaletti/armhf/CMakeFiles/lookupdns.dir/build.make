# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

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
CMAKE_SOURCE_DIR = /home/zhangbin/nuf/nfshome/st/toffaletti/armhf

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/zhangbin/nuf/nfshome/st/toffaletti/armhf

# Include any dependencies generated for this target.
include CMakeFiles/lookupdns.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/lookupdns.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/lookupdns.dir/flags.make

CMakeFiles/lookupdns.dir/examples/lookupdns.c.o: CMakeFiles/lookupdns.dir/flags.make
CMakeFiles/lookupdns.dir/examples/lookupdns.c.o: examples/lookupdns.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/zhangbin/nuf/nfshome/st/toffaletti/armhf/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/lookupdns.dir/examples/lookupdns.c.o"
	/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/lookupdns.dir/examples/lookupdns.c.o   -c /home/zhangbin/nuf/nfshome/st/toffaletti/armhf/examples/lookupdns.c

CMakeFiles/lookupdns.dir/examples/lookupdns.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lookupdns.dir/examples/lookupdns.c.i"
	/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/zhangbin/nuf/nfshome/st/toffaletti/armhf/examples/lookupdns.c > CMakeFiles/lookupdns.dir/examples/lookupdns.c.i

CMakeFiles/lookupdns.dir/examples/lookupdns.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lookupdns.dir/examples/lookupdns.c.s"
	/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/zhangbin/nuf/nfshome/st/toffaletti/armhf/examples/lookupdns.c -o CMakeFiles/lookupdns.dir/examples/lookupdns.c.s

CMakeFiles/lookupdns.dir/examples/lookupdns.c.o.requires:
.PHONY : CMakeFiles/lookupdns.dir/examples/lookupdns.c.o.requires

CMakeFiles/lookupdns.dir/examples/lookupdns.c.o.provides: CMakeFiles/lookupdns.dir/examples/lookupdns.c.o.requires
	$(MAKE) -f CMakeFiles/lookupdns.dir/build.make CMakeFiles/lookupdns.dir/examples/lookupdns.c.o.provides.build
.PHONY : CMakeFiles/lookupdns.dir/examples/lookupdns.c.o.provides

CMakeFiles/lookupdns.dir/examples/lookupdns.c.o.provides.build: CMakeFiles/lookupdns.dir/examples/lookupdns.c.o

CMakeFiles/lookupdns.dir/examples/res.c.o: CMakeFiles/lookupdns.dir/flags.make
CMakeFiles/lookupdns.dir/examples/res.c.o: examples/res.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/zhangbin/nuf/nfshome/st/toffaletti/armhf/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/lookupdns.dir/examples/res.c.o"
	/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/lookupdns.dir/examples/res.c.o   -c /home/zhangbin/nuf/nfshome/st/toffaletti/armhf/examples/res.c

CMakeFiles/lookupdns.dir/examples/res.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/lookupdns.dir/examples/res.c.i"
	/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/zhangbin/nuf/nfshome/st/toffaletti/armhf/examples/res.c > CMakeFiles/lookupdns.dir/examples/res.c.i

CMakeFiles/lookupdns.dir/examples/res.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/lookupdns.dir/examples/res.c.s"
	/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/zhangbin/nuf/nfshome/st/toffaletti/armhf/examples/res.c -o CMakeFiles/lookupdns.dir/examples/res.c.s

CMakeFiles/lookupdns.dir/examples/res.c.o.requires:
.PHONY : CMakeFiles/lookupdns.dir/examples/res.c.o.requires

CMakeFiles/lookupdns.dir/examples/res.c.o.provides: CMakeFiles/lookupdns.dir/examples/res.c.o.requires
	$(MAKE) -f CMakeFiles/lookupdns.dir/build.make CMakeFiles/lookupdns.dir/examples/res.c.o.provides.build
.PHONY : CMakeFiles/lookupdns.dir/examples/res.c.o.provides

CMakeFiles/lookupdns.dir/examples/res.c.o.provides.build: CMakeFiles/lookupdns.dir/examples/res.c.o

# Object files for target lookupdns
lookupdns_OBJECTS = \
"CMakeFiles/lookupdns.dir/examples/lookupdns.c.o" \
"CMakeFiles/lookupdns.dir/examples/res.c.o"

# External object files for target lookupdns
lookupdns_EXTERNAL_OBJECTS =

lookupdns: CMakeFiles/lookupdns.dir/examples/lookupdns.c.o
lookupdns: CMakeFiles/lookupdns.dir/examples/res.c.o
lookupdns: CMakeFiles/lookupdns.dir/build.make
lookupdns: libst.a
lookupdns: CMakeFiles/lookupdns.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable lookupdns"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/lookupdns.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/lookupdns.dir/build: lookupdns
.PHONY : CMakeFiles/lookupdns.dir/build

CMakeFiles/lookupdns.dir/requires: CMakeFiles/lookupdns.dir/examples/lookupdns.c.o.requires
CMakeFiles/lookupdns.dir/requires: CMakeFiles/lookupdns.dir/examples/res.c.o.requires
.PHONY : CMakeFiles/lookupdns.dir/requires

CMakeFiles/lookupdns.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/lookupdns.dir/cmake_clean.cmake
.PHONY : CMakeFiles/lookupdns.dir/clean

CMakeFiles/lookupdns.dir/depend:
	cd /home/zhangbin/nuf/nfshome/st/toffaletti/armhf && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zhangbin/nuf/nfshome/st/toffaletti/armhf /home/zhangbin/nuf/nfshome/st/toffaletti/armhf /home/zhangbin/nuf/nfshome/st/toffaletti/armhf /home/zhangbin/nuf/nfshome/st/toffaletti/armhf /home/zhangbin/nuf/nfshome/st/toffaletti/armhf/CMakeFiles/lookupdns.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/lookupdns.dir/depend

