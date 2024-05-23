
import QtQuick
import QtQuick.Effects
import QtQuick.Controls.Basic
import MediaPlayerModule

pragma ComponentBehavior: Bound

// This is the file system view which gets populated by the C++ model.
Rectangle {
    id: root

    // signal fileClicked(string filePath)
    // property alias rootIndex: musicSystemTreeView.rootIndex

    TreeView {
        id: musicSystemTreeView

        // property int lastIndex: -1

        anchors.fill: parent
        // model: FileSystemModel
        // rootIndex: FileSystemModel.rootIndex
        // boundsBehavior: Flickable.StopAtBounds
        // boundsMovement: Flickable.StopAtBounds
        // clip: true
        Text {
            text: qsTr("Music System View")
            wrapMode: TextArea.Wrap
            color: Colors.text
        }
    }
}
