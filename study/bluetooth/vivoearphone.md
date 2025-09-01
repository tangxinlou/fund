/*******************************************************
$Author       : 唐新楼 
$Last modified:	2025-04-30 14:45
$Email        : 个人邮箱
$blog         : https://blog.csdn.net/daweigongting
$Filename     :	vivoearphone.md
$Description  : vivo 耳机两种配对流程 smp over br ，linkey from le
*******************************************************/
《《《《《《《
第 1 章 先连接le  流程图

      |btm_sec.cc                                    |smp_api.cc                   |l2c_api.cc                    |l2c_ble.cc                           |btm_acl.cc                               |acl_api.cc     |acl.cc                            |acl_manager.cc             |le_impl.h                       |hci_layer.cc                            |ble_acl.cc                                             |btu_hcif.cc                    |btm_ble_gap.cc                                |classic_impl.h                             |l2c_utils.cc                         |gatt_main.cc                  |      
      |                                              |                             |                              |                                     |                                         |               |                                  |                           |                                |                                        |                                                       |                               |                                              |                                           |                                     |                              |      
      |tBTM_STATUS btm_sec_bond_by_transport:173     |》》                         |                              |                                     |                                         |               |                                  |                           |                                |                                        |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |                                         |               |                                  |                           |                                |                                        |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |tSMP_STATUS SMP_Pair:188     |》》                          |                                     |                                         |               |                                  |                           |                                |                                        |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |                                         |               |                                  |                           |                                |                                        |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |L2CA_ConnectFixedChnl:205     |》》                                 |                                         |               |                                  |                           |                                |                                        |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |                                         |               |                                  |                           |                                |                                        |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |l2cble_create_conn:217               |》》                                     |               |                                  |                           |                                |                                        |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |                                         |               |                                  |                           |                                |                                        |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |acl_create_le_connection:228             |V              |                                  |                           |                                |                                        |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |                                         |               |                                  |                           |                                |                                        |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |acl_create_le_connection_with_id:241     |》》           |                                  |                           |                                |                                        |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |                                         |               |                                  |                           |                                |                                        |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |                                         |shim:254       |》》                              |                           |                                |                                        |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |                                         |               |                                  |                           |                                |                                        |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |                                         |               |legacy:265                        |V                          |                                |                                        |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |                                         |               |                                  |                           |                                |                                        |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |                                         |               |accept_le_connection_from:277     |》》                       |                                |                                        |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |                                         |               |                                  |                           |                                |                                        |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |                                         |               |                                  |CreateLeConnection:288     |》》                            |                                        |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |                                         |               |                                  |                           |                                |                                        |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |                                         |               |                                  |                           |create_le_connection_v2:301     |》》                                    |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |                                         |               |                                  |                           |                                |                                        |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |                                         |               |                                  |                           |《《                            |on_hci_event:319                        |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |                                         |               |                                  |                           |                                |                                        |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |                                         |               |                                  |                           |on_le_event:335                 |V                                       |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |                                         |               |                                  |                           |                                |                                        |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |                                         |               |                                  |《《                       |RegisterLeCallbacks:347         |                                        |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |                                         |               |                                  |                           |                                |                                        |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |                                         |               |legacy:371                        |》》                       |                                |                                        |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |                                         |               |                                  |                           |                                |                                        |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |                                         |               |                                  |                           |                                |                                        |acl_ble_enhanced_connection_complete_from_shim:383     |V                              |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |                                         |               |                                  |                           |                                |                                        |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |                                         |               |                                  |                           |                                |《《                                    |acl_ble_common_connection:395                          |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |                                         |               |                                  |                           |                                |                                        |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |btm_acl_created:406                      |》》           |                                  |                           |                                |                                        |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |                                         |               |                                  |                           |                                |                                        |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |                                         |               |                                  |                           |                                |                                        |                                                       |btu_hcif_process_event:421     |》》                                          |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |                                         |               |                                  |                           |                                |                                        |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |                                         |               |                                  |                           |                                |                                        |                                                       |《《                           |btm_ble_read_remote_features_complete:438     |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |                                         |               |                                  |                           |                                |                                        |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |                                         |               |                                  |                           |                                |on_read_remote_version_complete:452     |V                                                      |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |                                         |               |                                  |                           |                                |                                        |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |                                         |               |                                  |                           |                                |ReadRemoteVersion:464                   |》》                                                   |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |                                         |               |                                  |                           |                                |                                        |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |                                         |               |                                  |                           |                                |                                        |                                                       |                               |《《                                          |on_read_remote_version_information:477     |                                     |                              |      
      |                                              |                             |                              |                                     |                                         |               |                                  |                           |                                |                                        |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |                                         |《《           |LeShimAclConnection::490          |                           |                                |                                        |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |                                         |               |                                  |                           |                                |                                        |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |btm_read_remote_version_complete:502     |V              |                                  |                           |                                |                                        |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |                                         |               |                                  |                           |                                |                                        |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |《《                                 |l2cble_notify_le_connection:510          |               |                                  |                           |                                |                                        |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |                                         |               |                                  |                           |                                |                                        |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |l2cu_process_fixed_chnl_resp:525     |》》                                     |               |                                  |                           |                                |                                        |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |                                         |               |                                  |                           |                                |                                        |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |                                         |               |                                  |                           |                                |                                        |                                                       |                               |                                              |                                           |l2cu_process_fixed_chnl_resp:541     |》》                          |      
      |                                              |                             |                              |                                     |                                         |               |                                  |                           |                                |                                        |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |                                         |               |                                  |                           |                                |                                        |                                                       |                               |                                              |                                           |                                     |gatt_le_connect_cback:555     |V     
      |                                              |                             |                              |                                     |                                         |               |                                  |                           |                                |                                        |                                                       |                               |                                              |                                           |                                     |                              |      
      |                                              |                             |                              |                                     |                                         |               |                                  |                           |                                |                                        |                                                       |                               |                                              |                                           |                                     |gatt_send_conn_cback:568      |      
 
第 2 章 smp  流程图

      |smp_l2c.cc                   |smp_act.cc                                     |acl.cc       |btm_acl.cc               |l2c_main.cc              |gatt_main.cc              |gatt_sr.cc                            |smp_keys.cc                              |btm_ble_sec.cc                             |bta_dm_sec.cc                |btif_dm.cc                      |smp_api.cc                 |smp_utils.cc                                       |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |smp_connect_callback:587     |》》                                           |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |smp_send_app_cback:603                         |V            |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |smp_send_pair_req:621                          |》》         |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |if():636     |》》                     |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |acl_rcv_acl_data:654     |》》                     |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |l2c_rcv_acl_data:665     |》》                      |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |gatt_le_data_ind:679      |V                                     |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |gatt_data_process:691     |》》                                  |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |gatt_server_handle_client_req:708     |V                                        |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |《《                      |gatts_process_mtu_req:724             |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |smp_data_received:738        |》》                                           |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |smp_proc_pair_cmd:752                          |V            |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |smp_decide_association_model:766               |》》         |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |smp_create_private_key:778               |V                                          |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |《《                                  |smp_process_private_key:790              |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |《《                         |smp_send_pair_public_key:803                   |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |smp_data_received:815        |》》                                           |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |smp_process_pairing_public_key:829             |V            |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |smp_wait_for_both_public_keys:841              |V            |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |《《                         |smp_both_have_public_keys:855                  |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |smp_data_received:873        |》》                                           |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |《《                         |smp_send_rand:889                              |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |smp_data_received:901        |》》                                           |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |smp_process_peer_nonce:916                     |V            |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |smp_send_app_cback:935                         |》》         |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |tBTM_STATUS btm_proc_smp_cback:947         |》》                         |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |                                           |bta_dm_ble_smp_cback:962     |》》                            |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |                                           |                             |btif_dm_sec_evt:975             |V                          |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |                                           |                             |btif_dm_ble_sec_req_evt:989     |V                          |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |                                           |《《                         |btif_dm_ssp_reply:1003          |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |BTM_SecurityGrant:1017                     |》》                         |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |                                           |                             |《《                            |SMP_SecurityGrant:1027     |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |smp_move_to_secure_connections_phase2:1043     |》》         |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |smp_calculate_local_dhkey_check:1057     |》》                                       |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |《《                       |smp_calculate_f5_mackey_and_long_term_key:1072     |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |smp_send_dhkey_check:1083                      |》》         |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |《《                                  |smp_calculate_peer_dhkey_check:1112      |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |smp_match_dhkey_checks:1123                    |》》         |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |smp_generate_stk:1138                    |V                                          |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |smp_process_stk:1151                     |》》                                       |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |                                           |                             |                                |                           |                                                   |      
      |                             |                                               |             |                         |                         |                          |                                      |                                         |tBTM_STATUS btm_ble_start_encrypt:1163     |                             |                                |                           |                                                   |      
 
》》》》》》》


# 先连接le
-提取码201937

