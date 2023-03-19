import QtQuick
import QtQuick.Controls
import "components" as Components

ApplicationWindow {
    visible: true
    width: 600
    height: 500
    title: "Fleet Management System"


    Rectangle {
        id: container
        anchors.fill: parent
        color: '#ff282a37'

        Components.TextField {
            id: b
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
            }
            text: "hi"
            height: 50
        }
        Components.TextField {
            id: c
            anchors {
                bottom: parent.bottom
                left: parent.left
                right: parent.right
            }
            text: "hello"
            height: 50
        }

        // Component.Button {}
    }
}
