# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.18

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
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.18.3/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.18.3/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/satohiroki/Software/ninjasat_comptonsoft_git/NinjaSatGeometry

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/satohiroki/Software/ninjasat_comptonsoft_git/NinjaSatGeometry/build

# Utility rule file for NinjaSatGeometry_swig_compilation.

# Include the progress variables for this target.
include rubyext/CMakeFiles/NinjaSatGeometry_swig_compilation.dir/progress.make

rubyext/CMakeFiles/NinjaSatGeometry_swig_compilation: rubyext/CMakeFiles/NinjaSatGeometry.dir/NinjaSatGeometryRUBY.stamp


rubyext/CMakeFiles/NinjaSatGeometry.dir/NinjaSatGeometryRUBY.stamp: ../rubyext/NinjaSatGeometry.i
rubyext/CMakeFiles/NinjaSatGeometry.dir/NinjaSatGeometryRUBY.stamp: ../rubyext/NinjaSatGeometry.i
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/satohiroki/Software/ninjasat_comptonsoft_git/NinjaSatGeometry/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Swig compile NinjaSatGeometry.i for ruby"
	cd /Users/satohiroki/Software/ninjasat_comptonsoft_git/NinjaSatGeometry/build/rubyext && /usr/local/Cellar/cmake/3.18.3/bin/cmake -E make_directory /Users/satohiroki/Software/ninjasat_comptonsoft_git/NinjaSatGeometry/build/rubyext /Users/satohiroki/Software/ninjasat_comptonsoft_git/NinjaSatGeometry/build/rubyext/CMakeFiles/NinjaSatGeometry.dir
	cd /Users/satohiroki/Software/ninjasat_comptonsoft_git/NinjaSatGeometry/build/rubyext && /usr/local/Cellar/cmake/3.18.3/bin/cmake -E touch /Users/satohiroki/Software/ninjasat_comptonsoft_git/NinjaSatGeometry/build/rubyext/CMakeFiles/NinjaSatGeometry.dir/NinjaSatGeometryRUBY.stamp
	cd /Users/satohiroki/Software/ninjasat_comptonsoft_git/NinjaSatGeometry/build/rubyext && /usr/local/Cellar/cmake/3.18.3/bin/cmake -E env SWIG_LIB=/usr/local/Cellar/swig/4.0.2/share/swig/4.0.2 /usr/local/bin/swig -ruby -outdir /Users/satohiroki/Software/ninjasat_comptonsoft_git/NinjaSatGeometry/build/rubyext -c++ -I/Users/satohiroki/Software/ninjasat_comptonsoft_git/NinjaSatGeometry/include -I/Users/satohiroki/include/anlgeant4 -I/Users/satohiroki/include -I/Users/satohiroki/Software/geant4/geant4.10.05.p01-install/include/Geant4 -I/usr/local/include -I/Users/satohiroki/include/anlgeant4/ruby -I/Users/satohiroki/include/ruby -I/usr/local/Cellar/ruby/2.7.1_2/include/ruby-2.7.0 -I/usr/local/Cellar/ruby/2.7.1_2/include/ruby-2.7.0/x86_64-darwin19 -o /Users/satohiroki/Software/ninjasat_comptonsoft_git/NinjaSatGeometry/build/rubyext/CMakeFiles/NinjaSatGeometry.dir/NinjaSatGeometryRUBY_wrap.cxx /Users/satohiroki/Software/ninjasat_comptonsoft_git/NinjaSatGeometry/rubyext/NinjaSatGeometry.i

NinjaSatGeometry_swig_compilation: rubyext/CMakeFiles/NinjaSatGeometry_swig_compilation
NinjaSatGeometry_swig_compilation: rubyext/CMakeFiles/NinjaSatGeometry.dir/NinjaSatGeometryRUBY.stamp
NinjaSatGeometry_swig_compilation: rubyext/CMakeFiles/NinjaSatGeometry_swig_compilation.dir/build.make

.PHONY : NinjaSatGeometry_swig_compilation

# Rule to build all files generated by this target.
rubyext/CMakeFiles/NinjaSatGeometry_swig_compilation.dir/build: NinjaSatGeometry_swig_compilation

.PHONY : rubyext/CMakeFiles/NinjaSatGeometry_swig_compilation.dir/build

rubyext/CMakeFiles/NinjaSatGeometry_swig_compilation.dir/clean:
	cd /Users/satohiroki/Software/ninjasat_comptonsoft_git/NinjaSatGeometry/build/rubyext && $(CMAKE_COMMAND) -P CMakeFiles/NinjaSatGeometry_swig_compilation.dir/cmake_clean.cmake
.PHONY : rubyext/CMakeFiles/NinjaSatGeometry_swig_compilation.dir/clean

rubyext/CMakeFiles/NinjaSatGeometry_swig_compilation.dir/depend:
	cd /Users/satohiroki/Software/ninjasat_comptonsoft_git/NinjaSatGeometry/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/satohiroki/Software/ninjasat_comptonsoft_git/NinjaSatGeometry /Users/satohiroki/Software/ninjasat_comptonsoft_git/NinjaSatGeometry/rubyext /Users/satohiroki/Software/ninjasat_comptonsoft_git/NinjaSatGeometry/build /Users/satohiroki/Software/ninjasat_comptonsoft_git/NinjaSatGeometry/build/rubyext /Users/satohiroki/Software/ninjasat_comptonsoft_git/NinjaSatGeometry/build/rubyext/CMakeFiles/NinjaSatGeometry_swig_compilation.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : rubyext/CMakeFiles/NinjaSatGeometry_swig_compilation.dir/depend

