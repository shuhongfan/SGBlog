/*
SQLyog v10.2 
MySQL - 5.5.40 : Database - sg_blog
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sg_blog` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `sg_blog`;

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `is_frame` int(1) DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  `del_flag` char(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2034 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`is_frame`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`,`del_flag`) values (1,'系统管理',0,1,'system',NULL,1,'M','0','0','','system',0,'2021-11-12 10:46:19',0,NULL,'系统管理目录','0'),(100,'用户管理',1,1,'user','system/user/index',1,'C','0','0','system:user:list','user',0,'2021-11-12 10:46:19',1,'2022-07-31 15:47:58','用户管理菜单','0'),(101,'角色管理',1,2,'role','system/role/index',1,'C','0','0','system:role:list','peoples',0,'2021-11-12 10:46:19',0,NULL,'角色管理菜单','0'),(102,'菜单管理',1,3,'menu','system/menu/index',1,'C','0','0','system:menu:list','tree-table',0,'2021-11-12 10:46:19',0,NULL,'菜单管理菜单','0'),(1001,'用户查询',100,1,'','',1,'F','0','0','system:user:query','#',0,'2021-11-12 10:46:19',0,NULL,'','0'),(1002,'用户新增',100,2,'','',1,'F','0','0','system:user:add','#',0,'2021-11-12 10:46:19',0,NULL,'','0'),(1003,'用户修改',100,3,'','',1,'F','0','0','system:user:edit','#',0,'2021-11-12 10:46:19',0,NULL,'','0'),(1004,'用户删除',100,4,'','',1,'F','0','0','system:user:remove','#',0,'2021-11-12 10:46:19',0,NULL,'','0'),(1005,'用户导出',100,5,'','',1,'F','0','0','system:user:export','#',0,'2021-11-12 10:46:19',0,NULL,'','0'),(1006,'用户导入',100,6,'','',1,'F','0','0','system:user:import','#',0,'2021-11-12 10:46:19',0,NULL,'','0'),(1007,'重置密码',100,7,'','',1,'F','0','0','system:user:resetPwd','#',0,'2021-11-12 10:46:19',0,NULL,'','0'),(1008,'角色查询',101,1,'','',1,'F','0','0','system:role:query','#',0,'2021-11-12 10:46:19',0,NULL,'','0'),(1009,'角色新增',101,2,'','',1,'F','0','0','system:role:add','#',0,'2021-11-12 10:46:19',0,NULL,'','0'),(1010,'角色修改',101,3,'','',1,'F','0','0','system:role:edit','#',0,'2021-11-12 10:46:19',0,NULL,'','0'),(1011,'角色删除',101,4,'','',1,'F','0','0','system:role:remove','#',0,'2021-11-12 10:46:19',0,NULL,'','0'),(1012,'角色导出',101,5,'','',1,'F','0','0','system:role:export','#',0,'2021-11-12 10:46:19',0,NULL,'','0'),(1013,'菜单查询',102,1,'','',1,'F','0','0','system:menu:query','#',0,'2021-11-12 10:46:19',0,NULL,'','0'),(1014,'菜单新增',102,2,'','',1,'F','0','0','system:menu:add','#',0,'2021-11-12 10:46:19',0,NULL,'','0'),(1015,'菜单修改',102,3,'','',1,'F','0','0','system:menu:edit','#',0,'2021-11-12 10:46:19',0,NULL,'','0'),(1016,'菜单删除',102,4,'','',1,'F','0','0','system:menu:remove','#',0,'2021-11-12 10:46:19',0,NULL,'','0'),(2017,'内容管理',0,4,'content',NULL,1,'M','0','0',NULL,'table',NULL,'2022-01-08 02:44:38',1,'2022-07-31 12:34:23','','0'),(2018,'分类管理',2017,1,'category','content/category/index',1,'C','0','0','content:category:list','example',NULL,'2022-01-08 02:51:45',NULL,'2022-01-08 02:51:45','','0'),(2019,'文章管理',2017,0,'article','content/article/index',1,'C','0','0','content:article:list','build',NULL,'2022-01-08 02:53:10',NULL,'2022-01-08 02:53:10','','0'),(2021,'标签管理',2017,6,'tag','content/tag/index',1,'C','0','0','content:tag:index','button',NULL,'2022-01-08 02:55:37',NULL,'2022-01-08 02:55:50','','0'),(2022,'友链管理',2017,4,'link','content/link/index',1,'C','0','0','content:link:list','404',NULL,'2022-01-08 02:56:50',NULL,'2022-01-08 02:56:50','','0'),(2023,'写博文',0,0,'write','content/article/write/index',1,'C','0','0','content:article:writer','build',NULL,'2022-01-08 03:39:58',1,'2022-07-31 22:07:05','','0'),(2024,'友链新增',2022,0,'',NULL,1,'F','0','0','content:link:add','#',NULL,'2022-01-16 07:59:17',NULL,'2022-01-16 07:59:17','','0'),(2025,'友链修改',2022,1,'',NULL,1,'F','0','0','content:link:edit','#',NULL,'2022-01-16 07:59:44',NULL,'2022-01-16 07:59:44','','0'),(2026,'友链删除',2022,1,'',NULL,1,'F','0','0','content:link:remove','#',NULL,'2022-01-16 08:00:05',NULL,'2022-01-16 08:00:05','','0'),(2027,'友链查询',2022,2,'',NULL,1,'F','0','0','content:link:query','#',NULL,'2022-01-16 08:04:09',NULL,'2022-01-16 08:04:09','','0'),(2028,'导出分类',2018,1,'',NULL,1,'F','0','0','content:category:export','#',NULL,'2022-01-21 07:06:59',NULL,'2022-01-21 07:06:59','','0');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`role_name`,`role_key`,`role_sort`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values (1,'超级管理员','admin',1,'0','0',0,'2021-11-12 10:46:19',0,NULL,'超级管理员'),(2,'普通角色','common',2,'0','0',0,'2021-11-12 10:46:19',0,'2022-01-01 22:32:58','普通角色'),(11,'嘎嘎嘎','aggag',5,'0','0',NULL,'2022-01-06 14:07:40',NULL,'2022-01-07 03:48:48','嘎嘎嘎'),(12,'友链审核员','link',1,'0','0',NULL,'2022-01-16 06:49:30',NULL,'2022-01-16 08:05:09',NULL);

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`role_id`,`menu_id`) values (0,0),(2,1),(2,102),(2,1013),(2,1014),(2,1015),(2,1016),(2,2000),(3,2),(3,3),(3,4),(3,100),(3,101),(3,103),(3,104),(3,105),(3,106),(3,107),(3,108),(3,109),(3,110),(3,111),(3,112),(3,113),(3,114),(3,115),(3,116),(3,500),(3,501),(3,1001),(3,1002),(3,1003),(3,1004),(3,1005),(3,1006),(3,1007),(3,1008),(3,1009),(3,1010),(3,1011),(3,1012),(3,1017),(3,1018),(3,1019),(3,1020),(3,1021),(3,1022),(3,1023),(3,1024),(3,1025),(3,1026),(3,1027),(3,1028),(3,1029),(3,1030),(3,1031),(3,1032),(3,1033),(3,1034),(3,1035),(3,1036),(3,1037),(3,1038),(3,1039),(3,1040),(3,1041),(3,1042),(3,1043),(3,1044),(3,1045),(3,1046),(3,1047),(3,1048),(3,1049),(3,1050),(3,1051),(3,1052),(3,1053),(3,1054),(3,1055),(3,1056),(3,1057),(3,1058),(3,1059),(3,1060),(3,2000),(11,1),(11,100),(11,101),(11,102),(11,103),(11,104),(11,105),(11,106),(11,107),(11,108),(11,500),(11,501),(11,1001),(11,1002),(11,1003),(11,1004),(11,1005),(11,1006),(11,1007),(11,1008),(11,1009),(11,1010),(11,1011),(11,1012),(11,1013),(11,1014),(11,1015),(11,1016),(11,1017),(11,1018),(11,1019),(11,1020),(11,1021),(11,1022),(11,1023),(11,1024),(11,1025),(11,1026),(11,1027),(11,1028),(11,1029),(11,1030),(11,1031),(11,1032),(11,1033),(11,1034),(11,1035),(11,1036),(11,1037),(11,1038),(11,1039),(11,1040),(11,1041),(11,1042),(11,1043),(11,1044),(11,1045),(11,2000),(11,2003),(11,2004),(11,2005),(11,2006),(11,2007),(11,2008),(11,2009),(11,2010),(11,2011),(11,2012),(11,2013),(11,2014),(12,2017),(12,2022),(12,2024),(12,2025),(12,2026),(12,2027);

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`user_id`,`role_id`) values (1,1),(2,2),(5,2),(6,12);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
