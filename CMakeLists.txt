cmake_minimum_required(VERSION 3.16)

project(simpleimageviewer LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick Qml Widgets)

qt_standard_project_setup()

qt_add_executable(simpleimageviewer
    main.cpp
)

qt_add_qml_module(simpleimageviewer
    URI SimpleImageViewer
    VERSION 1.0
    SOURCES
        ImageView.cpp
        ImageView.h
    QML_FILES
        Main.qml
    RESOURCES
        Triad-hdr.avif
)

target_link_libraries(simpleimageviewer
    PRIVATE
        Qt6::Qml
        Qt6::Quick
        Qt6::Widgets
)

install(TARGETS simpleimageviewer
    BUNDLE DESTINATION .
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
