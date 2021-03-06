cmake_minimum_required(VERSION 2.8)
project(DBoW2)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS}  -Wall  -O3 -march=native ")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall  -O3 -march=native")

set(HDRS_DBOW2
    DBoW2/BowVector.h
    DBoW2/FORB.h
    DBoW2/FClass.h
    DBoW2/FeatureVector.h
    DBoW2/ScoringObject.h
    DBoW2/TemplatedVocabulary.h)
set(SRCS_DBOW2
    DBoW2/BowVector.cpp
    DBoW2/FORB.cpp
    DBoW2/FeatureVector.cpp
    DBoW2/ScoringObject.cpp)

set(HDRS_DUTILS DUtils/Random.h DUtils/Timestamp.h)
set(SRCS_DUTILS DUtils/Random.cpp DUtils/Timestamp.cpp)

find_package(OpenCV REQUIRED)

set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)

include_directories(${OpenCV_INCLUDE_DIRS})
add_library(DBoW2 STATIC ${SRCS_DBOW2} ${SRCS_DUTILS})
target_link_libraries(DBoW2 ${OpenCV_LIBS})

# rename ORB_SLAM2 specific variant of library
set_target_properties(DBoW2 PROPERTIES OUTPUT_NAME ORB_SLAM2-DBoW2)

# install headers
install(DIRECTORY DBoW2
        DESTINATION include/ORB_SLAM2/Thirdparty/DBoW2
        FILES_MATCHING
        PATTERN "*.h")
install(DIRECTORY DUtils
        DESTINATION include/ORB_SLAM2/Thirdparty/DBoW2
        FILES_MATCHING
        PATTERN "*.h")

# install the library
install(TARGETS DBoW2
        EXPORT ${PROJECT_NAME}Targets
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib)
