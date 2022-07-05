// import libraries
import QtQuick 2.8
import QtQuick.Controls 2.1
 
/* The Item type is the base type for all visual items in Qt Quick. Here 1280 and 720 are chosen 
for the dimensions because the resolution of reTerminal LCD is 1280x720 */
Item {
    // identify the qml
    id: ledControl
    // define width and height of the app
    width: 1280
    height: 720

    // //Need to rotate the application in order to have it in landscape in yocto project
    // transform: Rotation {
    //     origin.x:360; origin.y: 360; angle: 90
    // }
 
    // Rectangle block for the heading
    Rectangle {
        id: titleBlock
        x: 0 // Rectangle block position in x-axis
        y: 0 // Rectangle block position in y-axis
        width: 1280 // Rectangle block width
        height: 139 // Rectangle block height
        color: "blue" // Rectangle block color
        /* You can also enter **hexadecimal values** for the color field */
    }
    // Rectangle block for the menu
    Rectangle {
        id: menuBlock
        x: 0 // Rectangle block position in x-axis
        y: 139 // Rectangle block position in y-axis
        width: 134 // Rectangle block width
        height: 581 // Rectangle block height
        color: "#DFDCDC" // Rectangle block color
    }
    
    // Button Modbus page
    Button {
        id: staModbusPage
        x: 0 // Rectangle block position in x-axis
        y: 139 // Rectangle block position in y-axis
        width: 134 // Rectangle block width
        height: 117 // Rectangle block height
        palette.button: "black" // Rectangle block color
        text: "Modbus"
        font.pointSize: 20
        palette.buttonText: "white"
    }
 
    // left top button (ON)
    Button {
        id: staGreenOn
        x: 199
        y: 272
        width: 200
        height: 91
        text: "ON" // text inside the button
        font.pointSize: 15 // text font
        palette.button: "green" // button color
        palette.buttonText: "white" // text color
        // Used to access the button control class in the Python file and turn on the LED
        onClicked:
        {
            _Setting.staGreenOn()
        }
    }
 
    // left bottom button (OFF)
    Button {
        id: staGreenOff
        x: 199
        y: 496
        width: 200
        height: 91
        text: "OFF"
        font.pointSize: 15
        palette.button: "green"
        palette.buttonText: "white"
        onClicked:
        {
            _Setting.staGreenOff()
        }
    }
 
    // middle top button (ON)
    Button {
        id: staRedOn
        x: 580
        y: 272
        width: 200
        height: 91
        text: "ON"
        font.pointSize: 15
        palette.button: "red"
        palette.buttonText: "white"
        onClicked:
        {
            _Setting.staRedOn()
        }
    }
 
    // middle bottom button (OFF)
    Button {
        id: staRedOff
        x: 580
        y: 496
        width: 200
        height: 91
        text: "OFF"
        font.pointSize: 15
        palette.button: "red"
        palette.buttonText: "white"
        onClicked:
        {
            _Setting.staRedOff()
        }
    }
 
    // right top button (ON)
    Button {
        id: usrGreenOn
        x: 958
        y: 272
        width: 200
        height: 91
        text: "ON"
        font.pointSize: 15
        palette.button: "green"
        palette.buttonText: "white"
        onClicked:
        {
            _Setting.usrGreenOn()
        }
    }
 
    // right bottom button (OFF)
    Button {
        id: usrGreenOff
        x: 958
        y: 496
        width: 200
        height: 91
        text: "OFF"
        font.pointSize: 15
        palette.button: "green"
        palette.buttonText: "white"
        onClicked:
        {
            _Setting.usrGreenOff()
        }
    }
 
    // close button
    Button {
        id: close
        x: 1200
        y: 0
        width: 80
        height: 31
        palette.button: "red"
        palette.buttonText: "white"
        text: "X"
        onClicked:
        {
            _Setting.closeWindow()
        }
    }
 
    // heading
    Text {
        id: title
        x: 500
        y: 37
        color: "white"
        text: "LED TEST"
        font.pixelSize: 60
    }
 
    // STA GREEN text
    Text {
        id: staGreen
        x: 227
        y: 400
        text: "STA GREEN"
        font.pixelSize: 45
    }
 
    // STA RED text
    Text {
        id: staRed
        x: 621
        y: 400
        text: "STA RED"
        font.pixelSize: 45
    }
    // IP Address    
    Label{
        id: textIP
        x: 16
        y: 12
        text: qsTr("IP: ")
        font.pixelSize: 20
       
    }
    // // Here we take the result of text processing
    // Connections {
    //     target: _Setting
    //     // Signal Handler 
    //     onTextResult: {
    //         // textLabel - was given through arguments=['textLabel']
    //         textIP.setText = textLabel
    //     }
    // } 
 
    // USR GREEN text
    Text {
        id: usrGreen
        x: 977
        y: 400
        text: "USR GREEN"
        font.pixelSize: 45
    }
}
