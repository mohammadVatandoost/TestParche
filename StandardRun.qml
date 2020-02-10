import QtQuick 2.0
import QtQml 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Material 2.3

Page {
    id: root
    property int programeState: 1
    property int standardId: 1

    ColumnLayout {
        id: column
        anchors.fill: parent

        //navigation
        RowLayout {
            width: parent.width
            spacing: 60
            Layout.topMargin: 10
            Layout.alignment: Qt.AlignHCenter
            Image {
                width: 100
                height: 100
                sourceSize.height: 100
                sourceSize.width: 100
                source: "images/job.png"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                       root.StackView.view.push("qrc:/StandardsList.qml");
                    }
                }
            }
            Image {
                width: 100
                height: 100
                sourceSize.height: 100
                sourceSize.width: 100
                source: "images/settings.png"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                       console.info("image clicked!")
                    }
                }
            }
            Image {
                width: 100
                height: 100
                sourceSize.height: 100
                sourceSize.width: 100
                source: "images/sand-watch-96.png"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                       console.info("image clicked!")
                    }
                }
            }
            Image {
                width: 100
                height: 100
                sourceSize.height: 100
                sourceSize.width: 100
                source: "images/rotate.png"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                       console.info("image clicked!")
                    }
                }
            }

        }

        // standard selection
        RowLayout {
            width: parent.width
            Layout.alignment: Qt.AlignHCenter

            Label {
                text: "Standard Name: "
                font.pointSize: 20
                font.bold: true
            }
            ComboBox {
                id: comboBoxGas
                property var gasTypes: [ "NO", "CO", "SO2", "O2", "BTEX", "VOC" ]
                function getIndex() {
//                    var gasType = SensorsList.getGasTypeValue(root.sensorId)
//                    for(var i=0; i< gasTypes.length; i++) {
//                        if(gasTypes[i] === gasType) {
//                            return i;
//                        }
//                    }
                    return 0;
                }

                width: 200
                model: gasTypes
                currentIndex: getIndex()
//                onActivated: SensorsList.setGasTypeValue(root.sensorId, gasTypes[currentIndex])
            }

        }
        // tempurature
        RowLayout {
            width: parent.width
            Layout.leftMargin: 20
            Image {
                width: 100
                height: 100
                sourceSize.height: 100
                sourceSize.width: 100
                source: "images/temp.png"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                       console.info("image clicked!")
                    }
                }
            }
            Label {
                text: "27"
                font.pointSize: 20
                font.bold: true
            }
            Image {
                width: 48
                height: 48
                sourceSize.height: 24
                sourceSize.width: 24
                source: "images/celsius.png"
            }

        }
        // humidity
        RowLayout {
            width: parent.width
            Layout.leftMargin: 35
            Image {
                width: 100
                height: 100
                sourceSize.height: 100
                sourceSize.width: 100
                source: "images/humidity.png"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                       console.info("image clicked!")
                    }
                }
            }
            Label {
                text: "26 %"
                font.pointSize: 20
                font.bold: true
            }
        }
        // rain
        RowLayout {
            width: parent.width
            Layout.leftMargin: 20
            Image {
                width: 100
                height: 100
                sourceSize.height: 100
                sourceSize.width: 100
                source: "images/rain.png"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                       console.info("image clicked!")
                    }
                }
            }
            ProgressBar {
                id: rainProgressBar
                value: 0.5
                padding: 2

                background: Rectangle {
                    implicitWidth: 300
                    implicitHeight: 15
                    color: "#e6e6e6"
                    radius: 3
                }

                contentItem: Item {
                    implicitWidth: 300
                    implicitHeight: 4

                    Rectangle {
                        width: rainProgressBar.visualPosition * parent.width
                        height: parent.height
                        radius: 2
                        color: "#17a81a"
                    }
                }
            }
            Label {
                text: "05:06:36"
                font.pointSize: 20
                font.bold: true
            }
        }
        // lamp
        RowLayout {
            width: parent.width
            Layout.leftMargin: 20
            Image {
                width: 100
                height: 100
                sourceSize.height: 100
                sourceSize.width: 100
                source: "images/sun.png"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                       console.info("image clicked!")
                    }
                }
            }
            ProgressBar {
                id: lampProgressBar
                value: 0.5
                padding: 2

                background: Rectangle {
                    implicitWidth: 300
                    implicitHeight: 15
                    color: "#e6e6e6"
                    radius: 3
                }

                contentItem: Item {
                    implicitWidth: 300
                    implicitHeight: 4

                    Rectangle {
                        width: lampProgressBar.visualPosition * parent.width
                        height: parent.height
                        radius: 2
                        color: "#17a81a"
                    }
                }
            }
            Label {
                text: "05:06:36"
                font.pointSize: 20
                font.bold: true
            }
        }
       // control btn
        RowLayout {
            width: parent.width
            Layout.leftMargin: 20

            ProgressBar {
                id: totalProgressBar
                value: 0.5
                padding: 2

                background: Rectangle {
                    implicitWidth: 450
                    implicitHeight: 15
                    color: "#e6e6e6"
                    radius: 3
                }

                contentItem: Item {
                    implicitWidth: 450
                    implicitHeight: 4

                    Rectangle {
                        width: totalProgressBar.visualPosition * parent.width
                        height: parent.height
                        radius: 2
                        color: "#17a81a"
                    }
                }
            }
            Label {
                text: "05:06:36"
                font.pointSize: 20
                font.bold: true
            }
            Image {
                width: 100
                height: 100
                sourceSize.height: 100
                sourceSize.width: 100
                source: "images/start.png"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                       console.info("image clicked!")
                    }
                }
            }
            Image {
                width: 100
                height: 100
                sourceSize.height: 100
                sourceSize.width: 100
                source: "images/pause-button.png"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                       console.info("image clicked!")
                    }
                }
            }
            Image {
                width: 100
                height: 100
                sourceSize.height: 100
                sourceSize.width: 100
                source: "images/stop.png"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                       console.info("image clicked!")
                    }
                }
            }





        }
    }
}
