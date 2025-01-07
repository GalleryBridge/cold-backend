SET NAMES utf8mb4;
SET
    FOREIGN_KEY_CHECKS = 0;
# 用户库
DROP database IF EXISTS `cold-user`;
CREATE database if NOT EXISTS `cold-user` default character set utf8mb4 collate utf8mb4_general_ci;
use `cold-user`;
# 用户表
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`
(
    `user_id`        bigint(20)   NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `username`       varchar(50)  NOT NULL COMMENT '用户名',
    `password`       varchar(100) NOT NULL COMMENT '密码',
    `salt`           varchar(20) COMMENT '加密盐',
    `email`          varchar(100) COMMENT '邮箱',
    `mobile`         varchar(100) COMMENT '手机号',
    `status`         varchar(100) COMMENT '状态(0: 禁用 1: 正常)',
    `create_user_id` bigint(20) COMMENT '创建者ID',
    `create_time`    datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY (`user_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

#Token表
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token`
(
    `user_id`     bigint(20)   NOT NULL AUTO_INCREMENT COMMENT '自增ID',
    `token`       varchar(100) NOT NULL COMMENT 'token',
    `expire_time` datetime COMMENT '过期时间',
    `update_time` datetime     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`user_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

#业务库
CREATE database if NOT EXISTS `cold-server` default character set utf8mb4 collate utf8mb4_general_ci;
use `cold-server`;

