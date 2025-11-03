/*******************************************************
$Author       : 唐新楼 
$Last modified: 2025-10-20 16:47
$Email        : 个人邮箱
$blog         : https://blog.csdn.net/daweigongting
$Filename     : propdevice.md
$Description  : tangxinlou
*******************************************************/


```c


 
        DeviceProperties deviceProp = getDeviceProperties(device);

bluetooth/android/app/src/com/android/bluetooth/btservice/RemoteDevices.java:277:
public class RemoteDevices {
    public ParcelUuid[] getUuids(BluetoothDevice device) {
        DeviceProperties deviceProp = getDeviceProperties(device);
        return deviceProp.getUuids();
```


```c


        DeviceProperties deviceProp = getDeviceProperties(device);
            return mDevices.get(address);

bluetooth/android/app/src/com/android/bluetooth/btservice/RemoteDevices.java:248:
public class RemoteDevices {
    DeviceProperties getDeviceProperties(BluetoothDevice device) {
        synchronized (mDevices) {
            return mDevices.get(address);
```

```c


 
            DeviceProperties pv = mDevices.put(key,prop);

bluetooth/android/app/src/com/android/bluetooth/btservice/RemoteDevices.java:320:
public class RemoteDevices {
    DeviceProperties addDeviceProperties(byte[] address) {
        synchronized (mDevices) {
            DeviceProperties pv = mDevices.put(key,prop);
```

