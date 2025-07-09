/*******************************************************
$Author       : 唐新楼 
$Last modified: 2025-06-04 10:14
$Email        : 个人邮箱
$blog         : https://blog.csdn.net/daweigongting
$Filename     : gattconnect.md
$Description  : nrf connect
*******************************************************/

# gattconnect


```c


 
        if (!registerApp(callback, handler, eattSupport)) { 

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/framework/java/android/bluetooth/BluetoothGatt.java:1253:
public final class BluetoothGatt implements BluetoothProfile {
    boolean connect(Boolean autoConnect, BluetoothGattCallback callback,Handler handler, boolean eattSupport) {
        if (!registerApp(callback, handler, eattSupport)) { 
```


```c


        if (!registerApp(callback, handler, eattSupport)) { // eattSupport: Qcom code
            mService.registerClient(new ParcelUuid(uuid), mBluetoothGattCallback, eattSupport, mAttributionSource);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/framework/java/android/bluetooth/BluetoothGatt.java:1153:
public final class BluetoothGatt implements BluetoothProfile {
    private boolean registerApp(BluetoothGattCallback callback, Handler handler, boolean eattSupport) {
        try {
            //hci  随机生成了一个 uuid
            mService.registerClient(new ParcelUuid(uuid), mBluetoothGattCallback, eattSupport, mAttributionSource);
```


```c


 
            mNativeInterface.gattClientRegisterApp(uuid.getLeastSignificantBits(),uuid.getMostSignificantBits(), eatt_support);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/android/app/src/com/android/bluetooth/gatt/GattService.java:2335:
public class GattService extends ProfileService {
    void registerClient(UUID uuid, IBluetoothGattCallback callback, boolean eatt_support,AttributionSource attributionSource) {
        // hci 中用map 把uuid 和apk 的回调对应起来
        mClientMap.add(uuid, null, callback, null, this, mTransitionalScanHelper);
        if (callingPkg != null && (callingPkg.contains("com.android.cts") || callingPkg.contains("com.android.server.cts"))) {
        } else {
            mNativeInterface.gattClientRegisterApp(uuid.getLeastSignificantBits(),uuid.getMostSignificantBits(), eatt_support);
```




```c


 
  sGattIf->client->register_client(uuid, eatt_support);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/android/app/jni/com_android_bluetooth_gatt.cpp:1404:
static void gattClientRegisterAppNative(JNIEnv* , jobject ,jlong app_uuid_lsb, jlong app_uuid_msb,jboolean eatt_support) {
  sGattIf->client->register_client(uuid, eatt_support);
```



```c


    btif_gattc_register_app,
  return do_in_jni_thread(Bind([](const Uuid& uuid, bool eatt_support) {BTA_GATTC_AppRegister(bta_gattc_cback,base::Bind([](const Uuid& uuid, uint8_t client_id, uint8_t status) {do_in_jni_thread(Bind([](const Uuid& uuid, uint8_t client_id, uint8_t status) {HAL_CBACK(bt_gatt_callbacks, client->register_client_cb,status, client_id, uuid);},uuid, client_id, status));},uuid),eatt_support);},uuid, eatt_support));

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/btif/src/btif_gatt_client.cc:279:
static bt_status_t btif_gattc_register_app(const Uuid& uuid,bool eatt_support) {
    // hci 中注册bta gattc 的event 处理函数
  return do_in_jni_thread(Bind([](const Uuid& uuid, bool eatt_support) {BTA_GATTC_AppRegister(bta_gattc_cback,base::Bind([](const Uuid& uuid, uint8_t client_id, uint8_t status) {do_in_jni_thread(Bind([](const Uuid& uuid, uint8_t client_id, uint8_t status) {HAL_CBACK(bt_gatt_callbacks, client->register_client_cb,status, client_id, uuid);},uuid, client_id, status));},uuid),eatt_support);},uuid, eatt_support));
```

```c


        BTA_GATTC_AppRegister(
  do_in_main_thread(FROM_HERE,base::BindOnce(&bta_gattc_register, Uuid::GetRandom(),p_client_cb, std::move(cb), eatt_support));

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/gatt/bta_gattc_api.cc:94:
void BTA_GATTC_AppRegister(tBTA_GATTC_CBACK* p_client_cb,BtaAppRegisterCallback cb, bool eatt_support) {
    // hci 中多个回调需要调用
  do_in_main_thread(FROM_HERE,base::BindOnce(&bta_gattc_register, Uuid::GetRandom(),p_client_cb, std::move(cb), eatt_support));
```


