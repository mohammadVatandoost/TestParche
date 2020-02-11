import QtQuick 2.0
import QtQml 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Material 2.3

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
            text: "Standards List"
            font.pixelSize: 20
            anchors.centerIn: parent
        }
    }

    ColumnLayout {
        id: column
        anchors.fill: parent
        Button {
            id: closeBtn
            text: qsTr("New Standard")
            Layout.alignment: Qt.AlignHCenter
            highlighted: true
            Material.background: Material.Green
            onClicked: {
                 root.StackView.view.push("qrc:/NewStandard.qml");
            }
        }
        ListView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.topMargin: 5
            anchors.horizontalCenter: parent.horizontalCenter
            Layout.alignment: Qt.AlignHCenter
            clip: true
            id: listView
            spacing: 10

           model: StandardModel
           delegate: StandardInfo {
                idNum: model.index+1
                name: model.standardName
                temp: model.temperature
                humidity: model.humidity
                rainOffTime: model.rainOff
                rainOnTime: model.rainOn
                weathering: model.weathering
                turnMode: model.turningMode
            }
         }
    }

}
