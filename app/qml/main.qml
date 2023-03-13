import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 600
    height: 500
    title: "HelloApp"

    Text {
        id: text
        anchors.centerIn: parent
        text: "Hello World"
        font.pixelSize: 24
    }

    TextInput {
        text: "Password"
        anchors.left: text
    }
}
