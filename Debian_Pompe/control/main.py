# import libraries
import sys



try:
	import PySide2.QtQml
except ImportError:
	import PyQt5.QtQml
if 'PyQt5' in sys.modules:
	from PyQt5.QtQml import QQmlApplicationEngine
	from PyQt5.QtWidgets import *
	from PyQt5.QtCore import *
	print("this app use pyqt5")
else:
	from PySide2.QtQml import QQmlApplicationEngine
	from PySide2.QtWidgets import *
	from PySide2.QtQuick import *
	from PySide2.QtCore import *
	print("this app use pyside2")

from NetInfo import Netinfo
from System import Setting
from ModbusInfo import Modbusinfo
from SysInfo import Sysinfo
 
# launch the app
if __name__ == '__main__':
    app = QApplication([])
    engine = QQmlApplicationEngine()
    # location of the fullscreen app that we created before
    url = QUrl("../QML_UI/App.ui.qml")
    
    context = engine.rootContext()
    
    seting = Setting()
    netinfo = Netinfo()
    modinfo = Modbusinfo()
    sysinfo = Sysinfo()


    
    context.setContextProperty("_Setting", seting)
    context.setContextProperty("_Netinfo", netinfo)
    context.setContextProperty("_Modbusinfo", modinfo)
    context.setContextProperty("_Sysinfo", sysinfo)
    
    netinfo.start()
    modinfo.start()
    sysinfo.start()
    
    engine.load(url)
    app.exec_()
