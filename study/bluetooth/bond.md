/*******************************************************
$Author       : 唐新楼 
$Last modified: 2025-04-01 18:04
$Email        : 个人邮箱
$blog         : https://blog.csdn.net/daweigongting
$Filename     : bond.md
$Description  : bond 流程详细版
*******************************************************/
《《《《《《《
第 1 章 从点击cratebond  流程图

      |BluetoothDevice.java       |AdapterService.java     |BondStateMachine.java     |com_android_bluetooth_btservice_AdapterService.cpp     |bluetooth.cc        |btif_dm.cc                     |bta_dm_sec_api.cc     |bta_dm_sec.cc       |btm_sec.cc                                        |l2c_link.cc                                    |l2c_utils.cc                          |btm_acl.cc                            |acl_api.cc     |acl.cc         |acl_manager.cc           |classic_impl.h            |hci_layer.cc              |hci_hal_android_hidl.cc     |      
      |                           |                        |                          |                                                       |                    |                               |                      |                    |                                                  |                                               |                                      |                                      |               |               |                         |                          |                          |                            |      
      |createBondInternal:635     |》》                    |                          |                                                       |                    |                               |                      |                    |                                                  |                                               |                                      |                                      |               |               |                         |                          |                          |                            |      
      |                           |                        |                          |                                                       |                    |                               |                      |                    |                                                  |                                               |                                      |                                      |               |               |                         |                          |                          |                            |      
      |                           |createBond:652          |》》                      |                                                       |                    |                               |                      |                    |                                                  |                                               |                                      |                                      |               |               |                         |                          |                          |                            |      
      |                           |                        |                          |                                                       |                    |                               |                      |                    |                                                  |                                               |                                      |                                      |               |               |                         |                          |                          |                            |      
      |                           |                        |processMessage:665        |V                                                      |                    |                               |                      |                    |                                                  |                                               |                                      |                                      |               |               |                         |                          |                          |                            |      
      |                           |                        |                          |                                                       |                    |                               |                      |                    |                                                  |                                               |                                      |                                      |               |               |                         |                          |                          |                            |      
      |                           |                        |createBond:680            |V                                                      |                    |                               |                      |                    |                                                  |                                               |                                      |                                      |               |               |                         |                          |                          |                            |      
      |                           |                        |                          |                                                       |                    |                               |                      |                    |                                                  |                                               |                                      |                                      |               |               |                         |                          |                          |                            |      
      |                           |                        |createBond:696            |》》                                                   |                    |                               |                      |                    |                                                  |                                               |                                      |                                      |               |               |                         |                          |                          |                            |      
      |                           |                        |                          |                                                       |                    |                               |                      |                    |                                                  |                                               |                                      |                                      |               |               |                         |                          |                          |                            |      
      |                           |                        |                          |static jboolean createBondNative:711                   |》》                |                               |                      |                    |                                                  |                                               |                                      |                                      |               |               |                         |                          |                          |                            |      
      |                           |                        |                          |                                                       |                    |                               |                      |                    |                                                  |                                               |                                      |                                      |               |               |                         |                          |                          |                            |      
      |                           |                        |                          |                                                       |create_bond:724     |》》                           |                      |                    |                                                  |                                               |                                      |                                      |               |               |                         |                          |                          |                            |      
      |                           |                        |                          |                                                       |                    |                               |                      |                    |                                                  |                                               |                                      |                                      |               |               |                         |                          |                          |                            |      
      |                           |                        |                          |                                                       |                    |btif_dm_create_bond:736        |V                     |                    |                                                  |                                               |                                      |                                      |               |               |                         |                          |                          |                            |      
      |                           |                        |                          |                                                       |                    |                               |                      |                    |                                                  |                                               |                                      |                                      |               |               |                         |                          |                          |                            |      
      |                           |                        |                          |                                                       |                    |btif_dm_cb_create_bond:747     |》》                  |                    |                                                  |                                               |                                      |                                      |               |               |                         |                          |                          |                            |      
      |                           |                        |                          |                                                       |                    |                               |                      |                    |                                                  |                                               |                                      |                                      |               |               |                         |                          |                          |                            |      
      |                           |                        |                          |                                                       |                    |                               |BTA_DmBond:764        |》》                |                                                  |                                               |                                      |                                      |               |               |                         |                          |                          |                            |      
      |                           |                        |                          |                                                       |                    |                               |                      |                    |                                                  |                                               |                                      |                                      |               |               |                         |                          |                          |                            |      
      |                           |                        |                          |                                                       |                    |                               |                      |bta_dm_bond:777     |》》                                              |                                               |                                      |                                      |               |               |                         |                          |                          |                            |      
      |                           |                        |                          |                                                       |                    |                               |                      |                    |                                                  |                                               |                                      |                                      |               |               |                         |                          |                          |                            |      
      |                           |                        |                          |                                                       |                    |                               |                      |                    |tBTM_STATUS BTM_SecBond:788                       |V                                              |                                      |                                      |               |               |                         |                          |                          |                            |      
      |                           |                        |                          |                                                       |                    |                               |                      |                    |                                                  |                                               |                                      |                                      |               |               |                         |                          |                          |                            |      
      |                           |                        |                          |                                                       |                    |                               |                      |                    |tBTM_STATUS btm_sec_bond_by_transport:801         |V                                              |                                      |                                      |               |               |                         |                          |                          |                            |      
      |                           |                        |                          |                                                       |                    |                               |                      |                    |                                                  |                                               |                                      |                                      |               |               |                         |                          |                          |                            |      
      |                           |                        |                          |                                                       |                    |                               |                      |                    |static tBTM_STATUS btm_sec_dd_create_conn:820     |》》                                           |                                      |                                      |               |               |                         |                          |                          |                            |      
      |                           |                        |                          |                                                       |                    |                               |                      |                    |                                                  |                                               |                                      |                                      |               |               |                         |                          |                          |                            |      
      |                           |                        |                          |                                                       |                    |                               |                      |                    |                                                  |tBTM_STATUS l2cu_ConnectAclForSecurity:833     |》》                                  |                                      |               |               |                         |                          |                          |                            |      
      |                           |                        |                          |                                                       |                    |                               |                      |                    |                                                  |                                               |                                      |                                      |               |               |                         |                          |                          |                            |      
      |                           |                        |                          |                                                       |                    |                               |                      |                    |                                                  |                                               |l2cu_create_conn_br_edr:845           |V                                     |               |               |                         |                          |                          |                            |      
      |                           |                        |                          |                                                       |                    |                               |                      |                    |                                                  |                                               |                                      |                                      |               |               |                         |                          |                          |                            |      
      |                           |                        |                          |                                                       |                    |                               |                      |                    |                                                  |                                               |l2cu_create_conn_after_switch:857     |》》                                  |               |               |                         |                          |                          |                            |      
      |                           |                        |                          |                                                       |                    |                               |                      |                    |                                                  |                                               |                                      |                                      |               |               |                         |                          |                          |                            |      
      |                           |                        |                          |                                                       |                    |                               |                      |                    |                                                  |                                               |                                      |acl_create_classic_connection:868     |》》           |               |                         |                          |                          |                            |      
      |                           |                        |                          |                                                       |                    |                               |                      |                    |                                                  |                                               |                                      |                                      |               |               |                         |                          |                          |                            |      
      |                           |                        |                          |                                                       |                    |                               |                      |                    |                                                  |                                               |                                      |                                      |shim:879       |》》           |                         |                          |                          |                            |      
      |                           |                        |                          |                                                       |                    |                               |                      |                    |                                                  |                                               |                                      |                                      |               |               |                         |                          |                          |                            |      
      |                           |                        |                          |                                                       |                    |                               |                      |                    |                                                  |                                               |                                      |                                      |               |legacy:890     |》》                     |                          |                          |                            |      
      |                           |                        |                          |                                                       |                    |                               |                      |                    |                                                  |                                               |                                      |                                      |               |               |                         |                          |                          |                            |      
      |                           |                        |                          |                                                       |                    |                               |                      |                    |                                                  |                                               |                                      |                                      |               |               |CreateConnection:901     |》》                      |                          |                            |      
      |                           |                        |                          |                                                       |                    |                               |                      |                    |                                                  |                                               |                                      |                                      |               |               |                         |                          |                          |                            |      
      |                           |                        |                          |                                                       |                    |                               |                      |                    |                                                  |                                               |                                      |                                      |               |               |                         |create_connection:914     |》》                      |                            |      
      |                           |                        |                          |                                                       |                    |                               |                      |                    |                                                  |                                               |                                      |                                      |               |               |                         |                          |                          |                            |      
      |                           |                        |                          |                                                       |                    |                               |                      |                    |                                                  |                                               |                                      |                                      |               |               |                         |                          |send_next_command:929     |》》                        |      
      |                           |                        |                          |                                                       |                    |                               |                      |                    |                                                  |                                               |                                      |                                      |               |               |                         |                          |                          |                            |      
      |                           |                        |                          |                                                       |                    |                               |                      |                    |                                                  |                                               |                                      |                                      |               |               |                         |                          |                          |HciHalHidl:944              |      
 
第 11 章 avrcpacp  流程图

      |l2c_main.cc                |avct_l2c.cc                         |l2c_csm.cc                           |l2c_utils.cc                       |avct_lcb_act.cc            |avrc_api.cc              |connection_handler.cc      |avrcp_service.cc            |      
      |                           |                                    |                                     |                                   |                           |                         |                           |                            |      
      |process_l2cap_cmd:4042     |》》                                |                                     |                                   |                           |                         |                           |                            |      
      |                           |                                    |                                     |                                   |                           |                         |                           |                            |      
      |                           |avct_l2c_connect_ind_cback:4061     |》》                                 |                                   |                           |                         |                           |                            |      
      |                           |                                    |                                     |                                   |                           |                         |                           |                            |      
      |                           |《《                                |l2c_csm_w4_l2ca_connect_rsp:4073     |                                   |                           |                         |                           |                            |      
      |                           |                                    |                                     |                                   |                           |                         |                           |                            |      
      |process_l2cap_cmd:4095     |》》                                |                                     |                                   |                           |                         |                           |                            |      
      |                           |                                    |                                     |                                   |                           |                         |                           |                            |      
      |                           |                                    |l2c_csm_config:4112                  |V                                  |                           |                         |                           |                            |      
      |                           |                                    |                                     |                                   |                           |                         |                           |                            |      
      |                           |                                    |l2c_csm_send_config_rsp_ok:4128      |V                                  |                           |                         |                           |                            |      
      |                           |                                    |                                     |                                   |                           |                         |                           |                            |      
      |                           |                                    |l2c_csm_config:4140                  |》》                               |                           |                         |                           |                            |      
      |                           |                                    |                                     |                                   |                           |                         |                           |                            |      
      |                           |                                    |《《                                 |l2cu_send_peer_config_rsp:4161     |                           |                         |                           |                            |      
      |                           |                                    |                                     |                                   |                           |                         |                           |                            |      
      |process_l2cap_cmd:4175     |》》                                |                                     |                                   |                           |                         |                           |                            |      
      |                           |                                    |                                     |                                   |                           |                         |                           |                            |      
      |                           |《《                                |l2c_csm_config:4193                  |                                   |                           |                         |                           |                            |      
      |                           |                                    |                                     |                                   |                           |                         |                           |                            |      
      |                           |avct_l2c_config_cfm_cback:4209      |》》                                 |                                   |                           |                         |                           |                            |      
      |                           |                                    |                                     |                                   |                           |                         |                           |                            |      
      |                           |                                    |                                     |                                   |avct_lcb_open_ind:4224     |》》                     |                           |                            |      
      |                           |                                    |                                     |                                   |                           |                         |                           |                            |      
      |                           |                                    |                                     |                                   |                           |avrc_ctrl_cback:4239     |》》                       |                            |      
      |                           |                                    |                                     |                                   |                           |                         |                           |                            |      
      |                           |                                    |                                     |                                   |                           |                         |AcceptorControlCb:4253     |》》                        |      
      |                           |                                    |                                     |                                   |                           |                         |                           |                            |      
      |                           |                                    |                                     |                                   |                           |                         |《《                       |DeviceCallback:4270         |      
      |                           |                                    |                                     |                                   |                           |                         |                           |                            |      
      |                           |                                    |                                     |                                   |                           |                         |AvrcpConnect:4283          |》》                        |      
      |                           |                                    |                                     |                                   |                           |                         |                           |                            |      
      |                           |                                    |                                     |                                   |                           |                         |《《                       |AvrcpInterfaceImpl:4296     |      
      |                           |                                    |                                     |                                   |                           |                         |                           |                            |      
      |                           |                                    |                                     |                                   |                           |AVRC_Open:4308           |                           |                            |      
 
第 12 章 avrcpprofile  流程图

      |avct_l2c.cc                      |avct_lcb_act.cc            |avrc_api.cc                                                              |connection_handler.cc      |device.cc                                   |device.h              |avct_api.cc          |com_android_bluetooth_avrcp_target.cpp     |      
      |                                 |                           |                                                                         |                           |                                            |                      |                     |                                           |      
      |avct_l2c_data_ind_cback:4322     |》》                       |                                                                         |                           |                                            |                      |                     |                                           |      
      |                                 |                           |                                                                         |                           |                                            |                      |                     |                                           |      
      |                                 |avct_lcb_msg_ind:4335      |》》                                                                     |                           |                                            |                      |                     |                                           |      
      |                                 |                           |                                                                         |                           |                                            |                      |                     |                                           |      
      |                                 |                           |system/stack/avrc/avrc_api.cc:718: █ static void avrc_msg_cback:4345     |V                          |                                            |                      |                     |                                           |      
      |                                 |                           |                                                                         |                           |                                            |                      |                     |                                           |      
      |                                 |                           |avrc_proc_far_msg:4364                                                   |V                          |                                            |                      |                     |                                           |      
      |                                 |                           |                                                                         |                           |                                            |                      |                     |                                           |      
      |                                 |                           |avrc_msg_cback:4376                                                      |》》                       |                                            |                      |                     |                                           |      
      |                                 |                           |                                                                         |                           |                                            |                      |                     |                                           |      
      |                                 |                           |                                                                         |MessageCb:4388             |》》                                        |                      |                     |                                           |      
      |                                 |                           |                                                                         |                           |                                            |                      |                     |                                           |      
      |                                 |                           |                                                                         |                           |MessageReceived:4403                        |V                     |                     |                                           |      
      |                                 |                           |                                                                         |                           |                                            |                      |                     |                                           |      
      |                                 |                           |                                                                         |                           |VendorPacketHandler:4417                    |V                     |                     |                                           |      
      |                                 |                           |                                                                         |                           |                                            |                      |                     |                                           |      
      |                                 |                           |                                                                         |                           |HandleGetCapabilities:4431                  |》》                  |                     |                                           |      
      |                                 |                           |                                                                         |                           |                                            |                      |                     |                                           |      
      |                                 |                           |                                                                         |                           |《《                                        |send_message:4448     |                     |                                           |      
      |                                 |                           |                                                                         |                           |                                            |                      |                     |                                           |      
      |                                 |                           |《《                                                                     |SendMessage:4459           |                                            |                      |                     |                                           |      
      |                                 |                           |                                                                         |                           |                                            |                      |                     |                                           |      
      |                                 |                           |AVRC_MsgReq:4470                                                         |》》                       |                                            |                      |                     |                                           |      
      |                                 |                           |                                                                         |                           |                                            |                      |                     |                                           |      
      |                                 |                           |                                                                         |                           |                                            |《《                  |AVCT_MsgReq:4481     |                                           |      
      |                                 |                           |                                                                         |                           |                                            |                      |                     |                                           |      
      |                                 |avct_lcb_send_msg:4495     |》》                                                                     |                           |                                            |                      |                     |                                           |      
      |                                 |                           |                                                                         |                           |                                            |                      |                     |                                           |      
      |                                 |                           |                                                                         |                           |VendorPacketHandler:4509                    |V                     |                     |                                           |      
      |                                 |                           |                                                                         |                           |                                            |                      |                     |                                           |      
      |                                 |                           |                                                                         |                           |HandleNotification:4523                     |V                     |                     |                                           |      
      |                                 |                           |                                                                         |                           |                                            |                      |                     |                                           |      
      |                                 |                           |                                                                         |《《                       |PlaybackStatusNotificationResponse:4538     |                      |                     |                                           |      
      |                                 |                           |                                                                         |                           |                                            |                      |                     |                                           |      
      |                                 |                           |                                                                         |AcceptorControlCb:4557     |》》                                        |                      |                     |                                           |      
      |                                 |                           |                                                                         |                           |                                            |                      |                     |                                           |      
      |                                 |                           |                                                                         |                           |RegisterVolumeChanged:4575                  |V                     |                     |                                           |      
      |                                 |                           |                                                                         |                           |                                            |                      |                     |                                           |      
      |                                 |                           |                                                                         |                           |VendorPacketHandler:4587                    |V                     |                     |                                           |      
      |                                 |                           |                                                                         |                           |                                            |                      |                     |                                           |      
      |                                 |                           |                                                                         |                           |HandleVolumeChanged:4603                    |》》                  |                     |                                           |      
      |                                 |                           |                                                                         |                           |                                            |                      |                     |                                           |      
      |                                 |                           |                                                                         |                           |                                            |                      |                     |volumeDeviceConnected:4616                 |      
 
第 2 章 从接到HCI_Connection_Complete  流程图

      |hci_hal_android_hidl.cc      |hci_layer.cc                       |classic_impl.h                          |acl.cc          |btm_acl.cc                                |btm_sec.cc                                     |l2c_link.cc                     |l2c_utils.cc                     |bta_dm_act.cc          |btif_dm.cc               |bluetooth.cc                         |com_android_bluetooth_btservice_AdapterService.cpp     |RemoteDevices.java              |      
      |                             |                                   |                                        |                |                                          |                                               |                                |                                 |                       |                         |                                     |                                                       |                                |      
      |InternalHciCallbacks:962     |》》                               |                                        |                |                                          |                                               |                                |                                 |                       |                         |                                     |                                                       |                                |      
      |                             |                                   |                                        |                |                                          |                                               |                                |                                 |                       |                         |                                     |                                                       |                                |      
      |                             |hal_callbacks : public hal:976     |V                                       |                |                                          |                                               |                                |                                 |                       |                         |                                     |                                                       |                                |      
      |                             |                                   |                                        |                |                                          |                                               |                                |                                 |                       |                         |                                     |                                                       |                                |      
      |                             |on_hci_event:990                   |》》                                    |                |                                          |                                               |                                |                                 |                       |                         |                                     |                                                       |                                |      
      |                             |                                   |                                        |                |                                          |                                               |                                |                                 |                       |                         |                                     |                                                       |                                |      
      |                             |                                   |on_classic_event:1007                   |V               |                                          |                                               |                                |                                 |                       |                         |                                     |                                                       |                                |      
      |                             |                                   |                                        |                |                                          |                                               |                                |                                 |                       |                         |                                     |                                                       |                                |      
      |                             |                                   |on_connection_complete:1022             |V               |                                          |                                               |                                |                                 |                       |                         |                                     |                                                       |                                |      
      |                             |                                   |                                        |                |                                          |                                               |                                |                                 |                       |                         |                                     |                                                       |                                |      
      |                             |                                   |create_and_announce_connection:1034     |》》            |                                          |                                               |                                |                                 |                       |                         |                                     |                                                       |                                |      
      |                             |                                   |                                        |                |                                          |                                               |                                |                                 |                       |                         |                                     |                                                       |                                |      
      |                             |                                   |                                        |legacy:1045     |》》                                      |                                               |                                |                                 |                       |                         |                                     |                                                       |                                |      
      |                             |                                   |                                        |                |                                          |                                               |                                |                                 |                       |                         |                                     |                                                       |                                |      
      |                             |                                   |                                        |                |on_acl_br_edr_connected:1060              |》》                                           |                                |                                 |                       |                         |                                     |                                                       |                                |      
      |                             |                                   |                                        |                |                                          |                                               |                                |                                 |                       |                         |                                     |                                                       |                                |      
      |                             |                                   |                                        |                |                                          |btm_sec_connected:1074                         |V                               |                                 |                       |                         |                                     |                                                       |                                |      
      |                             |                                   |                                        |                |                                          |                                               |                                |                                 |                       |                         |                                     |                                                       |                                |      
      |                             |                                   |                                        |                |                                          |btm_acl_created:1088                           |V                               |                                 |                       |                         |                                     |                                                       |                                |      
      |                             |                                   |                                        |                |                                          |                                               |                                |                                 |                       |                         |                                     |                                                       |                                |      
      |                             |                                   |                                        |                |《《                                      |tBTM_STATUS btm_sec_execute_procedure:1103     |                                |                                 |                       |                         |                                     |                                                       |                                |      
      |                             |                                   |                                        |                |                                          |                                               |                                |                                 |                       |                         |                                     |                                                       |                                |      
      |                             |                                   |                                        |                |tBTM_STATUS BTM_SetLinkSuperTout:1116     |》》                                           |                                |                                 |                       |                         |                                     |                                                       |                                |      
      |                             |                                   |                                        |                |                                          |                                               |                                |                                 |                       |                         |                                     |                                                       |                                |      
      |                             |                                   |                                        |                |                                          |                                               |l2c_link_hci_conn_comp:1129     |》》                             |                       |                         |                                     |                                                       |                                |      
      |                             |                                   |                                        |                |                                          |                                               |                                |                                 |                       |                         |                                     |                                                       |                                |      
      |                             |                                   |                                        |                |                                          |                                               |《《                            |l2cu_send_peer_info_req:1142     |                       |                         |                                     |                                                       |                                |      
      |                             |                                   |                                        |                |                                          |                                               |                                |                                 |                       |                         |                                     |                                                       |                                |      
      |                             |                                   |                                        |                |NotifyAclLinkUp:1156                      |》》                                           |                                |                                 |                       |                         |                                     |                                                       |                                |      
      |                             |                                   |                                        |                |                                          |                                               |                                |                                 |                       |                         |                                     |                                                       |                                |      
      |                             |                                   |                                        |                |                                          |                                               |                                |                                 |BTA_dm_acl_up:1169     |V                        |                                     |                                                       |                                |      
      |                             |                                   |                                        |                |                                          |                                               |                                |                                 |                       |                         |                                     |                                                       |                                |      
      |                             |                                   |                                        |                |                                          |                                               |                                |                                 |bta_dm_acl_up:1180     |》》                     |                                     |                                                       |                                |      
      |                             |                                   |                                        |                |                                          |                                               |                                |                                 |                       |                         |                                     |                                                       |                                |      
      |                             |                                   |                                        |                |                                          |                                               |                                |                                 |                       |btif_dm_acl_evt:1191     |》》                                 |                                                       |                                |      
      |                             |                                   |                                        |                |                                          |                                               |                                |                                 |                       |                         |                                     |                                                       |                                |      
      |                             |                                   |                                        |                |                                          |                                               |                                |                                 |                       |                         |invoke_acl_state_changed_cb:1205     |》》                                                   |                                |      
      |                             |                                   |                                        |                |                                          |                                               |                                |                                 |                       |                         |                                     |                                                       |                                |      
      |                             |                                   |                                        |                |                                          |                                               |                                |                                 |                       |                         |                                     |acl_state_changed_callback:1216                        |》》                            |      
      |                             |                                   |                                        |                |                                          |                                               |                                |                                 |                       |                         |                                     |                                                       |                                |      
      |                             |                                   |                                        |                |                                          |                                               |                                |                                 |                       |                         |                                     |                                                       |aclStateChangeCallback:1228     |      
 
第 3 章 身份认证  流程图

      |btm_sec.cc                                 |hcicmds.cc                       |btu_hcif.cc                     |security_manager_impl.cc     |classic_pairing_handler.cc     |bta_dm_sec.cc                      |btif_dm.cc                     |classic_impl.h                      |classic_acl_connection.cc     |      
      |                                           |                                 |                                |                             |                               |                                   |                               |                                    |                              |      
      |btm_sec_rmt_name_request_complete:1243     |V                                |                                |                             |                               |                                   |                               |                                    |                              |      
      |                                           |                                 |                                |                             |                               |                                   |                               |                                    |                              |      
      |btm_sec_auth_timer_timeout:1255            |》》                             |                                |                             |                               |                                   |                               |                                    |                              |      
      |                                           |                                 |                                |                             |                               |                                   |                               |                                    |                              |      
      |                                           |btsnd_hcic_auth_request:1268     |》》                            |                             |                               |                                   |                               |                                    |                              |      
      |                                           |                                 |                                |                             |                               |                                   |                               |                                    |                              |      
      |                                           |                                 |btu_hcif_send_cmd:1279          |》》                         |                               |                                   |                               |                                    |                              |      
      |                                           |                                 |                                |                             |                               |                                   |                               |                                    |                              |      
      |                                           |                                 |《《                            |OnHciEventReceived:1290      |                               |                                   |                               |                                    |                              |      
      |                                           |                                 |                                |                             |                               |                                   |                               |                                    |                              |      
      |                                           |                                 |btu_hcif_process_event:1304     |》》                         |                               |                                   |                               |                                    |                              |      
      |                                           |                                 |                                |                             |                               |                                   |                               |                                    |                              |      
      |                                           |                                 |                                |《《                         |OnReceive:1321                 |                                   |                               |                                    |                              |      
      |                                           |                                 |                                |                             |                               |                                   |                               |                                    |                              |      
      |                                           |                                 |                                |OnHciEventReceived:1335      |》》                           |                                   |                               |                                    |                              |      
      |                                           |                                 |                                |                             |                               |                                   |                               |                                    |                              |      
      |                                           |                                 |                                |                             |OnReceive:1353                 |V                                  |                               |                                    |                              |      
      |                                           |                                 |                                |                             |                               |                                   |                               |                                    |                              |      
      |                                           |                                 |                                |                             |OnReceive:1367                 |V                                  |                               |                                    |                              |      
      |                                           |                                 |                                |                             |                               |                                   |                               |                                    |                              |      
      |                                           |                                 |                                |                             |OnReceive:1384                 |V                                  |                               |                                    |                              |      
      |                                           |                                 |                                |                             |                               |                                   |                               |                                    |                              |      
      |                                           |                                 |                                |                             |OnReceive:1396                 |》》                               |                               |                                    |                              |      
      |                                           |                                 |                                |                             |                               |                                   |                               |                                    |                              |      
      |                                           |                                 |                                |                             |                               |bta_dm_new_link_key_cback:1408     |》》                           |                                    |                              |      
      |                                           |                                 |                                |                             |                               |                                   |                               |                                    |                              |      
      |                                           |                                 |                                |                             |                               |                                   |btif_dm_auth_cmpl_evt:1420     |》》                                |                              |      
      |                                           |                                 |                                |                             |                               |                                   |                               |                                    |                              |      
      |                                           |                                 |                                |                             |                               |                                   |                               |on_classic_event:1437               |V                             |      
      |                                           |                                 |                                |                             |                               |                                   |                               |                                    |                              |      
      |                                           |                                 |                                |                             |                               |                                   |                               |on_authentication_complete:1452     |》》                          |      
      |                                           |                                 |                                |                             |                               |                                   |                               |                                    |                              |      
      |                                           |                                 |                                |                             |                               |                                   |                               |《《                                |AclConnectionTracker:1463     |      
      |                                           |                                 |                                |                             |                               |                                   |                               |                                    |                              |      
      |btm_sec_auth_complete:1475                 |》》                             |                                |                             |                               |                                   |                               |                                    |                              |      
      |                                           |                                 |                                |                             |                               |                                   |                               |                                    |                              |      
      |                                           |                                 |                                |                             |                               |                                   |btif_dm_auth_cmpl_evt:1491     |                                    |                              |      
 
