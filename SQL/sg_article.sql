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

/*Table structure for table `sg_article` */

DROP TABLE IF EXISTS `sg_article`;

CREATE TABLE `sg_article` (
  `id` bigint(200) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) DEFAULT NULL COMMENT '标题',
  `content` longtext COMMENT '文章内容',
  `summary` varchar(1024) DEFAULT NULL COMMENT '文章摘要',
  `category_id` bigint(20) DEFAULT NULL COMMENT '所属分类id',
  `thumbnail` varchar(256) DEFAULT NULL COMMENT '缩略图',
  `is_top` char(1) DEFAULT '0' COMMENT '是否置顶（0否，1是）',
  `status` char(1) DEFAULT '1' COMMENT '状态（0已发布，1草稿）',
  `view_count` bigint(200) DEFAULT '0' COMMENT '访问量',
  `is_comment` char(1) DEFAULT '1' COMMENT '是否允许评论 1是，0否',
  `create_by` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `del_flag` int(1) DEFAULT '0' COMMENT '删除标志（0代表未删除，1代表已删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='文章表';

/*Data for the table `sg_article` */

insert  into `sg_article`(`id`,`title`,`content`,`summary`,`category_id`,`thumbnail`,`is_top`,`status`,`view_count`,`is_comment`,`create_by`,`create_time`,`update_by`,`update_time`,`del_flag`) values (1,'SpringSecurity从入门到精通','## 课程介绍\n![image20211219121555979.png](https://sg-blog-oss.oss-cn-beijing.aliyuncs.com/2022/01/31/e7131718e9e64faeaf3fe16404186eb4.png)\n\n## 0. 简介1\n\n​	**Spring Security** 是 Spring 家族中的一个安全管理框架。相比与另外一个安全框架**Shiro**，它提供了更丰富的功能，社区资源也比Shiro丰富。\n\n​	一般来说中大型的项目都是使用**SpringSecurity** 来做安全框架。小项目有Shiro的比较多，因为相比与SpringSecurity，Shiro的上手更加的简单。\n\n​	 一般Web应用的需要进行**认证**和**授权**。\n\n​		**认证：验证当前访问系统的是不是本系统的用户，并且要确认具体是哪个用户**\n\n​		**授权：经过认证后判断当前用户是否有权限进行某个操作**\n\n​	而认证和授权也是SpringSecurity作为安全框架的核心功能。\n\n\n\n## 1. 快速入门\n\n### 1.1 准备工作\n\n​	我们先要搭建一个简单的SpringBoot工程\n\n① 设置父工程 添加依赖\n\n~~~~\n    <parent>\n        <groupId>org.springframework.boot</groupId>\n        <artifactId>spring-boot-starter-parent</artifactId>\n        <version>2.5.0</version>\n    </parent>\n    <dependencies>\n        <dependency>\n            <groupId>org.springframework.boot</groupId>\n            <artifactId>spring-boot-starter-web</artifactId>\n        </dependency>\n        <dependency>\n            <groupId>org.projectlombok</groupId>\n            <artifactId>lombok</artifactId>\n            <optional>true</optional>\n        </dependency>\n    </dependencies>\n~~~~\n\n② 创建启动类\n\n~~~~\n@SpringBootApplication\npublic class SecurityApplication {\n\n    public static void main(String[] args) {\n        SpringApplication.run(SecurityApplication.class,args);\n    }\n}\n\n~~~~\n\n③ 创建Controller\n\n~~~~java\n\nimport org.springframework.web.bind.annotation.RequestMapping;\nimport org.springframework.web.bind.annotation.RestController;\n\n@RestController\npublic class HelloController {\n\n    @RequestMapping(\"/hello\")\n    public String hello(){\n        return \"hello\";\n    }\n}\n\n~~~~\n\n\n\n### 1.2 引入SpringSecurity\n\n​	在SpringBoot项目中使用SpringSecurity我们只需要引入依赖即可实现入门案例。\n\n~~~~xml\n        <dependency>\n            <groupId>org.springframework.boot</groupId>\n            <artifactId>spring-boot-starter-security</artifactId>\n        </dependency>\n~~~~\n\n​	引入依赖后我们在尝试去访问之前的接口就会自动跳转到一个SpringSecurity的默认登陆页面，默认用户名是user,密码会输出在控制台。\n\n​	必须登陆之后才能对接口进行访问。\n\n\n\n## 2. 认证\n\n### 2.1 登陆校验流程\n![image20211215094003288.png](https://sg-blog-oss.oss-cn-beijing.aliyuncs.com/2022/01/31/414a87eeed344828b5b00ffa80178958.png)','SpringSecurity框架教程-Spring Security+JWT实现项目级前端分离认证授权',1,'https://sg-blog-oss.oss-cn-beijing.aliyuncs.com/2022/01/31/948597e164614902ab1662ba8452e106.png','1','0',105,'0',NULL,'2022-01-23 23:20:11',NULL,NULL,0),(2,'weq','adadaeqe','adad',2,'https://sg-blog-oss.oss-cn-beijing.aliyuncs.com/2022/01/15/fd2e9460c58a4af3bbeae5d9ed581688.png','1','0',22,'0',NULL,'2022-01-21 14:58:30',NULL,NULL,1),(3,'dad','asdasda','sadad',1,'https://sg-blog-oss.oss-cn-beijing.aliyuncs.com/2022/01/15/737a0ed0b8ea430d8700a12e76aa1cd1.png','1','0',33,'0',NULL,'2022-01-18 14:58:34',NULL,NULL,1),(5,'sdad','![Snipaste_20220115_165812.png](https://sg-blog-oss.oss-cn-beijing.aliyuncs.com/2022/01/15/1d9d283f5d874b468078b183e4b98b71.png)\r\n\r\n## sda \r\n\r\n222\r\n### sdasd newnewnew',NULL,2,'','1','0',44,'0',NULL,'2022-01-17 14:58:37',NULL,NULL,0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
