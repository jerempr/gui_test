#!/bin/bash
#!/bin/bash
echo "loading qt demo..."
export QT_QPA_PLATFORM=eglfs
export QT_QPA_EGLFS_ALWAYS_SET_MODE=1
# in order to not show the warning message:
export XDG_RUNTIME_DIR='/var/volatile/tmp/runtime-root'
cd /home/root/GUI_Demo_Custom/control
python3 main.py &
echo "qt demo start ok!"
