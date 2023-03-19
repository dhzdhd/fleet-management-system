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

        Column {
            anchors.fill: parent
            spacing: 20

            Components.TextField {
                id: b
                text: "hi"
                height: 50
            }
            Components.TextField {
                id: c
                text: "hello"
                height: 50
            }
            Components.Button {
                height: 50
                type: "primary"
                text: "Submit"
            }
            Components.Button {
                height: 50
                text: "Cancel"
            }
        }
    }
}
