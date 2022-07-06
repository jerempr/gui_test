// import libraries
import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.11
 

Item {
    // identify the qml
    id: ledControl
    width: 1030
    height: 320


 
    // left top button (ON)
    Button {
        id: staGreenOn
        x: 0
        y: 0
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
        x: 0
        y: 496-270
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
        x: 540-160
        y: 272-270
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
        x: 540-160
        y: 496-270
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
        x: 918-160
        y: 0
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
        x: 918-160
        y: 496-270
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

 
    // STA GREEN text
    Text {
        id: staGreen
        x: 0
        y: 400-270
        text: "STA GREEN"
        font.pixelSize: 45
    }
 
    // STA RED text
    Text {
        id: staRed
        x: 547-160
        y: 400-270
        text: "STA RED"
        font.pixelSize: 45
    }
 
    // USR GREEN text
    Text {
        id: usrGreen
        x: 891-160
        y: 400-270
        text: "USR GREEN"
        font.pixelSize: 45
    }
}
