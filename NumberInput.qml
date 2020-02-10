import QtQuick 2.0
import QtQml 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Material 2.3
import QtQuick.Controls.Styles 1.4

RowLayout {
    id: root
    width: parent.width
    Layout.alignment: Qt.AlignHCenter
    property int value: 0
    Button {
        id: decreaseBtn
        text: qsTr("-")
        highlighted: true
        Material.background:  Material.red
        font.pixelSize: 30
        font.bold: true
        bottomPadding: 0
        topPadding: 0
        leftPadding: 0
        rightPadding: 0
        onClicked: {
            if(root.value >0) {
                root.value = root.value - 1;
            }
        }
    }
    TextEdit {
        id: temperature
        width: 250
        height: 50
        x: 15
        y: 7
        Layout.alignment: Qt.AlignHCenter
        font.pointSize: 22
        text: qsTr(root.value+"")
    }
    Button {
        id: increaseBtn
        text: qsTr("+")
        highlighted: true
        Material.background:  Material.Green
        font.pixelSize: 30
        font.bold: true
        bottomPadding: 0
        topPadding: 0
        leftPadding: 0
        rightPadding: 0
        onClicked: {
                root.value = root.value + 1;
        }
    }
}
