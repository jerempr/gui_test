# import libraries
import sys



from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtWidgets import QApplication
from PySide2.QtQuick import *
from PySide2.QtCore import QUrl
print("this app use pyside2")

from ledControl import Setting
from NetInfo import Netinfo
 
# launch the app
if __name__ == '__main__':
    app = QApplication([])
    engine = QQmlApplicationEngine()
    # location of the fullscreen app that we created before
    url = QUrl("../QML_UI/App.ui.qml")
    context = engine.rootContext()
    
    seting = Setting()
    netinfo = Netinfo()

    
    context.setContextProperty("_Setting", seting)
    context.setContextProperty("_Netinfo", netinfo)
    
    netinfo.start()
    
    engine.load(url)
    app.exec_()