```c


 
      btm_sec_cb.change_pairing_state(BTM_PAIR_STATE_WAIT_AUTH_COMPLETE);

/opt6/tangxinlouosc/gerrit/ard15/2405/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/btm/btm_sec.cc:814:
tBTM_STATUS btm_sec_bond_by_transport(const RawAddress& bd_addr,tBLE_ADDR_TYPE addr_type,tBT_TRANSPORT transport) {
  if (transport == BT_TRANSPORT_LE) {
      // hci 中HCI_Delete_Stored_Link_Key
  if ((BTM_DeleteStoredLinkKey(&bd_addr, NULL)) != BTM_SUCCESS) {
    if (SMP_Pair(bd_addr, addr_type) == SMP_STARTED) {
      btm_sec_cb.change_pairing_state(BTM_PAIR_STATE_WAIT_AUTH_COMPLETE);
```

```c


    if (SMP_Pair(bd_addr, addr_type) == SMP_STARTED) {
    if (!L2CA_ConnectFixedChnl(L2CAP_SMP_CID, bd_addr)) {

/opt6/tangxinlouosc/gerrit/ard15/2405/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/smp/smp_api.cc:103:
tSMP_STATUS SMP_Pair(const RawAddress& bd_addr, tBLE_ADDR_TYPE addr_type) {
  if (p_cb->state != SMP_STATE_IDLE ||p_cb->flags & SMP_PAIR_FLAGS_WE_STARTED_DD || p_cb->smp_over_br) {
  } else {
      // hci 中L2CAP_SMP_CID l2cap 建立 
    if (!L2CA_ConnectFixedChnl(L2CAP_SMP_CID, bd_addr)) {
```




```c


 
    bool ret = l2cu_create_conn_le(p_lcb);

/opt6/tangxinlouosc/gerrit/ard15/2405/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/l2cap/l2c_api.cc:1438:
bool L2CA_ConnectFixedChnl(uint16_t fixed_cid, const RawAddress& rem_bda) {
  if (transport == BT_TRANSPORT_LE) {
    bool ret = l2cu_create_conn_le(p_lcb);
```

```c


  return (l2cble_create_conn(p_lcb));
  if (!acl_create_le_connection(p_lcb->remote_bd_addr)) {

/opt6/tangxinlouosc/gerrit/ard15/2405/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/l2cap/l2c_ble.cc:1019:
bool l2cble_create_conn(tL2C_LCB* p_lcb) {
  if (!acl_create_le_connection(p_lcb->remote_bd_addr)) {
```

```c


 
  return acl_create_le_connection_with_id(CONN_MGR_ID_L2CAP, bd_addr);

/opt6/tangxinlouosc/gerrit/ard15/2405/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/acl/btm_acl.cc:3038:
bool acl_create_le_connection(const RawAddress& bd_addr) {
  return acl_create_le_connection_with_id(CONN_MGR_ID_L2CAP, bd_addr);
```



```c


  return acl_create_le_connection_with_id(id, bd_addr, addr_type, PHY_LE_ALL);// vivo caizheng modify for STD2414
    bluetooth::shim::ACL_AcceptLeConnectionFrom(address_with_type, true, phys);

/opt6/tangxinlouosc/gerrit/ard15/2405/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/acl/btm_acl.cc:3027:
bool acl_create_le_connection_with_id(uint8_t id, const RawAddress& bd_addr,tBLE_ADDR_TYPE addr_type, uint8_t phys) {
  if (bluetooth::common::init_flags::use_unified_connection_manager_is_enabled()) {
  } else {
    bluetooth::shim::ACL_AcceptLeConnectionFrom(address_with_type, true, phys);
```

```c


    bluetooth::shim::ACL_AcceptLeConnectionFrom(address_with_type,
  Stack::GetInstance()->GetAcl()->AcceptLeConnectionFrom(ToAddressWithTypeFromLegacy(legacy_address_with_type), is_direct,std::move(promise), phys);

/opt6/tangxinlouosc/gerrit/ard15/2405/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/main/shim/acl_api.cc:56:
bool bluetooth::shim::ACL_AcceptLeConnectionFrom(const tBLE_BD_ADDR& legacy_address_with_type, bool is_direct, uint8_t phys) {
  Stack::GetInstance()->GetAcl()->AcceptLeConnectionFrom(ToAddressWithTypeFromLegacy(legacy_address_with_type), is_direct,std::move(promise), phys);
```

```c


  Stack::GetInstance()->GetAcl()->AcceptLeConnectionFrom(
  handler_->CallOn(pimpl_.get(), &Acl::impl::accept_le_connection_from,address_with_type, is_direct, std::move(promise), phys);

/opt6/tangxinlouosc/gerrit/ard15/2405/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/main/shim/acl.cc:1522:
void shim::legacy::Acl::AcceptLeConnectionFrom(const hci::AddressWithType& address_with_type, bool is_direct,std::promise<bool> promise, uint8_t phys) {
  handler_->CallOn(pimpl_.get(), &Acl::impl::accept_le_connection_from,address_with_type, is_direct, std::move(promise), phys);
```

```c


  handler_->CallOn(pimpl_.get(), &Acl::impl::accept_le_connection_from,
    GetAclManager()->CreateLeConnection(address_with_type, is_direct, phys);

/opt6/tangxinlouosc/gerrit/ard15/2405/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/main/shim/acl.cc:1143:
struct shim::legacy::Acl::impl {
  void accept_le_connection_from(const hci::AddressWithType& address_with_type,bool is_direct, std::promise<bool> promise, uint8_t phys) {
    GetAclManager()->CreateLeConnection(address_with_type, is_direct, phys);
```

```c


    GetAclManager()->CreateLeConnection(address_with_type, is_direct, phys);// vivo caizheng modify for STD2414
  CallOn(pimpl_->le_impl_, &le_impl::create_le_connection_v2, address_with_type, true, is_direct, phys);

/opt6/tangxinlouosc/gerrit/ard15/2405/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/gd/hci/acl_manager.cc:278:
void AclManager::CreateLeConnection(AddressWithType address_with_type, bool is_direct, uint8_t phys) {
  CallOn(pimpl_->le_impl_, &le_impl::create_le_connection_v2, address_with_type, true, is_direct, phys);
```


```c


  CallOn(pimpl_->le_impl_, &le_impl::create_le_connection_v2, address_with_type, true, is_direct, phys);// vivo caizheng modify for STD2414
        direct_connect_add(address_with_type, phys);

/opt6/tangxinlouosc/gerrit/ard15/2405/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/gd/hci/acl_manager/le_impl.h:1122:
struct le_impl : public bluetooth::hci::LeAddressManagerCallback {
  void create_le_connection_v2(AddressWithType address_with_type, bool add_to_accept_list, bool is_direct, uint8_t phys) {
    if (add_to_accept_list) {
        // hci 中前台连接后台连接这里还得区分一下
        //hci 中 HCI_LE_Add_Device_To_Filter_Accept_List
        add_device_to_accept_list(address_with_type);
      if (is_direct) {
          // hci 中HCI_LE_Extended_Create_Connection
        direct_connect_add(address_with_type, phys);
```

```c


 
        on_le_meta_event(event);

/opt6/tangxinlouosc/gerrit/ard15/2405/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/gd/hci/hci_layer.cc:456:
struct HciLayer::impl {
  void on_hci_event(EventView event) {
    switch (event_code) {
        // hci 中 le hci event 处理
      case EventCode::LE_META_EVENT:
        on_le_meta_event(event);
```


```c


        handler_->BindOn(this, &le_impl::on_le_event),
        on_le_connection_complete(event_packet);

/opt6/tangxinlouosc/gerrit/ard15/2405/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/gd/hci/acl_manager/le_impl.h:186:
struct le_impl : public bluetooth::hci::LeAddressManagerCallback {
  void on_le_event(LeMetaEventView event_packet) {
    switch (code) {
        // hci 中处理HCI_LE_Enhanced_Connection_Complete
      case SubeventCode::ENHANCED_CONNECTION_COMPLETE:
        on_le_connection_complete(event_packet);
```



```c

//hci 中调用是调用到shim::legacy::Acl::OnLeConnectSuccess 通过这个函数注册 这个函数从shim 到gd 注册
void AclManager::RegisterLeCallbacks(LeConnectionCallbacks* callbacks, os::Handler* handler) {
 
      le_client_handler_->Post(common::BindOnce(&LeConnectionCallbacks::OnLeConnectSuccess,common::Unretained(le_client_callbacks_),remote_address,std::move(connection)));

/opt6/tangxinlouosc/gerrit/ard15/2405/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/gd/hci/acl_manager/le_impl.h:527:
struct le_impl : public bluetooth::hci::LeAddressManagerCallback {
  void on_le_connection_complete(LeMetaEventView packet) {
    if (std::holds_alternative<DataAsUninitializedPeripheral>(role_specific_data)) {
    } else {
      //hci 中告知上层le连上
      le_client_handler_->Post(common::BindOnce(&LeConnectionCallbacks::OnLeConnectSuccess,common::Unretained(le_client_callbacks_),remote_address,std::move(connection)));
       // hci 中在这个函数建立了acl 保存参数
    low_power_debug_->UpdateLeLink(handle,conn_interval,conn_interval); 
```



