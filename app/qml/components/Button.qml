import QtQuick
import QtQuick.Controls.Universal

Item {
    property bool isPrimary: false
    property alias text: btn.text
    signal clicked

    id: item

    implicitHeight: 50
    implicitWidth: 50

    Button {
        id: btn
        anchors.fill: parent

        // palette {
        //     buttonText: "white"
        // }

        font {
            pointSize: 16
            // weight: Font.DemiBold
        }

        highlighted: isPrimary

        // Universal.accent: Universal.Teal
        // Universal.background: Universal.Teal
        // Universal.foreground: Universal.color("white")

        onClicked: item.clicked()

        // background: Rectangle {
        //     anchors.fill: parent
        //     // Universal.background: Universal.Teal
        //     // item.isPrimary
        //         // ? (parent.hovered ? Universal.Teal: "#ff2185de")
        //         // : (parent.hovered ? "#ff282b37": "#ff323644")
        //     radius: btn.height / 2
        // }
    }
}
