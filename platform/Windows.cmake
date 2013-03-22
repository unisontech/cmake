# on Windows app type should be WIN32
SET(APP_TYPE WIN32)
set(BUILD_SHARED_LIBS false)

if(NOT BUILD_SHARED_LIBS)
    # define openssl install directory
    # you can use http://slproweb.com/products/Win32OpenSSL.html
    # http://slproweb.com/download/Win32OpenSSL-1_0_1e.exe
    set(OPENSSL_DIR $ENV{OPENSSL_ROOT_DIR})
    if("${OPENSSL_DIR}" STREQUAL "")
        # check default installation path
        if(EXISTS "$ENV{SYSTEMDRIVE}\\OpenSSL-Win32")
            set(OPENSSL_DIR "$ENV{SYSTEMDRIVE}\\OpenSSL-Win32")
        else()
            message(FATAL_ERROR "Failed to find OpenSSL-Win32. Please setup OPENSSL_ROOT_DIR environment variable to point to its install dir.")
        endif()
    endif()
endif()

message(STATUS "Found OpenSSL in: ${OPENSSL_DIR}")

macro(ADD_WIN32_LIBS)
    # http://public.kitware.com/Bug/view.php?id=3222
    if(NOT BUILD_SHARED_LIBS)
        link_directories(${OPENSSL_DIR}\\lib\\VC\\static\\)
        add_definitions(-DUNISONCORE_STATIC -DQJSON_STATIC -DQTJSON_STATIC -DQXMPP_STATIC)
        list(APPEND LIBS dnsapi Ws2_32 Imm32 Winmm crypt32 libeay32MT ssleay32MT)
    endif()
endmacro()

set(ARTIFACT_PLATFORM_NAME "windows-i386")
