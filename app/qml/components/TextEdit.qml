import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Universal

Item {
    id: item

    property alias text: textInput.text
    property alias placeholderText: textInput.placeholderText
    property bool isPassword: false

    implicitHeight: 60
    implicitWidth: 60

    TextField {
        id: textInput

        anchors {
            fill: parent
            margins: 5
            leftMargin: 10
            rightMargin: 10
        }

        font {
            pixelSize: 20
        }

        verticalAlignment: TextField.AlignVCenter
        leftPadding: 10.0
        rightPadding: 10.0
        echoMode: parent.isPassword ? TextInput.Password : TextInput.Normal
    }
}
