// import libraries
import QtQuick 2.8
import QtQuick.Controls 2.1
 
/* The Item type is the base type for all visual items in Qt Quick. Here 1280 and 720 are chosen 
for the dimensions because the resolution of reTerminal LCD is 1280x720 */
Item {
    // identify the qml
    id: p1
    // define width and height of the app
    width: 1280
    height: 720



    // Rectangle block for the heading
    Rectangle {
        id: titleBlock
        x: 0 // Rectangle block position in x-axis
        y: 0 // Rectangle block position in y-axis
        width: 1280 // Rectangle block width
        height: 145 // Rectangle block height
        color: "#0084ff" // Rectangle block color
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

    Led_block {
        id: ledControl
        x: 250
        y: 270
    }
 

}
