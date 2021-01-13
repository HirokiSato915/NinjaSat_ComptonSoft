########################################################
set(TARGET_EXT_LIBRARY ninjaSatPulseSimulator)
set(SWIG_IF_FILE ${TARGET_EXT_LIBRARY}.i)
set(CLASS_LIST_FILE class_list_${TARGET_EXT_LIBRARY}.hh)
set(RUBY_EXT_INCLUDE_DIRS
  ../include
  ${ANLNEXT_INC_DIR}
  ${ANLG4_INC_DIR}
  ${ANLG4_INC_DIR}/ruby
  ${CS_INC_DIR}
  ${CS_INC_DIR}/ruby
  )
set(RUBY_EXT_LIBRARY_DIRS
  ${ANLNEXT_LIB_DIR}
  ${BOOST_LIB_DIR}
  ${ROOT_LIB_DIR}
  ${CS_LIB_DIR}
  )
set(RUBY_EXT_LIBRARIES
  ${BOOST_LIB}
  ${ROOT_LIB}
  ${ANLNEXT_LIB}
  ${G4_LIB}
  ${ANLG4_LIB}
  ${CS_LIB}
  NinjaSatPulseSimulator
  )

########################################################
set(cxx_definitions )
set(SWIG_FLAGS ${cxx_definitions})
add_definitions(${cxx_definitions})

########################################################
include(CreateSwigRuby)
