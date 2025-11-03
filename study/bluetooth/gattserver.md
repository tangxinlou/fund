/*******************************************************
$Author       : 唐新楼 
$Last modified: 2025-10-21 19:54
$Email        : 个人邮箱
$blog         : https://blog.csdn.net/daweigongting
$Filename     : gattserver.md
$Description  : tangxinlou
*******************************************************/




```c


        public void onServiceConnected(ComponentName componentName, IBinder service) {
            Boolean regStatus = mGattServer.registerCallback(callback,eattSupport);

code/ard14/packages/modules/Bluetooth/framework/java/android/bluetooth/BluetoothManager.java:284:
public final class BluetoothManager {
    public BluetoothGattServer openGattServer(Context context,BluetoothGattServerCallback callback,int transport,boolean eattSupport) {
        try {
            IBluetoothGatt iGatt = managerService.getBluetoothGatt();
             BluetoothGattServer mGattServer = new BluetoothGattServer(iGatt, transport, mAdapter);
            Boolean regStatus = mGattServer.registerCallback(callback,eattSupport);
```
