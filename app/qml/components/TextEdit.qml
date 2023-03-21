import QtQuick
import QtQuick.Controls

Item {
    id: item

    property alias text: textInput.text
    property alias placeholderText: textInput.placeholderText
    property alias color: bg.color
    property bool isPassword: false

    implicitHeight: 60
    implicitWidth: 60

    anchors {
        leftMargin: 20
        rightMargin: 20
    }

    TextField {
        id: textInput

        anchors {
            fill: parent
            margins: 5
            leftMargin: 10
            rightMargin: 10
        }

        color: focus ? "white" : "#ffc4c4c4"

        font {
            pixelSize: 20
        }

        verticalAlignment: TextField.AlignVCenter
        placeholderTextColor: "white"
        leftPadding: 10.0
        rightPadding: 10.0
        echoMode: parent.isPassword ? TextInput.Password : TextInput.Normal

        background: Rectangle {
            id: bg

            anchors.fill: parent
            color: focus ? "#ff3d404b" : "#ff323644"
            radius: textInput.height / 2

            border {
                color: textInput.focus ? "#ff2185de" : "transparent"
                width: 2
            }

        }
    }
}
