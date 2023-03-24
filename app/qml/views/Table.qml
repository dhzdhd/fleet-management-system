import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../components" as Components
import Qt.labs.qmlmodels

Item {
    id: table

    Rectangle {
        anchors.fill: parent
        color: "#ff282a37"

        ColumnLayout {
            anchors.fill: parent
            spacing: 0
            clip: true

            RowLayout {
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignTop

                ComboBox {
                    Layout.fillWidth: true
                    model: ["emp", "client", "work_exp", "prj_details", "emp_skill"]
                    onActivated: (index) => {
                        bridge.setTable(textAt(index))
                    }
                }
            }

            TableView {
                id: tableview
                height: table.height
                width: table.width
                clip: true
                columnSpacing: 1
                rowSpacing: 1

                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.alignment: Qt.AlignBottom

                ScrollIndicator.horizontal: ScrollIndicator { }
                ScrollIndicator.vertical: ScrollIndicator { }

                // Layout.alignment: Qt.AlignVCenter
                // anchors.fill: parent

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
                    implicitWidth: text.width + 50
                    implicitHeight: 50

                    required property bool selected
                    required property bool current

                    color: current ? "#ff1966ab": "#ff282a37"

                    RowLayout {
                        Text {
                            id: text
                            Layout.alignment: Qt.AlignHCenter

                            color: "white"
                            text: display
                        }

                        Button {
                            Layout.alignment: Qt.AlignHCenter
                            height: 20
                            width: 20
                            onClicked: {
                                // bridge.setData()
                                console.log(tableview.currentColumn)
                            }
                        }
                    }
                }
            }
        }
    }
}
