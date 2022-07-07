// import librarys
import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.11
// import QtQuick.Studio.Components 1.0
// import QtQuick.Studio.Effects 1.0
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
    }
    
     // Print IP and Eth
    Networkinfo_block {
        id: netinfoblock
        x: 10
        y: 10
        n_aText: Data.NetworkValues.displaywifi
        gadgetText: Data.NetworkValues.displayethernet
    }

    Menu_block {
        id: menublock
        x: 0
        y: 145
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
}
