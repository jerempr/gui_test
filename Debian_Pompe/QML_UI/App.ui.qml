// import library
import QtQuick.Controls 2.1
import "../backend/" as Data 
 
// properties of the application window containing UI elements
ApplicationWindow {
    id: application
    width: 1280 
    height: 720 
    visible: true
    visibility: "FullScreen"
 
    // initialize the first window of the application
    property var iniITEM: "P1.ui.qml"
 
    // stack-based navigation model
    StackView {
        id: stackview
        initialItem: iniITEM
        // parameters_button.enabled = false
    }
    

    Menu_block {
        x: 0
        y: 0
    }
    //  // Print IP and Eth
    // Networkinfo_block {
    //     id: netinfoblock
    //     x: 10
    //     y: 10
    //     n_aText: Data.Values.displaywifi
    //     gadgetText: Data.Values.displayethernet
    // }
    
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
