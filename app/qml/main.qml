import QtQuick
import QtQuick.Controls
import "components" as Components

ApplicationWindow {
    visible: true
    width: 600
    height: 500
    title: "Fleet Management System"


    Rectangle {
        id: mainContainer
        anchors.fill: parent
        color: '#ff282a37'

        Column {
            anchors.fill: parent
            Rectangle {
                id: topContainer
                anchors {
                    left: parent.left
                    right: parent.right
                }
                height: parent.height * 2 / 3
                color: "transparent"

                Column {
                    anchors {
                        left: parent.left
                        right: parent.right
                        verticalCenter: parent.verticalCenter
                    }
                    spacing: 20

                    Text {
                        text: "Fleet Management"
                        anchors {
                            horizontalCenter: parent.horizontalCenter
                        }
                        color: "white"
                        font {
                            pixelSize: 32
                        }
                    }

                    Components.TextField {
                        id: usernameField
                        text: "Username"
                        height: 50
                    }
                    Components.TextField {
                        id: passwordField
                        text: "Password"
                        height: 50
                    }
                }
            }

            Rectangle {
                id: bottomContainer
                anchors {
                    left: parent.left
                    right: parent.right
                }
                height: parent.height / 3
                color: "transparent"

                Column {
                    anchors {
                        left: parent.left
                        right: parent.right
                        verticalCenter: parent.verticalCenter
                    }
                    spacing: 20

                    Components.Button {
                        id: submitButton
                        height: 50
                        type: "primary"
                        text: "Submit"
                    }
                    Components.Button {
                        id: cancelButton
                        height: 50
                        text: "Cancel"
                    }
                }
            }
        }
    }
}
