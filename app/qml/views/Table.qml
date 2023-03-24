import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Universal
import QtQuick.Layouts
import "../components" as Components
import Qt.labs.qmlmodels

Item {
    id: table

    Rectangle {
        anchors.fill: parent
        color: "black"

        ColumnLayout {
            anchors.fill: parent
            spacing: 0
            clip: true

            RowLayout {
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignTop
                height: 70

                ComboBox {
                    Layout.fillWidth: true
                    model: ["emp", "client", "work_exp", "prj_details", "emp_skill"]
                    padding: 0
                    height: 70
                    onActivated: (index) => {
                        bridge.setTable(textAt(index))
                    }

                    font {
                        pixelSize: 16
                    }
                }
            }

            TableView {
                id: tableview
                height: table.height
                width: table.width
                clip: true
                columnSpacing: 0
                rowSpacing: 0

                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.alignment: Qt.AlignBottom

                ScrollIndicator.horizontal: ScrollIndicator { }
                ScrollIndicator.vertical: ScrollIndicator { }

                // model: TableModel {
                //     TableModelColumn { display: "name" }

                //     rows: [
                //         {
                //             name: "a"
                //         }
                //     ]
                // }

                model: tableModel

                selectionModel: ItemSelectionModel {}

                delegate: Rectangle {
                    implicitWidth: 150
                    implicitHeight: 70
                    clip: true

                    required property bool selected
                    required property bool current

                    color: current ? Universal.color(Universal.Cobalt): "black"

                    border {
                        width: 1
                        color: Universal.color(Universal.Cobalt)
                    }

                    RowLayout {
                        anchors.fill: parent
                        Text {
                            id: text
                            // Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter

                            font {
                                pixelSize: 16
                            }

                            color: "white"
                            text: display
                        }
                    }
                }
            }
        }
    }
}
