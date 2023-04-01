import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Universal
import QtQuick.Layouts
import "../components" as Components
import "./dialogs"
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

            RowLayout {
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.alignment: Qt.AlignBottom

                TableView {
                    id: tv
                    height: table.height
                    width: table.width
                    clip: true
                    columnSpacing: 0
                    rowSpacing: 0

                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.alignment: Qt.AlignRight

                    ScrollIndicator.horizontal: ScrollIndicator { }
                    ScrollIndicator.vertical: ScrollIndicator { }

                    model: tableModel

                    // selectionModel: ItemSelectionModel {}

                    delegate: Rectangle {
                        implicitWidth: 150
                        implicitHeight: 70

                        required property bool selected
                        required property bool current

                        color: row == 0 ? Universal.color(Universal.Cobalt): "black"

                        border {
                            width: 1
                            color: row == 0 ? "black" : Universal.color(Universal.Cobalt)
                        }

                        Loader {
                            anchors.fill: parent
                            sourceComponent: display == "-" ? buttonComponent: textComponent
                        }

                        Component {
                            id: buttonComponent

                            Button {
                                anchors.fill: parent

                                onClicked: {
                                    bridge.updateCurrentRow(row)
                                    editDialog.open()
                                }

                                Text {
                                    id: text
                                    anchors.fill: parent
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter

                                    font {
                                        pixelSize: 16
                                    }

                                    text: "📝"
                                    color: "white"
                                }
                            }
                        }

                        Component {
                            id: textComponent

                            RowLayout {
                                anchors.fill: parent

                                Text {
                                    id: text
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
    }
}
