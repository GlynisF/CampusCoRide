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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` (`id`, `location_name`, `lat`, `lng`) VALUES (1,'Madison',43.000000,-89.000000),(2,'Stoughton',43.000000,-89.000000),(3,'Tenny Park Dam',43.000000,-89.000000),(4,'Warner Park',43.000000,-89.000000),(5,'Janesville Ice Arena',43.000000,-89.000000),(7,'Sauk City',43.000000,-90.000000),(8,'Town of Sun Prairie',44.054394,-91.851918),(9,'Paoli',46.073732,-90.518971),(10,'Town of Sun Prairie',44.541207,-87.587670),(11,'Town of Dunn',46.576162,-89.129455),(12,'Waunakee',44.973976,-91.193999),(13,'Shorewood Hills',45.090420,-91.862866),(14,'Belleville',46.020092,-89.858493),(15,'Madison',46.324423,-88.481074),(16,'Town of Verona',42.948989,-90.096070),(17,'Town of Blooming Grove',44.723843,-91.234939),(18,'Brodhead',43.304805,-87.768245),(19,'DeForest',44.288822,-91.536613),(20,'Rockdale',46.635028,-89.779593),(21,'Waunakee',44.108024,-88.756122),(22,'Sun Prairie',46.137427,-89.125571),(23,'Town of Burke',43.342722,-90.785885),(24,'Waunakee',45.974976,-87.632867),(25,'Rockdale',43.959471,-87.871471),(26,'Sauk City',46.119338,-91.719386),(27,'Paoli',42.606327,-89.331550),(28,'Town of Oregon',44.061035,-90.084080),(29,'Town of Madison',43.781959,-89.036544),(30,'Madison',44.102202,-90.674560),(31,'Rockdale',43.371043,-90.055923),(32,'Town of Oregon',43.548749,-89.925517),(33,'Stoughton',45.551022,-90.914968),(34,'Town of Oregon',42.786887,-89.989230),(35,'Town of Dunn',46.079715,-89.247616),(36,'McFarland',43.190856,-90.676405),(37,'Stoughton',43.991269,-88.699709),(38,'Oregon',44.849503,-89.500783),(39,'Cross Plains',46.176361,-91.686429),(40,'Oregon',43.708479,-91.848393),(41,'Town of Madison',46.087074,-90.059137),(42,'Fitchburg',44.158518,-87.628164),(43,'DeForest',46.032109,-89.456187),(44,'Madison',46.785503,-91.473098),(45,'Cambridge',45.890729,-89.800271),(46,'Town of Dunn',44.126123,-89.526929),(47,'Town of Montrose',46.902652,-90.067270),(48,'Fitchburg',45.450657,-91.752521),(49,'McFarland',43.292906,-91.971919),(50,'Brodhead',44.719501,-87.985898);
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ride_form`
--

LOCK TABLES `ride_form` WRITE;
/*!40000 ALTER TABLE `ride_form` DISABLE KEYS */;
INSERT INTO `ride_form` (`id`, `role_type`, `request_type`, `date`, `time`, `notes`, `student_id`, `location_id`) VALUES (1,'Rider','From Campus','2024-11-26','10:30:00','Drop off in Vilas neighborhood.',1,1),(2,'Driver','From Campus',NULL,NULL,'Heading towards West Towne mall and can drop off anywhere near there.',2,2),(3,'Rider','To Campus','2024-12-11','12:30:00','I am located near the willy street area / near the co-op. Anytime before 12:30 would work! ',3,3),(4,'Rider','To Campus',NULL,NULL,'Far East side by Warner Park. Looking for rides M & W. Need to be to school by 2pm both days.',4,4),(5,'Driver','From Campus',NULL,NULL,'Can help out with rides M-F from campus headed towards Stoughton / Park St. area. M,W,F I leave campus at 3pm and T,TH 5pm.',5,5),(7,'Driver','Updated Request Type',NULL,NULL,'Heading towards Culvers North Side.',7,7),(8,'Rider','To Campus','2025-03-05','22:43:00','Suspendisse accumsan tortor quis turpis.',19,45),(9,'Rider','From Campus','2025-09-21','01:55:00','Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus.',29,38),(10,'Driver','From Campus','2025-06-22','17:41:00','Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla.',32,46),(11,'Rider','From Campus','2025-10-20','18:03:00','Nullam varius. Nulla facilisi.',19,35),(12,'Driver','From Campus','2025-10-21','10:38:00','Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.',20,22),(13,'Driver','To Campus','2025-03-20','12:11:00','Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia.',32,33),(14,'Rider','From Campus','2024-12-19','05:43:00','Nulla mollis molestie lorem. Quisque ut erat.',42,16),(15,'Rider','To Campus','2024-12-15','11:23:00','Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum.',19,41),(16,'Rider','From Campus','2025-04-30','02:28:00','Nullam varius. Nulla facilisi.',24,48),(17,'Driver','To Campus','2025-09-20','00:03:00','Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.',25,36),(18,'Rider','To Campus','2025-06-01','13:52:00','Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique.',37,20),(19,'Rider','To Campus','2025-04-15','02:53:00','Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti.',33,17),(20,'Driver','To Campus','2025-08-04','01:40:00','Cras pellentesque volutpat dui.',35,18),(22,'Rider','From Campus','2025-06-26','01:28:00','Proin eu mi.',12,13),(23,'Driver','From Campus','2025-11-12','18:54:00','Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam.',16,29),(25,'Rider','From Campus','2024-11-22','12:52:00','Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum.',48,44),(27,'Driver','To Campus','2025-10-22','23:37:00','Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum.',14,8),(33,'Driver','From Campus','2024-12-04','05:42:00','Nullam varius. Nulla facilisi.',19,19),(34,'Rider','To Campus','2025-02-22','16:04:00','Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh.',21,15),(36,'Rider','To Campus','2025-05-23','16:25:00','Curabitur at ipsum ac tellus semper interdum.',15,32),(39,'Driver','From Campus','2025-03-29','21:34:00','Aliquam erat volutpat. In congue.',24,12),(40,'Driver','From Campus','2025-06-16','07:20:00','Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.',49,34),(41,'Rider','From Campus','2025-08-05','04:36:00','Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.',16,31),(49,'Rider','To Campus','2025-02-27','04:11:00','Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.',44,21),(50,'Rider','To Campus','2025-01-18','06:16:00','Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue.',32,42);
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

-- Dump completed on 2024-11-19 10:43:49
