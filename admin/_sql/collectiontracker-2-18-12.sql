# ************************************************************
# Sequel Pro SQL dump
# Version 3408
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.1.50)
# Database: collectiontracker
# Generation Time: 2012-02-18 18:04:13 -0600
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
  `cad_nome` varchar(250) DEFAULT NULL,
  `cad_email` varchar(250) DEFAULT NULL,
  `cad_nascimento` date DEFAULT NULL,
  `cad_status` int(1) DEFAULT '1',
  `cad_senha` varchar(250) DEFAULT NULL,
  `cad_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `cad_ultimo_login` datetime DEFAULT NULL,
  `cad_n` varchar(250) DEFAULT NULL,
  `cad_ip` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cad_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `ct_cadastro` WRITE;
/*!40000 ALTER TABLE `ct_cadastro` DISABLE KEYS */;

INSERT INTO `ct_cadastro` (`cad_id`, `cad_nome`, `cad_email`, `cad_nascimento`, `cad_status`, `cad_senha`, `cad_timestamp`, `cad_ultimo_login`, `cad_n`, `cad_ip`)
VALUES
	(2,'Khatia Alexzandra','lslucas@gmail.com','1985-07-25',1,'õ÷ÅánZÉ1âkÆìüäT','2011-06-25 22:16:53',NULL,NULL,'::1'),
	(5,'Jão Paulo','joaoPa@gmail.com.br','1990-09-19',1,NULL,'2011-07-20 08:42:42','2011-07-22 06:59:48','#nd90w92kvs4d4g2?oneoap?g5cph5cxxgvnj#dvvc5e7a7m60sjgnjoh4i7cmu0?vcjvxkw0e2w201107201042',NULL),
	(7,'Contato Lucas Serafim','contato@lucasserafim.com.br','1990-09-19',1,'­7´Ä¹i)ÉÆä','2011-07-22 11:50:36','2011-09-19 04:50:53',NULL,'127.0.0.1'),
	(8,'Khatia Alexzandra','hechicera_17@msn.com','1988-09-15',1,'­7´Ä¹i)ÉÆä','2011-08-05 14:49:06','2011-08-05 04:49:06',NULL,'127.0.0.1'),
	(9,'Khatia','hechicera_170@msn.com','1990-09-19',1,'­7´Ä¹i)ÉÆä','2011-08-05 16:24:57',NULL,NULL,'127.0.0.1'),
	(13,'Lucas Serafim','lucas.serafim@hotmail.com','1990-09-19',1,'LL7I5íg:tì_¾í','2011-09-16 19:57:10',NULL,NULL,'127.0.0.1');

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
	(15,1,'Lucas Serafim','lslucas@gmail.com','03f9b042c76d1a08f3f4643fbf6ab329','/collectiontracker/admin/index.php','p=selo','/collectiontracker/admin/?p=selo','1329609801','http://localhost/collectiontracker/admin/?p=menu','127.0.0.1','practivate.adobe.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11','2012-02-18 18:03:21');

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
	(21,7,NULL,'Cadastros','',1,0,'2010-07-27 17:28:25',NULL),
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
