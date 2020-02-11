import QtQuick 2.0
import QtQml 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Material 2.3
import QtQuick.Controls.Styles 1.4

Page {
    id: root

    property string titleText: "New Standard"
    property string stName: ""
    property int stTemp: 0;
    property int stHumidity: 0;
    property int stRainOn: 0
    property int stRainOff: 0
    property bool stWeathering: false
    property bool stTurnMode: false

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
            text: qsTr(root.titleText)
            font.pixelSize: 20
            anchors.centerIn: parent
        }
//        ToolButton {
//            text: qsTr("Next")
//            anchors.left: parent.left
//            anchors.leftMargin: 10
//            anchors.verticalCenter: parent.verticalCenter
//            onClicked: root.StackView.view.pop()
//        }
    }


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
                text: root.stName
                property string placeholderText: "Standard name"
                onTextChanged: {root.stName = text;}
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
                    value: root.stTemp
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
                    value: root.stHumidity
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
                  checked: root.stTurnMode
                  onClicked: {
                      root.stTurnMode = checked;
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
                  checked: root.stWeathering
                  onClicked: {
                      root.stWeathering = checked;
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
                    value: root.stRainOn
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
                    value: root.stRainOff
                }
            }
        }



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
                   StandardModel.makeNewStandard(root.stName, tempNum.value, humidityNum.value, root.stTurnMode, root.stWeathering,
                                                 rainOnTime.value, rainOffTime.value);
                    root.StackView.view.pop();
                }
            }
        }

//        Rectangle {
//            width: 160
//            height: 50
//            radius: 25
//            Layout.alignment: Qt.AlignHCenter
//            color: "red"

//            Text {
//                x: 35
//                y: 7
//                text: qsTr("Cancel")
//                font.pointSize: 22
//                color: "white"
//            }

//            MouseArea {
//                anchors.fill: parent
//                onClicked: {
//                   root.StackView.view.pop();
//                }
//            }
//        }


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
