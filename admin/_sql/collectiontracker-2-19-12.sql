# ************************************************************
# Sequel Pro SQL dump
# Version 3408
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.1.50)
# Database: collectiontracker
# Generation Time: 2012-02-19 22:26:53 -0600
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table ct_administrador
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ct_administrador`;

CREATE TABLE `ct_administrador` (
  `adm_id` int(11) NOT NULL AUTO_INCREMENT,
  `adm_nome` varchar(250) DEFAULT NULL,
  `adm_email` varchar(250) DEFAULT NULL,
  `adm_senha` varchar(250) DEFAULT NULL,
  `adm_status` int(1) DEFAULT '1',
  `adm_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `adm_n` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`adm_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `ct_administrador` WRITE;
/*!40000 ALTER TABLE `ct_administrador` DISABLE KEYS */;

INSERT INTO `ct_administrador` (`adm_id`, `adm_nome`, `adm_email`, `adm_senha`, `adm_status`, `adm_timestamp`, `adm_n`)
VALUES
	(1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329',1,'2010-06-12 20:13:30',NULL);

/*!40000 ALTER TABLE `ct_administrador` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ct_album
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ct_album`;

CREATE TABLE `ct_album` (
  `abm_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `abm_cad_id` int(11) DEFAULT NULL,
  `abm_titulo` varchar(250) DEFAULT NULL,
  `abm_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `abm_status` tinyint(1) DEFAULT '1',
  `abm_n` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`abm_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table ct_background
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ct_background`;

CREATE TABLE `ct_background` (
  `bg_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `bg_titulo` varchar(250) DEFAULT NULL,
  `bg_status` tinyint(1) DEFAULT '1',
  `bg_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `bg_n` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`bg_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table ct_cadastro
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ct_cadastro`;

CREATE TABLE `ct_cadastro` (
  `cad_id` int(11) NOT NULL AUTO_INCREMENT,
  `cad_login` varchar(250) DEFAULT NULL,
  `cad_email` varchar(250) DEFAULT NULL,
  `cad_status` int(1) DEFAULT '1',
  `cad_senha` varchar(250) DEFAULT NULL,
  `cad_nome` varchar(250) DEFAULT NULL,
  `cad_nascimento` date DEFAULT NULL,
  `cad_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `cad_ultimo_login` datetime DEFAULT NULL,
  `cad_n` varchar(250) DEFAULT NULL,
  `cad_ip` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cad_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `ct_cadastro` WRITE;
/*!40000 ALTER TABLE `ct_cadastro` DISABLE KEYS */;

INSERT INTO `ct_cadastro` (`cad_id`, `cad_login`, `cad_email`, `cad_status`, `cad_senha`, `cad_nome`, `cad_nascimento`, `cad_timestamp`, `cad_ultimo_login`, `cad_n`, `cad_ip`)
VALUES
	(37,'lslucas','lslucas@gmail.com',1,'LøÞÕ~uîë\0 ',NULL,NULL,'2012-02-19 22:10:22','2012-02-19 22:17:09',NULL,NULL),
	(7,'lucasserafim','contato@lucasserafim.com.br',1,'b4c729b939ae76681b25cd04b68ab227','Contato Lucas Serafim','1990-09-19','2011-07-22 11:50:36','2012-02-19 22:17:09',NULL,'127.0.0.1'),
	(8,'alex','hechicera_17@msn.com',1,'­7´Ä¹i)ÉÆä','','1988-09-15','2011-08-05 14:49:06','2012-02-19 22:17:09',NULL,'127.0.0.1'),
	(13,'lucas.serafim','lucas.serafim@hotmail.com',1,'5b07bad232b686e485444887e00fdb03','Lucas Serafim','1990-09-19','2011-09-16 19:57:10','2012-02-19 22:17:09',NULL,'127.0.0.1'),
	(36,'lucas_serafim','lukswd@hotmail.com',1,'8a84d92a9c744d3a52147920503be40b',NULL,NULL,'2012-02-19 21:35:01','2012-02-19 22:17:09',NULL,NULL),
	(39,'lps','suporte@duothink.us',1,'ú«þìÃÊxZ\n1£','',NULL,'2012-02-19 22:21:09',NULL,'vs5itg3hep#na42ep8us2t4u22h0?txvb86auxzztdsunieiwf2oz?oq2bw2vi4cwydwki2joi5g201202200221',NULL);

/*!40000 ALTER TABLE `ct_cadastro` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ct_categoria
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ct_categoria`;

CREATE TABLE `ct_categoria` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_idrel` int(11) DEFAULT NULL,
  `cat_titulo` varchar(250) DEFAULT NULL,
  `cat_area` set('Pet','Adesivo') DEFAULT NULL,
  `cat_subarea` varchar(100) DEFAULT NULL,
  `cat_pos` int(11) DEFAULT '0',
  `cat_status` tinyint(1) DEFAULT '1',
  `cat_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `cat_n` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `ct_categoria` WRITE;
/*!40000 ALTER TABLE `ct_categoria` DISABLE KEYS */;

INSERT INTO `ct_categoria` (`cat_id`, `cat_idrel`, `cat_titulo`, `cat_area`, `cat_subarea`, `cat_pos`, `cat_status`, `cat_timestamp`, `cat_n`)
VALUES
	(1,NULL,'Cãozinho','Pet',NULL,0,1,'2012-02-19 17:51:02','mc4eemivzpw5jv4vczmrq2?ayfm7rne4q9oa2xc7be030#4jdfgunhvboo962dyxssdzvgvxnk6t201202190951'),
	(2,NULL,'Gatinho','Pet',NULL,0,1,'2012-02-19 17:51:07','925mzmq6qwo30h7uwf4#3gf34f304#u2goumf?hwww53k2m88fmz499wd03oenem2zz9e8?3t6uj201202190951'),
	(3,NULL,'Estrelas','Adesivo',NULL,0,1,'2012-02-19 17:51:22','e6y75wtfoy8cycb?bm#80eyztky5cx3y97uhstomgkpm5rm8i35#n9ymz3x36pq4krr4?7vyg??b201202190951'),
	(4,NULL,'Borboletas','Adesivo',NULL,0,1,'2012-02-19 17:51:43','h8sb38#i2it9r?0esjh8e?tj#yrz3tt?rrsz59#bg9?d9fi8r85bnn4mr0s0irff9e7hc6j0ijjg201202190951');

/*!40000 ALTER TABLE `ct_categoria` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ct_debuglog
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ct_debuglog`;

CREATE TABLE `ct_debuglog` (
  `del_id` int(11) NOT NULL AUTO_INCREMENT,
  `del_adm_id` int(11) DEFAULT NULL,
  `del_nome` varchar(250) DEFAULT NULL,
  `del_useragent` varchar(250) DEFAULT NULL,
  `del_ip` varchar(30) DEFAULT NULL,
  `del_err_number` varchar(250) DEFAULT NULL,
  `del_err` text,
  `del_err_file` varchar(250) DEFAULT NULL,
  `del_err_line` varchar(250) DEFAULT NULL,
  `del_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`del_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table ct_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ct_log`;

CREATE TABLE `ct_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_adm_id` int(11) DEFAULT NULL,
  `log_nome` varchar(250) DEFAULT NULL,
  `log_email` varchar(250) DEFAULT NULL,
  `log_senha` varchar(250) DEFAULT NULL,
  `log_php_self` text,
  `log_query_string` text,
  `log_request_uri` text,
  `log_request_time` varchar(250) DEFAULT NULL,
  `log_http_referer` varchar(250) DEFAULT NULL,
  `log_ip` varchar(30) DEFAULT NULL,
  `log_host` varchar(250) DEFAULT NULL,
  `log_useragent` varchar(250) DEFAULT NULL,
  `log_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `ct_log` WRITE;
/*!40000 ALTER TABLE `ct_log` DISABLE KEYS */;

INSERT INTO `ct_log` (`log_id`, `log_adm_id`, `log_nome`, `log_email`, `log_senha`, `log_php_self`, `log_query_string`, `log_request_uri`, `log_request_time`, `log_http_referer`, `log_ip`, `log_host`, `log_useragent`, `log_timestamp`)
VALUES
	(1,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=categoria','/collectiontracker/admin/?p=categoria','1329609742','http://localhost/collectiontracker/admin/?p=menu&update&item=50&pai=48','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-18 18:02:22'),
	(2,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=modulo','/collectiontracker/admin/?p=modulo','1329609752','http://localhost/collectiontracker/admin/?p=categoria','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-18 18:02:32'),
	(3,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=modulo&update&item=20','/collectiontracker/admin/?p=modulo&update&item=20','1329609753','http://localhost/collectiontracker/admin/?p=modulo','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-18 18:02:33'),
	(4,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=modulo&update&item=20','/collectiontracker/admin/?p=modulo&update&item=20','1329609762','http://localhost/collectiontracker/admin/?p=modulo&update&item=20','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-18 18:02:42'),
	(5,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=menu','/collectiontracker/admin/?p=menu','1329609765','http://localhost/collectiontracker/admin/?p=modulo&update&item=20','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-18 18:02:45'),
	(6,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=menu&update&item=48','/collectiontracker/admin/?p=menu&update&item=48','1329609768','http://localhost/collectiontracker/admin/?p=menu','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-18 18:02:48'),
	(7,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=menu&update&item=48','/collectiontracker/admin/?p=menu&update&item=48','1329609770','http://localhost/collectiontracker/admin/?p=menu&update&item=48','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-18 18:02:50'),
	(8,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=menu','/collectiontracker/admin/?p=menu','1329609772','http://localhost/collectiontracker/admin/?p=menu&update&item=48','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-18 18:02:52'),
	(9,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=menu&update&item=49&pai=48','/collectiontracker/admin/?p=menu&update&item=49&pai=48','1329609774','http://localhost/collectiontracker/admin/?p=menu','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-18 18:02:54'),
	(10,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=menu&update&item=49&pai=48','/collectiontracker/admin/?p=menu&update&item=49&pai=48','1329609777','http://localhost/collectiontracker/admin/?p=menu&update&item=49&pai=48','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-18 18:02:57'),
	(11,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=menu','/collectiontracker/admin/?p=menu','1329609779','http://localhost/collectiontracker/admin/?p=menu&update&item=49&pai=48','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-18 18:02:59'),
	(12,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=menu&update&item=50&pai=48','/collectiontracker/admin/?p=menu&update&item=50&pai=48','1329609781','http://localhost/collectiontracker/admin/?p=menu','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-18 18:03:01'),
	(13,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=menu&update&item=50&pai=48','/collectiontracker/admin/?p=menu&update&item=50&pai=48','1329609784','http://localhost/collectiontracker/admin/?p=menu&update&item=50&pai=48','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-18 18:03:04'),
	(14,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=menu','/collectiontracker/admin/?p=menu','1329609787','http://localhost/collectiontracker/admin/?p=menu&update&item=50&pai=48','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-18 18:03:07'),
	(15,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=selo','/collectiontracker/admin/?p=selo','1329609801','http://localhost/collectiontracker/admin/?p=menu','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-18 18:03:21'),
	(16,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=modulo','/collectiontracker/admin/?p=modulo','1329689061','http://localhost/collectiontracker/admin/?p=selo','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 16:04:26'),
	(17,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=menu','/collectiontracker/admin/?p=menu','1329689077','http://localhost/collectiontracker/admin/?p=modulo','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 16:04:38'),
	(18,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=menu&status&item=21&noVisual','/collectiontracker/admin/?p=menu&status&item=21&noVisual','1329689082','http://localhost/collectiontracker/admin/?p=menu','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 16:04:42'),
	(19,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','','/collectiontracker/admin/index.php','1329689085','http://localhost/collectiontracker/admin/?p=menu','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 16:04:45'),
	(20,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro','/collectiontracker/admin/index.php?p=cadastro','1329689088','http://localhost/collectiontracker/admin/index.php','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 16:04:48'),
	(21,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro','/collectiontracker/admin/index.php?p=cadastro','1329689866','http://localhost/collectiontracker/admin/index.php','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 16:17:48'),
	(22,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro','/collectiontracker/admin/index.php?p=cadastro','1329689879','http://localhost/collectiontracker/admin/index.php','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 16:17:59'),
	(23,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro','/collectiontracker/admin/index.php?p=cadastro','1329689912','http://localhost/collectiontracker/admin/index.php','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 16:18:32'),
	(24,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro','/collectiontracker/admin/index.php?p=cadastro','1329689962','http://localhost/collectiontracker/admin/index.php','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 16:19:23'),
	(25,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro&update&item=8','/collectiontracker/admin/index.php?p=cadastro&update&item=8','1329689967','http://localhost/collectiontracker/admin/index.php?p=cadastro','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 16:19:27'),
	(26,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro&update&item=8','/collectiontracker/admin/index.php?p=cadastro&update&item=8','1329689974','http://localhost/collectiontracker/admin/index.php?p=cadastro&update&item=8','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 16:19:34'),
	(27,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro&update&item=8','/collectiontracker/admin/index.php?p=cadastro&update&item=8','1329689993','http://localhost/collectiontracker/admin/index.php?p=cadastro&update&item=8','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 16:19:53'),
	(28,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro&update&item=8','/collectiontracker/admin/index.php?p=cadastro&update&item=8','1329690779','http://localhost/collectiontracker/admin/index.php?p=cadastro&update&item=8','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 16:32:59'),
	(29,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro&update&item=8','/collectiontracker/admin/index.php?p=cadastro&update&item=8','1329690828','http://localhost/collectiontracker/admin/index.php?p=cadastro&update&item=8','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 16:33:48'),
	(30,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro','/collectiontracker/admin/index.php?p=cadastro','1329690830','http://localhost/collectiontracker/admin/index.php?p=cadastro&update&item=8','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 16:33:50'),
	(31,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro&insert','/collectiontracker/admin/index.php?p=cadastro&insert','1329690835','http://localhost/collectiontracker/admin/index.php?p=cadastro','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 16:33:55'),
	(32,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro&insert','/collectiontracker/admin/index.php?p=cadastro&insert','1329690911','http://localhost/collectiontracker/admin/index.php?p=cadastro&insert','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 16:35:12'),
	(33,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro&insert','/collectiontracker/admin/index.php?p=cadastro&insert','1329690989','http://localhost/collectiontracker/admin/index.php?p=cadastro&insert','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 16:36:29'),
	(34,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro&insert','/collectiontracker/admin/index.php?p=cadastro&insert','1329691005','http://localhost/collectiontracker/admin/index.php?p=cadastro&insert','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 16:36:45'),
	(35,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro&insert','/collectiontracker/admin/index.php?p=cadastro&insert','1329691023','http://localhost/collectiontracker/admin/index.php?p=cadastro&insert','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 16:37:03'),
	(36,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro&insert','/collectiontracker/admin/index.php?p=cadastro&insert','1329691091','http://localhost/collectiontracker/admin/index.php?p=cadastro&insert','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 16:38:11'),
	(37,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro&insert','/collectiontracker/admin/index.php?p=cadastro&insert','1329691251','http://localhost/collectiontracker/admin/index.php?p=cadastro&insert','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 16:40:51'),
	(38,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro&insert','/collectiontracker/admin/index.php?p=cadastro&insert','1329691291','http://localhost/collectiontracker/admin/index.php?p=cadastro&insert','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 16:41:31'),
	(39,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro&insert','/collectiontracker/admin/index.php?p=cadastro&insert','1329691330','http://localhost/collectiontracker/admin/index.php?p=cadastro&insert','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 16:42:12'),
	(40,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro&insert','/collectiontracker/admin/index.php?p=cadastro&insert','1329691385','http://localhost/collectiontracker/admin/index.php?p=cadastro&insert','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 16:43:05'),
	(41,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro&insert','/collectiontracker/admin/index.php?p=cadastro&insert','1329691414','http://localhost/collectiontracker/admin/index.php?p=cadastro&insert','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 16:43:34'),
	(42,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro&insert','/collectiontracker/admin/index.php?p=cadastro&insert','1329691477','http://localhost/collectiontracker/admin/index.php?p=cadastro&insert','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 16:44:37'),
	(43,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro&insert','/collectiontracker/admin/index.php?p=cadastro&insert','1329691492','http://localhost/collectiontracker/admin/index.php?p=cadastro&insert','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 16:44:52'),
	(44,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro&insert','/collectiontracker/admin/index.php?p=cadastro&insert','1329691502','http://localhost/collectiontracker/admin/index.php?p=cadastro&insert','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 16:45:02'),
	(45,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro&insert','/collectiontracker/admin/index.php?p=cadastro&insert','1329691512','http://localhost/collectiontracker/admin/index.php?p=cadastro&insert','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 16:45:12'),
	(46,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro&insert','/collectiontracker/admin/index.php?p=cadastro&insert','1329691526','http://localhost/collectiontracker/admin/index.php?p=cadastro&insert','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 16:45:26'),
	(47,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro&insert','/collectiontracker/admin/index.php?p=cadastro&insert','1329691553','http://localhost/collectiontracker/admin/index.php?p=cadastro&insert','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 16:45:53'),
	(48,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro&insert','/collectiontracker/admin/index.php?p=cadastro&insert','1329691580','http://localhost/collectiontracker/admin/index.php?p=cadastro&insert','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 16:46:20'),
	(49,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro&insert','/collectiontracker/admin/index.php?p=cadastro&insert','1329691630','http://localhost/collectiontracker/admin/index.php?p=cadastro&insert','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 16:47:11'),
	(50,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro&insert','/collectiontracker/admin/index.php?p=cadastro&insert','1329691656','http://localhost/collectiontracker/admin/index.php?p=cadastro&insert','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 16:47:36'),
	(51,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro&insert','/collectiontracker/admin/index.php?p=cadastro&insert','1329691692','http://localhost/collectiontracker/admin/index.php?p=cadastro&insert','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 16:48:12'),
	(52,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro&insert','/collectiontracker/admin/index.php?p=cadastro&insert','1329691815','http://localhost/collectiontracker/admin/index.php?p=cadastro&insert','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 16:50:16'),
	(53,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro&insert','/collectiontracker/admin/index.php?p=cadastro&insert','1329691994','http://localhost/collectiontracker/admin/index.php?p=cadastro&insert','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 16:53:14'),
	(54,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro&insert','/collectiontracker/admin/index.php?p=cadastro&insert','1329692075','http://localhost/collectiontracker/admin/index.php?p=cadastro&insert','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 16:54:35'),
	(55,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro&insert','/collectiontracker/admin/index.php?p=cadastro&insert','1329692236','http://localhost/collectiontracker/admin/index.php?p=cadastro&insert','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 16:57:16'),
	(56,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro','/collectiontracker/admin/index.php?p=cadastro','1329692349','http://localhost/collectiontracker/admin/index.php?p=cadastro&insert','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 16:59:09'),
	(57,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro','/collectiontracker/admin/index.php?p=cadastro','1329692910','http://localhost/collectiontracker/admin/index.php?p=cadastro&insert','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 17:08:30'),
	(58,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro','/collectiontracker/admin/index.php?p=cadastro','1329693318','http://localhost/collectiontracker/admin/index.php?p=cadastro&insert','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 17:15:18'),
	(59,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro','/collectiontracker/admin/index.php?p=cadastro','1329693324','http://localhost/collectiontracker/admin/index.php?p=cadastro&insert','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 17:15:24'),
	(60,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro','/collectiontracker/admin/index.php?p=cadastro','1329693378','http://localhost/collectiontracker/admin/index.php?p=cadastro&insert','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 17:16:18'),
	(61,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro','/collectiontracker/admin/index.php?p=cadastro','1329693416','http://localhost/collectiontracker/admin/index.php?p=cadastro&insert','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 17:16:56'),
	(62,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro','/collectiontracker/admin/index.php?p=cadastro','1329693547','http://localhost/collectiontracker/admin/index.php?p=cadastro&insert','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 17:19:07'),
	(63,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro','/collectiontracker/admin/index.php?p=cadastro','1329693903','http://localhost/collectiontracker/admin/index.php?p=cadastro&insert','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 17:25:03'),
	(64,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro&letra=A','/collectiontracker/admin/index.php?p=cadastro&letra=A','1329694074','http://localhost/collectiontracker/admin/index.php?p=cadastro','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 17:27:55'),
	(65,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro&letra=L','/collectiontracker/admin/index.php?p=cadastro&letra=L','1329694078','http://localhost/collectiontracker/admin/index.php?p=cadastro&letra=A','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 17:27:58'),
	(66,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro','/collectiontracker/admin/index.php?p=cadastro','1329694081','http://localhost/collectiontracker/admin/index.php?p=cadastro&letra=L','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 17:28:01'),
	(67,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro&orderby=cad_login%20DESC','/collectiontracker/admin/index.php?p=cadastro&orderby=cad_login%20DESC','1329694085','http://localhost/collectiontracker/admin/index.php?p=cadastro','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 17:28:05'),
	(68,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro&orderby=cad_timestamp%20DESC','/collectiontracker/admin/index.php?p=cadastro&orderby=cad_timestamp%20DESC','1329694087','http://localhost/collectiontracker/admin/index.php?p=cadastro&orderby=cad_login%20DESC','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 17:28:07'),
	(69,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=categoria','/collectiontracker/admin/index.php?p=categoria','1329695324','http://localhost/collectiontracker/admin/index.php?p=cadastro&orderby=cad_timestamp%20DESC','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 17:48:44'),
	(70,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=categoria&insert','/collectiontracker/admin/index.php?p=categoria&insert','1329695332','http://localhost/collectiontracker/admin/index.php?p=categoria','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 17:48:52'),
	(71,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=categoria&insert','/collectiontracker/admin/index.php?p=categoria&insert','1329695429','http://localhost/collectiontracker/admin/index.php?p=categoria','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 17:50:30'),
	(72,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=categoria&insert','/collectiontracker/admin/index.php?p=categoria&insert','1329695462','http://localhost/collectiontracker/admin/index.php?p=categoria&insert','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 17:51:02'),
	(73,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=categoria&insert','/collectiontracker/admin/index.php?p=categoria&insert','1329695464','http://localhost/collectiontracker/admin/index.php?p=categoria&insert','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 17:51:04'),
	(74,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=categoria&insert','/collectiontracker/admin/index.php?p=categoria&insert','1329695467','http://localhost/collectiontracker/admin/index.php?p=categoria&insert','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 17:51:07'),
	(75,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=categoria','/collectiontracker/admin/index.php?p=categoria','1329695469','http://localhost/collectiontracker/admin/index.php?p=categoria&insert','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 17:51:09'),
	(76,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=categoria&update&item=2','/collectiontracker/admin/index.php?p=categoria&update&item=2','1329695471','http://localhost/collectiontracker/admin/index.php?p=categoria','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 17:51:11'),
	(77,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=categoria&update&item=2','/collectiontracker/admin/index.php?p=categoria&update&item=2','1329695475','http://localhost/collectiontracker/admin/index.php?p=categoria&update&item=2','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 17:51:15'),
	(78,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=categoria&insert','/collectiontracker/admin/index.php?p=categoria&insert','1329695476','http://localhost/collectiontracker/admin/index.php?p=categoria&update&item=2','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 17:51:16'),
	(79,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=categoria&insert','/collectiontracker/admin/index.php?p=categoria&insert','1329695482','http://localhost/collectiontracker/admin/index.php?p=categoria&insert','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 17:51:22'),
	(80,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=categoria','/collectiontracker/admin/index.php?p=categoria','1329695483','http://localhost/collectiontracker/admin/index.php?p=categoria&insert','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 17:51:24'),
	(81,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=categoria&insert','/collectiontracker/admin/index.php?p=categoria&insert','1329695488','http://localhost/collectiontracker/admin/index.php?p=categoria','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 17:51:28'),
	(82,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=categoria&insert','/collectiontracker/admin/index.php?p=categoria&insert','1329695503','http://localhost/collectiontracker/admin/index.php?p=categoria&insert','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 17:51:43'),
	(83,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=categoria','/collectiontracker/admin/index.php?p=categoria','1329695505','http://localhost/collectiontracker/admin/index.php?p=categoria&insert','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 17:51:45'),
	(84,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=categoria&status&item=2&noVisual','/collectiontracker/admin/index.php?p=categoria&status&item=2&noVisual','1329695509','http://localhost/collectiontracker/admin/index.php?p=categoria','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 17:51:49'),
	(85,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=categoria&status&item=2&noVisual','/collectiontracker/admin/index.php?p=categoria&status&item=2&noVisual','1329695511','http://localhost/collectiontracker/admin/index.php?p=categoria','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 17:51:51'),
	(86,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=categoria&a=Adesivo','/collectiontracker/admin/index.php?p=categoria&a=Adesivo','1329695513','http://localhost/collectiontracker/admin/index.php?p=categoria','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 17:51:53'),
	(87,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=categoria&a=Pet','/collectiontracker/admin/index.php?p=categoria&a=Pet','1329695515','http://localhost/collectiontracker/admin/index.php?p=categoria&a=Adesivo','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 17:51:55'),
	(88,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=categoria','/collectiontracker/admin/index.php?p=categoria','1329695539','http://localhost/collectiontracker/admin/index.php?p=categoria&a=Pet','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 17:52:19'),
	(89,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro&insert','/collectiontracker/admin/index.php?p=cadastro&insert','1329711567','http://localhost/collectiontracker/admin/index.php?p=categoria','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 22:19:27'),
	(90,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro&insert','/collectiontracker/admin/index.php?p=cadastro&insert','1329711589','http://localhost/collectiontracker/admin/index.php?p=cadastro&insert','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 22:19:49'),
	(91,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=cadastro&insert','/collectiontracker/admin/index.php?p=cadastro&insert','1329711669','http://localhost/collectiontracker/admin/index.php?p=cadastro&insert','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-19 22:21:09');

/*!40000 ALTER TABLE `ct_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ct_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ct_menu`;

CREATE TABLE `ct_menu` (
  `men_id` int(11) NOT NULL AUTO_INCREMENT,
  `men_modulo_id` int(11) DEFAULT NULL,
  `men_pai` int(11) DEFAULT NULL,
  `men_nome` varchar(250) DEFAULT NULL,
  `men_link` varchar(250) DEFAULT NULL,
  `men_nivel` int(2) DEFAULT NULL,
  `men_status` int(1) DEFAULT '1',
  `men_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `men_n` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`men_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `ct_menu` WRITE;
/*!40000 ALTER TABLE `ct_menu` DISABLE KEYS */;

INSERT INTO `ct_menu` (`men_id`, `men_modulo_id`, `men_pai`, `men_nome`, `men_link`, `men_nivel`, `men_status`, `men_timestamp`, `men_n`)
VALUES
	(1,1,NULL,'Administrador',NULL,1,1,'2010-06-13 17:59:42',NULL),
	(2,NULL,1,'Listar','?p=administrador',NULL,1,'2010-06-13 18:00:00',NULL),
	(3,NULL,1,'Incluir','?p=administrador&insert',NULL,1,'2010-06-13 18:00:10',NULL),
	(5,4,NULL,'Menu','',4,1,'2010-06-13 19:36:07',NULL),
	(7,NULL,5,'Listar','?p=menu',NULL,1,'2010-06-13 20:07:19',NULL),
	(8,NULL,5,'Incluir','?p=menu&insert',NULL,1,'2010-07-04 23:56:30',NULL),
	(12,2,NULL,'Módulo','',4,1,'2010-07-09 20:06:19',NULL),
	(13,NULL,12,'Listar','?p=modulo',NULL,1,'2010-07-09 20:07:34',NULL),
	(14,NULL,12,'Incluir','?p=modulo&insert',NULL,1,'2010-07-09 20:09:32',NULL),
	(21,7,NULL,'Cadastros','',1,1,'2010-07-27 17:28:25',NULL),
	(22,NULL,21,'Incluir','?p=cadastro&insert',NULL,1,'2010-07-27 17:28:54',NULL),
	(23,NULL,21,'Listar','?p=cadastro',NULL,1,'2010-07-27 17:29:20',NULL),
	(48,20,NULL,'Selos','',1,1,'2011-09-21 18:46:55',NULL),
	(49,NULL,48,'Inserir','?p=selo&insert',NULL,1,'2011-09-21 18:47:11',NULL),
	(45,NULL,43,'Listar','?p=categoria',NULL,1,'2011-05-19 23:31:57',NULL),
	(44,NULL,43,'Inserir','?p=categoria&insert',NULL,1,'2011-05-19 23:31:40',NULL),
	(43,17,NULL,'Categorias','',1,1,'2011-05-19 23:31:27',NULL),
	(50,NULL,48,'Listar','?p=selo',NULL,1,'2011-09-21 18:47:19',NULL);

/*!40000 ALTER TABLE `ct_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ct_modulo
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ct_modulo`;

CREATE TABLE `ct_modulo` (
  `mod_id` int(11) NOT NULL AUTO_INCREMENT,
  `mod_nome` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `mod_nome_singular` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `mod_nome_plural` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `mod_genero` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `mod_path` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `mod_pre` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `mod_icone` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `mod_status` int(1) DEFAULT '1',
  `mod_display` int(1) DEFAULT '1',
  `mod_private` int(1) DEFAULT '0',
  `mod_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `mod_n` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`mod_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

LOCK TABLES `ct_modulo` WRITE;
/*!40000 ALTER TABLE `ct_modulo` DISABLE KEYS */;

INSERT INTO `ct_modulo` (`mod_id`, `mod_nome`, `mod_nome_singular`, `mod_nome_plural`, `mod_genero`, `mod_path`, `mod_pre`, `mod_icone`, `mod_status`, `mod_display`, `mod_private`, `mod_timestamp`, `mod_n`)
VALUES
	(1,'Administrador','Administrador','Administradores','o','administrador',X'61646D','',1,1,0,'2010-06-12 18:14:49',NULL),
	(2,'Módulo','Módulo','Módulos','o','modulo',X'6D6F64',NULL,1,1,1,'2010-06-12 18:15:20',NULL),
	(4,'Menu','Menu','Menus','o','menu',X'6D656E',NULL,1,1,1,'2010-07-04 18:21:01',NULL),
	(7,'Cadastros','Cadastro','Cadastros','o','cadastro',X'636164','',1,1,0,'2010-07-27 17:28:14',X'6E676A387938683533683676676A366939796D366F66726B747569356739773F656D6E6A6A6164736A7063727A236664633970386537686437727074366174726E6D32636F3676796A657670323031303037323730353238'),
	(17,'Categorias','Categoria','Categorias','a','categoria',X'636174','',1,1,0,'2011-05-19 23:31:17',X'376D646A766E7171303678626562323969776471796366646D766969747674376E646639726236676F7369743F71726973616666656D32726E3F673861303435357069327264236B62683663323031313035323030313331'),
	(20,'Selos','Selo','Selos','o','selo',X'73656C','',1,1,0,'2011-09-21 18:46:13',X'236273762372763865616E636A396462656D3670373334306733362323306A6F33347067307164367372706836236A3F327670786F7A3461387A7237363230633F666A32776F627536723332323031313039323130383436');

/*!40000 ALTER TABLE `ct_modulo` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ct_r_abm_pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ct_r_abm_pages`;

CREATE TABLE `ct_r_abm_pages` (
  `rap_page` smallint(3) DEFAULT NULL COMMENT 'Page Number',
  `rap_cad_id` int(11) unsigned NOT NULL COMMENT 'Cad Id',
  `rap_abm_id` int(11) DEFAULT NULL COMMENT 'Album Id',
  `rap_sel_id` int(11) DEFAULT NULL COMMENT 'PET Id',
  `rap_pos` varchar(30) DEFAULT NULL COMMENT 'X/Y of object',
  `rap_size` varchar(30) DEFAULT NULL COMMENT 'Size of object',
  KEY `rap_abm_id` (`rap_abm_id`),
  KEY `rap_page` (`rap_page`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table ct_r_adm_mod
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ct_r_adm_mod`;

CREATE TABLE `ct_r_adm_mod` (
  `ram_id` int(11) NOT NULL AUTO_INCREMENT,
  `ram_adm_id` int(11) DEFAULT NULL,
  `ram_mod_id` int(11) DEFAULT NULL,
  `ram_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ram_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `ct_r_adm_mod` WRITE;
/*!40000 ALTER TABLE `ct_r_adm_mod` DISABLE KEYS */;

INSERT INTO `ct_r_adm_mod` (`ram_id`, `ram_adm_id`, `ram_mod_id`, `ram_timestamp`)
VALUES
	(90,1,8,'2010-09-04 16:36:12'),
	(89,1,7,'2010-09-04 16:36:12'),
	(88,1,6,'2010-09-04 16:36:12'),
	(87,1,5,'2010-09-04 16:36:12'),
	(86,1,1,'2010-09-04 16:36:12'),
	(76,9,1,'2010-08-26 10:32:46'),
	(77,9,5,'2010-08-26 10:32:46'),
	(78,9,6,'2010-08-26 10:32:46'),
	(79,9,7,'2010-08-26 10:32:46'),
	(80,9,8,'2010-08-26 10:32:46'),
	(81,9,9,'2010-08-26 10:32:46'),
	(82,9,10,'2010-08-26 10:32:46'),
	(83,9,11,'2010-08-26 10:32:46'),
	(84,9,12,'2010-08-26 10:32:46'),
	(85,9,13,'2010-08-26 10:32:46'),
	(91,1,9,'2010-09-04 16:36:12'),
	(92,1,10,'2010-09-04 16:36:12'),
	(93,1,11,'2010-09-04 16:36:12'),
	(94,1,12,'2010-09-04 16:36:12'),
	(95,1,13,'2010-09-04 16:36:12');

/*!40000 ALTER TABLE `ct_r_adm_mod` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ct_r_bg_galeria
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ct_r_bg_galeria`;

CREATE TABLE `ct_r_bg_galeria` (
  `rbg_id` int(11) NOT NULL AUTO_INCREMENT,
  `rbg_bg_id` int(11) DEFAULT NULL,
  `rbg_imagem` varchar(250) DEFAULT NULL,
  `rbg_pos` int(4) DEFAULT '0',
  `rbg_status` int(1) DEFAULT '1',
  `rbg_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rbg_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table ct_r_bg_pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ct_r_bg_pages`;

CREATE TABLE `ct_r_bg_pages` (
  `rbp_page` smallint(3) DEFAULT NULL COMMENT 'Page Number',
  `rbp_cad_id` int(11) unsigned NOT NULL COMMENT 'Cad Id',
  `rbp_abm_id` int(11) DEFAULT NULL COMMENT 'Album Id',
  `rbp_bg_id` int(11) DEFAULT NULL COMMENT 'PET Id',
  KEY `rap_abm_id` (`rbp_abm_id`),
  KEY `rbp_page` (`rbp_page`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table ct_r_cat_galeria
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ct_r_cat_galeria`;

CREATE TABLE `ct_r_cat_galeria` (
  `rcg_id` int(11) NOT NULL AUTO_INCREMENT,
  `rcg_cat_id` int(11) DEFAULT NULL,
  `rcg_imagem` varchar(250) DEFAULT NULL,
  `rcg_pos` int(4) DEFAULT '0',
  `rcg_status` int(1) DEFAULT '1',
  `rcg_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rcg_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `ct_r_cat_galeria` WRITE;
/*!40000 ALTER TABLE `ct_r_cat_galeria` DISABLE KEYS */;

INSERT INTO `ct_r_cat_galeria` (`rcg_id`, `rcg_cat_id`, `rcg_imagem`, `rcg_pos`, `rcg_status`, `rcg_timestamp`)
VALUES
	(9,7,'7_1968807192.jpg',0,1,'2011-05-27 21:01:20'),
	(4,12,'12_1092091715.jpg',0,1,'2011-05-20 22:41:29'),
	(5,11,'11_1654572849.jpg',0,1,'2011-05-20 22:41:45'),
	(11,6,'6_294522462.jpg',0,1,'2011-05-27 21:02:09'),
	(10,8,'8_550409742.jpg',0,1,'2011-05-27 21:01:44');

/*!40000 ALTER TABLE `ct_r_cat_galeria` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ct_r_sel_galeria
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ct_r_sel_galeria`;

CREATE TABLE `ct_r_sel_galeria` (
  `rsg_id` int(11) NOT NULL AUTO_INCREMENT,
  `rsg_sel_id` int(11) DEFAULT NULL,
  `rsg_imagem` varchar(250) DEFAULT NULL,
  `rsg_pos` int(4) DEFAULT '0',
  `rsg_status` int(1) DEFAULT '1',
  `rsg_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rsg_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table ct_selo
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ct_selo`;

CREATE TABLE `ct_selo` (
  `sel_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sel_codigo` varchar(30) DEFAULT NULL,
  `sel_nome` varchar(250) DEFAULT NULL,
  `sel_url` varchar(250) DEFAULT NULL,
  `sel_texto` text,
  `sel_status` tinyint(1) DEFAULT '1',
  `sel_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sel_n` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`sel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
