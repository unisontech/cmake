macro(SET_ARTIFACT_PATH LIBRARY_PATH EXECUTABLE_PATH)
    if (NOT EXECUTABLE_OUTPUT_PATH)
        set(EXECUTABLE_OUTPUT_PATH ${EXECUTABLE_PATH})
    endif()
    if (NOT LIBRARY_OUTPUT_PATH)
        set(LIBRARY_OUTPUT_PATH ${LIBRARY_PATH})
    endif()
endmacro()


# set output paths
macro(SET_COMMON_ARTIFACT_PATH)
    if(UNIX)
        set_artifact_path(${PROJECT_SOURCE_DIR}/bin ${PROJECT_SOURCE_DIR}/lib)
    else()
        set_artifact_path(${PROJECT_SOURCE_DIR}/bin ${PROJECT_SOURCE_DIR}/bin)
    endif(UNIX)
endmacro()
