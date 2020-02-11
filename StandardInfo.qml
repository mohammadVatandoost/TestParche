import QtQuick 2.0
import QtQml 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Material 2.3

Pane {
    id: standard
    property int idNum: 1
    property string name: "standard name"
    property double temp: 27
    property double humidity: 27
    property bool turnMode: false
    property bool weathering: false
    property int rainOnTime: 42
    property int rainOffTime: 54

    implicitHeight: 60
    implicitWidth: parent.width*0.9
    Material.elevation: 5
    Layout.alignment: Qt.AlignHCenter
    Layout.topMargin: 0
    anchors.horizontalCenter: parent.horizontalCenter

 RowLayout {
    width: parent.width
    spacing: 10

    Item {
        width: 400
        height: 60
        Text {
            text: qsTr(standard.idNum+"- "+standard.name)
            font.pointSize: 20
            font.bold: true
        }
    }

    Image {
        width: 48
        height: 48
        sourceSize.height: 36
        sourceSize.width: 36
        source: "images/edit-64.png"
        Layout.alignment: Qt.AlignRight
        MouseArea {
            anchors.fill: parent
            onClicked: {
               root.StackView.view.push("qrc:/NewStandard.qml", {"titleText": "Edit Standard "+standard.idNum, "stName": standard.name,
                                        "stTemp": standard.temp, "stHumidity": standard.humidity, "stRainOn": standard.rainOnTime,
                                        "stRainOff": standard.rainOffTime, "stWeathering": standard.weathering,
                                            "stTurnMode": standard.turnMode, "standardId": standard.idNum, "isEdite": true});
            }
        }
    }

    Image {
        width: 48
        height: 48
        sourceSize.height: 36
        sourceSize.width: 36
        source: "images/delete-64.png"
        Layout.alignment: Qt.AlignRight
        MouseArea {
            anchors.fill: parent
            onClicked: {
                StandardModel.removeStandard(standard.idNum);
            }
        }
    }

 }
}


//// temperature
//RowLayout {
//    Image {
//        width: 48
//        height: 48
//        sourceSize.height: 36
//        sourceSize.width: 36
//        source: "images/temp.png"
//    }
//    Text {
//        id: tempurature
//        text: qsTr(standard.temp+" ")
//        font.pointSize: 18
//    }
//    Image {
//        width: 48
//        height: 48
//        sourceSize.height: 24
//        sourceSize.width: 24
//        source: "images/celsius.png"
//    }
//}

//// humidity
//RowLayout {
//    Image {
//        width: 48
//        height: 48
//        sourceSize.height: 36
//        sourceSize.width: 36
//        source: "images/humidity.png"
//    }
//    Text {
//        text: qsTr(standard.humidity+" %")
//        font.pointSize: 18
//    }
//}


//Text {
//    text: standard.mode ? qsTr("On") : qsTr("Off")
//}
//Text {
////                id: name
//    text: standard.raining ? qsTr("raining") : qsTr("not raining")
//}
//Text {
////                id: name
//    text: qsTr(standard.rainOnTime+" min")
//}
//Text {
////                id: name
//    text: qsTr(standard.rainOffTime+" min")
//}
