## Importations
import sys
from ModBus_Communication import OperaMetrix_ModbusTCP_client
from time import sleep
from logger import *

try:
        from PySide2.QtCore import *
except ImportError:
        from PyQt5.QtCore import *
if 'PyQt5' in sys.modules:
        from PyQt5.QtCore import pyqtSignal as Signal
else:
        from PySide2.QtCore import Signal



# # script searching the modbus values
# Myclient = OperaMetrix_ModbusTCP_client()
# Myclient.connect()
# IhmSeuilNTB = Myclient.Read_addr(101)
# sleep(1)
# Myclient.close()

IhmSeuilNTB = 2.5


class Modbusinfo(QThread):
    SystemSignal = Signal(str)
    def __init__(self):
        super().__init__()

     
    def run(self):
        IhmSeuilNTB_var = str(IhmSeuilNTB)
        self.sleep(1)
        log.debug(f"Variable modbus envoyée : {IhmSeuilNTB_var}")
        self.SystemSignal.emit(IhmSeuilNTB_var)