第 4 章 sdp到建立sdpl2cap连接  流程图

      |btif_dm.cc                           |bta_dm_api.cc           |bta_dm_disc.cc                               |sdp_api.cc                                 |sdp_main.cc                           |l2c_api.cc                |      
      |                                     |                        |                                             |                                           |                                      |                          |      
      |btif_dm_auth_cmpl_evt:1513           |V                       |                                             |                                           |                                      |                          |      
      |                                     |                        |                                             |                                           |                                      |                          |      
      |btif_dm_get_remote_services:1530     |》》                    |                                             |                                           |                                      |                          |      
      |                                     |                        |                                             |                                           |                                      |                          |      
      |                                     |BTA_DmDiscover:1540     |》》                                         |                                           |                                      |                          |      
      |                                     |                        |                                             |                                           |                                      |                          |      
      |                                     |                        |bta_dm_disc_start_service_discovery:1552     |V                                          |                                      |                          |      
      |                                     |                        |                                             |                                           |                                      |                          |      
      |                                     |                        |bta_dm_search_sm_execute:1563                |V                                          |                                      |                          |      
      |                                     |                        |                                             |                                           |                                      |                          |      
      |                                     |                        |bta_dm_discover:1578                         |V                                          |                                      |                          |      
      |                                     |                        |                                             |                                           |                                      |                          |      
      |                                     |                        |bta_dm_discover_device:1589                  |V                                          |                                      |                          |      
      |                                     |                        |                                             |                                           |                                      |                          |      
      |                                     |                        |bta_dm_find_services:1604                    |》》                                       |                                      |                          |      
      |                                     |                        |                                             |                                           |                                      |                          |      
      |                                     |                        |                                             |SDP_ServiceSearchAttributeRequest:1618     |》》                                  |                          |      
      |                                     |                        |                                             |                                           |                                      |                          |      
      |                                     |                        |                                             |                                           |tCONN_CB* sdp_conn_originate:1629     |》》                      |      
      |                                     |                        |                                             |                                           |                                      |                          |      
      |                                     |                        |                                             |                                           |                                      |L2CA_ConnectReq2:1641     |V     
      |                                     |                        |                                             |                                           |                                      |                          |      
      |                                     |                        |                                             |                                           |                                      |L2CA_ConnectReq:1652      |      
 
第 5 章 l2cap  流程图

      |l2c_csm.cc               |btm_sec.cc                                    |l2c_link.cc                            |l2c_utils.cc                        |btm_acl.cc                           |hci_layer.cc            |l2c_main.cc                |:0     |      
      |                         |                                              |                                       |                                    |                                     |                        |                           |       |      
      |l2c_csm_execute:1681     |V                                             |                                       |                                    |                                     |                        |                           |       |      
      |                         |                                              |                                       |                                    |                                     |                        |                           |       |      
      |l2c_csm_closed:1695      |》》                                          |                                       |                                    |                                     |                        |                           |       |      
      |                         |                                              |                                       |                                    |                                     |                        |                           |       |      
      |                         |tBTM_STATUS btm_sec_l2cap_access_req:1713     |》》                                   |                                    |                                     |                        |                           |       |      
      |                         |                                              |                                       |                                    |                                     |                        |                           |       |      
      |                         |《《                                          |l2c_link_sec_comp:1725                 |                                    |                                     |                        |                           |       |      
      |                         |                                              |                                       |                                    |                                     |                        |                           |       |      
      |l2c_csm_execute:1739     |V                                             |                                       |                                    |                                     |                        |                           |       |      
      |                         |                                              |                                       |                                    |                                     |                        |                           |       |      
      |l2c_csm_closed:1752      |》》                                          |                                       |                                    |                                     |                        |                           |       |      
      |                         |                                              |                                       |                                    |                                     |                        |                           |       |      
      |                         |                                              |《《                                   |l2cu_send_peer_connect_req:1769     |                                     |                        |                           |       |      
      |                         |                                              |                                       |                                    |                                     |                        |                           |       |      
      |                         |                                              |l2c_link_check_send_pkts:1782          |V                                   |                                     |                        |                           |       |      
      |                         |                                              |                                       |                                    |                                     |                        |                           |       |      
      |                         |                                              |l2c_link_send_to_lower:1796            |V                                   |                                     |                        |                           |       |      
      |                         |                                              |                                       |                                    |                                     |                        |                           |       |      
      |                         |                                              |l2c_link_send_to_lower_br_edr:1809     |》》                                |                                     |                        |                           |       |      
      |                         |                                              |                                       |                                    |                                     |                        |                           |       |      
      |                         |                                              |                                       |                                    |acl_send_data_packet_br_edr:1820     |》》                    |                           |       |      
      |                         |                                              |                                       |                                    |                                     |                        |                           |       |      
      |                         |                                              |                                       |                                    |《《                                 |event_callback:1827     |                           |       |      
      |                         |                                              |                                       |                                    |                                     |                        |                           |       |      
      |                         |                                              |                                       |                                    |acl_rcv_acl_data:1843                |》》                    |                           |       |      
      |                         |                                              |                                       |                                    |                                     |                        |                           |       |      
      |                         |                                              |                                       |                                    |                                     |                        |l2c_rcv_acl_data:1855      |V      |      
      |                         |                                              |                                       |                                    |                                     |                        |                           |       |      
      |                         |                                              |                                       |                                    |                                     |《《                    |process_l2cap_cmd:1867     |       |      
      |                         |                                              |                                       |                                    |                                     |                        |                           |       |      
      |l2c_csm_execute:1883     |》》                                          |                                       |                                    |                                     |                        |                           |       |      
      |                         |                                              |                                       |                                    |                                     |                        |                           |       |      
      |                         |                                              |                                       |                                    |                                     |                        |                           |       |      
 
第 6 章 service  流程图

      |l2c_csm.cc                                |sdp_main.cc                 |sdp_discovery.cc                         |l2c_api.cc              |l2c_main.cc                |sdp_utils.cc                            |bta_dm_disc.cc                    |btif_dm.cc                           |RemoteDevices.java                     |BondStateMachine.java     |bta_sdp_act.cc                    |:0       |      
      |                                          |                            |                                         |                        |                           |                                        |                                  |                                     |                                       |                          |                                  |         |      
      |l2c_csm_config:1899                       |V                           |                                         |                        |                           |                                        |                                  |                                     |                                       |                          |                                  |         |      
      |                                          |                            |                                         |                        |                           |                                        |                                  |                                     |                                       |                          |                                  |         |      
      |l2c_csm_indicate_connection_open:1917     |》》                        |                                         |                        |                           |                                        |                                  |                                     |                                       |                          |                                  |         |      
      |                                          |                            |                                         |                        |                           |                                        |                                  |                                     |                                       |                          |                                  |         |      
      |                                          |sdp_config_cfm:1929         |》》                                     |                        |                           |                                        |                                  |                                     |                                       |                          |                                  |         |      
      |                                          |                            |                                         |                        |                           |                                        |                                  |                                     |                                       |                          |                                  |         |      
      |                                          |                            |sdp_disc_connected:1943                  |V                       |                           |                                        |                                  |                                     |                                       |                          |                                  |         |      
      |                                          |                            |                                         |                        |                           |                                        |                                  |                                     |                                       |                          |                                  |         |      
      |                                          |                            |process_service_search_attr_rsp:1954     |》》                    |                           |                                        |                                  |                                     |                                       |                          |                                  |         |      
      |                                          |                            |                                         |                        |                           |                                        |                                  |                                     |                                       |                          |                                  |         |      
      |                                          |                            |                                         |L2CA_DataWrite:1967     |》》                       |                                        |                                  |                                     |                                       |                          |                                  |         |      
      |                                          |                            |                                         |                        |                           |                                        |                                  |                                     |                                       |                          |                                  |         |      
      |                                          |                            |                                         |《《                    |l2c_data_write:1978        |                                        |                                  |                                     |                                       |                          |                                  |         |      
      |                                          |                            |                                         |                        |                           |                                        |                                  |                                     |                                       |                          |                                  |         |      
      |l2c_csm_open:1989                         |》》                        |                                         |                        |                           |                                        |                                  |                                     |                                       |                          |                                  |         |      
      |                                          |                            |                                         |                        |                           |                                        |                                  |                                     |                                       |                          |                                  |         |      
      |                                          |                            |                                         |《《                    |l2c_rcv_acl_data:2004      |                                        |                                  |                                     |                                       |                          |                                  |         |      
      |                                          |                            |                                         |                        |                           |                                        |                                  |                                     |                                       |                          |                                  |         |      
      |l2c_csm_open:2018                         |》》                        |                                         |                        |                           |                                        |                                  |                                     |                                       |                          |                                  |         |      
      |                                          |                            |                                         |                        |                           |                                        |                                  |                                     |                                       |                          |                                  |         |      
      |                                          |sdp_data_ind:2033           |》》                                     |                        |                           |                                        |                                  |                                     |                                       |                          |                                  |         |      
      |                                          |                            |                                         |                        |                           |                                        |                                  |                                     |                                       |                          |                                  |         |      
      |                                          |                            |sdp_disc_server_rsp:2047                 |V                       |                           |                                        |                                  |                                     |                                       |                          |                                  |         |      
      |                                          |                            |                                         |                        |                           |                                        |                                  |                                     |                                       |                          |                                  |         |      
      |                                          |                            |process_service_search_attr_rsp:2061     |》》                    |                           |                                        |                                  |                                     |                                       |                          |                                  |         |      
      |                                          |                            |                                         |                        |                           |                                        |                                  |                                     |                                       |                          |                                  |         |      
      |                                          |                            |                                         |                        |《《                       |sdpu_process_pend_ccb_same_cid:2078     |                                  |                                     |                                       |                          |                                  |         |      
      |                                          |                            |                                         |                        |                           |                                        |                                  |                                     |                                       |                          |                                  |         |      
      |                                          |sdp_disconnect:2091         |》》                                     |                        |                           |                                        |                                  |                                     |                                       |                          |                                  |         |      
      |                                          |                            |                                         |                        |                           |                                        |                                  |                                     |                                       |                          |                                  |         |      
      |                                          |                            |                                         |                        |                           |sdpu_callback:2107                      |》》                              |                                     |                                       |                          |                                  |         |      
      |                                          |                            |                                         |                        |                           |                                        |                                  |                                     |                                       |                          |                                  |         |      
      |                                          |                            |                                         |                        |                           |                                        |bta_dm_sdp_callback:2120          |V                                    |                                       |                          |                                  |         |      
      |                                          |                            |                                         |                        |                           |                                        |                                  |                                     |                                       |                          |                                  |         |      
      |                                          |                            |                                         |                        |                           |                                        |bta_dm_search_sm_execute:2131     |V                                    |                                       |                          |                                  |         |      
      |                                          |                            |                                         |                        |                           |                                        |                                  |                                     |                                       |                          |                                  |         |      
      |                                          |                            |                                         |                        |                           |                                        |bta_dm_sdp_result:2146            |V                                    |                                       |                          |                                  |         |      
      |                                          |                            |                                         |                        |                           |                                        |                                  |                                     |                                       |                          |                                  |         |      
      |                                          |                            |                                         |                        |                           |                                        |bta_dm_search_sm_execute:2161     |》》                                 |                                       |                          |                                  |         |      
      |                                          |                            |                                         |                        |                           |                                        |                                  |                                     |                                       |                          |                                  |         |      
      |                                          |                            |                                         |                        |                           |                                        |                                  |btif_dm_search_services_evt:2193     |》》                                   |                          |                                  |         |      
      |                                          |                            |                                         |                        |                           |                                        |                                  |                                     |                                       |                          |                                  |         |      
      |                                          |                            |                                         |                        |                           |                                        |                                  |                                     |devicePropertyChangedCallback:2213     |》》                      |                                  |         |      
      |                                          |                            |                                         |                        |                           |                                        |                                  |                                     |                                       |                          |                                  |         |      
      |                                          |                            |                                         |                        |                           |                                        |                                  |                                     |《《                                   |processMessage:2234       |                                  |         |      
      |                                          |                            |                                         |                        |                           |                                        |                                  |                                     |                                       |                          |                                  |         |      
      |                                          |sdp_disconnect:2267         |》》                                     |                        |                           |                                        |                                  |                                     |                                       |                          |                                  |         |      
      |                                          |                            |                                         |                        |                           |                                        |                                  |                                     |                                       |                          |                                  |         |      
      |                                          |                            |                                         |《《                    |process_l2cap_cmd:2282     |                                        |                                  |                                     |                                       |                          |                                  |         |      
      |                                          |                            |                                         |                        |                           |                                        |                                  |                                     |                                       |                          |                                  |         |      
      |l2c_csm_w4_l2cap_disconnect_rsp:2300      |》》                        |                                         |                        |                           |                                        |                                  |                                     |                                       |                          |                                  |         |      
      |                                          |                            |                                         |                        |                           |                                        |                                  |                                     |                                       |                          |                                  |         |      
      |                                          |sdp_disconnect_cfm:2314     |》》                                     |                        |                           |                                        |                                  |                                     |                                       |                          |                                  |         |      
      |                                          |                            |                                         |                        |                           |                                        |                                  |                                     |                                       |                          |                                  |         |      
      |                                          |                            |                                         |                        |                           |                                        |                                  |                                     |                                       |                          |btif_sdp_search_comp_evt:2322     |》》     |      
      |                                          |                            |                                         |                        |                           |                                        |                                  |                                     |                                       |                          |                                  |         |      
      |                                          |                            |                                         |                        |                           |                                        |                                  |                                     |                                       |                          |                                  |         |V     
      |                                          |                            |                                         |                        |                           |                                        |                                  |                                     |                                       |                          |                                  |         |      
      |                                          |                            |                                         |                        |                           |                                        |                                  |                                     |                                       |                          |                                  |         |      
 
第 7 章 hfp  流程图

      |BondStateMachine.java     |HeadsetStateMachine.java     |btif_hf.cc                              |bta_ag_api.cc       |bta_ag_main.cc                       |bta_ag_act.cc                |bta_ag_sdp.cc               |bta_ag_rfc.cc               |      
      |                          |                             |                                        |                    |                                     |                             |                            |                            |      
      |processMessage:2346       |》》                         |                                        |                    |                                     |                             |                            |                            |      
      |                          |                             |                                        |                    |                                     |                             |                            |                            |      
      |                          |processMessage:2362          |》》                                    |                    |                                     |                             |                            |                            |      
      |                          |                             |                                        |                    |                                     |                             |                            |                            |      
      |                          |                             |Connect:2377                            |V                   |                                     |                             |                            |                            |      
      |                          |                             |                                        |                    |                                     |                             |                            |                            |      
      |                          |                             |static bt_status_t connect_int:2388     |》》                |                                     |                             |                            |                            |      
      |                          |                             |                                        |                    |                                     |                             |                            |                            |      
      |                          |                             |                                        |BTA_AgOpen:2400     |》》                                 |                             |                            |                            |      
      |                          |                             |                                        |                    |                                     |                             |                            |                            |      
      |                          |                             |                                        |                    |bta_ag_better_state_machine:2411     |》》                         |                            |                            |      
      |                          |                             |                                        |                    |                                     |                             |                            |                            |      
      |                          |                             |                                        |                    |                                     |bta_ag_start_open:2426       |》》                        |                            |      
      |                          |                             |                                        |                    |                                     |                             |                            |                            |      
      |                          |                             |                                        |                    |                                     |                             |bta_ag_do_disc:2438         |V                           |      
      |                          |                             |                                        |                    |                                     |                             |                            |                            |      
      |                          |                             |                                        |                    |                                     |                             |bta_ag_sdp_cback_1:2452     |V                           |      
      |                          |                             |                                        |                    |                                     |                             |                            |                            |      
      |                          |                             |                                        |                    |                                     |《《                         |bta_ag_sdp_cback:2463       |                            |      
      |                          |                             |                                        |                    |                                     |                             |                            |                            |      
      |                          |                             |                                        |                    |bta_ag_better_state_machine:2476     |》》                         |                            |                            |      
      |                          |                             |                                        |                    |                                     |                             |                            |                            |      
      |                          |                             |                                        |                    |《《                                 |bta_ag_disc_int_res:2492     |                            |                            |      
      |                          |                             |                                        |                    |                                     |                             |                            |                            |      
      |                          |                             |                                        |                    |bta_ag_better_state_machine:2506     |》》                         |                            |                            |      
      |                          |                             |                                        |                    |                                     |                             |                            |                            |      
      |                          |                             |                                        |                    |                                     |                             |                            |bta_ag_rfc_do_open:2522     |      
 
第 8 章 建立rfcomm  流程图

      |port_api.cc                   |port_rfc.cc                   |rfc_port_if.cc                  |rfc_mx_fsm.cc                          |l2c_csm.cc                                |rfc_l2cap_if.cc                 |rfc_ts_frames.cc                |rfc_port_fsm.cc                          |bta_ag_rfc.cc              |bta_ag_main.cc                       |bta_ag_act.cc            |btif_hf.cc                                   |:0       |      
      |                              |                              |                                |                                       |                                          |                                |                                |                                         |                           |                                     |                         |                                             |         |      
      |bta_ag_sdp_find_attr:2544     |》》                          |                                |                                       |                                          |                                |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |                              |                                |                                       |                                          |                                |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |port_open_continue:2561       |》》                            |                                       |                                          |                                |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |                              |                                |                                       |                                          |                                |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |                              |RFCOMM_StartReq:2573            |》》                                   |                                          |                                |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |                              |                                |                                       |                                          |                                |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |                              |                                |rfc_mx_sm_execute:2584                 |V                                         |                                |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |                              |                                |                                       |                                          |                                |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |                              |                                |rfc_mx_sm_state_idle:2597              |》》                                      |                                |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |                              |                                |                                       |                                          |                                |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |                              |                                |                                       |l2c_csm_config:2612                       |V                               |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |                              |                                |                                       |                                          |                                |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |                              |                                |                                       |l2c_csm_indicate_connection_open:2635     |》》                            |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |                              |                                |                                       |                                          |                                |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |                              |                                |                                       |《《                                      |RFCOMM_ConnectCnf:2648          |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |                              |                                |                                       |                                          |                                |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |                              |                                |rfc_mx_sm_state_wait_conn_cnf:2661     |》》                                      |                                |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |                              |                                |                                       |                                          |                                |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |                              |                                |                                       |《《                                      |l2c_csm_open:2675               |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |                              |                                |                                       |                                          |                                |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |                              |                                |rfc_mx_sm_state_configure:2692         |V                                         |                                |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |                              |                                |                                       |                                          |                                |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |                              |                                |rfc_mx_sm_state_configure:2705         |V                                         |                                |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |                              |                                |                                       |                                          |                                |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |                              |                                |rfc_mx_conf_cnf:2721                   |》》                                      |                                |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |                              |                                |                                       |                                          |                                |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |                              |                                |                                       |《《                                      |RFCOMM_BufDataInd:2737          |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |                              |                                |                                       |                                          |                                |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |                              |《《                            |rfc_mx_sm_sabme_wait_ua:2749           |                                          |                                |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |                              |                                |                                       |                                          |                                |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |PORT_StartCnf:2763            |》》                            |                                       |                                          |                                |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |                              |                                |                                       |                                          |                                |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |                              |rfc_process_pn:2774             |》》                                   |                                          |                                |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |                              |                                |                                       |                                          |                                |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |                              |                                |                                       |                                          |rfc_process_mx_message:2785     |》》                            |                                         |                           |                                     |                         |                                             |         |      
      |                              |                              |                                |                                       |                                          |                                |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |                              |                                |                                       |                                          |                                |rfc_process_mx_message:2801     |》》                                     |                           |                                     |                         |                                             |         |      
      |                              |                              |                                |                                       |                                          |                                |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |                              |                                |                                       |                                          |                                |《《                            |rfc_process_pn:2814                      |                           |                                     |                         |                                             |         |      
      |                              |                              |                                |                                       |                                          |                                |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |PORT_ParNegCnf:2826           |》》                            |                                       |                                          |                                |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |                              |                                |                                       |                                          |                                |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |                              |RFCOMM_DlcEstablishReq:2838     |》》                                   |                                          |                                |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |                              |                                |                                       |                                          |                                |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |                              |                                |                                       |                                          |                                |                                |rfc_port_sm_state_closed:2849            |V                          |                                     |                         |                                             |         |      
      |                              |                              |                                |                                       |                                          |                                |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |                              |                                |                                       |                                          |                                |                                |rfc_port_sm_orig_wait_sec_check:2862     |V                          |                                     |                         |                                             |         |      
      |                              |                              |                                |                                       |                                          |                                |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |                              |                                |                                       |                                          |                                |《《                            |rfc_port_sm_sabme_wait_ua:2875           |                           |                                     |                         |                                             |         |      
      |                              |                              |                                |                                       |                                          |                                |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |PORT_DlcEstablishCnf:2889     |》》                            |                                       |                                          |                                |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |                              |                                |                                       |                                          |                                |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |                              |                                |                                       |                                          |                                |                                |                                         |bta_ag_mgmt_cback:2901     |》》                                 |                         |                                             |         |      
      |                              |                              |                                |                                       |                                          |                                |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |                              |                                |                                       |                                          |                                |                                |                                         |                           |bta_ag_better_state_machine:2914     |》》                     |                                             |         |      
      |                              |                              |                                |                                       |                                          |                                |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |                              |                                |                                       |                                          |                                |                                |                                         |                           |                                     |bta_ag_rfc_open:2930     |》》                                         |         |      
      |                              |                              |                                |                                       |                                          |                                |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |                              |                                |                                       |                                          |                                |                                |                                         |                           |                                     |                         |bt_status_t btif_queue_connect_next:2940     |》》     |      
      |                              |                              |                                |                                       |                                          |                                |                                |                                         |                           |                                     |                         |                                             |         |      
      |                              |                              |                                |                                       |                                          |                                |                                |                                         |                           |                                     |                         |                                             |         |      
 
第 9 章 a2dp  流程图

      |A2dpService.java     |A2dpStateMachine.java     |btif_av.cc                                   |bta_av_api.cc       |bta_av_ssm.cc                               |bta_av_aact.cc                  |a2dp_api.cc                            |avdt_api.cc               |avdt_ccb_act.cc                    |avdt_ad.cc                   |l2c_csm.cc              |avdt_l2c.cc                        |avdt_msg.cc                |avdt_scb_act.cc                     |:0     |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |connect:2972         |》》                      |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |processMessage:2986       |》》                                         |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |static bt_status_t src_connect_sink:3000     |V                   |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |static bt_status_t connect_int:3014          |V                   |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |FindOrCreatePeer:3026                        |V                   |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |Init:3038                                    |V                   |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |StateIdle:3051                               |》》                |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |BTA_AvOpen:3064     |》》                                        |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |bta_av_better_stream_state_machine:3076     |》》                            |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |bta_av_do_disc_a2dp:3092        |》》                                   |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |tA2DP_STATUS A2DP_FindService:3104     |V                         |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |《《                            |a2dp_sdp_cback:3116                    |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |《《                                        |bta_av_a2dp_sdp_cback:3128      |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |bta_av_better_stream_state_machine:3141     |》》                            |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |bta_av_connect_req:3157         |》》                                   |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |AVDT_ConnectReq:3168      |》》                               |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |avdt_ccb_set_conn:3182             |V                            |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |avdt_ccb_chan_open:3193            |》》                         |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |avdt_ad_open_req:3204        |》》                    |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |l2c_csm_config:3218     |》》                               |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |《《                    |avdt_l2c_config_cfm_cback:3237     |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |《《                               |avdt_ad_tc_open_ind:3250     |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |《《                      |avdt_ccb_ll_opened:3263            |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |《《                                        |bta_av_proc_stream_evt:3275     |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |bta_av_better_stream_state_machine:3290     |》》                            |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |bta_av_discover_req:3305        |》》                                   |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |AVDT_DiscoverReq:3317     |》》                               |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |avdt_ccb_snd_discover_cmd:3332     |》》                         |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |《《                               |avdt_msg_send_cmd:3344     |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |avdt_ccb_snd_msg:3357              |V                            |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |avdt_ccb_snd_cmd:3369              |》》                         |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |《《                               |avdt_msg_send:3380         |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |avdt_ad_write_req:3394       |》》                    |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |l2c_csm_open:3408       |》》                               |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |《《                    |avdt_l2c_data_ind_cback:3425       |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |avdt_ad_tc_data_ind:3437     |》》                    |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |《《                               |avdt_msg_ind:3449          |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |《《                      |avdt_ccb_hdl_discover_rsp:3472     |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |bta_av_better_stream_state_machine:3501     |》》                            |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |bta_av_disc_results:3516        |V                                      |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |bta_av_next_getcap:3529         |》》                                   |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |AVDT_GetCapReq:3543       |V                                  |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |avdt_get_cap_req:3555     |》》                               |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |《《                      |avdt_ccb_hdl_getcap_rsp:3596       |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |bta_av_better_stream_state_machine:3623     |》》                            |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |bta_av_getcap_results:3638      |》》                                   |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |AVDT_OpenReq:3650         |》》                               |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |《《                       |avdt_scb_snd_setconfig_req:3664     |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |avdt_msg_ind:3677          |》》                                |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |avdt_scb_hdl_setconfig_rsp:3701     |V      |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |《《                       |avdt_scb_snd_open_req:3714          |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |avdt_msg_ind:3726          |》》                                |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |《《                       |avdt_scb_hdl_open_rsp:3752          |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |avdt_ad_open_req:3764        |》》                    |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |《《                    |avdt_l2c_config_cfm_cback:3778     |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |avdt_ad_tc_open_ind:3792     |》》                    |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |《《                       |avdt_scb_hdl_tc_open:3805           |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |《《                                        |bta_av_proc_stream_evt:3817     |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |bta_av_better_stream_state_machine:3833     |》》                            |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |bta_av_st_rc_timer:3851         |V                                      |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |《《                                        |bta_av_str_opened:3870          |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |StateOpening:3882                            |》》                |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |V     
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |V     
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
      |                     |                          |                                             |                    |                                            |                                |                                       |                          |                                   |                             |                        |                                   |                           |                                    |       |      
 
第 10 章 avrcpint  流程图

      |bta_av_ssm.cc                               |bta_av_aact.cc          |avrcp_service.cc            |connection_handler.cc                                |avrc_sdp.cc               |      
      |                                            |                        |                            |                                                     |                          |      
      |bta_av_better_stream_state_machine:3905     |》》                    |                            |                                                     |                          |      
      |                                            |                        |                            |                                                     |                          |      
      |                                            |bta_av_open_rc:3923     |》》                        |                                                     |                          |      
      |                                            |                        |                            |                                                     |                          |      
      |                                            |                        |ConnectDevice:3940          |》》                                                 |                          |      
      |                                            |                        |                            |                                                     |                          |      
      |                                            |                        |                            |ConnectDevice:3951                                   |V                         |      
      |                                            |                        |                            |                                                     |                          |      
      |                                            |                        |《《                        |SdpLookup:3963                                       |                          |      
      |                                            |                        |                            |                                                     |                          |      
      |                                            |                        |AvrcpInterfaceImpl:3975     |》》                                                 |                          |      
      |                                            |                        |                            |                                                     |                          |      
      |                                            |                        |                            |                                                     |AVRC_FindService:3988     |V     
      |                                            |                        |                            |                                                     |                          |      
      |                                            |                        |                            |《《                                                 |avrc_sdp_cback:4004       |      
      |                                            |                        |                            |// hci 中扫到avrcp sdp 信息后调用avrcp 连接函数      |                          |      
      |                                            |                        |                            |AvrcpConnect:4021                                    |                          |      
 
》》》》》》》


# 从点击cratebond 到发出HCI_Create_Connection

```c


 
                return service.createBond(this, transport, remoteP192Data, remoteP256Data, mAttributionSource);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/framework/java/android/bluetooth/BluetoothDevice.java:2045:
public final class BluetoothDevice implements Parcelable, Attributable {
    private boolean createBondInternal(int transport, @Nullable OobData remoteP192Data, @Nullable OobData remoteP256Data) {
        if (service == null || !isBluetoothEnabled()) {
        } else if (NULL_MAC_ADDRESS.equals(mAddress)) {
        } else {
            try {
                return service.createBond(this, transport, remoteP192Data, remoteP256Data, mAttributionSource);
```


```c


 
        mBondStateMachine.sendMessage(msg);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/android/app/src/com/android/bluetooth/btservice/AdapterService.java:5909:
public class AdapterService extends Service {
    boolean createBond(BluetoothDevice device,int transport,OobData remoteP192Data,OobData remoteP256Data,String callingPackage) {
        mBondStateMachine.sendMessage(msg);
```

