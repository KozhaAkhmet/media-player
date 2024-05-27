// Copyright (C) 2023 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts
import MediaPlayerModule 1.0
import QtQuick.Window 2.1
import QtMultimedia

pragma ComponentBehavior: Bound

Window {
    id: root

    property bool expandPath: false
    property string currentFilePath: ""
    // required property Player mediaPlayer
    // property alias source: mediaPlayer.source

    minimumWidth: 1100
    minimumHeight: 600
    visible: true
    color: Colors.background
    flags: Qt.Window
    title: qsTr("File System Explorer Example")

    function getInfoText() : string {
        let out = root.currentFilePath
        if (!out)
            return qsTr("File System Explorer")
        return root.expandPath ? out : out.substring(out.lastIndexOf("/") + 1, out.length)
    }

    // Set up the layout of the main components in a row:
    // [ Sidebar, Navigation, Editor ]
    RowLayout {
        anchors.fill: parent
        spacing: 0

        // Stores the buttons that navigate the application.
        Sidebar {
            id: sidebar
            // dragWindow: root
            Layout.preferredWidth: 50
            Layout.fillHeight: true
        }

        // Allows resizing parts of the UI.
        SplitView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            // Customized handle to drag between the Navigation and the Editor.
            handle: Rectangle {
                implicitWidth: 10
                color: SplitHandle.pressed ? Colors.color2 : Colors.background
                border.color: SplitHandle.hovered ? Colors.color2 : Colors.background
                opacity: SplitHandle.hovered || navigationView.width < 15 ? 1.0 : 0.0

                Behavior on opacity {
                    OpacityAnimator {
                        duration: 1400
                    }
                }
            }

            Rectangle {
                id: navigationView
                color: Colors.surface1
                SplitView.maximumWidth: 300
                SplitView.minimumWidth: 300
                SplitView.fillHeight: true
                // The stack-layout provides different views, based on the
                // selected buttons inside the sidebar.
                StackLayout {
                    anchors.fill: parent
                    currentIndex: sidebar.currentTabIndex

                    // // Shows the help text.
                    Text {
                        text: qsTr("This example shows how to use and visualize the file system.\n\n"
                                 + "Customized Qt Quick Components have been used to achieve this look.\n\n"
                                 + "You can edit the files but they won't be changed on the file system.\n\n"
                                 + "Click on the folder icon to the left to get started.")
                        wrapMode: TextArea.Wrap
                        color: Colors.text
                    }
                    MusicSystemView {
                        id: musicSystemView
                        color: Colors.surface1
                    }
                   // Shows the files on the file system.
                    FileSystemView {
                        id: fileSystemView
                        color: Colors.surface1
                        onFileClicked: path => root.currentFilePath = path
                    }

                }
            }

            // The main view that contains the editor.
            Player {
                id: player
                SplitView.fillWidth: true
                SplitView.fillHeight: true
                currentFilePath: root.currentFilePath
            }
        }
    }

    // ResizeButton {
    //     resizeWindow: root
    // }
}
