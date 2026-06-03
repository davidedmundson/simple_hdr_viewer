import QtQml.Models
import QtQuick
import QtQuick.Controls.Basic
import SimpleImageViewer

ApplicationWindow {
    visible: true
    title: qsTr("Photo Gallery")
    color: "black"



    Flickable {
        id: flickable
        anchors.fill: parent
        anchors.margins: 50
        contentWidth: row.width
        contentHeight: height
        focus: true
        interactive: true
        boundsBehavior: Flickable.StopAtBounds
        clip: true

        Row {
            id: row
            height: flickable.height

            Repeater {
                model: imageModel

                // delegate: Image {
                //     width: 400
                //     height: 400
                //     source: model.filePath
                //
                // }

                delegate: WindowContainer {
                    id: container
                    required property string filePath

                    width: flickable.width
                    height: flickable.height

                    window: ImageView {
                        width: container.width
                        height: container.height
                        path: container.filePath
                    }
                }
            }
        }
    }

    ListModel {
        id: imageModel
        ListElement {
            filePath: "qrc:/SimpleImageViewer/Triad-hdr.avif"
        }
        ListElement {
            filePath: "qrc:/SimpleImageViewer/WideGamut-Neon-DisplayP3.avif"
        }
    }
}
