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
include CMakeFiles/syscall_intercept_base_clf.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/syscall_intercept_base_clf.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/syscall_intercept_base_clf.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/syscall_intercept_base_clf.dir/flags.make

CMakeFiles/syscall_intercept_base_clf.dir/src/cmdline_filter.c.o: CMakeFiles/syscall_intercept_base_clf.dir/flags.make
CMakeFiles/syscall_intercept_base_clf.dir/src/cmdline_filter.c.o: ../src/cmdline_filter.c
CMakeFiles/syscall_intercept_base_clf.dir/src/cmdline_filter.c.o: CMakeFiles/syscall_intercept_base_clf.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jocelyn/Bureau/flusm-devBugs/Dependencies/syscall_intercept/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/syscall_intercept_base_clf.dir/src/cmdline_filter.c.o"
	/usr/bin/clang $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/syscall_intercept_base_clf.dir/src/cmdline_filter.c.o -MF CMakeFiles/syscall_intercept_base_clf.dir/src/cmdline_filter.c.o.d -o CMakeFiles/syscall_intercept_base_clf.dir/src/cmdline_filter.c.o -c /home/jocelyn/Bureau/flusm-devBugs/Dependencies/syscall_intercept/src/cmdline_filter.c

CMakeFiles/syscall_intercept_base_clf.dir/src/cmdline_filter.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/syscall_intercept_base_clf.dir/src/cmdline_filter.c.i"
	/usr/bin/clang $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jocelyn/Bureau/flusm-devBugs/Dependencies/syscall_intercept/src/cmdline_filter.c > CMakeFiles/syscall_intercept_base_clf.dir/src/cmdline_filter.c.i

CMakeFiles/syscall_intercept_base_clf.dir/src/cmdline_filter.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/syscall_intercept_base_clf.dir/src/cmdline_filter.c.s"
	/usr/bin/clang $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jocelyn/Bureau/flusm-devBugs/Dependencies/syscall_intercept/src/cmdline_filter.c -o CMakeFiles/syscall_intercept_base_clf.dir/src/cmdline_filter.c.s

syscall_intercept_base_clf: CMakeFiles/syscall_intercept_base_clf.dir/src/cmdline_filter.c.o
syscall_intercept_base_clf: CMakeFiles/syscall_intercept_base_clf.dir/build.make
.PHONY : syscall_intercept_base_clf

# Rule to build all files generated by this target.
CMakeFiles/syscall_intercept_base_clf.dir/build: syscall_intercept_base_clf
.PHONY : CMakeFiles/syscall_intercept_base_clf.dir/build

CMakeFiles/syscall_intercept_base_clf.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/syscall_intercept_base_clf.dir/cmake_clean.cmake
.PHONY : CMakeFiles/syscall_intercept_base_clf.dir/clean

CMakeFiles/syscall_intercept_base_clf.dir/depend:
	cd /home/jocelyn/Bureau/flusm-devBugs/Dependencies/syscall_intercept/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jocelyn/Bureau/flusm-devBugs/Dependencies/syscall_intercept /home/jocelyn/Bureau/flusm-devBugs/Dependencies/syscall_intercept /home/jocelyn/Bureau/flusm-devBugs/Dependencies/syscall_intercept/build /home/jocelyn/Bureau/flusm-devBugs/Dependencies/syscall_intercept/build /home/jocelyn/Bureau/flusm-devBugs/Dependencies/syscall_intercept/build/CMakeFiles/syscall_intercept_base_clf.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/syscall_intercept_base_clf.dir/depend
