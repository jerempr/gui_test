pragma Singleton
import QtQuick 2.10
import QtQuick 2.8
// import "simulation.js" as JS

QtObject {
    id: networkvalues
    //Ethernet Connect
    property string displayethernet: "0"

    //wifi connection
    property string displaywifi: "0"

    //modbus value recived:
    property string displayIhmSeuilNTB: "0"

    Component.onCompleted: {
        _Netinfo.SystemSignal.connect(netinfofunc)
        _Modbusinfo.SystemSignal.connect(modbusinfofunc)
    }

    function netinfofunc(str5,str6) {
        console.log("\nVoila le network objet reçu: ",str6);
        displayethernet = String(str5)
        displaywifi = String(str6)
    }
    function modbusinfofunc(strobj) {
        console.log("ça marche 3");
        console.log("Voila le modbus objet reçu: ",String(strobj));
        networkvalues.displayIhmSeuilNTB = String(strobj)
    }
}



