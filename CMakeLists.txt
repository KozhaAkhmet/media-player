cmake_minimum_required(VERSION 3.21.1)

option(LINK_INSIGHT "Link Qt Insight Tracker library" ON)
option(BUILD_QDS_COMPONENTS "Build design studio components" ON)

project(MediaPlayerApp LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)

find_package(Qt6 REQUIRED COMPONENTS Core Gui Quick QuickControls2 Multimedia Svg)

if (Qt6_VERSION VERSION_GREATER_EQUAL 6.3)
    qt_standard_project_setup()
endif()

set_source_files_properties(qml/Colors.qml
    PROPERTIES
        QT_QML_SINGLETON_TYPE TRUE
)

qt_add_executable(MediaPlayerApp
    src/main.cpp
)

qt_add_qml_module(MediaPlayerApp
    URI MediaPlayerModule
    VERSION 1.0
    QML_FILES
        "Main.qml"
        "qml/About.qml"
        "qml/Colors.qml"
        "qml/MyMenu.qml"
        "qml/Sidebar.qml"
        "qml/MusicWindow.qml"
        "qml/FileSystemView.qml"
        "qml/MusicSystemView.qml"
        "qml/MediaPlayerQml/Player.qml"
        "qml/MediaPlayerQml/AudioControl.qml"
        "qml/MediaPlayerQml/PlaybackControl.qml"
        "qml/MediaPlayerQml/PlaybackSeekControl.qml"
        "qml/MediaPlayerQml/TracksInfo.qml"
        "qml/MediaPlayerQml/MetadataInfo.qml"
    RESOURCES
        "icons/folder_closed.svg"
        "icons/folder_open.svg"
        "icons/generic_file.svg"
        "icons/globe.svg"
        "icons/info_sign.svg"
        "icons/light_bulb.svg"
        "icons/read.svg"
        "icons/resize.svg"
        "icons/qt_logo.svg"
        "icons/app_icon.svg"
        "icons/sound.svg"
        "icons/folders_tree.svg"
        "icons/Mute_Icon.svg"
        "icons/Speaker_Icon.svg"
        "icons/burger.svg"
        "icons/repeat.svg"
        "icons/shuffle.svg"
    SOURCES
        filesystemmodel.cpp
        filesystemmodel.h
        QML_FILES
)

target_link_libraries(MediaPlayerApp PRIVATE
    Qt6::Multimedia
    Qt6::Core
    Qt6::Gui
    Qt6::Qml
    Qt6::Svg
    Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS MediaPlayerApp
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

# make IDEs aware of the QML import path
set(QML_IMPORT_PATH ${PROJECT_BINARY_DIR}/MediaPlayerModule/qml CACHE PATH
    "Path to the custom QML components defined by the project")