```c


        Message msg = mBondStateMachine.obtainMessage(BondStateMachine.CREATE_BOND);
                    createBond(dev, msg.arg1, p192Data, p256Data, true);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/android/app/src/com/android/bluetooth/btservice/BondStateMachine.java:283:
final class BondStateMachine extends StateMachine {
    private class StableState extends State {
        public boolean processMessage(Message msg) {
            switch (msg.what) {
                case CREATE_BOND:
                    createBond(dev, msg.arg1, p192Data, p256Data, true);
```


```c


 
                result = mAdapterService.getNative().createBond(addr, addrType, transport);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/android/app/src/com/android/bluetooth/btservice/BondStateMachine.java:588:
final class BondStateMachine extends StateMachine {
    private boolean createBond(BluetoothDevice dev, int transport, OobData remoteP192Data,OobData remoteP256Data, boolean transition) {
        if (dev.getBondState() == BluetoothDevice.BOND_NONE) {
            if (remoteP192Data != null || remoteP256Data != null) {
            } else {
                result = mAdapterService.getNative().createBond(addr, addrType, transport);
```


```c


 
                result = mAdapterService.getNative().createBond(addr, addrType, transport);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/android/app/src/com/android/bluetooth/btservice/BondStateMachine.java:588:
final class BondStateMachine extends StateMachine {
    private boolean createBond(BluetoothDevice dev, int transport, OobData remoteP192Data,OobData remoteP256Data, boolean transition) {
        if (dev.getBondState() == BluetoothDevice.BOND_NONE) {
            if (remoteP192Data != null || remoteP256Data != null) {
            } else {
                result = mAdapterService.getNative().createBond(addr, addrType, transport);
```


```c


        return createBondNative(address, addressType, transport);
    ret = sBluetoothInterface->create_bond((RawAddress*)addr, transport);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/android/app/jni/com_android_bluetooth_btservice_AdapterService.cpp:1240:
static jboolean createBondNative(JNIEnv* env, jobject ,jbyteArray address, jint addrType,jint transport) {
  if (addr_type == BLE_ADDR_RANDOM) {
  } else {
    ret = sBluetoothInterface->create_bond((RawAddress*)addr, transport);
```

```c


static const bt_interface_t* sBluetoothInterface = NULL;
  do_in_main_thread(FROM_HERE,base::BindOnce(btif_dm_create_bond, *bd_addr, transport));

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/btif/src/bluetooth.cc:764:
static int create_bond(const RawAddress* bd_addr, int transport) {
  do_in_main_thread(FROM_HERE,base::BindOnce(btif_dm_create_bond, *bd_addr, transport));
```


```c


                    base::BindOnce(btif_dm_create_bond, *bd_addr, transport));
  btif_dm_cb_create_bond(bd_addr, transport);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/btif/src/btif_dm.cc:3454:
void btif_dm_create_bond(const RawAddress bd_addr, int transport) {
  btif_dm_cb_create_bond(bd_addr, transport);
```

```c

  通知上层bond 状态变化
 
    BTA_DmBond(bd_addr, addr_type, transport, device_type);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/btif/src/btif_dm.cc:1130:
static void btif_dm_cb_create_bond(const RawAddress bd_addr,tBT_TRANSPORT transport) {
    //告知上层bond 状态变化
  bond_state_changed(BT_STATUS_SUCCESS, bd_addr, BT_BOND_STATE_BONDING);
  if (!(transport == BT_TRANSPORT_BR_EDR && interop_match_addr(INTEROP_LEAUDIO_DISABLE_PAIR_FORCE_LE, &bd_addr))&& is_device_le_audio_capable(bd_addr) && is_vivo_device(bd_addr)&& transport != BT_TRANSPORT_RECOVER) {
  if (!IS_FLAG_ENABLED(connect_hid_after_service_discovery) &&is_hid && (device_type & BT_DEVICE_TYPE_BLE) == 0) {
  } else {
    BTA_DmBond(bd_addr, addr_type, transport, device_type);
```


```c


    BTA_DmBond(bd_addr, addr_type, transport, device_type);
    do_in_main_thread(FROM_HERE, base::BindOnce(bta_dm_bond, bd_addr, addr_type,transport, device_type));

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/dm/bta_dm_sec_api.cc:45:
void BTA_DmBond(const RawAddress& bd_addr, tBLE_ADDR_TYPE addr_type,tBT_TRANSPORT transport, tBT_DEVICE_TYPE device_type) {
  if (false) {
  } else {
    do_in_main_thread(FROM_HERE, base::BindOnce(bta_dm_bond, bd_addr, addr_type,transport, device_type));
```

```c


    do_in_main_thread(FROM_HERE, base::BindOnce(bta_dm_bond, bd_addr, addr_type,
  tBTM_STATUS status = get_btm_client_interface().security.BTM_SecBond(bd_addr, addr_type, transport, device_type);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/dm/bta_dm_sec.cc:173:
void bta_dm_bond(const RawAddress& bd_addr, tBLE_ADDR_TYPE addr_type,tBT_TRANSPORT transport, tBT_DEVICE_TYPE device_type) {
  tBTM_STATUS status = get_btm_client_interface().security.BTM_SecBond(bd_addr, addr_type, transport, device_type);
```

```c


    .BTM_SecBond = BTM_SecBond,
  return btm_sec_bond_by_transport(bd_addr, addr_type, transport);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/btm/btm_sec.cc:934:
tBTM_STATUS BTM_SecBond(const RawAddress& bd_addr, tBLE_ADDR_TYPE addr_type,tBT_TRANSPORT transport, tBT_DEVICE_TYPE device_type) {
  return btm_sec_bond_by_transport(bd_addr, addr_type, transport);
```



```c


  return btm_sec_bond_by_transport(bd_addr, addr_type, transport);
  return status;

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/btm/btm_sec.cc:895:
tBTM_STATUS btm_sec_bond_by_transport(const RawAddress& bd_addr,tBLE_ADDR_TYPE addr_type,tBT_TRANSPORT transport) {
  //初始化 device 记录结构体
  tBTM_SEC_DEV_REC* p_dev_rec;
  p_dev_rec = btm_find_or_alloc_dev(bd_addr);
  //删除link key 对应hci 中 HCI_Delete_Stored_Link_Key
  if ((BTM_DeleteStoredLinkKey(&bd_addr, NULL)) != BTM_SUCCESS) {
  //启用身份认证hci 中 HCI_Write_Authentication_Enable
    btsnd_hcic_write_auth_enable(true);
    //建立acl 
    status = btm_sec_dd_create_conn(p_dev_rec);
  return status;
```
```c


 
  tBTM_STATUS status = l2cu_ConnectAclForSecurity(p_dev_rec->bd_addr);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/btm/btm_sec.cc:2337:
static tBTM_STATUS btm_sec_dd_create_conn(tBTM_SEC_DEV_REC* p_dev_rec) {
  tBTM_STATUS status = l2cu_ConnectAclForSecurity(p_dev_rec->bd_addr);
```



```c


 
  l2cu_create_conn_br_edr(p_lcb);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/l2cap/l2c_link.cc:1338:
tBTM_STATUS l2cu_ConnectAclForSecurity(const RawAddress& bd_addr) {
  l2cu_create_conn_br_edr(p_lcb);
```


```c


  l2cu_create_conn_br_edr(p_lcb);
  l2cu_create_conn_after_switch(p_lcb);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/l2cap/l2c_utils.cc:2242:
void l2cu_create_conn_br_edr(tL2C_LCB* p_lcb) {
  l2cu_create_conn_after_switch(p_lcb);
```


```c


  l2cu_create_conn_after_switch(p_lcb);
  acl_create_classic_connection(p_lcb->remote_bd_addr,there_are_high_priority_channels,p_lcb->IsBonding());

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/l2cap/l2c_utils.cc:2303:
void l2cu_create_conn_after_switch(tL2C_LCB* p_lcb) {
  acl_create_classic_connection(p_lcb->remote_bd_addr,there_are_high_priority_channels,p_lcb->IsBonding());
```

```c


 
  return bluetooth::shim::ACL_CreateClassicConnection(bd_addr);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/acl/btm_acl.cc:2872:
void acl_create_classic_connection(const RawAddress& bd_addr,bool there_are_high_priority_channels,bool is_bonding) {
  return bluetooth::shim::ACL_CreateClassicConnection(bd_addr);
```

```c


 
  Stack::GetInstance()->GetAcl()->CreateClassicConnection(address);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/main/shim/acl_api.cc:43:
void bluetooth::shim::ACL_CreateClassicConnection(const RawAddress& raw_address) {
  Stack::GetInstance()->GetAcl()->CreateClassicConnection(address);
```

```c


  Stack::GetInstance()->GetAcl()->CreateClassicConnection(address);
  GetAclManager()->CreateConnection(address);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/main/shim/acl.cc:1498:
void shim::legacy::Acl::CreateClassicConnection(const hci::Address& address) {
  GetAclManager()->CreateConnection(address);
```

```c


  GetAclManager()->CreateConnection(address);
  CallOn(pimpl_->classic_impl_, &classic_impl::create_connection, address);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/gd/hci/acl_manager.cc:267:
void AclManager::CreateConnection(Address address) {
  CallOn(pimpl_->classic_impl_, &classic_impl::create_connection, address);
```


```c


 
    acl_scheduler_->EnqueueOutgoingAclConnection(address, handler_->BindOnceOn(this, &classic_impl::actually_create_connection, address, std::move(packet)));

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/gd/hci/acl_manager/classic_impl.h:355:
struct classic_impl : public security::ISecurityManagerListener {
  void create_connection(Address address) {
      //hci 中HCI_Create_Connection
     std::unique_ptr<CreateConnectionBuilder> packet = CreateConnectionBuilder::Create(address, packet_type, page_scan_repetition_mode, clock_offset, clock_offset_valid, allow_role_switch);
    acl_scheduler_->EnqueueOutgoingAclConnection(address, handler_->BindOnceOn(this, &classic_impl::actually_create_connection, address, std::move(packet)));
```


```c


 
    hal_->sendHciCommand(*bytes);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/gd/hci/hci_layer.cc:317:
struct HciLayer::impl {
  void send_next_command() {
    hal_->sendHciCommand(*bytes);
    if (aidl_hci_) {
    } else {
      bt_hci_->sendHciCommand(command);
```


```c


 
      bt_hci_->sendHciCommand(command);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/gd/hal/hci_hal_android_hidl.cc:347:
class HciHalHidl : public HciHal {
  void sendHciCommand(HciPacket command) override {
    if (aidl_hci_) {
    } else {
      bt_hci_->sendHciCommand(command);
```


# 从接到HCI_Connection_Complete


```c


 
        callback_->hciEventReceived(std::move(received_hci_packet));

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/gd/hal/hci_hal_android_hidl.cc:139:
class InternalHciCallbacks : public IBluetoothHciCallbacks_1_1 {
  Return<void> hciEventReceived(const hidl_vec<uint8_t>& event) override {
    {
      if (callback_ != nullptr) {
        callback_->hciEventReceived(std::move(received_hci_packet));
```

```c


  void registerIncomingPacketCallback(HciHalCallbacks* callback) override {
    module_.CallOn(module_.impl_, &impl::on_hci_event, std::move(event));

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/gd/hci/hci_layer.cc:629:
struct HciLayer::hal_callbacks : public hal::HciHalCallbacks {
  void hciEventReceived(hal::HciPacket event_bytes) override {
    module_.CallOn(module_.impl_, &impl::on_hci_event, std::move(event));
```


```c


      case EventCode::COMMAND_COMPLETE:
          event_handlers_[event_code].Invoke(event);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/gd/hci/hci_layer.cc:467:
struct HciLayer::impl {
  void on_hci_event(EventView event) {
    switch (event_code) {
      case EventCode::HARDWARE_ERROR:
        if (event_handlers_.find(event_code) == event_handlers_.end()) {
        } else if (!hci_send_upward) {
        } else {
          event_handlers_[event_code].Invoke(event);
```

```c


AclConnectionInterface* HciLayer::GetAclConnectionInterface(
        on_connection_complete(event_packet);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/gd/hci/acl_manager/classic_impl.h:117:
struct classic_impl : public security::ISecurityManagerListener {
  void on_classic_event(EventView event_packet) {
    switch (event_code) {
        //hci 中HCI_Connection_Complete
      case EventCode::CONNECTION_COMPLETE:
        on_connection_complete(event_packet);
```

```c


 
    acl_scheduler_->ReportAclConnectionCompletion(address,handler_->BindOnceOn(this,&classic_impl::create_and_announce_connection

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/gd/hci/acl_manager/classic_impl.h:496:
struct classic_impl : public security::ISecurityManagerListener {
  void on_connection_complete(EventView packet) {
    acl_scheduler_->ReportAclConnectionCompletion(address,handler_->BindOnceOn(this,&classic_impl::create_and_announce_connection
```

```c


 
    client_handler_->Post(common::BindOnce(&ConnectionCallbacks::OnConnectSuccess, common::Unretained(client_callbacks_), std::move(connection)));

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/gd/hci/acl_manager/classic_impl.h:448:
struct classic_impl : public security::ISecurityManagerListener {
  void create_and_announce_connection(ConnectionCompleteView connection_complete, Role current_role, Initiator initiator) {
    client_handler_->Post(common::BindOnce(&ConnectionCallbacks::OnConnectSuccess, common::Unretained(client_callbacks_), std::move(connection)));
```

```c


        &ConnectionCallbacks::OnConnectSuccess, common::Unretained(client_callbacks_), std::move(connection)));
  pimpl_->handle_to_classic_connection_map_[handle]->ReadRemoteControllerInformation();

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/main/shim/acl.cc:1652:
void shim::legacy::Acl::OnConnectSuccess(std::unique_ptr<hci::acl_manager::ClassicAclConnection> connection) {
    //hci 中HCI_Read_Remote_Version_Information
    //hci 中HCI_Read_Remote_Supported_Features
  pimpl_->handle_to_classic_connection_map_[handle]->ReadRemoteControllerInformation();
   TRY_POSTING_ON_MAIN(acl_interface_.connection.classic.on_connected, bd_addr,handle, false, locally_initiated);

```

```c


      .connection.classic.on_connected = on_acl_br_edr_connected,
    btm_sec_connected(bda, handle, HCI_SUCCESS, enc_mode,delayed_role_change_->new_role);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/acl/btm_acl.cc:2788:
void on_acl_br_edr_connected(const RawAddress& bda, uint16_t handle,uint8_t enc_mode, bool locally_initiated) {
  if (delayed_role_change_ != nullptr && delayed_role_change_->bd_addr == bda) {
    btm_sec_connected(bda, handle, HCI_SUCCESS, enc_mode,delayed_role_change_->new_role);
  l2c_link_hci_conn_comp(HCI_SUCCESS, handle, bda);
  NotifyAclLinkUp(*p_acl);
```

```c


    btm_sec_connected(bda, handle, HCI_SUCCESS, enc_mode,
            if (BTM_ReadRemoteDeviceName(p_dev_rec->bd_addr, NULL,BT_TRANSPORT_BR_EDR) !=BTM_CMD_STARTED) {

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/btm/btm_sec.cc:3931:
void btm_sec_connected(const RawAddress& bda, uint16_t handle,tHCI_STATUS status, uint8_t enc_mode,tHCI_ROLE assigned_role) {
  btm_acl_created(bda, handle, assigned_role, BT_TRANSPORT_BR_EDR);
```




```c


 
  uint8_t bit_shift = 0;

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/btm/btm_sec.cc:3847:
void btm_acl_created(const RawAddress& bda, uint16_t hci_handle,tHCI_ROLE link_role, tBT_TRANSPORT transport) { 
    //hci 中HCI_Write_Link_Policy_Settings
    btm_set_link_policy(p_acl, policy);
  btm_iot_save_remote_properties(p_acl);
  //hci 中HCI_Read_Clock_Offset
    btsnd_hcic_read_rmt_clk_offset(hci_handle);
```

```c


    res = btm_sec_execute_procedure(p_dev_rec);
    if (!btm_sec_start_get_name(p_dev_rec)) {

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/btm/btm_sec.cc:4885:
tBTM_STATUS btm_sec_execute_procedure(tBTM_SEC_DEV_REC* p_dev_rec) {
  if (!(p_dev_rec->sec_rec.sec_flags & BTM_SEC_NAME_KNOWN) &&(p_dev_rec->hci_handle != HCI_INVALID_HANDLE)) {
      //hci 中HCI_Remote_Name_Request
    if (!btm_sec_start_get_name(p_dev_rec)) {
```

```c


  BTM_SetLinkSuperTout(bda, link_supervision_timeout);
    btsnd_hcic_write_link_super_tout(p_acl->hci_handle, timeout);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/acl/btm_acl.cc:1398:
tBTM_STATUS BTM_SetLinkSuperTout(const RawAddress& remote_bda,uint16_t timeout) {
    // hci 中HCI_Write_Link_Supervision_Timeout
  if (p_acl->link_role == HCI_ROLE_CENTRAL) {
    btsnd_hcic_write_link_super_tout(p_acl->hci_handle, timeout);
```

```c


  l2c_link_hci_conn_comp(HCI_SUCCESS, handle, bda);
    l2cu_send_peer_info_req(p_lcb, L2CAP_EXTENDED_FEATURES_INFO_TYPE);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/l2cap/l2c_link.cc:146:
void l2c_link_hci_conn_comp(tHCI_STATUS status, uint16_t handle,const RawAddress& p_bda) {
  if (ci.status == HCI_SUCCESS) {
      //hci 中L2CAP_INFORMATION_REQ
    l2cu_send_peer_info_req(p_lcb, L2CAP_EXTENDED_FEATURES_INFO_TYPE);
```

```c


 
  p_buf = l2cu_build_header(p_lcb, 2, L2CAP_CMD_INFO_REQ, p_lcb->signal_id);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/l2cap/l2c_utils.cc:1086:
void l2cu_send_peer_info_req(tL2C_LCB* p_lcb, uint16_t info_type) {
  p_buf = l2cu_build_header(p_lcb, 2, L2CAP_CMD_INFO_REQ, p_lcb->signal_id);
```




```c


  NotifyAclLinkUp(*p_acl);
  BTA_dm_acl_up(p_acl.remote_addr, p_acl.transport, p_acl.hci_handle);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/acl/btm_acl.cc:206:
void NotifyAclLinkUp(tACL_CONN& p_acl) {
  BTA_dm_acl_up(p_acl.remote_addr, p_acl.transport, p_acl.hci_handle);
```



```c


  BTA_dm_acl_up(p_acl.remote_addr, p_acl.transport, p_acl.hci_handle);
  do_in_main_thread(FROM_HERE, base::BindOnce(bta_dm_acl_up, bd_addr, transport, acl_handle));

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/dm/bta_dm_act.cc:838:
void BTA_dm_acl_up(const RawAddress bd_addr, tBT_TRANSPORT transport,uint16_t acl_handle) {
  do_in_main_thread(FROM_HERE, base::BindOnce(bta_dm_acl_up, bd_addr, transport, acl_handle));
```

```c


      FROM_HERE, base::BindOnce(bta_dm_acl_up, bd_addr, transport, acl_handle));
  bta_dm_adjust_roles(true);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/dm/bta_dm_act.cc:832:
void bta_dm_acl_up(const RawAddress& bd_addr, tBT_TRANSPORT transport,uint16_t acl_handle) {
    // 切换角色
  bta_dm_adjust_roles(true);
```

```c

    bta_dm_acl_cb.p_acl_cback(BTA_DM_LINK_UP_EVT, &conn);
      GetInterfaceToProfiles()->events->invoke_acl_state_changed_cb(BT_STATUS_SUCCESS, bd_addr, BT_ACL_STATE_CONNECTED,(int)p_data->link_up.transport_link_type, HCI_SUCCESS,btm_is_acl_locally_initiated()? bt_conn_direction_t::BT_CONN_DIRECTION_OUTGOING: bt_conn_direction_t::BT_CONN_DIRECTION_INCOMING,p_data->link_up.acl_handle);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/btif/src/btif_dm.cc:3262:
void btif_dm_acl_evt(tBTA_DM_ACL_EVT event, tBTA_DM_ACL* p_data) {
  switch (event) {
    case BTA_DM_LINK_UP_EVT:
      GetInterfaceToProfiles()->events->invoke_acl_state_changed_cb(BT_STATUS_SUCCESS, bd_addr, BT_ACL_STATE_CONNECTED,(int)p_data->link_up.transport_link_type, HCI_SUCCESS,btm_is_acl_locally_initiated()? bt_conn_direction_t::BT_CONN_DIRECTION_OUTGOING: bt_conn_direction_t::BT_CONN_DIRECTION_INCOMING,p_data->link_up.acl_handle);
```


```c


      GetInterfaceToProfiles()->events->invoke_acl_state_changed_cb(
  do_in_jni_thread(FROM_HERE,base::BindOnce([](bt_status_t status, RawAddress bd_addr, bt_acl_state_t state,int transport_link_type, bt_hci_error_code_t hci_reason,bt_conn_direction_t direction, uint16_t acl_handle) {HAL_CBACK(bt_hal_cbacks, acl_state_changed_cb, status, &bd_addr,state, transport_link_type, hci_reason, direction,acl_handle);},status, bd_addr, state, transport_link_type, hci_reason, direction,acl_handle));

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/btif/src/bluetooth.cc:1665:
void invoke_acl_state_changed_cb(bt_status_t status, RawAddress bd_addr,bt_acl_state_t state, int transport_link_type,bt_hci_error_code_t hci_reason,bt_conn_direction_t direction,uint16_t acl_handle) {
  do_in_jni_thread(FROM_HERE,base::BindOnce([](bt_status_t status, RawAddress bd_addr, bt_acl_state_t state,int transport_link_type, bt_hci_error_code_t hci_reason,bt_conn_direction_t direction, uint16_t acl_handle) {HAL_CBACK(bt_hal_cbacks, acl_state_changed_cb, status, &bd_addr,state, transport_link_type, hci_reason, direction,acl_handle);},status, bd_addr, state, transport_link_type, hci_reason, direction,acl_handle));
```

```c


  acl_state_changed_callback acl_state_changed_cb;
  sCallbackEnv->CallVoidMethod(sJniCallbacksObj, method_aclStateChangeCallback,(jint)status, addr.get(), (jint)state,(jint)transport_link_type, (jint)hci_reason,(jint)acl_handle);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/android/app/jni/com_android_bluetooth_btservice_AdapterService.cpp:462:
static void acl_state_changed_callback(bt_status_t status, RawAddress* bd_addr,bt_acl_state_t state,int transport_link_type,bt_hci_error_code_t hci_reason,bt_conn_direction_t ,uint16_t acl_handle) {
  sCallbackEnv->CallVoidMethod(sJniCallbacksObj, method_aclStateChangeCallback,(jint)status, addr.get(), (jint)state,(jint)transport_link_type, (jint)hci_reason,(jint)acl_handle);
```

```c


      {"aclStateChangeCallback", "(I[BIIII)V", &method_aclStateChangeCallback},
                intent = new Intent(BluetoothDevice.ACTION_ACL_CONNECTED);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/android/app/src/com/android/bluetooth/btservice/RemoteDevices.java:1550:
public class RemoteDevices {
    void aclStateChangeCallback(int status, byte[] address, int newState,int transportLinkType, int hciReason, int handle) {
        if (newState == AbstractionLayer.BT_ACL_STATE_CONNECTED) {
            if (state == BluetoothAdapter.STATE_ON || state == BluetoothAdapter.STATE_TURNING_ON) {
                intent = new Intent(BluetoothDevice.ACTION_ACL_CONNECTED);
```

# 身份认证

```c


  acl 建立完成，获取对端设备名字，执行下一步加密
  tBTM_STATUS btm_status = btm_sec_execute_procedure(p_dev_rec);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/btm/btm_sec.cc:2616:
void btm_sec_rmt_name_request_complete(const RawAddress* p_bd_addr,const BD_NAME p_bd_name,tHCI_STATUS status) {
  /* Remote Name succeeded, execute the next security procedure, if any */
  tBTM_STATUS btm_status = btm_sec_execute_procedure(p_dev_rec);
```

```c


      FROM_HERE, base::Bind(&btm_sec_auth_timer_timeout, addr),
    btsnd_hcic_auth_request(p_dev_rec->hci_handle);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/btm/btm_sec.cc:5100:
static void btm_sec_auth_timer_timeout(void* data) {
  else {
      hci 中HCI_Authentication_Requested
    btsnd_hcic_auth_request(p_dev_rec->hci_handle);
```

```c


    btsnd_hcic_auth_request(p_dev_rec->hci_handle);
  btu_hcif_send_cmd(LOCAL_BR_EDR_CONTROLLER_ID, p);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/hcic/hcicmds.cc:672:
void btsnd_hcic_auth_request(uint16_t handle) {
  btu_hcif_send_cmd(LOCAL_BR_EDR_CONTROLLER_ID, p);
```

```c


  btu_hcif_send_cmd(LOCAL_BR_EDR_CONTROLLER_ID, p);
  bluetooth::shim::hci_layer_get_interface()->transmit_command(p_buf, btu_hcif_command_complete_evt, btu_hcif_command_status_evt, NULL);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/btu/btu_hcif.cc:623:
void btu_hcif_send_cmd(UNUSED_ATTR uint8_t controller_id, const BT_HDR* p_buf) {
  bluetooth::shim::hci_layer_get_interface()->transmit_command(p_buf, btu_hcif_command_complete_evt, btu_hcif_command_status_evt, NULL);
```

```c


  entry->second->OnReceive(packet);
      HandleEvent(hci::LinkKeyRequestView::Create(event));

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/gd/security/internal/security_manager_impl.cc:308:
void SecurityManagerImpl::OnHciEventReceived(hci::EventView packet) {
  switch (code) {
      //hci 中HCI_Link_Key_Request 
    case hci::EventCode::LINK_KEY_REQUEST:
      HandleEvent(hci::LinkKeyRequestView::Create(event));

```
```c


void btu_hcif_process_event(UNUSED_ATTR uint8_t controller_id,
      btu_hcif_sec_link_key_request(p);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/btu/btu_hcif.cc:288:
void btu_hcif_process_event(UNUSED_ATTR uint8_t controller_id,const BT_HDR* p_msg) {
  switch (hci_evt_code) {
      //hci 中真正处理 HCI_Link_Key_Request 
    case HCI_LINK_KEY_REQUEST_EVT:
      btu_hcif_sec_link_key_request(p);
```




```c


 
    this->GetChannel()->SendCommand(hci::LinkKeyRequestNegativeReplyBuilder::Create(GetRecord()->GetPseudoAddress()->GetAddress()));

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/gd/security/pairing/classic_pairing_handler.cc:211:
void ClassicPairingHandler::OnReceive(hci::LinkKeyRequestView packet) {
  if (GetRecord()->IsPaired()) {
  } else {
      //hci 中HCI_Link_Key_Request_Negative_Reply
    this->GetChannel()->SendCommand(hci::LinkKeyRequestNegativeReplyBuilder::Create(GetRecord()->GetPseudoAddress()->GetAddress()));
```

```c


 
      HandleEvent(hci::IoCapabilityRequestView::Create(event));

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/gd/security/internal/security_manager_impl.cc:314:
void SecurityManagerImpl::OnHciEventReceived(hci::EventView packet) {
  switch (code) {
      //hci 中HCI_IO_Capability_Request
    case hci::EventCode::IO_CAPABILITY_REQUEST:
      HandleEvent(hci::IoCapabilityRequestView::Create(event));
```




```c


        local_io_capability_(hci::IoCapability::DISPLAY_YES_NO),
  entry->second->OnReceive(packet);
    case hci::AuthenticationRequirements::GENERAL_BONDING:

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/gd/security/pairing/classic_pairing_handler.cc:289:
void ClassicPairingHandler::OnReceive(hci::IoCapabilityResponseView packet) {
    //hci 中HCI_IO_Capability_Response
  switch (remote_authentication_requirements_) {
    case hci::AuthenticationRequirements::GENERAL_BONDING:
```


