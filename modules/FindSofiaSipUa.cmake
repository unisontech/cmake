find_path(SOFIA_SIP_UA_INCLUDE_DIR 
  NAMES 
    sofia_features.h
  HINTS
    ${SOFIA_SIP_UA_ROOT_DIR}
    ENV SOFIA_SIP_UA_ROOT_DIR
  PATH_SUFFIXES
    include
    include/sofia-sip-1.12
    include/sofia-sip-1.12/sofia-sip
  DOC
    "sofia-sip-ua include directory path"
)

# Look for the library.
find_library(SOFIA_SIP_UA_LIBRARY
  NAMES
    sofia-sip-ua
    libsofia-sip-ua
  HINTS
    ${SOFIA_SIP_UA_ROOT_DIR}
    ENV SOFIA_SIP_UA_ROOT_DIR
  PATH_SUFFIXES
    lib
  DOC
    "sofia-sip-ua library path"
)

# handle the QUIETLY and REQUIRED arguments and set SOFIA_SIP_UA_FOUND to TRUE if
# all listed variables are TRUE
include(${CMAKE_CURRENT_LIST_DIR}/FindPackageHandleStandardArgs.cmake)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(SOFIA_SIP_UA
                                  REQUIRED_VARS SOFIA_SIP_UA_LIBRARY SOFIA_SIP_UA_INCLUDE_DIR)

# Copy the results to the output variables.
if(SOFIA_SIP_UA_FOUND)
  set(SOFIA_SIP_UA_LIBRARIES ${SOFIA_SIP_UA_LIBRARY})
  set(SOFIA_SIP_UA_INCLUDE_DIRS ${SOFIA_SIP_UA_INCLUDE_DIR})
endif()

mark_as_advanced(SOFIA_SIP_UA_INCLUDE_DIR SOFIA_SIP_UA_LIBRARY)
