 adb shell "su -c 'ps -A | grep logcat'"
 adb shell "su -c 'ps -A | grep screenrecord'"
 adb shell "su -c 'pkill -f logcat'"
 adb shell "su -c 'pkill -f screenrecord'"
 adb shell "su -c 'ls -la /sdcard/demo.mp4'"
 adb shell "su -c 'ls -la /sdcard/bluetooth_debug.log'"
 adb shell "su -c 'rm -rf /sdcard/demo.mp4'"
 adb shell "su -c 'rm -rf /sdcard/bluetooth_debug.log'"

 adb logcat -G 256m
 adb logcat -g
 adb shell "su -c 'logcat -c '"
 adb shell "su -c 'nohup logcat -b all -v threadtime -f /sdcard/bluetooth_debug.log >/dev/null 2>&1 &'"
 adb shell "su -c 'screenrecord /sdcard/demo.mp4 &>/dev/null &'"

 adb shell "su -c 'ls -la /sdcard/bluetooth_debug.log'"
 adb shell "su -c 'ls -la /sdcard/demo.mp4'"
 adb shell "su -c 'ps -A | grep logcat'"
 adb shell "su -c 'ps -A | grep screenrecord'"


