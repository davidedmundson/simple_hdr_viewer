import QtQml.Models
import QtQuick
import QtQuick.Controls.Basic
import SimpleImageViewer

ApplicationWindow {
    visible: true
    title: qsTr("Photo Gallery")
    color: "black"



    ListView {
        anchors.fill: parent
        anchors.margins: 50
        orientation: ListView.Horizontal
        snapMode: ListView.SnapOneItem
        boundsBehavior: Flickable.StopAtBounds
        highlightRangeMode: ListView.StrictlyEnforceRange
        reuseItems: true
        model: imageModel
        focus: true
        interactive: true

           delegate: WindowContainer {
            id: container
            required property string filePath

            width: ListView.view.width
            height: ListView.view.height

            window: ImageView {
                width: container.width
                height: container.height
                path: filePath
            }
        }

        // delegate: Image {
        //     source: filePath
        // }
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
