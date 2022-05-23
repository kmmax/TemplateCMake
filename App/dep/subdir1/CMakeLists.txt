cmake_minimum_required(VERSION 3.10)

project(subdir1 VERSION 0.0.1 LANGUAGES CXX)

file(GLOB_RECURSE SUBDIR1_SRC "src/*.cpp" "src/*.h")

add_library(${PROJECT_NAME} SHARED ${SUBDIR1_SRC})
target_include_directories(${PROJECT_NAME} INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}/src")
set_target_properties(${PROJECT_NAME} PROPERTIES OUTPUT_NAME ${PROJECT_NAME}-${PROJECT_VERSION})

