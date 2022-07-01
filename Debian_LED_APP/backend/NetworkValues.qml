pragma Singleton
import QtQuick 2.10
import QtQuick 2.8
// import "simulation.js" as JS
// import "///home/pi/Python_For_Qt/QML/qml_5//Hardware.ui.qml" as AC

QtObject {
    id: networkvalues
    //Ethernet Connect
    property string displayethernet: "0"

    //wifi connection
    property string displaywifi: "0"

    Component.onCompleted: {
        _Netinfo.SystemSignal.connect(netinfofunc)
    }

    function netinfofunc(str5,str6) {
        displayethernet = String(str5)
        displaywifi = String(str6)
    }
}



