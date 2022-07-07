import sys
import os
import subprocess

try:
        from PySide2.QtCore import *
except ImportError:
        from PyQt5.QtCore import *
if 'PyQt5' in sys.modules:
        from PyQt5.QtCore import pyqtSignal as Signal
else:
        from PySide2.QtCore import Signal, Slot


eth = os.popen('ip addr show eth0 | grep "\<inet\>" | awk \'{ print $2 }\' | awk -F "/" \'{ print $1 }\'').read().strip()
wifi = os.popen('ip addr show wlan0 | grep "\<inet\>" | awk \'{ print $2 }\' | awk -F "/" \'{ print $1 }\'').read().strip()

if wifi == '':
        wifi = 'Not connected to WiFi'

if eth == '':
        eth = 'Not connected to Ethernet'


class Netinfo(QThread):
    SystemSignal = Signal(str,str)
    def __init__(self):
        super().__init__()

     
    def run(self):
        # Ethernet = str(eth)
        Ethernet = str(eth)
        Wifi = str(wifi)
        self.sleep(1)
        self.SystemSignal.emit(Ethernet,Wifi)