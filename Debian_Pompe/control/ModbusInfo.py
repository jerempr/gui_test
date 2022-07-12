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
        from PyQt5.QtCore import pyqtSlot as Slot
else:
        from PySide2.QtCore import Signal, Slot





class Modbusinfo(QThread):
    SystemSignal = Signal(str)
    def __init__(self):
        super().__init__()
        # self.Myclient = OperaMetrix_ModbusTCP_client()
        # self.Myclient.connect()
        # sleep(1)

     
    def run(self):
        # while(True):
        #         self.IhmSeuilNTB = self.Myclient.Read_addr(101)
        #         IhmSeuilNTB_var = str(round(self.IhmSeuilNTB,2))
        #         self.sleep(1)
        #         log.debug(f"Variable modbus envoyée : {IhmSeuilNTB_var}")
        #         self.SystemSignal.emit(IhmSeuilNTB_var)
        #         sleep(1)
        self.IhmSeuilNTB = 2.5
        IhmSeuilNTB_var = str(round(self.IhmSeuilNTB,2))
        self.sleep(1)
        log.debug(f"Variable modbus envoyée : {IhmSeuilNTB_var}")
        self.SystemSignal.emit(IhmSeuilNTB_var)
        sleep(1)
        
    @Slot(float,float)
    def Write_modbus_float(self,addr,obj):
        log.debug(f"Variable de type float écrite à l'adresse {addr} par modbus: {obj}")
        # self.Myclient.Write_addr(addr,float(obj),type)

    @Slot(float,bool)
    def Write_modbus_boolean(self,addr, obj):
        # log.debug(f"received object: {obj}")
        # obj = bool(obj)
        log.debug(f"Variable de type boolean écrite à l'adresse {addr} par modbus: {obj}")
        # self.Myclient.Write_addr(addr,float(obj),type)

