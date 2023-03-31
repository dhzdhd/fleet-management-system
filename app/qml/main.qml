import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Universal
import "views" as Views

ApplicationWindow {
    id: root
    visible: true
    width: 600
    height: 500
    title: "Fleet Management System"

    property QtObject bridge

    Universal.theme: Universal.Dark
    Universal.accent: Universal.Cobalt
    Universal.background: "black"
    Universal.foreground: "white"

    Connections {
        target: bridge

        function onUpdated(msg) {
            console.log(msg)
        }
    }

    StackView {
        id: stack
        anchors.fill: parent
        initialItem: login
    }

    Views.Table {
        id: table
    }

    Views.Login {
        id: login
        pushId: table
        stackRef: stack
    }
}
