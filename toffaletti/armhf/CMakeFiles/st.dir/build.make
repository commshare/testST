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
include CMakeFiles/st.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/st.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/st.dir/flags.make

CMakeFiles/st.dir/md.S.o: CMakeFiles/st.dir/flags.make
CMakeFiles/st.dir/md.S.o: md.S
	$(CMAKE_COMMAND) -E cmake_progress_report /home/st/toffaletti/armhf/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/st.dir/md.S.o"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/st.dir/md.S.o   -c /home/st/toffaletti/armhf/md.S

CMakeFiles/st.dir/md.S.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/st.dir/md.S.i"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /home/st/toffaletti/armhf/md.S > CMakeFiles/st.dir/md.S.i

CMakeFiles/st.dir/md.S.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/st.dir/md.S.s"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /home/st/toffaletti/armhf/md.S -o CMakeFiles/st.dir/md.S.s

CMakeFiles/st.dir/md.S.o.requires:
.PHONY : CMakeFiles/st.dir/md.S.o.requires

CMakeFiles/st.dir/md.S.o.provides: CMakeFiles/st.dir/md.S.o.requires
	$(MAKE) -f CMakeFiles/st.dir/build.make CMakeFiles/st.dir/md.S.o.provides.build
.PHONY : CMakeFiles/st.dir/md.S.o.provides

CMakeFiles/st.dir/md.S.o.provides.build: CMakeFiles/st.dir/md.S.o

CMakeFiles/st.dir/event.c.o: CMakeFiles/st.dir/flags.make
CMakeFiles/st.dir/event.c.o: event.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/st/toffaletti/armhf/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/st.dir/event.c.o"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/st.dir/event.c.o   -c /home/st/toffaletti/armhf/event.c

CMakeFiles/st.dir/event.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/st.dir/event.c.i"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /home/st/toffaletti/armhf/event.c > CMakeFiles/st.dir/event.c.i

CMakeFiles/st.dir/event.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/st.dir/event.c.s"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /home/st/toffaletti/armhf/event.c -o CMakeFiles/st.dir/event.c.s

CMakeFiles/st.dir/event.c.o.requires:
.PHONY : CMakeFiles/st.dir/event.c.o.requires

CMakeFiles/st.dir/event.c.o.provides: CMakeFiles/st.dir/event.c.o.requires
	$(MAKE) -f CMakeFiles/st.dir/build.make CMakeFiles/st.dir/event.c.o.provides.build
.PHONY : CMakeFiles/st.dir/event.c.o.provides

CMakeFiles/st.dir/event.c.o.provides.build: CMakeFiles/st.dir/event.c.o

CMakeFiles/st.dir/io.c.o: CMakeFiles/st.dir/flags.make
CMakeFiles/st.dir/io.c.o: io.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/st/toffaletti/armhf/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/st.dir/io.c.o"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/st.dir/io.c.o   -c /home/st/toffaletti/armhf/io.c

CMakeFiles/st.dir/io.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/st.dir/io.c.i"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /home/st/toffaletti/armhf/io.c > CMakeFiles/st.dir/io.c.i

CMakeFiles/st.dir/io.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/st.dir/io.c.s"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /home/st/toffaletti/armhf/io.c -o CMakeFiles/st.dir/io.c.s

CMakeFiles/st.dir/io.c.o.requires:
.PHONY : CMakeFiles/st.dir/io.c.o.requires

CMakeFiles/st.dir/io.c.o.provides: CMakeFiles/st.dir/io.c.o.requires
	$(MAKE) -f CMakeFiles/st.dir/build.make CMakeFiles/st.dir/io.c.o.provides.build
.PHONY : CMakeFiles/st.dir/io.c.o.provides

CMakeFiles/st.dir/io.c.o.provides.build: CMakeFiles/st.dir/io.c.o

CMakeFiles/st.dir/key.c.o: CMakeFiles/st.dir/flags.make
CMakeFiles/st.dir/key.c.o: key.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/st/toffaletti/armhf/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/st.dir/key.c.o"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/st.dir/key.c.o   -c /home/st/toffaletti/armhf/key.c

CMakeFiles/st.dir/key.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/st.dir/key.c.i"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /home/st/toffaletti/armhf/key.c > CMakeFiles/st.dir/key.c.i

CMakeFiles/st.dir/key.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/st.dir/key.c.s"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /home/st/toffaletti/armhf/key.c -o CMakeFiles/st.dir/key.c.s

CMakeFiles/st.dir/key.c.o.requires:
.PHONY : CMakeFiles/st.dir/key.c.o.requires

CMakeFiles/st.dir/key.c.o.provides: CMakeFiles/st.dir/key.c.o.requires
	$(MAKE) -f CMakeFiles/st.dir/build.make CMakeFiles/st.dir/key.c.o.provides.build
.PHONY : CMakeFiles/st.dir/key.c.o.provides

CMakeFiles/st.dir/key.c.o.provides.build: CMakeFiles/st.dir/key.c.o

CMakeFiles/st.dir/sched.c.o: CMakeFiles/st.dir/flags.make
CMakeFiles/st.dir/sched.c.o: sched.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/st/toffaletti/armhf/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/st.dir/sched.c.o"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/st.dir/sched.c.o   -c /home/st/toffaletti/armhf/sched.c

CMakeFiles/st.dir/sched.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/st.dir/sched.c.i"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /home/st/toffaletti/armhf/sched.c > CMakeFiles/st.dir/sched.c.i

CMakeFiles/st.dir/sched.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/st.dir/sched.c.s"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /home/st/toffaletti/armhf/sched.c -o CMakeFiles/st.dir/sched.c.s