```c


      .connection.le.on_connected =
  TRY_POSTING_ON_MAIN(acl_interface_.connection.le.on_connected,legacy_address_with_type, handle,ToLegacyRole(connection_role), conn_interval,conn_latency, conn_timeout, local_rpa, peer_rpa,peer_addr_type, can_read_discoverable_characteristics);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/main/shim/acl.cc:1801:
void shim::legacy::Acl::OnLeConnectSuccess(hci::AddressWithType address_with_type,std::unique_ptr<hci::acl_manager::LeAclConnection> connection) {
     // hci 中HCI_Read_Remote_Version_Information
  pimpl_->handle_to_le_connection_map_[handle]->ReadRemoteControllerInformation(); 
  TRY_POSTING_ON_MAIN(acl_interface_.connection.le.on_connected,legacy_address_with_type, handle,ToLegacyRole(connection_role), conn_interval,conn_latency, conn_timeout, local_rpa, peer_rpa,peer_addr_type, can_read_discoverable_characteristics);
```
```c


          acl_ble_enhanced_connection_complete_from_shim,
    connection_manager::on_connection_complete(address_with_type.bda);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/acl/ble_acl.cc:129:
void acl_ble_enhanced_connection_complete_from_shim(const tBLE_BD_ADDR& address_with_type, uint16_t handle, tHCI_ROLE role,uint16_t conn_interval, uint16_t conn_latency, uint16_t conn_timeout,const RawAddress& local_rpa, const RawAddress& peer_rpa,tBLE_ADDR_TYPE peer_addr_type, bool can_read_discoverable_characteristics) {
      //hci 中处理ble acl 连接完成
   acl_ble_enhanced_connection_complete(resolved_address_with_type, handle, role, is_in_security_db,conn_interval, conn_latency, conn_timeout, local_rpa, peer_rpa,peer_addr_type, can_read_discoverable_characteristics); 
```

```c


 
  btm_acl_created(address_with_type.bda, handle, role, BT_TRANSPORT_LE);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/acl/ble_acl.cc:80:
static bool acl_ble_common_connection(const tBLE_BD_ADDR& address_with_type, uint16_t handle, tHCI_ROLE role,bool is_in_security_db, uint16_t conn_interval, uint16_t conn_latency,uint16_t conn_timeout, bool can_read_discoverable_characteristics) {
  btm_acl_created(address_with_type.bda, handle, role, BT_TRANSPORT_LE);
```

```c


  btm_acl_created(address_with_type.bda, handle, role, BT_TRANSPORT_LE);
      btsnd_hcic_ble_read_remote_feat(p_acl->hci_handle);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/acl/btm_acl.cc:568:
void btm_acl_created(const RawAddress& bda, uint16_t hci_handle,tHCI_ROLE link_role, tBT_TRANSPORT transport) {
  if (transport == BT_TRANSPORT_LE) {
    if (controller_get_interface()->SupportsBlePeripheralInitiatedFeaturesExchange() ||link_role == HCI_ROLE_CENTRAL) {
        // hci 中HCI_LE_Read_Remote_Features
      btsnd_hcic_ble_read_remote_feat(p_acl->hci_handle);
```


```c


      btu_hcif_process_event((uint8_t)(p_msg->event & BT_SUB_EVT_MASK), p_msg);
          btm_ble_read_remote_features_complete(p, ble_evt_len);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/btu/btu_hcif.cc:336:
void btu_hcif_process_event(UNUSED_ATTR uint8_t controller_id,const BT_HDR* p_msg) {
  switch (hci_evt_code) {
    case HCI_BLE_EVENT: {
      switch (ble_sub_code) {
        case HCI_BLE_READ_REMOTE_FEAT_CMPL_EVT:
        //hci 中HCI_LE_Read_Remote_Features_Complete
          btm_ble_read_remote_features_complete(p, ble_evt_len);
```


```c


          btm_ble_read_remote_features_complete(p, ble_evt_len);
    btsnd_hcic_rmt_ver_req(handle);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/btm/btm_ble_gap.cc:3292:
void btm_ble_read_remote_features_complete(uint8_t* p, uint8_t length) {
  if (BTM_IsBLEHDTABRSupported()) {
  } else {
      // hci 中HCI_Read_Remote_Version_Information
    btsnd_hcic_rmt_ver_req(handle);
```

```c


      handler->BindOn(this, &HciLayer::on_read_remote_version_complete));
  ReadRemoteVersion(view.GetStatus(),view.GetConnectionHandle(),view.GetVersion(),view.GetManufacturerName(),view.GetSubVersion());

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/gd/hci/hci_layer.cc:767:
void HciLayer::on_read_remote_version_complete(EventView event_view) {
    //hci 中HCI_Read_Remote_Version_Information_Complete
  ReadRemoteVersion(view.GetStatus(),view.GetConnectionHandle(),view.GetVersion(),view.GetManufacturerName(),view.GetSubVersion());
```

```c


 
    callback.Invoke(hci_status, handle, version, manufacturer_name, sub_version);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/gd/hci/hci_layer.cc:783:
void HciLayer::ReadRemoteVersion(hci::ErrorCode hci_status, uint16_t handle, uint8_t version, uint16_t manufacturer_name, uint16_t sub_version) {
  for (auto callback : read_remote_version_handlers_) {
    callback.Invoke(hci_status, handle, version, manufacturer_name, sub_version);
```

```c


        handler_->BindOn(this, &classic_impl::on_read_remote_version_information));
    connections.execute(handle, [=](ConnectionManagementCallbacks* callbacks) {callbacks->OnReadRemoteVersionInformationComplete(hci_status, version, manufacturer_name, sub_version);});

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/gd/hci/acl_manager/classic_impl.h:762:
struct classic_impl : public security::ISecurityManagerListener {
  void on_read_remote_version_information(hci::ErrorCode hci_status, uint16_t handle, uint8_t version, uint16_t manufacturer_name, uint16_t sub_version) {
      // hci 中le 和br 都是这个地方调用但是根据handle 不同会调用不同接口
    connections.execute(handle, [=](ConnectionManagementCallbacks* callbacks) {callbacks->OnReadRemoteVersionInformationComplete(hci_status, version, manufacturer_name, sub_version);});
```


```c



    TRY_POSTING_ON_MAIN(interface_.on_read_remote_version_information_complete,ToLegacyHciErrorCode(hci_status), handle_, lmp_version,manufacturer_name, sub_version);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/main/shim/acl.cc:857:
class LeShimAclConnection: public ShimAclConnection,public hci::acl_manager::LeConnectionManagementCallbacks {
  void OnReadRemoteVersionInformationComplete(hci::ErrorCode hci_status,uint8_t lmp_version,uint16_t manufacturer_name,uint16_t sub_version) override {
    TRY_POSTING_ON_MAIN(interface_.on_read_remote_version_information_complete,ToLegacyHciErrorCode(hci_status), handle_, lmp_version,manufacturer_name, sub_version);
```

```c


          btm_read_remote_version_complete,
  maybe_chain_more_commands_after_read_remote_version_complete(status, handle);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/acl/btm_acl.cc:1058:
void btm_read_remote_version_complete(tHCI_STATUS status, uint16_t handle,uint8_t lmp_version,uint16_t manufacturer,uint16_t lmp_subversion) {
    // hci 中获取对端芯片信息后，上报gatt 等 ble 连接状态
  maybe_chain_more_commands_after_read_remote_version_complete(status, handle);
```

