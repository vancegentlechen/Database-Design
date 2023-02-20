-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mic
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assign`
--

DROP TABLE IF EXISTS `assign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assign` (
  `assign_id` int NOT NULL,
  `task_id` int DEFAULT NULL,
  `emp_id` int DEFAULT NULL,
  `assign_begindate` date DEFAULT NULL,
  `assign_enddate` date DEFAULT NULL,
  PRIMARY KEY (`assign_id`),
  KEY `emp_id` (`emp_id`),
  KEY `task_id` (`task_id`),
  CONSTRAINT `assign_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`),
  CONSTRAINT `assign_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assign`
--

LOCK TABLES `assign` WRITE;
/*!40000 ALTER TABLE `assign` DISABLE KEYS */;
INSERT INTO `assign` VALUES (6,2,30,'2018-03-01','2018-03-06'),(7,3,7,'2018-03-01','2018-03-06'),(8,4,16,'2018-03-01','2018-03-06'),(9,5,16,'2018-03-11','2018-03-14'),(10,6,7,'2018-03-11',NULL),(11,7,28,'2018-03-11',NULL),(12,7,25,'2018-03-11',NULL),(13,8,23,'2018-03-15','2018-03-19'),(14,9,22,'2018-03-21',NULL),(15,9,26,'2018-03-21',NULL),(16,10,21,'2018-03-21',NULL),(17,11,23,'2018-03-21',NULL),(18,12,29,'2018-03-25',NULL);
/*!40000 ALTER TABLE `assign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `bill_id` int NOT NULL,
  `bill_date` date DEFAULT NULL,
  `project_id` int DEFAULT NULL,
  PRIMARY KEY (`bill_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (1,'2018-03-15',1);
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `cust_id` int NOT NULL,
  `cust_name` varchar(30) DEFAULT NULL,
  `cust_phone` varchar(20) DEFAULT NULL,
  `region_id` int DEFAULT NULL,
  PRIMARY KEY (`cust_id`),
  KEY `region_id` (`region_id`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `region` (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Xerox','678-257-2857',1),(2,'Coca Cola','931-685-1563',2),(3,'Verizon','615-725-7896',3),(4,'Dollar Store','423-596-6241',4),(5,'Sprint','901-895-5547',5),(6,'Exxon Mobile','865-489-3699',6);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `emp_id` int NOT NULL,
  `emp_lname` varchar(30) DEFAULT NULL,
  `emp_mi` varchar(15) DEFAULT NULL,
  `emp_fname` varchar(30) DEFAULT NULL,
  `emp_hiredate` date DEFAULT NULL,
  `region_id` int DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `region_id` (`region_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `region` (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'	Sexton','M','	Amy','2001-02-07',1),(2,'	Craig','M','	Brad','2000-08-16',3),(3,'	Sewell','Z','	Barb','2000-09-15',4),(4,'	Williams','R','	Jordan','2000-04-07',2),(5,'	Chandler','E','	Johnny','2001-06-12',5),(6,'	Robbins','E','	Erin','2001-08-25',6),(7,'	Burkhart','C','	Sam','2000-11-26',1),(8,'	Yarbrough','B','	Peter','2001-01-09',6),(9,'	Kattan','N','	Chris','2000-05-31',2),(10,'	Pascoe','L','	Jonathan','2001-07-14',3),(11,'	Bales','D','	Melissa','2001-09-16',4),(12,'	Cope','R','	Leslie','1999-10-31',5),(13,'	Bible','M','	Hanah','2000-06-08',2),(14,'	Paine','S','	Brad','1999-05-09',6),(15,'	Newton','S','	Christopher','2001-02-28',3),(16,'	Smith','A','	Mary','1999-03-08',1),(17,'	Underwood','L','	Trish','1998-10-21',4),(18,'	Bender','A','	Larry','2000-08-09',6),(19,'	Mudd','T','	Roger','1999-12-01',5),(20,'	Kenyon','D','	Tiffany','2001-04-28',2),(21,'	Ephanor',NULL,'	Victor','2000-03-02',1),(22,'	Summers',NULL,'	Anna','1999-01-01',1),(23,'	Smith','F','	Jose','1998-02-06',1),(24,'	Rogers','S','	Adam','2000-04-06',1),(25,'	Zebras',NULL,'	Steve','2000-04-05',1),(26,'	Ellis','R','	Maria','2000-08-07',1),(27,'	Duarte',NULL,'	Miriam','2000-12-03',1),(28,'	Bush',NULL,'	Emily','1999-06-05',1),(29,'	Kilby','T','	Surgena','2000-04-01',1),(30,'	Connor',NULL,'	Sean','1998-04-15',1);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empskill`
--

DROP TABLE IF EXISTS `empskill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empskill` (
  `emp_id` int DEFAULT NULL,
  `skill_id` int DEFAULT NULL,
  KEY `skill_id` (`skill_id`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `empskill_ibfk_1` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`skill_id`),
  CONSTRAINT `empskill_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empskill`
--

LOCK TABLES `empskill` WRITE;
/*!40000 ALTER TABLE `empskill` DISABLE KEYS */;
INSERT INTO `empskill` VALUES (1,1),(1,2),(2,3),(3,3),(4,1),(4,2),(5,4),(6,3),(6,4),(7,4),(8,5),(8,6),(8,19),(9,7),(9,8),(10,6),(10,18),(11,8),(12,9),(13,10),(14,23),(15,12),(15,14),(15,16),(15,17),(16,5),(16,17),(16,20),(16,21),(17,1),(18,22),(19,23),(20,23),(21,7),(21,8),(22,7),(23,9),(23,18),(23,19),(24,9),(24,10),(25,3),(25,11),(25,12),(26,7),(26,11),(27,13),(27,15),(27,16),(28,3),(28,13),(28,14),(28,15),(28,17),(28,20),(28,21),(29,22),(30,23);
/*!40000 ALTER TABLE `empskill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `project_id` int NOT NULL,
  `project_date` date DEFAULT NULL,
  `cust_id` int DEFAULT NULL,
  `project_description` varchar(30) DEFAULT NULL,
  `project_esdatestart` date DEFAULT NULL,
  `project_esdateends` date DEFAULT NULL,
  `project_esbudget` decimal(10,2) DEFAULT NULL,
  `project_acdatestart` date DEFAULT NULL,
  `project_acdateends` date DEFAULT NULL,
  `project_accost` decimal(10,2) DEFAULT NULL,
  `emp_id` int DEFAULT NULL,
  PRIMARY KEY (`project_id`),
  KEY `cust_id` (`cust_id`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`),
  CONSTRAINT `project_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'2018-02-12',1,'Sales ManagementSystem','2018-03-01','2018-07-01',15500.00,NULL,NULL,0.00,30);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `region` (
  `region_id` int NOT NULL,
  `region_name` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES (1,'	NW'),(2,'	SW'),(3,'	MN'),(4,'	MS'),(5,'	NE'),(6,'	SE');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill`
--

DROP TABLE IF EXISTS `skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skill` (
  `skill_id` int NOT NULL,
  `skill_description` varchar(30) DEFAULT NULL,
  `skill_rate` int DEFAULT NULL,
  PRIMARY KEY (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill`
--

LOCK TABLES `skill` WRITE;
/*!40000 ALTER TABLE `skill` DISABLE KEYS */;
INSERT INTO `skill` VALUES (1,'	Data Entry',12),(2,'	Data Entry II',15),(3,'	System Analyst I',18),(4,'	System Analyst II',21),(5,'	Database Designer I',50),(6,'	Database Designer II',75),(7,'	SQL I',25),(8,'	SQL II',30),(9,'	C++ I',35),(10,'	C++ II',45),(11,'	Python I',25),(12,'	Python II',35),(13,'	Cold Fusion I',60),(14,'	Cold Fusion II',75),(15,'	ASP I',60),(16,'	ASP II',70),(17,'	Web Administrator',50),(18,'	Oracle DBA',100),(19,'	SQL Server DBA',100),(20,'	Network Eng. I',80),(21,'	Network Eng. II',100),(22,'	Technical Writer',100),(23,'	Project Manager',70);
/*!40000 ALTER TABLE `skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `task_id` int NOT NULL,
  `project_id` int DEFAULT NULL,
  `task_description` varchar(50) DEFAULT NULL,
  `task_begindate` date DEFAULT NULL,
  `task_enddate` date DEFAULT NULL,
  `skill_id` int DEFAULT NULL,
  `task_quantity` int DEFAULT NULL,
  PRIMARY KEY (`task_id`),
  KEY `project_id` (`project_id`),
  KEY `skill_id` (`skill_id`),
  CONSTRAINT `task_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`),
  CONSTRAINT `task_ibfk_2` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (2,1,'	Initial Interview','2018-03-01','2018-03-06',23,1),(3,1,'	Initial Interview','2018-03-01','2018-03-06',4,1),(4,1,'	Initial Interview','2018-03-01','2018-03-06',5,1),(5,1,'	Database Design','2018-03-11','2018-03-15',5,1),(6,1,'	System Design','2018-03-11','2018-04-12',4,1),(7,1,'	System Design','2018-03-11','2018-04-12',3,2),(8,1,'	Database Implementation','2018-03-18','2018-03-22',18,1),(9,1,'	System Coding  & Testing','2018-03-25','2018-05-20',7,2),(10,1,'	System Coding  & Testing','2018-03-25','2018-05-20',8,1),(11,1,'	System Coding  & Testing','2018-03-25','2018-05-20',18,1),(12,1,'	System Documentation','2018-03-25','2018-06-07',22,1),(13,1,'	Final Evaluation','2018-06-10','2018-06-14',23,1),(14,1,'	Final Evaluation','2018-06-10','2018-06-14',4,1),(15,1,'	Final Evaluation','2018-06-10','2018-06-14',5,1),(16,1,'	Final Evaluation','2018-06-10','2018-06-14',8,1),(17,1,'	On-Site System On-line and Data Loading','2018-06-17','2018-06-21',23,1),(18,1,'	On-Site System On-line and Data Loading','2018-06-17','2018-06-21',4,1),(19,1,'	On-Site System On-line and Data Loading','2018-06-17','2018-06-21',5,1),(20,1,'	On-Site System On-line and Data Loading','2018-06-17','2018-06-21',8,1),(21,1,'	Sign Off','2018-07-01','2018-07-01',23,1);
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worklog`
--

DROP TABLE IF EXISTS `worklog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `worklog` (
  `wlog_id` int NOT NULL,
  `assign_id` int DEFAULT NULL,
  `wlog_date` date DEFAULT NULL,
  `wlog_hours` int DEFAULT NULL,
  `bill_id` int DEFAULT NULL,
  PRIMARY KEY (`wlog_id`),
  KEY `assign_id` (`assign_id`),
  KEY `bill_id` (`bill_id`),
  CONSTRAINT `worklog_ibfk_1` FOREIGN KEY (`assign_id`) REFERENCES `assign` (`assign_id`),
  CONSTRAINT `worklog_ibfk_2` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`bill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worklog`
--

LOCK TABLES `worklog` WRITE;
/*!40000 ALTER TABLE `worklog` DISABLE KEYS */;
INSERT INTO `worklog` VALUES (3,6,'2018-03-01',4,1),(4,7,'2018-03-01',4,1),(5,8,'2018-03-01',4,1),(6,7,'2018-03-08',24,1),(7,6,'2018-03-08',24,1),(8,8,'2018-03-08',24,1),(9,10,'2018-03-15',40,1),(10,11,'2018-03-15',40,1),(11,13,'2018-03-15',6,1),(12,9,'2018-03-15',32,1),(13,12,'2018-03-15',35,1),(14,10,'2018-03-22',40,NULL),(15,11,'2018-03-22',40,NULL),(16,15,'2018-03-22',12,NULL),(17,16,'2018-03-22',12,NULL),(18,13,'2018-03-22',12,NULL),(19,17,'2018-03-22',12,NULL),(20,14,'2018-03-22',12,NULL),(21,12,'2018-03-22',35,NULL),(22,10,'2018-03-29',40,NULL),(23,11,'2018-03-29',40,NULL),(24,15,'2018-03-29',35,NULL),(25,16,'2018-03-29',35,NULL),(26,18,'2018-03-29',40,NULL),(27,17,'2018-03-29',35,NULL),(28,14,'2018-03-29',35,NULL),(29,12,'2018-03-29',35,NULL);
/*!40000 ALTER TABLE `worklog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mic'
--

--
-- Dumping routines for database 'mic'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-26 20:37:29
