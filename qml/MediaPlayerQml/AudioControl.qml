// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtMultimedia
import MediaPlayerModule

Item {
    id: root

    required property MediaPlayer mediaPlayer
    property bool muted: false
    property real volume: volumeSlider.value/100.

    implicitHeight: buttons.height

    RowLayout {
        anchors.fill: parent

        Item {
            id: buttons

            width: muteButton.implicitWidth
            height: muteButton.implicitHeight

            RoundButton {
                id: muteButton
                radius: 50.0
                icon.source: muted ? "../../icons/Mute_Icon.svg" : "../../icons/Speaker_Icon.svg"
                onClicked: { muted = !muted }
            }
        }

        Slider {
            id: volumeSlider
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignVCenter
            background: Rectangle {
                    x: volumeSlider.leftPadding
                    y: volumeSlider.topPadding + volumeSlider.availableHeight / 2 - height / 2
                    implicitWidth: 200
                    implicitHeight: 4
                    width: volumeSlider.availableWidth
                    height: implicitHeight
                    radius: 2
                    color: Colors.text

                    Rectangle {
                        width: volumeSlider.visualPosition * parent.width
                        height: parent.height
                        color: Colors.disabledText
                        radius: 2
                    }
                }

            enabled: true
            to: 100.0
            value: 100.0
        }
    }
}