```c

根据io 能力选择配对模式
  if (user_confirmation_request_) {
            GetChannel()->SendCommand(hci::UserConfirmationRequestReplyBuilder::Create(GetRecord()->GetPseudoAddress()->GetAddress()));

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/gd/security/pairing/classic_pairing_handler.cc:489:
void ClassicPairingHandler::OnReceive(hci::UserConfirmationRequestView packet) {
  switch (initiator_io_capability) {
    case hci::IoCapability::DISPLAY_ONLY:
      switch (responder_io_capability) {
        case hci::IoCapability::NO_INPUT_NO_OUTPUT:
          if (!GetRecord()->RequiresMitmProtection()) {
              //hci 中HCI_User_Confirmation_Request_Reply
            GetChannel()->SendCommand(hci::UserConfirmationRequestReplyBuilder::Create(GetRecord()->GetPseudoAddress()->GetAddress()));
```

```c


 
  last_status_ = packet.GetStatus();

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/gd/security/pairing/classic_pairing_handler.cc:316:
void ClassicPairingHandler::OnReceive(hci::SimplePairingCompleteView packet) {
    //hci 中HCI_Simple_Pairing_Complete
  last_status_ = packet.GetStatus();
```

```c


 
  GetRecord()->SetLinkKey(packet.GetLinkKey(), packet.GetKeyType());

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/gd/security/pairing/classic_pairing_handler.cc:220:
void ClassicPairingHandler::OnReceive(hci::LinkKeyNotificationView packet) {
    //hci 中HCI_Link_Key_Notification
  GetRecord()->SetLinkKey(packet.GetLinkKey(), packet.GetKeyType());
```

```c


 
  if (bta_dm_sec_cb.p_sec_cback) bta_dm_sec_cb.p_sec_cback(event, &sec_event);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/dm/bta_dm_sec.cc:395:
static uint8_t bta_dm_new_link_key_cback(const RawAddress& bd_addr,UNUSED_ATTR DEV_CLASS dev_class,BD_NAME bd_name, const LinkKey& key,uint8_t key_type, bool is_ctkd) {
    //更新bond 状态，此时上层已经bonded
  if (bta_dm_sec_cb.p_sec_cback) bta_dm_sec_cb.p_sec_cback(event, &sec_event);
```

```c


 
      bond_state_changed(status, bd_addr, state);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/btif/src/btif_dm.cc:1863:
static void btif_dm_auth_cmpl_evt(tBTA_DM_AUTH_CMPL* p_auth_cmpl) {
  if (p_auth_cmpl->success) {
      bond_state_changed(BT_STATUS_SUCCESS, bd_addr, BT_BOND_STATE_BONDED);
```





```c


        handler_->BindOn(this, &classic_impl::on_classic_event),
        on_authentication_complete(event_packet);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/gd/hci/acl_manager/classic_impl.h:123:
struct classic_impl : public security::ISecurityManagerListener {
  void on_classic_event(EventView event_packet) {
    switch (event_code) {
        //hci 中HCI_Authentication_Complete
      case EventCode::AUTHENTICATION_COMPLETE:
        on_authentication_complete(event_packet);
```

```c


        on_authentication_complete(event_packet);
    connections.execute(handle, [=](ConnectionManagementCallbacks* callbacks) {callbacks->OnAuthenticationComplete(authentication_complete.GetStatus());});

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/gd/hci/acl_manager/classic_impl.h:611:
struct classic_impl : public security::ISecurityManagerListener {
  void on_authentication_complete(EventView packet) {
    connections.execute(handle, [=](ConnectionManagementCallbacks* callbacks) {callbacks->OnAuthenticationComplete(authentication_complete.GetStatus());});
```

```c


      callbacks->OnAuthenticationComplete(authentication_complete.GetStatus());
    SAVE_OR_CALL(OnAuthenticationComplete, hci_status)}void OnEncryptionChange(EncryptionEnabled enabled) override {

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/gd/hci/acl_manager/classic_acl_connection.cc:69:
class AclConnectionTracker : public ConnectionManagementCallbacks {
  void OnAuthenticationComplete(hci::ErrorCode hci_status) override {
    SAVE_OR_CALL(OnAuthenticationComplete, hci_status)}void OnEncryptionChange(EncryptionEnabled enabled) override {
```

```c


      .link.classic.on_authentication_complete = btm_sec_auth_complete,
    log::verbose("Security Manager: in state: {}, handle: {}, status: {}, ""dev->sec_rec.sec_state:{}, bda: {}, RName: {}",tBTM_SEC_CB::btm_pair_state_descr(btm_sec_cb.pairing_state), handle,status, p_dev_rec->sec_rec.sec_state,ADDRESS_TO_LOGGABLE_CSTR(p_dev_rec->bd_addr),reinterpret_cast<char const*>(p_dev_rec->sec_bd_name));

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/btm/btm_sec.cc:3256:
void btm_sec_auth_complete(uint16_t handle, tHCI_STATUS status) {
  if (p_dev_rec) {
      //配对状态全部结束，把配对状态切换回来
  btm_restore_mode();
```




```c


 
          btif_dm_get_remote_services(bd_addr, BT_TRANSPORT_BR_EDR);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/btif/src/btif_dm.cc:1761:
static void btif_dm_auth_cmpl_evt(tBTA_DM_AUTH_CMPL* p_auth_cmpl) {
  if (p_auth_cmpl->success) {
    } else {
      if (!is_crosskey ||!(stack_config_get_interface()->get_pts_crosskey_sdp_disable())) {
        if (pairing_cb.sdp_over_classic ==btif_dm_pairing_cb_t::ServiceDiscoveryState::NOT_STARTED) {
            // hci 中SDP    L2CAP_CONNECTION_REQ
          btif_dm_get_remote_services(bd_addr, BT_TRANSPORT_BR_EDR);
```



# sdp到建立sdpl2cap连接



```c


 
          btif_dm_get_remote_services(bd_addr, BT_TRANSPORT_BR_EDR);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/btif/src/btif_dm.cc:1761:
static void btif_dm_auth_cmpl_evt(tBTA_DM_AUTH_CMPL* p_auth_cmpl) {
  if (p_auth_cmpl->success) {
    } else {
      if (!is_crosskey ||!(stack_config_get_interface()->get_pts_crosskey_sdp_disable())) {
        if (pairing_cb.sdp_over_classic ==btif_dm_pairing_cb_t::ServiceDiscoveryState::NOT_STARTED) {
            // hci 中SDP    L2CAP_CONNECTION_REQ
          btif_dm_get_remote_services(bd_addr, BT_TRANSPORT_BR_EDR);
```


```c


  bta_dm_disc_start_service_discovery(p_cback, bd_addr, transport);
  BTA_DmDiscover(remote_addr, btif_dm_search_services_evt, transport);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/btif/src/btif_dm.cc:3963:
void btif_dm_get_remote_services(RawAddress remote_addr, const int transport) {
  BTA_DmDiscover(remote_addr, btif_dm_search_services_evt, transport);
```
```c


 
  bta_dm_disc_start_service_discovery(p_cback, bd_addr, transport);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/dm/bta_dm_api.cc:118:
void BTA_DmDiscover(const RawAddress& bd_addr, tBTA_DM_SEARCH_CBACK* p_cback,tBT_TRANSPORT transport) {
  bta_dm_disc_start_service_discovery(p_cback, bd_addr, transport);
```


```c


 
  p_msg->hdr.event = BTA_DM_API_DISCOVER_EVT;

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/dm/bta_dm_disc.cc:2662:
void bta_dm_disc_start_service_discovery(tBTA_DM_SEARCH_CBACK* p_cback,const RawAddress& bd_addr,tBT_TRANSPORT transport) {
  p_msg->hdr.event = BTA_DM_API_DISCOVER_EVT;
```

```c


    case BTA_DM_SEARCH_IDLE:
          bta_dm_discover(message);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/dm/bta_dm_disc.cc:2461:
bool bta_dm_search_sm_execute(const BT_HDR_RIGID* p_msg) {
  switch (bta_dm_search_get_state()) {
    case BTA_DM_SEARCH_IDLE:
      switch (p_msg->event) {
        case BTA_DM_API_DISCOVER_EVT:
          bta_dm_discover(message);
```

```c


 
  bta_dm_discover_device(p_data->discover.bd_addr);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/dm/bta_dm_disc.cc:386:
static void bta_dm_discover(tBTA_DM_MSG* p_data) {
  bta_dm_discover_device(p_data->discover.bd_addr);
```

```c


      bta_dm_determine_discovery_transport(remote_bd_addr);
        bta_dm_find_services(bta_dm_search_cb.peer_bdaddr);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/dm/bta_dm_disc.cc:1621:
static void bta_dm_discover_device(const RawAddress& remote_bd_addr) {
  if (bta_dm_search_cb.services && !sdp_disable) {
    if (bta_dm_search_cb.services_to_search) {
      if (transport == BT_TRANSPORT_LE) {
      } else {
        bta_dm_find_services(bta_dm_search_cb.peer_bdaddr);
```

```c


          uuid = Uuid::From16Bit(UUID_PROTOCOL_L2CAP);
      if (!get_legacy_stack_sdp_api()->service.SDP_ServiceSearchAttributeRequest(bd_addr, bta_dm_search_cb.p_sdp_db, &bta_dm_sdp_callback)) {

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/dm/bta_dm_disc.cc:1380:
static void bta_dm_find_services(const RawAddress& bd_addr) {
  while (bta_dm_search_cb.service_index < BTA_MAX_SERVICE_ID) {
    if (bta_dm_search_cb.services_to_search &(tBTA_SERVICE_MASK)(BTA_SERVICE_ID_TO_SERVICE_MASK(bta_dm_search_cb.service_index))) {
        //在这里先找pnp，然后找l2cap 的uuid
      if (!get_legacy_stack_sdp_api()->service.SDP_ServiceSearchAttributeRequest(bd_addr, bta_dm_search_cb.p_sdp_db, &bta_dm_sdp_callback)) {
```

```c


               ->service.SDP_ServiceSearchAttributeRequest(
  p_ccb = sdp_conn_originate(p_bd_addr);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/sdp/sdp_api.cc:175:
bool SDP_ServiceSearchAttributeRequest(const RawAddress& p_bd_addr,tSDP_DISCOVERY_DB* p_db,tSDP_DISC_CMPL_CB* p_cb) {
  p_ccb = sdp_conn_originate(p_bd_addr);
```

```c


  p_ccb = sdp_conn_originate(p_bd_addr);
    cid = L2CA_ConnectReq2(BT_PSM_SDP, p_bd_addr, BTM_SEC_NONE);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/sdp/sdp_main.cc:359:
tCONN_CB* sdp_conn_originate(const RawAddress& p_bd_addr) {
  if (!bluetooth::common::init_flags::sdp_serialization_is_enabled() ||cid == 0) {
    cid = L2CA_ConnectReq2(BT_PSM_SDP, p_bd_addr, BTM_SEC_NONE);
```

```c


    cid = L2CA_ConnectReq2(BT_PSM_SDP, p_bd_addr, BTM_SEC_NONE);
  return L2CA_ConnectReq(psm, p_bd_addr);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/l2cap/l2c_api.cc:309:
uint16_t L2CA_ConnectReq2(uint16_t psm, const RawAddress& p_bd_addr,uint16_t sec_level) {
  return L2CA_ConnectReq(psm, p_bd_addr);
```

```c


  return L2CA_ConnectReq(psm, p_bd_addr);
    l2c_csm_execute(p_ccb, L2CEVT_L2CA_CONNECT_REQ, nullptr);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/l2cap/l2c_api.cc:369:
uint16_t L2CA_ConnectReq(uint16_t psm, const RawAddress& p_bd_addr) {
  if (p_lcb->link_state == LST_CONNECTED) {
    l2c_csm_execute(p_ccb, L2CEVT_L2CA_CONNECT_REQ, nullptr);
```

# l2cap 连接建立
- pL2CA_DataInd_Cb  基于l2cap 的profile，对端发数据过来，处理的函数都这个回调
- 这个回调都是调用L2CA_Register2创建对应连接时传的函数
- 收到l2cap 用process_l2cap_cmd 处理
- 发送l2cap 用 l2cu_build_header 编织数据

```c


  return L2CA_ConnectReq(psm, p_bd_addr);
    l2c_csm_execute(p_ccb, L2CEVT_L2CA_CONNECT_REQ, nullptr);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/l2cap/l2c_api.cc:369:
uint16_t L2CA_ConnectReq(uint16_t psm, const RawAddress& p_bd_addr) {
  if (p_lcb->link_state == LST_CONNECTED) {
    l2c_csm_execute(p_ccb, L2CEVT_L2CA_CONNECT_REQ, nullptr);
``` 
```c


    l2c_csm_execute(p_ccb, L2CEVT_L2CA_CONNECT_REQ, nullptr);
      l2c_csm_closed(p_ccb, event, p_data);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/l2cap/l2c_csm.cc:278:
void l2c_csm_execute(tL2C_CCB* p_ccb, tL2CEVT event, void* p_data) {
  switch (p_ccb->chnl_state) {
    case CST_CLOSED:
      l2c_csm_closed(p_ccb, event, p_data);
```


```c


        l2ble_sec_access_req(p_ccb->p_lcb->remote_bd_addr, p_ccb->p_rcb->psm,
          p_ccb->chnl_state = CST_ORIG_W4_SEC_COMP;

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/l2cap/l2c_csm.cc:413:
static void l2c_csm_closed(tL2C_CCB* p_ccb, tL2CEVT event, void* p_data) {
  switch (event) {
    case L2CEVT_L2CA_CONNECT_REQ:
      if (p_ccb->p_lcb->transport == BT_TRANSPORT_LE) {
      } else {
        if (btm_sec_l2cap_access_req(p_ccb->p_lcb->remote_bd_addr, p_ccb->p_rcb->psm, true,&l2c_link_sec_comp, p_ccb) == BTM_CMD_STARTED) {
          p_ccb->chnl_state = CST_ORIG_W4_SEC_COMP;
```



```c


        if (btm_sec_l2cap_access_req(
    (*p_callback)(&bd_addr, transport, p_ref_data, BTM_SUCCESS_NO_SECURITY);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/btm/btm_sec.cc:1899:
tBTM_STATUS btm_sec_l2cap_access_req(const RawAddress& bd_addr, uint16_t psm,bool is_originator,tBTM_SEC_CALLBACK* p_callback,void* p_ref_data) {
  if (psm == BT_PSM_SDP) {
    (*p_callback)(&bd_addr, transport, p_ref_data, BTM_SUCCESS_NO_SECURITY);
```

```c


        if (btm_sec_l2cap_access_req(p_ccb->p_lcb->remote_bd_addr, p_ccb->p_rcb->psm, true,&l2c_link_sec_comp, p_ccb) == BTM_CMD_STARTED) {
        l2c_csm_execute(p_ccb, L2CEVT_SEC_COMP, &ci);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/l2cap/l2c_link.cc:262:
void l2c_link_sec_comp(const RawAddress* p_bda,UNUSED_ATTR tBT_TRANSPORT transport, void* p_ref_data,tBTM_STATUS status) {
  if (IS_FLAG_ENABLED(l2cap_p_ccb_check_rewrite)) {
    switch (status) {
      case BTM_SUCCESS:
        l2c_csm_execute(p_ccb, L2CEVT_SEC_COMP, &ci);
```

```c


 
      l2c_csm_closed(p_ccb, event, p_data);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/l2cap/l2c_csm.cc:278:
void l2c_csm_execute(tL2C_CCB* p_ccb, tL2CEVT event, void* p_data) {
  switch (p_ccb->chnl_state) {
    case CST_CLOSED:
      l2c_csm_closed(p_ccb, event, p_data);
```

```c


 
          l2cu_send_peer_connect_req(p_ccb);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/l2cap/l2c_csm.cc:434:
static void l2c_csm_closed(tL2C_CCB* p_ccb, tL2CEVT event, void* p_data) {
  switch (event) {
    case L2CEVT_SEC_COMP:
      if (!p_ccb->p_lcb->w4_info_rsp) {
        if (!l2c_fcr_chk_chan_modes(p_ccb)) {
        } else {
            // hci 中L2CAP_CONNECTION_REQ
          l2cu_send_peer_connect_req(p_ccb);
```

```c


          l2cu_send_peer_connect_req(p_ccb);
  l2c_link_check_send_pkts(p_ccb->p_lcb, 0, p_buf);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/l2cap/l2c_utils.cc:481:
void l2cu_send_peer_connect_req(tL2C_CCB* p_ccb) {
  l2c_link_check_send_pkts(p_ccb->p_lcb, 0, p_buf);
```



```c


  l2c_link_check_send_pkts(p_ccb->p_lcb, 0, p_buf);
        l2c_link_send_to_lower(p_lcb, p_buf, NULL);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/l2cap/l2c_link.cc:1046:
void l2c_link_check_send_pkts(tL2C_LCB* p_lcb, uint16_t local_cid,BT_HDR* p_buf) {
  if ((p_lcb == NULL) || (p_lcb->link_xmit_quota == 0)) {
    for (int xx = 0; xx < MAX_L2CAP_LINKS; xx++, p_lcb++) {
      if (p_lcb->link_xmit_data_q && !list_is_empty(p_lcb->link_xmit_data_q)) {
        l2c_link_send_to_lower(p_lcb, p_buf, NULL);
```

```c


        l2c_link_send_to_lower(p_lcb, p_buf, NULL);
    l2c_link_send_to_lower_br_edr(p_lcb, p_buf, p_cbi);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/l2cap/l2c_link.cc:1232:
static void l2c_link_send_to_lower(tL2C_LCB* p_lcb, BT_HDR* p_buf,tL2C_TX_COMPLETE_CB_INFO* p_cbi) {
  if (p_lcb->transport == BT_TRANSPORT_BR_EDR) {
    l2c_link_send_to_lower_br_edr(p_lcb, p_buf, p_cbi);
```


```c


    l2c_link_send_to_lower_br_edr(p_lcb, p_buf, p_cbi);
  acl_send_data_packet_br_edr(p_lcb->remote_bd_addr, p_buf);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/l2cap/l2c_link.cc:1185:
static void l2c_link_send_to_lower_br_edr(tL2C_LCB* p_lcb, BT_HDR* p_buf, tL2C_TX_COMPLETE_CB_INFO* p_cbi) {
  acl_send_data_packet_br_edr(p_lcb->remote_bd_addr, p_buf);
```

```c


  acl_send_data_packet_br_edr(p_lcb->remote_bd_addr, p_buf);
    return bluetooth::shim::ACL_WriteData(p_acl->hci_handle, p_buf);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/acl/btm_acl.cc:2959:
void acl_send_data_packet_br_edr(const RawAddress& bd_addr, BT_HDR* p_buf) {
    return bluetooth::shim::ACL_WriteData(p_acl->hci_handle, p_buf);
```

```c

l2cap 收数据
static void event_callback(bluetooth::hci::EventView event_packet_view) {
  send_data_upwards.Run(FROM_HERE, WrapPacketAndCopy(MSG_HC_TO_STACK_HCI_EVT,&event_packet_view));

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/main/shim/hci_layer.cc:179:
static void event_callback(bluetooth::hci::EventView event_packet_view) {
  send_data_upwards.Run(FROM_HERE, WrapPacketAndCopy(MSG_HC_TO_STACK_HCI_EVT,&event_packet_view));
```

```c


 
      .on_send_data_upwards = acl_rcv_acl_data,
  l2c_rcv_acl_data(p_msg);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/acl/btm_acl.cc:3060:
void acl_rcv_acl_data(BT_HDR* p_msg) {
  l2c_rcv_acl_data(p_msg);
```


```c


 
    process_l2cap_cmd(p_lcb, p, l2cap_len);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/l2cap/l2c_main.cc:144:
void l2c_rcv_acl_data(BT_HDR* p_msg) {
  if (rcv_cid == L2CAP_SIGNALLING_CID) {
    process_l2cap_cmd(p_lcb, p, l2cap_len);
```

```c


 
          l2c_csm_execute(p_ccb, L2CEVT_L2CAP_CONNECT_RSP, &con_info);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/l2cap/l2c_main.cc:459:
static void process_l2cap_cmd(tL2C_LCB* p_lcb, uint8_t* p, uint16_t pkt_len) {
  while (true) {
    switch (cmd_code) {
        //hci 中 L2CAP_CONNECTION_RSP
      case L2CAP_CMD_CONN_RSP: {
        if (con_info.l2cap_result == L2CAP_CONN_OK) {
          l2c_csm_execute(p_ccb, L2CEVT_L2CAP_CONNECT_RSP, &con_info);
```

```c


 
      l2c_csm_w4_l2cap_connect_rsp(p_ccb, event, p_data);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/l2cap/l2c_csm.cc:290:
void l2c_csm_execute(tL2C_CCB* p_ccb, tL2CEVT event, void* p_data) {
  switch (p_ccb->chnl_state) {
    case CST_W4_L2CAP_CONNECT_RSP:
省略config 过程
      l2c_csm_w4_l2cap_connect_rsp(p_ccb, event, p_data);
```

# service discover sdp

```c


      l2c_csm_config(p_ccb, event, p_data);
          l2c_csm_indicate_connection_open(p_ccb);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/l2cap/l2c_csm.cc:1321:
static void l2c_csm_config(tL2C_CCB* p_ccb, tL2CEVT event, void* p_data) {
  switch (event) {
      //hci 中L2CAP_CONFIGURATION_RSP
    case L2CEVT_L2CAP_CONFIG_RSP:
      if (p_ccb->config_done & IB_CFG_DONE) {
        if (p_ccb->chnl_state == CST_OPEN && !p_ccb->p_lcb->is_transport_ble()&& (p_ccb->p_rcb->psm == BT_PSM_AVDTP || p_ccb->p_rcb->psm == BT_PSM_AVCTP)&& p_ccb->connection_initiator == L2CAP_INITIATOR_REMOTE) {
        } else {
          l2c_csm_indicate_connection_open(p_ccb);
```


```c


 
    (*p_ccb->p_rcb->api.pL2CA_ConfigCfm_Cb)(p_ccb->local_cid, p_ccb->connection_initiator, &p_ccb->peer_cfg);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/l2cap/l2c_csm.cc:229:
static void l2c_csm_indicate_connection_open(tL2C_CCB* p_ccb) {
  if (p_ccb->chnl_state == CST_OPEN && !p_ccb->p_lcb->is_transport_ble()) {
    (*p_ccb->p_rcb->api.pL2CA_ConfigCfm_Cb)(p_ccb->local_cid, p_ccb->connection_initiator, &p_ccb->peer_cfg);
```

```c


  sdp_cb.reg_info.pL2CA_ConfigCfm_Cb = sdp_config_cfm;
    sdp_disc_connected(p_ccb);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/sdp/sdp_main.cc:240:
static void sdp_config_cfm(uint16_t l2cap_cid, uint16_t ,tL2CAP_CFG_INFO* p_cfg) {
  if (p_ccb->con_flags & SDP_FLAGS_IS_ORIG) {
    sdp_disc_connected(p_ccb);
```



```c


    sdp_disc_connected(p_ccb);
    process_service_search_attr_rsp(p_ccb, NULL, NULL);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/sdp/sdp_discovery.cc:221:
void sdp_disc_connected(tCONN_CB* p_ccb) {
  if (p_ccb->is_attr_search) {
    process_service_search_attr_rsp(p_ccb, NULL, NULL);
```
```c


    process_service_search_attr_rsp(p_ccb, NULL, NULL);
    L2CA_DataWrite(p_ccb->connection_id, p_msg);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/sdp/sdp_discovery.cc:662:
static void process_service_search_attr_rsp(tCONN_CB* p_ccb, uint8_t* p_reply,uint8_t* p_reply_end) {
  if ((cont_request_needed) || (!p_reply)) {
      //hci 中SDP_SERVICE_SEARCH_ATTR_REQ
    L2CA_DataWrite(p_ccb->connection_id, p_msg);
```

```c


    L2CA_DataWrite(p_ccb->connection_id, p_msg);
  return l2c_data_write(cid, p_data, L2CAP_NON_FLUSHABLE_PKT);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/l2cap/l2c_api.cc:1688:
uint8_t L2CA_DataWrite(uint16_t cid, BT_HDR* p_data) {
  return l2c_data_write(cid, p_data, L2CAP_NON_FLUSHABLE_PKT);
```

```c


  return l2c_data_write(cid, p_data, L2CAP_NON_FLUSHABLE_PKT);
  l2c_csm_execute(p_ccb, L2CEVT_L2CA_DATA_WRITE, p_data);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/l2cap/l2c_main.cc:1025:
uint8_t l2c_data_write(uint16_t cid, BT_HDR* p_data, uint16_t flags) {
  l2c_csm_execute(p_ccb, L2CEVT_L2CA_DATA_WRITE, p_data);
```

```c


        l2c_enqueue_peer_data(p_ccb, (BT_HDR*)p_data);
        l2c_link_check_send_pkts(p_ccb->p_lcb, 0, NULL);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/l2cap/l2c_csm.cc:1706:
static void l2c_csm_open(tL2C_CCB* p_ccb, tL2CEVT event, void* p_data) {
  switch (event) {
    case L2CEVT_L2CA_DATA_WRITE:
      if (p_data) {
        l2c_link_check_send_pkts(p_ccb->p_lcb, 0, NULL);
```


```c


 
    if (p_ccb->peer_cfg.fcr.mode == L2CAP_FCR_BASIC_MODE)l2c_csm_execute(p_ccb, L2CEVT_L2CAP_DATA, p_msg);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/l2cap/l2c_main.cc:209:
void l2c_rcv_acl_data(BT_HDR* p_msg) {
  if (p_lcb->transport == BT_TRANSPORT_LE) {
  } else {
    if (p_ccb->peer_cfg.fcr.mode == L2CAP_FCR_BASIC_MODE)
        l2c_csm_execute(p_ccb, L2CEVT_L2CAP_DATA, p_msg);
```

```c


      l2c_csm_execute(p_ccb, L2CEVT_L2CAP_DATA, p_msg);
          (*p_ccb->p_rcb->api.pL2CA_DataInd_Cb)(p_ccb->local_cid,(BT_HDR*)p_data);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/l2cap/l2c_csm.cc:1644:
static void l2c_csm_open(tL2C_CCB* p_ccb, tL2CEVT event, void* p_data) {
  switch (event) {
    case L2CEVT_L2CAP_DATA:
      if (p_data && (p_ccb->p_rcb)) {
        if (p_ccb->p_rcb->api.pL2CA_DataInd_Cb) {
          (*p_ccb->p_rcb->api.pL2CA_DataInd_Cb)(p_ccb->local_cid,(BT_HDR*)p_data);
```

```c


  sdp_cb.reg_info.pL2CA_DataInd_Cb = sdp_data_ind;
      if (p_ccb->con_flags & SDP_FLAGS_IS_ORIG)sdp_disc_server_rsp(p_ccb, p_msg);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/sdp/sdp_main.cc:308:
static void sdp_data_ind(uint16_t l2cap_cid, BT_HDR* p_msg) {
  if (p_ccb != NULL) {
    if (p_ccb->con_state == SDP_STATE_CONNECTED) {
        //hci 中SDP_SERVICE_SEARCH_ATTR_RSP
      if (p_ccb->con_flags & SDP_FLAGS_IS_ORIG)sdp_disc_server_rsp(p_ccb, p_msg);
```

```c


        sdp_disc_server_rsp(p_ccb, p_msg);
        process_service_search_attr_rsp(p_ccb, p, p_end);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/sdp/sdp_discovery.cc:279:
void sdp_disc_server_rsp(tCONN_CB* p_ccb, BT_HDR* p_msg) {
  switch (rsp_pdu) {
    case SDP_PDU_SERVICE_SEARCH_ATTR_RSP:
      if (p_ccb->disc_state == SDP_DISC_WAIT_SEARCH_ATTR) {
        process_service_search_attr_rsp(p_ccb, p, p_end);
```

