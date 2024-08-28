// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

import QtQuick 6.6
import QtQuick.Controls 6.6
import QtQuick.Layouts 6.6
import QtMultimedia 6.6
import MediaPlayerModule 1.0

Item {
    id: root

    required property MediaPlayer mediaPlayer

    implicitHeight: 20


    RowLayout {
        anchors.fill: parent

        Text {
            id: mediaTime
            Layout.minimumWidth: 50
            Layout.minimumHeight: 18
            horizontalAlignment: Text.AlignJustify
            color: Colors.text
            text: {
                var m = Math.floor(mediaPlayer.position / 60000)
                var ms = (mediaPlayer.position / 1000 - m * 60).toFixed(1)
                return `${m}:${ms.padStart(4, 0)}`
            }
        }

        Slider {
            id: mediaSlider
            Layout.fillWidth: true
            enabled: mediaPlayer.seekable
            to: 1.0
            value: mediaPlayer.position / mediaPlayer.duration

            onMoved: mediaPlayer.setPosition(value * mediaPlayer.duration)
            background: Rectangle {
                    x: mediaSlider.leftPadding
                    y: mediaSlider.topPadding + mediaSlider.availableHeight / 2 - height / 2
                    implicitWidth: 200
                    implicitHeight: 4
                    width: mediaSlider.availableWidth
                    height: implicitHeight
                    radius: 2
                    color: Colors.text

                    Rectangle {
                        width: mediaSlider.visualPosition * parent.width
                        height: parent.height
                        color: Colors.disabledText
                        radius: 2
                    }
                }
        }
    }
}
