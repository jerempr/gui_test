# import libraries
import sys
import os



if 'PyQt5' in sys.modules:
	from PyQt5.QtCore import QObject, pyqtSlot as Slot
	print("this app use pyqt5")
else:
	from PySide2.QtCore import *
	print("this app use pyside2")
 
# class to handle button controls
class Setting(QObject):
 
    # staGreen ON/OFF
    @Slot()
    def staGreenOn(self):   
        # turn ON  
        os.system("sh -c 'echo 255 > /sys/class/leds/usr_led2/brightness'")
    @Slot()
    def staGreenOff(self):     
        # turn OFF  
        os.system("sh -c 'echo 0 > /sys/class/leds/usr_led2/brightness'")
 
    # staRed
    @Slot()
    def staRedOn(self):     
        os.system("sh -c 'echo 255 > /sys/class/leds/usr_led1/brightness'")
    @Slot()
    def staRedOff(self):     
        os.system("sh -c 'echo 0 > /sys/class/leds/usr_led1/brightness'")
 
    # usrGreen
    @Slot()
    def usrGreenOn(self):     
        os.system("sh -c 'echo 255 > /sys/class/leds/usr_led0/brightness'")
    @Slot()
    def usrGreenOff(self):     
        os.system("sh -c 'echo 0 > /sys/class/leds/usr_led0/brightness'")
 
    # close
    @Slot()
    def closeWindow(self):
        os.system("rm /home/pi/GUI/MyGui/Debian_LED_APP/QML_UI/*qmlc")
        sys.exit()