```c


        process_service_search_attr_rsp(p_ccb, p, p_end);
      cont_request_needed = true;

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/sdp/sdp_discovery.cc:595:
static void process_service_search_attr_rsp(tCONN_CB* p_ccb, uint8_t* p_reply,uint8_t* p_reply_end) {
  if (p_reply) {
    if (*p_reply) {
        在这里判断sdp 是否回复完毕，没有回复完毕继续询问
      cont_request_needed = true;
  sdp_disconnect(p_ccb, SDP_SUCCESS);
```



```c

把处于pend 的sdp 执行
    if ((p_ccb->con_state == SDP_STATE_CONN_PEND) &&
      sdp_disc_connected(p_ccb);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/sdp/sdp_utils.cc:515:
bool sdpu_process_pend_ccb_same_cid(tCONN_CB& ccb) {
  for (xx = 0, p_ccb = sdp_cb.ccb; xx < SDP_MAX_CONNECTIONS; xx++, p_ccb++) {
    if ((p_ccb->con_state == SDP_STATE_CONN_PEND) &&(p_ccb->connection_id == ccb.connection_id) &&(p_ccb->con_flags & SDP_FLAGS_IS_ORIG)) {
      sdp_disc_connected(p_ccb);
```

```c


 
      sdpu_callback(ccb, reason);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/sdp/sdp_main.cc:394:
void sdp_disconnect(tCONN_CB* p_ccb, tSDP_REASON reason) {
  if (ccb.connection_id != 0) {
    if (SDP_SUCCESS == reason && sdpu_process_pend_ccb_same_cid(*p_ccb)) {
      sdpu_callback(ccb, reason);

      L2CA_DisconnectReq(ccb.connection_id);
```


```c


      sdpu_callback(ccb, reason);
    (ccb.p_cb)(ccb.device_address, reason);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/sdp/sdp_utils.cc:433:
void sdpu_callback(tCONN_CB& ccb, tSDP_REASON reason) {
  if (ccb.p_cb) {
      //hci 中sdp 搜索完成后调用sdpu_callback
    (ccb.p_cb)(ccb.device_address, reason);
```

```c


                   bd_addr, bta_dm_search_cb.p_sdp_db, &bta_dm_sdp_callback)) {
  p_msg->hdr.event = BTA_DM_SDP_RESULT_EVT;

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/dm/bta_dm_disc.cc:1655:
static void bta_dm_sdp_callback(UNUSED_ATTR const RawAddress& bd_addr,tSDP_STATUS sdp_status) {
  p_msg->hdr.event = BTA_DM_SDP_RESULT_EVT;
```

```c


 
          bta_dm_sdp_result(message);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/dm/bta_dm_disc.cc:2552:
bool bta_dm_search_sm_execute(const BT_HDR_RIGID* p_msg) {
  switch (bta_dm_search_get_state()) {
    case BTA_DM_DISCOVER_ACTIVE:
      switch (p_msg->event) {
        case BTA_DM_SDP_RESULT_EVT:
          bta_dm_sdp_result(message);
```

```c

在这个函数会比较sdp 记录里面看看是否有gatt uuid ,没有再执行到这里
          bta_dm_search_cb.p_search_cback(BTA_DM_GATT_OVER_SDP_RES_EVT,
      p_msg->hdr.event = BTA_DM_DISCOVERY_RESULT_EVT;

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/dm/bta_dm_disc.cc:872:
static void bta_dm_sdp_result(tBTA_DM_MSG* p_data) {
  if ((p_data->sdp_event.sdp_result == SDP_SUCCESS) ||(p_data->sdp_event.sdp_result == SDP_NO_RECS_MATCH) ||(p_data->sdp_event.sdp_result == SDP_DB_FULL)) {
    if (bta_dm_search_cb.services_to_search) {
    } else {
      p_msg->hdr.event = BTA_DM_DISCOVERY_RESULT_EVT;

```

```c


      p_msg->hdr.event = BTA_DM_DISCOVERY_RESULT_EVT;
          bta_dm_disc_result(message);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/dm/bta_dm_disc.cc:2558:
bool bta_dm_search_sm_execute(const BT_HDR_RIGID* p_msg) {
  switch (bta_dm_search_get_state()) {
    case BTA_DM_DISCOVER_ACTIVE:
      switch (p_msg->event) {
        case BTA_DM_DISCOVERY_RESULT_EVT:
          bta_dm_disc_result(message);
```


```c


 
  bta_dm_search_cmpl();

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/dm/bta_dm_disc.cc:1105:
static void bta_dm_disc_result(tBTA_DM_MSG* p_data) {
    bta_dm_search_cb.p_search_cback(BTA_DM_DISC_RES_EVT,&p_data->disc_result.result); 
  bta_dm_search_cmpl();
``` 





```c

btif_dm_search_services_evt: index:2 uuid:0000110b-0000-1000-8000-00805f9b34fb
    bta_dm_search_cb.p_search_cback(BTA_DM_DISC_RES_EVT,
          log::info("index:{} uuid:{}", i, uuid->ToString());

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/btif/src/btif_dm.cc:2419:
static void btif_dm_search_services_evt(tBTA_DM_SEARCH_EVT event,tBTA_DM_SEARCH* p_data) {
  switch (event) {
    case BTA_DM_DISC_RES_EVT: {
      if ((p_data->disc_res.result == BTA_SUCCESS) &&(p_data->disc_res.num_uuids > 0)) {
        for (i = 0; i < p_data->disc_res.num_uuids; i++) {
          log::info("index:{} uuid:{}", i, uuid->ToString());
          将// hci 中profile 上报到上层
           GetInterfaceToProfiles()->events->invoke_remote_device_properties_cb(BT_STATUS_SUCCESS, bd_addr, 1, &prop);
        //hci 中bond state 到bonded
            mAdapterService.deviceUuidUpdated(bdDevice);
```

```c


 
                                mAdapterService.deviceUuidUpdated(bdDevice);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/android/app/src/com/android/bluetooth/btservice/RemoteDevices.java:1288:
public class RemoteDevices {
    void devicePropertyChangedCallback(byte[] address, int[] types, byte[][] values) {
        for (int j = 0;(j < types.length) && (deviceProperties != null); j++) {
            if (val != null && val.length > 0) {
                {
                    switch (type) {
                        //hci 中uuid 上报到apk
                        case AbstractionLayer.BT_PROPERTY_UUIDS:
                            if (mAdapterService.getState() == BluetoothAdapter.STATE_ON) {
                                mAdapterService.deviceUuidUpdated(bdDevice);
```


```c


 
                        sendIntent(dev, BluetoothDevice.BOND_BONDED, 0, false);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/android/app/src/com/android/bluetooth/btservice/BondStateMachine.java:314:
final class BondStateMachine extends StateMachine {
    private class StableState extends State {
        public boolean processMessage(Message msg) {
            switch (msg.what) {
                case UUID_UPDATE:
                    if (mPendingBondedDevices.contains(dev)) {
                        sendIntent(dev, BluetoothDevice.BOND_BONDED, 0, false);
```



```c


                    mAdapterService.getDatabase().setProfileConnectionPolicy(device,
            data.setProfileConnectionPolicy(profile, newConnectionPolicy);

gerrit/ard15/2242/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/android/app/src/com/android/bluetooth/btservice/storage/DatabaseManager.java:513:
public class DatabaseManager {
    public boolean setProfileConnectionPolicy(BluetoothDevice device, int profile,int newConnectionPolicy) {
        synchronized (mMetadataCache) {
            // 把profile连接权限逐个改变
            data.setProfileConnectionPolicy(profile, newConnectionPolicy);
```  




```c


  sdp_disconnect(p_ccb, SDP_SUCCESS);
      L2CA_DisconnectReq(ccb.connection_id);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/sdp/sdp_main.cc:398:
void sdp_disconnect(tCONN_CB* p_ccb, tSDP_REASON reason) {
  if (ccb.connection_id != 0) {
    if (SDP_SUCCESS == reason && sdpu_process_pend_ccb_same_cid(*p_ccb)) {
    } else {
        //hci 中 L2CAP_DISCONNECTION_REQ
      L2CA_DisconnectReq(ccb.connection_id);
```

```c


 
            l2c_csm_execute(p_ccb, L2CEVT_L2CAP_DISCONNECT_RSP, &con_info);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/l2cap/l2c_main.cc:785:
static void process_l2cap_cmd(tL2C_LCB* p_lcb, uint8_t* p, uint16_t pkt_len) {
  while (true) {
    switch (cmd_code) {
        //hci 中L2CAP_DISCONNECTION_RSP
      case L2CAP_CMD_DISC_RSP: {
        if (p_ccb) {
          if ((p_ccb->remote_cid == rcid) && (p_ccb->local_id == id)) {
            l2c_csm_execute(p_ccb, L2CEVT_L2CAP_DISCONNECT_RSP, &con_info);
```


```c


            l2c_csm_execute(p_ccb, L2CEVT_L2CAP_DISCONNECT_RSP, &con_info);
        (*disconnect_cfm)(local_cid, L2CAP_DISC_OK);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/l2cap/l2c_csm.cc:1798:
static void l2c_csm_w4_l2cap_disconnect_rsp(tL2C_CCB* p_ccb, tL2CEVT event,void* p_data) {
  switch (event) {
    case L2CEVT_L2CAP_DISCONNECT_RSP:
      if (disconnect_cfm != nullptr) {
        (*disconnect_cfm)(local_cid, L2CAP_DISC_OK);
```

```c

多搜索了一个pce profile 导致断开的晚
  sdp_cb.reg_info.pL2CA_DisconnectCfm_Cb = sdp_disconnect_cfm;
  sdpu_callback(ccb, static_cast<tSDP_STATUS>(ccb.disconnect_reason));

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/sdp/sdp_main.cc:436:
static void sdp_disconnect_cfm(uint16_t l2cap_cid, uint16_t ) {
  sdpu_process_pend_ccb_new_cid(ccb);
  sdpu_callback(ccb, static_cast<tSDP_STATUS>(ccb.disconnect_reason));
```

```c

没发现一个服务都会上报给上层
static void btif_sdp_search_comp_evt(uint16_t event, char* p_param) {
  bta_sdp_cb.p_dm_cback(BTA_SDP_SEARCH_COMP_EVT, &bta_sdp, (void*)&uuid);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/sdp/bta_sdp_act.cc:677:
static void bta_sdp_search_cback(UNUSED_ATTR const RawAddress& bd_addr,tSDP_RESULT result, const void* user_data) {
  bta_sdp_cb.p_dm_cback(BTA_SDP_SEARCH_COMP_EVT, &bta_sdp, (void*)&uuid);
```


# hfp

- setProfileConnectionPolicy sdp 上报了hfp a2dp 等uuid 后，用这个接口修改profile 的policy 
- 我们发了bonded 状态后，apk 监听这个广播然后调用 bluetoothdevice 的connect 接口


```c


 
                        sendIntent(dev, BluetoothDevice.BOND_BONDED, 0, false);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/android/app/src/com/android/bluetooth/btservice/BondStateMachine.java:314:
final class BondStateMachine extends StateMachine {
    private class StableState extends State {
        public boolean processMessage(Message msg) {
            switch (msg.what) {
                case UUID_UPDATE:
                    if (mPendingBondedDevices.contains(dev)) {
                        sendIntent(dev, BluetoothDevice.BOND_BONDED, 0, false);
```

```c


                stateMachine.sendMessage(HeadsetStateMachine.CONNECT, device);
                        if (!mNativeInterface.connectHfp(device)) {

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/android/app/src/com/android/bluetooth/hfp/HeadsetStateMachine.java:829:
public class HeadsetStateMachine extends StateMachine {
    class Disconnected extends HeadsetStateBase {
        public boolean processMessage(Message message) {
            switch (message.what) {
                case CONNECT:
                    synchronized (device) {
                        if (!mNativeInterface.connectHfp(device)) {
```


```c


    static Interface* instance = new HeadsetInterface();
  return btif_queue_connect(UUID_SERVCLASS_AG_HANDSFREE, bd_addr, connect_int);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/btif/src/btif_hf.cc:1292:
bt_status_t HeadsetInterface::Connect(RawAddress* bd_addr) {
  return btif_queue_connect(UUID_SERVCLASS_AG_HANDSFREE, bd_addr, connect_int);
```

```c


  return btif_queue_connect(UUID_SERVCLASS_AG_HANDSFREE, bd_addr, connect_int);
  BTA_AgOpen(hf_cb->handle, hf_cb->connected_bda);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/btif/src/btif_hf.cc:1034:
static bt_status_t connect_int(RawAddress* bd_addr, uint16_t uuid) {
  hf_cb->state = BTHF_CONNECTION_STATE_CONNECTING;
  BTA_AgOpen(hf_cb->handle, hf_cb->connected_bda);
```

```c


 
  do_in_main_thread(FROM_HERE,base::BindOnce(&bta_ag_sm_execute_by_handle, handle,BTA_AG_API_OPEN_EVT, data));

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/ag/bta_ag_api.cc:142:
void BTA_AgOpen(uint16_t handle, const RawAddress& bd_addr) {
  do_in_main_thread(FROM_HERE,base::BindOnce(&bta_ag_sm_execute_by_handle, handle,BTA_AG_API_OPEN_EVT, data));
```

```c


                                   BTA_AG_API_OPEN_EVT, data));
          bta_ag_start_open(p_scb, data);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/ag/bta_ag_main.cc:605:
static void bta_ag_better_state_machine(tBTA_AG_SCB* p_scb, uint16_t event,const tBTA_AG_DATA& data) {
  switch (p_scb->state) {
    case BTA_AG_INIT_ST:
      switch (event) {
        case BTA_AG_API_OPEN_EVT:
          bta_ag_start_open(p_scb, data);
```

```c


          bta_ag_start_open(p_scb, data);
  bta_ag_do_disc(p_scb, p_scb->open_services);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/ag/bta_ag_act.cc:221:
void bta_ag_start_open(tBTA_AG_SCB* p_scb, const tBTA_AG_DATA& data) {
  bta_ag_do_disc(p_scb, p_scb->open_services);
```


```c

//hci 中做hfp的sdp
    uuid_list[0] = Uuid::From16Bit(UUID_SERVCLASS_HF_HANDSFREE);
    if (get_legacy_stack_sdp_api()->service.SDP_ServiceSearchAttributeRequest(p_scb->peer_addr, p_scb->p_disc_db,bta_ag_sdp_cback_tbl[bta_ag_scb_to_idx(p_scb) - 1])) {

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/ag/bta_ag_sdp.cc:548:
void bta_ag_do_disc(tBTA_AG_SCB* p_scb, tBTA_SERVICE_MASK service) {
  if (get_legacy_stack_sdp_api()->service.SDP_InitDiscoveryDb(p_scb->p_disc_db, BTA_AG_DISC_BUF_SIZE, num_uuid, uuid_list, num_attr,attr_list)) {
      //这是设置了sdp 断开的回调,等到hfp 的sdp 做完，断开sdp 时回到这里
      //hci 中hfp 的sdp
    if (get_legacy_stack_sdp_api()->service.SDP_ServiceSearchAttributeRequest(p_scb->peer_addr, p_scb->p_disc_db,bta_ag_sdp_cback_tbl[bta_ag_scb_to_idx(p_scb) - 1])) {
```

```c

当sdp 断开后会调用sdp 的回调函数
    bta_ag_sdp_cback_1, bta_ag_sdp_cback_2, bta_ag_sdp_cback_3,
  bta_ag_sdp_cback(status, 1);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/ag/bta_ag_sdp.cc:120:
void bta_ag_sdp_cback_1(UNUSED_ATTR const RawAddress& bd_addr,tSDP_STATUS status) {
  bta_ag_sdp_cback(status, 1);
```

```c


  bta_ag_sdp_cback(status, 1);
    do_in_main_thread(FROM_HERE, base::BindOnce(&bta_ag_sm_execute_by_handle,idx, event, disc_result));

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/ag/bta_ag_sdp.cc:101:
static void bta_ag_sdp_cback(uint16_t status, uint8_t idx) {
  if (p_scb) {
      event = BTA_AG_DISC_INT_RES_EVT;
    do_in_main_thread(FROM_HERE, base::BindOnce(&bta_ag_sm_execute_by_handle,idx, event, disc_result));
```

```c


      event = BTA_AG_DISC_INT_RES_EVT;
          bta_ag_disc_int_res(p_scb, data);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/ag/bta_ag_main.cc:670:
static void bta_ag_better_state_machine(tBTA_AG_SCB* p_scb, uint16_t event,const tBTA_AG_DATA& data) {
  switch (p_scb->state) {
    case BTA_AG_OPENING_ST:
      switch (event) {
        case BTA_AG_DISC_INT_RES_EVT:
          bta_ag_disc_int_res(p_scb, data);
```


```c


  tBTA_SERVICE_MASK open_services;      /* services specified in open API */
    bta_ag_sm_execute(p_scb, event, data);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/ag/bta_ag_act.cc:280:
void bta_ag_disc_int_res(tBTA_AG_SCB* p_scb, const tBTA_AG_DATA& data) {
  if ((event == BTA_AG_DISC_FAIL_EVT) &&(data.disc_result.status == SDP_SUCCESS ||data.disc_result.status == SDP_DB_FULL ||data.disc_result.status == SDP_NO_RECS_MATCH)) {
  } else {
      event = BTA_AG_DISC_OK_EVT;
    bta_ag_sm_execute(p_scb, event, data);
```

```c


      event = BTA_AG_DISC_OK_EVT;
          bta_ag_rfc_do_open(p_scb, data);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/ag/bta_ag_main.cc:673:
static void bta_ag_better_state_machine(tBTA_AG_SCB* p_scb, uint16_t event,const tBTA_AG_DATA& data) {
  switch (p_scb->state) {
    case BTA_AG_OPENING_ST:
      switch (event) {
        case BTA_AG_DISC_OK_EVT:
          bta_ag_rfc_do_open(p_scb, data);
```


```c


          bta_ag_rfc_do_open(p_scb, data);
  int status = RFCOMM_CreateConnectionWithSecurity(bta_ag_uuid[p_scb->conn_service], p_scb->peer_scn, false, BTA_AG_MTU,p_scb->peer_addr, &(p_scb->conn_handle),bta_ag_mgmt_cback_tbl[management_callback_index],BTA_SEC_AUTHENTICATE | BTA_SEC_ENCRYPT);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/ag/bta_ag_rfc.cc:347:
void bta_ag_rfc_do_open(tBTA_AG_SCB* p_scb, const tBTA_AG_DATA& data) {
    //hci 中建立uuid=0x111f的rfcomm 连接
  int status = RFCOMM_CreateConnectionWithSecurity(bta_ag_uuid[p_scb->conn_service], p_scb->peer_scn, false, BTA_AG_MTU,p_scb->peer_addr, &(p_scb->conn_handle),bta_ag_mgmt_cback_tbl[management_callback_index],BTA_SEC_AUTHENTICATE | BTA_SEC_ENCRYPT);
```

# 建立rfcomm

```c


          bta_ag_rfc_do_open(p_scb, data);
  int status = RFCOMM_CreateConnectionWithSecurity(bta_ag_uuid[p_scb->conn_service], p_scb->peer_scn, false, BTA_AG_MTU,p_scb->peer_addr, &(p_scb->conn_handle),bta_ag_mgmt_cback_tbl[management_callback_index],BTA_SEC_AUTHENTICATE | BTA_SEC_ENCRYPT);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/ag/bta_ag_rfc.cc:347:
void bta_ag_rfc_do_open(tBTA_AG_SCB* p_scb, const tBTA_AG_DATA& data) {
    //hci 中建立uuid=0x111f的rfcomm 连接
  int status = RFCOMM_CreateConnectionWithSecurity(bta_ag_uuid[p_scb->conn_service], p_scb->peer_scn, false, BTA_AG_MTU,p_scb->peer_addr, &(p_scb->conn_handle),bta_ag_mgmt_cback_tbl[management_callback_index],BTA_SEC_AUTHENTICATE | BTA_SEC_ENCRYPT);
``` 

```c


bool bta_ag_sdp_find_attr(tBTA_AG_SCB* p_scb, tBTA_SERVICE_MASK service) {
  return port_open_continue(p_port);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/rfcomm/port_api.cc:239:
int RFCOMM_CreateConnectionWithSecurity(uint16_t uuid, uint8_t scn,bool is_server, uint16_t mtu,const RawAddress& bd_addr,uint16_t* p_handle,tPORT_CALLBACK* p_mgmt_cb,uint16_t sec_mask) {
    设置scan DlCI port mtu
  return port_open_continue(p_port);
```


```c


  return port_open_continue(p_port);
    RFCOMM_StartReq(p_mcb);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/rfcomm/port_rfc.cc:97:
int port_open_continue(tPORT* p_port) {
  } else if ((p_mcb->state == RFC_MX_STATE_IDLE) ||(p_mcb->state == RFC_MX_STATE_DISC_WAIT_UA)) {
    RFCOMM_StartReq(p_mcb);
```

```c


    RFCOMM_StartReq(p_mcb);
  rfc_mx_sm_execute(p_mcb, RFC_MX_EVENT_START_REQ, nullptr);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/rfcomm/rfc_port_if.cc:56:
void RFCOMM_StartReq(tRFC_MCB* p_mcb) {
  rfc_mx_sm_execute(p_mcb, RFC_MX_EVENT_START_REQ, nullptr);
```

```c


  rfc_mx_sm_execute(p_mcb, RFC_MX_EVENT_START_REQ, nullptr);
      rfc_mx_sm_state_idle(p_mcb, event, p_data);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/rfcomm/rfc_mx_fsm.cc:90:
void rfc_mx_sm_execute(tRFC_MCB* p_mcb, tRFC_MX_EVENT event, void* p_data) {
  switch (p_mcb->state) {
    case RFC_MX_STATE_IDLE:
      rfc_mx_sm_state_idle(p_mcb, event, p_data);
```

```c


      rfc_mx_sm_state_idle(p_mcb, event, p_data);
      uint16_t lcid = L2CA_ConnectReq(BT_PSM_RFCOMM, p_mcb->bd_addr);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/rfcomm/rfc_mx_fsm.cc:140:
void rfc_mx_sm_state_idle(tRFC_MCB* p_mcb, tRFC_MX_EVENT event, void* p_data) {
  switch (event) {
    case RFC_MX_EVENT_START_REQ: {
        //hci 中 rfcomm 的l2cap 连接
      uint16_t lcid = L2CA_ConnectReq(BT_PSM_RFCOMM, p_mcb->bd_addr);
      p_mcb->state = RFC_MX_STATE_WAIT_CONN_CNF;
```

```c


 
          l2c_csm_indicate_connection_open(p_ccb);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/l2cap/l2c_csm.cc:1321:
static void l2c_csm_config(tL2C_CCB* p_ccb, tL2CEVT event, void* p_data) {
  switch (event) {
    case L2CEVT_L2CAP_CONFIG_RSP:
      if (p_ccb->config_done & IB_CFG_DONE) {
        if (p_ccb->chnl_state == CST_OPEN && !p_ccb->p_lcb->is_transport_ble()&& (p_ccb->p_rcb->psm == BT_PSM_AVDTP || p_ccb->p_rcb->psm == BT_PSM_AVCTP)&& p_ccb->connection_initiator == L2CAP_INITIATOR_REMOTE) {
        } else {
          l2c_csm_indicate_connection_open(p_ccb);
```




```c
// hci 中 rfcomm  l2cap config 完成连续调用  pL2CA_ConnectCfm_Cb  pL2CA_ConfigInd_Cb pL2CA_ConfigCfm_Cb
   p_l2c->pL2CA_ConnectCfm_Cb = RFCOMM_ConnectCnf;
  p_l2c->pL2CA_ConfigInd_Cb = RFCOMM_ConfigInd;
  p_l2c->pL2CA_ConfigCfm_Cb = RFCOMM_ConfigCnf; 


 
    (*p_ccb->p_rcb->api.pL2CA_ConnectCfm_Cb)(p_ccb->local_cid, L2CAP_CONN_OK);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/l2cap/l2c_csm.cc:201:
static void l2c_csm_indicate_connection_open(tL2C_CCB* p_ccb) {
  if (p_ccb->connection_initiator == L2CAP_INITIATOR_LOCAL) {
    (*p_ccb->p_rcb->api.pL2CA_ConnectCfm_Cb)(p_ccb->local_cid, L2CAP_CONN_OK);
    (*p_ccb->p_rcb->api.pL2CA_ConfigCfm_Cb)(
```


```c

      p_ccb->p_rcb->api.pL2CA_CreditBasedReconfigCompleted_Cb(
  rfc_mx_sm_execute(p_mcb, RFC_MX_EVENT_CONN_CNF, &result);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/rfcomm/rfc_l2cap_if.cc:184:
void RFCOMM_ConnectCnf(uint16_t lcid, uint16_t result) {
  rfc_mx_sm_execute(p_mcb, RFC_MX_EVENT_CONN_CNF, &result);
```



```c


      rfc_mx_sm_state_wait_conn_cnf(p_mcb, event, p_data);
        PORT_StartCnf(p_mcb, *((uint16_t*)p_data));

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/rfcomm/rfc_mx_fsm.cc:215:
void rfc_mx_sm_state_wait_conn_cnf(tRFC_MCB* p_mcb, tRFC_MX_EVENT event,void* p_data) {
  switch (event) {
    case RFC_MX_EVENT_CONN_CNF:
      p_mcb->state = RFC_MX_STATE_CONFIGURE;
```






```c


static void l2c_csm_open(tL2C_CCB* p_ccb, tL2CEVT event, void* p_data) {
  RFCOMM_ConfigInd(lcid, p_cfg);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/rfcomm/rfc_l2cap_if.cc:231:
void RFCOMM_ConfigCnf(uint16_t lcid, UNUSED_ATTR uint16_t initiator,tL2CAP_CFG_INFO* p_cfg) {
  RFCOMM_ConfigInd(lcid, p_cfg);
  rfc_mx_sm_execute(p_mcb, RFC_MX_EVENT_CONF_CNF, (void*)result_as_ptr);
```


```c


   p_l2c->pL2CA_ConnectCfm_Cb = RFCOMM_ConnectCnf;
      rfc_mx_conf_ind(p_mcb, (tL2CAP_CFG_INFO*)p_data);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/rfcomm/rfc_mx_fsm.cc:291:
void rfc_mx_sm_state_configure(tRFC_MCB* p_mcb, tRFC_MX_EVENT event,void* p_data) {
  switch (event) {
    case RFC_MX_EVENT_CONF_IND:
      rfc_mx_conf_ind(p_mcb, (tL2CAP_CFG_INFO*)p_data);
```

```c


  rfc_mx_sm_execute(p_mcb, RFC_MX_EVENT_CONF_CNF, (void*)result_as_ptr);
      rfc_mx_conf_cnf(p_mcb, (uintptr_t)p_data);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/rfcomm/rfc_mx_fsm.cc:295:
void rfc_mx_sm_state_configure(tRFC_MCB* p_mcb, tRFC_MX_EVENT event,void* p_data) {
  switch (event) {
    case RFC_MX_EVENT_CONF_CNF:
      rfc_mx_conf_cnf(p_mcb, (uintptr_t)p_data);
```




```c


      rfc_mx_conf_cnf(p_mcb, (uintptr_t)p_data);
      rfc_send_sabme(p_mcb, RFCOMM_MX_DLCI);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/rfcomm/rfc_mx_fsm.cc:649:
static void rfc_mx_conf_cnf(tRFC_MCB* p_mcb, uint16_t result) {
  if (p_mcb->state == RFC_MX_STATE_CONFIGURE) {
    if (p_mcb->is_initiator) {
        //hci 中 rfcomm 也需要协商配置参数，会建一条scn = 0  DLCI = 0的链路 配置参数
      p_mcb->state = RFC_MX_STATE_SABME_WAIT_UA;
      rfc_send_sabme(p_mcb, RFCOMM_MX_DLCI);
```


```c


  RFC_PORT_EVENT_UA = RFC_EVENT_UA,
    rfc_mx_sm_execute(p_mcb, static_cast<tRFC_MX_EVENT>(event), nullptr);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/rfcomm/rfc_l2cap_if.cc:303:
void RFCOMM_BufDataInd(uint16_t lcid, BT_HDR* p_buf) {
  if (rfc_cb.rfc.rx_frame.dlci == RFCOMM_MX_DLCI) {
    rfc_mx_sm_execute(p_mcb, static_cast<tRFC_MX_EVENT>(event), nullptr);
```

