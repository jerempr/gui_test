// import libraries
import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.11
 
/* The Item type is the base type for all visual items in Qt Quick. Here 1280 and 720 are chosen 
for the dimensions because the resolution of reTerminal LCD is 1280x720 */
Item {
    // identify the qml
    id: p1demarrages
    // define width and height of the app
    width: 400
    height: 225


    // Rectangle block for the heading
    Rectangle {
        id: demarragesrectangle
        x: 0
        y: 0
        width: 400
        height: 225
        Text: "Nombre de démarrages"
        color: "#ebebeb"
    }

}
