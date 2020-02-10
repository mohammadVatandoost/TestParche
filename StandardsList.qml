import QtQuick 2.0
import QtQml 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Material 2.3

Page {
    id: root

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
        StandardInfo {}
        StandardInfo {}
    }

}
