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

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/st/toffaletti/armhf

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/st/toffaletti/armhf

# Include any dependencies generated for this target.
include CMakeFiles/server.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/server.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/server.dir/flags.make

CMakeFiles/server.dir/examples/server.c.o: CMakeFiles/server.dir/flags.make
CMakeFiles/server.dir/examples/server.c.o: examples/server.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/st/toffaletti/armhf/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/server.dir/examples/server.c.o"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/server.dir/examples/server.c.o   -c /home/st/toffaletti/armhf/examples/server.c

CMakeFiles/server.dir/examples/server.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/server.dir/examples/server.c.i"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /home/st/toffaletti/armhf/examples/server.c > CMakeFiles/server.dir/examples/server.c.i

CMakeFiles/server.dir/examples/server.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/server.dir/examples/server.c.s"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /home/st/toffaletti/armhf/examples/server.c -o CMakeFiles/server.dir/examples/server.c.s

CMakeFiles/server.dir/examples/server.c.o.requires:
.PHONY : CMakeFiles/server.dir/examples/server.c.o.requires

CMakeFiles/server.dir/examples/server.c.o.provides: CMakeFiles/server.dir/examples/server.c.o.requires
	$(MAKE) -f CMakeFiles/server.dir/build.make CMakeFiles/server.dir/examples/server.c.o.provides.build
.PHONY : CMakeFiles/server.dir/examples/server.c.o.provides

CMakeFiles/server.dir/examples/server.c.o.provides.build: CMakeFiles/server.dir/examples/server.c.o

CMakeFiles/server.dir/examples/error.c.o: CMakeFiles/server.dir/flags.make
CMakeFiles/server.dir/examples/error.c.o: examples/error.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/st/toffaletti/armhf/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/server.dir/examples/error.c.o"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/server.dir/examples/error.c.o   -c /home/st/toffaletti/armhf/examples/error.c

CMakeFiles/server.dir/examples/error.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/server.dir/examples/error.c.i"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /home/st/toffaletti/armhf/examples/error.c > CMakeFiles/server.dir/examples/error.c.i

CMakeFiles/server.dir/examples/error.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/server.dir/examples/error.c.s"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /home/st/toffaletti/armhf/examples/error.c -o CMakeFiles/server.dir/examples/error.c.s

CMakeFiles/server.dir/examples/error.c.o.requires:
.PHONY : CMakeFiles/server.dir/examples/error.c.o.requires

CMakeFiles/server.dir/examples/error.c.o.provides: CMakeFiles/server.dir/examples/error.c.o.requires
	$(MAKE) -f CMakeFiles/server.dir/build.make CMakeFiles/server.dir/examples/error.c.o.provides.build
.PHONY : CMakeFiles/server.dir/examples/error.c.o.provides

CMakeFiles/server.dir/examples/error.c.o.provides.build: CMakeFiles/server.dir/examples/error.c.o

# Object files for target server
server_OBJECTS = \
"CMakeFiles/server.dir/examples/server.c.o" \
"CMakeFiles/server.dir/examples/error.c.o"

# External object files for target server
server_EXTERNAL_OBJECTS =

server: CMakeFiles/server.dir/examples/server.c.o
server: CMakeFiles/server.dir/examples/error.c.o
server: CMakeFiles/server.dir/build.make
server: libst.a
server: CMakeFiles/server.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable server"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/server.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/server.dir/build: server
.PHONY : CMakeFiles/server.dir/build

CMakeFiles/server.dir/requires: CMakeFiles/server.dir/examples/server.c.o.requires
CMakeFiles/server.dir/requires: CMakeFiles/server.dir/examples/error.c.o.requires
.PHONY : CMakeFiles/server.dir/requires

CMakeFiles/server.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/server.dir/cmake_clean.cmake
.PHONY : CMakeFiles/server.dir/clean

CMakeFiles/server.dir/depend:
	cd /home/st/toffaletti/armhf && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/st/toffaletti/armhf /home/st/toffaletti/armhf /home/st/toffaletti/armhf /home/st/toffaletti/armhf /home/st/toffaletti/armhf/CMakeFiles/server.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/server.dir/depend

