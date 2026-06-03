import QtQml.Models
import QtQuick
import QtQuick.Controls.Basic
import SimpleImageViewer

ApplicationWindow {
    visible: true
    title: qsTr("Photo Gallery")
    color: "black"


    DelegateModel {
        id: imageDelegateModel
        model: imageModel

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
    }

    ListView {
        anchors.fill: parent
        orientation: ListView.Horizontal
        snapMode: ListView.SnapOneItem
        boundsBehavior: Flickable.StopAtBounds
        highlightRangeMode: ListView.StrictlyEnforceRange
        reuseItems: true
        model: imageDelegateModel
        focus: true
        interactive: true
    }

    ListModel {
        id: imageModel
        ListElement {
            filePath: "qrc:/SimpleImageViewer/Triad-hdr.avif"
        }
        ListElement {
            filePath: "qrc:/SimpleImageViewer/Triad-hdr.avif"
        }
    }
}
