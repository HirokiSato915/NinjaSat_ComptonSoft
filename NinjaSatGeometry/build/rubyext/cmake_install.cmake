# Install script for directory: /Users/satohiroki/Software/ninjasat_comptonsoft_git/NinjaSatGeometry/rubyext

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/Users/satohiroki")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/Library/Developer/CommandLineTools/usr/bin/objdump")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/satohiroki/lib/ruby/NinjaSatGeometry.bundle")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/Users/satohiroki/lib/ruby" TYPE MODULE FILES "/Users/satohiroki/Software/ninjasat_comptonsoft_git/NinjaSatGeometry/build/rubyext/NinjaSatGeometry.bundle")
  if(EXISTS "$ENV{DESTDIR}/Users/satohiroki/lib/ruby/NinjaSatGeometry.bundle" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/Users/satohiroki/lib/ruby/NinjaSatGeometry.bundle")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/satohiroki/lib"
      "$ENV{DESTDIR}/Users/satohiroki/lib/ruby/NinjaSatGeometry.bundle")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/satohiroki/Software/ninjasat_comptonsoft_git/NinjaSatGeometry/build"
      "$ENV{DESTDIR}/Users/satohiroki/lib/ruby/NinjaSatGeometry.bundle")
    execute_process(COMMAND /usr/bin/install_name_tool
      -delete_rpath "/Users/satohiroki/Software/geant4/geant4.10.05.p01-install/lib"
      "$ENV{DESTDIR}/Users/satohiroki/lib/ruby/NinjaSatGeometry.bundle")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/Users/satohiroki/lib"
      "$ENV{DESTDIR}/Users/satohiroki/lib/ruby/NinjaSatGeometry.bundle")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/usr/local/Cellar/root/6.22.06_1/lib/root"
      "$ENV{DESTDIR}/Users/satohiroki/lib/ruby/NinjaSatGeometry.bundle")
    execute_process(COMMAND /usr/bin/install_name_tool
      -add_rpath "/Users/satohiroki/Software/geant4/geant4.10.05.p01-install/lib"
      "$ENV{DESTDIR}/Users/satohiroki/lib/ruby/NinjaSatGeometry.bundle")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/Library/Developer/CommandLineTools/usr/bin/strip" -x "$ENV{DESTDIR}/Users/satohiroki/lib/ruby/NinjaSatGeometry.bundle")
    endif()
  endif()
endif()

