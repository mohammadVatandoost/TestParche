import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Material 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.FreeVirtualKeyboard 1.0

Page {
    id: root

    header: ToolBar {
        ToolButton {
            text: qsTr("Back")
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            onClicked: root.StackView.view.pop()
        }

        Label {
            id: pageTitle
            text: "Login"
            font.pixelSize: 20
            anchors.centerIn: parent
        }
    }

    ColumnLayout {
//        anchors.fill: parent
        width: parent.width
        height: 200


        Rectangle {
            Layout.topMargin: 100
            Layout.alignment: Qt.AlignHCenter
            width: 270
            height: 54
            border.width: 1
            radius: 25

            TextEdit {
                id: standardName
                width: 250
                height: 50
                x: 15
                y: 7
                Layout.alignment: Qt.AlignHCenter
                font.pointSize: 22
                property string placeholderText: "Password"
                Text {
                    Layout.alignment: Qt.AlignHCenter
                    text: standardName.placeholderText
                    color: "#aaa"
                    font.pointSize: 22
                    visible: !standardName.text && !standardName.activeFocus
                }
            }
        }

        RowLayout {
                   spacing: 50
                   width: parent.width*0.9
                   Layout.alignment: Qt.AlignHCenter
                   Button {
                       text: qsTr("Cancel")
                       highlighted: true
                       Material.background: Material.Red
                       onClicked: {
                       }
                   }
                   Button {
                       text: qsTr("Login")
                       highlighted: true
                       Material.background: Material.Green
                       onClicked: {
                           root.StackView.view.push("qrc:/Setting.qml");
                       }
                   }
               }


    }

}
