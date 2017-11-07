/*
 Navicat Premium Data Transfer

 Source Server         : develop环境
 Source Server Type    : MySQL
 Source Server Version : 50634
 Source Host           : 101.200.36.159
 Source Database       : phprap

 Target Server Type    : MySQL
 Target Server Version : 50634
 File Encoding         : utf-8

 Date: 11/07/2017 18:30:09 PM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `doc_api`
-- ----------------------------
DROP TABLE IF EXISTS `doc_api`;
CREATE TABLE `doc_api` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `module_id` int(10) NOT NULL DEFAULT '0' COMMENT '模块id',
  `title` varchar(250) NOT NULL DEFAULT '' COMMENT '接口名',
  `method` int(3) NOT NULL DEFAULT '2' COMMENT '请求方法，1:get 2:post 3:put',
  `uri` varchar(250) NOT NULL DEFAULT '' COMMENT '接口地址',
  `intro` varchar(250) NOT NULL DEFAULT '' COMMENT '接口简介',
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '创建者id',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `demo` text COMMENT '演示数据',
  PRIMARY KEY (`id`),
  KEY `module_id_index` (`module_id`),
  KEY `user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='项目接口表';

-- ----------------------------
--  Records of `doc_api`
-- ----------------------------
BEGIN;
INSERT INTO `doc_api` VALUES ('1', '1', '获取商品详情', '1', 'goods/{id}', '', '1', '2017-11-04 21:47:01', null);
COMMIT;

-- ----------------------------
--  Table structure for `doc_apply`
-- ----------------------------
DROP TABLE IF EXISTS `doc_apply`;
CREATE TABLE `doc_apply` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `project_id` int(10) NOT NULL DEFAULT '0' COMMENT '项目id',
  `creater_id` int(10) NOT NULL DEFAULT '0' COMMENT '项目创建者id',
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '申请用户id',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '审核状态',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  KEY `user_id` (`user_id`),
  KEY `creater_id` (`creater_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='申请加入项目表';

-- ----------------------------
--  Table structure for `doc_config`
-- ----------------------------
DROP TABLE IF EXISTS `doc_config`;
CREATE TABLE `doc_config` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `config` text NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统配置表';

-- ----------------------------
--  Records of `doc_config`
-- ----------------------------
BEGIN;
INSERT INTO `doc_config` VALUES ('1', '{\"name\":\"PHPRAP\\u63a5\\u53e3\\u6587\\u6863\\u7ba1\\u7406\\u7cfb\\u7edf\",\"keywords\":\"phprap,apidoc,api\\u6587\\u6863\\u7ba1\\u7406\",\"description\":\"PHPRAP\\uff0c\\u662f\\u4e00\\u4e2aPHP\\u8f7b\\u91cf\\u7ea7\\u5f00\\u6e90API\\u63a5\\u53e3\\u6587\\u6863\\u7ba1\\u7406\\u7cfb\\u7edf\\uff0c\\u81f4\\u529b\\u4e8e\\u51cf\\u5c11\\u524d\\u540e\\u7aef\\u6c9f\\u901a\\u6210\\u672c\\uff0c\\u63d0\\u9ad8\\u56e2\\u961f\\u534f\\u4f5c\\u5f00\\u53d1\\u6548\\u7387\\uff0c\\u6253\\u9020PHP\\u7248\\u7684RAP\\u3002\",\"email\":\"245629560@qq.com\",\"default_password\":\"123456\",\"is_push\":\"1\",\"push_time\":\"3\",\"is_close\":\"0\",\"close_msg\":\"\\u7cfb\\u7edf\\u5347\\u7ea7\\uff0c\\u6682\\u65f6\\u65e0\\u6cd5\\u8bbf\\u95ee\\uff0c\\u8bf7\\u7a0d\\u5019\\u518d\\u8bd5\\uff01\"}', '2017-11-07 17:28:50');
COMMIT;

-- ----------------------------
--  Table structure for `doc_dbbak`
-- ----------------------------
DROP TABLE IF EXISTS `doc_dbbak`;
CREATE TABLE `doc_dbbak` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `file` varchar(250) NOT NULL,
  `size` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '大小，单位KB',
  `add_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `doc_field`
-- ----------------------------
DROP TABLE IF EXISTS `doc_field`;
CREATE TABLE `doc_field` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `api_id` int(10) NOT NULL DEFAULT '0' COMMENT '接口id',
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '创建者用户id',
  `parent_id` int(10) NOT NULL DEFAULT '0' COMMENT '父级id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '接口名称',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '接口标题',
  `type` varchar(10) NOT NULL DEFAULT '' COMMENT '字段类型',
  `method` tinyint(3) NOT NULL DEFAULT '1' COMMENT '参数类型，1:请求字段 2:响应字段',
  `is_required` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否必传',
  `default_value` varchar(250) NOT NULL DEFAULT '' COMMENT '默认值',
  `intro` varchar(250) NOT NULL DEFAULT '' COMMENT '备注',
  `mock` varchar(200) NOT NULL DEFAULT '' COMMENT 'mock规则',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `api_id_index` (`api_id`),
  KEY `user_id_index` (`user_id`),
  KEY `parent_id_index` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='项目字段表';

-- ----------------------------
--  Records of `doc_field`
-- ----------------------------
BEGIN;
INSERT INTO `doc_field` VALUES ('1', '1', '1', '0', 'code', '返回状态码', 'number', '2', '0', '239', '', 'number|200-300', '2017-11-01 02:07:50'), ('3', '1', '1', '0', 'msg', '返回信息', 'string', '2', '0', '成功消息216', '', 'message|success', '2017-11-03 16:52:02'), ('4', '1', '3', '0', 'data', '数据实体', 'array', '2', '0', '', '', '', '2017-11-03 17:12:54'), ('5', '1', '1', '4', 'name', '商品名称', 'string', '2', '0', '华为（HUAWEI）B3智能手环 运动计步蓝牙通话男女手表 B2升级版 领券-摩卡棕-选商务版 商务版', '', 'goods|name', '2017-11-03 17:13:07'), ('6', '1', '1', '4', 'desc', '商品描述', 'string', '2', '0', '红米5A轻巧手感，5英寸屏幕，高通骁龙处理器，1300万摄像头', '', 'goods|desc', '2017-11-03 17:39:51'), ('7', '1', '1', '0', 'goodsId', '商品id', 'number', '1', '1', '0', '', '', '2017-11-04 21:52:42'), ('8', '1', '1', '4', 'price', '商品价格', 'float', '2', '0', '02.29', '', 'price|2', '2017-11-04 21:55:34'), ('9', '1', '1', '4', 'cover', '商品封面', 'string', '2', '0', 'https://dummyimage.com/200x200/', '', 'image|200x200', '2017-11-04 21:58:28');
COMMIT;

-- ----------------------------
--  Table structure for `doc_login_log`
-- ----------------------------
DROP TABLE IF EXISTS `doc_login_log`;
CREATE TABLE `doc_login_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '用户id',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名称',
  `user_email` varchar(50) NOT NULL DEFAULT '' COMMENT '用户邮箱',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT '登录ip',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '登录地址',
  `device` varchar(50) NOT NULL DEFAULT '' COMMENT '登录设备',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='登录日志表';

-- ----------------------------
--  Table structure for `doc_member`
-- ----------------------------
DROP TABLE IF EXISTS `doc_member`;
CREATE TABLE `doc_member` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `project_id` int(10) NOT NULL DEFAULT '0' COMMENT '项目id',
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '用户id',
  `project_rule` varchar(50) NOT NULL DEFAULT '' COMMENT '项目权限',
  `module_rule` varchar(50) NOT NULL DEFAULT '' COMMENT '权限',
  `api_rule` varchar(50) NOT NULL DEFAULT '' COMMENT '接口权限',
  `member_rule` varchar(50) NOT NULL DEFAULT '' COMMENT '成员权限',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`) USING BTREE,
  KEY `project_id_index` (`project_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目成员表';

-- ----------------------------
--  Table structure for `doc_module`
-- ----------------------------
DROP TABLE IF EXISTS `doc_module`;
CREATE TABLE `doc_module` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `project_id` int(10) NOT NULL DEFAULT '0' COMMENT '项目id',
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '创建者id',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '模块名称',
  `intro` varchar(255) NOT NULL DEFAULT '' COMMENT '项目描述',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `project_id_index` (`project_id`),
  KEY `user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='项目模块表';

-- ----------------------------
--  Records of `doc_module`
-- ----------------------------
BEGIN;
INSERT INTO `doc_module` VALUES ('1', '1', '1', '商品模块', '商品相关接口', '0', '2017-11-04 21:46:17');
COMMIT;

-- ----------------------------
--  Table structure for `doc_notify`
-- ----------------------------
DROP TABLE IF EXISTS `doc_notify`;
CREATE TABLE `doc_notify` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '申请者id',
  `user_name` varchar(250) NOT NULL DEFAULT '' COMMENT '用户名',
  `project_id` int(10) NOT NULL DEFAULT '0' COMMENT '项目id',
  `to_user_id` int(10) NOT NULL DEFAULT '0' COMMENT '通知者id',
  `type` varchar(10) NOT NULL,
  `message` varchar(250) NOT NULL DEFAULT '',
  `is_readed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否读过',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  KEY `to_user_id` (`to_user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息通知表';

-- ----------------------------
--  Table structure for `doc_project`
-- ----------------------------
DROP TABLE IF EXISTS `doc_project`;
CREATE TABLE `doc_project` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT '0' COMMENT '创建者id',
  `title` varchar(255) NOT NULL COMMENT '项目标题',
  `intro` varchar(255) NOT NULL COMMENT '项目描述',
  `envs` text NOT NULL COMMENT '环境域名,json字符串',
  `allow_search` tinyint(3) NOT NULL DEFAULT '1' COMMENT '是否允许被搜索到',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `sort` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='项目表';

-- ----------------------------
--  Records of `doc_project`
-- ----------------------------
BEGIN;
INSERT INTO `doc_project` VALUES ('1', '1', '测试项目', '测试专用项目', '[{\"name\":\"product\",\"title\":\"\\u751f\\u4ea7\\u73af\\u5883\",\"domain\":\"http:\\/\\/phprap.gouguoyin.cn\"},{\"name\":\"develop\",\"title\":\"\\u5f00\\u53d1\\u73af\\u5883\",\"domain\":\"http:\\/\\/demo.gouguoyin.cn\"}]', '1', '2017-11-04 21:45:53', '2017-11-04 21:50:32', '0');
COMMIT;

-- ----------------------------
--  Table structure for `doc_project_log`
-- ----------------------------
DROP TABLE IF EXISTS `doc_project_log`;
CREATE TABLE `doc_project_log` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `project_id` int(1) NOT NULL DEFAULT '0' COMMENT '项目id',
  `user_id` int(10) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `type` varchar(10) NOT NULL COMMENT '操作类型',
  `object` varchar(20) NOT NULL,
  `content` text NOT NULL COMMENT '对象',
  `add_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `project_title` varchar(200) DEFAULT NULL,
  `module_title` varchar(50) DEFAULT NULL,
  `api_name` varchar(200) DEFAULT NULL,
  `field_name` varchar(200) DEFAULT NULL,
  `member_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`,`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `doc_user`
-- ----------------------------
DROP TABLE IF EXISTS `doc_user`;
CREATE TABLE `doc_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(50) NOT NULL DEFAULT '' COMMENT '密码',
  `type` tinyint(3) NOT NULL DEFAULT '1' COMMENT '1:用户 2:管理员',
  `status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '状态',
  `ip` varchar(250) NOT NULL DEFAULT '' COMMENT '注册ip',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '注册地址',
  `device` varchar(255) NOT NULL DEFAULT '' COMMENT '登录设备',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='会员表';


SET FOREIGN_KEY_CHECKS = 1;
