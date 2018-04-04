cmake_minimum_required(VERSION 3.1)

project( Corner-Refinement )

set (CMAKE_CXX_STANDARD 11)

include_directories( ${OpenCV_INCLUDE_LIBS} )
include_directories( include )

find_package( OpenCV REQUIRED )

file( GLOB SOURCES src/*.cpp )
add_executable( CornerRefine  ${SOURCES} )

target_link_libraries( CornerRefine ${OpenCV_LIBS} )
