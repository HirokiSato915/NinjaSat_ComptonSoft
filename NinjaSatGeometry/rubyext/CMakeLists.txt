########################################################
set(TARGET_EXT_LIBRARY NinjaSatGeometry)
set(SWIG_IF_FILE ${TARGET_EXT_LIBRARY}.i)
set(CLASS_LIST_FILE class_list_${TARGET_EXT_LIBRARY}.hh)
set(RUBY_EXT_INCLUDE_DIRS
  ${ANLG4_INC_DIR}
  ${ANLNEXT_INC_DIR}
  ${G4_INC_DIR}
  ${RUBY_INCLUDE_DIRS}
  ${ANLG4_INC_DIR}/ruby
  ${ANLNEXT_INC_DIR}/ruby
  )
set(RUBY_EXT_LIBRARY_DIRS
  ${ANLG4_LIB_DIR}
  ${ANLNEXT_LIB_DIR}
  ${G4_LIB_DIR}
  )
set(RUBY_EXT_LIBRARIES
  ${RUBY_LIBRARY}
  NinjaSatGeometryCC
  ${ANLG4_LIB}
  ${ANLNEXT_LIB}
  ${G4_LIB}
  )

########################################################
set(cxx_definitions )
set(SWIG_FLAGS ${cxx_definitions})
add_definitions(${cxx_definitions})

########################################################
include(CreateSwigRuby)

########################################################
