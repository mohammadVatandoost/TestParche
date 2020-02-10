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
    property bool mode: false
    property bool raining: false
    property int rainOnTime: 42
    property int rainOffTime: 54

    implicitHeight: 100
    implicitWidth: parent.width*0.9
    Material.elevation: 5
    Layout.alignment: Qt.AlignHCenter
    Layout.topMargin: 0
ColumnLayout {
    anchors.fill: parent

 RowLayout {
    width: parent.width
    Text {
        id: name
        text: qsTr(standard.idNum+"- "+standard.name)
        font.pointSize: 20
        font.bold: true
    }
    Text {
        id: tempurature
        text: qsTr(standard.temp+" ")
        font.pointSize: 18
    }
    Image {
        width: 48
        height: 48
        sourceSize.height: 24
        sourceSize.width: 24
        source: "images/celsius.png"
    }
    Text {
//                id: name
        text: qsTr(standard.humidity+" %")
    }
    Text {
//                id: name
        text: standard.mode ? qsTr("On") : qsTr("Off")
    }
    Text {
//                id: name
        text: standard.raining ? qsTr("raining") : qsTr("not raining")
    }
    Text {
//                id: name
        text: qsTr(standard.rainOnTime+" min")
    }
    Text {
//                id: name
        text: qsTr(standard.rainOffTime+" min")
    }
 }
 RowLayout {
     Image {
         width: 48
         height: 48
         sourceSize.height: 24
         sourceSize.width: 24
         source: "images/edit-64.png"
     }
     Image {
         width: 48
         height: 48
         sourceSize.height: 24
         sourceSize.width: 24
         source: "images/delete-64.png"
     }
 }
}
}
