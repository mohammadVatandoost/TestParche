import QtQuick 2.0
import QtQml 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Material 2.3
import QtQuick.Controls.Styles 1.4

Page {
   id: root
   property double temp: 0.0
   property double humidity: 0.0
   property double lampTemp: 0.0
   property double stdBlackTemp: 0.0
   property double analog1: 0.0
   property double analog2: 0.0
   property double lightIntensity: 0.0
   property double input1: 0.0
   property double input2: 0.0
   property bool ulteraSonic: false
   property bool mainFan: false
   property bool xenon: false
   property bool rhFan: false
   property bool motor: false
   property bool cooler: false
   property bool spray: false

   header: ToolBar {
       ToolButton {
           text: qsTr("Back")
           anchors.left: parent.left
           anchors.leftMargin: 10
           anchors.verticalCenter: parent.verticalCenter
           onClicked: {
              BackEnd.setLoadingFlag(false);
//               console.log("setting back")
               root.StackView.view.pop();
           }
       }

       Label {
           id: pageTitle
           text: "Setting"
           font.pixelSize: 20
           anchors.centerIn: parent
       }
   }

//   Component.onCompleted: {}

   ColumnLayout {
       anchors.fill: parent
       Layout.alignment: Qt.AlignHCenter
       RowLayout {
           width: parent.width*0.9
           Layout.alignment: Qt.AlignHCenter
           spacing: 80

           Grid {
              columns: 2
              spacing: 15
              ColumnLayout {
                  spacing: 5
                  Label {
                      text: qsTr("Temp :")
                      font.pointSize: 18
                  }
                  Label {
                      text: qsTr("Humidity :")
                      font.pointSize: 18
                  }
                  Label {
                      text: qsTr("Lamp Temp :")
                      font.pointSize: 18
                  }
                  Label {
                      text: qsTr("STD Black Temp :")
                      font.pointSize: 18
                  }
                  Label {
                      text: qsTr("Analog1 :")
                      font.pointSize: 18
                  }
                  Label {
                      text: qsTr("Analog2 :")
                      font.pointSize: 18
                  }
                  Label {
                      text: qsTr("Light Intensity :")
                      font.pointSize: 18
                  }
                  Label {
                      text: qsTr("Input1 :")
                      font.pointSize: 18
                  }
                  Label {
                      text: qsTr("Input2 :")
                      font.pointSize: 18
                  }
              }

              ColumnLayout {
                  Text {
                      text: qsTr(root.temp+"")
                      font.pointSize: 18
                  }
                  Text {
                      text: qsTr(root.humidity+"")
                      font.pointSize: 18
                  }
                  Text {
                      text: qsTr(root.lampTemp+"")
                      font.pointSize: 18
                  }
                  Text {
                      text: qsTr(root.stdBlackTemp+"")
                      font.pointSize: 18
                  }
                  Text {
                      text: qsTr(root.analog1+"")
                      font.pointSize: 18
                  }
                  Text {
                      text: qsTr(root.analog2+"")
                      font.pointSize: 18
                  }
                  Text {
                      text: qsTr(root.lightIntensity+"")
                      font.pointSize: 18
                  }
                  Text {
                      text: qsTr(root.input1+"")
                      font.pointSize: 18
                  }
                  Text {
                      text: qsTr(root.input2+"")
                      font.pointSize: 18
                  }
              }
           }
           ToolSeparator {
               implicitHeight: parent.height
           }
//           ColumnLayout {
//               width: pa
//               Rectangle {
//                   width: 5
//                   height: parent.height
//                   color: "black"
//               }
////           }

           Grid {
              columns: 2
              spacing: 18
              ColumnLayout {
                  spacing: 20
                  Label {
                      text: qsTr("Ultera sonice :")
                      font.pointSize: 18
                  }
                  Label {
                      text: qsTr("Main Fan :")
                      font.pointSize: 18
                  }
                  Label {
                      text: qsTr("Xenon :")
                      font.pointSize: 18
                  }
                  Label {
                      text: qsTr("RHFan :")
                      font.pointSize: 18
                  }
                  Label {
                      text: qsTr("Motor :")
                      font.pointSize: 18
                  }
                  Label {
                      text: qsTr("Cooler :")
                      font.pointSize: 18
                  }
                  Label {
                      text: qsTr("Spray :")
                      font.pointSize: 18
                  }
              }
              ColumnLayout {
                  spacing: 0
                  Switch {
                    Layout.alignment: Qt.AlignHCenter
                    checked: false
                    Layout.topMargin: -6
                    onClicked: {
                        BackEnd.setRelay(1, checked);
                    }
                  }
                  Switch {
                    Layout.alignment: Qt.AlignHCenter
//                    Layout.topMargin: -6
                    checked: false
                    onClicked: {
                        BackEnd.setRelay(2, checked);
                    }
                  }
                  Switch {
                    Layout.alignment: Qt.AlignHCenter
                    checked: false
//                    Layout.topMargin: -6
                    onClicked: {
                        BackEnd.setRelay(3, checked);
                    }
                  }
                  Switch {
                    Layout.alignment: Qt.AlignHCenter
                    checked: false
//                    Layout.topMargin: -3
                    onClicked: {
                        BackEnd.setRelay(4, checked);
                    }
                  }
                  Switch {
                    Layout.alignment: Qt.AlignHCenter
                    checked: false
                    onClicked: {
                        BackEnd.setRelay(5, checked);
                    }
                  }
                  Switch {
                    Layout.alignment: Qt.AlignHCenter
                    checked: false
                    onClicked: {
                        BackEnd.setRelay(0, checked);
                    }
                  }
                  Switch {
                    Layout.alignment: Qt.AlignHCenter
                    checked: false
                    onClicked: {
                        BackEnd.setRelay(6, checked);
                    }
                  }
              }
           }
       }

       Label {
           Layout.alignment: Qt.AlignHCenter
           text: qsTr("Light Intensity")
           font.pointSize: 22
       }
       NumberInput {
           id: ligtInteInput
           value: root.lightIntensity
       }

       Timer {
               interval: 1000; running: true; repeat: true
               property int counter: 0
               onTriggered: {
                   root.temp = BackEnd.getTemp().toFixed(2);
                   root.humidity = BackEnd.getHumidity().toFixed(2);
                   root.stdBlackTemp = BackEnd.getSTDBlackTemp().toFixed(2);
                   root.analog1 = BackEnd.getAnalog1();
                   root.analog2 = BackEnd.getAnalog2();
                   root.input1 = BackEnd.getInput1();
                   root.input2 = BackEnd.getInput2();
                   BackEnd.setLightIntensity(ligtInteInput.value);
               }
       }



//     RowLayout {
//       width: parent.width*0.9
//       Layout.alignment: Qt.AlignHCenter
////       columns: 2
//       ColumnLayout {
//           RowLayout {
//               Label {
//                   text: qsTr("Temp :")
//                   font.pointSize: 18
//               }
//               Text {
//                   text: qsTr(root.temp+"")
//                   font.pointSize: 18
//               }
//           }
//       }

//       ColumnLayout {

//       }
//     }
   }

}
