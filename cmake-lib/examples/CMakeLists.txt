cmake_minimum_required(VERSION 3.16)


project(
    example
    VERSION ${APP_VERSION_MAJOR}.${APP_VERSION_MINOR}.${APP_VERSION_BUILD}
    LANGUAGES CXX
)

file(GLOB APP_HEADERS "*.h")
file(GLOB APP_SOURCES "*.cpp")
add_executable(${PROJECT_NAME} ${APP_HEADERS} ${APP_SOURCES})
set_target_properties(${PROJECT_NAME} PROPERTIES OUTPUT_NAME ${PROJECT_NAME}-${PROJECT_VERSION})

target_include_directories(${PROJECT_NAME} PUBLIC "../src")
target_link_libraries(${PROJECT_NAME} PRIVATE cmake-lib)


