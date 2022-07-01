import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.11

Item {
    id: menublock
    width: 135
    height: 575

    Rectangle {
        id: netinforectnagle
        x: 0
        y: 0
        width: 135
        height: 575
        color: "#dfdcdc"
    }

    Button {
        id: home_button
        x: 0
        y: 0
        width: 135
        height: 100
        text: "Home / Leds"
        font.pointSize: 10 // text font
        palette.button: "#4e4d4d"
        palette.buttonText: "black"
        onClicked:{
            stackview.pop()
            stackview.push("P1_Led.ui.qml",StackView.Immediate)
            home_button.enabled = true
        }
    }
    Button {
        id: modbuspage_button
        x: 0
        y: 105
        width: 135
        height: 100
        text: "Modbus"
        font.pointSize: 10 // text font
        palette.button: "#4e4d4d"
        palette.buttonText: "black"
        onClicked:{
            stackview.pop()
            stackview.push("P2_modbus.ui.qml",StackView.Immediate)
            modbuspage_button.enabled = true
        }
    }
}