```c


void l2cble_notify_le_connection(const RawAddress& bda) {
      bta_gattc_continue_discovery_if_needed(p_acl_cb->remote_addr,p_acl_cb->Handle());

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/acl/btm_acl.cc:988:
static void maybe_chain_more_commands_after_read_remote_version_complete(uint8_t status, uint16_t handle) {
  switch (p_acl_cb->transport) {
    case BT_TRANSPORT_LE:
    // hci 中告知gatt 连接状态改变
       l2cble_notify_le_connection(p_acl_cb->remote_addr);
       // att l2cap 连接参数
      l2cble_use_preferred_conn_params(p_acl_cb->remote_addr);
```
```c


void l2cu_process_fixed_chnl_resp(tL2C_LCB* p_lcb) {
    l2cu_process_fixed_chnl_resp(p_lcb);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/l2cap/l2c_ble.cc:150:
void l2cble_notify_le_connection(const RawAddress& bda) {
  if (BTM_IsAclConnectionUp(bda, BT_TRANSPORT_LE) &&p_lcb->link_state != LST_CONNECTED) {
      // hci 中gatt l2cap 固定通道
    l2cu_process_fixed_chnl_resp(p_lcb);
```
```c


      (*l2cb.fixed_reg[xx].pL2CA_FixedConn_Cb)(
      (*l2cb.fixed_reg[xx].pL2CA_FixedConn_Cb)(channel_id, p_lcb->remote_bd_addr, true, 0, p_lcb->transport);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/l2cap/l2c_utils.cc:3004:
void l2cu_process_fixed_chnl_resp(tL2C_LCB* p_lcb) {
  for (int xx = 0; xx < L2CAP_NUM_FIXED_CHNLS; xx++) {
    if (p_lcb->peer_chnl_mask[(channel_id) / 8] & (1 << ((channel_id) % 8))) {
        // hci 中这个是关键调用，acl 连接后会回调所有注册的固定l2cap 通道的连接回调比如att smp smpbr 的回调
        // hci 中貌似只要acl 一连接注册的固定l2cap 通道就相当于建立了
      (*l2cb.fixed_reg[xx].pL2CA_FixedConn_Cb)(channel_id, p_lcb->remote_bd_addr, true, 0, p_lcb->transport);
```
```c


  fixed_reg.pL2CA_FixedConn_Cb = gatt_le_connect_cback;
      gatt_send_conn_cback(p_tcb);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/gatt/gatt_main.cc:681:
static void gatt_le_connect_cback(uint16_t chan, const RawAddress& bd_addr,bool connected, uint16_t reason,tBT_TRANSPORT transport) {
  if (p_tcb) {
    if (gatt_get_ch_state(p_tcb) == GATT_CH_CONN) {
        //hci 中L2CAP_ATT_CID 固定通道的回调函数对应函数gatt_le_connect_cback在acl 建立后被调用 
      gatt_send_conn_cback(p_tcb);
```
```c


 
      (*p_reg->app_cb.p_conn_cb)(p_reg->gatt_if, p_tcb->peer_bda, conn_id,kGattConnected, GATT_CONN_OK,p_tcb->transport);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/gatt/gatt_main.cc:1122:
static void gatt_send_conn_cback(tGATT_TCB* p_tcb) {
  for (i = 0, p_reg = gatt_cb.cl_rcb; i < GATT_MAX_APPS; i++, p_reg++) {
    if (p_reg->app_cb.p_conn_cb) {
        // hci 中这个循环也很重要 会调用这些回调bta_gattc_conn_cback bta_gatts_conn_cback gatt_connect_cback client_connect_cback srvc_eng_connect_cback
        //hci 中 貌似在gatt看来， gatt server gattt client gap 等都是应用程序 都是APP
        //hci 中  client_connect_cback  这个就是gatt 连上的回调

      (*p_reg->app_cb.p_conn_cb)(p_reg->gatt_if, p_tcb->peer_bda, conn_id,kGattConnected, GATT_CONN_OK,p_tcb->transport);
```

# smp request 

```c


    .p_conn_cb = bta_gattc_conn_cback,
        smp_sm_event(p_cb, SMP_L2CAP_CONN_EVT, NULL);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/smp/smp_l2c.cc:129:
static void smp_connect_callback(UNUSED_ATTR uint16_t channel,const RawAddress& bd_addr, bool connected,UNUSED_ATTR uint16_t reason,tBT_TRANSPORT transport) {
  if (bd_addr == p_cb->pairing_bda) {
    if (connected) {
      if (!p_cb->connect_initialized) {
          // hci 中L2CAP_SMP_CID 固定通道的连接回调pL2CA_FixedConn_Cb被调用继续ble 的smp 流程
    {SMP_SEND_APP_CBACK, SMP_SM_NO_ACTION, SMP_STATE_WAIT_APP_RSP},
        p_cb->cb_evt = SMP_IO_CAP_REQ_EVT;
        smp_sm_event(p_cb, SMP_L2CAP_CONN_EVT, NULL);
```
```c


 
          smp_sm_event(p_cb, SMP_IO_RSP_EVT, NULL);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/smp/smp_act.cc:240:
void smp_send_app_cback(tSMP_CB* p_cb, tSMP_INT_DATA* p_data) {
  if (p_cb->p_callback && p_cb->cb_evt != 0) {
    if (callback_rc == BTM_SUCCESS) {
      switch (p_cb->cb_evt) {
        case SMP_IO_CAP_REQ_EVT:
        // hci 中这个函数准备Pairing Request 的参数
        {SMP_SEND_PAIR_REQ, SMP_SM_NO_ACTION, SMP_STATE_PAIR_REQ_RSP},
        p_cb->cb_evt = SMP_IO_CAP_REQ_EVT;
          smp_sm_event(p_cb, SMP_IO_RSP_EVT, NULL);
```

```c


        {SMP_SEND_PAIR_REQ, SMP_SM_NO_ACTION, SMP_STATE_PAIR_REQ_RSP},
  smp_send_cmd(SMP_OPCODE_PAIRING_REQ, p_cb);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/smp/smp_act.cc:311:
void smp_send_pair_req(tSMP_CB* p_cb, tSMP_INT_DATA* p_data) {
  // hci 中有段代码值得注意，会判断 p_cb->smp_over_br 如果是le smp 好像就会使用br link key 派生的  LTK
    // hci 中给对端发送Pairing Request
  smp_send_cmd(SMP_OPCODE_PAIRING_REQ, p_cb);
```






```c


    if (le_impl_->send_packet_upward(
    } else if (do_in_main_thread(FROM_HERE,base::BindOnce(send_data_upwards_, p_buf)) !=BT_STATUS_SUCCESS) {

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/main/shim/acl.cc:429:
class ShimAclConnection {
  void data_ready_callback() {
    if (send_data_upwards_ == nullptr) {
        // hci 中 这里有个下行队列函数，下行数据就会调用
        //hci 中acl 的data 数据通过这个函数往上传
    } else if (do_in_main_thread(FROM_HERE,base::BindOnce(send_data_upwards_, p_buf)) !=BT_STATUS_SUCCESS) {
```

```c


      .on_send_data_upwards = acl_rcv_acl_data,
  l2c_rcv_acl_data(p_msg);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/acl/btm_acl.cc:3107:
void acl_rcv_acl_data(BT_HDR* p_msg) {
  l2c_rcv_acl_data(p_msg);
```

```c


  l2c_rcv_acl_data(p_msg);
    else(*l2cb.fixed_reg[rcv_cid - L2CAP_FIRST_FIXED_CHNL].pL2CA_FixedData_Cb)(rcv_cid, p_lcb->remote_bd_addr, p_msg);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/l2cap/l2c_main.cc:183:
void l2c_rcv_acl_data(BT_HDR* p_msg) {
  if ((rcv_cid >= L2CAP_FIRST_FIXED_CHNL) &&(rcv_cid <= L2CAP_LAST_FIXED_CHNL) &&(l2cb.fixed_reg[rcv_cid - L2CAP_FIRST_FIXED_CHNL].pL2CA_FixedData_Cb !=NULL)) {
      // hci 这个函数中 接到对端数据会调用l2cble_notify_le_connection 通知上层le 连接这个函数经常被调用好像没有大用处
      // hci 中接到l2cap 数据时这里调用profile 的数据通道回调函数
    else(*l2cb.fixed_reg[rcv_cid - L2CAP_FIRST_FIXED_CHNL].pL2CA_FixedData_Cb)(rcv_cid, p_lcb->remote_bd_addr, p_msg);
```

```c


    l2cble_notify_le_connection(p_lcb->remote_bd_addr);
      gatt_data_process(*p_tcb, L2CAP_ATT_CID, p_buf);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/gatt/gatt_main.cc:925:
static void gatt_le_data_ind(uint16_t chan, const RawAddress& bd_addr,BT_HDR* p_buf) {
  if (p_tcb) {
      gatt_data_process(*p_tcb, L2CAP_ATT_CID, p_buf);
```

```c


      gatt_data_process(*p_tcb, L2CAP_ATT_CID, p_buf);
    if ((op_code % 2) == 0)gatt_server_handle_client_req(tcb, cid, op_code, msg_len, p);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/gatt/gatt_main.cc:1203:
void gatt_data_process(tGATT_TCB& tcb, uint16_t cid, BT_HDR* p_buf) {
  if (op_code == GATT_SIGN_CMD_WRITE) {
  } else {
    if ((op_code % 2) == 0)
        // hci 中gatt 角色可以改变，op_code 是偶数就是client 奇数就是server
      gatt_server_handle_client_req(tcb, cid, op_code, msg_len, p);
    else
      gatt_client_handle_server_rsp(tcb, cid, op_code, msg_len, p); 
```

```c


      gatt_server_handle_client_req(tcb, cid, op_code, msg_len, p);
        gatts_process_mtu_req(tcb, cid, len, p_data);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/gatt/gatt_sr.cc:1505:
void gatt_server_handle_client_req(tGATT_TCB& tcb, uint16_t cid,uint8_t op_code, uint16_t len,uint8_t* p_data) {
  if (len >= payload_size) {
  } else {
    switch (op_code) {
        // hci 中处理ATT_EXCHANGE_MTU_REQ
      case GATT_REQ_MTU:
        gatts_process_mtu_req(tcb, cid, len, p_data);
```

```c


        gatts_process_mtu_req(tcb, cid, len, p_data);
  attp_send_sr_msg(tcb, cid, p_buf);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/gatt/gatt_sr.cc:930:
static void gatts_process_mtu_req(tGATT_TCB& tcb, uint16_t cid, uint16_t len,uint8_t* p_data) {
    //hci 中回复 GATT_RSP_MTU
  attp_send_sr_msg(tcb, cid, p_buf);
```



