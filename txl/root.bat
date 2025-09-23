rem adb shell "logcat -v threadtime | tee /sdcard/all_logs.txt"
adb wait-for-device
adb root
adb remount
adb logcat -G 256m
adb logcat -g
adb shell logcat -c
rem adb shell "su -c 'logcat | grep -e \"AndroidRuntime\" -e \"tangxinlou debug\"'"
rem adb shell "su -c 'logcat | grep -E \"AndroidRuntime^|tangxinlou debug\"'"
adb shell logcat | grep -E "AndroidRuntime|tangxinlou debug|AdapterApp"
