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
include extensions/CMakeFiles/st-ssl.dir/depend.make

# Include the progress variables for this target.
include extensions/CMakeFiles/st-ssl.dir/progress.make

# Include the compile flags for this target's objects.
include extensions/CMakeFiles/st-ssl.dir/flags.make

extensions/CMakeFiles/st-ssl.dir/ssl.c.o: extensions/CMakeFiles/st-ssl.dir/flags.make
extensions/CMakeFiles/st-ssl.dir/ssl.c.o: extensions/ssl.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/st/toffaletti/armhf/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object extensions/CMakeFiles/st-ssl.dir/ssl.c.o"
	cd /home/st/toffaletti/armhf/extensions && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/st-ssl.dir/ssl.c.o   -c /home/st/toffaletti/armhf/extensions/ssl.c

extensions/CMakeFiles/st-ssl.dir/ssl.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/st-ssl.dir/ssl.c.i"
	cd /home/st/toffaletti/armhf/extensions && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /home/st/toffaletti/armhf/extensions/ssl.c > CMakeFiles/st-ssl.dir/ssl.c.i

extensions/CMakeFiles/st-ssl.dir/ssl.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/st-ssl.dir/ssl.c.s"
	cd /home/st/toffaletti/armhf/extensions && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /home/st/toffaletti/armhf/extensions/ssl.c -o CMakeFiles/st-ssl.dir/ssl.c.s

extensions/CMakeFiles/st-ssl.dir/ssl.c.o.requires:
.PHONY : extensions/CMakeFiles/st-ssl.dir/ssl.c.o.requires

extensions/CMakeFiles/st-ssl.dir/ssl.c.o.provides: extensions/CMakeFiles/st-ssl.dir/ssl.c.o.requires
	$(MAKE) -f extensions/CMakeFiles/st-ssl.dir/build.make extensions/CMakeFiles/st-ssl.dir/ssl.c.o.provides.build
.PHONY : extensions/CMakeFiles/st-ssl.dir/ssl.c.o.provides

extensions/CMakeFiles/st-ssl.dir/ssl.c.o.provides.build: extensions/CMakeFiles/st-ssl.dir/ssl.c.o

extensions/CMakeFiles/st-ssl.dir/cares-st.c.o: extensions/CMakeFiles/st-ssl.dir/flags.make
extensions/CMakeFiles/st-ssl.dir/cares-st.c.o: extensions/cares-st.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/st/toffaletti/armhf/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object extensions/CMakeFiles/st-ssl.dir/cares-st.c.o"
	cd /home/st/toffaletti/armhf/extensions && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/st-ssl.dir/cares-st.c.o   -c /home/st/toffaletti/armhf/extensions/cares-st.c

extensions/CMakeFiles/st-ssl.dir/cares-st.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/st-ssl.dir/cares-st.c.i"
	cd /home/st/toffaletti/armhf/extensions && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /home/st/toffaletti/armhf/extensions/cares-st.c > CMakeFiles/st-ssl.dir/cares-st.c.i

extensions/CMakeFiles/st-ssl.dir/cares-st.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/st-ssl.dir/cares-st.c.s"
	cd /home/st/toffaletti/armhf/extensions && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /home/st/toffaletti/armhf/extensions/cares-st.c -o CMakeFiles/st-ssl.dir/cares-st.c.s

extensions/CMakeFiles/st-ssl.dir/cares-st.c.o.requires:
.PHONY : extensions/CMakeFiles/st-ssl.dir/cares-st.c.o.requires

extensions/CMakeFiles/st-ssl.dir/cares-st.c.o.provides: extensions/CMakeFiles/st-ssl.dir/cares-st.c.o.requires
	$(MAKE) -f extensions/CMakeFiles/st-ssl.dir/build.make extensions/CMakeFiles/st-ssl.dir/cares-st.c.o.provides.build
.PHONY : extensions/CMakeFiles/st-ssl.dir/cares-st.c.o.provides

extensions/CMakeFiles/st-ssl.dir/cares-st.c.o.provides.build: extensions/CMakeFiles/st-ssl.dir/cares-st.c.o

