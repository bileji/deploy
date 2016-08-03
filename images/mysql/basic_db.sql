-- MySQL dump 10.13  Distrib 5.7.13, for Linux (x86_64)
--
-- Host: localhost    Database: group35_analyais
-- ------------------------------------------------------
-- Server version	5.7.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `group35_analyais`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `group35_analyais` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `group35_analyais`;

--
-- Table structure for table `awards_uinfo`
--

DROP TABLE IF EXISTS `awards_uinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `awards_uinfo` (
  `_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(30) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `event` varchar(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `phoneno` varchar(20) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `is_done` int(10) unsigned DEFAULT '0',
  `trans_date` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `user_id` (`user_id`,`event`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(32) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `name_en` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `contact_user_id` varchar(32) DEFAULT NULL,
  `find` int(1) NOT NULL DEFAULT '0',
  `deleted` int(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  PRIMARY KEY (`_id`),
  KEY `user_id` (`user_id`),
  KEY `phone` (`phone`),
  KEY `email` (`email`),
  KEY `contact_user_id` (`contact_user_id`),
  KEY `find` (`find`),
  KEY `deleted` (`deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=62101106 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `demo_contacts`
--

DROP TABLE IF EXISTS `demo_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `demo_contacts` (
  `_id` int(10) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(100) NOT NULL,
  `level` varchar(30) NOT NULL,
  `allow_contact` int(11) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `registed` tinyint(4) NOT NULL DEFAULT '0',
  `contacted` tinyint(4) NOT NULL,
  `kf` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`_id`),
  UNIQUE KEY `loginname` (`loginname`)
) ENGINE=MyISAM AUTO_INCREMENT=10579 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group_days`
--

DROP TABLE IF EXISTS `group_days`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_days` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` varchar(32) NOT NULL,
  `dayis` varchar(10) NOT NULL,
  `total_count` int(6) NOT NULL DEFAULT '0',
  `complete_count` int(6) NOT NULL DEFAULT '0',
  `on_time_count` int(6) NOT NULL DEFAULT '0',
  `after_time_count` int(6) NOT NULL DEFAULT '0',
  `not_complete_count` int(3) NOT NULL DEFAULT '0',
  `score` float NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  PRIMARY KEY (`_id`),
  KEY `group_id` (`group_id`,`dayis`),
  KEY `complete_count` (`complete_count`),
  KEY `total_count` (`total_count`),
  KEY `score` (`score`),
  KEY `dayis` (`dayis`)
) ENGINE=MyISAM AUTO_INCREMENT=68824090 DEFAULT CHARSET=utf8 COMMENT='群组任务每周统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group_months`
--

DROP TABLE IF EXISTS `group_months`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_months` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` varchar(32) NOT NULL,
  `monthis` varchar(10) NOT NULL,
  `total_count` int(6) NOT NULL DEFAULT '0',
  `complete_count` int(6) NOT NULL DEFAULT '0',
  `on_time_count` int(6) NOT NULL DEFAULT '0',
  `after_time_count` int(6) NOT NULL DEFAULT '0',
  `not_complete_count` int(3) NOT NULL DEFAULT '0',
  `score` float NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  PRIMARY KEY (`_id`),
  KEY `group_id` (`group_id`,`monthis`),
  KEY `complete_count` (`complete_count`),
  KEY `total_count` (`total_count`),
  KEY `score` (`score`),
  KEY `monthis` (`monthis`)
) ENGINE=MyISAM AUTO_INCREMENT=19868044 DEFAULT CHARSET=utf8 COMMENT='群组任务每月统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group_weeks`
--

DROP TABLE IF EXISTS `group_weeks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_weeks` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` varchar(32) NOT NULL,
  `weekis` varchar(10) NOT NULL,
  `total_count` int(6) NOT NULL DEFAULT '0',
  `complete_count` int(6) NOT NULL DEFAULT '0',
  `on_time_count` int(6) NOT NULL DEFAULT '0',
  `after_time_count` int(6) NOT NULL DEFAULT '0',
  `not_complete_count` int(3) NOT NULL DEFAULT '0',
  `score` float NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  PRIMARY KEY (`_id`),
  KEY `group_id` (`group_id`,`weekis`),
  KEY `complete_count` (`complete_count`),
  KEY `total_count` (`total_count`),
  KEY `score` (`score`),
  KEY `weekis` (`weekis`)
) ENGINE=MyISAM AUTO_INCREMENT=27433609 DEFAULT CHARSET=utf8 COMMENT='群组任务每周统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `groupuser_days`
--

DROP TABLE IF EXISTS `groupuser_days`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupuser_days` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(32) NOT NULL,
  `group_id` varchar(32) DEFAULT NULL,
  `dayis` varchar(10) NOT NULL,
  `total_count` int(3) NOT NULL DEFAULT '0',
  `complete_count` int(3) NOT NULL DEFAULT '0',
  `on_time_count` int(3) NOT NULL DEFAULT '0',
  `after_time_count` int(3) NOT NULL DEFAULT '0',
  `not_complete_count` int(3) NOT NULL DEFAULT '0',
  `percent` float NOT NULL DEFAULT '0' COMMENT '完成任务在团队占比',
  `score` float(10,0) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  PRIMARY KEY (`_id`),
  KEY `user_id` (`user_id`,`dayis`),
  KEY `group_id` (`group_id`),
  KEY `total_count` (`total_count`),
  KEY `complete_count` (`complete_count`),
  KEY `score` (`score`),
  KEY `dayis` (`dayis`)
) ENGINE=MyISAM AUTO_INCREMENT=27308497 DEFAULT CHARSET=utf8 COMMENT='个人在群组里的任务每天统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `groupuser_months`
--

DROP TABLE IF EXISTS `groupuser_months`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupuser_months` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(32) NOT NULL,
  `group_id` varchar(32) DEFAULT NULL,
  `monthis` varchar(10) DEFAULT NULL,
  `total_count` int(3) NOT NULL DEFAULT '0',
  `complete_count` int(3) NOT NULL DEFAULT '0',
  `on_time_count` int(3) NOT NULL DEFAULT '0',
  `after_time_count` int(3) NOT NULL DEFAULT '0',
  `not_complete_count` int(3) NOT NULL DEFAULT '0',
  `percent` float NOT NULL DEFAULT '0',
  `score` float NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  PRIMARY KEY (`_id`),
  KEY `user_id` (`user_id`),
  KEY `group_id` (`group_id`),
  KEY `total_count` (`total_count`),
  KEY `complete_count` (`complete_count`),
  KEY `score` (`score`),
  KEY `monthis` (`monthis`)
) ENGINE=MyISAM AUTO_INCREMENT=17754192 DEFAULT CHARSET=utf8 COMMENT='个人在群组里的任务每天统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `groupuser_weeks`
--

DROP TABLE IF EXISTS `groupuser_weeks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupuser_weeks` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(32) NOT NULL,
  `group_id` varchar(32) DEFAULT NULL,
  `weekis` varchar(10) NOT NULL,
  `total_count` int(3) NOT NULL DEFAULT '0',
  `complete_count` int(3) NOT NULL DEFAULT '0',
  `on_time_count` int(3) NOT NULL DEFAULT '0',
  `after_time_count` int(3) NOT NULL DEFAULT '0',
  `not_complete_count` int(3) NOT NULL DEFAULT '0',
  `percent` float NOT NULL DEFAULT '0',
  `progress` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '与上一周相比进步',
  `score` float(10,0) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  PRIMARY KEY (`_id`),
  KEY `user_id` (`user_id`,`weekis`),
  KEY `group_id` (`group_id`),
  KEY `total_count` (`total_count`),
  KEY `complete_count` (`complete_count`),
  KEY `score` (`score`),
  KEY `weekis` (`weekis`),
  KEY `progress` (`progress`)
) ENGINE=MyISAM AUTO_INCREMENT=18916733 DEFAULT CHARSET=utf8 COMMENT='个人在群组里的任务每天统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `op_logs`
--

DROP TABLE IF EXISTS `op_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `op_logs` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(32) NOT NULL,
  `group_id` varchar(32) DEFAULT NULL,
  `user_id` varchar(32) NOT NULL,
  `nickname` varchar(200) DEFAULT NULL,
  `avatar` tinytext,
  `descr` tinytext NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`_id`),
  KEY `company_id` (`company_id`,`user_id`),
  KEY `group_id` (`group_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=288835 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `promo_logs`
--

DROP TABLE IF EXISTS `promo_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promo_logs` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(32) NOT NULL,
  `nickname` varchar(100) DEFAULT NULL,
  `company_id` varchar(32) NOT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `pay_fee` float NOT NULL,
  `is_trans` int(1) NOT NULL,
  `trans_type` varchar(10) DEFAULT NULL,
  `trans_date` datetime DEFAULT NULL,
  `descr` text,
  `created` datetime NOT NULL,
  PRIMARY KEY (`_id`),
  KEY `user_id` (`user_id`,`company_id`),
  KEY `is_trans` (`is_trans`)
) ENGINE=InnoDB AUTO_INCREMENT=1096 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `promo_paylogs`
--

DROP TABLE IF EXISTS `promo_paylogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promo_paylogs` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(32) NOT NULL,
  `nickname` varchar(100) DEFAULT NULL,
  `pay_fee` float NOT NULL,
  `is_done` int(1) NOT NULL,
  `trans_type` varchar(10) NOT NULL,
  `alipay_passport` varchar(200) DEFAULT NULL,
  `trans_date` datetime DEFAULT NULL,
  `descr` text,
  `created` datetime NOT NULL,
  PRIMARY KEY (`_id`),
  KEY `user_id` (`user_id`),
  KEY `is_trans` (`is_done`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `server_log`
--

DROP TABLE IF EXISTS `server_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `server_log` (
  `_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `func` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `params` varchar(2000) COLLATE utf8_unicode_ci DEFAULT '',
  `time` int(10) unsigned DEFAULT '0',
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15937 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `share`
--

DROP TABLE IF EXISTS `share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `share` (
  `_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(32) NOT NULL,
  `nickname` varchar(100) DEFAULT NULL,
  `company_id` varchar(32) NOT NULL,
  `dayis` varchar(10) DEFAULT NULL,
  `sync_to` tinytext NOT NULL,
  `content` tinytext,
  `pic` varchar(300) DEFAULT NULL,
  `trail` varchar(300) DEFAULT NULL,
  `params` tinytext,
  `is_sync` int(1) NOT NULL DEFAULT '0',
  `sync_result` tinytext,
  `promo_url` varchar(300) DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`_id`),
  KEY `user_id` (`user_id`,`company_id`),
  KEY `dayis` (`dayis`,`is_sync`)
) ENGINE=InnoDB AUTO_INCREMENT=304 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `statu_comments`
--

DROP TABLE IF EXISTS `statu_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statu_comments` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `dayis` varchar(10) NOT NULL,
  `user_id` varchar(32) NOT NULL,
  `nickname` varchar(300) DEFAULT '',
  `company_id` varchar(32) NOT NULL,
  `group_id` varchar(32) DEFAULT NULL,
  `another_uid` varchar(32) DEFAULT NULL,
  `content` text,
  `score` float NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `dayis_2` (`dayis`,`user_id`,`company_id`,`group_id`),
  UNIQUE KEY `dayis_3` (`dayis`,`user_id`,`company_id`,`another_uid`),
  KEY `company_id` (`company_id`),
  KEY `type` (`content`(255)),
  KEY `dayis` (`dayis`),
  KEY `group_id` (`group_id`),
  KEY `another_uid` (`another_uid`),
  KEY `created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=21465 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `statu_groups`
--

DROP TABLE IF EXISTS `statu_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statu_groups` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `dayis` varchar(10) NOT NULL,
  `company_id` varchar(32) NOT NULL,
  `group_id` varchar(32) NOT NULL,
  `project_id` varchar(32) DEFAULT NULL,
  `project_title` varchar(300) DEFAULT NULL,
  `today_complete_count` tinyint(5) NOT NULL DEFAULT '0',
  `complete_count` tinyint(4) NOT NULL DEFAULT '0',
  `total_count` int(7) NOT NULL DEFAULT '0',
  `percent` float NOT NULL DEFAULT '0',
  `progress` float NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  PRIMARY KEY (`_id`),
  KEY `user_id` (`group_id`,`project_title`(255)),
  KEY `company_id` (`company_id`),
  KEY `lat` (`percent`),
  KEY `lng` (`total_count`),
  KEY `type` (`project_title`(255)),
  KEY `dayis` (`dayis`)
) ENGINE=InnoDB AUTO_INCREMENT=2029779 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `statu_score`
--

DROP TABLE IF EXISTS `statu_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statu_score` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `dayis` varchar(10) NOT NULL,
  `company_id` varchar(32) NOT NULL,
  `group_id` varchar(32) DEFAULT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `score` float NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  PRIMARY KEY (`_id`),
  KEY `user_id` (`user_id`,`score`),
  KEY `company_id` (`company_id`),
  KEY `type` (`score`),
  KEY `dayis` (`dayis`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19554 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `statu_users`
--

DROP TABLE IF EXISTS `statu_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statu_users` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `dayis` varchar(10) NOT NULL,
  `company_id` varchar(32) NOT NULL,
  `user_id` varchar(32) NOT NULL,
  `nickname` varchar(32) DEFAULT '',
  `type` varchar(32) NOT NULL,
  `time` int(10) NOT NULL DEFAULT '0',
  `content` tinytext,
  `location` tinytext,
  `lng` double DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `task_id` varchar(32) DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`_id`),
  KEY `company_id` (`company_id`),
  KEY `task_id` (`task_id`),
  KEY `lat` (`lat`),
  KEY `lng` (`lng`),
  KEY `type` (`type`),
  KEY `dayis` (`dayis`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=273111 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subscri`
--

DROP TABLE IF EXISTS `subscri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscri` (
  `_id` int(7) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(32) NOT NULL,
  `group_id` varchar(32) NOT NULL,
  `user_id` varchar(32) NOT NULL,
  `nickname` varchar(100) DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`_id`),
  KEY `company_id` (`company_id`),
  KEY `user_id` (`user_id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `task_analyses`
--

DROP TABLE IF EXISTS `task_analyses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_analyses` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(35) DEFAULT NULL,
  `user_id` varchar(32) NOT NULL,
  `nickname` varchar(100) DEFAULT NULL,
  `avatar` varchar(200) DEFAULT NULL,
  `today_score` float NOT NULL DEFAULT '0',
  `score_avg` float NOT NULL DEFAULT '0',
  `self_task_count` int(10) NOT NULL DEFAULT '0',
  `assign_user_count` int(5) NOT NULL DEFAULT '0',
  `assign_task_count` int(5) NOT NULL DEFAULT '0',
  `total_count` int(5) NOT NULL DEFAULT '0',
  `on_time_count` int(5) NOT NULL DEFAULT '0',
  `after_time_count` int(5) NOT NULL DEFAULT '0',
  `not_complete_count` int(5) NOT NULL DEFAULT '0',
  `expired_longest` text,
  `dayis` varchar(10) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`_id`),
  KEY `dayis` (`dayis`),
  KEY `user_id` (`user_id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24597236 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_days`
--

DROP TABLE IF EXISTS `user_days`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_days` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(35) DEFAULT NULL,
  `dayis` varchar(10) NOT NULL,
  `user_id` varchar(32) NOT NULL,
  `score` float NOT NULL DEFAULT '0',
  `total_count` int(10) NOT NULL DEFAULT '0',
  `complete_count` int(5) NOT NULL DEFAULT '0',
  `on_time_count` int(5) NOT NULL DEFAULT '0',
  `after_time_count` int(5) NOT NULL DEFAULT '0',
  `not_complete_count` int(5) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  PRIMARY KEY (`_id`),
  KEY `dayis` (`dayis`),
  KEY `user_id` (`user_id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26614737 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_months`
--

DROP TABLE IF EXISTS `user_months`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_months` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(35) DEFAULT NULL,
  `monthis` varchar(10) NOT NULL,
  `user_id` varchar(32) NOT NULL,
  `score` float NOT NULL DEFAULT '0',
  `total_count` int(10) NOT NULL DEFAULT '0',
  `complete_count` int(5) NOT NULL DEFAULT '0',
  `on_time_count` int(5) NOT NULL DEFAULT '0',
  `after_time_count` int(5) NOT NULL DEFAULT '0',
  `not_complete_count` int(5) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  PRIMARY KEY (`_id`),
  KEY `monthis` (`monthis`),
  KEY `user_id` (`user_id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1852071 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_weeks`
--

DROP TABLE IF EXISTS `user_weeks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_weeks` (
  `_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(35) DEFAULT NULL,
  `weekis` varchar(10) NOT NULL,
  `user_id` varchar(32) NOT NULL,
  `score` float NOT NULL DEFAULT '0',
  `total_count` int(10) NOT NULL DEFAULT '0',
  `complete_count` int(5) NOT NULL DEFAULT '0',
  `on_time_count` int(5) NOT NULL DEFAULT '0',
  `after_time_count` int(5) NOT NULL DEFAULT '0',
  `not_complete_count` int(5) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  PRIMARY KEY (`_id`),
  KEY `weekis` (`weekis`),
  KEY `user_id` (`user_id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5923680 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `group35_ext`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `group35_ext` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `group35_ext`;

--
-- Table structure for table `analysis_checkin_companies`
--

DROP TABLE IF EXISTS `analysis_checkin_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analysis_checkin_companies` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(24) NOT NULL,
  `type` varchar(10) NOT NULL,
  `index_day` date NOT NULL,
  `check_in` varchar(10) DEFAULT NULL,
  `check_out` varchar(10) DEFAULT NULL,
  `total_time` int(10) DEFAULT '0',
  `avg_time` int(11) DEFAULT '0',
  UNIQUE KEY `_id` (`_id`),
  KEY `company_id` (`company_id`,`type`,`index_day`)
) ENGINE=InnoDB AUTO_INCREMENT=10563 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `analysis_checkin_groups`
--

DROP TABLE IF EXISTS `analysis_checkin_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analysis_checkin_groups` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(24) NOT NULL,
  `type` varchar(10) NOT NULL,
  `group_id` varchar(24) NOT NULL,
  `index_day` date NOT NULL,
  `check_in` varchar(10) DEFAULT NULL,
  `check_out` varchar(10) DEFAULT NULL,
  `total_time` int(10) DEFAULT '0',
  `avg_time` int(11) DEFAULT '0',
  UNIQUE KEY `_id` (`_id`),
  KEY `company_id` (`company_id`,`type`,`group_id`,`index_day`)
) ENGINE=InnoDB AUTO_INCREMENT=387431 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `analysis_checkin_users`
--

DROP TABLE IF EXISTS `analysis_checkin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analysis_checkin_users` (
  `_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(24) NOT NULL,
  `type` varchar(10) NOT NULL,
  `user_id` varchar(24) NOT NULL,
  `index_day` date NOT NULL,
  `check_in` varchar(10) DEFAULT NULL,
  `check_out` varchar(10) DEFAULT NULL,
  `total_time` int(10) DEFAULT '0',
  `avg_time` int(11) DEFAULT '0',
  UNIQUE KEY `_id` (`_id`),
  KEY `company_id` (`company_id`,`type`,`user_id`,`index_day`)
) ENGINE=InnoDB AUTO_INCREMENT=404299 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `analysis_project_durations`
--

DROP TABLE IF EXISTS `analysis_project_durations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analysis_project_durations` (
  `_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `company_id` varchar(24) NOT NULL DEFAULT '''''' COMMENT '公司id',
  `project_id` varchar(24) DEFAULT '''''' COMMENT '项目id',
  `task_id` varchar(24) NOT NULL DEFAULT '''''' COMMENT '任务id',
  `content` varchar(500) NOT NULL DEFAULT '''''' COMMENT '任务内容',
  `user_id` varchar(24) NOT NULL DEFAULT '''''' COMMENT '用户id',
  `duration` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '耗时',
  `complete_date` timestamp NULL DEFAULT NULL COMMENT '完成时间',
  `start_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '开始时间',
  `end_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '结束时间',
  PRIMARY KEY (`_id`),
  KEY `c_p_u_s_e_c_d` (`company_id`,`project_id`,`user_id`,`start_date`,`end_date`,`complete_date`,`duration`)
) ENGINE=InnoDB AUTO_INCREMENT=182007 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `analysis_project_dynamics`
--

DROP TABLE IF EXISTS `analysis_project_dynamics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analysis_project_dynamics` (
  `_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `company_id` varchar(24) NOT NULL DEFAULT '''''' COMMENT '公司id',
  `project_id` varchar(24) NOT NULL DEFAULT '''''' COMMENT '项目id',
  `project_title` varchar(200) NOT NULL DEFAULT '''''' COMMENT '项目标题',
  `new_task_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '新增任务数',
  `fulfill_task_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '任务完成数',
  `new_task_discuss_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '任务新增讨论数',
  `new_project_discuss_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '项目新境讨论数',
  `start_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '开始时间',
  `end_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '结束时间',
  PRIMARY KEY (`_id`),
  KEY `p_c_s_d` (`project_id`,`company_id`,`start_date`,`end_date`)
) ENGINE=InnoDB AUTO_INCREMENT=4242 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `analysis_subdivisions_executions`
--

DROP TABLE IF EXISTS `analysis_subdivisions_executions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analysis_subdivisions_executions` (
  `_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `company_id` varchar(24) NOT NULL DEFAULT '''''' COMMENT '公司id',
  `group_id` varchar(24) NOT NULL DEFAULT '''''' COMMENT '群组id',
  `this_week_avg_c` int(11) NOT NULL DEFAULT '0' COMMENT '本周完成平均数',
  `this_week_avg_d` int(11) NOT NULL DEFAULT '0' COMMENT '本周延期平均数',
  `last_week_avg_c` int(11) NOT NULL DEFAULT '0' COMMENT '上周完成平均数',
  `last_week_avg_d` int(11) NOT NULL DEFAULT '0' COMMENT '上周延期平均数',
  `this_month_avg_c` int(11) NOT NULL DEFAULT '0' COMMENT '本月完成平均数',
  `this_month_avg_d` int(11) NOT NULL DEFAULT '0' COMMENT '本月延期平均数',
  `last_month_avg_c` int(11) NOT NULL DEFAULT '0' COMMENT '上月完成平均数',
  `last_month_avg_d` int(11) NOT NULL DEFAULT '0' COMMENT '上月延期平均数',
  PRIMARY KEY (`_id`),
  KEY `c_g` (`company_id`,`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=163575 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `devices`
--

DROP TABLE IF EXISTS `devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devices` (
  `_id` int(10) NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(200) NOT NULL,
  `user_id` varchar(35) NOT NULL,
  `status` varchar(15) CHARACTER SET ucs2 NOT NULL DEFAULT 'normal',
  `device` varchar(250) NOT NULL,
  `os` varchar(10) DEFAULT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `op_date` datetime DEFAULT NULL COMMENT '删除操作时间',
  `action_date` datetime DEFAULT NULL COMMENT '客户端操作响应时间',
  PRIMARY KEY (`_id`),
  KEY `user_id` (`user_id`),
  KEY `uid_user_id` (`unique_id`,`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=51483 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mobile_city`
--

DROP TABLE IF EXISTS `mobile_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mobile_city` (
  `ID` int(11) NOT NULL,
  `MobileNumber` varchar(20) DEFAULT NULL,
  `MobileArea` varchar(50) DEFAULT NULL,
  `MobileType` varchar(50) DEFAULT NULL,
  `AreaCode` varchar(10) DEFAULT NULL,
  `PostCode` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `phone` (`MobileNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `monitor`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `monitor` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `monitor`;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `_id` varchar(24) NOT NULL,
  `creator_uid` varchar(24) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `show_id` varchar(20) NOT NULL,
  `person_num` int(10) DEFAULT NULL,
  `payed_level` varchar(30) DEFAULT NULL,
  `payed_time` date DEFAULT NULL,
  `payed_free_init` date DEFAULT NULL,
  `crm_person_num` int(10) DEFAULT NULL,
  `crm_payed_time` date DEFAULT NULL,
  `crm_init_date` date DEFAULT NULL,
  `crm_payed_level` varchar(30) DEFAULT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`_id`),
  KEY `creator_uid` (`creator_uid`,`show_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='companies';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `monitor_payinfo`
--

DROP TABLE IF EXISTS `monitor_payinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monitor_payinfo` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(24) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `dayis` date NOT NULL,
  `payed_time` date NOT NULL,
  `member` int(11) NOT NULL,
  `active` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39432 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nginx_logs`
--

DROP TABLE IF EXISTS `nginx_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nginx_logs` (
  `_id` int(20) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(24) DEFAULT NULL,
  `dayis` date DEFAULT NULL,
  `custom_os` varchar(15) DEFAULT NULL,
  `module` varchar(100) DEFAULT NULL,
  `field` varchar(100) DEFAULT NULL,
  `num` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`_id`),
  KEY `company_id` (`company_id`),
  KEY `date` (`dayis`),
  KEY `custom_os` (`custom_os`),
  KEY `module` (`module`),
  KEY `field` (`field`)
) ENGINE=MyISAM AUTO_INCREMENT=9943123 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `operations`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `operations` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `operations`;

--
-- Table structure for table `feiyonggoucheng`
--

DROP TABLE IF EXISTS `feiyonggoucheng`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feiyonggoucheng` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TimeGranCode` varchar(100) DEFAULT NULL COMMENT '费用构成类型名称',
  `TimeGranValue` date NOT NULL COMMENT '费用构成日期',
  `QueryRangeGranValue` varchar(100) DEFAULT NULL COMMENT '范围',
  `QueryRangeGranValueName` varchar(30) NOT NULL COMMENT '费用构成名称',
  `QueryQuotaValue` int(11) DEFAULT NULL COMMENT '费用构成金额，元',
  `QuotaGroup` varchar(225) DEFAULT NULL,
  `QuotaCat` varchar(225) DEFAULT NULL,
  `QuotaBack` varchar(225) DEFAULT NULL,
  `created` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=336727 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `guahao`
--

DROP TABLE IF EXISTS `guahao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guahao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TimeGranCode` varchar(100) DEFAULT NULL COMMENT '挂号类型名称',
  `TimeGranValue` date NOT NULL COMMENT '挂号日期',
  `QueryRangeGranValue` varchar(100) DEFAULT NULL,
  `QueryRangeGranValueName` varchar(30) NOT NULL COMMENT '挂号人姓名',
  `QueryQuotaValue` int(11) DEFAULT NULL COMMENT '挂号费，元',
  `QuotaGroup` varchar(225) DEFAULT NULL,
  `QuotaCat` varchar(225) DEFAULT NULL,
  `QuotaBack` varchar(225) DEFAULT NULL,
  `created` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52573 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menjizhen`
--

DROP TABLE IF EXISTS `menjizhen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menjizhen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TimeGranCode` varchar(100) DEFAULT NULL,
  `TimeGranValue` date NOT NULL COMMENT '门急诊日期',
  `QueryRangeGranValue` varchar(100) DEFAULT NULL COMMENT '范围',
  `QueryRangeGranValueName` varchar(30) NOT NULL COMMENT '患者名称',
  `QueryQuotaValue` int(11) DEFAULT NULL COMMENT '门急诊次数',
  `QuotaGroup` varchar(225) DEFAULT NULL,
  `QuotaCat` varchar(225) DEFAULT NULL,
  `QuotaBack` varchar(225) DEFAULT NULL,
  `created` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50800 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shoufei`
--

DROP TABLE IF EXISTS `shoufei`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoufei` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TimeGranCode` varchar(100) DEFAULT NULL COMMENT '收费类型名称',
  `TimeGranValue` date NOT NULL COMMENT '收费日期',
  `QueryRangeGranValue` varchar(100) DEFAULT NULL COMMENT '范围',
  `QueryRangeGranValueName` varchar(30) NOT NULL COMMENT '收费科室名称',
  `QueryQuotaValue` int(11) DEFAULT NULL COMMENT '收费金额，元',
  `QuotaGroup` varchar(225) DEFAULT NULL,
  `QuotaCat` varchar(225) DEFAULT NULL,
  `QuotaBack` varchar(225) DEFAULT NULL,
  `created` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tuifei`
--

DROP TABLE IF EXISTS `tuifei`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tuifei` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TimeGranCode` varchar(100) DEFAULT NULL COMMENT '退费类型名称',
  `TimeGranValue` date NOT NULL COMMENT '退费日期',
  `QueryRangeGranValue` varchar(100) DEFAULT NULL COMMENT '范围',
  `QueryRangeGranValueName` varchar(30) NOT NULL COMMENT '退费科室名称',
  `QueryQuotaValue` int(11) DEFAULT NULL COMMENT '退费金额，元',
  `QuotaGroup` varchar(225) DEFAULT NULL,
  `QuotaCat` varchar(225) DEFAULT NULL,
  `QuotaBack` varchar(225) DEFAULT NULL,
  `created` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10099 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `partner`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `partner` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `partner`;

--
-- Table structure for table `agent_applies`
--

DROP TABLE IF EXISTS `agent_applies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agent_applies` (
  `_id` int(10) NOT NULL AUTO_INCREMENT,
  `is_done` int(1) NOT NULL DEFAULT '0',
  `province` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phoneno` varchar(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `descr` tinytext,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=MyISAM AUTO_INCREMENT=570 DEFAULT CHARSET=utf8 COMMENT='代理商申请';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agents`
--

DROP TABLE IF EXISTS `agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agents` (
  `_id` int(6) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL COMMENT '姓名或是公司名称',
  `code` varchar(50) NOT NULL,
  `login_account` varchar(150) NOT NULL,
  `login_pwd` varchar(40) NOT NULL,
  `avatar` varchar(200) NOT NULL,
  `is_admin` int(1) NOT NULL DEFAULT '0',
  `is_enable` int(1) NOT NULL DEFAULT '1',
  `tuishiben` int(1) NOT NULL DEFAULT '0' COMMENT '是否代理了推事本',
  `weixinqy` int(1) NOT NULL DEFAULT '0' COMMENT '是否代理了微信企业版',
  `crm` int(1) NOT NULL DEFAULT '0' COMMENT '是否代理了CRM',
  `company_name` varchar(200) DEFAULT NULL,
  `contact_name` varchar(150) DEFAULT NULL,
  `phoneno` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `province` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `address` tinytext,
  `start_date` datetime NOT NULL COMMENT '签约时间',
  `expire_date` datetime NOT NULL COMMENT '到期时间',
  `pay_style` varchar(200) DEFAULT NULL COMMENT '收款方式：支付宝、银行转帐....',
  `financial_account` varchar(200) DEFAULT NULL COMMENT '收款帐号',
  `ratio_setting` tinytext,
  `ratio4level` tinytext,
  `descr` text,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `code` (`code`),
  KEY `pass` (`login_pwd`),
  KEY `is_enable` (`is_enable`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='代理商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `_id` int(10) NOT NULL AUTO_INCREMENT,
  `agent_id` int(10) NOT NULL,
  `agent_title` varchar(150) NOT NULL,
  `company_id` varchar(40) NOT NULL,
  `show_id` varchar(20) NOT NULL,
  `company_name` varchar(200) NOT NULL,
  `product_cn` varchar(150) NOT NULL,
  `product_en` varchar(150) NOT NULL,
  `level` varchar(20) NOT NULL,
  `payed_level` varchar(20) NOT NULL,
  `bind_date` datetime NOT NULL COMMENT '绑定日期',
  `expire_date` datetime DEFAULT NULL COMMENT '到期时间',
  `from_event` varchar(150) DEFAULT NULL,
  `from_eventname` varchar(250) DEFAULT NULL,
  `status` varchar(10) NOT NULL COMMENT '客户状态',
  `person_num` int(5) NOT NULL DEFAULT '0',
  `liveness` int(7) NOT NULL DEFAULT '0',
  `descr` tinytext,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `agent_id_2` (`agent_id`,`company_id`,`product_en`),
  KEY `company_id` (`company_id`),
  KEY `product_en` (`product_cn`),
  KEY `liveness` (`liveness`),
  KEY `agent_id` (`agent_id`),
  KEY `status` (`status`),
  KEY `expire_date` (`expire_date`),
  KEY `show_id` (`show_id`)
) ENGINE=MyISAM AUTO_INCREMENT=163 DEFAULT CHARSET=utf8 COMMENT='代理商们发展的客户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `_id` int(10) NOT NULL AUTO_INCREMENT,
  `agent_id` int(10) NOT NULL,
  `agent_title` varchar(150) NOT NULL,
  `company_id` varchar(40) NOT NULL,
  `show_id` varchar(20) NOT NULL,
  `company_name` varchar(200) NOT NULL,
  `tuishiben` int(1) NOT NULL DEFAULT '0',
  `weixinqy` int(1) NOT NULL DEFAULT '0',
  `crm` int(1) NOT NULL DEFAULT '0',
  `active_date` datetime DEFAULT NULL,
  `managers` text,
  `descr` tinytext,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`_id`),
  KEY `company_id` (`company_id`),
  KEY `agent_id` (`agent_id`),
  KEY `show_id` (`show_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='代建的公司列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `_id` int(10) NOT NULL AUTO_INCREMENT,
  `agent_id` int(5) NOT NULL,
  `title` varchar(300) NOT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `is_del` int(1) NOT NULL DEFAULT '0',
  `descr` tinytext,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`_id`),
  KEY `agent_id` (`agent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pay_logs`
--

DROP TABLE IF EXISTS `pay_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_logs` (
  `_id` int(10) NOT NULL AUTO_INCREMENT,
  `agent_id` int(10) NOT NULL,
  `agent_title` varchar(100) NOT NULL,
  `deal_date` varchar(20) DEFAULT '0' COMMENT '是否已经将财务划分给代理商',
  `pay_time` datetime NOT NULL,
  `company_id` varchar(40) NOT NULL,
  `company_name` varchar(150) NOT NULL,
  `product_en` varchar(20) NOT NULL,
  `product_cn` varchar(100) NOT NULL,
  `level` varchar(20) NOT NULL,
  `pay_amount` float NOT NULL,
  `pay_amount_real` float NOT NULL,
  `divided_percent` float NOT NULL,
  `divided_money` float NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `company_paylist_id` varchar(40) DEFAULT NULL,
  `descr` tinytext,
  `created` datetime NOT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `agent_id_2` (`agent_id`,`pay_time`,`company_id`,`product_en`),
  KEY `agent_id` (`agent_id`),
  KEY `company_id` (`company_id`),
  KEY `is_paied` (`deal_date`),
  KEY `deal_date` (`deal_date`)
) ENGINE=MyISAM AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COMMENT='付费记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pay_summaries`
--

DROP TABLE IF EXISTS `pay_summaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_summaries` (
  `_id` int(7) NOT NULL AUTO_INCREMENT,
  `agent_id` int(7) NOT NULL,
  `agent_title` varchar(150) NOT NULL,
  `month` varchar(10) NOT NULL,
  `deal_date` varchar(20) NOT NULL DEFAULT '0',
  `operation` varchar(5) NOT NULL DEFAULT 'plus' COMMENT '增加： plus 减少：minus',
  `money_sale` float NOT NULL DEFAULT '0',
  `money_divided` float NOT NULL DEFAULT '0' COMMENT '本月分成金额',
  `descr` tinytext,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`_id`),
  KEY `agent_id` (`agent_id`),
  KEY `operation` (`operation`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='付费汇总';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `tsb_primary_store`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `tsb_primary_store` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `tsb_primary_store`;

--
-- Table structure for table `msgs`
--

DROP TABLE IF EXISTS `msgs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msgs` (
  `_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender` char(24) NOT NULL DEFAULT '' COMMENT '消息发送方user_id',
  `target` char(24) NOT NULL DEFAULT '' COMMENT '消息接受方，若为p2p消息，值为user_id; 若为群组消息，值为group_id',
  `company_id` char(24) DEFAULT NULL,
  `ssl` int(1) NOT NULL DEFAULT '0',
  `mid` double unsigned NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'p2p/group',
  `vote_count` int(11) NOT NULL DEFAULT '0' COMMENT '+1数量',
  `msg_body` text CHARACTER SET utf8mb4 NOT NULL COMMENT '消息body的json串',
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建记录时间',
  PRIMARY KEY (`_id`),
  KEY `idx_sender` (`sender`),
  KEY `idx_target` (`target`),
  KEY `idx_cid` (`company_id`),
  KEY `idx_mid` (`mid`),
  KEY `ssl` (`ssl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `msgs_0`
--

DROP TABLE IF EXISTS `msgs_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msgs_0` (
  `_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender` char(24) NOT NULL DEFAULT '' COMMENT '消息发送方user_id',
  `target` char(24) NOT NULL DEFAULT '' COMMENT '消息接受方，若为p2p消息，值为user_id; 若为群组消息，值为group_id',
  `company_id` char(24) DEFAULT NULL,
  `ssl` int(1) NOT NULL DEFAULT '0',
  `mid` double unsigned NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'p2p/group',
  `vote_count` int(11) NOT NULL DEFAULT '0' COMMENT '+1数量',
  `msg_body` text CHARACTER SET utf8mb4 NOT NULL COMMENT '消息body的json串',
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建记录时间',
  PRIMARY KEY (`_id`),
  KEY `idx_sender` (`sender`),
  KEY `idx_target` (`target`),
  KEY `idx_cid` (`company_id`),
  KEY `idx_mid` (`mid`),
  KEY `ssl` (`ssl`)
) ENGINE=InnoDB AUTO_INCREMENT=143160 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `msgs_1`
--

DROP TABLE IF EXISTS `msgs_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msgs_1` (
  `_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender` char(24) NOT NULL DEFAULT '' COMMENT '消息发送方user_id',
  `target` char(24) NOT NULL DEFAULT '' COMMENT '消息接受方，若为p2p消息，值为user_id; 若为群组消息，值为group_id',
  `company_id` char(24) DEFAULT NULL,
  `ssl` int(1) NOT NULL DEFAULT '0',
  `mid` double unsigned NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'p2p/group',
  `vote_count` int(11) NOT NULL DEFAULT '0' COMMENT '+1数量',
  `msg_body` text CHARACTER SET utf8mb4 NOT NULL COMMENT '消息body的json串',
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建记录时间',
  PRIMARY KEY (`_id`),
  KEY `idx_sender` (`sender`),
  KEY `idx_target` (`target`),
  KEY `idx_cid` (`company_id`),
  KEY `idx_mid` (`mid`),
  KEY `ssl` (`ssl`)
) ENGINE=InnoDB AUTO_INCREMENT=140296 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `msgs_10`
--

DROP TABLE IF EXISTS `msgs_10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msgs_10` (
  `_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender` char(24) NOT NULL DEFAULT '' COMMENT '消息发送方user_id',
  `target` char(24) NOT NULL DEFAULT '' COMMENT '消息接受方，若为p2p消息，值为user_id; 若为群组消息，值为group_id',
  `company_id` char(24) DEFAULT NULL,
  `ssl` int(1) NOT NULL DEFAULT '0',
  `mid` double unsigned NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'p2p/group',
  `vote_count` int(11) NOT NULL DEFAULT '0' COMMENT '+1数量',
  `msg_body` text CHARACTER SET utf8mb4 NOT NULL COMMENT '消息body的json串',
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建记录时间',
  PRIMARY KEY (`_id`),
  KEY `idx_sender` (`sender`),
  KEY `idx_target` (`target`),
  KEY `idx_cid` (`company_id`),
  KEY `idx_mid` (`mid`),
  KEY `ssl` (`ssl`)
) ENGINE=InnoDB AUTO_INCREMENT=151679 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `msgs_11`
--

DROP TABLE IF EXISTS `msgs_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msgs_11` (
  `_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender` char(24) NOT NULL DEFAULT '' COMMENT '消息发送方user_id',
  `target` char(24) NOT NULL DEFAULT '' COMMENT '消息接受方，若为p2p消息，值为user_id; 若为群组消息，值为group_id',
  `company_id` char(24) DEFAULT NULL,
  `ssl` int(1) NOT NULL DEFAULT '0',
  `mid` double unsigned NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'p2p/group',
  `vote_count` int(11) NOT NULL DEFAULT '0' COMMENT '+1数量',
  `msg_body` text CHARACTER SET utf8mb4 NOT NULL COMMENT '消息body的json串',
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建记录时间',
  PRIMARY KEY (`_id`),
  KEY `idx_sender` (`sender`),
  KEY `idx_target` (`target`),
  KEY `idx_cid` (`company_id`),
  KEY `idx_mid` (`mid`),
  KEY `ssl` (`ssl`)
) ENGINE=InnoDB AUTO_INCREMENT=447750 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `msgs_12`
--

DROP TABLE IF EXISTS `msgs_12`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msgs_12` (
  `_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender` char(24) NOT NULL DEFAULT '' COMMENT '消息发送方user_id',
  `target` char(24) NOT NULL DEFAULT '' COMMENT '消息接受方，若为p2p消息，值为user_id; 若为群组消息，值为group_id',
  `company_id` char(24) DEFAULT NULL,
  `ssl` int(1) NOT NULL DEFAULT '0',
  `mid` double unsigned NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'p2p/group',
  `vote_count` int(11) NOT NULL DEFAULT '0' COMMENT '+1数量',
  `msg_body` text CHARACTER SET utf8mb4 NOT NULL COMMENT '消息body的json串',
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建记录时间',
  PRIMARY KEY (`_id`),
  KEY `idx_sender` (`sender`),
  KEY `idx_target` (`target`),
  KEY `idx_cid` (`company_id`),
  KEY `idx_mid` (`mid`),
  KEY `ssl` (`ssl`)
) ENGINE=InnoDB AUTO_INCREMENT=452299 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `msgs_13`
--

DROP TABLE IF EXISTS `msgs_13`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msgs_13` (
  `_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender` char(24) NOT NULL DEFAULT '' COMMENT '消息发送方user_id',
  `target` char(24) NOT NULL DEFAULT '' COMMENT '消息接受方，若为p2p消息，值为user_id; 若为群组消息，值为group_id',
  `company_id` char(24) DEFAULT NULL,
  `ssl` int(1) NOT NULL DEFAULT '0',
  `mid` double unsigned NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'p2p/group',
  `vote_count` int(11) NOT NULL DEFAULT '0' COMMENT '+1数量',
  `msg_body` text CHARACTER SET utf8mb4 NOT NULL COMMENT '消息body的json串',
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建记录时间',
  PRIMARY KEY (`_id`),
  KEY `idx_sender` (`sender`),
  KEY `idx_target` (`target`),
  KEY `idx_cid` (`company_id`),
  KEY `idx_mid` (`mid`),
  KEY `ssl` (`ssl`)
) ENGINE=InnoDB AUTO_INCREMENT=142165 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `msgs_14`
--

DROP TABLE IF EXISTS `msgs_14`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msgs_14` (
  `_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender` char(24) NOT NULL DEFAULT '' COMMENT '消息发送方user_id',
  `target` char(24) NOT NULL DEFAULT '' COMMENT '消息接受方，若为p2p消息，值为user_id; 若为群组消息，值为group_id',
  `company_id` char(24) DEFAULT NULL,
  `ssl` int(1) NOT NULL DEFAULT '0',
  `mid` double unsigned NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'p2p/group',
  `vote_count` int(11) NOT NULL DEFAULT '0' COMMENT '+1数量',
  `msg_body` text CHARACTER SET utf8mb4 NOT NULL COMMENT '消息body的json串',
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建记录时间',
  PRIMARY KEY (`_id`),
  KEY `idx_sender` (`sender`),
  KEY `idx_target` (`target`),
  KEY `idx_cid` (`company_id`),
  KEY `idx_mid` (`mid`),
  KEY `ssl` (`ssl`)
) ENGINE=InnoDB AUTO_INCREMENT=145672 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `msgs_15`
--

DROP TABLE IF EXISTS `msgs_15`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msgs_15` (
  `_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender` char(24) NOT NULL DEFAULT '' COMMENT '消息发送方user_id',
  `target` char(24) NOT NULL DEFAULT '' COMMENT '消息接受方，若为p2p消息，值为user_id; 若为群组消息，值为group_id',
  `company_id` char(24) DEFAULT NULL,
  `ssl` int(1) NOT NULL DEFAULT '0',
  `mid` double unsigned NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'p2p/group',
  `vote_count` int(11) NOT NULL DEFAULT '0' COMMENT '+1数量',
  `msg_body` text CHARACTER SET utf8mb4 NOT NULL COMMENT '消息body的json串',
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建记录时间',
  PRIMARY KEY (`_id`),
  KEY `idx_sender` (`sender`),
  KEY `idx_target` (`target`),
  KEY `idx_cid` (`company_id`),
  KEY `idx_mid` (`mid`),
  KEY `ssl` (`ssl`)
) ENGINE=InnoDB AUTO_INCREMENT=161581 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `msgs_16`
--

DROP TABLE IF EXISTS `msgs_16`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msgs_16` (
  `_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender` char(24) NOT NULL DEFAULT '' COMMENT '消息发送方user_id',
  `target` char(24) NOT NULL DEFAULT '' COMMENT '消息接受方，若为p2p消息，值为user_id; 若为群组消息，值为group_id',
  `company_id` char(24) DEFAULT NULL,
  `ssl` int(1) NOT NULL DEFAULT '0',
  `mid` double unsigned NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'p2p/group',
  `vote_count` int(11) NOT NULL DEFAULT '0' COMMENT '+1数量',
  `msg_body` text CHARACTER SET utf8mb4 NOT NULL COMMENT '消息body的json串',
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建记录时间',
  PRIMARY KEY (`_id`),
  KEY `idx_sender` (`sender`),
  KEY `idx_target` (`target`),
  KEY `idx_cid` (`company_id`),
  KEY `idx_mid` (`mid`),
  KEY `ssl` (`ssl`)
) ENGINE=InnoDB AUTO_INCREMENT=445714 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `msgs_17`
--

DROP TABLE IF EXISTS `msgs_17`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msgs_17` (
  `_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender` char(24) NOT NULL DEFAULT '' COMMENT '消息发送方user_id',
  `target` char(24) NOT NULL DEFAULT '' COMMENT '消息接受方，若为p2p消息，值为user_id; 若为群组消息，值为group_id',
  `company_id` char(24) DEFAULT NULL,
  `ssl` int(1) NOT NULL DEFAULT '0',
  `mid` double unsigned NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'p2p/group',
  `vote_count` int(11) NOT NULL DEFAULT '0' COMMENT '+1数量',
  `msg_body` text CHARACTER SET utf8mb4 NOT NULL COMMENT '消息body的json串',
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建记录时间',
  PRIMARY KEY (`_id`),
  KEY `idx_sender` (`sender`),
  KEY `idx_target` (`target`),
  KEY `idx_cid` (`company_id`),
  KEY `idx_mid` (`mid`),
  KEY `ssl` (`ssl`)
) ENGINE=InnoDB AUTO_INCREMENT=436225 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `msgs_18`
--

DROP TABLE IF EXISTS `msgs_18`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msgs_18` (
  `_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender` char(24) NOT NULL DEFAULT '' COMMENT '消息发送方user_id',
  `target` char(24) NOT NULL DEFAULT '' COMMENT '消息接受方，若为p2p消息，值为user_id; 若为群组消息，值为group_id',
  `company_id` char(24) DEFAULT NULL,
  `ssl` int(1) NOT NULL DEFAULT '0',
  `mid` double unsigned NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'p2p/group',
  `vote_count` int(11) NOT NULL DEFAULT '0' COMMENT '+1数量',
  `msg_body` text CHARACTER SET utf8mb4 NOT NULL COMMENT '消息body的json串',
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建记录时间',
  PRIMARY KEY (`_id`),
  KEY `idx_sender` (`sender`),
  KEY `idx_target` (`target`),
  KEY `idx_cid` (`company_id`),
  KEY `idx_mid` (`mid`),
  KEY `ssl` (`ssl`)
) ENGINE=InnoDB AUTO_INCREMENT=440228 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `msgs_19`
--

DROP TABLE IF EXISTS `msgs_19`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msgs_19` (
  `_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender` char(24) NOT NULL DEFAULT '' COMMENT '消息发送方user_id',
  `target` char(24) NOT NULL DEFAULT '' COMMENT '消息接受方，若为p2p消息，值为user_id; 若为群组消息，值为group_id',
  `company_id` char(24) DEFAULT NULL,
  `ssl` int(1) NOT NULL DEFAULT '0',
  `mid` double unsigned NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'p2p/group',
  `vote_count` int(11) NOT NULL DEFAULT '0' COMMENT '+1数量',
  `msg_body` text CHARACTER SET utf8mb4 NOT NULL COMMENT '消息body的json串',
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建记录时间',
  PRIMARY KEY (`_id`),
  KEY `idx_sender` (`sender`),
  KEY `idx_target` (`target`),
  KEY `idx_cid` (`company_id`),
  KEY `idx_mid` (`mid`),
  KEY `ssl` (`ssl`)
) ENGINE=InnoDB AUTO_INCREMENT=334186 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `msgs_2`
--

DROP TABLE IF EXISTS `msgs_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msgs_2` (
  `_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender` char(24) NOT NULL DEFAULT '' COMMENT '消息发送方user_id',
  `target` char(24) NOT NULL DEFAULT '' COMMENT '消息接受方，若为p2p消息，值为user_id; 若为群组消息，值为group_id',
  `company_id` char(24) DEFAULT NULL,
  `ssl` int(1) NOT NULL DEFAULT '0',
  `mid` double unsigned NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'p2p/group',
  `vote_count` int(11) NOT NULL DEFAULT '0' COMMENT '+1数量',
  `msg_body` text CHARACTER SET utf8mb4 NOT NULL COMMENT '消息body的json串',
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建记录时间',
  PRIMARY KEY (`_id`),
  KEY `idx_sender` (`sender`),
  KEY `idx_target` (`target`),
  KEY `idx_cid` (`company_id`),
  KEY `idx_mid` (`mid`),
  KEY `ssl` (`ssl`)
) ENGINE=InnoDB AUTO_INCREMENT=133198 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `msgs_20`
--

DROP TABLE IF EXISTS `msgs_20`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msgs_20` (
  `_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender` char(24) NOT NULL DEFAULT '' COMMENT '消息发送方user_id',
  `target` char(24) NOT NULL DEFAULT '' COMMENT '消息接受方，若为p2p消息，值为user_id; 若为群组消息，值为group_id',
  `company_id` char(24) DEFAULT NULL,
  `ssl` int(1) NOT NULL DEFAULT '0',
  `mid` double unsigned NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'p2p/group',
  `vote_count` int(11) NOT NULL DEFAULT '0' COMMENT '+1数量',
  `msg_body` text CHARACTER SET utf8mb4 NOT NULL COMMENT '消息body的json串',
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建记录时间',
  PRIMARY KEY (`_id`),
  KEY `idx_sender` (`sender`),
  KEY `idx_target` (`target`),
  KEY `idx_cid` (`company_id`),
  KEY `idx_mid` (`mid`),
  KEY `ssl` (`ssl`)
) ENGINE=InnoDB AUTO_INCREMENT=139554 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `msgs_21`
--

DROP TABLE IF EXISTS `msgs_21`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msgs_21` (
  `_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender` char(24) NOT NULL DEFAULT '' COMMENT '消息发送方user_id',
  `target` char(24) NOT NULL DEFAULT '' COMMENT '消息接受方，若为p2p消息，值为user_id; 若为群组消息，值为group_id',
  `company_id` char(24) DEFAULT NULL,
  `ssl` int(1) NOT NULL DEFAULT '0',
  `mid` double unsigned NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'p2p/group',
  `vote_count` int(11) NOT NULL DEFAULT '0' COMMENT '+1数量',
  `msg_body` text CHARACTER SET utf8mb4 NOT NULL COMMENT '消息body的json串',
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建记录时间',
  PRIMARY KEY (`_id`),
  KEY `idx_sender` (`sender`),
  KEY `idx_target` (`target`),
  KEY `idx_cid` (`company_id`),
  KEY `idx_mid` (`mid`),
  KEY `ssl` (`ssl`)
) ENGINE=InnoDB AUTO_INCREMENT=474026 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `msgs_22`
--

DROP TABLE IF EXISTS `msgs_22`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msgs_22` (
  `_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender` char(24) NOT NULL DEFAULT '' COMMENT '消息发送方user_id',
  `target` char(24) NOT NULL DEFAULT '' COMMENT '消息接受方，若为p2p消息，值为user_id; 若为群组消息，值为group_id',
  `company_id` char(24) DEFAULT NULL,
  `ssl` int(1) NOT NULL DEFAULT '0',
  `mid` double unsigned NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'p2p/group',
  `vote_count` int(11) NOT NULL DEFAULT '0' COMMENT '+1数量',
  `msg_body` text CHARACTER SET utf8mb4 NOT NULL COMMENT '消息body的json串',
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建记录时间',
  PRIMARY KEY (`_id`),
  KEY `idx_sender` (`sender`),
  KEY `idx_target` (`target`),
  KEY `idx_cid` (`company_id`),
  KEY `idx_mid` (`mid`),
  KEY `ssl` (`ssl`)
) ENGINE=InnoDB AUTO_INCREMENT=443327 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `msgs_23`
--

DROP TABLE IF EXISTS `msgs_23`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msgs_23` (
  `_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender` char(24) NOT NULL DEFAULT '' COMMENT '消息发送方user_id',
  `target` char(24) NOT NULL DEFAULT '' COMMENT '消息接受方，若为p2p消息，值为user_id; 若为群组消息，值为group_id',
  `company_id` char(24) DEFAULT NULL,
  `ssl` int(1) NOT NULL DEFAULT '0',
  `mid` double unsigned NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'p2p/group',
  `vote_count` int(11) NOT NULL DEFAULT '0' COMMENT '+1数量',
  `msg_body` text CHARACTER SET utf8mb4 NOT NULL COMMENT '消息body的json串',
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建记录时间',
  PRIMARY KEY (`_id`),
  KEY `idx_sender` (`sender`),
  KEY `idx_target` (`target`),
  KEY `idx_cid` (`company_id`),
  KEY `idx_mid` (`mid`),
  KEY `ssl` (`ssl`),
  KEY `target_mid` (`target`,`mid`,`vote_count`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=565247 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `msgs_24`
--

DROP TABLE IF EXISTS `msgs_24`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msgs_24` (
  `_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender` char(24) NOT NULL DEFAULT '' COMMENT '消息发送方user_id',
  `target` char(24) NOT NULL DEFAULT '' COMMENT '消息接受方，若为p2p消息，值为user_id; 若为群组消息，值为group_id',
  `company_id` char(24) DEFAULT NULL,
  `ssl` int(1) NOT NULL DEFAULT '0',
  `mid` double unsigned NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'p2p/group',
  `vote_count` int(11) NOT NULL DEFAULT '0' COMMENT '+1数量',
  `msg_body` text CHARACTER SET utf8mb4 NOT NULL COMMENT '消息body的json串',
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建记录时间',
  PRIMARY KEY (`_id`),
  KEY `idx_sender` (`sender`),
  KEY `idx_target` (`target`),
  KEY `idx_cid` (`company_id`),
  KEY `idx_mid` (`mid`),
  KEY `ssl` (`ssl`)
) ENGINE=InnoDB AUTO_INCREMENT=148370 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `msgs_25`
--

DROP TABLE IF EXISTS `msgs_25`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msgs_25` (
  `_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender` char(24) NOT NULL DEFAULT '' COMMENT '消息发送方user_id',
  `target` char(24) NOT NULL DEFAULT '' COMMENT '消息接受方，若为p2p消息，值为user_id; 若为群组消息，值为group_id',
  `company_id` char(24) DEFAULT NULL,
  `ssl` int(1) NOT NULL DEFAULT '0',
  `mid` double unsigned NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'p2p/group',
  `vote_count` int(11) NOT NULL DEFAULT '0' COMMENT '+1数量',
  `msg_body` text CHARACTER SET utf8mb4 NOT NULL COMMENT '消息body的json串',
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建记录时间',
  PRIMARY KEY (`_id`),
  KEY `idx_sender` (`sender`),
  KEY `idx_target` (`target`),
  KEY `idx_cid` (`company_id`),
  KEY `idx_mid` (`mid`),
  KEY `ssl` (`ssl`)
) ENGINE=InnoDB AUTO_INCREMENT=438364 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `msgs_26`
--

DROP TABLE IF EXISTS `msgs_26`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msgs_26` (
  `_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender` char(24) NOT NULL DEFAULT '' COMMENT '消息发送方user_id',
  `target` char(24) NOT NULL DEFAULT '' COMMENT '消息接受方，若为p2p消息，值为user_id; 若为群组消息，值为group_id',
  `company_id` char(24) DEFAULT NULL,
  `ssl` int(1) NOT NULL DEFAULT '0',
  `mid` double unsigned NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'p2p/group',
  `vote_count` int(11) NOT NULL DEFAULT '0' COMMENT '+1数量',
  `msg_body` text CHARACTER SET utf8mb4 NOT NULL COMMENT '消息body的json串',
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建记录时间',
  PRIMARY KEY (`_id`),
  KEY `idx_sender` (`sender`),
  KEY `idx_target` (`target`),
  KEY `idx_cid` (`company_id`),
  KEY `idx_mid` (`mid`),
  KEY `ssl` (`ssl`)
) ENGINE=InnoDB AUTO_INCREMENT=145573 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `msgs_27`
--

DROP TABLE IF EXISTS `msgs_27`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msgs_27` (
  `_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender` char(24) NOT NULL DEFAULT '' COMMENT '消息发送方user_id',
  `target` char(24) NOT NULL DEFAULT '' COMMENT '消息接受方，若为p2p消息，值为user_id; 若为群组消息，值为group_id',
  `company_id` char(24) DEFAULT NULL,
  `ssl` int(1) NOT NULL DEFAULT '0',
  `mid` double unsigned NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'p2p/group',
  `vote_count` int(11) NOT NULL DEFAULT '0' COMMENT '+1数量',
  `msg_body` text CHARACTER SET utf8mb4 NOT NULL COMMENT '消息body的json串',
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建记录时间',
  PRIMARY KEY (`_id`),
  KEY `idx_sender` (`sender`),
  KEY `idx_target` (`target`),
  KEY `idx_cid` (`company_id`),
  KEY `idx_mid` (`mid`),
  KEY `ssl` (`ssl`)
) ENGINE=InnoDB AUTO_INCREMENT=441849 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `msgs_28`
--

DROP TABLE IF EXISTS `msgs_28`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msgs_28` (
  `_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender` char(24) NOT NULL DEFAULT '' COMMENT '消息发送方user_id',
  `target` char(24) NOT NULL DEFAULT '' COMMENT '消息接受方，若为p2p消息，值为user_id; 若为群组消息，值为group_id',
  `company_id` char(24) DEFAULT NULL,
  `ssl` int(1) NOT NULL DEFAULT '0',
  `mid` double unsigned NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'p2p/group',
  `vote_count` int(11) NOT NULL DEFAULT '0' COMMENT '+1数量',
  `msg_body` text CHARACTER SET utf8mb4 NOT NULL COMMENT '消息body的json串',
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建记录时间',
  PRIMARY KEY (`_id`),
  KEY `idx_sender` (`sender`),
  KEY `idx_target` (`target`),
  KEY `idx_cid` (`company_id`),
  KEY `idx_mid` (`mid`),
  KEY `ssl` (`ssl`)
) ENGINE=InnoDB AUTO_INCREMENT=437789 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `msgs_29`
--

DROP TABLE IF EXISTS `msgs_29`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msgs_29` (
  `_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender` char(24) NOT NULL DEFAULT '' COMMENT '消息发送方user_id',
  `target` char(24) NOT NULL DEFAULT '' COMMENT '消息接受方，若为p2p消息，值为user_id; 若为群组消息，值为group_id',
  `company_id` char(24) DEFAULT NULL,
  `ssl` int(1) NOT NULL DEFAULT '0',
  `mid` double unsigned NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'p2p/group',
  `vote_count` int(11) NOT NULL DEFAULT '0' COMMENT '+1数量',
  `msg_body` text CHARACTER SET utf8mb4 NOT NULL COMMENT '消息body的json串',
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建记录时间',
  PRIMARY KEY (`_id`),
  KEY `idx_sender` (`sender`),
  KEY `idx_target` (`target`),
  KEY `idx_cid` (`company_id`),
  KEY `idx_mid` (`mid`),
  KEY `ssl` (`ssl`)
) ENGINE=InnoDB AUTO_INCREMENT=340011 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `msgs_3`
--

DROP TABLE IF EXISTS `msgs_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msgs_3` (
  `_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender` char(24) NOT NULL DEFAULT '' COMMENT '消息发送方user_id',
  `target` char(24) NOT NULL DEFAULT '' COMMENT '消息接受方，若为p2p消息，值为user_id; 若为群组消息，值为group_id',
  `company_id` char(24) DEFAULT NULL,
  `ssl` int(1) NOT NULL DEFAULT '0',
  `mid` double unsigned NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'p2p/group',
  `vote_count` int(11) NOT NULL DEFAULT '0' COMMENT '+1数量',
  `msg_body` text CHARACTER SET utf8mb4 NOT NULL COMMENT '消息body的json串',
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建记录时间',
  PRIMARY KEY (`_id`),
  KEY `idx_sender` (`sender`),
  KEY `idx_target` (`target`),
  KEY `idx_cid` (`company_id`),
  KEY `idx_mid` (`mid`),
  KEY `ssl` (`ssl`)
) ENGINE=InnoDB AUTO_INCREMENT=147853 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `msgs_30`
--

DROP TABLE IF EXISTS `msgs_30`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msgs_30` (
  `_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender` char(24) NOT NULL DEFAULT '' COMMENT '消息发送方user_id',
  `target` char(24) NOT NULL DEFAULT '' COMMENT '消息接受方，若为p2p消息，值为user_id; 若为群组消息，值为group_id',
  `company_id` char(24) DEFAULT NULL,
  `ssl` int(1) NOT NULL DEFAULT '0',
  `mid` double unsigned NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'p2p/group',
  `vote_count` int(11) NOT NULL DEFAULT '0' COMMENT '+1数量',
  `msg_body` text CHARACTER SET utf8mb4 NOT NULL COMMENT '消息body的json串',
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建记录时间',
  PRIMARY KEY (`_id`),
  KEY `idx_sender` (`sender`),
  KEY `idx_target` (`target`),
  KEY `idx_cid` (`company_id`),
  KEY `idx_mid` (`mid`),
  KEY `ssl` (`ssl`)
) ENGINE=InnoDB AUTO_INCREMENT=471341 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `msgs_31`
--

DROP TABLE IF EXISTS `msgs_31`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msgs_31` (
  `_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender` char(24) NOT NULL DEFAULT '' COMMENT '消息发送方user_id',
  `target` char(24) NOT NULL DEFAULT '' COMMENT '消息接受方，若为p2p消息，值为user_id; 若为群组消息，值为group_id',
  `company_id` char(24) DEFAULT NULL,
  `ssl` int(1) NOT NULL DEFAULT '0',
  `mid` double unsigned NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'p2p/group',
  `vote_count` int(11) NOT NULL DEFAULT '0' COMMENT '+1数量',
  `msg_body` text CHARACTER SET utf8mb4 NOT NULL COMMENT '消息body的json串',
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建记录时间',
  PRIMARY KEY (`_id`),
  KEY `idx_sender` (`sender`),
  KEY `idx_target` (`target`),
  KEY `idx_cid` (`company_id`),
  KEY `idx_mid` (`mid`),
  KEY `ssl` (`ssl`)
) ENGINE=InnoDB AUTO_INCREMENT=139704 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `msgs_4`
--

DROP TABLE IF EXISTS `msgs_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msgs_4` (
  `_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender` char(24) NOT NULL DEFAULT '' COMMENT '消息发送方user_id',
  `target` char(24) NOT NULL DEFAULT '' COMMENT '消息接受方，若为p2p消息，值为user_id; 若为群组消息，值为group_id',
  `company_id` char(24) DEFAULT NULL,
  `ssl` int(1) NOT NULL DEFAULT '0',
  `mid` double unsigned NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'p2p/group',
  `vote_count` int(11) NOT NULL DEFAULT '0' COMMENT '+1数量',
  `msg_body` text CHARACTER SET utf8mb4 NOT NULL COMMENT '消息body的json串',
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建记录时间',
  PRIMARY KEY (`_id`),
  KEY `idx_sender` (`sender`),
  KEY `idx_target` (`target`),
  KEY `idx_cid` (`company_id`),
  KEY `idx_mid` (`mid`),
  KEY `ssl` (`ssl`)
) ENGINE=InnoDB AUTO_INCREMENT=440269 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `msgs_5`
--

DROP TABLE IF EXISTS `msgs_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msgs_5` (
  `_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender` char(24) NOT NULL DEFAULT '' COMMENT '消息发送方user_id',
  `target` char(24) NOT NULL DEFAULT '' COMMENT '消息接受方，若为p2p消息，值为user_id; 若为群组消息，值为group_id',
  `company_id` char(24) DEFAULT NULL,
  `ssl` int(1) NOT NULL DEFAULT '0',
  `mid` double unsigned NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'p2p/group',
  `vote_count` int(11) NOT NULL DEFAULT '0' COMMENT '+1数量',
  `msg_body` text CHARACTER SET utf8mb4 NOT NULL COMMENT '消息body的json串',
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建记录时间',
  PRIMARY KEY (`_id`),
  KEY `idx_sender` (`sender`),
  KEY `idx_target` (`target`),
  KEY `idx_cid` (`company_id`),
  KEY `idx_mid` (`mid`),
  KEY `ssl` (`ssl`)
) ENGINE=InnoDB AUTO_INCREMENT=437233 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `msgs_6`
--

DROP TABLE IF EXISTS `msgs_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msgs_6` (
  `_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender` char(24) NOT NULL DEFAULT '' COMMENT '消息发送方user_id',
  `target` char(24) NOT NULL DEFAULT '' COMMENT '消息接受方，若为p2p消息，值为user_id; 若为群组消息，值为group_id',
  `company_id` char(24) DEFAULT NULL,
  `ssl` int(1) NOT NULL DEFAULT '0',
  `mid` double unsigned NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'p2p/group',
  `vote_count` int(11) NOT NULL DEFAULT '0' COMMENT '+1数量',
  `msg_body` text CHARACTER SET utf8mb4 NOT NULL COMMENT '消息body的json串',
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建记录时间',
  PRIMARY KEY (`_id`),
  KEY `idx_sender` (`sender`),
  KEY `idx_target` (`target`),
  KEY `idx_cid` (`company_id`),
  KEY `idx_mid` (`mid`),
  KEY `ssl` (`ssl`)
) ENGINE=InnoDB AUTO_INCREMENT=440633 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `msgs_7`
--

DROP TABLE IF EXISTS `msgs_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msgs_7` (
  `_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender` char(24) NOT NULL DEFAULT '' COMMENT '消息发送方user_id',
  `target` char(24) NOT NULL DEFAULT '' COMMENT '消息接受方，若为p2p消息，值为user_id; 若为群组消息，值为group_id',
  `company_id` char(24) DEFAULT NULL,
  `ssl` int(1) NOT NULL DEFAULT '0',
  `mid` double unsigned NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'p2p/group',
  `vote_count` int(11) NOT NULL DEFAULT '0' COMMENT '+1数量',
  `msg_body` text CHARACTER SET utf8mb4 NOT NULL COMMENT '消息body的json串',
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建记录时间',
  PRIMARY KEY (`_id`),
  KEY `idx_sender` (`sender`),
  KEY `idx_target` (`target`),
  KEY `idx_cid` (`company_id`),
  KEY `idx_mid` (`mid`),
  KEY `ssl` (`ssl`)
) ENGINE=InnoDB AUTO_INCREMENT=440236 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `msgs_8`
--

DROP TABLE IF EXISTS `msgs_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msgs_8` (
  `_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender` char(24) NOT NULL DEFAULT '' COMMENT '消息发送方user_id',
  `target` char(24) NOT NULL DEFAULT '' COMMENT '消息接受方，若为p2p消息，值为user_id; 若为群组消息，值为group_id',
  `company_id` char(24) DEFAULT NULL,
  `ssl` int(1) NOT NULL DEFAULT '0',
  `mid` double unsigned NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'p2p/group',
  `vote_count` int(11) NOT NULL DEFAULT '0' COMMENT '+1数量',
  `msg_body` text CHARACTER SET utf8mb4 NOT NULL COMMENT '消息body的json串',
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建记录时间',
  PRIMARY KEY (`_id`),
  KEY `idx_sender` (`sender`),
  KEY `idx_target` (`target`),
  KEY `idx_cid` (`company_id`),
  KEY `idx_mid` (`mid`),
  KEY `ssl` (`ssl`)
) ENGINE=InnoDB AUTO_INCREMENT=166718 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `msgs_9`
--

DROP TABLE IF EXISTS `msgs_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msgs_9` (
  `_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender` char(24) NOT NULL DEFAULT '' COMMENT '消息发送方user_id',
  `target` char(24) NOT NULL DEFAULT '' COMMENT '消息接受方，若为p2p消息，值为user_id; 若为群组消息，值为group_id',
  `company_id` char(24) DEFAULT NULL,
  `ssl` int(1) NOT NULL DEFAULT '0',
  `mid` double unsigned NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'p2p/group',
  `vote_count` int(11) NOT NULL DEFAULT '0' COMMENT '+1数量',
  `msg_body` text CHARACTER SET utf8mb4 NOT NULL COMMENT '消息body的json串',
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建记录时间',
  PRIMARY KEY (`_id`),
  KEY `idx_sender` (`sender`),
  KEY `idx_target` (`target`),
  KEY `idx_cid` (`company_id`),
  KEY `idx_mid` (`mid`),
  KEY `ssl` (`ssl`)
) ENGINE=InnoDB AUTO_INCREMENT=1039261 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-04  3:06:13
