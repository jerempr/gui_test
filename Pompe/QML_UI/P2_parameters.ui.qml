// import libraries
import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.11
import "../backend/" as Data 
 
/* The Item type is the base type for all visual items in Qt Quick. Here 1280 and 720 are chosen 
for the dimensions because the resolution of reTerminal LCD is 1280x720 */
Item {
    // identify the qml
    id: p2
    // define width and height of the app
    width: 1280
    height: 720


    // Rectangle block for the heading
    
    // TODO
    Rectangle{
        id: parameters
        x: 270
        y: 270
        width: 200
        height: 100
        color: "yellow"
    }
}
