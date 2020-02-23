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
    property string rainTime: "03:04:05"
    property string sunnyTime: "03:04:05"
    property string totalTime: "03:04:05"
    property double temperature: 27.3
    property double humidity: 41
    property int menuSize: 64
    property int iconSize: 72
    property bool loading: false
    property int algState: 0

    function msToTime(duration) {
          var milliseconds = parseInt((duration % 1000) / 100),
            seconds = Math.floor((duration / 1000) % 60),
            minutes = Math.floor((duration / (1000 * 60)) % 60),
            hours = Math.floor((duration / (1000 * 60 * 60)) % 24);

          hours = (hours < 10) ? "0" + hours : hours;
          minutes = (minutes < 10) ? "0" + minutes : minutes;
          seconds = (seconds < 10) ? "0" + seconds : seconds;

          return hours + ":" + minutes + ":" + seconds;
    }


    ColumnLayout {
        id: column
        anchors.fill: parent

        //navigation
        RowLayout {
            width: parent.width
            spacing: 60
            Layout.topMargin: 10
            Layout.alignment: Qt.AlignHCenter
            Pane {
                id: container1
                width: root.menuSize
                height: root.menuSize
                Material.elevation: 6

                ColumnLayout {
                    Image {
                        width: root.menuSize
                        height: root.menuSize
                        sourceSize.height: root.menuSize
                        sourceSize.width: root.menuSize
                        source: "images/job.png"
                        asynchronous: true
                        visible: !root.loading

                    }
                    BusyIndicator {
                        visible: root.loading
                        running: root.loading
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if(!root.loading) {
                                BackEnd.setLoadingFlag(true);
                                root.StackView.view.push("qrc:/StandardsList.qml");
                            }
                        }
                    }
                }


            }
            Pane {
                width: root.menuSize
                height: root.menuSize
                Material.elevation: 6
                ColumnLayout {
                    Image {
                        width: root.menuSize
                        height: root.menuSize
                        sourceSize.height: root.menuSize
                        sourceSize.width: root.menuSize
                        source: "images/settings.png"
                        asynchronous: true
                        visible: !root.loading

                    }
                    BusyIndicator {
                        visible: root.loading
                        running: root.loading
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if(!root.loading) {
                                BackEnd.setLoadingFlag(true);
                                root.StackView.view.push("qrc:/Login.qml");
                            }
                        }
                    }
                }
            }
            Pane {
                width: root.menuSize
                height: root.menuSize
                Material.elevation: 6
                ColumnLayout {
                    Image {
                        width: root.menuSize
                        height: root.menuSize
                        sourceSize.height: root.menuSize
                        sourceSize.width: root.menuSize
                        source: "images/sand-watch-96.png"
                        asynchronous: true
                        visible: !root.loading

                    }
                    BusyIndicator {
                        visible: root.loading
                        running: root.loading
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if(!root.loading) {
                                BackEnd.setLoadingFlag(true);
                                root.StackView.view.push("qrc:/TimeSetting.qml");
                            }
                        }
                    }
                }
            }

            Pane {
                width: root.menuSize
                height: root.menuSize
                Material.elevation: 6
                Image {
                    width: root.menuSize
                    height: root.menuSize
                    sourceSize.height: root.menuSize
                    sourceSize.width: root.menuSize
                    source: "images/rotate.png"
                    asynchronous: true
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                           console.info("image clicked!")
                        }
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
                id: comboBoxSt
                implicitWidth: 250
                model: StandardModel
                textRole: 'standardName'
                currentIndex: 0
//                onActivated: SensorsList.setGasTypeValue(root.sensorId, gasTypes[currentIndex])
            }

        }

        RowLayout {
            width: parent.width
            // tempurature
            RowLayout {
                width: parent.width*0.4
                Layout.leftMargin: 20
                Image {
                    width: root.iconSize
                    height: root.iconSize
                    sourceSize.height: root.iconSize
                    sourceSize.width: root.iconSize
                    source: "images/temp.png"
                    asynchronous: true
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                           console.info("image clicked!")
                        }
                    }
                }
                Label {
                    text: qsTr(root.temperature+"")
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
                width: parent.width*0.4
                Layout.leftMargin: parent.width*0.4
                Image {
                    width: root.iconSize
                    height: root.iconSize
                    sourceSize.height: root.iconSize
                    sourceSize.width: root.iconSize
                    source: "images/humidity.png"
                    asynchronous: true
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                           console.info("image clicked!")
                        }
                    }
                }
                Label {
                    text: qsTr(root.humidity+" %")
                    font.pointSize: 20
                    font.bold: true
                }
            }
        }

        // rain
        RowLayout {
            width: parent.width
            Layout.leftMargin: 20
            Image {
                width: root.iconSize
                height: root.iconSize
                sourceSize.height: root.iconSize
                sourceSize.width: root.iconSize
                source: (algState === 0) ? "images/rain0.png" : ( (algState === 1) ? "images/rain1.png" : ((algState === 2) ? "images/rain2.png" : "images/rain3.png") )
                asynchronous: true
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
                    implicitWidth: 350
                    implicitHeight: 15
                    color: "#e6e6e6"
                    radius: 3
                }

                contentItem: Item {
                    implicitWidth: 350
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
                text: qsTr(root.rainTime)
                font.pointSize: 20
                font.bold: true
            }
        }
        // lamp
        RowLayout {
            width: parent.width
            Layout.leftMargin: 20
            Image {
                width: root.iconSize
                height: root.iconSize
                sourceSize.height: root.iconSize
                sourceSize.width: root.iconSize
                source: "images/sun.png"
                asynchronous: true
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
                    implicitWidth: 350
                    implicitHeight: 15
                    color: "#e6e6e6"
                    radius: 3
                }

                contentItem: Item {
                    implicitWidth: 350
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
                text: qsTr(root.sunnyTime)
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
                text: qsTr(root.totalTime)
                font.pointSize: 20
                font.bold: true
            }
            Image {
                width: root.iconSize
                height: root.iconSize
                sourceSize.height: root.iconSize
                sourceSize.width: root.iconSize
                visible: (root.programeState === 1 || root.programeState === 3) ? true : false
                source: "images/start.png"
                asynchronous: true
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                       root.programeState = 2;
                       BackEnd.algStart(comboBoxSt.currentIndex);
                    }
                }
            }
            Image {
                width: root.iconSize
                height: root.iconSize
                sourceSize.height: root.iconSize
                sourceSize.width: root.iconSize
                source: "images/pause-button.png"
                visible: (root.programeState === 2) ? true : false
                asynchronous: true
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                       root.programeState = 3;
                       BackEnd.algPause();
                    }
                }
            }
            Image {
                width: root.iconSize
                height: root.iconSize
                sourceSize.height: root.iconSize
                sourceSize.width: root.iconSize
                source: "images/stop.png"
                visible: (root.programeState === 2 || root.programeState === 3) ? true : false
                asynchronous: true
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                       root.programeState = 1;
                       BackEnd.algStop();
                    }
                }
            }





        }
    }
    Timer {
            interval: 500; running: true; repeat: true
            property int counter: 0
            onTriggered: {
                root.loading = BackEnd.getLoadingFlag();
                root.temperature = BackEnd.getTemp().toFixed(2);
                root.humidity = BackEnd.getHumidity().toFixed(2);
                totalProgressBar.value = BackEnd.getTotalTimeP().toFixed(2);
                lampProgressBar.value = BackEnd.getRainOffP().toFixed(2);
                rainProgressBar.value = BackEnd.getRainOnP().toFixed(2);
                root.sunnyTime = msToTime(BackEnd.getRainOffTime());
                root.rainTime = msToTime(BackEnd.getRainOnTime());
                root.totalTime = msToTime(BackEnd.getTotalTime());
                if(BackEnd.getAlgState() === 0) {
                    root.programeState == 1;
                    algState = 0;
                } else if(BackEnd.getAlgState() === 1) {
                    algState = 0;
                } else {
                    if(algState===4) {
                       algState = 0;
                    }
                   algState = algState + 1;
                }
            }
    }

}
