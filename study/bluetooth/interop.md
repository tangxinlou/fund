/*******************************************************
$Author       : 唐新楼 
$Last modified: 2025-10-15 10:35
$Email        : 个人邮箱
$blog         : https://blog.csdn.net/daweigongting
$Filename     : interop.md
$Description  : tangxinlou
*******************************************************/
《《《《《《《
第 1 章 名单加载  流程图

      |stack_manager.cc                   |interop.cc                            |      
      |                                   |                                      |      
      |ensure_stack_is_initialized:45     |V                                     |      
      |                                   |                                      |      
      |event_init_stack:61                |V                                     |      
      |                                   |                                      |      
      |init_stack_internal:74             |》》                                  |      
      |                                   |                                      |      
      |                                   |static future_t * interop_init:85     |V     
      |                                   |                                      |      
      |                                   |interop_lazy_init_:96                 |V     
      |                                   |                                      |      
      |                                   |load_config:108                       |      
 
第 2 章 名单匹配  流程图

      |interop.cc                          |      
      |                                    |      
      |interop_match_addr:124              |V     
      |                                    |      
      |interop_database_match_addr:136     |V     
      |                                    |      
      |interop_database_match:147          |      
 
》》》》》》》



# 名单加载

```c


static void ensure_stack_is_initialized(bluetooth::core::CoreInterface* interface) {
  ensure_stack_is_initialized(interface);

bluetooth/system/btif/src/stack_manager.cc:290:
static void event_start_up_stack(bluetooth :: core :: CoreInterface * interface,ProfileStartCallback startProfiles,ProfileStopCallback stopProfiles) {
  ensure_stack_is_initialized(interface);
```


```c


 
    init_stack_internal(interface);

bluetooth/system/btif/src/stack_manager.cc:265:
static void event_init_stack(std :: promise<void> promise,bluetooth :: core :: CoreInterface * interface) {
  } else {
    init_stack_internal(interface);
```


```c


        .name = INTEROP_MODULE,
  module_init(get_local_module(INTEROP_MODULE));

bluetooth/system/btif/src/stack_manager.cc:250:
static void init_stack_internal(bluetooth :: core :: CoreInterface * interface) {
  module_init(get_local_module(INTEROP_MODULE));
```

```c


 
  interop_lazy_init_();

bluetooth/system/device/src/interop.cc:297:
static future_t * interop_init(void) {
  interop_lazy_init_();
```

```c


 
    load_config();

bluetooth/system/device/src/interop.cc:409:
static void interop_lazy_init_(void) {
  if (interop_list == NULL) {
    load_config();
```

```c


 
        load_to_database(feature,entry.key.c_str(),entry.value.c_str(),INTEROP_ENTRY_TYPE_STATIC);

bluetooth/system/device/src/interop.cc:1129:
static void load_config() {
  for (const section_t & sec : config_static.get()->sections) {
    if ((feature = interop_feature_name_to_feature_id(sec.name.c_str())) != - 1) {
      for (const entry_t & entry : sec.entries) {
        load_to_database(feature,entry.key.c_str(),entry.value.c_str(),INTEROP_ENTRY_TYPE_STATIC);
```

# 名单匹配

```c


  BTIF_STORAGE_FILL_PROPERTY(&prop_name, BT_PROPERTY_BDNAME, sizeof(bt_bdname_t), bdname.name);
  return interop_database_match_addr(feature,addr);

bluetooth/system/device/src/interop.cc:210:
bool interop_match_addr(const interop_feature_t feature,const RawAddress * addr) {
  return interop_database_match_addr(feature,addr);
```


```c


 
  if (interop_database_match( & entry,NULL,(interop_entry_type)(INTEROP_ENTRY_TYPE_STATIC | INTEROP_ENTRY_TYPE_DYNAMIC))) {

bluetooth/system/device/src/interop.cc:1296:
bool interop_database_match_addr(const interop_feature_t feature,const RawAddress * addr) {
  if (interop_database_match( & entry,NULL,(interop_entry_type)(INTEROP_ENTRY_TYPE_STATIC | INTEROP_ENTRY_TYPE_DYNAMIC))) {
```

```c


 
        if ((src->feature == cur->feature) && (strcasestr(src->name,cur->name) == src->name)) {

bluetooth/system/device/src/interop.cc:680:
static bool interop_database_match(interop_db_entry_t * entry,interop_db_entry_t ** ret_entry,interop_entry_type entry_type) {
  while (node != list_end(interop_list)) {
    switch (db_entry->bl_type) {
      case INTEROP_BL_TYPE_NAME : {
        if ((src->feature == cur->feature) && (strcasestr(src->name,cur->name) == src->name)) {
```