# 公司表
DROP TABLE IF EXISTS `cold_company`;
CREATE TABLE `cold_company`
(
    `id`              varchar(50)  NOT NULL AUTO_INCREMENT COMMENT '自增ID',
    `company`         varchar(100) NOT NULL COMMENT '公司名称',
    `abbreviation`    varchar(50) COMMENT '公司简称',
    `companyNumber`   varchar(50) COMMENT '企业编号',
    `companyAddress`  varchar(100) COMMENT '企业地址',
    `companyPhone`    varchar(20) COMMENT '公司电话',
    `managementName`  varchar(50) COMMENT '质量管理员',
    `managementPhone` varchar(20) COMMENT '联系电话',
    `leader`          varchar(50) COMMENT '负责人姓名',
    `leaderPhone`     varchar(20) COMMENT '负责人电话',
    `message`         varchar(255) COMMENT '备注',
    `webAddress`      varchar(100) COMMENT '网站',
    `companyType`     varchar(20) COMMENT '企业类型',
    `createdTime`     timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updateTime`      timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

# 仓库表
DROP TABLE IF EXISTS `cold_warehouse`;
CREATE TABLE `cold_warehouse`
(
    `id`            varchar(50) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
    `houseCode`     varchar(50) NOT NULL COMMENT '仓库编码',
    `houseName`     varchar(100) COMMENT '仓库名称',
    `houseAddress`  varchar(255) COMMENT '仓库地址',
    `houseType`     int(2) COMMENT '库房类型 1-冷库 2-恒温',
    `companyId`     varchar(50) COMMENT '所属公司ID',
    `companyName`   varchar(100) COMMENT '公司名称',
    `principalName` varchar(100) COMMENT '负责人',
    `principalTel`  varchar(20) COMMENT '负责人电话',
    `longitude`     decimal(10, 6) COMMENT '经度',
    `latitude`      decimal(10, 6) COMMENT '纬度',
    `areaSize`      double(6, 0) COMMENT '库房面积',
    `houseStatus`   int(2) COMMENT '状态 1-正常 0 空库',
    `createTime`    timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updateTime`    timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

# 主机表
DROP TABLE IF EXISTS `cold_host`;
CREATE TABLE `cold_host`
(
    `id`         varchar(50) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
    `hostCode`   varchar(50) NOT NULL COMMENT '主机编码',
    `hostName`   varchar(50) COMMENT '主机名称',
    `houseId`    varchar(50) COMMENT '仓库ID',
    `houseCode`  varchar(50) COMMENT '仓库编码',
    `houseName`  varchar(50) COMMENT '仓库名称',
    `hostStatus` varchar(2) COMMENT '主机状态: 1-正常 0-停用',
    `hostModel`  varchar(50) COMMENT '设备型号',
    `simCode`    varchar(50) COMMENT 'sim卡号',
    `createTime` timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updateTime` timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

# 设备表
DROP TABLE IF EXISTS `cold_monitor`;
CREATE TABLE `cold_monitor`
(
    `id`           varchar(50) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
    `userName`     varchar(50) COMMENT '人员姓名',
    `userPhone`    varchar(20) COMMENT '人员电话',
    `monitorState` varchar(20) COMMENT '预警类型，0:温湿度，1:温度，2:湿度',
    `hostId`       varchar(50) COMMENT '预警的主机Id',
    `hostCode`     varchar(50) COMMENT '预警的主机编码',
    `hostName`     varchar(50) COMMENT '预警的主机名称',
    `createTime`   timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`  timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

# 实时指标表
DROP TABLE IF EXISTS `cold_message_realtime`;
CREATE TABLE `cold_message_realtime`
(

    `meterCode`   varchar(50) NOT NULL COMMENT '设备编码',
    `meterId`     varchar(50) COMMENT '设备ID',
    `meterName`   varchar(100) COMMENT '设备名称',
    `hostId`      varchar(50) COMMENT '主机ld',
    `hostCode`    varchar(50) COMMENT '主机编码',
    `hostName`    varchar(100) COMMENT '主机名称',
    `houseId`     varchar(50) COMMENT '仓库ld',
    `houseCode`   varchar(50) COMMENT '仓库编码',
    `houseName`   varchar(100) COMMENT '仓库名称',
    `companyId`   varchar(50) COMMENT '公司ld',
    `companyName` varchar(100) COMMENT '公司名称',
    `tem`         int(5) COMMENT '温度',
    `maxTem`      int(5) COMMENT '温度上限',
    `minTem`      int(5) COMMENT '温度下限',
    `hum`         int(5) COMMENT '湿度',
    `maxHum`      int(5) COMMENT '湿度上限',
    `minHum`      int(5) COMMENT '湿度下限',
    `temAlert`    int(5) COMMENT '温度状况:1:高温，0:正常 ， -1:低温',
    `humAlert`    int(5) COMMENT '湿度状况:1:高湿，0:正常 ， -1:低湿',
    `state`       int(5) COMMENT '设备状态: 1-在用，0-停用，2-异常',
    `lon`         varchar(30) COMMENT '经度',
    `lat`         varchar(30) COMMENT '纬度',
    `curtime`     varchar(50) COMMENT '提交时间',
    `createTime`  timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY (`meterCode`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

# 定时任务库
CREATE database if NOT EXISTS `cold-job` default character set utf8mb4 collate utf8mb4_general_ci;
use `cold-job`;

# CRON 触发器
# 存储触发器的cron表达式表
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS`
(
    `SCHED_NAME`      varchar(120) NOT NULL COMMENT '调度名称',
    `TRIGGER_NAME`    varchar(200) NOT NULL COMMENT '触发器名称',
    `TRIGGER_GROUP`   varchar(200) NOT NULL COMMENT '触发器分组名称',
    `CRON_EXPRESSION` varchar(120) NOT NULL COMMENT 'CRON表达式',
    `TIME_ZONE_ID`    varchar(80) COMMENT '时区',
    PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

# 启动的触发器
# 存储已触发的 Trigger 相关的状态信息，以及相关job的执行信息
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS`
(
    `SCHED_NAME`        varchar(120) COMMENT '调度名称',
    `ENTRY_ID`          varchar(95) COMMENT '实例名称',
    `TRIGGER_NAME`      varchar(200) COMMENT '触发器名称',
    `TRIGGER_GROUP`     varchar(200) COMMENT '触发器分组名称',
    `INSTANCE_NAME`     varchar(200) COMMENT '示例名称',
    `FIRED_TIME`        bigint(13) COMMENT '启动时间',
    `SCHED_TIME`        bigint(13) COMMENT '执行时间',
    `PRIORITY`          bigint(11) COMMENT '优先级',
    `STATE`             varchar(16) COMMENT '状态',
    `JOB_NAME`          varchar(200) COMMENT '任务名称',
    `JOB_GROUP`         varchar(200) COMMENT '任务分组名称',
    `IS_NONCONCURRENT`  varchar(1) COMMENT '是否立即执行',
    `REQUESTS_RECOVERY` varchar(1) COMMENT '恢复标识'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

# 任务详情
# 存储每一个已配置的obDetail 的详细信息
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS`
(
    `SCHED_NAME`        varchar(120) NOT NULL COMMENT '调度名称',
    `JOB_NAME`          varchar(200) NOT NULL COMMENT '任务名称',
    `JOB_GROUP`         varchar(200) NOT NULL COMMENT '任务分组名称',
    `DESCRIPTION`       varchar(250) COMMENT '描述信息',
    `JOB_CLASS_NAME`    varchar(250) NOT NULL COMMENT '任务的类名称',
    `IS_DURABLE`        varchar(1)   NOT NULL COMMENT '是否持久化',
    `IS_NONCONCURRENT`  varchar(1)   NOT NULL COMMENT '是否并发',
    `IS_UPDATE_DATA`    varchar(1)   NOT NULL COMMENT '是否更新数据',
    `REQUESTS_RECOVERY` varchar(1)   NOT NULL COMMENT '是否接受恢复执行，默认为false ，设置了RequestsRecovery为true，则该job会被重新执行',
    `JOB_DATA`          blob COMMENT '存放持久化job对象',
    PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

# 锁表
# 存储程序的悲观锁的信息(假如使用了悲观锁)
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS`
(
    `SCHED NAME` varchar(120) COMMENT '调度名称',
    `LOCK_NAME`  varchar(40) COMMENT '悲观锁名称'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

# 调度状态表
# 存储集群中note实例信息，quartz会定时读取该表的信息判断集群中每个实例的当前状态。
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE`
(
    `SCHED_NAME`        varchar(120) COMMENT '调度名称',
    `INSTANCE_NAME`     varchar(200) COMMENT '实例名称， 配置文件中org.quartz.scheduler.instar',
    `LAST_CHECKIN_TIME` bigint(13) COMMENT '上次检查时间',
    `CHECKIN_INTERVAL`  bigint(13) COMMENT '检查间隔时间',
    PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

# 简单触发器表
# 存储简单的 Trigger，包括重复次数，间隔，以及已触发的次数。
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS`
(
    `SCHED_NAME`      varchar(120) COMMENT '调度名称',
    `TRIGGER_NAME`    varchar(200) COMMENT 'qrtz_triggers表trigger_name的外键',
    `TRIGGER_GROUP`   varchar(200) COMMENT 'qrtz_triggers表trigger_group的外键',
    `REPEAT_COUNT`    bigint(7) COMMENT '重复的次数统计',
    `REPEAT_INTERVAL` bigint(12) COMMENT '重复的间隔时间',
    `TIMES_TRIGGERED` bigint(10) COMMENT '已经触发的次数',
    PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

# 触发器表
# 保存触发器的基础信息
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS`
(
    `SCHED_NAME`     varchar(120) COMMENT '调度名称',
    `TRIGGER_NAME`   varchar(200) COMMENT '触发器的名字',
    `TRIGGER_GROUP`  varchar(200) COMMENT '触发器所属组的名字',
    `JOB_NAME`       varchar(200) COMMENT 'grtz_job_details表job_name的外键',
    `JOB_GROUP`      varchar(200) COMMENT 'grtz_job_details表job_group的外键',
    `DESCRIPTION`    varchar(250) COMMENT '描述信息',
    `NEXT_FIRE_TIME` bigint(13) COMMENT '下一次触发时间，默认为-1，意味不会自动触发',
    `PREV_FIRE_TIME` bigint(13) COMMENT '上一次触发时间(毫秒)',
    `PRIORITY`       int(11) COMMENT '优先级',
    `TRIGGER_STATE`  varchar(16) COMMENT '当前触发器状态，设置为ACQUIRED,如果设置为WAITING,则job不会触发(WAITING:等待 PAUSED暂停ACQUIRED:正常执行BLOCKED:阻塞ERROR错误)',
    `TRIGGER_TYPE`   varchar(8) COMMENT '触发器的类型，使用cron表达式',
    `START_TIME`     bigint(13) COMMENT '开始时间',
    `END_TIME`       bigint(13) COMMENT '结束时间',
    `CALENDAR_NAME`  varchar(200) COMMENT '日程表名称，表grtz_calendars的calendar_name字段外键',
    `MISFIRE_INSTR`  smallint(2) COMMENT '措施或者是补偿执行的策略',
    `JOB_DATA`       blob COMMENT 'blob字段，存放持久化job对象',
    PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

# 暂停的触发器组
# 存储已暂停的 Trigger 组的信息
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE`
(
    `SCHED_NAME`    varchar(120) COMMENT '调度名称',
    `TRIGGER_GROUP` varchar(200) COMMENT 'grtz_triggers表trigger_group的外键',
    PRIMARY KEY (`SCHED_NAME`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

# 调度表
# 调度任务实例
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job`
(
    `job_id`          bigint(20) COMMENT '任务id',
    `bean_name`       varchar(200) COMMENT 'spring bean名称',
    `params`          varchar(2000) COMMENT '参数',
    `cron_expression` varchar(100) COMMENT 'cron表达式',
    `status`          tinyint(4) COMMENT '任务状态 0:正常 1:暂停',
    `remark`          varchar(255) COMMENT '备注',
    `create_time`     datetime COMMENT '创建时间',
    PRIMARY KEY (`job_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

# 调度日志表
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log`
(
    `log_id`      bigint(20) COMMENT '任务日志id',
    `job_id`      bigint(20) COMMENT '任务id ',
    `bean_name`   varchar(200) COMMENT 'spring bean名称',
    `params`      varchar(2000) COMMENT '参数',
    `status`      tinyint(4) COMMENT '任务状态 0:成功 1:失败',
    `error`       varchar(2000) COMMENT '失败信息',
    `times`       int(11) COMMENT '耗时(单位:毫秒)',
    `create_time` datetime COMMENT '创建时间',
    PRIMARY KEY (`log_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;




