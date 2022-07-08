import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.11
import "../backend/" as Data 

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

    Image {
        source: "../images/logo.png"
        x: 20
        y: 10
        width: 85
        height: 85
        MouseArea {
            anchors.fill: parent
            onClicked: {
                // stackview.pop()
                // stackview.push("P2_parameters.ui.qml",StackView.Immediate)
                // home_button.enabled = true
                console.info("image OperaMetrix logo clicked!")
            }
        }
    }

    Image {
        source: "../images/parameters.png"
        x: 175
        y: 10
        width: 70
        height: 70
        MouseArea {
            anchors.fill: parent
            onClicked: {
                // stackview.pop()
                // stackview.push("P2_parameters.ui.qml",StackView.Immediate)
                // home_button.enabled = true
                console.info("image parameters clicked!")
            }
        }
    }

    
    Image {
        source: "../images/warning.png"
        x: 270
        y: 40
        width: 45
        height: 45
        MouseArea {
            anchors.fill: parent
            onClicked: {
                // stackview.pop()
                // // TODO
                // //stackview.push("P2_modbus.ui.qml",StackView.Immediate)
                // modbuspage_button.enabled = true
                console.info("image warning clicked!")
            }
        }
    }

    Text {
        x: 960
        y: 8
        width: 40
        height: 333
        text: "Print Datetime"
    }

    Networkinfo_block {
        id: netinfoblock
        x: 960
        y: 50
        n_aText: Data.Values.displaywifi
        gadgetText: Data.Values.displayethernet
    }


}