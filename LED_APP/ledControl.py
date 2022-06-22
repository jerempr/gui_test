# import libraries
import sys
import os

if 'PyQt5' in sys.modules:
	from PyQt5.QtCore import *
	print("this app use pyqt5")
else:
	from PySide2.QtCore import *
	print("this app use pyside2")
 
# class to handle button controls
class Setting(QObject):
 
    # staGreen ON/OFF
    @pyqtSlot()
    def staGreenOn(self):   
        # turn ON  
        os.system("sudo sh -c 'echo 255 > /sys/class/leds/usr_led2/brightness'")
    @pyqtSlot()
    def staGreenOff(self):     
        # turn OFF  
        os.system("sudo sh -c 'echo 0 > /sys/class/leds/usr_led2/brightness'")
 
    # staRed
    @pyqtSlot()
    def staRedOn(self):     
        os.system("sudo sh -c 'echo 255 > /sys/class/leds/usr_led1/brightness'")
    @pyqtSlot()
    def staRedOff(self):     
        os.system("sudo sh -c 'echo 0 > /sys/class/leds/usr_led1/brightness'")
 
    # usrGreen
    @pyqtSlot()
    def usrGreenOn(self):     
        os.system("sudo sh -c 'echo 255 > /sys/class/leds/usr_led0/brightness'")
    @pyqtSlot()
    def usrGreenOff(self):     
        os.system("sudo sh -c 'echo 0 > /sys/class/leds/usr_led0/brightness'")
 
    # close
    @pyqtSlot()
    def closeWindow(self):
        sys.exit()