```c


                    base::BindOnce(&bta_gattc_register, Uuid::GetRandom(),
        do_in_main_thread(FROM_HERE,base::BindOnce(&bta_gattc_start_if, client_if));

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/gatt/bta_gattc_act.cc:221:
void bta_gattc_register(const Uuid& app_uuid, tBTA_GATTC_CBACK* p_cback,BtaAppRegisterCallback cb, bool eatt_support) {
  for (uint8_t i = 0; i < BTA_GATTC_CL_MAX; i++) {
      // hci 中填充 bta_gattc_cb 结构体
    if (!bta_gattc_cb.cl_rcb[i].in_use) {
      if (bta_gattc_cb.cl_rcb[i].client_if == 0) {
      } else {
        do_in_main_thread(FROM_HERE,base::BindOnce(&bta_gattc_start_if, client_if));
    // hci 中这个app 注册回调马上调用到上层apk
    cb.Run(client_if, status);
```

```c


                          base::BindOnce(&bta_gattc_start_if, client_if));
  GATT_StartIf(client_if);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/gatt/bta_gattc_act.cc:183:
static void bta_gattc_start_if(uint8_t client_if) {
    // hci 中在start gattc 的时候会查询 gatt_cb.tcb 结构体，这个里面每建立一条acl 就会使用一个成员，最多39个成员,最多 建立39条acl
  GATT_StartIf(client_if);
```

```c


    btgattc_register_app_cb,
HAL_CBACK(bt_gatt_callbacks, client->register_client_cb,status, client_id, uuid);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/android/app/jni/com_android_bluetooth_gatt.cpp:228:
void btgattc_register_app_cb(int status, int clientIf, const Uuid& app_uuid) {
    // hci 中注册gatt client 时，app 层注册了一随机uuid ，协议栈也注册了一个随机uuid
  sCallbackEnv->CallVoidMethod(mCallbacksObj, method_onClientRegistered, status,clientIf, UUID_PARAMS(app_uuid));
```

```c


      {"onClientRegistered", "(IIJJ)V", &method_onClientRegistered},
            app.callback.onClientRegistered(status, clientIf);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/android/app/src/com/android/bluetooth/gatt/GattService.java:1407:
public class GattService extends ProfileService {
    void onClientRegistered(int status, int clientIf, long uuidLsb, long uuidMsb)throws RemoteException {
        if (app != null) {
            app.callback.onClientRegistered(status, clientIf);
```

```c


            app.callback.onClientRegistered(status, clientIf);
                        mService.clientConnect(mClientIf,mDevice.getAddress(),mDevice.getAddressType(),!mAutoConnect,mTransport,mOpportunistic,mPhy,mAttributionSource);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/framework/java/android/bluetooth/BluetoothGatt.java:311:
public final class BluetoothGatt implements BluetoothProfile {
    private final IBluetoothGattCallback mBluetoothGattCallback =new IBluetoothGattCallback.Stub() {
                public void onClientRegistered(int status, int clientIf) {
                    try {
                        //hci 中第三方apk 的回调保存在 mCallback中，register client 时 将随机uuid 和 mBluetoothGattCallback 传到package map 中，底层要通知第三方apk时
                       // hci 中 通过register client 时的uuid 在map 中找到 mBluetoothGattCallback ,在mBluetoothGattCallback 中调用 mCallback
                        //hci 中 第三方apk 的回调 是通过这个gatt mBluetoothGattCallback 回调调用的
                        mService.clientConnect(mClientIf,mDevice.getAddress(),mDevice.getAddressType(),!mAutoConnect,mTransport,mOpportunistic,mPhy,mAttributionSource);
```

