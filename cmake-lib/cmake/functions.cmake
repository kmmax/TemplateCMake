

# prints vars context
function(print_vars)
        message(STATUS ================)
        message(STATUS "Dumping ${ARGC} variables:")
        foreach(VAR_NAME ${ARGN})
                message(STATUS " ${VAR_NAME} == \"${${VAR_NAME}}\"")
        endforeach()
        message(STATUS ================)
endfunction()


# prints system vars
function(print_system_vars)
        print_vars(
                CMAKE_HOST_WIN32
                CMAKE_HOST_UNIX
                CMAKE_HOST_SYSTEM_PROCESSOR
                CMAKE_HOST_SYSTEM
                CMAKE_SYSTEM_PROCESSOR
                CMAKE_SYSTEM_NAME
                CMAKE_HOST_SYSTEM_VERSION
                CMAKE_COMPILER_2005
                CMAKE_HOST_WIN32
                )
endfunction()
