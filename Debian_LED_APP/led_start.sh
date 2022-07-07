#!/bin/bash
modprobe lis331dlh-i2c

echo "loading qt demo..."
export QT_QPA_PLATFORM=eglfs
#export QML_IMPORT_TRACE=1
export QT_QPA_EGLFS_ALWAYS_SET_MODE=1
export QT_QPA_EGLFS_PHYSICAL_WIDTH=1280
export QT_QPA_EGLFS_PHYSICAL_HEIGHT=720
# in order to not show the warning message:
# export XDG_RUNTIME_DIR='/var/volatile/tmp/runtime-root'
cd /home/pi/gui/gui_test/Debian_LED_APP/control
echo "qt demo start..."
# python3 main.py
python3 main.py>/home/pi/gui/gui_test/Guilogs 2>&1
echo "qt demo closed ok!"

