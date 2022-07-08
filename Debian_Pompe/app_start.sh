#!/bin/bash
modprobe lis331dlh-i2c

echo "loading qt demo..."
export QT_QPA_PLATFORM=eglfs
#export QML_IMPORT_TRACE=1
export QT_QPA_EGLFS_ALWAYS_SET_MODE=1
export QT_QPA_EGLFS_PHYSICAL_WIDTH=1280
export QT_QPA_EGLFS_PHYSICAL_HEIGHT=720
# in order to not show the warning message:
export XDG_RUNTIME_DIR='/var/volatile/tmp/runtime-root'

# Launch on 
# cd /home/pi/gui/gui_test/Debian_Pompe/control
cd /mnt/c/Users/jerem/OneDrive/Documents/Travail/OperaMetrix/gui_test/Debian_Pompe/control
echo "qt demo start ok!"
# python3 main.py
python3 main.py>/home/pi/gui/gui_test/Debian_Pompe/Guilogs 2>&1
echo "qt demo closed ok!"



