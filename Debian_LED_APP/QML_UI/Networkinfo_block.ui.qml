import QtQuick 2.8

Item {
    id: netinfoblock
    width: 200
    height: 120
    property alias n_aText: n_a.text
    property alias gadgetText: gadget.text

    Text {
        id: n_a
        x: 5
        y: 32
        width: 160
        height: 25
        color: "white"
        text: "N/A"
        font.pixelSize: 15
        horizontalAlignment: Text.AlignLeft
    }

    Text {
        id: wi_fi_conection
        x: 5
        y: 5
        width: 160
        height: 25
        color: "#000000"
        text: "Wi-Fi Connection:"
        font.pixelSize: 15
        horizontalAlignment: Text.AlignLeft
    }

    Text {
        id: gadget
        x: 5
        y: 87
        width: 160
        height: 25
        color: "white"
        text: "N/A"
        font.pixelSize: 15
        horizontalAlignment: Text.AlignLeft
    }

    Text {
        id: ethernet_connection
        x: 5
        y: 60
        width: 160
        height: 25
        color: "#000000"
        text: "Ethernet Connection:"
        font.pixelSize: 15
        horizontalAlignment: Text.AlignLeft
    }
}