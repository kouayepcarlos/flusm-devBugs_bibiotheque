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

# Utility rule file for check-license.

# Include any custom commands dependencies for this target.
include CMakeFiles/check-license.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/check-license.dir/progress.make

CMakeFiles/check-license:
	../utils/check_license/check-headers.sh /home/jocelyn/Bureau/flusm-devBugs/Dependencies/syscall_intercept /home/jocelyn/Bureau/flusm-devBugs/Dependencies/syscall_intercept/build/check_license_executable /home/jocelyn/Bureau/flusm-devBugs/Dependencies/syscall_intercept/LICENSE -a

check-license: CMakeFiles/check-license
check-license: CMakeFiles/check-license.dir/build.make
.PHONY : check-license

# Rule to build all files generated by this target.
CMakeFiles/check-license.dir/build: check-license
.PHONY : CMakeFiles/check-license.dir/build

CMakeFiles/check-license.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/check-license.dir/cmake_clean.cmake
.PHONY : CMakeFiles/check-license.dir/clean

CMakeFiles/check-license.dir/depend:
	cd /home/jocelyn/Bureau/flusm-devBugs/Dependencies/syscall_intercept/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jocelyn/Bureau/flusm-devBugs/Dependencies/syscall_intercept /home/jocelyn/Bureau/flusm-devBugs/Dependencies/syscall_intercept /home/jocelyn/Bureau/flusm-devBugs/Dependencies/syscall_intercept/build /home/jocelyn/Bureau/flusm-devBugs/Dependencies/syscall_intercept/build /home/jocelyn/Bureau/flusm-devBugs/Dependencies/syscall_intercept/build/CMakeFiles/check-license.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/check-license.dir/depend
