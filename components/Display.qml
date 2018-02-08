import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Window 2.2

Item {
    property string dispText: "0"
    property int dispWidth: parent.width
    property int dispHeight: 175
    property int maxDigits: 10

    width: dispWidth
    height: dispHeight

    function appendDigit(digit) {
        dispText = dispText + digit
    }

    function show(value) {
        dispText = value
    }

    function clear() {
        dispText = "0"
    }

    Pane {
        background: Rectangle {
            color: "#249cf2"
            width: dispWidth
            height: dispHeight
        }

        Label {
            text: dispText
            font.pixelSize: 47
            color: "white"
        }
    }
}