```c


  if (SMP_OPCODE_PAIRING_REQ == cmd || SMP_OPCODE_SEC_REQ == cmd) {
    smp_sm_event(p_cb, static_cast<tSMP_EVENT>(cmd), &smp_int_data);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/smp/smp_l2c.cc:211:
static void smp_data_received(uint16_t channel, const RawAddress& bd_addr,BT_HDR* p_buf) {
  if (bd_addr == p_cb->pairing_bda) {
      // hci 中处理pair response
        {SMP_PROC_PAIR_CMD, SMP_SM_NO_ACTION, SMP_STATE_PAIR_REQ_RSP},
    smp_sm_event(p_cb, SMP_OPCODE_PAIRING_RSP, &smp_int_data);
```

```c


        {SMP_PROC_PAIR_CMD, SMP_SM_NO_ACTION, SMP_STATE_PAIR_REQ_RSP},
      smp_decide_association_model(p_cb, NULL);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/smp/smp_act.cc:688:
void smp_proc_pair_cmd(tSMP_CB* p_cb, tSMP_INT_DATA* p_data) {
  {
    if (p_cb->selected_association_model == SMP_MODEL_SEC_CONN_OOB) {
    } else {
      smp_decide_association_model(p_cb, NULL);
```

```c


      smp_decide_association_model(p_cb, NULL);
  if (int_evt) smp_sm_event(p_cb, int_evt, &smp_int_data);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/smp/smp_act.cc:1525:
void smp_decide_association_model(tSMP_CB* p_cb, tSMP_INT_DATA* p_data) {
        {SMP_CREATE_PRIVATE_KEY, SMP_SM_NO_ACTION, SMP_STATE_PUBLIC_KEY_EXCH}};
  if (int_evt) smp_sm_event(p_cb, SMP_PUBL_KEY_EXCH_REQ_EVT, &smp_int_data);
```

```c


  bluetooth::shim::GetController()->LeRand(std::move(callback));
  send_ble_rand(BindOnce([](tSMP_CB* p_cb, uint64_t rand) {memcpy(p_cb->private_key, (uint8_t*)&rand, sizeof(uint64_t));send_ble_rand(BindOnce([](tSMP_CB* p_cb, uint64_t rand) {memcpy(&p_cb->private_key[8], (uint8_t*)&rand, sizeof(uint64_t));send_ble_rand(BindOnce([](tSMP_CB* p_cb, uint64_t rand) {memcpy(&p_cb->private_key[16], (uint8_t*)&rand,sizeof(uint64_t));send_ble_rand(BindOnce([](tSMP_CB* p_cb, uint64_t rand) {memcpy(&p_cb->private_key[24], (uint8_t*)&rand,sizeof(uint64_t));smp_process_private_key(p_cb);},p_cb));},p_cb));},p_cb));},p_cb));

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/smp/smp_keys.cc:632:
void smp_create_private_key(tSMP_CB* p_cb, tSMP_INT_DATA* p_data) {
    // hci 中通过HCI_LE_Rand 建立私钥
  send_ble_rand(BindOnce([](tSMP_CB* p_cb, uint64_t rand) {memcpy(p_cb->private_key, (uint8_t*)&rand, sizeof(uint64_t));send_ble_rand(BindOnce([](tSMP_CB* p_cb, uint64_t rand) {memcpy(&p_cb->private_key[8], (uint8_t*)&rand, sizeof(uint64_t));send_ble_rand(BindOnce([](tSMP_CB* p_cb, uint64_t rand) {memcpy(&p_cb->private_key[16], (uint8_t*)&rand,sizeof(uint64_t));send_ble_rand(BindOnce([](tSMP_CB* p_cb, uint64_t rand) {memcpy(&p_cb->private_key[24], (uint8_t*)&rand,sizeof(uint64_t));smp_process_private_key(p_cb);},p_cb));},p_cb));},p_cb));},p_cb));
```

```c


 
  smp_sm_event(p_cb, SMP_LOC_PUBL_KEY_CRTD_EVT, NULL);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/smp/smp_keys.cc:744:
void smp_process_private_key(tSMP_CB* p_cb) {
    // hci 发公钥Pairing Public Key
        {SMP_SEND_PAIR_PUBLIC_KEY, SMP_SM_NO_ACTION, SMP_STATE_PUBLIC_KEY_EXCH},
  smp_sm_event(p_cb, SMP_LOC_PUBL_KEY_CRTD_EVT, NULL);
```

```c


 
  smp_send_cmd(SMP_OPCODE_PAIR_PUBLIC_KEY, p_cb);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/smp/smp_act.cc:357:
void smp_send_pair_public_key(tSMP_CB* p_cb, tSMP_INT_DATA* p_data) {
  smp_send_cmd(SMP_OPCODE_PAIR_PUBLIC_KEY, p_cb);
```


```c


  if (SMP_OPCODE_PAIRING_REQ == cmd || SMP_OPCODE_SEC_REQ == cmd) {
    smp_sm_event(p_cb, static_cast<tSMP_EVENT>(cmd), &smp_int_data);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/smp/smp_l2c.cc:211:
static void smp_data_received(uint16_t channel, const RawAddress& bd_addr,BT_HDR* p_buf) {
  if (bd_addr == p_cb->pairing_bda) {
 {SMP_PROCESS_PAIR_PUBLIC_KEY, SMP_SM_NO_ACTION,SMP_STATE_PUBLIC_KEY_EXCH},
    smp_sm_event(p_cb, SMP_OPCODE_PAIR_DHKEY_CHECK , &smp_int_data);
```


```c


        {SMP_PROCESS_PAIR_PUBLIC_KEY, SMP_SM_NO_ACTION,
  smp_wait_for_both_public_keys(p_cb, NULL);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/smp/smp_act.cc:792:
void smp_process_pairing_public_key(tSMP_CB* p_cb, tSMP_INT_DATA* p_data) {
    // hci 中处理Pairing Public Key
  smp_wait_for_both_public_keys(p_cb, NULL);
```

```c


  smp_wait_for_both_public_keys(p_cb, NULL);
    smp_sm_event(p_cb, SMP_BOTH_PUBL_KEYS_RCVD_EVT, NULL);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/smp/smp_act.cc:1994:
void smp_wait_for_both_public_keys(tSMP_CB* p_cb, tSMP_INT_DATA* p_data) {
  if ((p_cb->flags & SMP_PAIR_FLAG_HAVE_PEER_PUBL_KEY) &&(p_cb->flags & SMP_PAIR_FLAG_HAVE_LOCAL_PUBL_KEY)) {
 {SMP_HAVE_BOTH_PUBLIC_KEYS, SMP_SM_NO_ACTION,
         SMP_STATE_SEC_CONN_PHS1_START},
    smp_sm_event(p_cb, SMP_BOTH_PUBL_KEYS_RCVD_EVT, NULL);
```

```c


 {SMP_HAVE_BOTH_PUBLIC_KEYS, SMP_SM_NO_ACTION,
  smp_sm_event(p_cb, SMP_SC_DHKEY_CMPLT_EVT, NULL);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/smp/smp_act.cc:1694:
void smp_both_have_public_keys(tSMP_CB* p_cb, tSMP_INT_DATA* p_data) {
    // hci 中计算DHkey 
  smp_compute_dhkey(p_cb);
 {SMP_START_SEC_CONN_PHASE1, SMP_SM_NO_ACTION,
         SMP_STATE_SEC_CONN_PHS1_START},
  smp_sm_event(p_cb, SMP_SC_DHKEY_CMPLT_EVT, NULL);
```

-hci 中省略一些代码，关注hci 中的指令


```c


        cmd = SMP_OPCODE_PAIR_COMMITM;
    smp_sm_event(p_cb, static_cast<tSMP_EVENT>(cmd), &smp_int_data);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/smp/smp_l2c.cc:211:
static void smp_data_received(uint16_t channel, const RawAddress& bd_addr,BT_HDR* p_buf) {
  if (bd_addr == p_cb->pairing_bda) {
    if (cmd == SMP_OPCODE_CONFIRM) {
        cmd = SMP_OPCODE_PAIR_COMMITM;
        // hci 中接到对面的confirm 马上发本端的随机数 Pairing Confirm
    {SMP_PROCESS_PAIRING_COMMITMENT, SMP_SEND_RAND, SMP_STATE_WAIT_NONCE},
    smp_sm_event(p_cb, static_cast<tSMP_EVENT>(cmd), &smp_int_data);
```

```c


    {SMP_PROCESS_PAIRING_COMMITMENT, SMP_SEND_RAND, SMP_STATE_WAIT_NONCE},
  smp_send_cmd(SMP_OPCODE_RAND, p_cb);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/smp/smp_act.cc:348:
void smp_send_rand(tSMP_CB* p_cb, tSMP_INT_DATA* p_data) {
    // hci 中发随机数给对端Pairing Random
  smp_send_cmd(SMP_OPCODE_RAND, p_cb);
```

