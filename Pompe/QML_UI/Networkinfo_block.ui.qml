import QtQuick 2.8

Item {
    id: netinfoblock
    width: 200
    height: 120
    property alias n_aText: n_a.text
    property alias gadgetText: gadget.text
    
    property int taille_texte: 15


    // On affiche le wifi et ethernet
    Text {
        id: n_a
        x: 0
        y: 50
        width: 160
        height: 15
        color: "black"
        text: "N/A"
        font.pixelSize: taille_texte
        horizontalAlignment: Text.AlignLeft
    }

    Text {
        id: wi_fi_conection
        x: 0
        y: 30
        width: 160
        height: 15
        color: "#000000"
        text: "Wi-Fi Connection:"
        font.pixelSize: taille_texte
        horizontalAlignment: Text.AlignLeft
    }

    Text {
        id: gadget
        x: 0
        y: 90
        width: 160
        height: 15
        color: "black"
        text: "N/A"
        font.pixelSize: taille_texte
        horizontalAlignment: Text.AlignLeft
    }

    Text {
        id: ethernet_connection
        x: 0
        y: 70
        width: 160
        height: 15
        color: "#000000"
        text: "Ethernet Connection:"
        font.pixelSize: taille_texte
        horizontalAlignment: Text.AlignLeft
    }
}