```c


  RFC_MX_EVENT_UA = RFC_EVENT_UA,
      PORT_StartCnf(p_mcb, RFCOMM_SUCCESS);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/rfcomm/rfc_mx_fsm.cc:359:
void rfc_mx_sm_sabme_wait_ua(tRFC_MCB* p_mcb, tRFC_MX_EVENT event,UNUSED_ATTR void* p_data) {
  switch (event) {
    case RFC_MX_EVENT_UA:
      p_mcb->state = RFC_MX_STATE_CONNECTED;
      PORT_StartCnf(p_mcb, RFCOMM_SUCCESS);
```

```c


      PORT_StartCnf(p_mcb, RFCOMM_SUCCESS);
        RFCOMM_ParameterNegotiationRequest(p_mcb, p_port->dlci, p_port->mtu);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/rfcomm/port_rfc.cc:210:
void PORT_StartCnf(tRFC_MCB* p_mcb, uint16_t result) {
  for (int i = 0; i < MAX_RFC_PORTS; i++, p_port++) {
    if (p_port->rfc.p_mcb == p_mcb) {
      if (result == RFCOMM_SUCCESS) {
        RFCOMM_ParameterNegotiationRequest(p_mcb, p_port->dlci, p_port->mtu);
```


```c

hci 中发送pn 协商rfcomm 参数
void rfc_process_pn(tRFC_MCB* p_mcb, bool is_command, MX_FRAME* p_frame) {
  rfc_send_pn(p_mcb, dlci, true, mtu, cl, k);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/rfcomm/rfc_port_if.cc:169:
void RFCOMM_ParameterNegotiationRequest(tRFC_MCB* p_mcb, uint8_t dlci,uint16_t mtu) {
  rfc_send_pn(p_mcb, dlci, true, mtu, cl, k);
```

```c
hci 中对端发送pn过来

void rfc_process_mx_message(tRFC_MCB* p_mcb, BT_HDR* p_buf) {
      rfc_process_mx_message(p_mcb, p_buf);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/rfcomm/rfc_l2cap_if.cc:298:
void RFCOMM_BufDataInd(uint16_t lcid, BT_HDR* p_buf) {
  if (rfc_cb.rfc.rx_frame.dlci == RFCOMM_MX_DLCI) {
    if (event == RFC_EVENT_UIH) {
      rfc_process_mx_message(p_mcb, p_buf);
```
```c


  p_l2c->pL2CA_DataInd_Cb = RFCOMM_BufDataInd;
      rfc_process_pn(p_mcb, is_command, p_rx_frame);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/rfcomm/rfc_ts_frames.cc:728:
void rfc_process_mx_message(tRFC_MCB* p_mcb, BT_HDR* p_buf) {
  switch (p_rx_frame->type) {
    case RFCOMM_MX_PN:
      rfc_process_pn(p_mcb, is_command, p_rx_frame);
```

```c


      rfc_process_pn(p_mcb, is_command, p_rx_frame);
  PORT_ParNegCnf(p_mcb, dlci, p_frame->u.pn.mtu, p_frame->u.pn.conv_layer,p_frame->u.pn.k);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/rfcomm/rfc_port_fsm.cc:775:
void rfc_process_pn(tRFC_MCB* p_mcb, bool is_command, MX_FRAME* p_frame) {
  PORT_ParNegCnf(p_mcb, dlci, p_frame->u.pn.mtu, p_frame->u.pn.conv_layer,p_frame->u.pn.k);
```


```c


  PORT_ParNegCnf(p_mcb, dlci, p_frame->u.pn.mtu, p_frame->u.pn.conv_layer,
  if (p_port->state == PORT_CONNECTION_STATE_OPENING)RFCOMM_DlcEstablishReq(p_mcb, p_port->dlci, p_port->mtu);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/rfcomm/port_rfc.cc:407:
void PORT_ParNegCnf(tRFC_MCB* p_mcb, uint8_t dlci, uint16_t mtu, uint8_t cl,uint8_t k) {
    //hci 中建立根据scn 和DlcI 建立rfcomm
  if (p_port->state == PORT_CONNECTION_STATE_OPENING)RFCOMM_DlcEstablishReq(p_mcb, p_port->dlci, p_port->mtu);
```

```c


  if (p_port->state == PORT_CONNECTION_STATE_OPENING)RFCOMM_DlcEstablishReq(p_mcb, p_port->dlci, p_port->mtu);
  rfc_port_sm_execute(p_port, RFC_PORT_EVENT_OPEN, nullptr);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/rfcomm/rfc_port_if.cc:96:
void RFCOMM_DlcEstablishReq(tRFC_MCB* p_mcb, uint8_t dlci,UNUSED_ATTR uint16_t mtu) {
  rfc_port_sm_execute(p_port, RFC_PORT_EVENT_OPEN, nullptr);
```

```c


  rfc_port_sm_execute(p_port, RFC_PORT_EVENT_OPEN, nullptr);
      btm_sec_mx_access_request(p_port->rfc.p_mcb->bd_addr, true,p_port->sec_mask, &rfc_sec_check_complete,p_port);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/rfcomm/rfc_port_fsm.cc:184:
void rfc_port_sm_state_closed(tPORT* p_port, tRFC_PORT_EVENT event,void* p_data) {
  switch (event) {
    case RFC_PORT_EVENT_OPEN:
      btm_sec_mx_access_request(p_port->rfc.p_mcb->bd_addr, true,p_port->sec_mask, &rfc_sec_check_complete,p_port);
```

```c


      rfc_send_sabme(p_mcb, RFCOMM_MX_DLCI);
      rfc_send_sabme(p_port->rfc.p_mcb, p_port->dlci);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/rfcomm/rfc_port_fsm.cc:493:
void rfc_port_sm_orig_wait_sec_check(tPORT* p_port, tRFC_PORT_EVENT event,void* p_data) {
  switch (event) {
    case RFC_PORT_EVENT_SEC_COMPLETE:
      rfc_send_sabme(p_port->rfc.p_mcb, p_port->dlci);
      p_port->rfc.state = RFC_STATE_SABME_WAIT_UA;
```

```c

      p_port->rfc.state = RFC_STATE_SABME_WAIT_UA;
      PORT_DlcEstablishCnf(p_port->rfc.p_mcb, p_port->dlci,p_port->rfc.p_mcb->peer_l2cap_mtu, RFCOMM_SUCCESS);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/rfcomm/rfc_port_fsm.cc:314:
void rfc_port_sm_sabme_wait_ua(tPORT* p_port, tRFC_PORT_EVENT event,void* p_data) {
  switch (event) {
//hci 中rfcomm 对端发送ua 此时rfcomm 已经建立成功
    case RFC_PORT_EVENT_UA:
      PORT_DlcEstablishCnf(p_port->rfc.p_mcb, p_port->dlci,p_port->rfc.p_mcb->peer_l2cap_mtu, RFCOMM_SUCCESS);
```

```c


      PORT_DlcEstablishCnf(p_port->rfc.p_mcb, p_port->dlci,
    p_port->p_mgmt_callback(PORT_SUCCESS, p_port->handle);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/rfcomm/port_rfc.cc:501:
void PORT_DlcEstablishCnf(tRFC_MCB* p_mcb, uint8_t dlci, uint16_t mtu,uint16_t result) {
  if (p_port->p_mgmt_callback) {
    p_port->p_mgmt_callback(PORT_SUCCESS, p_port->handle);
```

```c


  bta_ag_mgmt_cback(code, port_handle, 1);
  do_in_main_thread(FROM_HERE, base::BindOnce(&bta_ag_sm_execute_by_handle,handle, event, data));

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/ag/bta_ag_rfc.cc:166:
static void bta_ag_mgmt_cback(uint32_t code, uint16_t port_handle,uint16_t handle) {
    event = BTA_AG_RFC_OPEN_EVT;
  do_in_main_thread(FROM_HERE, base::BindOnce(&bta_ag_sm_execute_by_handle,handle, event, data));
```


```c


static void bta_ag_cback_open(tBTA_AG_SCB* p_scb, const RawAddress& bd_addr,
          bta_ag_rfc_open(p_scb, data);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/ag/bta_ag_main.cc:655:
static void bta_ag_better_state_machine(tBTA_AG_SCB* p_scb, uint16_t event,const tBTA_AG_DATA& data) {
  switch (p_scb->state) {
    case BTA_AG_OPENING_ST:
      switch (event) {
        case BTA_AG_RFC_OPEN_EVT:
          p_scb->state = BTA_AG_OPEN_ST;
          bta_ag_rfc_open(p_scb, data);
```

```c

Connecting -> Connected
          bta_ag_rfc_open(p_scb, data);
    bta_ag_svc_conn_open(p_scb, data);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/ag/bta_ag_act.cc:558:
void bta_ag_rfc_open(tBTA_AG_SCB* p_scb, const tBTA_AG_DATA& data) {
  if (p_scb->conn_service == BTA_AG_HFP) {
  } else {
    bta_ag_svc_conn_open(p_scb, data);

```

```c


bt_status_t btif_queue_connect_next(void) {
        btif_queue_advance();

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/btif/src/btif_hf.cc:641:
static void btif_hf_upstreams_evt(uint16_t event, char* p_param) {
  switch (event) {
    case BTA_AG_CONN_EVT:
      if (btif_hf_cb[idx].is_initiator) {
          //hci 中更新队列里面的连接函数，去连接a2dp
        btif_queue_advance();
```










# a2dp


```c


 
            smConnect.sendMessage(A2dpStateMachine.CONNECT);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/android/app/src/com/android/bluetooth/a2dp/A2dpService.java:520:
public class A2dpService extends ProfileService {
    public boolean connect(BluetoothDevice device) {
        synchronized (mStateMachines) {
            smConnect.sendMessage(A2dpStateMachine.CONNECT);
```

```c


            smConnect.sendMessage(A2dpStateMachine.CONNECT);
                    if (!mA2dpNativeInterface.connectA2dp(mDevice)) {

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/android/app/src/com/android/bluetooth/a2dp/A2dpStateMachine.java:247:
final class A2dpStateMachine extends StateMachine {
    class Disconnected extends State {
        public boolean processMessage(Message message) {
            switch (message.what) {
                case CONNECT:
                    if (!mA2dpNativeInterface.connectA2dp(mDevice)) {
```


```c


    src_connect_sink,
  return btif_queue_connect(UUID_SERVCLASS_AUDIO_SOURCE, &peer_address_copy,connect_int);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/btif/src/btif_av.cc:4493:
static bt_status_t src_connect_sink(const RawAddress& peer_address) {
  return btif_queue_connect(UUID_SERVCLASS_AUDIO_SOURCE, &peer_address_copy,connect_int);
```


```c


        btif_queue_advance();
    //hci 中hfp 连接成功后队列更新，把之前进入队列的a2dp 连上
 
  bt_status_t status = do_in_main_thread(FROM_HERE, base::BindOnce(connection_task, addr, uuid));

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/btif/src/btif_av.cc:4426:
static bt_status_t connect_int(RawAddress* peer_address, uint16_t uuid) {
  bt_status_t status = do_in_main_thread(FROM_HERE, base::BindOnce(connection_task, addr, uuid));
    peer->StateMachine().ProcessEvent(BTIF_AV_CONNECT_REQ_EVT, nullptr);
```

```c


      peer = btif_av_source.FindOrCreatePeer(*peer_address, kBtaHandleUnknown);
  peer->Init();

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/btif/src/btif_av.cc:1631:
BtifAvPeer* BtifAvSource::FindOrCreatePeer(const RawAddress& peer_address,tBTA_AV_HNDL bta_handle) {
  peer = new BtifAvPeer(peer_address, AVDT_TSEP_SNK, bta_handle, peer_id);
  peer->Init();
```

```c


  peer = new BtifAvPeer(peer_address, AVDT_TSEP_SNK, bta_handle, peer_id);
  state_machine_.Start();

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/btif/src/btif_av.cc:1349:
bt_status_t BtifAvPeer::Init() {
  state_machine_.Start();
```



```c


    peer->StateMachine().ProcessEvent(BTIF_AV_CONNECT_REQ_EVT, nullptr);
      BTA_AvOpen(peer_.PeerAddress(), peer_.BtaHandle(), true,peer_.LocalUuidServiceClass());

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/btif/src/btif_av.cc:2167:
bool BtifAvStateMachine::StateIdle::ProcessEvent(uint32_t event, void* p_data) {
  switch (event) {
    case BTIF_AV_CONNECT_REQ_EVT:
      BTA_AvOpen(peer_.PeerAddress(), peer_.BtaHandle(), true,peer_.LocalUuidServiceClass());
```

```c


      BTA_AvOpen(peer_.PeerAddress(), peer_.BtaHandle(), true,
  p_buf->hdr.event = BTA_AV_API_OPEN_EVT;

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/av/bta_av_api.cc:165:
void BTA_AvOpen(const RawAddress& bd_addr, tBTA_AV_HNDL handle, bool use_rc,uint16_t uuid) {
  p_buf->hdr.event = BTA_AV_API_OPEN_EVT;
```


```c


  p_buf->hdr.event = BTA_AV_API_OPEN_EVT;
          event_handler1 = &bta_av_do_disc_a2dp;

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/av/bta_av_ssm.cc:78:
static void bta_av_better_stream_state_machine(tBTA_AV_SCB* p_scb,uint16_t event,tBTA_AV_DATA* p_data) {
  switch (p_scb->state) {
    case BTA_AV_INIT_SST:
      switch (event) {
        case BTA_AV_API_OPEN_EVT:
          p_scb->state = BTA_AV_OPENING_SST;
          event_handler1 = &bta_av_do_disc_a2dp;
```

```c


      if (bta_av_switch_if_needed(p_scb) ||
  tA2DP_STATUS find_service_status = A2DP_FindService(sdp_uuid, p_scb->PeerAddress(), &db_params, bta_av_a2dp_sdp_cback);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/av/bta_av_aact.cc:996:
void bta_av_do_disc_a2dp(tBTA_AV_SCB* p_scb, tBTA_AV_DATA* p_data) {
    //hci 中a2dp sdp
  tA2DP_STATUS find_service_status = A2DP_FindService(sdp_uuid, p_scb->PeerAddress(), &db_params, bta_av_a2dp_sdp_cback);
```

```c


  tA2DP_STATUS find_service_status = A2DP_FindService(
  if (!get_legacy_stack_sdp_api()->service.SDP_ServiceSearchAttributeRequest(bd_addr, a2dp_cb.find.p_db, a2dp_sdp_cback)) {

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/a2dp/a2dp_api.cc:369:
tA2DP_STATUS A2DP_FindService(uint16_t service_uuid, const RawAddress& bd_addr,tA2DP_SDP_DB_PARAMS* p_db,tA2DP_FIND_CBACK* p_cback) {
  if (!get_legacy_stack_sdp_api()->service.SDP_ServiceSearchAttributeRequest(bd_addr, a2dp_cb.find.p_db, a2dp_sdp_cback)) {
```


```c


 
    (*a2dp_cb.find.p_cback)(found, &a2dp_svc, peer_address);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/a2dp/a2dp_api.cc:155:
static void a2dp_sdp_cback(UNUSED_ATTR const RawAddress& bd_addr,tSDP_STATUS status) {
  if (a2dp_cb.find.p_cback != NULL) {
    (*a2dp_cb.find.p_cback)(found, &a2dp_svc, peer_address);
```

```c


  tA2DP_STATUS find_service_status = A2DP_FindService(sdp_uuid, p_scb->PeerAddress(), &db_params, bta_av_a2dp_sdp_cback);
    p_msg->hdr.event = BTA_AV_SDP_DISC_OK_EVT;

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/av/bta_av_aact.cc:656:
static void bta_av_a2dp_sdp_cback(bool found, tA2DP_Service* p_service,const RawAddress& peer_address) {
  if (found) {
    p_msg->hdr.event = BTA_AV_SDP_DISC_OK_EVT;
```


```c


    p_msg->hdr.event = BTA_AV_SDP_DISC_OK_EVT;
          event_handler1 = &bta_av_connect_req;

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/av/bta_av_ssm.cc:195:
static void bta_av_better_stream_state_machine(tBTA_AV_SCB* p_scb,uint16_t event,tBTA_AV_DATA* p_data) {
  switch (p_scb->state) {
    case BTA_AV_OPENING_SST:
      switch (event) {
        case BTA_AV_SDP_DISC_OK_EVT:
          event_handler1 = &bta_av_connect_req;
```


```c


          event_handler1 = &bta_av_connect_req;
  AVDT_ConnectReq(p_scb->PeerAddress(), p_scb->hdi, &bta_av_proc_stream_evt);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/av/bta_av_aact.cc:1669:
void bta_av_connect_req(tBTA_AV_SCB* p_scb, UNUSED_ATTR tBTA_AV_DATA* p_data) {
  AVDT_ConnectReq(p_scb->PeerAddress(), p_scb->hdi, &bta_av_proc_stream_evt);
```

```c


  AVDT_ConnectReq(p_scb->PeerAddress(), p_scb->hdi, &bta_av_proc_stream_evt);
    avdt_ccb_event(p_ccb, AVDT_CCB_API_CONNECT_REQ_EVT, &evt);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/avdt/avdt_api.cc:926:
uint16_t AVDT_ConnectReq(const RawAddress& bd_addr, uint8_t channel_index,tAVDT_CTRL_CBACK* p_cback) {
  if (result == AVDT_SUCCESS) {
    {AVDT_CCB_SET_CONN, AVDT_CCB_CHAN_OPEN, AVDT_CCB_OPENING_ST},
    avdt_ccb_event(p_ccb, AVDT_CCB_API_CONNECT_REQ_EVT, &evt);
```


```c


    avdt_ccb_set_conn,         avdt_ccb_set_disconn,
  p_ccb->p_conn_cback = p_data->connect.p_cback;

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/avdt/avdt_ccb_act.cc:1028:
void avdt_ccb_set_conn(AvdtpCcb* p_ccb, tAVDT_CCB_EVT* p_data) {
  p_ccb->p_conn_cback = p_data->connect.p_cback;
```

```c


    {AVDT_CCB_SET_CONN, AVDT_CCB_CHAN_OPEN, AVDT_CCB_OPENING_ST},
  avdt_ad_open_req(AVDT_CHAN_SIG, p_ccb, NULL, AVDT_INT);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/avdt/avdt_ccb_act.cc:99:
void avdt_ccb_chan_open(AvdtpCcb* p_ccb, UNUSED_ATTR tAVDT_CCB_EVT* p_data) {
  avdt_ad_open_req(AVDT_CHAN_SIG, p_ccb, NULL, AVDT_INT);
```

```c


  avdt_ad_open_req(AVDT_CHAN_SIG, p_ccb, NULL, AVDT_INT);
    lcid =L2CA_ConnectReq2(AVDT_PSM, p_ccb->peer_addr, BTM_SEC_OUT_AUTHENTICATE);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/avdt/avdt_ad.cc:558:
void avdt_ad_open_req(uint8_t type, AvdtpCcb* p_ccb, AvdtpScb* p_scb,uint8_t role) {
  else {
      //hci 中 avdtp l2cap 连接
    lcid =L2CA_ConnectReq2(AVDT_PSM, p_ccb->peer_addr, BTM_SEC_OUT_AUTHENTICATE);
```


```c


 
          l2c_csm_indicate_connection_open(p_ccb);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/l2cap/l2c_csm.cc:1321:
static void l2c_csm_config(tL2C_CCB* p_ccb, tL2CEVT event, void* p_data) {
  switch (event) {
      // hci 中avdtp l2cap config rsp
    case L2CEVT_L2CAP_CONFIG_RSP:
      if (p_ccb->config_done & IB_CFG_DONE) {
        if (p_ccb->chnl_state == CST_OPEN && !p_ccb->p_lcb->is_transport_ble()&& (p_ccb->p_rcb->psm == BT_PSM_AVDTP || p_ccb->p_rcb->psm == BT_PSM_AVCTP)&& p_ccb->connection_initiator == L2CAP_INITIATOR_REMOTE) {
        } else {
            //hci 中 调用connect confirm 和config confirm  config ind
          l2c_csm_indicate_connection_open(p_ccb);
```


```c


  avdt_l2c_config_ind_cback(lcid, p_cfg);
      avdt_ad_tc_open_ind(p_tbl);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/avdt/avdt_l2c.cc:338:
void avdt_l2c_config_cfm_cback(uint16_t lcid, uint16_t initiator,tL2CAP_CFG_INFO* p_cfg) {
  if (p_tbl != NULL) {
    if (p_tbl->state == AVDT_AD_ST_CFG) {
      avdt_ad_tc_open_ind(p_tbl);
```

```c


    avdt_ccb_st_idle, avdt_ccb_st_opening, avdt_ccb_st_open,
    avdt_ccb_event(p_ccb, AVDT_CCB_LL_OPEN_EVT, &avdt_ccb_evt);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/avdt/avdt_ad.cc:370:
void avdt_ad_tc_open_ind(AvdtpTransportChannel* p_tbl) {
  if (p_tbl->tcid == 0) {
    {AVDT_CCB_SND_CMD, AVDT_CCB_LL_OPENED, AVDT_CCB_OPEN_ST},
    avdt_ccb_event(p_ccb, AVDT_CCB_LL_OPEN_EVT, &avdt_ccb_evt);
```

```c


    {AVDT_CCB_SND_CMD, AVDT_CCB_LL_OPENED, AVDT_CCB_OPEN_ST},
    (*p_ccb->p_conn_cback)(0, p_ccb->peer_addr, AVDT_CONNECT_IND_EVT,&avdt_ctrl, p_ccb->BtaAvScbIndex());

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/avdt/avdt_ccb_act.cc:1129:
void avdt_ccb_ll_opened(AvdtpCcb* p_ccb, tAVDT_CCB_EVT* p_data) {
  if (p_ccb->p_conn_cback) {
    (*p_ccb->p_conn_cback)(0, p_ccb->peer_addr, AVDT_CONNECT_IND_EVT,&avdt_ctrl, p_ccb->BtaAvScbIndex());
```

```c


    (*p_ccb->p_conn_cback)(0, p_ccb->peer_addr, AVDT_CONNECT_IND_EVT,
      bta_sys_sendmsg(p_msg);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/av/bta_av_aact.cc:529:
void bta_av_proc_stream_evt(uint8_t handle, const RawAddress& bd_addr,uint8_t event, tAVDT_CTRL* p_data,uint8_t scb_index) {
  if (p_scb) {
    if (p_msg->hdr.event != 0) {
     AVDT_CONNECT_IND_EVT:
      bta_sys_sendmsg(p_msg);
```


```c

    BTA_AV_AVDT_CONNECT_EVT ==  AVDT_CONNECT_IND_EVT
  BTA_AV_API_DISABLE_EVT = BTA_SYS_EVT_START(BTA_ID_AV),
          event_handler1 = &bta_av_discover_req;

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/av/bta_av_ssm.cc:241:
static void bta_av_better_stream_state_machine(tBTA_AV_SCB* p_scb,uint16_t event,tBTA_AV_DATA* p_data) {
  switch (p_scb->state) {
    case BTA_AV_OPENING_SST:
      switch (event) {
        case BTA_AV_AVDT_CONNECT_EVT:
          event_handler1 = &bta_av_discover_req;
```

```c


          event_handler1 = &bta_av_discover_req;
  AVDT_DiscoverReq(p_scb->PeerAddress(), p_scb->hdi, p_scb->sep_info,BTA_AV_NUM_SEPS, &bta_av_proc_stream_evt);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/av/bta_av_aact.cc:2187:
void bta_av_discover_req(tBTA_AV_SCB* p_scb, UNUSED_ATTR tBTA_AV_DATA* p_data) {
  AVDT_DiscoverReq(p_scb->PeerAddress(), p_scb->hdi, p_scb->sep_info,BTA_AV_NUM_SEPS, &bta_av_proc_stream_evt);
```


```c


  AVDT_DiscoverReq(p_scb->PeerAddress(), p_scb->hdi, p_scb->sep_info,
      avdt_ccb_event(p_ccb, AVDT_CCB_API_DISCOVER_REQ_EVT, &evt);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/avdt/avdt_api.cc:279:
uint16_t AVDT_DiscoverReq(const RawAddress& bd_addr, uint8_t channel_index,tAVDT_SEP_INFO* p_sep_info, uint8_t max_seps,tAVDT_CTRL_CBACK* p_cback) {
  if (result == AVDT_SUCCESS) {
    else {
    {AVDT_CCB_SND_DISCOVER_CMD, AVDT_CCB_SND_CMD, AVDT_CCB_OPEN_ST},
      avdt_ccb_event(p_ccb, AVDT_CCB_API_DISCOVER_REQ_EVT, &evt);
```


```c


    {AVDT_CCB_SND_DISCOVER_CMD, AVDT_CCB_SND_CMD, AVDT_CCB_OPEN_ST},
  avdt_msg_send_cmd(p_ccb, NULL, AVDT_SIG_DISCOVER, NULL);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/avdt/avdt_ccb_act.cc:472:
void avdt_ccb_snd_discover_cmd(AvdtpCcb* p_ccb, tAVDT_CCB_EVT* p_data) {
    //hci 中 发avdtp discover cmd
  avdt_msg_send_cmd(p_ccb, NULL, AVDT_SIG_DISCOVER, NULL);
```


```c

 
  avdt_ccb_event(p_ccb, AVDT_CCB_SENDMSG_EVT, NULL);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/avdt/avdt_msg.cc:1418:
void avdt_msg_send_cmd(AvdtpCcb* p_ccb, void* p_scb, uint8_t sig_id,tAVDT_MSG* p_params) {
    {AVDT_CCB_SND_MSG, AVDT_CCB_IGNORE, AVDT_CCB_OPEN_ST},
  avdt_ccb_event(p_ccb, AVDT_CCB_SENDMSG_EVT, NULL);
```


```c


    if (p_ccb->p_curr_msg != NULL) {
    avdt_ccb_snd_cmd(p_ccb, NULL);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/avdt/avdt_ccb_act.cc:935:
void avdt_ccb_snd_msg(AvdtpCcb* p_ccb, UNUSED_ATTR tAVDT_CCB_EVT* p_data) {
  if (!p_ccb->cong) {
    avdt_ccb_snd_cmd(p_ccb, NULL);
```

```c


    avdt_ccb_snd_cmd(p_ccb, NULL);
      avdt_msg_send(p_ccb, p_msg);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/avdt/avdt_ccb_act.cc:900:
void avdt_ccb_snd_cmd(AvdtpCcb* p_ccb, UNUSED_ATTR tAVDT_CCB_EVT* p_data) {
  if ((!p_ccb->cong) && (p_ccb->p_curr_msg == NULL) &&(p_ccb->p_curr_cmd == NULL)) {
    if (p_msg != NULL) {
      avdt_msg_send(p_ccb, p_msg);
```

```c

    avdt_ad_write_req(AVDT_CHAN_SIG, p_ccb, NULL, p_buf);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/avdt/avdt_msg.cc:1218:
bool avdt_msg_send(AvdtpCcb* p_ccb, BT_HDR* p_msg) {
  while ((!p_ccb->cong) && (p_ccb->p_curr_msg != NULL)) {
      //hci 中avdtp sig channel 发指令
    avdt_ad_write_req(AVDT_CHAN_SIG, p_ccb, NULL, p_buf);

```

```c


  tcid = avdt_ad_type_to_tcid(type, p_scb);
  return L2CA_DataWrite(avdtp_cb.ad.rt_tbl[avdt_ccb_to_idx(p_ccb)][tcid].lcid,p_buf);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/avdt/avdt_ad.cc:489:
uint8_t avdt_ad_write_req(uint8_t type, AvdtpCcb* p_ccb, AvdtpScb* p_scb,BT_HDR* p_buf) {
  return L2CA_DataWrite(avdtp_cb.ad.rt_tbl[avdt_ccb_to_idx(p_ccb)][tcid].lcid,p_buf);
```




