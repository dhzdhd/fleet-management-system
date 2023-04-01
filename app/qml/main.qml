import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Universal
import QtQuick.Layouts
import "components" as Components
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

            height: parent.height - 50
            width: parent.width - 50

            title: currentRow
            standardButtons: Dialog.Ok | Dialog.Cancel

            ListView {
                property var listData

                anchors.fill: parent
                model: editListModel
                spacing: 10
                clip: true
                delegate: RowLayout {
                    anchors {
                        left: parent.left
                        right: parent.right
                    }
                    height: 50

                    Text {
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignLeft

                        font {
                            pixelSize: 16
                        }
                        color: "white"

                        text: "listData"
                    }

                    Components.TextEdit {
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignRight
                        placeholderText: "listData"
                    }
                }
            }
        }
    }

    Views.Login {
        id: login
        pushId: table
        stackRef: stack
    }
}
