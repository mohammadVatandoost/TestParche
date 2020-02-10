import QtQuick 2.0
import QtQml 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Material 2.3
import QtQuick.Controls.Styles 1.4

Page {
    id: root
    ColumnLayout {
        anchors.fill: parent
        Layout.alignment: Qt.AlignTop
        // StandardName
        Label {
            Layout.alignment: Qt.AlignHCenter
            text: "Standard Name "
            font.pointSize: 20
            font.bold: true
        }
        Rectangle {
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
                property string placeholderText: "Standard name"
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
            Layout.alignment: Qt.AlignHCenter
            spacing: 40
            ColumnLayout {
                // Temperature
                Label {
                    Layout.alignment: Qt.AlignHCenter
                    text: "Temperature "
                    font.pointSize: 20
                    font.bold: true
                }
                NumberInput {
                    id: tempNum
                }
            }

            ColumnLayout {
                // Humidity
                Label {
                    Layout.alignment: Qt.AlignHCenter
                    text: "Humidity "
                    font.pointSize: 20
                    font.bold: true
                }
                NumberInput {
                    id: humidityNum
                }
            }
        }

        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            spacing: 40
            ColumnLayout {
                // Turning Mode
                Label {
                    Layout.alignment: Qt.AlignHCenter
                    text: "Turning Mode "
                    font.pointSize: 20
                    font.bold: true
                }
                Switch {
                  Layout.alignment: Qt.AlignHCenter
                  checked: true
                  onClicked: {
                      console.log("switch changed");
                      console.log(checked);
                  }
                }
            }

            ColumnLayout {
                // Weathering
                Label {
                    Layout.alignment: Qt.AlignHCenter
                    text: "Weathering "
                    font.pointSize: 20
                    font.bold: true
                }
                Switch {
                  Layout.alignment: Qt.AlignHCenter
                  checked: true
                  onClicked: {
                      console.log("switch changed");
                      console.log(checked);
                  }
                }
            }
        }

        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            spacing: 40
            ColumnLayout {
                // Rain on
                Label {
                    Layout.alignment: Qt.AlignHCenter
                    text: "Rain ON(min) "
                    font.pointSize: 20
                    font.bold: true
                }
                NumberInput {
                    id: rainOnTime
                }
            }

            ColumnLayout {
                // Rain off
                Label {
                    Layout.alignment: Qt.AlignHCenter
                    text: "Rain OFF(min) "
                    font.pointSize: 20
                    font.bold: true
                }
                NumberInput {
                    id: rainOffTime
                }
            }
        }

//        Rectangle {
//            width: 50;
//            height: 160
//            radius: 25
//            Layout.alignment: Qt.AlignHCenter
//            rotation: 90
//            gradient: Gradient {
//                GradientStop { position: 0.0; color: "#ff00cc" }
//                GradientStop { position: 1.0; color: "#333399" }

////                GradientStop { position: 0.0; color: "#ef32d9" }
////                GradientStop { position: 1.0; color: "#89fffd" }

////                GradientStop { position: 0.0; color: "#be93c5" }
////                GradientStop { position: 1.0; color: "#7bc6cc" }
//            }

//            Text {
//                x: -30
//                y: 60
//                rotation: 270
//                text: qsTr("Register")
//                font.pointSize: 22
//                color: "white"
//            }

//            MouseArea {
//                anchors.fill: parent
//                onClicked: {
//                   console.info("felan")
//                }
//            }
//        }

        Rectangle {
            width: 160
            height: 50
            radius: 25
            Layout.alignment: Qt.AlignHCenter
            color: "#4CAF50"

            Text {
                x: 25
                y: 7
                text: qsTr("Register")
                font.pointSize: 22
                color: "white"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                   console.info("felan")
                }
            }
        }

        Rectangle {
            width: 160
            height: 50
            radius: 25
            Layout.alignment: Qt.AlignHCenter
            color: "red"

            Text {
                x: 35
                y: 7
                text: qsTr("Cancel")
                font.pointSize: 22
                color: "white"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                   console.info("felan")
                }
            }
        }


    }
}
