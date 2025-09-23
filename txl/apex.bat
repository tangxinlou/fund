rem adb shell "su -c 'ls -la /data/adb/modules/PixelMod/system/apex/com.google.android.btservices.apex'" 
rem adb shell "su -c 'cp /sdcard/com.android.btservices.apex /data/adb/modules/PixelMod/system/apex/com.google.android.btservices.apex'"
rem adb shell "su -c 'chmod 664 /data/adb/modules/PixelMod/system/apex/com.google.android.btservices.apex'" 
rem adb shell "su -c 'ls -la /data/adb/modules/PixelMod/system/apex/com.google.android.btservices.apex'" 

rem adb push Z:\home\tangxinlou\code\ard14\out\target\product\redfin\apex\com.android.btservices\app\Bluetooth@UP1A.231005.007\Bluetooth.apk /sdcard/Bluetooth.apk
rem adb shell "su -c 'ls -la /data/adb/modules/PixelMod/apex/com.android.btservices/app/BluetoothGoogle@340815110'" 
rem adb shell "su -c 'cp /sdcard/Bluetooth.apk /data/adb/modules/PixelMod/apex/com.android.btservices/app/BluetoothGoogle@340815110/BluetoothGoogle.apk'"
adb push Z:\home\tangxinlou\code\ard14\out\target\product\redfin\system\apex\com.android.btservices.apex /system/apex/com.android.btservices.apex
adb shell "ls -la /system/apex/com.android.btservices.apex"
