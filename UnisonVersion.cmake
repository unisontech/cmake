# --- functions

function(extract_branch_name GIT_REVISION GIT_REFS BRANCH_NAME)
    string(REPLACE "\n" ";" GIT_REF_LIST ${GIT_REFS})
    foreach(GIT_REF ${GIT_REF_LIST})
        string(REPLACE " " ";" GIT_REF_PAIR ${GIT_REF})
        list(GET GIT_REF_PAIR 0 NEW_REVISION)
        list(GET GIT_REF_PAIR 1 NEW_BRANCH_NAME)
        if(NEW_REVISION EQUAL GIT_REVISION)
            set(${BRANCH_NAME} ${NEW_BRANCH_NAME} PARENT_SCOPE)
        endif()
    endforeach(GIT_REF)
endfunction()

function(extract_version CURRENT_TAG MAJOR_VERSION MINOR_VERSION PATCH_VERSION COMMIT_HASH)
    string(REPLACE "-" ";" CURRENT_TAG ${CURRENT_TAG})
    list(LENGTH CURRENT_TAG CURRENT_TAG_LENGTH)
    if(${CURRENT_TAG_LENGTH} GREATER 1)
        list(GET CURRENT_TAG 1 NEW_PATCH_VERSION)
    else()
        set(NEW_PATCH_VERSION "0")
    endif()
    set(${PATCH_VERSION} ${NEW_PATCH_VERSION} PARENT_SCOPE)

    if(${CURRENT_TAG_LENGTH} GREATER 2)
        list(GET CURRENT_TAG 2 NEW_COMMIT_HASH)
    else()
        list(GET CURRENT_TAG 0 NEW_COMMIT_HASH)
    endif()
    set(${COMMIT_HASH} ${NEW_COMMIT_HASH} PARENT_SCOPE)

    list(GET CURRENT_TAG 0 CURRENT_TAG)
    string(REPLACE "." ";" CURRENT_TAG_PARTS ${CURRENT_TAG})
    list(LENGTH CURRENT_TAG_PARTS CURRENT_TAG_LENGTH)
    if(${CURRENT_TAG_LENGTH} LESS 2)
        message(FATAL_ERROR "Could not parse version tag [${CURRENT_TAG}]. Tag should contain at least one dot")
    endif()

    list(GET CURRENT_TAG_PARTS 0 NEW_MAJOR_VERSION)
    list(GET CURRENT_TAG_PARTS 1 NEW_MINOR_VERSION)
    set(${MAJOR_VERSION} ${NEW_MAJOR_VERSION} PARENT_SCOPE)
    set(${MINOR_VERSION} ${NEW_MINOR_VERSION} PARENT_SCOPE)
endfunction()

# --- end functions


execute_process(COMMAND git describe --tags --always
                WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
                OUTPUT_VARIABLE CURRENT_TAG
                )
string(STRIP ${CURRENT_TAG} CURRENT_TAG)
extract_version(${CURRENT_TAG} UNISON_VERSION_MAJOR UNISON_VERSION_MINOR UNISON_VERSION_PATCH UNISON_HASH)

execute_process(COMMAND git rev-parse HEAD
                WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
                OUTPUT_VARIABLE CURRENT_REVISION
                )

execute_process(COMMAND git for-each-ref --format=%\(objectname\)\ %\(refname:short\) refs/heads
                WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
                OUTPUT_VARIABLE CURRENT_REFS
                )

extract_branch_name(${CURRENT_REVISION} ${CURRENT_REFS} CURRENT_BRANCH)

# variables exposing
set(UNISON_VERSION "${UNISON_VERSION_MAJOR}.${UNISON_VERSION_MINOR}.${UNISON_VERSION_PATCH}")
string(SUBSTRING ${CURRENT_BRANCH} 0 3 BRANCH_PREFIX)
if(${BRANCH_PREFIX} STREQUAL "rc-")
    set(UNISON_PACKAGE_VERSION "${UNISON_VERSION}")
else()
    set(UNISON_PACKAGE_VERSION "${UNISON_VERSION}-${CURRENT_BRANCH}")
endif()