```c


        cmd = SMP_OPCODE_PAIR_COMMITM;
    smp_sm_event(p_cb, static_cast<tSMP_EVENT>(cmd), &smp_int_data);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/smp/smp_l2c.cc:211:
static void smp_data_received(uint16_t channel, const RawAddress& bd_addr,BT_HDR* p_buf) {
  if (bd_addr == p_cb->pairing_bda) {
// hci 中接到对端的Pairing Random
    {SMP_PROC_RAND, SMP_PROCESS_PEER_NONCE, SMP_STATE_SEC_CONN_PHS2_START},
    smp_sm_event(p_cb, static_cast<tSMP_EVENT>(cmd), &smp_int_data);
```


```c


    {SMP_PROC_RAND, SMP_PROCESS_PEER_NONCE, SMP_STATE_SEC_CONN_PHS2_START},
          smp_sm_event(p_cb, SMP_SC_DSPL_NC_EVT, NULL);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/smp/smp_act.cc:1864:
void smp_process_peer_nonce(tSMP_CB* p_cb, tSMP_INT_DATA* p_data) {
  switch (p_cb->selected_association_model) {
    case SMP_MODEL_SEC_CONN_NUM_COMP:
      if (p_cb->selected_association_model == SMP_MODEL_SEC_CONN_JUSTWORKS) {
        if (!GetInterfaceToProfiles()->config->isAndroidTVDevice() &&(p_cb->local_io_capability == SMP_IO_CAP_IO ||p_cb->local_io_capability == SMP_IO_CAP_KBDISP)) {
            // hci 向上才能显示6位数
          p_cb->cb_evt = SMP_CONSENT_REQ_EVT;
    {SMP_SEND_APP_CBACK, SMP_SM_NO_ACTION, SMP_STATE_WAIT_APP_RSP},
          smp_sm_event(p_cb, SMP_SC_DSPL_NC_EVT, NULL);
```


```c


    {SMP_SEND_APP_CBACK, SMP_SM_NO_ACTION, SMP_STATE_WAIT_APP_RSP},
    callback_rc =(*p_cb->p_callback)(p_cb->cb_evt, p_cb->pairing_bda, &cb_data);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/smp/smp_act.cc:165:
void smp_send_app_cback(tSMP_CB* p_cb, tSMP_INT_DATA* p_data) {
  if (p_cb->p_callback && p_cb->cb_evt != 0) {
      // hci 中处理 SMP_CONSENT_REQ_EVT 上层同意确认的弹框
    callback_rc =(*p_cb->p_callback)(p_cb->cb_evt, p_cb->pairing_bda, &cb_data);
```
```c


 
          (*btm_sec_cb.api.p_le_callback)(static_cast<tBTM_LE_EVT>(event),bd_addr, (tBTM_LE_EVT_DATA*)p_data);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/btm/btm_ble_sec.cc:1664:
tBTM_STATUS btm_proc_smp_cback(tSMP_EVT event, const RawAddress& bd_addr,const tSMP_EVT_DATA* p_data) {
  if (p_dev_rec != NULL) {
    switch (event) {
      case SMP_COMPLT_EVT:
        if (btm_sec_cb.api.p_le_callback) {
          (*btm_sec_cb.api.p_le_callback)(static_cast<tBTM_LE_EVT>(event),bd_addr, (tBTM_LE_EVT_DATA*)p_data);
```

```c


    .p_le_callback = &bta_dm_ble_smp_cback,
      bta_dm_sec_cb.p_sec_cback(BTA_DM_BLE_CONSENT_REQ_EVT, &sec_event);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/dm/bta_dm_sec.cc:775:
static uint8_t bta_dm_ble_smp_cback(tBTM_LE_EVT event, const RawAddress& bda,tBTM_LE_EVT_DATA* p_data) {
  switch (event) {
    case BTM_LE_CONSENT_REQ_EVT:
      bta_dm_sec_cb.p_sec_cback(BTA_DM_BLE_CONSENT_REQ_EVT, &sec_event);
```

```c


  bta_dm_enable(btif_dm_sec_evt, btif_dm_acl_evt);
      btif_dm_ble_sec_req_evt(&p_data->ble_req, true);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/btif/src/btif_dm.cc:3223:
void btif_dm_sec_evt(tBTA_DM_SEC_EVT event, tBTA_DM_SEC* p_data) {
  switch (event) {
    case BTA_DM_BLE_CONSENT_REQ_EVT:
      btif_dm_ble_sec_req_evt(&p_data->ble_req, true);
```


```c


      btif_dm_ble_sec_req_evt(&p_data->ble_req, true);
  GetInterfaceToProfiles()->events->invoke_ssp_request_cb(bd_addr, bd_name, cod, BT_SSP_VARIANT_CONSENT, 0);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/btif/src/btif_dm.cc:4777:
static void btif_dm_ble_sec_req_evt(tBTA_DM_BLE_SEC_REQ* p_ble_req,bool is_consent) {
    // hci 当前代码直接同意了
    btif_dm_ssp_reply(bd_addr, BT_SSP_VARIANT_CONSENT, true);
    // hci 中本来通过这个向上面去弹框确认
  GetInterfaceToProfiles()->events->invoke_ssp_request_cb(bd_addr, bd_name, cod, BT_SSP_VARIANT_CONSENT, 0);
```

```c


    btif_dm_ssp_reply(bd_addr, BT_SSP_VARIANT_CONSENT, true);
      if (accept)BTA_DmBleSecurityGrant(bd_addr, BTA_DM_SEC_GRANTED);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/btif/src/btif_dm.cc:3823:
void btif_dm_ssp_reply(const RawAddress bd_addr, bt_ssp_variant_t variant,uint8_t accept) {
  if (pairing_cb.is_le_only) {
    if (pairing_cb.is_le_nc) {
    } else {
        // hci 中这个函数，不管弹框是同意还是拒绝都调用
      if (accept)BTA_DmBleSecurityGrant(bd_addr, BTA_DM_SEC_GRANTED);
```
```c


                      base::BindOnce(BTM_SecurityGrant, bd_addr, res));
  SMP_SecurityGrant(bd_addr, res_smp);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/btm/btm_ble_sec.cc:260:
void BTM_SecurityGrant(const RawAddress& bd_addr, uint8_t res) {
  SMP_SecurityGrant(bd_addr, res_smp);
```
```c


 
        smp_sm_event(&smp_cb, SMP_SC_NC_OK_EVT, NULL);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/smp/smp_api.cc:211:
void SMP_SecurityGrant(const RawAddress& bd_addr, tSMP_STATUS res) {
  if (smp_cb.cb_evt == SMP_CONSENT_REQ_EVT) {
    if (smp_cb.selected_association_model == SMP_MODEL_SEC_CONN_JUSTWORKS) {
      if (res == SMP_SUCCESS) {
         {SMP_MOVE_TO_SEC_CONN_PHASE2, SMP_SM_NO_ACTION,
         SMP_STATE_SEC_CONN_PHS2_START},
        smp_sm_event(&smp_cb, SMP_SC_NC_OK_EVT, NULL);
```

```c


    smp_move_to_secure_connections_phase2,
  smp_sm_event(p_cb, SMP_SC_PHASE1_CMPLT_EVT, NULL);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/smp/smp_act.cc:1956:
void smp_move_to_secure_connections_phase2(tSMP_CB* p_cb,tSMP_INT_DATA* p_data) {
    //hci 中 smp 中交换完随机数的第一阶段配对特征交换完完毕选择了安全配对，交换了公共key 和随机值，后续进入第二阶段计算 LTK DHkey 生成和核对
         {SMP_CALCULATE_LOCAL_DHKEY_CHECK, SMP_SEND_DHKEY_CHECK,
         SMP_STATE_WAIT_DHK_CHECK},
  smp_sm_event(p_cb, SMP_SC_PHASE1_CMPLT_EVT, NULL);
```

```c


         {SMP_CALCULATE_LOCAL_DHKEY_CHECK, SMP_SEND_DHKEY_CHECK,
  p_cb->dhkey_check = crypto_toolbox::f6(p_cb->mac_key, p_cb->rand, p_cb->rrand,p_cb->peer_random, iocap, a, b);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/smp/smp_keys.cc:920:
void smp_calculate_local_dhkey_check(tSMP_CB* p_cb, tSMP_INT_DATA* p_data) {
    // hci 中smp 比较重要函数计算mackey和LTK
  smp_calculate_f5_mackey_and_long_term_key(p_cb);
  //hci 中计算DHcheck
  p_cb->dhkey_check = crypto_toolbox::f6(p_cb->mac_key, p_cb->rand, p_cb->rrand,p_cb->peer_random, iocap, a, b);
```


```c


  smp_calculate_f5_mackey_and_long_term_key(p_cb);
  crypto_toolbox::f5(p_cb->dhkey, na, nb, a, b, &p_cb->mac_key, &p_cb->ltk);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/smp/smp_utils.cc:1621:
void smp_calculate_f5_mackey_and_long_term_key(tSMP_CB* p_cb) {
  crypto_toolbox::f5(p_cb->dhkey, na, nb, a, b, &p_cb->mac_key, &p_cb->ltk);
```

