cmake_minimum_required(VERSION 3.5)

project(test_case LANGUAGES CXX)

enable_testing()


set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
add_definitions(-DGTEST_LANGUAGE_CXX11)

find_package(Threads REQUIRED)

if ($ENV{GOOGLETEST_DIR})
    set(GOOGLETEST_DIR $ENV{GOOGLETEST_DIR})
else ()
    if (NOT "${DIR_TOOLS}/googletest" STREQUAL "")
        message(WARNING "Using googletest src dir specified at manual")
    endif ()
    #set(GOOGLETEST_DIR "D:/_Development/CMake/Work/CMakeTemplate/App/tools/googletest")
	set(GOOGLETEST_DIR ${DIR_TOOLS}/googletest)
endif ()
if (EXISTS ${GOOGLETEST_DIR})
    set(GTestSrc ${GOOGLETEST_DIR}/googletest)
    set(GMockSrc ${GOOGLETEST_DIR}/googlemock)
elseif (UNIX AND EXISTS /usr/src/gtest)
    set(GTestSrc /usr/src/gtest)
    message(WARNING "Using gtest from system")
    if (EXISTS /usr/src/gmock)
        set(GMockSrc /usr/src/gmock)
    endif ()
else ()
    message( FATAL_ERROR "No googletest src dir found - set GOOGLETEST_DIR to enable!")
endif ()

set(GTestFiles ${GTestSrc}/src/gtest-all.cc)
set(GTestIncludes ${GTestSrc} ${GTestSrc}/include)
if (NOT ${GMockSrc} STREQUAL "")
    list(APPEND GTestFiles ${GMockSrc}/src/gmock-all.cc)
    list(APPEND GTestIncludes ${GMockSrc} ${GMockSrc}/include)
endif ()

include_directories(${GTestIncludes})

add_executable(test_case main.cpp tst_test_case.cpp
               ${GTestFiles})
add_test(NAME test_case COMMAND test_case)
target_link_libraries(test_case PRIVATE Threads::Threads)


