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
    property int currentRow: 0

    Universal.theme: Universal.Dark
    Universal.accent: Universal.Cobalt
    Universal.background: "black"
    Universal.foreground: "white"

    Connections {
        target: bridge

        function onCurrentRowChanged(currentRow) {
            root.currentRow = currentRow
        }
    }

    StackView {
        id: stack
        anchors.fill: parent
        initialItem: login
    }

    Views.Table {
        id: table

        Dialog {
            id: editDialog
            anchors.centerIn: parent
            title: currentRow
            standardButtons: Dialog.Ok | Dialog.Cancel
        }
    }

    Views.Login {
        id: login
        pushId: table
        stackRef: stack
    }
}
