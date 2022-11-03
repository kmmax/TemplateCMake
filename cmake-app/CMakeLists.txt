cmake_minimum_required(VERSION 3.19)


#=== Includes ===="
include(cmake/functions.cmake)


# === Configuration ===
set(APP_NAME			"CMakeTemplate")
set(APP_VERSION_MAJOR 	1)
set(APP_VERSION_MINOR 	2)
set(APP_VERSION_BUILD 	8)
set(APP_DESCRIPTION 	"This is template of С++ project")
set(APP_HOMEPAGE_URL 	"https://example.com")

configure_file("${CMAKE_CURRENT_SOURCE_DIR}/src/app-version.h.in"
               "${CMAKE_CURRENT_SOURCE_DIR}/src/app-version.h")
project(
    ${APP_NAME}
    VERSION ${APP_VERSION_MAJOR}.${APP_VERSION_MINOR}.${APP_VERSION_BUILD}
    DESCRIPTION ${APP_DESCRIPTION}
    HOMEPAGE_URL ${APP_HOMEPAGE_URL}
    LANGUAGES CXX
)

set(APP_VAR1 100)
set(APP_VAR2 100.0)
set(APP_VAR3 "One hundred")
configure_file("${CMAKE_CURRENT_SOURCE_DIR}/src/defines.h.in"
               "${CMAKE_CURRENT_SOURCE_DIR}/src/defines.h")


# === Global definitions ===="
message("--- Clobal definitions: ---")
set(DIR_SRC ${CMAKE_SOURCE_DIR}/src)
set(DIR_BUILD ${CMAKE_SOURCE_DIR}/build)
set(DIR_IMPORT ${CMAKE_SOURCE_DIR}/import)
set(DIR_EXPORT ${CMAKE_SOURCE_DIR}/export)
set(DIR_TESTS ${CMAKE_SOURCE_DIR}/tests)
set(DIR_BIN ${CMAKE_SOURCE_DIR}/bin)
set(DIR_TOOLS ${CMAKE_SOURCE_DIR}/tools)
set(DIR_DOC	${CMAKE_SOURCE_DIR}/doc)
print_vars(DIR_SRC DIR_BUILD DIR_IMPORT DIR_EXPORT DIR_TESTS DIR_BIN TEST APP_OS)


# === CMake definitions ===="
#set(CMAKE_INSTALL_PREFIX "${CMAKE_CURRENT_SOURCE_DIR}/bin")


# === Application ===="
add_subdirectory(src)


#=== Dependencies ===="
# subdir1
#add_subdirectory(dep/subdir1)

# subdir2
#add_subdirectory(dep/subdir2)
#target_link_libraries(APP PRIVATE dep/subdir2)

#add_subdirectory(tests)

print_vars(CMAKE_INSTALL_PREFIX)

	
set(APP_HOST "new")	
if(${MINGW})
	set(APP_HOST "mingw")
elseif(${MSVC})
	set(APP_HOST "msvs")
endif()
print_vars(APP_HOST)


# === Doxygen ===="
find_package(Doxygen)
if (Doxygen_FOUND)
    if (NOT MYLIB_DOXYGEN_LANGUAGE)
        set(MYLIB_DOXYGEN_LANGUAGE Russian)
    endif()
    message(STATUS "Doxygen documentation will be generated in ${MYLIB_DOXYGEN_LANGUAGE}")
    configure_file(doc/Doxyfile.in doc/Doxyfile)
    add_custom_target(doc COMMAND ${DOXYGEN_EXECUTABLE} ${CMAKE_CURRENT_BINARY_DIR}/doc)
	print_vars(DOXYGEN_EXECUTABLE CMAKE_CURRENT_BINARY_DIR)
endif ()


# === Testing ===="
add_subdirectory(tests)

#install(TARGETS ${PROJECT_NAME} DESTINATION ${APP_HOST})
#install(TARGETS subdir1 DESTINATION ${APP_HOST})
#install(TARGETS subdir2 DESTINATION ${APP_HOST})

