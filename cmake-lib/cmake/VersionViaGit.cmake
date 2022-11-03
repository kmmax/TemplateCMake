# This module defines the following variables utilizing
# git to determine the parent tag. And if found the macro
# will attempt to parse them in the github tag fomat
#
# Useful for auto-versioning in our CMakeLists
#
#  EVENT_GIT___VERSION_MAJOR - Major version.
#  EVENT_GIT___VERSION_MINOR - Minor version
#  EVENT_GIT___VERSION_STAGE - Stage version
#
# Example usage:
#
# event_fuzzy_version_from_git()
#    message("Libvent major=${EVENT_GIT___VERSION_MAJOR}")
#    message("        minor=${EVENT_GIT___VERSION_MINOR}")
#    message("        patch=${EVENT_GIT___VERSION_PATCH}")
#    message("        stage=${EVENT_GIT___VERSION_STAGE}")
# endif()

include(FindGit)

macro(event_fuzzy_version_from_git)
	# set our defaults.
	set(EVENT_GIT___VERSION_MAJOR 2)
	set(EVENT_GIT___VERSION_MINOR 2)
	set(EVENT_GIT___VERSION_PATCH 0)
	set(EVENT_GIT___VERSION_STAGE "alpha-dev")

	find_package(Git)

	if (GIT_FOUND)
		execute_process(
			COMMAND
				${GIT_EXECUTABLE} describe --abbrev=0 --always
			WORKING_DIRECTORY
				${PROJECT_SOURCE_DIR}
			RESULT_VARIABLE
				GITRET
			OUTPUT_VARIABLE
				GITVERSION
			OUTPUT_STRIP_TRAILING_WHITESPACE
		)

		string(REGEX REPLACE "[\\._-]" ";" VERSION_LIST "${GITVERSION}")
		if(VERSION_LIST)
			list(LENGTH VERSION_LIST VERSION_LIST_LENGTH)
		endif()

		if ((GITRET EQUAL 0) AND (VERSION_LIST_LENGTH EQUAL 5))
			list(GET VERSION_LIST 1 _MAJOR)
			list(GET VERSION_LIST 2 _MINOR)
			list(GET VERSION_LIST 3 _PATCH)
			list(GET VERSION_LIST 4 _STAGE)

			set(_DEFAULT_VERSION "${EVENT_GIT___VERSION_MAJOR}.${EVENT_GIT___VERSION_MINOR}.${EVENT_GIT___VERSION_PATCH}-${EVENT_GIT___VERSION_STAGE}")
			set(_GIT_VERSION     "${_MAJOR}.${_MINOR}.${_PATCH}-${_STAGE}")

			if (${_DEFAULT_VERSION} VERSION_LESS ${_GIT_VERSION})
				set(EVENT_GIT___VERSION_MAJOR ${_MAJOR})
				set(EVENT_GIT___VERSION_MINOR ${_MINOR})
				set(EVENT_GIT___VERSION_PATCH ${_PATCH})
				set(EVENT_GIT___VERSION_STAGE ${_STAGE})
			endif()
		endif()
	endif()
endmacro()

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