```c


                        mService.clientConnect(mClientIf,mDevice.getAddress(),mDevice.getAddressType(),!mAutoConnect,mTransport,mOpportunistic,mPhy,mAttributionSource);
        mNativeInterface.gattClientConnect(clientIf, address, addressType, isDirect, transport,opportunistic, phy, VivoGattService.getInstance().isAllowFastConn(attributionSource.getPackageName()));

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/android/app/src/com/android/bluetooth/gatt/GattService.java:2520:
public class GattService extends ProfileService {
    void clientConnect(int clientIf, String address, int addressType, boolean isDirect,int transport, boolean opportunistic, int phy, AttributionSource attributionSource) {
        // hci 中连接往协议栈层调用
        mNativeInterface.gattClientConnect(clientIf, address, addressType, isDirect, transport,opportunistic, phy, VivoGattService.getInstance().isAllowFastConn(attributionSource.getPackageName()));
```


```c


        mNativeInterface.gattClientConnect(clientIf, address, addressType, isDirect, transport,
  sGattIf->client->connect(clientif, str2addr(env, address), addressType,isDirect, transport, opportunistic, initiating_phys, needFastConn);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/android/app/jni/com_android_bluetooth_gatt.cpp:1460:
static void gattClientConnectNative(JNIEnv* env, jobject ,jint clientif, jstring address,jint addressType, jboolean isDirect,jint transport, jboolean opportunistic,jint initiating_phys, jboolean needFastConn) {
  sGattIf->client->connect(clientif, str2addr(env, address), addressType,isDirect, transport, opportunistic, initiating_phys, needFastConn);
```

```c


    btif_gattc_open,
  return do_in_jni_thread(Bind(&btif_gattc_open_impl, client_if, bd_addr,addr_type, is_direct, transport, opportunistic,initiating_phys, need_fast_conn));

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/btif/src/btif_gatt_client.cc:418:
static bt_status_t btif_gattc_open(int client_if, const RawAddress& bd_addr,uint8_t addr_type, bool is_direct,int transport, bool opportunistic,int initiating_phys, bool need_fast_conn) {
  return do_in_jni_thread(Bind(&btif_gattc_open_impl, client_if, bd_addr,addr_type, is_direct, transport, opportunistic,initiating_phys, need_fast_conn));
```

```c


  return do_in_jni_thread(Bind(&btif_gattc_open_impl, client_if, bd_addr,
  BTA_GATTC_Open(client_if, address, addr_type, type, transport, opportunistic,initiating_phys);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/btif/src/btif_gatt_client.cc:403:
void btif_gattc_open_impl(int client_if, RawAddress address,tBLE_ADDR_TYPE addr_type, bool is_direct,int transport_p, bool opportunistic,int initiating_phys, bool need_fast_conn) {
  BTA_GATTC_Open(client_if, address, addr_type, type, transport, opportunistic,initiating_phys);
```

```c


  BTA_GATTC_Open(client_if, address, addr_type, type, transport, opportunistic,
  post_on_bt_main([data]() { bta_gattc_process_api_open(&data); });

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/gatt/bta_gattc_api.cc:182:
void BTA_GATTC_Open(tGATT_IF client_if, const RawAddress& remote_bda,tBLE_ADDR_TYPE addr_type,tBTM_BLE_CONN_TYPE connection_type, tBT_TRANSPORT transport,bool opportunistic, uint8_t initiating_phys) {
  post_on_bt_main([data]() { bta_gattc_process_api_open(&data); });
```

```c


  post_on_bt_main([data]() { bta_gattc_process_api_open(&data); });
    bta_gattc_sm_execute(p_clcb, event, p_msg);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/gatt/bta_gattc_act.cc:361:
void bta_gattc_process_api_open(const tBTA_GATTC_DATA* p_msg) {
  if (p_clcb != nullptr) {
   // hci 中.event = BTA_GATTC_API_OPEN_EVT,
   // hci 中{BTA_GATTC_OPEN,BTA_GATTC_W4_CONN_ST},
    bta_gattc_sm_execute(p_clcb, event, p_msg);
```

```c


    /* BTA_GATTC_API_OPEN_EVT           */ {BTA_GATTC_OPEN,
  if (!GATT_Connect(p_clcb->p_rcb->client_if, p_data->api_conn.remote_bda,p_data->api_conn.remote_addr_type,BTM_BLE_DIRECT_CONNECTION, p_data->api_conn.transport,p_data->api_conn.opportunistic,p_data->api_conn.initiating_phys)) {

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/gatt/bta_gattc_act.cc:471:
void bta_gattc_open(tBTA_GATTC_CLCB* p_clcb, const tBTA_GATTC_DATA* p_data) {
  if (!GATT_Connect(p_clcb->p_rcb->client_if, p_data->api_conn.remote_bda,p_data->api_conn.remote_addr_type,BTM_BLE_DIRECT_CONNECTION, p_data->api_conn.transport,p_data->api_conn.opportunistic,p_data->api_conn.initiating_phys)) {
```