```c


    {AVDT_CCB_SND_DISCOVER_CMD, AVDT_CCB_SND_CMD, AVDT_CCB_OPEN_ST},
          (*p_ccb->p_rcb->api.pL2CA_DataInd_Cb)(p_ccb->local_cid,(BT_HDR*)p_data);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/l2cap/l2c_csm.cc:1644:
static void l2c_csm_open(tL2C_CCB* p_ccb, tL2CEVT event, void* p_data) {
  switch (event) {
      //hci 中收到avdtp discover rsp
    case L2CEVT_L2CAP_DATA:
      if (p_data && (p_ccb->p_rcb)) {
        if (p_ccb->p_rcb->api.pL2CA_DataInd_Cb) {
          (*p_ccb->p_rcb->api.pL2CA_DataInd_Cb)(p_ccb->local_cid,(BT_HDR*)p_data);
```


```c


    avdt_l2c_data_ind_cback,
    avdt_ad_tc_data_ind(p_tbl, p_buf);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/avdt/avdt_l2c.cc:448:
void avdt_l2c_data_ind_cback(uint16_t lcid, BT_HDR* p_buf) {
  if (p_tbl != NULL) {
    avdt_ad_tc_data_ind(p_tbl, p_buf);
```

```c


    avdt_ad_tc_data_ind(p_tbl, p_buf);
    avdt_msg_ind(p_ccb, p_buf);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/avdt/avdt_ad.cc:451:
void avdt_ad_tc_data_ind(AvdtpTransportChannel* p_tbl, BT_HDR* p_buf) {
  if (p_tbl->tcid == 0) {
    avdt_msg_ind(p_ccb, p_buf);
```

```c


  tL2CAP_LE_CFG_INFO* p_le_cfg = (tL2CAP_LE_CFG_INFO*)p_data;
          avdt_scb_event(p_scb, evt, &avdt_scb_evt);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/avdt/avdt_msg.cc:1755:
void avdt_msg_ind(AvdtpCcb* p_ccb, BT_HDR* p_buf) {
  if (ok) {
    else {
      if (evt) {
            //avdtp 回调解析   sid 是discover 根据sid 获取event =  AVDT_CCB_MSG_DISCOVER_RSP_EVT 
            解析header
  AVDT_MSG_PRS_HDR(p, label, pkt_type, msg_type);
            解析sig
    AVDT_MSG_PRS_SIG(p, sig);
            解析有几个sep
       msg.hdr.err_code = err =(*avdt_msg_prs_cmd[sig - 1])(&msg, p, p_buf->len); 
      evt = avdt_msg_rsp_2_evt[sig - 1];
    {AVDT_CCB_CHK_CLOSE, AVDT_CCB_HDL_DISCOVER_RSP, AVDT_CCB_OPEN_ST},
      avdt_ccb_event(p_ccb, (uint8_t)(evt & ~AVDT_CCB_MKR), &avdt_ccb_evt);
```

```c


    {AVDT_CCB_CHK_CLOSE, AVDT_CCB_HDL_DISCOVER_RSP, AVDT_CCB_OPEN_ST},
  (*p_ccb->proc_cback)(0, p_ccb->peer_addr, AVDT_DISCOVER_CFM_EVT,(tAVDT_CTRL*)(&p_data->msg.discover_rsp),p_ccb->BtaAvScbIndex());

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/avdt/avdt_ccb_act.cc:242:
void avdt_ccb_hdl_discover_rsp(AvdtpCcb* p_ccb, tAVDT_CCB_EVT* p_data) {
  (*p_ccb->proc_cback)(0, p_ccb->peer_addr, AVDT_DISCOVER_CFM_EVT,(tAVDT_CTRL*)(&p_data->msg.discover_rsp),p_ccb->BtaAvScbIndex());

```

```c


    (*p_ccb->p_conn_cback)(0, p_ccb->peer_addr, AVDT_CONNECT_IND_EVT,
      bta_sys_sendmsg(p_msg);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/av/bta_av_aact.cc:529:
void bta_av_proc_stream_evt(uint8_t handle, const RawAddress& bd_addr,uint8_t event, tAVDT_CTRL* p_data,uint8_t scb_index) {
  if (p_scb) {
    if (p_msg->hdr.event != 0) {
AVDT_DISCOVER_CFM_EVT  == BTA_AV_STR_DISC_OK_EVT
//hci 中avdt 的event 需要经过这个转化成stream 的event
      p_msg->hdr.event = bta_av_stream_evt_ok[event];
      bta_sys_sendmsg(p_msg);
``` 


```c


    BTA_AV_STR_DISC_OK_EVT,      /* AVDT_DISCOVER_CFM_EVT */
          event_handler1 = &bta_av_disc_results;

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/av/bta_av_ssm.cc:205:
static void bta_av_better_stream_state_machine(tBTA_AV_SCB* p_scb,uint16_t event,tBTA_AV_DATA* p_data) {
  switch (p_scb->state) {
    case BTA_AV_OPENING_SST:
      switch (event) {
        case BTA_AV_STR_DISC_OK_EVT:
          event_handler1 = &bta_av_disc_results;
```

```c


          event_handler1 = &bta_av_disc_results;
    bta_av_next_getcap(p_scb, p_data);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/av/bta_av_aact.cc:1770:
void bta_av_disc_results(tBTA_AV_SCB* p_scb, tBTA_AV_DATA* p_data) {
  if (p_scb->num_seps > 0) {
      //hci 中getcapbilities
    bta_av_next_getcap(p_scb, p_data);
```

```c


    bta_av_next_getcap(p_scb, p_data);
      AVDT_GetCapReq(p_scb->PeerAddress(), p_scb->hdi, p_scb->sep_info[i].seid,&p_scb->peer_cap, &bta_av_proc_stream_evt, get_all_cap);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/av/bta_av_aact.cc:379:
static bool bta_av_next_getcap(tBTA_AV_SCB* p_scb, tBTA_AV_DATA* p_data) {
  for (i = p_scb->sep_info_idx; i < p_scb->num_seps; i++) {
    if ((!p_scb->sep_info[i].in_use) &&(p_scb->sep_info[i].tsep == sep_requested) &&(p_scb->sep_info[i].media_type == p_scb->media_type)) {
        //hci 中avdtp get capabilities
      AVDT_GetCapReq(p_scb->PeerAddress(), p_scb->hdi, p_scb->sep_info[i].seid,&p_scb->peer_cap, &bta_av_proc_stream_evt, get_all_cap);
```

```c


      AVDT_GetCapReq(p_scb->PeerAddress(), p_scb->hdi, p_scb->sep_info[i].seid,&p_scb->peer_cap, &bta_av_proc_stream_evt, get_all_cap);
  result = avdt_get_cap_req(bd_addr, channel_index, &getcap);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/avdt/avdt_api.cc:383:
uint16_t AVDT_GetCapReq(const RawAddress& bd_addr, uint8_t channel_index,uint8_t seid, AvdtpSepConfig* p_cfg,tAVDT_CTRL_CBACK* p_cback, bool get_all_cap) {
    getcap.single.sig_id = AVDT_SIG_GETCAP;
  result = avdt_get_cap_req(bd_addr, channel_index, &getcap);
```

```c


  result = avdt_get_cap_req(bd_addr, channel_index, &getcap);
      avdt_ccb_event(p_ccb, AVDT_CCB_API_GETCAP_REQ_EVT, (tAVDT_CCB_EVT*)p_evt);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/avdt/avdt_api.cc:332:
static uint16_t avdt_get_cap_req(const RawAddress& bd_addr,uint8_t channel_index,tAVDT_CCB_API_GETCAP* p_evt) {
  if (result == AVDT_SUCCESS) {
    else {
    {AVDT_CCB_SND_GETCAP_CMD, AVDT_CCB_SND_CMD, AVDT_CCB_OPEN_ST},
      avdt_ccb_event(p_ccb, AVDT_CCB_API_GETCAP_REQ_EVT, (tAVDT_CCB_EVT*)p_evt);
```


```c


  tL2CAP_LE_CFG_INFO* p_le_cfg = (tL2CAP_LE_CFG_INFO*)p_data;
          avdt_scb_event(p_scb, evt, &avdt_scb_evt);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/avdt/avdt_msg.cc:1755:
void avdt_msg_ind(AvdtpCcb* p_ccb, BT_HDR* p_buf) {
  if (ok) {
    else {
      if (evt) {
            //avdtp 回调解析   sid 是discover 根据sid 获取event =  AVDT_CCB_MSG_DISCOVER_RSP_EVT 
            解析header
  AVDT_MSG_PRS_HDR(p, label, pkt_type, msg_type);
            解析sig
    AVDT_MSG_PRS_SIG(p, sig);
            解析有几个sep
    avdt_msg_prs_svccap,       /* get capabilities */
       msg.hdr.err_code = err =(*avdt_msg_prs_cmd[sig - 1])(&msg, p, p_buf->len); 
      evt = avdt_msg_rsp_2_evt[sig - 1];
    AVDT_CCB_MSG_GETCAP_RSP_EVT + AVDT_CCB_MKR,   /* get capabilities */
    {AVDT_CCB_CHK_CLOSE, AVDT_CCB_HDL_GETCAP_RSP, AVDT_CCB_OPEN_ST},
      avdt_ccb_event(p_ccb, (uint8_t)(evt & ~AVDT_CCB_MKR), &avdt_ccb_evt);

``` 

```c


    {AVDT_CCB_CHK_CLOSE, AVDT_CCB_HDL_GETCAP_RSP, AVDT_CCB_OPEN_ST},
  (*p_ccb->proc_cback)(0, p_ccb->peer_addr, AVDT_GETCAP_CFM_EVT,(tAVDT_CTRL*)(&p_data->msg.svccap),p_ccb->BtaAvScbIndex());

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/avdt/avdt_ccb_act.cc:308:
void avdt_ccb_hdl_getcap_rsp(AvdtpCcb* p_ccb, tAVDT_CCB_EVT* p_data) {
  (*p_ccb->proc_cback)(0, p_ccb->peer_addr, AVDT_GETCAP_CFM_EVT,(tAVDT_CTRL*)(&p_data->msg.svccap),p_ccb->BtaAvScbIndex());
```

```c


    (*p_ccb->p_conn_cback)(0, p_ccb->peer_addr, AVDT_GETCAP_CFM_EVT,
      bta_sys_sendmsg(p_msg);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/av/bta_av_aact.cc:529:
void bta_av_proc_stream_evt(uint8_t handle, const RawAddress& bd_addr,uint8_t event, tAVDT_CTRL* p_data,uint8_t scb_index) {
  if (p_scb) {
    if (p_msg->hdr.event != 0) {
AVDT_GETCAP_CFM_EVT  == BTA_AV_STR_GETCAP_OK_EVT
//hci 中avdt 的event 需要经过这个转化成stream 的event
      p_msg->hdr.event = bta_av_stream_evt_ok[event];
      bta_sys_sendmsg(p_msg);
```  

```c


AVDT_GETCAP_CFM_EVT  == BTA_AV_STR_GETCAP_OK_EVT
          event_handler1 = &bta_av_getcap_results;

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/av/bta_av_ssm.cc:212:
static void bta_av_better_stream_state_machine(tBTA_AV_SCB* p_scb,uint16_t event,tBTA_AV_DATA* p_data) {
  switch (p_scb->state) {
    case BTA_AV_OPENING_SST:
      switch (event) {
        case BTA_AV_STR_GETCAP_OK_EVT:
          event_handler1 = &bta_av_getcap_results;
```

```c


  if (A2DP_ParseInfoAac(&cfg_cie, p_codec_info, true) != A2DP_SUCCESS)
    AVDT_OpenReq(p_scb->seps[p_scb->sep_idx].av_handle, p_scb->PeerAddress(),p_scb->hdi, p_scb->sep_info[p_scb->sep_info_idx].seid, &cfg);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/av/bta_av_aact.cc:2078:
void bta_av_getcap_results(tBTA_AV_SCB* p_scb, tBTA_AV_DATA* p_data) {
  if ((p_scb->peer_cap.num_codec != 0) && (media_type == p_scb->media_type) &&(p_scb->p_cos->getcfg(p_scb->hndl, p_scb->PeerAddress(), cfg.codec_info,&p_scb->sep_info_idx, p_info->seid,&cfg.num_protect,cfg.protect_info) == A2DP_SUCCESS)) {
    AVDT_OpenReq(p_scb->seps[p_scb->sep_idx].av_handle, p_scb->PeerAddress(),p_scb->hdi, p_scb->sep_info[p_scb->sep_info_idx].seid, &cfg);
```

```c


    AVDT_OpenReq(p_scb->seps[p_scb->sep_idx].av_handle, p_scb->PeerAddress(),
    avdt_scb_event(p_scb, AVDT_SCB_API_SETCONFIG_REQ_EVT, &evt);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/avdt/avdt_api.cc:484:
uint16_t AVDT_OpenReq(uint8_t handle, const RawAddress& bd_addr,uint8_t channel_index, uint8_t seid,AvdtpSepConfig* p_cfg) {
  if (result == AVDT_SUCCESS) {
 {AVDT_SCB_SND_SETCONFIG_REQ, AVDT_SCB_IGNORE, AVDT_SCB_IDLE_ST},
    avdt_scb_event(p_scb, AVDT_SCB_API_SETCONFIG_REQ_EVT, &evt);

```

```c


 {AVDT_SCB_SND_SETCONFIG_REQ, AVDT_SCB_IGNORE, AVDT_SCB_IDLE_ST},
  avdt_msg_send_cmd(p_scb->p_ccb, p_scb, AVDT_SIG_SETCONFIG, &p_data->msg);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/avdt/avdt_scb_act.cc:1428:
void avdt_scb_snd_setconfig_req(AvdtpScb* p_scb, tAVDT_SCB_EVT* p_data) {
    //hci 中set config req
  avdt_msg_send_cmd(p_scb->p_ccb, p_scb, AVDT_SIG_SETCONFIG, &p_data->msg);
  avdt_ccb_event(p_scb->p_ccb, AVDT_CCB_UL_OPEN_EVT, NULL);
```

```c


  tL2CAP_LE_CFG_INFO* p_le_cfg = (tL2CAP_LE_CFG_INFO*)p_data;
          avdt_scb_event(p_scb, evt, &avdt_scb_evt);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/avdt/avdt_msg.cc:1755:
void avdt_msg_ind(AvdtpCcb* p_ccb, BT_HDR* p_buf) {
  if (ok) {
    else {
      if (evt) {
            //avdtp 回调解析   sid 是discover 根据sid 获取event =  AVDT_CCB_MSG_DISCOVER_RSP_EVT 
            解析header
  AVDT_MSG_PRS_HDR(p, label, pkt_type, msg_type);
            解析sig
    AVDT_MSG_PRS_SIG(p, sig);
      evt = avdt_msg_rsp_2_evt[sig - 1];
      //hci 中收到setconfig rsp
    AVDT_SCB_MSG_SETCONFIG_RSP_EVT 
    {AVDT_SCB_HDL_SETCONFIG_RSP, AVDT_SCB_IGNORE, AVDT_SCB_CONF_ST},
          avdt_scb_event(p_scb, evt, &avdt_scb_evt);

```

```c


    {AVDT_SCB_HDL_SETCONFIG_RSP, AVDT_SCB_IGNORE, AVDT_SCB_CONF_ST},
    avdt_scb_event(p_scb, AVDT_SCB_API_OPEN_REQ_EVT, &avdt_scb_evt);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/avdt/avdt_scb_act.cc:771:
void avdt_scb_hdl_setconfig_rsp(AvdtpScb* p_scb, tAVDT_SCB_EVT* p_data) {
  if (p_scb->p_ccb != NULL) {
    {AVDT_SCB_SND_OPEN_REQ, AVDT_SCB_IGNORE, AVDT_SCB_CONF_ST},
    avdt_scb_event(p_scb, AVDT_SCB_API_OPEN_REQ_EVT, &avdt_scb_evt);
```

```c


    {AVDT_SCB_SND_OPEN_REQ, AVDT_SCB_IGNORE, AVDT_SCB_CONF_ST},
  avdt_msg_send_cmd(p_scb->p_ccb, p_scb, AVDT_SIG_OPEN, &avdt_msg);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/avdt/avdt_scb_act.cc:1249:
void avdt_scb_snd_open_req(AvdtpScb* p_scb, UNUSED_ATTR tAVDT_SCB_EVT* p_data) {
    //hci 中发送openreq
  avdt_msg_send_cmd(p_scb->p_ccb, p_scb, AVDT_SIG_OPEN, &avdt_msg);
```

```c


  tL2CAP_LE_CFG_INFO* p_le_cfg = (tL2CAP_LE_CFG_INFO*)p_data;
          avdt_scb_event(p_scb, evt, &avdt_scb_evt);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/avdt/avdt_msg.cc:1755:
void avdt_msg_ind(AvdtpCcb* p_ccb, BT_HDR* p_buf) {
  if (ok) {
    else {
      if (evt) {
            //avdtp 回调解析   sid 是discover 根据sid 获取event =  AVDT_CCB_MSG_DISCOVER_RSP_EVT 
            解析header
  AVDT_MSG_PRS_HDR(p, label, pkt_type, msg_type);
            解析sig
    AVDT_MSG_PRS_SIG(p, sig);
      evt = avdt_msg_rsp_2_evt[sig - 1];
      //hci 中收到open rsp
    AVDT_SCB_MSG_OPEN_RSP_EVT,                    /* open */
    {AVDT_SCB_HDL_OPEN_RSP, AVDT_SCB_IGNORE, AVDT_SCB_OPENING_ST},
          avdt_scb_event(p_scb, evt, &avdt_scb_evt);

```



```c


    {AVDT_SCB_HDL_OPEN_RSP, AVDT_SCB_IGNORE, AVDT_SCB_OPENING_ST},
  avdt_ad_open_req(AVDT_CHAN_MEDIA, p_scb->p_ccb, p_scb, AVDT_INT);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/avdt/avdt_scb_act.cc:224:
void avdt_scb_hdl_open_rsp(AvdtpScb* p_scb, UNUSED_ATTR tAVDT_SCB_EVT* p_data) {
    //hci 中avdtp 建立数据通路
  avdt_ad_open_req(AVDT_CHAN_MEDIA, p_scb->p_ccb, p_scb, AVDT_INT);
```

```c


  if (type == AVDT_CHAN_SIG) {
    lcid =L2CA_ConnectReq2(AVDT_PSM, p_ccb->peer_addr, BTM_SEC_OUT_AUTHENTICATE);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/avdt/avdt_ad.cc:558:
void avdt_ad_open_req(uint8_t type, AvdtpCcb* p_ccb, AvdtpScb* p_scb,uint8_t role) {
  else {
      //hci 中avdtp 数据通道 l2cap req 
    lcid =L2CA_ConnectReq2(AVDT_PSM, p_ccb->peer_addr, BTM_SEC_OUT_AUTHENTICATE);
```


```c


  avdt_l2c_config_ind_cback(lcid, p_cfg);
      avdt_ad_tc_open_ind(p_tbl);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/avdt/avdt_l2c.cc:338:
void avdt_l2c_config_cfm_cback(uint16_t lcid, uint16_t initiator,tL2CAP_CFG_INFO* p_cfg) {
  if (p_tbl != NULL) {
      //hci 中avdtp数据通道建立完后
    if (p_tbl->state == AVDT_AD_ST_CFG) {
      avdt_ad_tc_open_ind(p_tbl);
```

```c


      avdt_ad_tc_open_ind(p_tbl);
  avdt_scb_event(p_scb, AVDT_SCB_TC_OPEN_EVT, &avdt_scb_evt);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/avdt/avdt_ad.cc:387:
void avdt_ad_tc_open_ind(AvdtpTransportChannel* p_tbl) {
    {AVDT_SCB_HDL_TC_OPEN, AVDT_SCB_IGNORE, AVDT_SCB_OPEN_ST},
  avdt_scb_event(p_scb, AVDT_SCB_TC_OPEN_EVT, &avdt_scb_evt);
```


```c


    {AVDT_SCB_HDL_TC_OPEN, AVDT_SCB_IGNORE, AVDT_SCB_OPEN_ST},
  (*p_scb->stream_config.p_avdt_ctrl_cback)(avdt_scb_to_hdl(p_scb),p_scb->p_ccb ? p_scb->p_ccb->peer_addr : RawAddress::kEmpty, event,(tAVDT_CTRL*)&p_data->open, p_scb->stream_config.scb_index);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/avdt/avdt_scb_act.cc:1023:
void avdt_scb_hdl_tc_open(AvdtpScb* p_scb, tAVDT_SCB_EVT* p_data) {
      event = AVDT_OPEN_CFM_EVT
  (*p_scb->stream_config.p_avdt_ctrl_cback)(avdt_scb_to_hdl(p_scb),p_scb->p_ccb ? p_scb->p_ccb->peer_addr : RawAddress::kEmpty, event,(tAVDT_CTRL*)&p_data->open, p_scb->stream_config.scb_index);
```

```c


    (*p_ccb->p_conn_cback)(0, p_ccb->peer_addr, AVDT_GETCAP_CFM_EVT,
      bta_sys_sendmsg(p_msg);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/av/bta_av_aact.cc:529:
void bta_av_proc_stream_evt(uint8_t handle, const RawAddress& bd_addr,uint8_t event, tAVDT_CTRL* p_data,uint8_t scb_index) {
  if (p_scb) {
    if (p_msg->hdr.event != 0) {
    BTA_AV_STR_OPEN_OK_EVT,      /* AVDT_OPEN_CFM_EVT */
//hci 中avdt 的event 需要经过这个转化成stream 的event
      p_msg->hdr.event = bta_av_stream_evt_ok[event];
      bta_sys_sendmsg(p_msg);
```

```c


    BTA_AV_STR_OPEN_OK_EVT,      /* AVDT_OPEN_CFM_EVT */
          event_handler2 = &bta_av_str_opened;

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/av/bta_av_ssm.cc:221:
static void bta_av_better_stream_state_machine(tBTA_AV_SCB* p_scb,uint16_t event,tBTA_AV_DATA* p_data) {
  switch (p_scb->state) {
      //hci 中a2dp 连接完成
    case BTA_AV_OPENING_SST:
      switch (event) {
        case BTA_AV_STR_OPEN_OK_EVT:
          p_scb->state = BTA_AV_OPEN_SST;
          event_handler1 = &bta_av_st_rc_timer;
          event_handler2 = &bta_av_str_opened;
```

```c


        delay_rc_disc_time = BTA_AV_RC_DISC_TIME_IOT_VAL;
      bta_sys_start_timer(p_scb->avrc_ct_timer, delay_rc_disc_time,BTA_AV_AVRC_TIMER_EVT, p_scb->hndl);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/av/bta_av_aact.cc:340:
void bta_av_st_rc_timer(tBTA_AV_SCB* p_scb, UNUSED_ATTR tBTA_AV_DATA* p_data) {
  log::verbose("rc_handle:{}, use_rc: {}", p_scb->rc_handle, p_scb->use_rc);if ((p_scb->rc_handle == BTA_AV_RC_HANDLE_NONE) &&(p_scb->use_rc || (p_scb->role & BTA_AV_ROLE_AD_ACP))) {
    if ((p_scb->wait & BTA_AV_WAIT_ROLE_SW_BITS) == 0) {
        //hci 中建立个200ms 定时器，去连接avrcp
      bta_sys_start_timer(p_scb->avrc_ct_timer, delay_rc_disc_time,BTA_AV_AVRC_TIMER_EVT, p_scb->hndl);
      定时器到了才会执行
         case BTA_AV_AVRC_TIMER_EVT:
          event_handler1 = &bta_av_open_rc; 
```



```c


          event_handler2 = &bta_av_str_opened;
    (*bta_av_cb.p_cback)(BTA_AV_OPEN_EVT, &bta_av_data);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/av/bta_av_aact.cc:1515:
void bta_av_str_opened(tBTA_AV_SCB* p_scb, tBTA_AV_DATA* p_data) {
  {
    (*bta_av_cb.p_cback)(BTA_AV_OPEN_EVT, &bta_av_data);
```

```c


 
          btif_report_connection_state(peer_.PeerAddress(), BTAV_CONNECTION_STATE_CONNECTED,bt_status_t::BT_STATUS_SUCCESS, BTA_AV_SUCCESS,peer_.IsSource() ? A2dpType::kSink : A2dpType::kSource);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/btif/src/btif_av.cc:2605:
bool BtifAvStateMachine::StateOpening::ProcessEvent(uint32_t event,void* p_data) {
  switch (event) {
    case BTA_AV_OPEN_EVT: {
      if (p_bta_data->open.status == BTA_AV_SUCCESS) {
        if (peer_.a2dp_is_in_rediscovery_process) {
        } else {
            // hci 中告知apk a2dp 连接上了
          btif_report_connection_state(peer_.PeerAddress(), BTAV_CONNECTION_STATE_CONNECTED,bt_status_t::BT_STATUS_SUCCESS, BTA_AV_SUCCESS,peer_.IsSource() ? A2dpType::kSink : A2dpType::kSource);
```


# avrcpint 


- // hci 中a2dp 连接完成后设了一个200ms的定时器 手机主动连接avrcp 做avrcp 的sdp

```c


         case BTA_AV_AVRC_TIMER_EVT:
          event_handler1 = &bta_av_open_rc;

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/av/bta_av_ssm.cc:333:
static void bta_av_better_stream_state_machine(tBTA_AV_SCB* p_scb,uint16_t event,tBTA_AV_DATA* p_data) {
  switch (p_scb->state) {
    case BTA_AV_OPEN_SST:
      switch (event) {
        case BTA_AV_AVRC_TIMER_EVT:
        //hci 中主动做sdp连avrcp
          event_handler1 = &bta_av_open_rc;
```



```c


          event_handler1 = &bta_av_open_rc;
              bluetooth::avrcp::AvrcpService::Get()->ConnectDevice(p_scb->PeerAddress());

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/bta/av/bta_av_aact.cc:3517:
void bta_av_open_rc(tBTA_AV_SCB* p_scb, tBTA_AV_DATA* p_data) {
  if (p_scb->use_rc || (p_scb->role & BTA_AV_ROLE_AD_ACP)) {
    if (bta_av_cb.disc) {
    } else {
      if (btif_av_is_source_enabled() && is_new_avrcp_enabled()) {
        if (bluetooth::avrcp::AvrcpService::Get() != nullptr) {
          if (0 == strncmp(bt_state, "1", 1)) {
              bluetooth::avrcp::AvrcpService::Get()->ConnectDevice(p_scb->PeerAddress());
```

```c


 
  connection_handler_->ConnectDevice(bdaddr);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/btif/avrcp/avrcp_service.cc:547:
void AvrcpService::ConnectDevice(const RawAddress& bdaddr) {
  connection_handler_->ConnectDevice(bdaddr);
```

```c


  connection_handler_ = ConnectionHandler::Get();
  return SdpLookup(bdaddr, base::Bind(connection_lambda, this, bdaddr), false);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/profile/avrcp/connection_handler.cc:199:
bool ConnectionHandler::ConnectDevice(const RawAddress& bdaddr) {
    // hci 中 avrcp sdp 把连接函数instance_->AvrcpConnect(true, bdaddr);  放到sdplookup 的lambda 表达式中
  return SdpLookup(bdaddr, base::Bind(connection_lambda, this, bdaddr), false);
```

```c


 
  return avrc_->FindService(UUID_SERVCLASS_AV_REMOTE_CONTROL, bdaddr,&db_params,base::Bind(&ConnectionHandler::SdpCb,weak_ptr_factory_.GetWeakPtr(), bdaddr,cb, disc_db, retry)) == AVRC_SUCCESS;

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/profile/avrcp/connection_handler.cc:265:
bool ConnectionHandler::SdpLookup(const RawAddress& bdaddr, SdpCallback cb,bool retry) {
  return avrc_->FindService(UUID_SERVCLASS_AV_REMOTE_CONTROL, bdaddr,&db_params,base::Bind(&ConnectionHandler::SdpCb,weak_ptr_factory_.GetWeakPtr(), bdaddr,cb, disc_db, retry)) == AVRC_SUCCESS;
```


