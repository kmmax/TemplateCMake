cmake_minimum_required(VERSION 3.10)

#=== Includes ===="
include(scripts/functions.cmake)
include(scripts/VersionViaGit.cmake)

set(CMAKE_INSTALL_PREFIX "${CMAKE_CURRENT_SOURCE_DIR}/bin")




#event_fuzzy_version_from_git()

set(EVENT_VERSION_MAJOR ${EVENT_GIT___VERSION_MAJOR})
set(EVENT_VERSION_MINOR ${EVENT_GIT___VERSION_MINOR})
set(EVENT_VERSION_PATCH ${EVENT_GIT___VERSION_PATCH})
set(EVENT_VERSION_STAGE ${EVENT_GIT___VERSION_STAGE})

set(EVENT_ABI_MAJOR ${EVENT_VERSION_MAJOR})
set(EVENT_ABI_MINOR ${EVENT_VERSION_MINOR})
set(EVENT_ABI_PATCH ${EVENT_VERSION_PATCH})

set(EVENT_ABI_LIBVERSION
    "${EVENT_ABI_MAJOR}.${EVENT_ABI_MINOR}.${EVENT_ABI_PATCH}")

set(EVENT_PACKAGE_VERSION
    "${EVENT_VERSION_MAJOR}.${EVENT_VERSION_MINOR}.${EVENT_VERSION_PATCH}")






option(EVENT__DISABLE_DEBUG_MODE
    "Define if libevent should build without support for a debug mode" OFF)

option(EVENT__DISABLE_SAMPLES
    "Disable sample files" OFF)

option(EVENT__COVERAGE
"Enable running gcov to get a test coverage report (only works with GCC/CLang). Make sure to enable -DCMAKE_BUILD_TYPE=Debug as well." OFF)

option(EVENT__DISABLE_BENCHMARK
    "Defines if libevent should build without the benchmark executables" OFF)

option(EVENT__DISABLE_TESTS
    "If tests should be compiled or not" OFF)


message("BIN_DIR" ${PROJECT_BINARY_DIR})


if (NOT DEFINED CMAKE_RUNTIME_OUTPUT_DIRECTORY)
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/bin)
endif()
if (NOT DEFINED CMAKE_LIBRARY_OUTPUT_DIRECTORY)
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/lib)
endif()
if (NOT DEFINED CMAKE_ARCHIVE_OUTPUT_DIRECTORY)
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/lib)
endif()











#=== Application ===="
project(app VERSION 0.0.1 LANGUAGES CXX)
#set(full_name ${PROJECT_NAME}-${PROJECT_VERSION})
file(GLOB_RECURSE APP_SRC "src/*.cpp" "src/*.h")
print_vars(PROJECT_NAME APP_SRC)

add_executable(${PROJECT_NAME} ${APP_SRC})
set_target_properties(${PROJECT_NAME} PROPERTIES OUTPUT_NAME ${PROJECT_NAME}-${PROJECT_VERSION})


#=== Dependencies ===="
# subdir1
add_subdirectory(dep/subdir1)
target_link_libraries(${PROJECT_NAME} PRIVATE subdir1)

# subdir2
add_subdirectory(dep/subdir2)
target_link_libraries(${PROJECT_NAME} PRIVATE subdir2)

print_vars(CMAKE_INSTALL_PREFIX)

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
	IS_SUBPROJECT
	)
	
set(APP_HOST "new")	
if(${MINGW})
	set(APP_HOST "mingw")
elseif(${MSVC})
	set(APP_HOST "msvs")
endif()
print_vars(APP_HOST)

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

install(TARGETS ${PROJECT_NAME} DESTINATION ${APP_HOST})
install(TARGETS subdir1 DESTINATION ${APP_HOST})
install(TARGETS subdir2 DESTINATION ${APP_HOST})

