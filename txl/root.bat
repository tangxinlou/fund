rem adb shell "logcat -v threadtime | tee /sdcard/all_logs.txt"
adb wait-for-device
adb root
adb remount
adb logcat -G 256m
adb logcat -g
adb shell logcat -c
rem adb shell "su -c 'logcat | grep -e \"AndroidRuntime\" -e \"tangxinlou debug\"'"
rem adb shell "su -c 'logcat | grep -E \"AndroidRuntime^|tangxinlou debug\"'"
rem adb shell logcat | grep -E "AndroidRuntime|tangxinlou debug|ServerActivity|connectEnabledProfiles|BluetoothGatt: connect.*auto|client_connect_cback:.*connected|BtGatt.GattService: clientDisconnect|BtGatt.ContextMap:.*app|GATT_Disconnect|GATT_Connect|pem  : BLE_REGITION_APP|BtGatt.GattService: clientConnect|BluetoothGatt: connect|client_connect_cback|clientDisconnect|bta_gattc_open_fail|bta_hh_le_open_fail|onClientConnected|BtGatt.GattService: registerServer|BtGatt.GattService: onServerRegistered| Send EATT Connect |BluetoothGatt: close|BluetoothGatt: onClientConnectionState|BtGatt.GattService: registerClient|BluetoothGatt:|BtGatt.GattService: registerClient"
rem adb shell logcat | grep -E "AndroidRuntime|tangxinlou debug|A2dpStateMachine: A2DP Codec Config:.*->|ableOptionalCodecs|SelectSourceCodec:|SetCodecUserConfig|setCodecConfigPreference|bta_av_config_ind: codec|bta_av_reconfig: Reconfig codec"
adb shell logcat | grep -E "AndroidRuntime|tangxinlou debug"