```c


         {SMP_CALCULATE_LOCAL_DHKEY_CHECK, SMP_SEND_DHKEY_CHECK,
  smp_send_cmd(SMP_OPCODE_PAIR_DHKEY_CHECK, p_cb);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/smp/smp_act.cc:375:
void smp_send_dhkey_check(tSMP_CB* p_cb, tSMP_INT_DATA* p_data) {
    // hci 中给对端发送 SMP_OPCODE_PAIR_DHKEY_CHECK
  smp_send_cmd(SMP_OPCODE_PAIR_DHKEY_CHECK, p_cb);
```


```c


  if (SMP_OPCODE_PAIRING_REQ == cmd || SMP_OPCODE_SEC_REQ == cmd) {
    smp_sm_event(p_cb, static_cast<tSMP_EVENT>(cmd), &smp_int_data);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/smp/smp_l2c.cc:211:
static void smp_data_received(uint16_t channel, const RawAddress& bd_addr,BT_HDR* p_buf) {
  if (bd_addr == p_cb->pairing_bda) {
     // hci 中接到对端的 SMP_OPCODE_PAIR_DHKEY_CHECK
   {SMP_PROCESS_DHKEY_CHECK, SMP_CALCULATE_PEER_DHKEY_CHECK,
     SMP_STATE_DHK_CHECK}, 
    smp_sm_event(p_cb, SMP_OPCODE_PAIR_DHKEY_CHECK , &smp_int_data);
``` 


```c


     {SMP_PROCESS_DHKEY_CHECK, SMP_CALCULATE_PEER_DHKEY_CHECK,
  smp_sm_event(p_cb, SMP_SC_KEY_READY_EVT, &smp_int_data);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/smp/smp_keys.cc:949:
void smp_calculate_peer_dhkey_check(tSMP_CB* p_cb, tSMP_INT_DATA* p_data) {
    {SMP_MATCH_DHKEY_CHECKS, SMP_SM_NO_ACTION, SMP_STATE_DHK_CHECK},
  smp_sm_event(p_cb, SMP_SC_KEY_READY_EVT, &smp_int_data);
```
```c


    {SMP_MATCH_DHKEY_CHECKS, SMP_SM_NO_ACTION, SMP_STATE_DHK_CHECK},
    smp_sm_event(p_cb, SMP_ENC_REQ_EVT, NULL);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/smp/smp_act.cc:1942:
void smp_match_dhkey_checks(tSMP_CB* p_cb, tSMP_INT_DATA* p_data) {
  if (p_cb->role == HCI_ROLE_PERIPHERAL) {
  } else {
      // hci 中 这里进入第三个阶段，key 的分发,这里开始把连接加密
    {SMP_GENERATE_STK, SMP_SM_NO_ACTION, SMP_STATE_ENCRYPTION_PENDING},
    smp_sm_event(p_cb, SMP_ENC_REQ_EVT, NULL);
```

```c


    {SMP_GENERATE_STK, SMP_SM_NO_ACTION, SMP_STATE_ENCRYPTION_PENDING},
  smp_process_stk(p_cb, &output);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/smp/smp_keys.cc:174:
void smp_generate_stk(tSMP_CB* p_cb, UNUSED_ATTR tSMP_INT_DATA* p_data) {
    output = p_cb->ltk;
    // hci 中，le 安全连接使用ltk 代替stk 加密
  smp_process_stk(p_cb, &output);
```

