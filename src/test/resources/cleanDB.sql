-- MySQL dump 10.13  Distrib 8.3.0, for Win64 (x86_64)
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
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` (`id`, `location_name`, `lat`, `lng`) VALUES (1,'Madison',43.000000,-89.000000),(2,'Stoughton',43.000000,-89.000000),(3,'Tenny Park Dam',43.000000,-89.000000),(4,'Warner Park',43.000000,-89.000000),(5,'Janesville Ice Arena',43.000000,-89.000000),(6,'Sauk City',43.000000,-90.000000),(7,'Town of Sun Prairie',44.054394,-91.851918),(8,'Paoli',46.073732,-90.518971),(9,'Town of Dunn',46.576162,-89.129455),(10,'Waunakee',44.973976,-91.193999),(11,'Shorewood Hills',45.090420,-91.862866),(12,'Belleville',46.020092,-89.858493),(13,'Town of Verona',42.948989,-90.096070),(14,'Town of Blooming Grove',44.723843,-91.234939),(15,'Brodhead',43.304805,-87.768245),(16,'DeForest',44.288822,-91.536613),(17,'Rockdale',46.635028,-89.779593),(18,'Sun Prairie',46.137427,-89.125571),(19,'Town of Burke',43.342722,-90.785885),(20,'Town of Oregon',44.061035,-90.084080),(21,'Town of Madison',43.781959,-89.036544),(22,'McFarland',43.190856,-90.676405),(23,'Oregon',44.849503,-89.500783),(24,'Cross Plains',46.176361,-91.686429),(25,'Fitchburg',44.158518,-87.628164),(26,'Cambridge',45.890729,-89.800271),(27,'Town of Montrose',46.902652,-90.067270),(28,'Poynette',43.195314,-88.542212),(29,'Verona',45.132738,-87.557713);
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
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ride_form`
--

