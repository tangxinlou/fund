/*******************************************************
$Author       : 唐新楼 
$Last modified: 2025-05-26 12:49
$Email        : 个人邮箱
$blog         : https://blog.csdn.net/daweigongting
$Filename     : system.md
$Description  : tangxinlou
*******************************************************/
特性 VxWorks linux
内核类型 微内核（核心精简，附加功能模块化）	宏内核（核心庞大，功能内聚）
实时性	硬实时（任务切换延迟低至微秒级）	软实时（需实时补丁如 PREEMPT_RT）
可裁剪性	高度可裁剪（Wind River 工具链）	通过配置裁剪（Kconfig，模块化）
任务调度	优先级抢占调度（确定性优先）	CFS 公平调度（兼顾公平与实时性）
