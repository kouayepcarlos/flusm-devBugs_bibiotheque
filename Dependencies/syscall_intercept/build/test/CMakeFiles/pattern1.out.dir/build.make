# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/jocelyn/Bureau/flusm-devBugs/Dependencies/syscall_intercept

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/jocelyn/Bureau/flusm-devBugs/Dependencies/syscall_intercept/build

# Include any dependencies generated for this target.
include test/CMakeFiles/pattern1.out.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include test/CMakeFiles/pattern1.out.dir/compiler_depend.make

# Include the progress variables for this target.
include test/CMakeFiles/pattern1.out.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/pattern1.out.dir/flags.make

test/CMakeFiles/pattern1.out.dir/pattern1.out.S.o: test/CMakeFiles/pattern1.out.dir/flags.make
test/CMakeFiles/pattern1.out.dir/pattern1.out.S.o: ../test/pattern1.out.S
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jocelyn/Bureau/flusm-devBugs/Dependencies/syscall_intercept/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building ASM object test/CMakeFiles/pattern1.out.dir/pattern1.out.S.o"
	cd /home/jocelyn/Bureau/flusm-devBugs/Dependencies/syscall_intercept/build/test && /usr/bin/clang $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -o CMakeFiles/pattern1.out.dir/pattern1.out.S.o -c /home/jocelyn/Bureau/flusm-devBugs/Dependencies/syscall_intercept/test/pattern1.out.S

test/CMakeFiles/pattern1.out.dir/pattern1.out.S.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing ASM source to CMakeFiles/pattern1.out.dir/pattern1.out.S.i"
	cd /home/jocelyn/Bureau/flusm-devBugs/Dependencies/syscall_intercept/build/test && /usr/bin/clang $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -E /home/jocelyn/Bureau/flusm-devBugs/Dependencies/syscall_intercept/test/pattern1.out.S > CMakeFiles/pattern1.out.dir/pattern1.out.S.i

test/CMakeFiles/pattern1.out.dir/pattern1.out.S.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling ASM source to assembly CMakeFiles/pattern1.out.dir/pattern1.out.S.s"
	cd /home/jocelyn/Bureau/flusm-devBugs/Dependencies/syscall_intercept/build/test && /usr/bin/clang $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -S /home/jocelyn/Bureau/flusm-devBugs/Dependencies/syscall_intercept/test/pattern1.out.S -o CMakeFiles/pattern1.out.dir/pattern1.out.S.s

# Object files for target pattern1.out
pattern1_out_OBJECTS = \
"CMakeFiles/pattern1.out.dir/pattern1.out.S.o"

# External object files for target pattern1.out
pattern1_out_EXTERNAL_OBJECTS =

test/libpattern1.out.so: test/CMakeFiles/pattern1.out.dir/pattern1.out.S.o
test/libpattern1.out.so: test/CMakeFiles/pattern1.out.dir/build.make
test/libpattern1.out.so: test/CMakeFiles/pattern1.out.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/jocelyn/Bureau/flusm-devBugs/Dependencies/syscall_intercept/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking ASM shared library libpattern1.out.so"
	cd /home/jocelyn/Bureau/flusm-devBugs/Dependencies/syscall_intercept/build/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/pattern1.out.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/pattern1.out.dir/build: test/libpattern1.out.so
.PHONY : test/CMakeFiles/pattern1.out.dir/build

test/CMakeFiles/pattern1.out.dir/clean:
	cd /home/jocelyn/Bureau/flusm-devBugs/Dependencies/syscall_intercept/build/test && $(CMAKE_COMMAND) -P CMakeFiles/pattern1.out.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/pattern1.out.dir/clean

test/CMakeFiles/pattern1.out.dir/depend:
	cd /home/jocelyn/Bureau/flusm-devBugs/Dependencies/syscall_intercept/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jocelyn/Bureau/flusm-devBugs/Dependencies/syscall_intercept /home/jocelyn/Bureau/flusm-devBugs/Dependencies/syscall_intercept/test /home/jocelyn/Bureau/flusm-devBugs/Dependencies/syscall_intercept/build /home/jocelyn/Bureau/flusm-devBugs/Dependencies/syscall_intercept/build/test /home/jocelyn/Bureau/flusm-devBugs/Dependencies/syscall_intercept/build/test/CMakeFiles/pattern1.out.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/pattern1.out.dir/depend

