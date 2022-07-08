import QtQuick 2.8

Item {
    id: netinfoblock
    width: 200
    height: 120
    property alias n_aText: n_a.text
    property alias gadgetText: gadget.text

    Text {
        id: n_a
        x: 0
        y: 20
        width: 160
        height: 15
        color: "white"
        text: "N/A"
        
        horizontalAlignment: Text.AlignLeft
    }

    Text {
        id: wi_fi_conection
        x: 0
        y: 0
        width: 160
        height: 15
        color: "#000000"
        text: "Wi-Fi Connection:"
        
        horizontalAlignment: Text.AlignLeft
    }

    Text {
        id: gadget
        x: 0
        y: 60
        width: 160
        height: 15
        color: "white"
        text: "N/A"
        
        horizontalAlignment: Text.AlignLeft
    }

    Text {
        id: ethernet_connection
        x: 0
        y: 40
        width: 160
        height: 15
        color: "#000000"
        text: "Ethernet Connection:"
        
        horizontalAlignment: Text.AlignLeft
    }
}