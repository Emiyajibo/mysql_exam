-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: LMS
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.16.04.1

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
-- Table structure for table `MyLMS_addbyisbn`
--

DROP TABLE IF EXISTS `MyLMS_addbyisbn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MyLMS_addbyisbn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ISBN` varchar(32) NOT NULL,
  `Number` int(11) NOT NULL,
  `Position` varchar(8) NOT NULL,
  `Price` decimal(4,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MyLMS_addbyisbn`
--

LOCK TABLES `MyLMS_addbyisbn` WRITE;
/*!40000 ALTER TABLE `MyLMS_addbyisbn` DISABLE KEYS */;
/*!40000 ALTER TABLE `MyLMS_addbyisbn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MyLMS_book`
--

DROP TABLE IF EXISTS `MyLMS_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MyLMS_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(64) NOT NULL,
  `Author` varchar(32) NOT NULL,
  `ISBN` varchar(32) NOT NULL,
  `Publisher` varchar(32) NOT NULL,
  `Pub_Time` date DEFAULT NULL,
  `Pages` int(11) DEFAULT NULL,
  `Description` longtext,
  `Available` tinyint(1) NOT NULL,
  `Position` varchar(8) NOT NULL,
  `Price` decimal(4,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MyLMS_book`
--

LOCK TABLES `MyLMS_book` WRITE;
/*!40000 ALTER TABLE `MyLMS_book` DISABLE KEYS */;
INSERT INTO `MyLMS_book` VALUES (1,'MySQL','J1b0','123-13-12','J1b0','2017-11-26',111,'23333333',1,'A-101',35.00),(2,'MySQL','J1b0','123-13-12','J1b0','2017-11-26',111,'233333',1,'A-102',35.00),(3,'MySQL','J1b0','123-13-12','J1b0','2017-11-26',111,'2333',1,'A-103',35.00),(4,'Math','HeartSky','666-999-777','HeartSKy','2017-11-27',666,'hahahaha',1,'B-101',20.00),(5,'Math','HeartSky','666-999-777','HeartSKy','2017-11-27',666,'hahahaha',1,'B-102',20.00),(6,'Python','Wang','23-23-23-23','Wu','2017-11-27',23,'Python',1,'A-104',66.00),(7,'Python','Wang','23-23-23-23','Wu','2017-11-27',23,'Python',1,'A-105',20.00),(8,'Python','Wang','23-23-23-23','Wu','2017-11-27',23,'Python',0,'A-106',60.00);
/*!40000 ALTER TABLE `MyLMS_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MyLMS_finestatistic`
--

DROP TABLE IF EXISTS `MyLMS_finestatistic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MyLMS_finestatistic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Begin_time` date DEFAULT NULL,
  `End_time` date DEFAULT NULL,
  `Reader_id` int(11) DEFAULT NULL,
  `TotalFine` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `MyLMS_finestatistic_Reader_id_d893e3cb_fk_MyLMS_reader_id` (`Reader_id`),
  CONSTRAINT `MyLMS_finestatistic_Reader_id_d893e3cb_fk_MyLMS_reader_id` FOREIGN KEY (`Reader_id`) REFERENCES `MyLMS_reader` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MyLMS_finestatistic`
--

LOCK TABLES `MyLMS_finestatistic` WRITE;
/*!40000 ALTER TABLE `MyLMS_finestatistic` DISABLE KEYS */;
INSERT INTO `MyLMS_finestatistic` VALUES (1,'2017-11-27','2017-11-30',3,0.00),(2,'2017-11-27','2017-11-30',1,0.00),(3,'2017-11-30','2018-01-01',1,1.00);
/*!40000 ALTER TABLE `MyLMS_finestatistic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MyLMS_reader`
--

DROP TABLE IF EXISTS `MyLMS_reader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MyLMS_reader` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(16) NOT NULL,
  `Password` varchar(16) NOT NULL,
  `Active` tinyint(1) NOT NULL,
  `StudentCard` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `MyLMS_reader_Name_c2199d7e_uniq` (`Name`),
  UNIQUE KEY `MyLMS_reader_StudentCard_f881d62e_uniq` (`StudentCard`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MyLMS_reader`
--

LOCK TABLES `MyLMS_reader` WRITE;
/*!40000 ALTER TABLE `MyLMS_reader` DISABLE KEYS */;
INSERT INTO `MyLMS_reader` VALUES (1,'test','test',1,'1001'),(2,'test1','123456',1,'1002'),(3,'heartsky','123456',1,'1234'),(4,'test3','test',1,'111111');
/*!40000 ALTER TABLE `MyLMS_reader` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MyLMS_record`
--

DROP TABLE IF EXISTS `MyLMS_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MyLMS_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Modified_time` datetime(6) NOT NULL,
  `Status` varchar(16) NOT NULL,
  `Book_id` int(11) NOT NULL,
  `Reader_id` int(11) NOT NULL,
  `Created_time` datetime(6) NOT NULL,
  `Fine` decimal(4,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `MyLMS_record_Reader_id_9429c18c_fk_MyLMS_reader_id` (`Reader_id`),
  KEY `MyLMS_record_Book_id_0f691acb_fk_MyLMS_book_id` (`Book_id`),
  CONSTRAINT `MyLMS_record_Book_id_0f691acb_fk_MyLMS_book_id` FOREIGN KEY (`Book_id`) REFERENCES `MyLMS_book` (`id`),
  CONSTRAINT `MyLMS_record_Reader_id_9429c18c_fk_MyLMS_reader_id` FOREIGN KEY (`Reader_id`) REFERENCES `MyLMS_reader` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MyLMS_record`
--

LOCK TABLES `MyLMS_record` WRITE;
/*!40000 ALTER TABLE `MyLMS_record` DISABLE KEYS */;
INSERT INTO `MyLMS_record` VALUES (3,'2017-11-30 02:48:53.496187','RETURNED',1,1,'2017-11-26 05:33:50.486401',0.00),(4,'2017-11-27 03:26:24.769847','BORROWED',2,3,'2017-11-27 03:26:24.769806',5.00),(5,'2017-11-30 03:41:32.742072','RETURNED',8,1,'2017-11-29 09:13:11.534296',0.00),(6,'2017-11-30 02:49:08.732519','WAITFORCHECK',4,1,'2017-11-30 02:49:08.732458',0.00),(7,'2017-11-30 03:43:56.311856','WAITFORCHECK',7,1,'2017-11-30 03:43:56.311626',0.00);
/*!40000 ALTER TABLE `MyLMS_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add reader',1,'add_reader'),(2,'Can change reader',1,'change_reader'),(3,'Can delete reader',1,'delete_reader'),(4,'Can add book',2,'add_book'),(5,'Can change book',2,'change_book'),(6,'Can delete book',2,'delete_book'),(7,'Can add addby isbn',3,'add_addbyisbn'),(8,'Can change addby isbn',3,'change_addbyisbn'),(9,'Can delete addby isbn',3,'delete_addbyisbn'),(10,'Can add record',4,'add_record'),(11,'Can change record',4,'change_record'),(12,'Can delete record',4,'delete_record'),(13,'Can add fine statistic',5,'add_finestatistic'),(14,'Can change fine statistic',5,'change_finestatistic'),(15,'Can delete fine statistic',5,'delete_finestatistic'),(16,'Can add log entry',6,'add_logentry'),(17,'Can change log entry',6,'change_logentry'),(18,'Can delete log entry',6,'delete_logentry'),(19,'Can add group',7,'add_group'),(20,'Can change group',7,'change_group'),(21,'Can delete group',7,'delete_group'),(22,'Can add permission',8,'add_permission'),(23,'Can change permission',8,'change_permission'),(24,'Can delete permission',8,'delete_permission'),(25,'Can add user',9,'add_user'),(26,'Can change user',9,'change_user'),(27,'Can delete user',9,'delete_user'),(28,'Can add content type',10,'add_contenttype'),(29,'Can change content type',10,'change_contenttype'),(30,'Can delete content type',10,'delete_contenttype'),(31,'Can add session',11,'add_session'),(32,'Can change session',11,'change_session'),(33,'Can delete session',11,'delete_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$szY1dNWlBEEt$wuI6iQTI1aUqjZRpRwm0NZCViXDnA3NJC+voPNCW0wQ=','2017-11-30 03:41:16.120967',1,'j1b0','','','iamadmin@admin.com',1,1,'2017-11-24 03:08:33.749210');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-11-24 04:59:37.593373','2','2',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',1,1),(2,'2017-11-26 04:54:33.971088','1','1',1,'[{\"added\": {}}]',2,1),(3,'2017-11-26 04:58:05.054319','1','1',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',4,1),(4,'2017-11-26 05:05:03.860603','1','1',2,'[{\"changed\": {\"fields\": [\"Available\"]}}]',2,1),(5,'2017-11-26 05:31:08.412432','1','1',2,'[{\"changed\": {\"fields\": [\"Available\"]}}]',2,1),(6,'2017-11-26 05:33:37.921797','1','1',2,'[{\"deleted\": {\"object\": \"None\", \"name\": \"record\"}}]',1,1),(7,'2017-11-26 05:37:07.980904','1','1',2,'[{\"changed\": {\"fields\": [\"Status\"], \"object\": \"3\", \"name\": \"record\"}}]',1,1),(8,'2017-11-27 03:16:29.414295','2','2',1,'[{\"added\": {}}]',2,1),(9,'2017-11-27 03:16:46.226884','3','3',1,'[{\"added\": {}}]',2,1),(10,'2017-11-27 03:18:48.013628','4','4',1,'[{\"added\": {}}]',2,1),(11,'2017-11-27 03:20:09.119054','5','5',1,'[{\"added\": {}}]',2,1),(12,'2017-11-27 03:26:24.770695','3','3',1,'[{\"added\": {}}, {\"added\": {\"object\": \"4\", \"name\": \"record\"}}]',1,1),(13,'2017-11-27 03:26:48.152735','1','1',1,'[{\"added\": {}}]',5,1),(14,'2017-11-27 03:27:03.225998','1','1',2,'[{\"changed\": {\"fields\": [\"TotalFine\"]}}]',5,1),(15,'2017-11-27 03:27:18.149844','2','2',1,'[{\"added\": {}}]',5,1),(16,'2017-11-27 03:30:52.268295','1','1',2,'[{\"changed\": {\"fields\": [\"Available\"]}}]',2,1),(17,'2017-11-27 03:32:50.302965','6','6',1,'[{\"added\": {}}]',2,1),(18,'2017-11-27 03:33:18.646969','7','7',1,'[{\"added\": {}}]',2,1),(19,'2017-11-27 03:34:10.988358','8','8',1,'[{\"added\": {}}]',2,1),(20,'2017-11-30 02:45:19.706979','1','1',2,'[{\"changed\": {\"fields\": [\"Status\"], \"object\": \"5\", \"name\": \"record\"}}]',1,1),(21,'2017-11-30 02:45:29.507567','8','8',2,'[{\"changed\": {\"fields\": [\"Available\"]}}]',2,1),(22,'2017-11-30 02:48:05.643604','3','3',1,'[{\"added\": {}}]',5,1),(23,'2017-11-30 02:48:53.497444','1','1',2,'[{\"changed\": {\"fields\": [\"Status\"], \"object\": \"3\", \"name\": \"record\"}}]',1,1),(24,'2017-11-30 02:49:37.414458','1','1',2,'[{\"changed\": {\"fields\": [\"Available\"]}}]',2,1),(25,'2017-11-30 03:22:09.915679','4','4',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',1,1),(26,'2017-11-30 03:41:32.756790','1','1',2,'[{\"changed\": {\"fields\": [\"Status\"], \"object\": \"5\", \"name\": \"record\"}}]',1,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (6,'admin','logentry'),(7,'auth','group'),(8,'auth','permission'),(9,'auth','user'),(10,'contenttypes','contenttype'),(3,'MyLMS','addbyisbn'),(2,'MyLMS','book'),(5,'MyLMS','finestatistic'),(1,'MyLMS','reader'),(4,'MyLMS','record'),(11,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'MyLMS','0001_initial','2017-11-24 02:56:25.965950'),(2,'MyLMS','0002_auto_20171031_1618','2017-11-24 02:56:26.095988'),(3,'MyLMS','0003_auto_20171031_1627','2017-11-24 02:56:26.557227'),(4,'MyLMS','0004_auto_20171031_1628','2017-11-24 02:56:26.604071'),(5,'MyLMS','0005_auto_20171031_1652','2017-11-24 02:56:26.943787'),(6,'MyLMS','0006_auto_20171031_1655','2017-11-24 02:56:26.976182'),(7,'MyLMS','0007_auto_20171031_1727','2017-11-24 02:56:27.400796'),(8,'MyLMS','0008_auto_20171031_1932','2017-11-24 02:56:27.485560'),(9,'MyLMS','0009_auto_20171101_1121','2017-11-24 02:56:27.561678'),(10,'MyLMS','0010_auto_20171101_1616','2017-11-24 02:56:27.770263'),(11,'MyLMS','0011_auto_20171112_2106','2017-11-24 02:56:27.784396'),(12,'MyLMS','0012_auto_20171115_1404','2017-11-24 02:56:27.888374'),(13,'MyLMS','0013_auto_20171115_1413','2017-11-24 02:56:28.061170'),(14,'MyLMS','0014_finestatistic','2017-11-24 02:56:28.199559'),(15,'MyLMS','0015_finestatistic_totalfine','2017-11-24 02:56:28.296472'),(16,'MyLMS','0016_auto_20171115_1528','2017-11-24 02:56:28.988431'),(17,'MyLMS','0017_auto_20171115_1532','2017-11-24 02:56:29.547291'),(18,'MyLMS','0018_auto_20171115_1656','2017-11-24 02:56:29.635323'),(19,'MyLMS','0019_auto_20171115_1705','2017-11-24 02:56:30.250277'),(20,'MyLMS','0020_reader_studentcard','2017-11-24 02:56:30.289472'),(21,'MyLMS','0021_auto_20171115_2339','2017-11-24 02:56:30.353144'),(22,'contenttypes','0001_initial','2017-11-24 02:56:30.433147'),(23,'auth','0001_initial','2017-11-24 02:56:31.283770'),(24,'admin','0001_initial','2017-11-24 02:56:31.497187'),(25,'admin','0002_logentry_remove_auto_add','2017-11-24 02:56:31.592001'),(26,'contenttypes','0002_remove_content_type_name','2017-11-24 02:56:32.021476'),(27,'auth','0002_alter_permission_name_max_length','2017-11-24 02:56:32.034499'),(28,'auth','0003_alter_user_email_max_length','2017-11-24 02:56:32.059829'),(29,'auth','0004_alter_user_username_opts','2017-11-24 02:56:32.087997'),(30,'auth','0005_alter_user_last_login_null','2017-11-24 02:56:32.148850'),(31,'auth','0006_require_contenttypes_0002','2017-11-24 02:56:32.151353'),(32,'auth','0007_alter_validators_add_error_messages','2017-11-24 02:56:32.167348'),(33,'auth','0008_alter_user_username_max_length','2017-11-24 02:56:32.201629'),(34,'sessions','0001_initial','2017-11-24 02:56:32.237550');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0uux7yn1136usj5ocix88fvchx5u092f','ZTE3YzVmZGEwOTk4NWQ0N2UzZmYyMWYwZTBhNGZkMDNmZTFlODMyNDp7InJlYWRlcl9pZCI6MSwicmVhZGVyX25hbWUiOiJ0ZXN0IiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9','2017-11-29 09:21:02.853727'),('0xb7g8pmxpkhk2c7gseys1ukwnj3vihe','ZTE3YzVmZGEwOTk4NWQ0N2UzZmYyMWYwZTBhNGZkMDNmZTFlODMyNDp7InJlYWRlcl9pZCI6MSwicmVhZGVyX25hbWUiOiJ0ZXN0IiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9','2017-11-26 09:19:30.661703'),('689qm7yu2io3w3ibl60wwefuxic0bjim','MDE3YTNiZDRkODhmZTg3Mjc0Njc0M2EwOTk4MTVmZGE1ZGNjNWY1YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwicmVhZGVyX2lkIjoxLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwLCJfYXV0aF91c2VyX2hhc2giOiJkZDVjZTEzYmNjMDk1N2ZkZGRhOGI2ZDgzNDc5MmU4Mzk2NDllMTE4IiwicmVhZGVyX25hbWUiOiJ0ZXN0In0=','2017-11-30 03:33:34.992459'),('8r30f2qdi8b3f1oqzg4vxxk8kuac0foa','ZTE3YzVmZGEwOTk4NWQ0N2UzZmYyMWYwZTBhNGZkMDNmZTFlODMyNDp7InJlYWRlcl9pZCI6MSwicmVhZGVyX25hbWUiOiJ0ZXN0IiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9','2017-11-26 08:25:00.806165'),('a4yzf2qil4pb2ea0409crv6b1520rq3x','MDE3YTNiZDRkODhmZTg3Mjc0Njc0M2EwOTk4MTVmZGE1ZGNjNWY1YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwicmVhZGVyX2lkIjoxLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwLCJfYXV0aF91c2VyX2hhc2giOiJkZDVjZTEzYmNjMDk1N2ZkZGRhOGI2ZDgzNDc5MmU4Mzk2NDllMTE4IiwicmVhZGVyX25hbWUiOiJ0ZXN0In0=','2017-11-30 04:05:40.626317'),('b5zk5944q2kadgo4nbu13nk77m3gebai','Mzk1YjBlMDc1NjM5NzQ0ZWZmMjFjNzRmMGYyMjE4YmM2OGIyOGQyYjp7Il9zZXNzaW9uX2V4cGlyeSI6NjAwLCJyZWFkZXJfbmFtZSI6InRlc3QifQ==','2017-11-24 07:59:04.813025'),('c2qwmnentpk7vg85bwgecp6jwofm0egm','ZTE3YzVmZGEwOTk4NWQ0N2UzZmYyMWYwZTBhNGZkMDNmZTFlODMyNDp7InJlYWRlcl9pZCI6MSwicmVhZGVyX25hbWUiOiJ0ZXN0IiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9','2017-11-26 05:51:17.967054'),('c73p2zn882z9ces91q95wb8s32dfxymx','MDE3YTNiZDRkODhmZTg3Mjc0Njc0M2EwOTk4MTVmZGE1ZGNjNWY1YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwicmVhZGVyX2lkIjoxLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwLCJfYXV0aF91c2VyX2hhc2giOiJkZDVjZTEzYmNjMDk1N2ZkZGRhOGI2ZDgzNDc5MmU4Mzk2NDllMTE4IiwicmVhZGVyX25hbWUiOiJ0ZXN0In0=','2017-11-26 05:40:46.674039'),('dana9fukrmlrltvdwqk41rp6c9dqry1x','MDE3YTNiZDRkODhmZTg3Mjc0Njc0M2EwOTk4MTVmZGE1ZGNjNWY1YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwicmVhZGVyX2lkIjoxLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwLCJfYXV0aF91c2VyX2hhc2giOiJkZDVjZTEzYmNjMDk1N2ZkZGRhOGI2ZDgzNDc5MmU4Mzk2NDllMTE4IiwicmVhZGVyX25hbWUiOiJ0ZXN0In0=','2017-11-30 02:54:39.077113'),('ea2u1ue47iewq91g77s106j40a9aoeu8','MDE3YTNiZDRkODhmZTg3Mjc0Njc0M2EwOTk4MTVmZGE1ZGNjNWY1YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwicmVhZGVyX2lkIjoxLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwLCJfYXV0aF91c2VyX2hhc2giOiJkZDVjZTEzYmNjMDk1N2ZkZGRhOGI2ZDgzNDc5MmU4Mzk2NDllMTE4IiwicmVhZGVyX25hbWUiOiJ0ZXN0In0=','2017-11-26 12:47:53.513987'),('er9v9j4rg96azi2wibeeamb46bcwd8j7','MDE3YTNiZDRkODhmZTg3Mjc0Njc0M2EwOTk4MTVmZGE1ZGNjNWY1YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwicmVhZGVyX2lkIjoxLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwLCJfYXV0aF91c2VyX2hhc2giOiJkZDVjZTEzYmNjMDk1N2ZkZGRhOGI2ZDgzNDc5MmU4Mzk2NDllMTE4IiwicmVhZGVyX25hbWUiOiJ0ZXN0In0=','2017-11-26 07:34:44.258954'),('fsn8hrli47nvee3wybyal8srugg8znca','ZTE3YzVmZGEwOTk4NWQ0N2UzZmYyMWYwZTBhNGZkMDNmZTFlODMyNDp7InJlYWRlcl9pZCI6MSwicmVhZGVyX25hbWUiOiJ0ZXN0IiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9','2017-11-24 06:07:35.795673'),('fwnrv0c3w593g2cc8v6gr14o6cc2id1f','ZTE3YzVmZGEwOTk4NWQ0N2UzZmYyMWYwZTBhNGZkMDNmZTFlODMyNDp7InJlYWRlcl9pZCI6MSwicmVhZGVyX25hbWUiOiJ0ZXN0IiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9','2017-11-26 05:24:45.062434'),('i5gt0j0s0d0i5t8f6nbpqz42hzf0id9e','MGQyZTIwYzI3YWEyYzZjMTFiOGYzMWI4MTFlYmE1MzMwZTBmZDllYjp7InJlYWRlcl9pZCI6MiwicmVhZGVyX25hbWUiOiJ0ZXN0MSIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwfQ==','2017-11-24 03:13:46.396091'),('izsyq8c0g9q34tpt9tfrxr50q7r87a15','N2E2MDNmNzM2YzZkNjUzNzYxMDY4ZDM3MmEwYjJkN2U2OTgyYzBhYTp7InJlYWRlcl9pZCI6MSwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDAsInJlYWRlcl9uYW1lIjoidGVzdCJ9','2017-11-26 09:29:57.077049'),('k124gxb1fla6m5easrcl0aqtlbrk3z2a','MDE3YTNiZDRkODhmZTg3Mjc0Njc0M2EwOTk4MTVmZGE1ZGNjNWY1YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwicmVhZGVyX2lkIjoxLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwLCJfYXV0aF91c2VyX2hhc2giOiJkZDVjZTEzYmNjMDk1N2ZkZGRhOGI2ZDgzNDc5MmU4Mzk2NDllMTE4IiwicmVhZGVyX25hbWUiOiJ0ZXN0In0=','2017-11-27 03:38:28.484029'),('noltjsc1z6c1gs9w9kb0he6e3p5z1klb','N2E2MDNmNzM2YzZkNjUzNzYxMDY4ZDM3MmEwYjJkN2U2OTgyYzBhYTp7InJlYWRlcl9pZCI6MSwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDAsInJlYWRlcl9uYW1lIjoidGVzdCJ9','2017-11-30 04:28:29.970359'),('p3vcxyarzdoybu8jwaaqsi2wzmio6tgj','MDE3YTNiZDRkODhmZTg3Mjc0Njc0M2EwOTk4MTVmZGE1ZGNjNWY1YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwicmVhZGVyX2lkIjoxLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwLCJfYXV0aF91c2VyX2hhc2giOiJkZDVjZTEzYmNjMDk1N2ZkZGRhOGI2ZDgzNDc5MmU4Mzk2NDllMTE4IiwicmVhZGVyX25hbWUiOiJ0ZXN0In0=','2017-11-24 05:19:41.132775'),('qtjif23nnxxe1c2cf53snpau2mdfbk5v','N2E2MDNmNzM2YzZkNjUzNzYxMDY4ZDM3MmEwYjJkN2U2OTgyYzBhYTp7InJlYWRlcl9pZCI6MSwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDAsInJlYWRlcl9uYW1lIjoidGVzdCJ9','2017-11-26 06:13:41.651143'),('ri6tazs2eab5t83q3lb4rbp2m3nuhp2d','MDE3YTNiZDRkODhmZTg3Mjc0Njc0M2EwOTk4MTVmZGE1ZGNjNWY1YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwicmVhZGVyX2lkIjoxLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwLCJfYXV0aF91c2VyX2hhc2giOiJkZDVjZTEzYmNjMDk1N2ZkZGRhOGI2ZDgzNDc5MmU4Mzk2NDllMTE4IiwicmVhZGVyX25hbWUiOiJ0ZXN0In0=','2017-11-26 10:54:09.591322'),('rz1zm7dgs7vdaa2mvlsp7tq5xwedre0x','ZTE3YzVmZGEwOTk4NWQ0N2UzZmYyMWYwZTBhNGZkMDNmZTFlODMyNDp7InJlYWRlcl9pZCI6MSwicmVhZGVyX25hbWUiOiJ0ZXN0IiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9','2017-11-24 03:32:58.196185'),('t2h0uq4oum97zxlwmgr6272b6xh0q5nl','ZTE3YzVmZGEwOTk4NWQ0N2UzZmYyMWYwZTBhNGZkMDNmZTFlODMyNDp7InJlYWRlcl9pZCI6MSwicmVhZGVyX25hbWUiOiJ0ZXN0IiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9','2017-11-30 09:18:21.818705'),('u7fuxlzl8lymygv48soafwkkvegk17qv','ZTE3YzVmZGEwOTk4NWQ0N2UzZmYyMWYwZTBhNGZkMDNmZTFlODMyNDp7InJlYWRlcl9pZCI6MSwicmVhZGVyX25hbWUiOiJ0ZXN0IiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9','2017-11-26 07:54:18.059573'),('v5uu7vlyxpre2rxihz6f9yfl88d18pde','ZTE3YzVmZGEwOTk4NWQ0N2UzZmYyMWYwZTBhNGZkMDNmZTFlODMyNDp7InJlYWRlcl9pZCI6MSwicmVhZGVyX25hbWUiOiJ0ZXN0IiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDB9','2017-11-29 15:49:48.499905'),('wgdfx8awgc3voyk9qw001y7bmon4wkc6','N2E2MDNmNzM2YzZkNjUzNzYxMDY4ZDM3MmEwYjJkN2U2OTgyYzBhYTp7InJlYWRlcl9pZCI6MSwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDAsInJlYWRlcl9uYW1lIjoidGVzdCJ9','2017-11-29 15:39:17.184432'),('xdm5tyhz8iqa4nhtfko9spvh9kvvfpr2','MDE3YTNiZDRkODhmZTg3Mjc0Njc0M2EwOTk4MTVmZGE1ZGNjNWY1YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwicmVhZGVyX2lkIjoxLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9zZXNzaW9uX2V4cGlyeSI6NjAwLCJfYXV0aF91c2VyX2hhc2giOiJkZDVjZTEzYmNjMDk1N2ZkZGRhOGI2ZDgzNDc5MmU4Mzk2NDllMTE4IiwicmVhZGVyX25hbWUiOiJ0ZXN0In0=','2017-11-26 05:09:29.153081'),('xj224h0pezllr5w3dvkhehblghglz1ue','N2E2MDNmNzM2YzZkNjUzNzYxMDY4ZDM3MmEwYjJkN2U2OTgyYzBhYTp7InJlYWRlcl9pZCI6MSwiX3Nlc3Npb25fZXhwaXJ5Ijo2MDAsInJlYWRlcl9uYW1lIjoidGVzdCJ9','2017-11-29 16:05:09.237399');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-21 11:33:05
