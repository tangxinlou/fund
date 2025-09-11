 adb shell "su -c 'ps -A | grep logcat'"
 adb shell "su -c 'ps -A | grep screenrecord'"
 adb shell "su -c 'pkill -f logcat'"
 adb shell "su -c 'pkill -f screenrecord'"
 
 adb shell "su -c 'ls -la /data/misc/bluetooth/logs'"
 adb shell "su -c 'ls -la /sdcard/bluetooth_debug.log'"
 adb shell "su -c 'ls -la /sdcard/demo.mp4'"




 adb shell "su -c 'rm -rf /sdcard/logs'"
 adb shell "su -c 'cp -rf /data/misc/bluetooth/logs /sdcard/logs'"
 adb shell "su -c 'ls -la /sdcard/logs'"


 rd /s /q log
 md log
 adb pull /sdcard/logs ./log/logs
 adb pull /sdcard/bluetooth_debug.log  ./log/bluetooth_debug.log
 adb pull /sdcard/demo.mp4  ./log/demo.mp4
 
