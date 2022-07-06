// import library
import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.11
import "../backend/" as Data 
 
// properties of the application window containing UI elements
ApplicationWindow {
    id: application
    width: 1280 
    height: 720 
    visible: true
    visibility: "FullScreen"
 
    // initialize the first window of the application
    property var iniITEM: "P1_Led.ui.qml"


    // stack-based navigation model
    StackView {
        id: stackview
        initialItem: iniITEM
        //Need to rotate the application in order to have it in landscape
        transform: Rotation {origin.x:360; origin.y: 360; angle: 90}
    }
    
     // Print IP and Eth
    Networkinfo_block {
        id: netinfoblock
        x: 10
        y: 10
        n_aText: Data.NetworkValues.displaywifi
        gadgetText: Data.NetworkValues.displayethernet
        transform: Rotation {origin.x:350; origin.y: 350; angle: 90}
    }

    Menu_block {
        id: menublock
        x: 0
        y: 145
        transform: Rotation {origin.x:360; origin.y: 360-145; angle: 90}
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
        font.pointSize: 5
        transform: Rotation {origin.x:360-1200; origin.y: 360; angle: 90}
        onClicked:
        {
            _Setting.closeWindow()
        }
    }
}
