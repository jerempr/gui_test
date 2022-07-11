#!/bin/bash
modprobe lis331dlh-i2c

echo "loading qt demo..."
export QT_QPA_PLATFORM=eglfs
#export QML_IMPORT_TRACE=1
export QML_IMPORT_PATH="/usr/lib/aarch64-linux-gnu/qt5/qml/"
export QML_PATH="/usr/lib/aarch64-linux-gnu/qt5/qml/"
export QT_QPA_EGLFS_ALWAYS_SET_MODE=1
export QT_QPA_EGLFS_PHYSICAL_WIDTH=1280
export QT_QPA_EGLFS_PHYSICAL_HEIGHT=720

#Work with keyboard:
# export QT_IM_MODULE="qtvirtualkeyboard"
export QT_XCB_GL_INTEGRATION="xcb_egl" 
export QT_WAYLAND_CLIENT_BUFFER_INTEGRATION="xcomposite-egl "
export QT_IM_MODULE="qtvirtualkeyboard"

# in order to not show the warning message:
# export XDG_RUNTIME_DIR='/var/volatile/tmp/runtime-root'

# For eth connection:
sudo ip a a 192.168.0.200/24 dev eth0

# Launch on 
cd /home/pi/gui/gui_test/Debian_Pompe/control
echo "qt demo start ok!"
# python3 main.py
python3 main.py>/home/pi/gui/gui_test/Debian_Pompe/Guilogs 2>&1
echo "qt demo closed ok!"



