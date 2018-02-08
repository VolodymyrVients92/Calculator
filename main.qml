import QtQuick 2.9
import QtQuick.Window 2.2
import "calculator.js" as CalcEngine

import "components"

Window {
    id: window
    title: qsTr("Calculator")

    visible: true
    width: 320
    height: 480

    minimumWidth: width
    minimumHeight: height

    maximumWidth: width
    maximumHeight: height

    function operatorPressed(operator) {
        CalcEngine.operatorPressed(operator)
        window.operatorPressedSignal()
    }

    function digitPressed(digit) {
        CalcEngine.digitPressed(digit)
        window.digitPressedSignal()
    }

    function isCurrentOperator(op) {
        return CalcEngine.isCurrentOperator(op)
    }

    signal digitPressedSignal
    signal operatorPressedSignal

    Display {id: display }

    Column {
        x: 240
        y: 180
        spacing: 3

        Button { label: "−"; butColor: "#8ad11f"; operator: true }
        Button { label: "="; butHeight: 237; butColor: "#ffdc30"; operator: true}
    }

    Grid {
        x: 5
        y: 180
        columns: 3
        spacing: 3

        Button { label: "÷"; butColor: "#8ad11f"; operator: true }
        Button { label: "×"; butColor: "#8ad11f"; operator: true }
        Button { label: "+"; butColor: "#8ad11f"; operator: true }
        Button { label: "7" }
        Button { label: "8" }
        Button { label: "9" }
        Button { label: "4" }
        Button { label: "5" }
        Button { label: "6" }
        Button { label: "1" }
        Button { label: "2" }
        Button { label: "3" }
        Button { label: "0" }
        Button { label: "." }
        Button { label: "C"; operator: true }
    }
}
