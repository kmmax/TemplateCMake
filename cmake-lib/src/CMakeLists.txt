cmake_minimum_required(VERSION 3.16)


#=== Application ===="
project(cmake-lib VERSION ${APP_VERSION_MAJOR}.${APP_VERSION_MINOR}.${APP_VERSION_BUILD} LANGUAGES CXX)


file(GLOB APP_HEADERS "foo.h")
file(GLOB APP_SOURCES "foo.cpp")
add_library(${PROJECT_NAME} SHARED ${APP_HEADERS} ${APP_SOURCES})
set_target_properties(${PROJECT_NAME} PROPERTIES OUTPUT_NAME ${PROJECT_NAME}-${PROJECT_VERSION})

add_subdirectory(subdir1)
target_link_libraries(${PROJECT_NAME} PRIVATE subdir1)

add_subdirectory(subdir2)
target_link_libraries(${PROJECT_NAME} PRIVATE subdir2)

	

