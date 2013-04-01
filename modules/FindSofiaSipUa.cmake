find_path(SOFIA_SIP_UA_INCLUDE_DIR 
  NAMES 
    sofia-sip/sofia_features.h
  HINTS
    ${SOFIA_SIP_UA_ROOT_DIR}
    ENV SOFIA_SIP_UA_ROOT_DIR
  PATH_SUFFIXES
    include
    include/sofia-sip-1.12
  DOC
    "sofia-sip-ua include directory path"
)
set(REQUIRED_VARS SOFIA_SIP_UA_INCLUDE_DIR)

# Look for the library.
find_library(SOFIA_SIP_UA_LIBRARY
  NAMES
    sofia-sip-ua
    libsofia-sip-ua
    libsofia_sip_ua
  HINTS
    ${SOFIA_SIP_UA_ROOT_DIR}
    ENV SOFIA_SIP_UA_ROOT_DIR
  PATH_SUFFIXES
    lib
  DOC
    "sofia-sip-ua library path"
)
set(REQUIRED_VARS ${REQUIRED_VARS} SOFIA_SIP_UA_LIBRARY)

if(WIN32)
    # on windows we also need pthread lib
    find_library(PTHREAD_WIN_LIBRARY
      NAMES
        pthread
      HINTS
        ${SOFIA_SIP_UA_ROOT_DIR}
        ENV SOFIA_SIP_UA_ROOT_DIR
      PATH_SUFFIXES
        lib
      DOC
        "pthread-win library path"
    )
    set(REQUIRED_VARS ${REQUIRED_VARS} PTHREAD_WIN_LIBRARY)
endif()

# handle the QUIETLY and REQUIRED arguments and set SOFIA_SIP_UA_FOUND to TRUE if
# all listed variables are TRUE
include(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(SOFIA_SIP_UA
                                  REQUIRED_VARS ${REQUIRED_VARS})

# Copy the results to the output variables.
if(SOFIA_SIP_UA_FOUND)
  set(SOFIA_SIP_UA_LIBRARIES ${SOFIA_SIP_UA_LIBRARY})
  set(SOFIA_SIP_UA_INCLUDE_DIRS ${SOFIA_SIP_UA_INCLUDE_DIR})
  if(WIN32)
    set(SOFIA_SIP_UA_LIBRARIES ${SOFIA_SIP_UA_LIBRARIES} ${PTHREAD_WIN_LIBRARY} iphlpapi.lib)
  endif()
endif()

mark_as_advanced(SOFIA_SIP_UA_INCLUDE_DIR SOFIA_SIP_UA_LIBRARY)
