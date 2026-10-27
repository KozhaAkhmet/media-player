# Media-Player
A media player written on Qt.

## The Idea
The idea is to make a player where the interactions are more important. By this, accessing the desired song or changing something will be in fewer steps. 

This project is focused on using the Raspberry Pi with a touch screen.

![](Excalidraw/Excalidraw-Media%20Player.png)

## Update 04.07.2024:
As the basis of the project, I took these two Qt tutorials:
- [File System Manager](https://doc.qt.io/archives/qt-6.6/qtquickcontrols-filesystemexplorer-example.html)
- [Media Player](https://doc.qt.io/qt-6/qtmultimedia-video-mediaplayer-example.html) 

I successfully merged them. Now, It is possible to choose a file from the file system and play it on the screen.

## Architecture

- `filesystemmodel.cpp`/`.h` — a custom C++ model (from the File System Manager example) exposing the filesystem to QML for browsing/picking a file.
- `qml/FileSystemView.qml`, `MusicSystemView.qml`, `Sidebar.qml` — the file-browsing UI.
- `qml/MediaPlayerQml/` — the player itself: `Player.qml` (from the Media Player example) plus `AudioControl`, `PlaybackControl`, `PlaybackSeekControl`, `TracksInfo`, `MetadataInfo` sub-components.
- `Main.qml` ties the file browser and player together via the `qt_add_qml_module` registered as `MediaPlayerModule`.

## Build

Requires Qt 6 with the `Core`, `Gui`, `Quick`, `QuickControls2`, `Multimedia`, and `Svg` components (see `CMakeLists.txt`):

```sh
cmake -B build
cmake --build build
```