import QtQuick

Item {
    property alias text: textInput.text
        property alias color: rect.color

            implicitHeight: textInput.contentHeight
            implicitWidth: textInput.contentWidth

            Rectangle {
                id: rect
                anchors.fill: parent
                color: focus ? "#ff3d404b" : "#ff323644"
                radius: 10
                smooth: true
                clip: true

                border {
                    color: textInput.focus ? "#ff2185de" : "transparent"
                    width: 2
                }

                TextInput {
                    id: textInput
                    anchors {
                        fill: parent
                        margins: 5
                        leftMargin: 10
                        rightMargin: 10
                    }
                    color: focus ? "white" : "#ffc4c4c4"
                    text: "Default"
                    font {
                        pixelSize: 20
                    }
                    verticalAlignment: TextInput.AlignVCenter
                }
            }
        }
