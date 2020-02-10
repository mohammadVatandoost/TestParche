import QtQuick 2.0
import QtQml 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Material 2.3
import QtQuick.Controls.Styles 1.4

Page {
   id: root
   property string xenonLifeTime: "00:00:00"
   property string filter1Time: "00:00:00"
   property string filter2Time: "00:00:00"
   property string filter3Time: "00:00:00"
   property string filter4Time: "00:00:00"
   property string filter5Time: "00:00:00"
   property string filter6Time: "00:00:00"
   property bool filter1: false
   property bool filter2: false
   property bool filter3: false
   property bool filter4: false
   property bool filter5: false
   property bool filter6: false

   ColumnLayout {
       anchors.fill: parent
       Layout.alignment: Qt.AlignHCenter

//       RowLayout {
//           width: parent.width*0.9
//           Layout.alignment: Qt.AlignHCenter
//           anchors.horizontalCenter: parent.horizontalCenter
//           spacing: 50

           Grid {
              width: parent.width*0.9
              Layout.alignment: Qt.AlignHCenter
              columns: 2
              spacing: 30

              ColumnLayout {
                  Label {
                      Layout.alignment: Qt.AlignHCenter
                      text: qsTr("Test Time")
                      font.pointSize: 22
                      Layout.topMargin: 20
                  }

                  RowLayout {
                      width: parent.width
                      spacing: 20
                      Layout.topMargin: 20
                     ColumnLayout{
                         Label {
                             Layout.alignment: Qt.AlignHCenter
                             text: qsTr("Hour")
                             font.pointSize: 18
                         }
                         NumberInput {}
                     }
                     ColumnLayout{
                         Label {
                             Layout.alignment: Qt.AlignHCenter
                             text: qsTr("Minute")
                             font.pointSize: 18
                         }
                         NumberInput {}
                     }
                  }
              }

              ColumnLayout {
                  RowLayout {
                      Label {
                          text: qsTr("Xenon Lamp Life Time :")
                          font.pointSize: 18
                      }
                      Text {
                          text: qsTr(root.xenonLifeTime+"")
                          font.pointSize: 18
                      }
                  }

                  Label {
                      text: qsTr("Filters Life Time :")
                      font.pointSize: 22
                      Layout.topMargin: 20
                  }

                  RowLayout {
                      CheckBox {
                              text: qsTr("")
                              checked: true
                      }
                      Label {
                          text: qsTr("Filter1 : ")
                          font.pointSize: 18
                      }
                      Text {
                          text: qsTr(root.filter1Time+"")
                          font.pointSize: 18
                      }
                  }
                  RowLayout {
                      CheckBox {
                              text: qsTr("")
                              checked: true
                      }
                      Label {
                          text: qsTr("Filter2 : ")
                          font.pointSize: 18
                      }
                      Text {
                          text: qsTr(root.filter2Time+"")
                          font.pointSize: 18
                      }
                  }
                  RowLayout {
                      CheckBox {
                              text: qsTr("")
                              checked: true
                      }
                      Label {
                          text: qsTr("Filter3 : ")
                          font.pointSize: 18
                      }
                      Text {
                          text: qsTr(root.filter3Time+"")
                          font.pointSize: 18
                      }
                  }
                  RowLayout {
                      CheckBox {
                              text: qsTr("")
                              checked: true
                      }
                      Label {
                          text: qsTr("Filter4 : ")
                          font.pointSize: 18
                      }
                      Text {
                          text: qsTr(root.filter4Time+"")
                          font.pointSize: 18
                      }
                  }
                  RowLayout {
                      CheckBox {
                              text: qsTr("")
                              checked: true
                      }
                      Label {
                          text: qsTr("Filter5 : ")
                          font.pointSize: 18
                      }
                      Text {
                          text: qsTr(root.filter5Time+"")
                          font.pointSize: 18
                      }
                  }
                  RowLayout {
                      CheckBox {
                              text: qsTr("")
                              checked: true
                      }
                      Label {
                          text: qsTr("Filter6 : ")
                          font.pointSize: 18
                      }
                      Text {
                          text: qsTr(root.filter6Time+"")
                          font.pointSize: 18
                      }
                  }

              }

           }
//       }

       RowLayout {
           spacing: 50
           width: parent.width*0.9
           Layout.alignment: Qt.AlignHCenter
           Button {
               text: qsTr("Cancel")
               highlighted: true
               Material.background: Material.Red
               onClicked: {
               }
           }
           Button {
               text: qsTr("Save")
               highlighted: true
               Material.background: Material.Green
               onClicked: {
               }
           }
       }


   }

}