extensions/CMakeFiles/st-ssl.dir/bio_netfd.c.o: extensions/CMakeFiles/st-ssl.dir/flags.make
extensions/CMakeFiles/st-ssl.dir/bio_netfd.c.o: extensions/bio_netfd.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/st/toffaletti/armhf/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object extensions/CMakeFiles/st-ssl.dir/bio_netfd.c.o"
	cd /home/st/toffaletti/armhf/extensions && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/st-ssl.dir/bio_netfd.c.o   -c /home/st/toffaletti/armhf/extensions/bio_netfd.c

extensions/CMakeFiles/st-ssl.dir/bio_netfd.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/st-ssl.dir/bio_netfd.c.i"
	cd /home/st/toffaletti/armhf/extensions && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /home/st/toffaletti/armhf/extensions/bio_netfd.c > CMakeFiles/st-ssl.dir/bio_netfd.c.i

extensions/CMakeFiles/st-ssl.dir/bio_netfd.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/st-ssl.dir/bio_netfd.c.s"
	cd /home/st/toffaletti/armhf/extensions && /usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /home/st/toffaletti/armhf/extensions/bio_netfd.c -o CMakeFiles/st-ssl.dir/bio_netfd.c.s

extensions/CMakeFiles/st-ssl.dir/bio_netfd.c.o.requires:
.PHONY : extensions/CMakeFiles/st-ssl.dir/bio_netfd.c.o.requires

extensions/CMakeFiles/st-ssl.dir/bio_netfd.c.o.provides: extensions/CMakeFiles/st-ssl.dir/bio_netfd.c.o.requires
	$(MAKE) -f extensions/CMakeFiles/st-ssl.dir/build.make extensions/CMakeFiles/st-ssl.dir/bio_netfd.c.o.provides.build
.PHONY : extensions/CMakeFiles/st-ssl.dir/bio_netfd.c.o.provides

extensions/CMakeFiles/st-ssl.dir/bio_netfd.c.o.provides.build: extensions/CMakeFiles/st-ssl.dir/bio_netfd.c.o

# Object files for target st-ssl
st__ssl_OBJECTS = \
"CMakeFiles/st-ssl.dir/ssl.c.o" \
"CMakeFiles/st-ssl.dir/cares-st.c.o" \
"CMakeFiles/st-ssl.dir/bio_netfd.c.o"

# External object files for target st-ssl
st__ssl_EXTERNAL_OBJECTS =

extensions/st-ssl: extensions/CMakeFiles/st-ssl.dir/ssl.c.o
extensions/st-ssl: extensions/CMakeFiles/st-ssl.dir/cares-st.c.o
extensions/st-ssl: extensions/CMakeFiles/st-ssl.dir/bio_netfd.c.o
extensions/st-ssl: extensions/CMakeFiles/st-ssl.dir/build.make
extensions/st-ssl: libst.a
extensions/st-ssl: extensions/CMakeFiles/st-ssl.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable st-ssl"
	cd /home/st/toffaletti/armhf/extensions && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/st-ssl.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
extensions/CMakeFiles/st-ssl.dir/build: extensions/st-ssl
.PHONY : extensions/CMakeFiles/st-ssl.dir/build

extensions/CMakeFiles/st-ssl.dir/requires: extensions/CMakeFiles/st-ssl.dir/ssl.c.o.requires
extensions/CMakeFiles/st-ssl.dir/requires: extensions/CMakeFiles/st-ssl.dir/cares-st.c.o.requires
extensions/CMakeFiles/st-ssl.dir/requires: extensions/CMakeFiles/st-ssl.dir/bio_netfd.c.o.requires
.PHONY : extensions/CMakeFiles/st-ssl.dir/requires

extensions/CMakeFiles/st-ssl.dir/clean:
	cd /home/st/toffaletti/armhf/extensions && $(CMAKE_COMMAND) -P CMakeFiles/st-ssl.dir/cmake_clean.cmake
.PHONY : extensions/CMakeFiles/st-ssl.dir/clean

extensions/CMakeFiles/st-ssl.dir/depend:
	cd /home/st/toffaletti/armhf && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/st/toffaletti/armhf /home/st/toffaletti/armhf/extensions /home/st/toffaletti/armhf /home/st/toffaletti/armhf/extensions /home/st/toffaletti/armhf/extensions/CMakeFiles/st-ssl.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : extensions/CMakeFiles/st-ssl.dir/depend

