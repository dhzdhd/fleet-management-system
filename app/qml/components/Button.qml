import QtQuick
import QtQuick.Controls.Basic

Item {
    property bool isPrimary: false
    property alias text: btn.text

    id: item

    implicitHeight: 50
    implicitWidth: 50

    anchors {
        leftMargin: 20
        rightMargin: 20
    }

    Button {
        id: btn
        anchors.fill: parent

        palette {
            buttonText: "white"
        }

        font {
            pointSize: 16
            weight: Font.DemiBold
        }

        background: Rectangle {
            anchors.fill: parent
            color: item.isPrimary
                ? (parent.hovered ? "#ff1966ab": "#ff2185de")
                : (parent.hovered ? "#ff282b37": "#ff323644")
            radius: btn.height / 2
        }
    }
}
