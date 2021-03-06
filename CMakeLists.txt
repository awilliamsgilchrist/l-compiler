cmake_minimum_required(VERSION 2.8)
project(l-compiler)

find_package(BISON)
find_package(FLEX)

bison_target(Parser parser.y ${CMAKE_CURRENT_BINARY_DIR}/parser.cpp)
flex_target(Scanner scanner.l ${CMAKE_CURRENT_BINARY_DIR}/scanner.cpp)
add_flex_bison_dependency(Scanner Parser)

set(EXTRA_COMPILE_FLAGS "-g3 -std=c++14")

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${EXTRA_COMPILE_FLAGS}")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS}")

set(l-compiler_srcs
	variable.h
	main.h
	main.cpp
	${BISON_Parser_OUTPUTS}
	${FLEX_Scanner_OUTPUTS}
)
source_group("Calc" FILES ${l-compiler_srcs})

add_executable(l-compiler ${l-compiler_srcs})
target_link_libraries(l-compiler ${FLEX_LIBRARIES} ${BISON_LIBRARIES})