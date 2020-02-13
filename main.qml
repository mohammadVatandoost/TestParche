import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.11
import QtQuick.FreeVirtualKeyboard 1.0
import QtQuick.Extras 1.4

Window {
    id: window
    visible: true
    width: 768
    height: 680
    property bool stackViewVisibility: false
//    title: qsTr("Hello World")
    StackView {
        id: stackView
        visible: window.stackViewVisibility
        anchors.fill: parent
        popEnter:  Transition {}
        popExit: Transition {}
        pushEnter: Transition {}
        pushExit: Transition {}
        replaceEnter: Transition {}
        replaceExit: Transition {}
//        initialItem: SplashScreen {}
        initialItem: StandardRun {}
//        initialItem: StandardsList {}
//        initialItem: NewStandard {}
//        initialItem: Setting {}
//        initialItem: TimeSetting {}
    }

    SplashScreen {
        visible: !window.stackViewVisibility
        Component.onCompleted: {
            stackView.push("qrc:/StandardsList.qml");
//            stackView.view.push("qrc:/StandardsList.qml");
        }
    }

    InputPanel {
        id: inputPanel
        z: 1000
        y: stackView.height
        anchors.left: parent.left
        anchors.right: parent.right
        states: State {
            name: "visible"
            when: Qt.inputMethod.visible
            PropertyChanges {
                target: inputPanel
                y: stackView.height - inputPanel.height
            }
        }
        transitions: Transition {
            from: ""
            to: "visible"
            reversible: true
            ParallelAnimation {
                NumberAnimation {
                    properties: "y"
                    duration: 150
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }
    Timer {
            interval: 3000; running: true; repeat: false
            property int counter: 0
            onTriggered: {
                stackView.pop();
                window.stackViewVisibility = true;
                if(counter%2===0) {

                } else {

                }
                counter++;

            }
     }
}