```c


  if (!GATT_Connect(p_clcb->p_rcb->client_if, p_data->api_conn.remote_bda,
      ret = acl_create_le_connection_with_id(gatt_if, bd_addr, addr_type);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/gatt/gatt_api.cc:1547:
bool GATT_Connect(tGATT_IF gatt_if, const RawAddress& bd_addr,tBLE_ADDR_TYPE addr_type, tBTM_BLE_CONN_TYPE connection_type,tBT_TRANSPORT transport, bool opportunistic,uint8_t initiating_phys) {
  if (is_direct) {
    if (! false || tcb_exist) {
    } else {
        // hci 中前台连接和后台连接在这里区分
      ret = acl_create_le_connection_with_id(gatt_if, bd_addr, addr_type);
```

```c


      ret = acl_create_le_connection_with_id(gatt_if, bd_addr, addr_type);
    bluetooth::shim::ACL_AcceptLeConnectionFrom(address_with_type, true, phys);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/acl/btm_acl.cc:3074:
bool acl_create_le_connection_with_id(uint8_t id, const RawAddress& bd_addr,tBLE_ADDR_TYPE addr_type, uint8_t phys) {
  if (bluetooth::common::init_flags::use_unified_connection_manager_is_enabled()) {
  } else {
      //hci 中这里还得看下为什么走这里
    bluetooth::shim::ACL_AcceptLeConnectionFrom(address_with_type, true, phys);
```

```c


    bluetooth::shim::ACL_AcceptLeConnectionFrom(address_with_type,
  Stack::GetInstance()->GetAcl()->AcceptLeConnectionFrom(ToAddressWithTypeFromLegacy(legacy_address_with_type), is_direct,std::move(promise), phys);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/main/shim/acl_api.cc:56:
bool bluetooth::shim::ACL_AcceptLeConnectionFrom(const tBLE_BD_ADDR& legacy_address_with_type, bool is_direct, uint8_t phys) {
  Stack::GetInstance()->GetAcl()->AcceptLeConnectionFrom(ToAddressWithTypeFromLegacy(legacy_address_with_type), is_direct,std::move(promise), phys);
```
```c


  Stack::GetInstance()->GetAcl()->AcceptLeConnectionFrom(
  handler_->CallOn(pimpl_.get(), &Acl::impl::accept_le_connection_from,address_with_type, is_direct, std::move(promise), phys);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/main/shim/acl.cc:1579:
void shim::legacy::Acl::AcceptLeConnectionFrom(const hci::AddressWithType& address_with_type, bool is_direct,std::promise<bool> promise, uint8_t phys) {
  handler_->CallOn(pimpl_.get(), &Acl::impl::accept_le_connection_from,address_with_type, is_direct, std::move(promise), phys);
```

```c


  handler_->CallOn(pimpl_.get(), &Acl::impl::accept_le_connection_from,
    GetAclManager()->CreateLeConnection(address_with_type, is_direct, phys);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/main/shim/acl.cc:1143:
struct shim::legacy::Acl::impl {
  void accept_le_connection_from(const hci::AddressWithType& address_with_type,bool is_direct, std::promise<bool> promise, uint8_t phys) {
    GetAclManager()->CreateLeConnection(address_with_type, is_direct, phys);
```

```c


    GetAclManager()->CreateLeConnection(address_with_type, is_direct, phys);// vivo caizheng modify for STD2414
  CallOn(pimpl_->le_impl_, &le_impl::create_le_connection_v2, address_with_type, true, is_direct, phys);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/gd/hci/acl_manager.cc:278:
void AclManager::CreateLeConnection(AddressWithType address_with_type, bool is_direct, uint8_t phys) {
    // hci 中前台连接 后台连接在这个函数区分一下，后续的处理le acl 连接完成的hci 指令的过程查看 vivoearphone.md
    // hci 中这里直接跳到处理l2cap 固件通道回调函数处
    
  CallOn(pimpl_->le_impl_, &le_impl::create_le_connection_v2, address_with_type, true, is_direct, phys);
```
