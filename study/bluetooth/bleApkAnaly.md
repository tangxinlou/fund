/*******************************************************
$Author       : 唐新楼 
$Last modified:	2025-11-06 15:41
$Email        : 个人邮箱
$blog         : https://blog.csdn.net/daweigongting
$Filename     :	bleApkAnaly.md
$Description  : 分析ble apk工作模式
*******************************************************/

# 市场上apk效果
- 市场apk包括手机厂商自己的ble apk，效果可以做到我既可以被别人连，在此次连接我也可以连别人
- 简单说，A 维护一个私有数据，B也维护一个私有数据

# ble apk 连接角色
- ble client  访问对端的数据，自身没有数据
- ble server 维护一个私有数据，可以给client 访问

# 双角色apk 怎么实现
- 不指定自己是server 还是client ，开始自动register server
- 在server 端回调里面动态调用 bluetoothDevice 的connectgatt 接口

# 双角色apk 运行日志

目前抓取 nrf apk 连接的日志分析

# nrf client 

// apk 默认register server
11-06 14:11:30.561900  5874  5959 D BtGatt.GattService: registerServer() - UUID=3689e7f1-6252-4ac6-a476-43f7ec1be5b9
11-06 14:11:30.564006  5874  5918 D BtGatt.GattService: onServerRegistered() - UUID=3689e7f1-6252-4ac6-a476-43f7ec1be5b9, serverIf=6 
// 点击连接
30375:11-06 14:12:01.081448  5043  5043 D BluetoothGatt: connect() - device: XX:XX:XX:XX:03:35, auto: false
// ps 因为之前 register 了server ，即使是发起client 连接，但是在协议栈里面注册的server 的回调也会被触发
// 在协议栈就没有严格的client 和server 区分，只要上层注册了，底层ble acl 连接后，协议栈就会把对端既视为client 又视为 server
30564:11-06 14:12:01.649085  5874  5918 D BtGatt.GattService: onClientConnected() connId=6, address=47:86:AC:B9:03:35, connected=true
// client 连接回调
30574:11-06 14:12:01.660512  5874  5918 D BtGatt.GattService: onConnected() - clientIf=7, connId=7, address=47:86:AC:B9:03:35
30575:11-06 14:12:01.660601  5874  5918 D BtGatt.GattService: onConnected() - adding permit for address=47:86:AC:B9:03:35 

# nrf server
// server 被别人连接
73826:11-06 13:38:19.321599  4951  4996 D BtGatt.GattService: onClientConnected() connId=6, address=62:34:69:91:43:C5, connected=true
// apk 的server 回调监听到server 连上马上调用 client 连接接口 去连对端
73851:11-06 13:38:19.471421  5043  5043 D BluetoothGatt: connect() - device: XX:XX:XX:XX:43:C5, auto: false
// 从蓝牙协议的角度，此设备既当成server 又当成了 client 
73911:11-06 13:38:19.480730  4951  4996 D BtGatt.GattService: onConnected() - clientIf=7, connId=7, address=62:34:69:91:43:C5
73912:11-06 13:38:19.480833  4951  4996 D BtGatt.GattService: onConnected() - adding permit for address=62:34:69:91:43:C5 
