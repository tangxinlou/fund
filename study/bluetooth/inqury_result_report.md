/*******************************************************
$Author       : 唐新楼 
$Last modified: 2025-10-20 19:37
$Email        : 个人邮箱
$blog         : https://blog.csdn.net/daweigongting
$Filename     : inqury_result_report.md
$Description  : tangxinlou
*******************************************************/
《《《《《《《
第 1 章 结果上报  流程图

      |btm_inq.cc                              |bta_dm_device_search.cc      |btif_dm.cc                        |      
      |                                        |                             |                                  |      
      |btm_process_inq_results_standard:32     |》》                         |                                  |      
      |                                        |                             |                                  |      
      |                                        |bta_dm_inq_results_cb:48     |》》                              |      
      |                                        |                             |                                  |      
      |                                        |                             |btif_dm_search_devices_evt:63     |      
 
》》》》》》》


# 结果上报

```c


  btm_cb.btm_inq_vars.p_inq_results_cb = p_results_cb;
        (p_inq_results_cb)((tBTM_INQ_RESULTS * )p_cur,p_eir_data,HCI_EXT_INQ_RESPONSE_LEN);

bluetooth/system/stack/btm/btm_inq.cc:1265:
static void btm_process_inq_results_standard(EventView event) {
  for (const auto & response : responses) {
    if (is_new) {
      if (p_inq_results_cb) {
        (p_inq_results_cb)((tBTM_INQ_RESULTS * )p_cur,p_eir_data,HCI_EXT_INQ_RESPONSE_LEN);
```



```c


  bta_dm_search_cb.p_device_search_cback = search.p_cback;
    bta_dm_search_cb.p_device_search_cback(BTA_DM_INQ_RES_EVT,& result);

bluetooth/system/bta/dm/bta_dm_device_search.cc:211:
static void bta_dm_inq_results_cb(tBTM_INQ_RESULTS * p_inq,const uint8_t * p_eir,uint16_t eir_len) {
  result.inq_res.dev_class = p_inq->dev_class;
  BTM_COD_SERVICE_CLASS(service_class, p_inq->dev_class);
  if (bta_dm_search_cb.p_device_search_cback) {
    bta_dm_search_cb.p_device_search_cback(BTA_DM_INQ_RES_EVT,& result);
```


```c


 
          bt_properties.push_back(bt_property_t{BT_PROPERTY_CLASS_OF_DEVICE,sizeof(cod),& cod});

bluetooth/system/btif/src/btif_dm.cc:1417:
static void btif_dm_search_devices_evt(tBTA_DM_SEARCH_EVT event,tBTA_DM_SEARCH * p_search_data) {
  switch (event) {
    case BTA_DM_INQ_RES_EVT : {
      {
        uint32_t cod = devclass2uint(p_search_data->inq_res.dev_class);
        if (cod != 0) {
          bt_properties.push_back(bt_property_t{BT_PROPERTY_CLASS_OF_DEVICE,sizeof(cod),& cod});
```
