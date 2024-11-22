-- MySQL dump 10.13  Distrib 8.1.0, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: campuscoride_testdb
-- ------------------------------------------------------
-- Server version	8.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
                            `id` int NOT NULL AUTO_INCREMENT,
                            `location_name` varchar(150) NOT NULL,
                            `lat` decimal(9,6) NOT NULL,
                            `lng` decimal(9,6) NOT NULL,
                            PRIMARY KEY (`id`),
                            UNIQUE KEY `location_pk_2` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` (`id`, `location_name`, `lat`, `lng`) VALUES (1,'Madison',43.000000,-89.000000),(2,'Stoughton',43.000000,-89.000000),(3,'Tenny Park Dam',43.000000,-89.000000),(4,'Warner Park',43.000000,-89.000000),(5,'Janesville Ice Arena',43.000000,-89.000000),(7,'Sauk City',43.000000,-90.000000);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ride_form`
--

DROP TABLE IF EXISTS `ride_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ride_form` (
                             `id` int NOT NULL AUTO_INCREMENT,
                             `role_type` varchar(50) NOT NULL,
                             `request_type` varchar(50) NOT NULL,
                             `date` date DEFAULT NULL,
                             `time` time DEFAULT NULL,
                             `notes` longtext,
                             `student_id` int NOT NULL,
                             `location_id` int DEFAULT NULL,
                             PRIMARY KEY (`id`),
                             UNIQUE KEY `request_form_pk_2` (`id`),
                             UNIQUE KEY `ride_form_pk` (`location_id`),
                             KEY `ride_form_student_id_fk` (`student_id`),
                             CONSTRAINT `ride_form_location_id_fk` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`) ON UPDATE CASCADE,
                             CONSTRAINT `ride_form_student_id_fk` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ride_form`
--

LOCK TABLES `ride_form` WRITE;
/*!40000 ALTER TABLE `ride_form` DISABLE KEYS */;
INSERT INTO `ride_form` (`id`, `role_type`, `request_type`, `date`, `time`, `notes`, `student_id`, `location_id`) VALUES (1,'Rider','From Campus','2024-11-26','10:30:00','Drop off in Vilas neighborhood.',1,1),(2,'Provider','From Campus',NULL,NULL,'Heading towards West Towne mall and can drop off anywhere near there.',2,2),(3,'Rider','To Campus','2024-12-11','12:30:00','I am located near the willy street area / near the co-op. Anytime before 12:30 would work! ',3,3),(4,'Rider','To Campus',NULL,NULL,'Far East side by Warner Park. Looking for rides M & W. Need to be to school by 2pm both days.',4,4),(5,'Provider','From Campus',NULL,NULL,'Can help out with rides M-F from campus headed towards Stoughton / Park St. area. M,W,F I leave campus at 3pm and T,TH 5pm.',5,5),(7,'Provider','Updated Request Type',NULL,NULL,'Heading towards Culvers North Side.',7,7);
/*!40000 ALTER TABLE `ride_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
                           `id` int NOT NULL AUTO_INCREMENT,
                           `first_name` varchar(100) NOT NULL,
                           `last_name` varchar(100) NOT NULL,
                           `email` varchar(100) NOT NULL,
                           `password` varchar(50) NOT NULL,
                           `student_id` int NOT NULL,
                           PRIMARY KEY (`id`),
                           UNIQUE KEY `student_pk_2` (`id`),
                           UNIQUE KEY `student_pk_3` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`id`, `first_name`, `last_name`, `email`, `password`, `student_id`) VALUES (1,'Jane','Doe','janedoe@school.edu','password1',2748067),(2,'John','Doe','johndoe@school.edu','password2',1234567),(3,'Sally','Sanchez','ssanchez@school.edu','password3',5556984),(4,'Norm','Normal','normy@school.edu','password4',4569753),(5,'Heather','Johnson','hjohnson@school.edu','password5',3654895),(7,'Alice','Washington','awash@school.edu','password6',2798004),(10,'glynis','fisher','g@madisoncollege.edu','sdfsf',5887458),(18,'bob','bobby','bobby@school.edu','schoolpassword',1234556);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-17 19:54:36
