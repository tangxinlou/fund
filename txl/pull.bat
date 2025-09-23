
 rem magisk plan
 rem adb shell "su -c 'ls -la /data/misc/bluetooth/logs'"
 rem adb shell "su -c 'ls -la /sdcard/bluetooth_debug.log'"

 rem adb shell "su -c 'ps -A | grep logcat'"
 rem adb shell "su -c 'pkill -f logcat'"


 rem adb shell "su -c 'rm -rf /sdcard/logs'"
 rem adb shell "su -c 'cp -rf /data/misc/bluetooth/logs /sdcard/logs'"
 rem adb shell "su -c 'ls -la /sdcard/logs'"
 
 rem adb shell "su -c 'rm -rf /sdcard/bt_logs'"
 rem adb shell "su -c 'cp -rf /data/local/tmp/bt_logs /sdcard/bt_logs'"
 rem adb shell "su -c 'ls -la /sdcard/bt_logs'"
 
 adb wait-for-device
 adb root
 adb remount

 adb shell "rm -rf /sdcard/bt_logs"
 adb shell "cp -rf /data/misc/bluetooth/logs /sdcard/bt_logs"

 adb shell "rm -rf /sdcard/logs"
 adb shell "cp -rf /data/misc/logd /sdcard/logs"

 rd /s /q log
 md log
 adb pull /sdcard/logs ./log/logs
 adb pull /sdcard/Movies  ./log/Movies
 adb pull /sdcard/bt_logs ./log/bt_logs

 adb shell "rm -rf /sdcard/Movies"
 
 