LOCK TABLES `ride_form` WRITE;
/*!40000 ALTER TABLE `ride_form` DISABLE KEYS */;
INSERT INTO `ride_form` (`id`, `role_type`, `request_type`, `date`, `time`, `notes`, `student_id`, `location_id`) VALUES (1,'Rider','From Campus','2024-11-26','10:30:00','Drop off in Vilas neighborhood.',1,1),(2,'Driver','From Campus',NULL,NULL,'Heading towards West Towne mall and can drop off anywhere near there.',2,2),(3,'Rider','To Campus','2024-12-11','12:30:00','I am located near the willy street area / near the co-op. Anytime before 12:30 would work! ',3,3),(4,'Rider','To Campus',NULL,NULL,'Far East side by Warner Park. Looking for rides M & W. Need to be to school by 2pm both days.',4,4),(5,'Driver','From Campus',NULL,NULL,'Can help out with rides M-F from campus headed towards Stoughton / Park St. area. M,W,F I leave campus at 3pm and T,TH 5pm.',5,5),(7,'Driver','Updated Request Type',NULL,NULL,'Heading towards Culvers North Side.',7,7),(101,'Rider','To Campus','2025-01-14','02:29:00','Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl.',19,16),(102,'Driver','From Campus','2025-04-16','04:50:00','Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam.',13,15),(103,'Driver','To Campus','2025-04-24','13:31:00','In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.',32,25),(104,'Rider','To Campus','2025-03-01','17:05:00','Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend.',41,29),(105,'Driver','To Campus','2025-02-23','04:18:00','Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.',32,11),(106,'Driver','From Campus','2025-01-13','22:24:00','Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.',41,24),(107,'Rider','From Campus','2025-01-25','19:04:00','Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.',14,22),(108,'Rider','To Campus','2025-11-11','00:12:00','Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.',17,14),(109,'Rider','From Campus','2025-07-26','03:07:00','Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.',23,28),(110,'Driver','From Campus','2024-12-18','05:18:00','Nullam molestie nibh in lectus. Pellentesque at nulla.',9,12),(111,'Rider','From Campus','2025-11-09','11:35:00','Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.',21,19),(112,'Rider','From Campus','2025-11-12','21:04:00','Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam. Nam tristique tortor eu pede.',37,9),(113,'Rider','From Campus','2025-10-30','08:54:00','Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.',35,17),(114,'Driver','From Campus','2025-05-04','11:29:00','Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.',12,8),(115,'Driver','To Campus','2025-07-15','10:59:00','Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.',10,26),(116,'Driver','From Campus','2025-10-18','11:42:00','Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.',41,20),(123,'Driver','To Campus','2025-10-30','12:13:00','Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor.',14,10),(124,'Rider','From Campus','2025-04-06','02:23:00','Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.',33,18),(125,'Rider','To Campus','2025-07-05','01:09:00','Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.',15,23),(163,'Rider','From Campus','2025-03-28','21:54:00','Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum.',15,13),(169,'Rider','To Campus','2025-08-18','05:41:00','Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.',45,21);
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`id`, `first_name`, `last_name`, `email`, `password`, `student_id`) VALUES (1,'Jane','Doe','janedoe@school.edu','password1',2748067),(2,'John','Doe','johndoe@school.edu','password2',1234567),(3,'Sally','Sanchez','ssanchez@school.edu','password3',5556984),(4,'Norm','Normal','normy@school.edu','password4',4569753),(5,'Heather','Johnson','hjohnson@school.edu','password5',3654895),(7,'Alice','Washington','awash@school.edu','password6',2798004),(8,'Willem','Abrahmovici','willemabrahmovici@school.edu','wI1>bsdKgl',4000739),(9,'Margarita','Gabey','margaritagabey@school.edu','kT0.3B{97mRWs!',5834237),(10,'Henrik','Hargitt','henrikhargitt@school.edu','dW1=,pZ8,',8132825),(11,'Hyacinthe','Jenman','hyacinthejenman@school.edu','sS7&,<A|',2955683),(12,'Deerdre','Chandler','deerdrechandler@school.edu','tE3\"g\"R70.GWS',3935407),(13,'Ingamar','Blakeway','ingamarblakeway@school.edu','jZ6(+NIJ6x5/Ex',9176366),(14,'Alyosha','Zuanelli','alyoshazuanelli@school.edu','tA6,%7tO8v<R',5392470),(15,'Dante','Kerr','dantekerr@school.edu','kX7$ptk)V=*Uz@5U',2974218),(16,'Ediva','Clerk','edivaclerk@school.edu','gE2%VgN,v=LSH)x',3217523),(17,'Benedikta','Scane','benediktascane@school.edu','wH1</8cO.ntik',6302568),(18,'Lebbie','Schoffel','lebbieschoffel@school.edu','jZ8_bQprr>`',8730122),(19,'Rycca','Naismith','ryccanaismith@school.edu','hP1=j`CCG_fWuI',3061842),(20,'Saunder','Fotheringham','saunderfotheringham@school.edu','mQ6)WJT(n',8360335),(21,'Laureen','Stemson','laureenstemson@school.edu','uG5$$A@+{',5424122),(22,'Fernande','Brunn','fernandebrunn@school.edu','kZ5!@!6XZ38MJA',7656564),(23,'Rodrigo','Possell','rodrigopossell@school.edu','qF5%=Fl?7',2382889),(24,'Fritz','Roony','fritzroony@school.edu','kL0)<nW6RwXm/F3~',2354097),(25,'Jaquelin','Impett','jaquelinimpett@school.edu','nJ8#qO4aB',1245352),(26,'Shalne','Bodleigh','shalnebodleigh@school.edu','cG6{\'>X*7O',7114035),(27,'Queenie','Martinez','queeniemartinez@school.edu','hO9}!,c*KE',1200787),(28,'Christye','Jevon','christyejevon@school.edu','iT7?2dSDhSI&\"o',4036583),(29,'Myca','Fairbairn','mycafairbairn@school.edu','vX8\"}SgnG\'h',6346578),(30,'Marlowe','Haye','marlowehaye@school.edu','cU8)SEtXr2~r$Ac',6652420),(31,'Leroy','Mousley','leroymousley@school.edu','uQ6*K6X!&',2876606),(32,'Meredith','Souley','meredithsouley@school.edu','jV1<C,J+hlY',1021668),(33,'Curtice','Rubertis','curticerubertis@school.edu','lY6|)XcKGQEhgI?Y',1146986),(34,'Leoine','Thonason','leoinethonason@school.edu','lN7+D*(z>5QU',6720927),(35,'Jaclyn','Piercy','jaclynpiercy@school.edu','vS0*>)?u4eq\"uhR#',5027089),(36,'Antonie','Durrance','antoniedurrance@school.edu','nE1=2hv~Ir1|',4333616),(37,'Stirling','Gaddesby','stirlinggaddesby@school.edu','iK8_*\"e}uiyl#',8446898),(38,'Adrienne','Metterick','adriennemetterick@school.edu','oC0\"a}mMY+1e<3Ms',9915074),(39,'Merlina','Laborda','merlinalaborda@school.edu','gV0/6bFi',5868921),(40,'Junina','Woodage','juninawoodage@school.edu','eV8=if@Uk',6247024),(41,'Nat','McNeilley','natmcneilley@school.edu','uK3}A<WON/D$WwiW',1039694),(42,'Sim','Rousel','simrousel@school.edu','lO2}*vH@we/',9803600),(43,'Gardener','Lehemann','gardenerlehemann@school.edu','cI3|/US)$p)B',1807785),(44,'Danita','Stinchcombe','danitastinchcombe@school.edu','mU0%\'<WtgrV',2534221),(45,'Beverlee','Emanulsson','beverleeemanulsson@school.edu','sW8#rnC9q*',7486708),(46,'Ignaz','Rudolfer','ignazrudolfer@school.edu','tQ7*7ST_=A>RX',3114662),(47,'Raffarty','Bernholt','raffartybernholt@school.edu','gC9`\'IF#J%wf)ew',9982779),(48,'Ewan','Server','ewanserver@school.edu','iS0&JI5d~t$',7611631),(49,'Clementia','Reichartz','clementiareichartz@school.edu','aV9=ZufBh|bD,Rby',6190621),(50,'Gery','Oleszczak','geryoleszczak@school.edu','eJ0{#&rw!/vuU4j',4792513);
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

-- Dump completed on 2024-12-11  2:44:09
