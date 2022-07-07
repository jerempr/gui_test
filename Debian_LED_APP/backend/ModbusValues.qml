pragma Singleton
import QtQuick 2.10
import QtQuick 2.8
// import "simulation.js" as JS
// import "///home/pi/Python_For_Qt/QML/qml_5//Hardware.ui.qml" as AC

QtObject {
    id: modbusvalues
    //Ethernet Connect
    property string displaymodbusinfo: "0"

    Component.onCompleted: {
        _Modbusinfo.SystemSignal.connect(modbusinfofunc)
    }

    function modbusinfofunc(strobj) {
        displayIhmSeuilNTB = String(strobj)
    }
}