```c


  return avrc_->FindService(UUID_SERVCLASS_AV_REMOTE_CONTROL, bdaddr,
    return AVRC_FindService(service_uuid, bd_addr, p_db, p_cback);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/btif/avrcp/avrcp_service.cc:100:
class AvrcpInterfaceImpl : public AvrcpInterface {
  uint16_t FindService(uint16_t service_uuid, const RawAddress& bd_addr,tAVRC_SDP_DB_PARAMS* p_db,tAVRC_FIND_CBACK p_cback) override {
      // hci 中avrcp sdp 
    return AVRC_FindService(service_uuid, bd_addr, p_db, p_cback);
```

```c


system/stack/avrc/avrc_sdp.cc:133:
    result =get_legacy_stack_sdp_api()->service.SDP_ServiceSearchAttributeRequest(bd_addr, p_db->p_db, avrc_sdp_cback);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/avrc/avrc_sdp.cc:187:
uint16_t AVRC_FindService(uint16_t service_uuid, const RawAddress& bd_addr,tAVRC_SDP_DB_PARAMS* p_db,const tAVRC_FIND_CBACK& find_cback) {
  if (result) {

    result =get_legacy_stack_sdp_api()->service.SDP_ServiceSearchAttributeRequest(bd_addr, p_db->p_db, avrc_sdp_cback);
```



```c


    avrc_cb.find_cback = find_cback; 
    result =get_legacy_stack_sdp_api()->service.SDP_ServiceSearchAttributeRequest(bd_addr, p_db->p_db, avrc_sdp_cback);
  avrc_cb.find_cback.Run(status);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/avrc/avrc_sdp.cc:77:
static void avrc_sdp_cback(UNUSED_ATTR const RawAddress& bd_addr,tSDP_STATUS status) {
    // hci 中 获取了sdp 回调到 avrc_sdp_cback 在这里会判断是否sdp 完毕，没完重新发起一次sdp ,完毕就会调用这个find_cback 的回调
  avrc_cb.find_cback.Run(status);
  //hci 中 这里给sdp 回调函数重新赋值
    AVRC_FindService(req.uuid,req.addr,&req.db,req.cb);
```




```c


 
  uint16_t status = avrc_->Open(&handle, &open_cb, bdaddr);
// hci 中扫到avrcp sdp 信息后调用avrcp 连接函数
gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/profile/avrcp/connection_handler.cc:294:
bool ConnectionHandler::AvrcpConnect(bool initiator, const RawAddress& bdaddr) {
  uint16_t status = avrc_->Open(&handle, &open_cb, bdaddr);
```







# avrcpacp

- hci 中耳机主动连接avctp

```c


    avct_l2c_connect_ind_cback,
          if (!p_rcb->api.pL2CA_ConnectInd_Cb) {

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/l2cap/l2c_main.cc:395:
static void process_l2cap_cmd(tL2C_LCB* p_lcb, uint8_t* p, uint16_t pkt_len) {
  while (true) {
    switch (cmd_code) {
        // hci 中手机主动发起连接，耳机主动连接
        //hci 中 手机接到 avctp L2CAP_CONFIGURATION_REQ 
      case L2CAP_CMD_CONN_REQ: {
        if (!p_rcb) {
        } else {
          if (!p_rcb->api.pL2CA_ConnectInd_Cb) {
```


```c


      bta_sys_start_timer(p_scb->avrc_ct_timer, delay_rc_disc_time,BTA_AV_AVRC_TIMER_EVT, p_scb->hndl);
  L2CA_ConnectRsp(bd_addr, id, lcid, result, 0);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/avct/avct_l2c.cc:155:
void avct_l2c_connect_ind_cback(const RawAddress& bd_addr, uint16_t lcid,UNUSED_ATTR uint16_t psm, uint8_t id) {
    //hci 中avctp l2cap  connect rsp 发送 L2CAP_CONNECTION_RSP
  L2CA_ConnectRsp(bd_addr, id, lcid, result, 0);
```

```c


      l2c_csm_execute(p_ccb, L2CEVT_L2CA_CONNECT_RSP, &conn_info);
            l2c_csm_send_config_req(p_ccb);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/l2cap/l2c_csm.cc:1059:
static void l2c_csm_w4_l2ca_connect_rsp(tL2C_CCB* p_ccb, tL2CEVT event,void* p_data) {
  switch (event) {
    case L2CEVT_L2CA_CONNECT_RSP:
      if (p_ccb->p_lcb->transport == BT_TRANSPORT_LE) {
      } else {
        if ((!p_ci) || (p_ci->l2cap_result == L2CAP_CONN_OK)) {
          if (p_ccb->p_rcb->psm == BT_PSM_AVDTP || p_ccb->p_rcb->psm == BT_PSM_AVCTP) {
              //hci 中avctp 发送L2CAP_CONFIGURATION_REQ
            l2c_csm_send_config_req(p_ccb);
```





```c


          STREAM_TO_UINT8(cfg_code, p);
            l2c_csm_execute(p_ccb, L2CEVT_L2CAP_CONFIG_REQ, &cfg_info);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/l2cap/l2c_main.cc:629:
static void process_l2cap_cmd(tL2C_LCB* p_lcb, uint8_t* p, uint16_t pkt_len) {
  while (true) {
    switch (cmd_code) {
      case L2CAP_CMD_CONFIG_REQ: {
        if (p_ccb) {
          if (cfg_rej) {
          } else {
            l2c_csm_execute(p_ccb, L2CEVT_L2CAP_CONFIG_REQ, &cfg_info);
```

```c


  fcr_status = l2c_fcr_process_peer_cfg_req(p_ccb, p_cfg);
      cfg_result = l2cu_process_peer_cfg_req(p_ccb, p_cfg);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/l2cap/l2c_csm.cc:1199:
static void l2c_csm_config(tL2C_CCB* p_ccb, tL2CEVT event, void* p_data) {
  switch (event) {
    case L2CEVT_L2CAP_CONFIG_REQ:
    //hci 中收到对端avdtp config req
 l2c_csm_send_config_rsp_ok(p_ccb,p_cfg->flags & L2CAP_CFG_FLAGS_MASK_CONT); 
```



```c


        l2c_csm_send_config_rsp_ok(p_ccb,
  l2c_csm_execute(p_ccb, L2CEVT_L2CA_CONFIG_RSP, &config);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/l2cap/l2c_csm.cc:192:
static void l2c_csm_send_config_rsp_ok(tL2C_CCB* p_ccb, bool cbit) {
  l2c_csm_execute(p_ccb, L2CEVT_L2CA_CONFIG_RSP, &config);
```


```c


      l2c_csm_config(p_ccb, event, p_data);
      l2cu_send_peer_config_rsp(p_ccb, p_cfg);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/l2cap/l2c_csm.cc:1433:
static void l2c_csm_config(tL2C_CCB* p_ccb, tL2CEVT event, void* p_data) {
  switch (event) {
    case L2CEVT_L2CA_CONFIG_RSP:
      l2cu_send_peer_config_rsp(p_ccb, p_cfg);

```








```c


      l2cu_send_peer_config_rsp(p_ccb, p_cfg);
  p_buf = l2cu_build_header(p_ccb->p_lcb,(uint16_t)(L2CAP_CONFIG_RSP_LEN + cfg_len),L2CAP_CMD_CONFIG_RSP, p_ccb->remote_id);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/l2cap/l2c_utils.cc:751:
void l2cu_send_peer_config_rsp(tL2C_CCB* p_ccb, tL2CAP_CFG_INFO* p_cfg) {
    //hci  中发对端avctp config rsp
  p_buf = l2cu_build_header(p_ccb->p_lcb,(uint16_t)(L2CAP_CONFIG_RSP_LEN + cfg_len),L2CAP_CMD_CONFIG_RSP, p_ccb->remote_id);
```



```c


 
            l2c_csm_execute(p_ccb, L2CEVT_L2CAP_CONFIG_RSP, &cfg_info);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/l2cap/l2c_main.cc:742:
static void process_l2cap_cmd(tL2C_LCB* p_lcb, uint8_t* p, uint16_t pkt_len) {
  while (true) {
    switch (cmd_code) {
      case L2CAP_CMD_CONFIG_RSP: {
        if (p_ccb) {
          if (cfg_info.result == L2CAP_CFG_OK) {
              //hci 中收到对端avctp L2CAP_CONFIGURATION_RSP
            l2c_csm_execute(p_ccb, L2CEVT_L2CAP_CONFIG_RSP, &cfg_info);
```


```c


            l2c_csm_execute(p_ccb, L2CEVT_L2CAP_CONFIG_RSP, &cfg_info);
          (*p_ccb->p_rcb->api.pL2CA_ConfigCfm_Cb)(p_ccb->local_cid, p_ccb->connection_initiator, &p_ccb->peer_cfg);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/l2cap/l2c_csm.cc:1319:
static void l2c_csm_config(tL2C_CCB* p_ccb, tL2CEVT event, void* p_data) {
  switch (event) {
    case L2CEVT_L2CAP_CONFIG_RSP:
      if (p_ccb->config_done & IB_CFG_DONE) {
        if (p_ccb->chnl_state == CST_OPEN && !p_ccb->p_lcb->is_transport_ble()&& (p_ccb->p_rcb->psm == BT_PSM_AVDTP || p_ccb->p_rcb->psm == BT_PSM_AVCTP)&& p_ccb->connection_initiator == L2CAP_INITIATOR_REMOTE) {
            //hci 中avdtp 连接完成了，调用confirm回调
          (*p_ccb->p_rcb->api.pL2CA_ConfigCfm_Cb)(p_ccb->local_cid, p_ccb->connection_initiator, &p_ccb->peer_cfg);
```

```c


pL2CA_ConfigCfm_Cb
      avct_lcb_event(p_lcb, AVCT_LCB_LL_OPEN_EVT, NULL);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/avct/avct_l2c.cc:287:
void avct_l2c_config_cfm_cback(uint16_t lcid, uint16_t initiator,tL2CAP_CFG_INFO* p_cfg) {
  avct_l2c_config_ind_cback(lcid, p_cfg);
  if (p_lcb != NULL) {
    if (p_lcb->ch_state == AVCT_CH_CFG) {
    /* LL_OPEN */ {AVCT_LCB_OPEN_IND, AVCT_LCB_IGNORE, AVCT_LCB_OPEN_ST},
      avct_lcb_event(p_lcb, AVCT_LCB_LL_OPEN_EVT, NULL);
```

```c


    /* LL_OPEN */ {AVCT_LCB_OPEN_IND, AVCT_LCB_IGNORE, AVCT_LCB_OPEN_ST},
          p_ccb->cc.p_ctrl_cback(avct_ccb_to_idx(p_ccb), AVCT_CONNECT_CFM_EVT,0, &p_lcb->peer_addr);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/avct/avct_lcb_act.cc:255:
void avct_lcb_open_ind(tAVCT_LCB* p_lcb, tAVCT_LCB_EVT* p_data) {
  if (btif_av_src_sink_coexist_enabled()) {
    for (i = 0; i < AVCT_NUM_CONN; i++, p_ccb++) {
      if (p_ccb->allocated && (p_ccb->p_lcb == p_lcb)) {
        if (p_ccb->cc.role == AVCT_INT) {
          p_ccb->cc.p_ctrl_cback(avct_ccb_to_idx(p_ccb), AVCT_CONNECT_CFM_EVT,0, &p_lcb->peer_addr);
```

```c


  cc.p_ctrl_cback = avrc_ctrl_cback;         /* Control callback */
    avrc_cb.ccb[handle].ctrl_cback.Run(handle, avrc_event, result, peer_addr);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/avrc/avrc_api.cc:121:
static void avrc_ctrl_cback(uint8_t handle, uint8_t event, uint16_t result,const RawAddress* peer_addr) {
  if (event <= AVRC_MAX_RCV_CTRL_EVT && avrc_cb.ccb[handle].ctrl_cback) {
    AVRC_OPEN_IND_EVT,         /* AVCT_CONNECT_IND_EVT */
    avrc_cb.ccb[handle].ctrl_cback.Run(handle, avrc_event, result, peer_addr);
```


```c


          p_ccb->cc.p_ctrl_cback(avct_ccb_to_idx(p_ccb), AVCT_CONNECT_CFM_EVT,0, &p_lcb->peer_addr);
        AvrcpConnect(false, RawAddress::kAny);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/profile/avrcp/connection_handler.cc:454:
void ConnectionHandler::AcceptorControlCb(uint8_t handle, uint8_t event,uint16_t result,const RawAddress* peer_addr) {
  switch (event) {
      //hci 中接到对端连接avrcp l2cap 指令后，最终调用到avrcpconnect 接口
    case AVRC_OPEN_IND_EVT: {
      connection_cb_.Run(newDevice);
      if (btif_av_src_sink_coexist_enabled() &&btif_av_peer_is_connected_source(*peer_addr)) {
        AvrcpConnect(false, RawAddress::kAny);
```


```c


      connection_cb_.Run(newDevice);
  new_device->RegisterInterfaces(media_interface_, &a2dp_interface_,volume_interface_, player_settings_interface_);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/btif/avrcp/avrcp_service.cc:719:
void AvrcpService::DeviceCallback(std::shared_ptr<Device> new_device) {
    // hci 中重要回调都在这里注册
  new_device->RegisterInterfaces(media_interface_, &a2dp_interface_,volume_interface_, player_settings_interface_);
```


```c


        AvrcpConnect(false, RawAddress::kAny);
  uint16_t status = avrc_->Open(&handle, &open_cb, bdaddr);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/profile/avrcp/connection_handler.cc:294:
bool ConnectionHandler::AvrcpConnect(bool initiator, const RawAddress& bdaddr) {
    // hci 中重点回调，对端连和本端连都会调用这个回调
     open_cb.ctrl_cback = base::Bind(&ConnectionHandler::AcceptorControlCb, weak_ptr_factory_.GetWeakPtr()); 
  uint16_t status = avrc_->Open(&handle, &open_cb, bdaddr);
```

```c


bool ConnectionHandler::Initialize(const ConnectionCallback& callback,
    return AVRC_Open(p_handle, p_ccb, bd_addr);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/btif/avrcp/avrcp_service.cc:105:
class AvrcpInterfaceImpl : public AvrcpInterface {
  uint16_t Open(uint8_t* p_handle, tAVRC_CONN_CB* p_ccb,const RawAddress& bd_addr) override {
    return AVRC_Open(p_handle, p_ccb, bd_addr);
```

```c


    return AVRC_Open(p_handle, p_ccb, bd_addr);
  status = AVCT_CreateConn(p_handle, &cc, peer_addr);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/avrc/avrc_api.cc:1161:
uint16_t AVRC_Open(uint8_t* p_handle, tAVRC_CONN_CB* p_ccb,const RawAddress& peer_addr) {
  status = AVCT_CreateConn(p_handle, &cc, peer_addr);
```

# avrcpprofile
- hci 中p_cb_info.pL2CA_DataInd_Cb  avct_l2c_data_ind_cback

```c


    avct_l2c_data_ind_cback,
    avct_lcb_event(p_lcb, AVCT_LCB_LL_MSG_EVT, (tAVCT_LCB_EVT*)&p_buf);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/avct/avct_l2c.cc:408:
void avct_l2c_data_ind_cback(uint16_t lcid, BT_HDR* p_buf) {
  if (p_lcb != NULL) {
    /* LL_MSG */ {AVCT_LCB_MSG_IND, AVCT_LCB_IGNORE, AVCT_LCB_OPEN_ST},
    avct_lcb_event(p_lcb, AVCT_LCB_LL_MSG_EVT, (tAVCT_LCB_EVT*)&p_buf);
```

```c


    /* LL_MSG */ {AVCT_LCB_MSG_IND, AVCT_LCB_IGNORE, AVCT_LCB_OPEN_ST},
      (*p_ccb->cc.p_msg_cback)(avct_ccb_to_idx(p_ccb), label, cr_ipid,p_data->p_buf);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/avct/avct_lcb_act.cc:693:
void avct_lcb_msg_ind(tAVCT_LCB* p_lcb, tAVCT_LCB_EVT* p_data) {
  if (btif_av_src_sink_coexist_enabled()) {
  } else {
    if (p_ccb) {
      (*p_ccb->cc.p_msg_cback)(avct_ccb_to_idx(p_ccb), label, cr_ipid,p_data->p_buf);
```

```c


system/stack/avrc/avrc_api.cc:718:       █   static void avrc_msg_cback(uint8_t handle, uint8_t label, uint8_t cr,BT_HDR* p_pkt) {     
          drop_code = avrc_proc_far_msg(handle, label, cr, &p_pkt, p_msg);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/avrc/avrc_api.cc:888:
static void avrc_msg_cback(uint8_t handle, uint8_t label, uint8_t cr,BT_HDR* p_pkt) {
  if (((avrc_cb.ccb[handle].control & AVRC_CT_TARGET) && (cr == AVCT_CMD)) ||((avrc_cb.ccb[handle].control & AVRC_CT_CONTROL) && (cr == AVCT_RSP))) {
    switch (opcode) {
      case AVRC_OP_VENDOR: {
        if (p_msg->company_id == AVRC_CO_METADATA) {
          drop_code = avrc_proc_far_msg(handle, label, cr, &p_pkt, p_msg);
```

```c


          drop_code = avrc_proc_far_msg(handle, label, cr, &p_pkt, p_msg);
    p_rsp = avrc_proc_vendor_command(handle, label, *pp_pkt, p_msg);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/avrc/avrc_api.cc:671:
static uint8_t avrc_proc_far_msg(uint8_t handle, uint8_t label, uint8_t cr,BT_HDR** pp_pkt, tAVRC_MSG_VENDOR* p_msg) {
  if (cr == AVCT_CMD) {
    p_rsp = avrc_proc_vendor_command(handle, label, *pp_pkt, p_msg);
```

```c


  open_cb.msg_cback =
    avrc_cb.ccb[handle].msg_cback.Run(handle, label, opcode, &msg);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/avrc/avrc_api.cc:983:
static void avrc_msg_cback(uint8_t handle, uint8_t label, uint8_t cr,BT_HDR* p_pkt) {
  if (!drop) {
    avrc_cb.ccb[handle].msg_cback.Run(handle, label, opcode, &msg);
```

```c


      base::Bind(&ConnectionHandler::MessageCb, weak_ptr_factory_.GetWeakPtr());
  device_map_[handle]->MessageReceived(label, Packet::Parse(pkt));

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/profile/avrcp/connection_handler.cc:625:
void ConnectionHandler::MessageCb(uint8_t handle, uint8_t label, uint8_t opcode,tAVRC_MSG* p_msg) {
    // hci 中 解析avrcp 发过来的包 
  device_map_[handle]->MessageReceived(label, Packet::Parse(pkt));
```




```c


  device_map_[handle]->MessageReceived(label, Packet::Parse(pkt));
      VendorPacketHandler(label, vendor_pkt);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/profile/avrcp/device.cc:1417:
void Device::MessageReceived(uint8_t label, std::shared_ptr<Packet> pkt) {
  switch (pkt->GetOpcode()) {
      // hci 中avrcp 处理vendor 指令在这里，处理passthrough 也是在这个函数
    case Opcode::VENDOR: {
      VendorPacketHandler(label, vendor_pkt);
```

```c


      VendorPacketHandler(label, vendor_pkt);
      HandleGetCapabilities(label,Packet::Specialize<GetCapabilitiesRequest>(pkt));

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/profile/avrcp/device.cc:224:
void Device::VendorPacketHandler(uint8_t label,std::shared_ptr<VendorPacket> pkt) {
  switch (pkt->GetCommandPdu()) {
      //hci 中avrcp get capbilities
    case CommandPdu::GET_CAPABILITIES: {
      HandleGetCapabilities(label,Packet::Specialize<GetCapabilitiesRequest>(pkt));
```

```c


      RegisterNotificationRequestBuilder::MakeBuilder(Event::VOLUME_CHANGED, 0);
      auto response =GetCapabilitiesResponseBuilder::MakeEventsSupportedBuilder(Event::PLAYBACK_STATUS_CHANGED);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/profile/avrcp/device.cc:490:
void Device::HandleGetCapabilities(uint8_t label, const std::shared_ptr<GetCapabilitiesRequest>& pkt) {
  switch (pkt->GetCapabilityRequested()) {
    case Capability::EVENTS_SUPPORTED: {
        // hci 中接到avrcp get capability command 并处理
      auto response =GetCapabilitiesResponseBuilder::MakeEventsSupportedBuilder(Event::PLAYBACK_STATUS_CHANGED);
      //hci 回复对端get capbility rsp
      send_message(label, false, std::move(response));
```

```c


      auto&& callback =base::BindRepeating(&ConnectionHandler::SendMessage,weak_ptr_factory_.GetWeakPtr(), handle); 
    send_message_cb_.Run(label, browse, std::move(message));

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/profile/avrcp/device.h:368:
class Device {
  void send_message(uint8_t label, bool browse,std::unique_ptr<::bluetooth::PacketBuilder> message) {
    send_message_cb_.Run(label, browse, std::move(message));
```

```c


      auto&& callback =base::BindRepeating(&ConnectionHandler::SendMessage,weak_ptr_factory_.GetWeakPtr(), handle); 
  avrc_->MsgReq(handle, label, ctype, pkt);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/profile/avrcp/connection_handler.cc:889:
void ConnectionHandler::SendMessage(uint8_t handle, uint8_t label, bool browse,std::unique_ptr<::bluetooth::PacketBuilder> message) {
  avrc_->MsgReq(handle, label, ctype, pkt);
```

```c


    return AVRC_MsgReq(handle, label, ctype, p_pkt, true);
  status = AVCT_MsgReq(handle, label, cr, p_pkt);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/avrc/avrc_api.cc:1423:
uint16_t AVRC_MsgReq(uint8_t handle, uint8_t label, uint8_t ctype,BT_HDR* p_pkt, bool is_new_avrcp) {
  status = AVCT_MsgReq(handle, label, cr, p_pkt);
```

```c


  status = AVCT_MsgReq(handle, label, cr, p_pkt);
      avct_lcb_event(p_ccb->p_lcb, AVCT_LCB_UL_MSG_EVT, &avct_lcb_evt);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/avct/avct_api.cc:419:
uint16_t AVCT_MsgReq(uint8_t handle, uint8_t label, uint8_t cr, BT_HDR* p_msg) {
  if (result == AVCT_SUCCESS) {
    else {
    /* UL_MSG */ {AVCT_LCB_SEND_MSG, AVCT_LCB_IGNORE, AVCT_LCB_OPEN_ST},
      avct_lcb_event(p_ccb->p_lcb, AVCT_LCB_UL_MSG_EVT, &avct_lcb_evt);
```

```c


    /* UL_MSG */ {AVCT_LCB_SEND_MSG, AVCT_LCB_IGNORE, AVCT_LCB_OPEN_ST},
      if (L2CA_DataWrite(p_lcb->ch_lcid, p_buf) == L2CAP_DW_CONGESTED) {

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/stack/avct/avct_lcb_act.cc:606:
void avct_lcb_send_msg(tAVCT_LCB* p_lcb, tAVCT_LCB_EVT* p_data) {
  while (curr_msg_len != 0) {
    else {
        //hci 中到这里把avrcp get capability rsp 发给对端
      if (L2CA_DataWrite(p_lcb->ch_lcid, p_buf) == L2CAP_DW_CONGESTED) {
```

```c


 
      HandleNotification(label,Packet::Specialize<RegisterNotificationRequest>(pkt));

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/profile/avrcp/device.cc:229:
void Device::VendorPacketHandler(uint8_t label,std::shared_ptr<VendorPacket> pkt) {
  switch (pkt->GetCommandPdu()) {
      // hci avrcp 收到对端注册的EVENT PLAYBACK STATUS CHANGED command
    case CommandPdu::REGISTER_NOTIFICATION: {
      HandleNotification(label,Packet::Specialize<RegisterNotificationRequest>(pkt));
```

```c


      HandleNotification(label,
      media_interface_->GetPlayStatus(base::Bind(&Device::PlaybackStatusNotificationResponse,weak_ptr_factory_.GetWeakPtr(), label, true));

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/profile/avrcp/device.cc:561:
void Device::HandleNotification(uint8_t label, const std::shared_ptr<RegisterNotificationRequest>& pkt) {
  switch (pkt->GetEventRegistered()) {
    case Event::PLAYBACK_STATUS_CHANGED: {
        //hci 中处理注册的 PLAYBACK_STATUS_CHANGED
      media_interface_->GetPlayStatus(base::Bind(&Device::PlaybackStatusNotificationResponse,weak_ptr_factory_.GetWeakPtr(), label, true));
```


```c


    play_pos_changed_ = Notification(true, label);
  auto response =RegisterNotificationResponseBuilder::MakePlaybackStatusBuilder(interim, state_to_send);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/profile/avrcp/device.cc:918:
void Device::PlaybackStatusNotificationResponse(uint8_t label, bool interim,PlayStatus status) {
    //hci 中给EVENT PLAYBACK STATUS CHANGED 注意interim 参数
  auto response =RegisterNotificationResponseBuilder::MakePlaybackStatusBuilder(interim, state_to_send);
```








```c

  //hci 中avrcp sdp 搜索完毕这个 sdp_lambda 接口调用
  cb.Run(status, peer_avrcp_version, peer_features);
 

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/profile/avrcp/connection_handler.cc:521:
void ConnectionHandler::AcceptorControlCb(uint8_t handle, uint8_t event,uint16_t result,const RawAddress* peer_addr) {
  switch (event) {
    case AVRC_OPEN_IND_EVT: {
        // hci avrcp sdp 完都会调用 sdp_lambda 
      auto sdp_lambda = [](ConnectionHandler* instance_, uint8_t handle,uint16_t status, uint16_t version,uint16_t features) {
        if (!btif_av_src_sink_coexist_enabled() ||(btif_av_src_sink_coexist_enabled() &&btif_av_peer_is_connected_sink(device->GetAddress()))) {
            // hci 中所有的avrcp sdp 都回复完了，并且支持绝对音量就执行这个接口
          if (isRemoteAbs) {
            device->RegisterVolumeChanged();
```

```c


            device->RegisterVolumeChanged();
  auto request =RegisterNotificationRequestBuilder::MakeBuilder(Event::VOLUME_CHANGED, 0);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/profile/avrcp/device.cc:652:
void Device::RegisterVolumeChanged() {
    // hci 中手机发送EVENT VOLUME CHANGED的notify
  auto request =RegisterNotificationRequestBuilder::MakeBuilder(Event::VOLUME_CHANGED, 0);
```

```c


 
        HandleVolumeChanged(label, register_notification);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/profile/avrcp/device.cc:203:
void Device::VendorPacketHandler(uint8_t label,std::shared_ptr<VendorPacket> pkt) {
  if (pkt->GetCType() >= CType::ACCEPTED) {
    switch (pkt->GetCommandPdu()) {
      //hci 中收到对端register notify response
      case CommandPdu::REGISTER_NOTIFICATION: {
        HandleVolumeChanged(label, register_notification);
```


```c


        HandleVolumeChanged(label, register_notification);
    volume_interface_->DeviceConnected(GetAddress(),base::Bind(&Device::SetVolume, weak_ptr_factory_.GetWeakPtr()));

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/system/profile/avrcp/device.cc:706:
void Device::HandleVolumeChanged(uint8_t label, const std::shared_ptr<RegisterNotificationResponse>& pkt) {
  if (volume_ == VOL_NOT_SUPPORTED) {
      //注册volume 设备
    volume_interface_->DeviceConnected(GetAddress(),base::Bind(&Device::SetVolume, weak_ptr_factory_.GetWeakPtr()));
```

```c


 
  volumeCallbackMap.emplace(address, cb);

gerrit/ard15/mtk/android_vendor_mediatek_proprietary_packages_modules_Bluetooth/android/app/jni/com_android_bluetooth_avrcp_target.cpp:887:
static void volumeDeviceConnected(const RawAddress& address,::bluetooth::avrcp::VolumeInterface::VolumeChangedCb cb) {
    // hci 中支持绝对音量和不支持绝对音量两者就是绝对音量有协议栈设置过来的音量函数接口，非绝对音量没有
  volumeCallbackMap.emplace(address, cb);
```
