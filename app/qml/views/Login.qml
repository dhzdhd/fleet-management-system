import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../components" as Components

Item {
    id: login
    property var pushId
    property var stackRef

    Rectangle {
        id: mainContainer
        anchors.fill: parent
        color: "black"

        GridLayout {
            anchors.fill: parent
            rows: 3
            columns: 1

            ColumnLayout {
                id: topContainer
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                Layout.rowSpan: 2
                height: parent.height * 2 / 3
                spacing: 10

                Text {
                    text: "Fleet Management"
                    Layout.alignment: Qt.AlignHCenter
                    Layout.bottomMargin: 20
                    color: "white"
                    font {
                        pixelSize: 32
                    }
                }

                Components.TextEdit {
                    id: usernameField
                    Layout.fillWidth: true
                    placeholderText: "Username"
                }
                Components.TextEdit {
                    id: passwordField
                    Layout.fillWidth: true
                    placeholderText: "Password"
                    isPassword: true
                }
            }

            ColumnLayout {
                id: bottomContainer
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                Layout.rowSpan: 1
                height: parent.height / 3
                spacing: 20

                Components.Button {
                    id: submitButton
                    Layout.fillWidth: true
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10

                    isPrimary: true
                    text: "Submit"
                    onClicked: {
                        if (bridge.validate(usernameField.text, passwordField.text)) {
                            stackRef.pop()
                            stackRef.push(pushId)
                        }
                    }
                }
                Components.Button {
                    id: cancelButton

                    Layout.fillWidth: true
                    Layout.leftMargin: 10
                    Layout.rightMargin: 10

                    text: "Exit"
                    onClicked: {
                        bridge.quit()
                    }
                }
            }
        }
    }
}
