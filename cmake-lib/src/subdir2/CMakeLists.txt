cmake_minimum_required(VERSION 3.10)

project(subdir2 VERSION 0.0.2 LANGUAGES CXX)

file(GLOB_RECURSE SUBDIR2_SRC
    "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp"
    "${CMAKE_CURRENT_SOURCE_DIR}/src/*.h")
message("--------------subdir2--------------")
print_vars(CMAKE_CURRENT_SOURCE_DIR)

add_library(${PROJECT_NAME} SHARED ${SUBDIR2_SRC})
#add_library(${PROJECT_NAME} STATIC ${SUBDIR2_SRC})
target_include_directories(${PROJECT_NAME} INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}/src")
set_target_properties(${PROJECT_NAME} PROPERTIES OUTPUT_NAME ${PROJECT_NAME}-${PROJECT_VERSION})

