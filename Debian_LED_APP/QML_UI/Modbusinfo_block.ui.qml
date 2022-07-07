import QtQuick 2.8

Item {
    id: modbusinfoblock
    width: 300
    height: 200

    property alias ihmSeuilNTBText: ihmSeuilNTB.text

    Rectangle{
        x: 0
        y: 0
        width: 300
        height: 200
        color: "yellow"
    }

    Text {
        id: ihmSeuilNTB_description
        x: 5
        y: 5
        width: 160
        height: 25
        color: "black"
        text: "IHM seuil niveau très bas:"
        font.pixelSize: 24
        horizontalAlignment: Text.AlignLeft
    }

    Text {
        console.log("\n ça marche");
        id: ihmSeuilNTB
        x: 5
        y: 87
        width: 160
        height: 25
        color: "black"
        text: "N/A"
        font.pixelSize: 24
        horizontalAlignment: Text.AlignLeft
    }
}