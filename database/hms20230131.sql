-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: hms
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `adminid` int NOT NULL AUTO_INCREMENT,
  `adminname` varchar(25) NOT NULL,
  `loginid` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `status` varchar(10) NOT NULL,
  `usertype` varchar(30) NOT NULL,
  PRIMARY KEY (`adminid`),
  UNIQUE KEY `adminname` (`adminname`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'ITSC','admin','123456789','Active','');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `appointmentid` int NOT NULL AUTO_INCREMENT,
  `appointmenttype` varchar(25) NOT NULL,
  `patientid` int NOT NULL,
  `roomid` int NOT NULL,
  `departmentid` int NOT NULL,
  `appointmentdate` date NOT NULL,
  `appointmenttime` time NOT NULL,
  `doctorid` int NOT NULL,
  `status` varchar(10) NOT NULL,
  `app_reason` text NOT NULL,
  PRIMARY KEY (`appointmentid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (1,'Offline',2,1,1,'2023-01-29','10:10:00',1,'Approved','test'),(2,'',0,1,1,'2023-01-30','10:10:00',1,'Approved',''),(3,'ONLINE',0,1,1,'2023-01-30','10:10:00',1,'Pending',''),(4,'',4,1,1,'2023-01-30','10:20:00',1,'Approved',''),(5,'ONLINE',5,2,2,'2023-01-30','10:25:00',1,'Pending','');
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billing`
--

DROP TABLE IF EXISTS `billing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing` (
  `billingid` int NOT NULL AUTO_INCREMENT,
  `patientid` int NOT NULL,
  `appointmentid` int NOT NULL,
  `billingdate` date NOT NULL,
  `billingtime` time NOT NULL,
  `discount` float(10,2) NOT NULL,
  `taxamount` float(10,2) NOT NULL,
  `discountreason` text NOT NULL,
  `discharge_time` time NOT NULL,
  `discharge_date` date NOT NULL,
  PRIMARY KEY (`billingid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing`
--

LOCK TABLES `billing` WRITE;
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billing_records`
--

DROP TABLE IF EXISTS `billing_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing_records` (
  `billingservice_id` int NOT NULL AUTO_INCREMENT,
  `billingid` int NOT NULL,
  `bill_type_id` int NOT NULL COMMENT 'id of service charge or treatment charge',
  `bill_type` varchar(250) NOT NULL,
  `bill_amount` float(10,2) NOT NULL,
  `bill_date` date NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`billingservice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing_records`
--

LOCK TABLES `billing_records` WRITE;
/*!40000 ALTER TABLE `billing_records` DISABLE KEYS */;
INSERT INTO `billing_records` VALUES (1,0,1,'Consultancy Charge',3.00,'2023-01-30','Active'),(2,0,20,'Treatment',300.00,'2023-01-30','Active'),(3,0,20,'Treatment',300.00,'2023-01-30','Active'),(4,0,20,'Treatment',300.00,'2023-01-30','Active');
/*!40000 ALTER TABLE `billing_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `departmentid` int NOT NULL AUTO_INCREMENT,
  `departmentname` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`departmentid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Medicine','Medicine','Active'),(2,'Orthopedics','Orthopedics','Active'),(3,'Obstetrics and Gynecology','Obstetrics and Gynecology','Active'),(4,'Dermatology','Dermatology','Active'),(5,'Pediatrics','Pediatrics','Active'),(6,'Radiology','Radiology','Active'),(7,'General Surgery','General Surgery','Active'),(8,'Ophthalmology','Ophthalmology','Active'),(9,'ENT','ENT','Active'),(10,'Andrologist','Andrologist','Active'),(11,'Urology','Urology','Active');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `doctorid` int NOT NULL AUTO_INCREMENT,
  `doctorname` varchar(50) NOT NULL,
  `mobileno` varchar(15) NOT NULL,
  `departmentid` int NOT NULL,
  `loginid` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `status` varchar(10) NOT NULL,
  `education` varchar(25) NOT NULL,
  `experience` float(11,1) NOT NULL,
  `consultancy_charge` float(10,2) NOT NULL,
  `doctor_rating` int NOT NULL,
  PRIMARY KEY (`doctorid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,'Tamayo','2125798361',1,'tamayo','123456789','Active','MBBS',7.0,800.00,5),(2,'Upender','123456789',2,'upender','123456789','Active','MBBS',10.0,1000.00,5),(3,'Vinod','9392184552',1,'vinod','123456789','Active','MBBS',10.0,1000.00,4),(4,'Lova Kumar','987654321',2,'lovakumar','123456789','Active','MBBS',15.0,1500.00,4);
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_location`
--

DROP TABLE IF EXISTS `doctor_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_location` (
  `doctor_location_id` int NOT NULL AUTO_INCREMENT,
  `doctor_id` int NOT NULL,
  `location_id` int NOT NULL,
  PRIMARY KEY (`doctor_location_id`),
  KEY `fk_doctor_id_idx` (`doctor_id`),
  KEY `fk_location_id_idx` (`location_id`),
  CONSTRAINT `fk_doctor_id` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctorid`),
  CONSTRAINT `fk_location_id` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_location`
--

LOCK TABLES `doctor_location` WRITE;
/*!40000 ALTER TABLE `doctor_location` DISABLE KEYS */;
INSERT INTO `doctor_location` VALUES (1,1,1),(2,1,2),(3,2,1),(4,2,2),(5,3,1),(6,3,2),(7,4,1),(8,4,2);
/*!40000 ALTER TABLE `doctor_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_timings`
--

DROP TABLE IF EXISTS `doctor_timings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_timings` (
  `doctor_timings_id` int NOT NULL AUTO_INCREMENT,
  `doctorid` int NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `available_day` varchar(15) NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`doctor_timings_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_timings`
--

LOCK TABLES `doctor_timings` WRITE;
/*!40000 ALTER TABLE `doctor_timings` DISABLE KEYS */;
INSERT INTO `doctor_timings` VALUES (1,1,'10:00:00','17:00:00','','Active'),(2,2,'10:00:00','17:00:00','','Active');
/*!40000 ALTER TABLE `doctor_timings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `location_id` int NOT NULL AUTO_INCREMENT,
  `location_name` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'Guntupalli','Vijayawada'),(2,'Benz Circle','Vijayawada'),(3,'Tadepalli','Vijayawada'),(4,'Bhavanipuram','Vijayawada'),(5,'Tadepalli','Vijayawada');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine`
--

DROP TABLE IF EXISTS `medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicine` (
  `medicineid` int NOT NULL AUTO_INCREMENT,
  `medicinename` varchar(25) NOT NULL,
  `medicinecost` float(10,2) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`medicineid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine`
--

LOCK TABLES `medicine` WRITE;
/*!40000 ALTER TABLE `medicine` DISABLE KEYS */;
INSERT INTO `medicine` VALUES (1,'Paracetamol',3.00,'For fever per day 1 pc','Active');
/*!40000 ALTER TABLE `medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `orderid` int NOT NULL AUTO_INCREMENT,
  `patientid` int NOT NULL,
  `doctorid` int NOT NULL,
  `prescriptionid` int NOT NULL,
  `orderdate` date NOT NULL,
  `deliverydate` date NOT NULL,
  `address` text NOT NULL,
  `mobileno` varchar(15) NOT NULL,
  `note` text NOT NULL,
  `status` varchar(10) NOT NULL,
  `payment_type` varchar(20) NOT NULL,
  `card_no` varchar(20) NOT NULL,
  `cvv_no` varchar(5) NOT NULL,
  `expdate` date NOT NULL,
  `card_holder` varchar(50) NOT NULL,
  PRIMARY KEY (`orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `patientid` int NOT NULL AUTO_INCREMENT,
  `patientname` varchar(50) NOT NULL,
  `admissiondate` date NOT NULL,
  `admissiontime` time NOT NULL,
  `address` varchar(250) NOT NULL,
  `mobileno` varchar(15) NOT NULL,
  `city` varchar(25) NOT NULL,
  `pincode` varchar(20) NOT NULL,
  `loginid` varchar(50) NOT NULL,
  `password` varchar(25) NOT NULL,
  `bloodgroup` varchar(20) DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `dob` date NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`patientid`),
  KEY `loginid` (`loginid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'VInod','2023-01-29','10:10:00','Vijayawada','9392184552','Vijayawada','509001','vinod1','123456789','','MALE','1990-03-10','Active'),(2,'Vinod','2023-01-29','22:39:52','MIG II 190','9392184552','Vijayawada','509001','vinod','123456789','B+','MALE','1990-03-10','Active'),(3,'Patientone','2023-01-30','21:30:01','test','9392184552','Vijayawada','509001','patientone','patientone',NULL,'Male','1990-03-10','Active'),(4,'patientone','2023-01-30','21:30:56','test','9392184552','Vijayawada','509001','patientone','patientone',NULL,'Male','1990-03-10','Active'),(5,'patient','2023-01-30','22:22:30','test','939184552','Vijayawada','509001','p1','123456789',NULL,'Male','1990-03-10','Active');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `paymentid` int NOT NULL AUTO_INCREMENT,
  `patientid` int NOT NULL,
  `appointmentid` int NOT NULL,
  `paiddate` date NOT NULL,
  `paidtime` time NOT NULL,
  `paidamount` float(10,2) NOT NULL,
  `status` varchar(10) NOT NULL,
  `cardholder` varchar(50) NOT NULL,
  `cardnumber` int NOT NULL,
  `cvvno` int NOT NULL,
  `expdate` date NOT NULL,
  PRIMARY KEY (`paymentid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription` (
  `prescriptionid` int NOT NULL AUTO_INCREMENT,
  `treatment_records_id` int NOT NULL,
  `doctorid` int NOT NULL,
  `patientid` int NOT NULL,
  `delivery_type` varchar(10) DEFAULT NULL COMMENT 'Delivered through appointment or online order',
  `delivery_id` int DEFAULT NULL COMMENT 'appointmentid or orderid',
  `prescriptiondate` date NOT NULL,
  `status` varchar(10) NOT NULL,
  `appointmentid` int NOT NULL,
  PRIMARY KEY (`prescriptionid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
INSERT INTO `prescription` VALUES (1,1,1,2,NULL,NULL,'2023-01-01','Active',1);
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription_records`
--

DROP TABLE IF EXISTS `prescription_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription_records` (
  `prescription_record_id` int NOT NULL AUTO_INCREMENT,
  `prescription_id` int NOT NULL,
  `medicine_name` varchar(25) NOT NULL,
  `cost` float(10,2) NOT NULL,
  `unit` int NOT NULL,
  `dosage` varchar(25) NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`prescription_record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription_records`
--

LOCK TABLES `prescription_records` WRITE;
/*!40000 ALTER TABLE `prescription_records` DISABLE KEYS */;
INSERT INTO `prescription_records` VALUES (1,1,'1',3.00,1,'0-1-1','Active');
/*!40000 ALTER TABLE `prescription_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `roomid` int NOT NULL AUTO_INCREMENT,
  `roomtype` varchar(25) NOT NULL,
  `roomno` int NOT NULL,
  `noofbeds` int NOT NULL,
  `room_tariff` float(10,2) NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`roomid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (15,'GENERAL WARD',1,20,500.00,'Active'),(16,'SPECIAL WARD',2,10,100.00,'Active'),(17,'GENERAL WARD',2,10,500.00,'Active'),(18,'GENERAL WARD',121,13,150.00,'Active'),(19,'GENERAL WARD',850,11,500.00,'Active');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_type`
--

DROP TABLE IF EXISTS `service_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_type` (
  `service_type_id` int NOT NULL AUTO_INCREMENT,
  `service_type` varchar(100) NOT NULL,
  `servicecharge` float(10,2) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`service_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_type`
--

LOCK TABLES `service_type` WRITE;
/*!40000 ALTER TABLE `service_type` DISABLE KEYS */;
INSERT INTO `service_type` VALUES (10,'X-ray',250.00,'To take fractured photo copy','Active'),(11,'Scanning',450.00,'To scan body from injury','Active'),(12,'MRI',300.00,'Regarding body scan','Active'),(13,'Blood Testing',150.00,'To detect the type of disease','Active'),(14,'Diagnosis',210.00,'To analyse the diagnosis','Active');
/*!40000 ALTER TABLE `service_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatment`
--

DROP TABLE IF EXISTS `treatment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treatment` (
  `treatmentid` int NOT NULL AUTO_INCREMENT,
  `treatmenttype` varchar(25) NOT NULL,
  `treatment_cost` decimal(10,2) NOT NULL,
  `note` text NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`treatmentid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatment`
--

LOCK TABLES `treatment` WRITE;
/*!40000 ALTER TABLE `treatment` DISABLE KEYS */;
INSERT INTO `treatment` VALUES (20,'Blood test',300.00,'total IgE','Active');
/*!40000 ALTER TABLE `treatment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatment_records`
--

DROP TABLE IF EXISTS `treatment_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treatment_records` (
  `treatment_records_id` int NOT NULL AUTO_INCREMENT,
  `treatmentid` int NOT NULL,
  `appointmentid` int NOT NULL,
  `patientid` int NOT NULL,
  `doctorid` int NOT NULL,
  `treatment_description` text NOT NULL,
  `uploads` varchar(100) NOT NULL,
  `treatment_date` date NOT NULL,
  `treatment_time` time NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`treatment_records_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatment_records`
--

LOCK TABLES `treatment_records` WRITE;
/*!40000 ALTER TABLE `treatment_records` DISABLE KEYS */;
INSERT INTO `treatment_records` VALUES (1,20,1,2,1,'Blood test','463748252','2023-01-25','10:10:00','Active'),(2,20,1,2,1,'test','1122258621merge-report-order-17653-62f621cb60b3c139148571.pdf','2023-01-01','10:10:00','Active'),(3,20,4,4,1,'test','792489351','2023-01-25','10:25:00','Active');
/*!40000 ALTER TABLE `treatment_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userid` int NOT NULL AUTO_INCREMENT,
  `loginname` varchar(50) NOT NULL,
  `password` varchar(10) NOT NULL,
  `patientname` varchar(50) NOT NULL,
  `mobileno` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `createddateandtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'user','admin','Nezuko','','','2022-02-09 11:21:45'),(2,'vinod','123456789','Vinod','9392184552','','2023-01-29 00:00:00');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-31 22:52:52
