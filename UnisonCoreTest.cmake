macro(ADD_UNISON_CORE_TEST TARGET SOURCES)
    include_directories(${INCLUDE_DIR}
                        ${PROJECT_SOURCE_DIR}
                        ${CMAKE_CURRENT_SOURCE_DIR}
                        )

    qtX_add_resources(
        QRC_SOURCES
        ${ARGV2}
        )

    if(WIN32)
        add_win32_libs()
    endif(WIN32)

    if(ANDROID)
        add_library(
            ${TARGET}
            ${LIBRARY_TYPE}
            ${QRC_SOURCES}
            ${SOURCES}
            )
    else()
        add_executable(
            ${TARGET}
            ${QRC_SOURCES}
            ${SOURCES}
            )
    endif()

    qtX_use_modules(
        ${TARGET}
        Core
        Test
        Sql
        )

    if(iOS)
        find_library(COREFOUNDATION_LIBRARY CoreFoundation REQUIRED)
        list(APPEND LIBS ${COREFOUNDATION_LIBRARY}
                         "${OPENSSL_ROOT_DIR}/lib/libssl.a"
                         "${OPENSSL_ROOT_DIR}/lib/libcrypto.a"
            )
    endif(iOS)

    if(APPLE)
        list(APPEND LIBS z)
    endif(APPLE)

    if(MacOSX)
        find_library(SYSTEMCONFIGURATION_LIBRARY SystemConfiguration REQUIRED)
        list(APPEND LIBS ${SYSTEMCONFIGURATION_LIBRARY})

        find_library(IOKIT_LIBRARY IOKit REQUIRED)
        list(APPEND LIBS ${IOKIT_LIBRARY})

        find_library(SECURITY_LIBRARY Security REQUIRED)
        list(APPEND LIBS ${SECURITY_LIBRARY})

        find_library(CARBON_LIBRARY Carbon REQUIRED)
        list(APPEND LIBS ${CARBON_LIBRARY})
    endif(MacOSX)

    if(NOT BUILD_SHARED_LIBS AND QT_IS_STATIC)
        add_definitions(-DQT_IS_STATIC)
        find_library(QSQLITE_LIBRARY_RELEASE qsqlite HINTS "${QT_PLUGINS_DIR}" PATH_SUFFIXES "sqldrivers")
        find_library(QSQLITE_LIBRARY_DEBUG qsqlited HINTS "${QT_PLUGINS_DIR}" PATH_SUFFIXES "sqldrivers")
        if(${CMAKE_BUILD_TYPE} STREQUAL "Debug")
            list(APPEND LIBS ${QSQLITE_LIBRARY_DEBUG})
        elseif(${CMAKE_BUILD_TYPE} STREQUAL "Release")
            list(APPEND LIBS ${QSQLITE_LIBRARY_RELEASE})
        endif()
    endif()

    target_link_libraries(
        ${TARGET}
        ${UNISONCORE_LIBRARY}
        ${UNISONCORE_LIBRARY}_media
        ${LIBJINGLE_LIBRARIES}
        qt-json
        qxmpp
        ${QT_QTMAIN_LIBRARY}
        ${QT_LIBRARIES}
        ${LIBS}
        ${SOFIA_SIP_UA_LIBRARIES}
        ${OPENSSL_LIBRARIES}
        )

    if(NOT ANDROID)
    add_test(
        NAME ${TARGET}
        WORKING_DIRECTORY ${EXECUTABLE_OUTPUT_PATH}
        COMMAND ${TARGET} -xml -o ${TARGET}.xml
        )
    endif()
endmacro()
