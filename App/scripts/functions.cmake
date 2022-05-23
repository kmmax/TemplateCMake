
# prints vars context
function(print_vars)
        message(STATUS ================)
        message(STATUS "Dumping ${ARGC} variables:")
        foreach(VAR_NAME ${ARGN})
                message(STATUS " ${VAR_NAME} == \"${${VAR_NAME}}\"")
        endforeach()
        message(STATUS ================)
endfunction()
