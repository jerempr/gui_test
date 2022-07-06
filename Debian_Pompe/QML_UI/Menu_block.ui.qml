import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.11

Item {
    id: menublock
    width: 1280
    height: 100

    Rectangle {
        id: uselessrectangle
        x: 333
        y: 0
        width: 600
        height: 44
        color: "#ebebeb"
    }

    Button {
        id: sta_parameters
        x: 175
        y: 10
        // width: 70
        // height: 70
        iconSource: "../images/parameters.png"
        checkable: true
        checked: true
        Layout.minimumWidth: 70
        Layout.minimumHeight: 70
        onClicked:{
            stackview.pop()
            stackview.push("P2_parameters.ui.qml",StackView.Immediate)
            home_button.enabled = true
        }
    }
    Button {
        id: warning_button
        x: 270
        y: 40
        // width: 45
        // height: 45
        iconSource: "../images/warning.png"
        checkable: true
        checked: true
        Layout.minimumWidth: 45
        Layout.minimumHeight: 45
        onClicked:{
            stackview.pop()
            // TODO
            //stackview.push("P2_modbus.ui.qml",StackView.Immediate)
            modbuspage_button.enabled = true
        }
    }
    Text {
        x: 940
        y: 8
        width: 40
        height: 333
        text: "Print Datetime"
    }
}