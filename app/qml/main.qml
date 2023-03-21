import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "components" as Components
import "views" as Views

ApplicationWindow {
    visible: true
    width: 600
    height: 500
    title: "Fleet Management System"

    property QtObject interbridge

    Connections {
        target: interbridge

        function onUpdated(msg) {
            console.log(msg)
        }
    }

    StackView {
        id: stack
        anchors.fill: parent
        initialItem: login
    }

    Views.Login {
        id: login
        bridge: interbridge
    }
}
