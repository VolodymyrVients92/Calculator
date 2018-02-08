import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Item {
    property string label: " "
    property int    butWidth: 75
    property int    butHeight: 57
    property bool   operator: false
    property bool   highlight: false
    property color  butColor: "#ecedea"

    width: customButton.implicitWidth
    height: customButton.implicitHeight

    function processDigitEvent() {
        highlight = false
    }

    function processOperatorEvent() {

        if(!window.isCurrentOperator(label))
            highlight = false
    }

    Button {
        id: customButton

        Text {
            id: butLabel
            text: label
            font.pointSize: 36
            anchors.horizontalCenter: parent.horizontalCenter
        }

        style: ButtonStyle {
            background: Rectangle {
                implicitWidth: butWidth
                implicitHeight: butHeight
                color: (mouse.pressed || highlight) ? Qt.darker(butColor) : butColor
            }
        }
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        onClicked: {
            if (operator) {
                highlight = true
                window.operatorPressed(label)
            } else {
                window.digitPressed(label)
            }
        }
    }

    Component.onCompleted: {
        window.digitPressedSignal.connect(processDigitEvent)
        window.operatorPressedSignal.connect(processOperatorEvent)
    }
}
