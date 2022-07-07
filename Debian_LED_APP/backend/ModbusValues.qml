pragma Singleton
import QtQuick 2.10
import QtQuick 2.8
// import "simulation.js" as JS

QtObject {
    id: modbusvalues
    //modbus value Connect
    property string displaymodbusinfo: "0"

    Component.onCompleted: {
        console.log("\n ça marche");
        _Modbusinfo.SystemSignal.connect(modbusinfofunc)
    }

    function modbusinfofunc(strobj) {
        console.log("\nVoila le modbus objet reçu: ",strobj);
        displayIhmSeuilNTB = String(strobj)
    }
}



