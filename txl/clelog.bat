adb wait-for-device
adb root
adb remount

adb shell "rm -rf /data/misc/logd/*"
adb shell "stop logd"
adb shell "start logd"
adb shell "rm -rf /sdcard/Movies"