```c


  smp_mask_enc_key(p_cb->loc_enc_size, p);
  smp_sm_event(p_cb, SMP_KEY_READY_EVT, &smp_int_data);

/opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/smp/smp_keys.cc:475:
static void smp_process_stk(tSMP_CB* p_cb, Octet16* p) {
    {SMP_START_ENC, SMP_SM_NO_ACTION, SMP_STATE_ENCRYPTION_PENDING},
   smp_sm_event(p_cb, SMP_KEY_READY_EVT, &smp_int_data);
 ```
 
 ```c
 
 
     cmd = btm_ble_start_encrypt(p_cb->pairing_bda, false, NULL);
     btsnd_hcic_ble_start_enc(p_rec->ble_hci_handle, p_rec->sec_rec.ble_keys.rand,p_rec->sec_rec.ble_keys.ediv, p_rec->sec_rec.ble_keys.pltk);
 
 /opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/btm/btm_ble_sec.cc:1291:
 tBTM_STATUS btm_ble_start_encrypt(const RawAddress& bda, bool use_stk,Octet16* p_stk) {
   if (use_stk) {
   } else if (p_rec->sec_rec.ble_keys.key_type & BTM_LE_KEY_PENC) {
       // hci 中HCI_LE_Enable_Encryption
     btsnd_hcic_ble_start_enc(p_rec->ble_hci_handle, p_rec->sec_rec.ble_keys.rand,p_rec->sec_rec.ble_keys.ediv, p_rec->sec_rec.ble_keys.pltk);
 ```
 
 
 ```c
 
 
     case HCI_ENCRYPTION_CHANGE_V2_EVT:
       btu_hcif_encryption_change_evt_v2(p);
 
 /opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/btu/btu_hcif.cc:263:
 void btu_hcif_process_event(UNUSED_ATTR uint8_t controller_id,const BT_HDR* p_msg) {
   switch (hci_evt_code) {
     case HCI_ENCRYPTION_CHANGE_V2_EVT:
     // hci 中HCI_Encryption_Change [v2]  到这里链接都是加密了的
       btu_hcif_encryption_change_evt_v2(p);
 ```
 
 ```c
 
 
     btm_sec_encrypt_change(handle, static_cast<tHCI_STATUS>(status),
     btm_ble_link_encrypted(p_dev_rec->ble.pseudo_addr, encr_enable);
 
 /opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/btm/btm_sec.cc:3596:
 void btm_sec_encrypt_change(uint16_t handle, tHCI_STATUS status,uint8_t encr_enable) {
   if (transport == BT_TRANSPORT_LE) {
     btm_ble_link_encrypted(p_dev_rec->ble.pseudo_addr, encr_enable);
 ```
 
 ```c
 
 
     btm_ble_link_encrypted(p_dev_rec->ble.pseudo_addr, encr_enable);
   smp_link_encrypted(bd_addr, encr_enable);
 
 /opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/btm/btm_ble_sec.cc:1364:
 void btm_ble_link_encrypted(const RawAddress& bd_addr, uint8_t encr_enable) {
   smp_link_encrypted(bd_addr, encr_enable);
 ```
 
 ```c
 
 
   smp_link_encrypted(bd_addr, encr_enable);
     smp_sm_event(&smp_cb, SMP_ENCRYPTED_EVT, &smp_int_data);
 
 /opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/smp/smp_act.cc:2148:
 void smp_link_encrypted(const RawAddress& bda, uint8_t encr_enable) {
   if (smp_cb.pairing_bda == bda) {
     {SMP_CHECK_AUTH_REQ, SMP_SM_NO_ACTION, SMP_STATE_ENCRYPTION_PENDING},
     smp_sm_event(&smp_cb, SMP_ENCRYPTED_EVT, &smp_int_data);
 ```
 
 ```c
 
 
     {SMP_CHECK_AUTH_REQ, SMP_SM_NO_ACTION, SMP_STATE_ENCRYPTION_PENDING},
       smp_sm_event(p_cb, SMP_BOND_REQ_EVT, NULL);
 
 /opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/smp/smp_act.cc:1338:
 void smp_check_auth_req(tSMP_CB* p_cb, tSMP_INT_DATA* p_data) {
   if (enc_enable == 1) {
     if ((p_cb->local_i_key || p_cb->local_r_key)) {
         // hci 中在这里这个函数啥都不会做，因为这两个值都不为0
     {SMP_KEY_DISTRIBUTE, SMP_SM_NO_ACTION, SMP_STATE_BOND_PENDING}};
       smp_sm_event(p_cb, SMP_BOND_REQ_EVT, NULL);
 ```
 
 ```c
 
 
   if (SMP_OPCODE_PAIRING_REQ == cmd || SMP_OPCODE_SEC_REQ == cmd) {
     smp_sm_event(p_cb, static_cast<tSMP_EVENT>(cmd), &smp_int_data);
 
 /opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/smp/smp_l2c.cc:211:
 static void smp_data_received(uint16_t channel, const RawAddress& bd_addr,BT_HDR* p_buf) {
   if (bd_addr == p_cb->pairing_bda) {
      // hci 中接到对端的 SMP_OPCODE_IDENTITY_INFO 
    
     {SMP_PROC_ID_INFO, SMP_SM_NO_ACTION, SMP_STATE_BOND_PENDING},
     smp_sm_event(p_cb, SMP_OPCODE_IDENTITY_INFO  , &smp_int_data);
 ``` 
 
 ```c
 
 
     smp_key_distribution(p_cb, NULL);
   smp_key_distribution_by_transport(p_cb, NULL);
 
 /opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/smp/smp_act.cc:1084:
 void smp_proc_id_info(tSMP_CB* p_cb, tSMP_INT_DATA* p_data) {
     // hci 中 这里也什么都不会做
   smp_key_distribution_by_transport(p_cb, NULL);
 ```
 ```c
 
 
   if (SMP_OPCODE_PAIRING_REQ == cmd || SMP_OPCODE_SEC_REQ == cmd) {
     smp_sm_event(p_cb, static_cast<tSMP_EVENT>(cmd), &smp_int_data);
 
 /opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/smp/smp_l2c.cc:211:
 static void smp_data_received(uint16_t channel, const RawAddress& bd_addr,BT_HDR* p_buf) {
   if (bd_addr == p_cb->pairing_bda) {
      // hci 中接到对端的 SMP_OPCODE_ID_ADDR  
     {SMP_PROC_ID_ADDR, SMP_SM_NO_ACTION, SMP_STATE_BOND_PENDING},
     smp_sm_event(p_cb, SMP_OPCODE_ID_ADDR, &smp_int_data);
 ```
 ```c
 
 
     {SMP_PROC_ID_ADDR, SMP_SM_NO_ACTION, SMP_STATE_BOND_PENDING},
   smp_key_distribution_by_transport(p_cb, NULL);
 
 /opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/smp/smp_act.cc:1122:
 void smp_proc_id_addr(tSMP_CB* p_cb, tSMP_INT_DATA* p_data) {
  p_cb->cb_evt = SMP_LE_ADDR_ASSOC_EVT;
     // hci 在这里才会去派生出 linkkey 然后通知上层配对完了
   smp_key_distribution_by_transport(p_cb, NULL);
 ```
 
 
 
 ```c
 
 
     smp_key_distribution,
           smp_derive_link_key_from_long_term_key(p_cb, NULL);
 
 /opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/smp/smp_act.cc:1404:
 void smp_key_distribution(tSMP_CB* p_cb, tSMP_INT_DATA* p_data) {
     //hci 中这个函数会调用很多次直到把 ltk id info crsk link key 的函数都调用一遍 指导i_key 为0
     // hci 中 调用smp_send_id_info时会给对端发送Identity Information 和Identity Address Information
     smp_key_pick_key(p_cb, p_data);
   if (!p_cb->local_i_key && !p_cb->local_r_key) {
     if (smp_get_state() == SMP_STATE_BOND_PENDING) {
       if (p_cb->derive_lk) {
         if (!(p_dev_rec->sec_rec.sec_flags & BTM_SEC_LE_LINK_KEY_AUTHED) &&(p_dev_rec->sec_rec.sec_flags & BTM_SEC_LINK_KEY_AUTHED)) {
         } else {
             // hci 中ltk 派生出link key 
           smp_derive_link_key_from_long_term_key(p_cb, NULL);
            log::verbose("delaying auth complete");
            //hci 中 在这里定时器函数smp 身份认证结束
           alarm_set_on_mloop(p_cb->delayed_auth_timer_ent,SMP_DELAYED_AUTH_TIMEOUT_MS, smp_delayed_auth_complete_timeout, NULL); 
 ```
 
 
 ```c
 
 
     smp_generate_ltk,       /* SMP_SEC_KEY_TYPE_ENC - '1' bit index */
       (*smp_distribute_act[i])(p_cb, p_data);
 
 /opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/smp/smp_act.cc:1374:
 void smp_key_pick_key(tSMP_CB* p_cb, tSMP_INT_DATA* p_data) {
     // hci 中这个函数比较重要，在这里会从link key 中派生出ltk ，或者生成ltk
     smp_key_pick_key(p_cb, p_data);
   while (i < SMP_KEY_DIST_TYPE_MAX) {
     if (key_to_dist & (1 << i)) {
       (*smp_distribute_act[i])(p_cb, p_data);
 ```
 
 
 ```c
 
 
  
     smp_process_secure_connection_long_term_key();
 
 /opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/smp/smp_keys.cc:557:
 void smp_generate_ltk(tSMP_CB* p_cb, UNUSED_ATTR tSMP_INT_DATA* p_data) {
   if (smp_get_br_state() == SMP_BR_STATE_BOND_PENDING) {
   } else if (p_cb->sc_mode_required_by_peer) {
       // hci 中LTK 生成,有三种，le 安全配对 ltk 在之前就生成了，只有br 的ltk 派生和 le 安全连接由 stk 生成ltk 在这里生成
     smp_process_secure_connection_long_term_key();
 ```
 
 ```c
 
 
  
   if (!smp_calculate_link_key_from_long_term_key(p_cb)) {
 
 /opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/smp/smp_act.cc:2246:
 void smp_derive_link_key_from_long_term_key(tSMP_CB* p_cb,tSMP_INT_DATA* p_data) {
   if (!smp_calculate_link_key_from_long_term_key(p_cb)) {
 ```
 
 ```c
 
 
  
   btm_sec_link_key_notification(bda_for_lk, notif_link_key, link_key_type);
 
 /opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/smp/smp_keys.cc:1017:
 bool smp_calculate_link_key_from_long_term_key(tSMP_CB* p_cb) {
     // hci 中使用密码箱生成link key 
    Octet16 link_key = crypto_toolbox::ltk_to_link_key(p_cb->ltk, p_cb->key_derivation_h7_used); 
    // hci 中 通知link key  后续通知配对完成
   btm_sec_link_key_notification(bda_for_lk, notif_link_key, link_key_type);
 ```
 
 ```c
 
 
     .p_link_key_callback = &bta_dm_new_link_key_cback,
       (*btm_sec_cb.api.p_link_key_callback)(p_bda, p_dev_rec->dev_class, p_dev_rec->sec_bd_name, link_key,p_dev_rec->sec_rec.link_key_type, true );
 
 /opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/btm/btm_sec.cc:4517:
 void btm_sec_link_key_notification(const RawAddress& p_bda,const Octet16& link_key, uint8_t key_type) {
   if (ltk_derived_lk) {
     if (btm_sec_cb.api.p_link_key_callback) {
       (*btm_sec_cb.api.p_link_key_callback)(p_bda, p_dev_rec->dev_class, p_dev_rec->sec_bd_name, link_key,p_dev_rec->sec_rec.link_key_type, true );
 ```
 
 ```c
 
 
  
   if (bta_dm_sec_cb.p_sec_cback) bta_dm_sec_cb.p_sec_cback(event, &sec_event);
 
 /opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/dm/bta_dm_sec.cc:396:
 static uint8_t bta_dm_new_link_key_cback(const RawAddress& bd_addr,UNUSED_ATTR DEV_CLASS dev_class,BD_NAME bd_name, const LinkKey& key,uint8_t key_type, bool is_ctkd) {
   tBTA_DM_SEC_EVT event = BTA_DM_AUTH_CMPL_EVT;
   if (bta_dm_sec_cb.p_sec_cback) bta_dm_sec_cb.p_sec_cback(event, &sec_event);
 ```
 ```c
 
 
   bta_dm_enable(btif_dm_sec_evt, btif_dm_acl_evt);
       btif_dm_auth_cmpl_evt(&p_data->auth_cmpl);
 
 /opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/btif/src/btif_dm.cc:3128:
 void btif_dm_sec_evt(tBTA_DM_SEC_EVT event, tBTA_DM_SEC* p_data) {
   switch (event) {
     case BTA_DM_AUTH_CMPL_EVT:
       btif_dm_auth_cmpl_evt(&p_data->auth_cmpl);
 ```
 
 ```c
 
 
           !(stack_config_get_interface()->get_pts_crosskey_sdp_disable())) {
           btif_dm_get_remote_services(bd_addr, BT_TRANSPORT_BR_EDR);
 
 /opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/btif/src/btif_dm.cc:1797:
 static void btif_dm_auth_cmpl_evt(tBTA_DM_AUTH_CMPL* p_auth_cmpl) {
   if (p_auth_cmpl->success) {
     {
     } else {
       if (!is_crosskey ||!(stack_config_get_interface()->get_pts_crosskey_sdp_disable())) {
         if (pairing_cb.sdp_over_classic ==btif_dm_pairing_cb_t::ServiceDiscoveryState::NOT_STARTED&& !vDpiBonded) {
             // hci 中在这里触发去连br
           btif_dm_get_remote_services(bd_addr, BT_TRANSPORT_BR_EDR);
 ```
 
 ```c
 
 
                              SMP_DELAYED_AUTH_TIMEOUT_MS,
     smp_sm_event(&smp_cb, SMP_AUTH_CMPL_EVT, &smp_int_data);
 
 /opt6/tangxinlouosc/gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/smp/smp_utils.cc:498:
 void smp_delayed_auth_complete_timeout(UNUSED_ATTR void* data) {
   if (smp_get_state() == SMP_STATE_BOND_PENDING) {
       //hci 中10ms定时器
     smp_sm_event(&smp_cb, SMP_AUTH_CMPL_EVT, &smp_int_data);
 ```
