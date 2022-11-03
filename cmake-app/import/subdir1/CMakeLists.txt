cmake_minimum_required(VERSION 3.10)

project(subdir1 VERSION 0.0.1 LANGUAGES CXX)

message(STATUS ${PROJECT_NAME} ": " ${CMAKE_BUILD_TYPE})

file(GLOB_RECURSE SUBDIR1_SRC "src/*.cpp" "src/*.h")

add_executable(${PROJECT_NAME} ${SUBDIR1_SRC})
set_target_properties(${PROJECT_NAME} PROPERTIES OUTPUT_NAME ${PROJECT_NAME}-${PROJECT_VERSION})

