-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: tjx_database
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `bo_data`
--

DROP TABLE IF EXISTS `bo_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bo_data` (
  `bo_id` varchar(45) NOT NULL,
  `po_id` varchar(45) NOT NULL,
  `po_creation_date` date NOT NULL,
  `po_pickup_date` date NOT NULL,
  `po_delivery_date` date NOT NULL,
  `carrier_id` varchar(45) DEFAULT NULL,
  `vendor_id` varchar(45) NOT NULL,
  `origin` varchar(45) DEFAULT NULL,
  `destination` varchar(45) DEFAULT NULL,
  `po_status` varchar(45) NOT NULL DEFAULT 'not allotted',
  `type_of_delivery` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`bo_id`),
  KEY `po_id_idx` (`po_id`),
  CONSTRAINT `po_id` FOREIGN KEY (`po_id`) REFERENCES `po_details` (`po_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bo_data`
--

LOCK TABLES `bo_data` WRITE;
/*!40000 ALTER TABLE `bo_data` DISABLE KEYS */;
INSERT INTO `bo_data` VALUES ('BO101','PO101','2017-12-15','2018-01-14','2018-01-31',NULL,'VE101',NULL,NULL,'not allotted',NULL);
/*!40000 ALTER TABLE `bo_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_view`
--

DROP TABLE IF EXISTS `inventory_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_view` (
  `pc_id` varchar(45) NOT NULL,
  `product_category_id` varchar(45) NOT NULL,
  `projection_date` varchar(45) NOT NULL,
  `shortfall_quantity` varchar(45) NOT NULL,
  PRIMARY KEY (`pc_id`,`product_category_id`,`projection_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_view`
--

LOCK TABLES `inventory_view` WRITE;
/*!40000 ALTER TABLE `inventory_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pc_needs`
--

DROP TABLE IF EXISTS `pc_needs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pc_needs` (
  `pc_id` varchar(45) NOT NULL,
  `pc_name` varchar(45) NOT NULL,
  `best_handle_list` varchar(45) NOT NULL,
  `cannot_handle_list` varchar(45) NOT NULL,
  PRIMARY KEY (`pc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pc_needs`
--

LOCK TABLES `pc_needs` WRITE;
/*!40000 ALTER TABLE `pc_needs` DISABLE KEYS */;
/*!40000 ALTER TABLE `pc_needs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pc_total_capacity`
--

DROP TABLE IF EXISTS `pc_total_capacity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pc_total_capacity` (
  `pc_id` varchar(45) NOT NULL,
  `category_id` varchar(45) NOT NULL,
  `max_inflow` int(11) NOT NULL,
  PRIMARY KEY (`pc_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pc_total_capacity`
--

LOCK TABLES `pc_total_capacity` WRITE;
/*!40000 ALTER TABLE `pc_total_capacity` DISABLE KEYS */;
/*!40000 ALTER TABLE `pc_total_capacity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `po_details`
--

DROP TABLE IF EXISTS `po_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `po_details` (
  `po_id` varchar(45) NOT NULL,
  `sku_id` varchar(45) NOT NULL,
  `ordered_quantity` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`po_id`,`sku_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `po_details`
--

LOCK TABLES `po_details` WRITE;
/*!40000 ALTER TABLE `po_details` DISABLE KEYS */;
INSERT INTO `po_details` VALUES ('PO101','SK101','5000');
/*!40000 ALTER TABLE `po_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sku_table`
--

DROP TABLE IF EXISTS `sku_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sku_table` (
  `sku_id` varchar(45) NOT NULL,
  `product_category_id` varchar(45) NOT NULL,
  PRIMARY KEY (`sku_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sku_table`
--

LOCK TABLES `sku_table` WRITE;
/*!40000 ALTER TABLE `sku_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `sku_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor_table`
--

DROP TABLE IF EXISTS `vendor_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor_table` (
  `vendor_id` varchar(45) NOT NULL,
  `vendor_city` varchar(45) NOT NULL,
  `carrier_id` varchar(45) NOT NULL,
  `normal_delivery` int(11) NOT NULL,
  `express_delivery` int(11) NOT NULL,
  PRIMARY KEY (`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor_table`
--

LOCK TABLES `vendor_table` WRITE;
/*!40000 ALTER TABLE `vendor_table` DISABLE KEYS */;
INSERT INTO `vendor_table` VALUES ('VE101','Madrid','DHL',5,15);
/*!40000 ALTER TABLE `vendor_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-15 19:54:38
