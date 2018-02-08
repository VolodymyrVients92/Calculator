
var curVal = 0
var memory = 0
var lastOp = ""
var previousOperator = ""
var digits = ""

function disabled(op) {
    if (digits == "" && !((op >= "0" && op <= "9") || op == "."))
        return true
    else if (op == '=' && previousOperator.length != 1)
        return true
    else if (op == "." && digits.toString().search(/\./) != -1) {
        return true
    } else if (op == "√" &&  digits.toString().search(/-/) != -1) {
        return true
    } else {
        return false
    }
}

function isCurrentOperator(op) {

    if (previousOperator == op)
        return true
    return false
}

function digitPressed(op) {
    if (disabled(op))
        return
    if (digits.toString().length >= display.maxDigits)
        return
    if (lastOp.toString().length == 1 && ((lastOp >= "0" && lastOp <= "9") || lastOp == ".") ) {
        digits = digits + op.toString()
        display.appendDigit(op.toString())
    } else {
        digits = op
        display.show(op.toString())
    }
    lastOp = op
}

function operatorPressed(op)
{
    if (disabled(op))
        return
    lastOp = op

    if (previousOperator == "+") {
        digits = Number(digits.valueOf()) + Number(curVal.valueOf())
    } else if (previousOperator == "−") {
        digits = Number(curVal.valueOf()) - Number(digits.valueOf())
    } else if (previousOperator == "×") {
        digits = Number(curVal) * Number(digits.valueOf())
    } else if (previousOperator == "÷") {
        digits = Number(curVal) / Number(digits.valueOf())
    }

    if (op == "+" || op == "−" || op == "×" || op == "÷") {
        previousOperator = op
        curVal = digits.valueOf()
        digits = ""
        return
    }

    if (op == "=") {
        display.show(digits.valueOf())
    }

    curVal = 0
    previousOperator = ""

    // Reset the state on 'C' operator or after
    // an error occurred
    if (op == "C" || display.isError) {
        display.clear()
        curVal = 0
        memory = 0
        lastOp = ""
        digits = ""
    }
}
