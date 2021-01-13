cmake_minimum_required(VERSION 3.8)

### Initial definition of cmake variables
set(CMAKE_INSTALL_PREFIX $ENV{HOME} CACHE PATH "install prefix")
set(CMAKE_BUILD_TYPE Release CACHE STRING "build type")
set(CMAKE_CXX_FLAGS_DEBUG "-g -W -Wall" CACHE STRING "CXX_FLAGS for debug")
set(CMAKE_C_FLAGS_DEBUG "-g -W -Wall" CACHE STRING "C_FLAGS for debug")
set(CMAKE_CXX_FLAGS_RELEASE "-O3 -W -Wall" CACHE STRING "CXX_FLAGS for release")
set(CMAKE_C_FLAGS_RELEASE "-O3 -W -Wall" CACHE STRING "C_FLAGS for release")
set(CMAKE_MACOSX_RPATH 0)

### Definition of project
project(NinjaSatPulseSimulator)
add_definitions("-std=c++14")

set(MY_LIBRARY NinjaSatPulseSimulator)
set(USE_RUBY ON)

### Depends on ComptonSoft
if(NOT DEFINED CS_INSTALL)
  if($ENV{CS_INSTALL})
    set(CS_INSTALL $ENV{CS_INSTALL})
  else($ENV{CS_INSTALL})
    set(CS_INSTALL $ENV{HOME})
  endif($ENV{CS_INSTALL})
endif(NOT DEFINED CS_INSTALL)

set(CMAKE_MODULE_PATH ${CS_INSTALL}/lib/comptonsoft ${CMAKE_MODULE_PATH})
include(UseComptonSoft)
add_definitions(-DANLNEXT_USE_HEPVECTOR)

include_directories(
  include
  ${ANLNEXT_INC_DIR}
  ${BOOST_INC_DIR}
  ${ROOT_INC_DIR}
  ${G4_INC_DIR}
  ${ANLG4_INC_DIR}
  ${CS_INC_DIR}
  )

link_directories(
  ${ANLNEXT_LIB_DIR}
  ${BOOST_LIB_DIR}
  ${ROOT_LIB_DIR}
  ${CS_LIB_DIR}
  )

set(ANL_MODULES
  src/GenerateEvents.cc
  )

add_library(${MY_LIBRARY} SHARED
  ${ANL_MODULES}
)

target_link_libraries(${MY_LIBRARY}
  ${BOOST_LIB}
  ${ROOT_LIB}
  ${ANLNEXT_LIB}
  ${G4_LIB}
  ${ANLG4_LIB}
  ${CS_LIB}
  )

install(TARGETS ${MY_LIBRARY} LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX}/lib)

if(USE_RUBY)
  add_subdirectory(rubyext)
endif(USE_RUBY)