CMakeFiles/st.dir/sched.c.o.requires:
.PHONY : CMakeFiles/st.dir/sched.c.o.requires

CMakeFiles/st.dir/sched.c.o.provides: CMakeFiles/st.dir/sched.c.o.requires
	$(MAKE) -f CMakeFiles/st.dir/build.make CMakeFiles/st.dir/sched.c.o.provides.build
.PHONY : CMakeFiles/st.dir/sched.c.o.provides

CMakeFiles/st.dir/sched.c.o.provides.build: CMakeFiles/st.dir/sched.c.o

CMakeFiles/st.dir/stk.c.o: CMakeFiles/st.dir/flags.make
CMakeFiles/st.dir/stk.c.o: stk.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/st/toffaletti/armhf/CMakeFiles $(CMAKE_PROGRESS_6)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/st.dir/stk.c.o"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/st.dir/stk.c.o   -c /home/st/toffaletti/armhf/stk.c

CMakeFiles/st.dir/stk.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/st.dir/stk.c.i"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /home/st/toffaletti/armhf/stk.c > CMakeFiles/st.dir/stk.c.i

CMakeFiles/st.dir/stk.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/st.dir/stk.c.s"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /home/st/toffaletti/armhf/stk.c -o CMakeFiles/st.dir/stk.c.s

CMakeFiles/st.dir/stk.c.o.requires:
.PHONY : CMakeFiles/st.dir/stk.c.o.requires

CMakeFiles/st.dir/stk.c.o.provides: CMakeFiles/st.dir/stk.c.o.requires
	$(MAKE) -f CMakeFiles/st.dir/build.make CMakeFiles/st.dir/stk.c.o.provides.build
.PHONY : CMakeFiles/st.dir/stk.c.o.provides

CMakeFiles/st.dir/stk.c.o.provides.build: CMakeFiles/st.dir/stk.c.o

CMakeFiles/st.dir/sync.c.o: CMakeFiles/st.dir/flags.make
CMakeFiles/st.dir/sync.c.o: sync.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/st/toffaletti/armhf/CMakeFiles $(CMAKE_PROGRESS_7)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/st.dir/sync.c.o"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/st.dir/sync.c.o   -c /home/st/toffaletti/armhf/sync.c

CMakeFiles/st.dir/sync.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/st.dir/sync.c.i"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -E /home/st/toffaletti/armhf/sync.c > CMakeFiles/st.dir/sync.c.i

CMakeFiles/st.dir/sync.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/st.dir/sync.c.s"
	/usr/bin/gcc  $(C_DEFINES) $(C_FLAGS) -S /home/st/toffaletti/armhf/sync.c -o CMakeFiles/st.dir/sync.c.s

CMakeFiles/st.dir/sync.c.o.requires:
.PHONY : CMakeFiles/st.dir/sync.c.o.requires

CMakeFiles/st.dir/sync.c.o.provides: CMakeFiles/st.dir/sync.c.o.requires
	$(MAKE) -f CMakeFiles/st.dir/build.make CMakeFiles/st.dir/sync.c.o.provides.build
.PHONY : CMakeFiles/st.dir/sync.c.o.provides

CMakeFiles/st.dir/sync.c.o.provides.build: CMakeFiles/st.dir/sync.c.o

# Object files for target st
st_OBJECTS = \
"CMakeFiles/st.dir/md.S.o" \
"CMakeFiles/st.dir/event.c.o" \
"CMakeFiles/st.dir/io.c.o" \
"CMakeFiles/st.dir/key.c.o" \
"CMakeFiles/st.dir/sched.c.o" \
"CMakeFiles/st.dir/stk.c.o" \
"CMakeFiles/st.dir/sync.c.o"

# External object files for target st
st_EXTERNAL_OBJECTS =

libst.a: CMakeFiles/st.dir/md.S.o
libst.a: CMakeFiles/st.dir/event.c.o
libst.a: CMakeFiles/st.dir/io.c.o
libst.a: CMakeFiles/st.dir/key.c.o
libst.a: CMakeFiles/st.dir/sched.c.o
libst.a: CMakeFiles/st.dir/stk.c.o
libst.a: CMakeFiles/st.dir/sync.c.o
libst.a: CMakeFiles/st.dir/build.make
libst.a: CMakeFiles/st.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C static library libst.a"
	$(CMAKE_COMMAND) -P CMakeFiles/st.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/st.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/st.dir/build: libst.a
.PHONY : CMakeFiles/st.dir/build

CMakeFiles/st.dir/requires: CMakeFiles/st.dir/md.S.o.requires
CMakeFiles/st.dir/requires: CMakeFiles/st.dir/event.c.o.requires
CMakeFiles/st.dir/requires: CMakeFiles/st.dir/io.c.o.requires
CMakeFiles/st.dir/requires: CMakeFiles/st.dir/key.c.o.requires
CMakeFiles/st.dir/requires: CMakeFiles/st.dir/sched.c.o.requires
CMakeFiles/st.dir/requires: CMakeFiles/st.dir/stk.c.o.requires
CMakeFiles/st.dir/requires: CMakeFiles/st.dir/sync.c.o.requires
.PHONY : CMakeFiles/st.dir/requires

CMakeFiles/st.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/st.dir/cmake_clean.cmake
.PHONY : CMakeFiles/st.dir/clean

CMakeFiles/st.dir/depend:
	cd /home/st/toffaletti/armhf && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/st/toffaletti/armhf /home/st/toffaletti/armhf /home/st/toffaletti/armhf /home/st/toffaletti/armhf /home/st/toffaletti/armhf/CMakeFiles/st.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/st.dir/depend

