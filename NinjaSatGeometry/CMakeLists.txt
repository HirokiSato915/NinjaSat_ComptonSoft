####### CMakeLists.txt for Compton Soft
cmake_minimum_required(VERSION 3.0)

### Initial definition of cmake variables
set(CMAKE_INSTALL_PREFIX $ENV{HOME} CACHE PATH "install prefix")
set(CMAKE_BUILD_TYPE Release CACHE STRING "build type")
# set(CMAKE_BUILD_TYPE Debug CACHE STRING "build type")
set(CMAKE_CXX_FLAGS_DEBUG "-g -W -Wall" CACHE STRING "CXX_FLAGS for debug")
set(CMAKE_C_FLAGS_DEBUG "-g -W -Wall" CACHE STRING "C_FLAGS for debug")
set(CMAKE_CXX_FLAGS_RELEASE "-O3 -W -Wall" CACHE STRING "CXX_FLAGS for release")
set(CMAKE_C_FLAGS_RELEASE "-O3 -W -Wall" CACHE STRING "C_FLAGS for release")
set(CMAKE_MACOSX_RPATH 1)
set(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)

### Definition of project
project(NinjaSatGeometry)
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_MODULE_PATH ${NinjaSatGeometry_SOURCE_DIR}/cmake ${CMAKE_MODULE_PATH})

message("-- Install destination prefix: ${CMAKE_INSTALL_PREFIX}")
list(APPEND CMAKE_INSTALL_RPATH "${CMAKE_INSTALL_PREFIX}/lib")

set(TARGET_LIBRARY NinjaSatGeometryCC)

### options
option(CS_USE_VIS_QT "enable Geant4 visualization based on QT" ON)

### cmake main
if(NOT DEFINED CS_INSTALL)
  if(DEFINED ENV{CS_INSTALL})
    set(CS_INSTALL $ENV{CS_INSTALL})
  else()
    set(CS_INSTALL $ENV{HOME})
  endif()
endif(NOT DEFINED CS_INSTALL)

set(CMAKE_MODULE_PATH ${CS_INSTALL}/lib/comptonsoft ${CMAKE_MODULE_PATH})
include(UseComptonSoft)

message("-- Install destination prefix: ${CMAKE_INSTALL_PREFIX}")

add_definitions(-DANL_USE_HEPVECTOR)
include_directories(include
  ${ANLG4_INC_DIR}
  ${ANLNEXT_INC_DIR}
  ${G4_INC_DIR}
  )

link_directories(
  ${ANLG4_LIB_DIR}
  ${ANLNEXT_LIB_DIR}
  ${G4_LIB_DIR}
  )

add_library(${TARGET_LIBRARY} SHARED
  src/NinjaSatMainGeometry.cc
  src/DetectorConstruction.cc
  )

target_link_libraries(${TARGET_LIBRARY}
  ${ANLG4_LIB} ${ANLNEXT_LIB} ${G4_LIB})

install(TARGETS ${TARGET_LIBRARY}
  LIBRARY
  DESTINATION ${CMAKE_INSTALL_PREFIX}/lib)

add_subdirectory(rubyext)
