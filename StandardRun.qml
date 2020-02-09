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

        //navigation
        RowLayout {
            width: parent.width
            Button {
                Layout.alignment: Qt.AlignHCenter
                icon.name: "minimize"
                icon.source:  "images/setting.jpg"
                highlighted: true
                Material.background: "black"
                onClicked: {}
             }
        }

        RowLayout {
            width: parent.width

            Label {
                text: "Standard Name: "
            }
            ComboBox {
                id: comboBoxGas
                property var gasTypes: [ "NO", "CO", "SO2", "O2", "BTEX", "VOC" ]
                function getIndex() {
                    var gasType = SensorsList.getGasTypeValue(root.sensorId)
                    for(var i=0; i< gasTypes.length; i++) {
                        if(gasTypes[i] === gasType) {
                            return i;
                        }
                    }
                    return 0;
                }

                width: 200
                model: gasTypes
                currentIndex: getIndex()
//                onActivated: SensorsList.setGasTypeValue(root.sensorId, gasTypes[currentIndex])
            }
            Button {
                id: openBtn
                text: qsTr("Start")
                highlighted: true
                Material.background: (root.programeState === 2) ? Material.Green : Material.red
                onClicked: {
                    root.programeState = 2;
                }
            }

            Button {
                id: normalBtn
                text: qsTr("Pause")
                highlighted: true
                Material.background: (root.programeState === 0) ? Material.Green : Material.red
                onClicked: {
                    root.programeState = 0;
                }
            }

            Button {
                id: closeBtn
                text: qsTr("Stop")
                highlighted: true
                Material.background: (root.programeState === 1) ? Material.Green : Material.red
                onClicked: {
                    root.programeState = 1;
                }
            }
        }

        RowLayout {
            width: parent.width

//            Col
        }
    }
}
