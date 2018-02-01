-- MySQL dump 10.13  Distrib 5.7.12, for osx10.11 (x86_64)
--
-- Host: localhost    Database: screen_printer
-- ------------------------------------------------------
-- Server version	5.7.12

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
-- Table structure for table `finalprojectorders`
--

DROP TABLE IF EXISTS `finalprojectorders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finalprojectorders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `shirt_type` varchar(255) DEFAULT NULL,
  `color` varchar(255) NOT NULL,
  `notes` varchar(500) NOT NULL,
  `size` varchar(100) DEFAULT NULL,
  `status` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finalprojectorders`
--

LOCK TABLES `finalprojectorders` WRITE;
/*!40000 ALTER TABLE `finalprojectorders` DISABLE KEYS */;
INSERT INTO `finalprojectorders` VALUES (4,'BillyBurr',2,24,'short','green','','small','purchased'),(11,'BillyBurr',2,30,'long','black','','small','purchased'),(12,'BillyBurr',1,15,'long','green','','medium','purchased'),(13,'BillyBurr',2,36,'hoodie','black','','large','purchased'),(14,'BillyBurr',1,12,'short','yellow','','large','purchased'),(15,'BillyBurr',1,12,'short','black','','small','purchased'),(19,'BillyBurr',1,12,'short','yellow','','large','purchased'),(21,'ZachLowe',2,24,'short','yellow','','small','cart'),(22,'DaveFranco',2,24,'short','white','','small','purchased'),(23,'DaveFranco',2,36,'hoodie','yellow','','','purchased'),(24,'DaveFranco',3,36,'short','yellow','','small','purchased'),(25,'DaveFranco',3,54,'hoodie','yellow','','medium','purchased');
/*!40000 ALTER TABLE `finalprojectorders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_of_shirt` varchar(255) DEFAULT NULL,
  `size` varchar(100) DEFAULT NULL,
  `color` varchar(100) DEFAULT NULL,
  `material` varchar(255) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `cost` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,'T-shirt short-sleeve','Small','Red','Polyester',16,6,18),(2,'T-shirt short-sleeve','Medium ','Red','Polyester',11,6,18),(3,'T-shirt short-sleeve','Large','Red','Polyester',15,6,18),(4,'T-shirt short-sleeve','Small','White','Polyester',43,6,18),(5,'T-shirt short-sleeve','Medium','White','Polyester',42,6,18),(6,'T-shirt short-sleeve','Large','White','Polyester',38,6,18),(7,'T-shirt short-sleeve','Small','Blue','Polyester',49,6,18),(8,'T-shirt short-sleeve','Medium ','Blue','Polyester',6,6,18),(9,'T-shirt short-sleeve','Large','Blue','Polyester',44,6,18),(10,'T-shirt short-sleeve','Small','Green','Polyester',20,6,18),(11,'T-shirt short-sleeve','Medium','Green','Polyester',7,6,18),(12,'T-shirt short-sleeve','Large','Green','Polyester',17,6,18),(13,'T-shirt short-sleeve','Small','Black','Polyester',10,6,18),(14,'T-shirt short-sleeve','Medium ','Black','Polyester',23,6,18),(15,'T-shirt short-sleeve','Large','Black','Polyester',33,6,18),(16,'T-shirt short-sleeve','Small','Yellow','Polyester',12,6,18),(17,'T-shirt short-sleeve','Medium','Yellow','Polyester',28,6,18),(18,'T-shirt short-sleeve','Large','Yellow','Polyester',20,6,18),(19,'T-shirt short-sleeve','Small','Red','Cotton',37,5,15),(20,'T-shirt short-sleeve','Medium','Red','Cotton',41,5,15),(21,'T-shirt short-sleeve','Large','Red','Cotton',8,5,15),(22,'T-shirt short-sleeve','Small','White','Cotton',5,5,15),(23,'T-shirt short-sleeve','Medium','White','Cotton',35,5,15),(24,'T-shirt short-sleeve','Large','White','Cotton',10,5,15),(25,'T-shirt short-sleeve','Small','Blue','Cotton',22,5,15),(26,'T-shirt short-sleeve','Medium','Blue','Cotton',25,5,15),(27,'T-shirt short-sleeve','Large','Blue','Cotton',24,5,15),(28,'T-shirt short-sleeve','Small','Green','Cotton',10,5,15),(29,'T-shirt short-sleeve','Medium','Green','Cotton',48,5,15),(30,'T-shirt short-sleeve','Large','Green','Cotton',18,5,15),(31,'T-shirt short-sleeve','Small','Black','Cotton',41,5,15),(32,'T-shirt short-sleeve','Medium','Black','Cotton',15,5,15),(33,'T-shirt short-sleeve','Large','Black','Cotton',9,5,15),(34,'T-shirt short-sleeve','Small','Yellow','Cotton',16,5,15),(35,'T-shirt short-sleeve','Medium','Yellow','Cotton',16,5,15),(36,'T-shirt short-sleeve','Large','Yellow','Cotton',43,5,15),(37,'T-shirt long-sleeve','Small','Red','Cotton',32,7,21),(38,'T-shirt long-sleeve','Medium','Red','Cotton',28,7,21),(39,'T-shirt long-sleeve','Large','Red','Cotton',45,7,21),(40,'T-shirt long-sleeve','Small','White','Cotton',22,7,21),(41,'T-shirt long-sleeve','Medium','White','Cotton',46,7,21),(42,'T-shirt long-sleeve','Large','White','Cotton',28,7,21),(43,'T-shirt long-sleeve','Small','Blue','Cotton',49,7,21),(44,'T-shirt long-sleeve','Medium','Blue','Cotton',13,7,21),(45,'T-shirt long-sleeve','Large','Blue','Cotton',10,7,21),(46,'T-shirt long-sleeve','Small','Green','Cotton',32,7,21),(47,'T-shirt long-sleeve','Medium','Green','Cotton',18,7,21),(48,'T-shirt long-sleeve','Large','Green','Cotton',30,7,21),(49,'T-shirt long-sleeve','Small','Black','Cotton',24,7,21),(50,'T-shirt long-sleeve','Medium','Black','Cotton',42,7,21),(51,'T-shirt long-sleeve','Large','Black','Cotton',30,7,21),(52,'T-shirt long-sleeve','Small','Yellow','Cotton',19,7,21),(53,'T-shirt long-sleeve','Medium','Yellow','Cotton',40,7,21),(54,'T-shirt long-sleeve','Large','Yellow','Cotton',8,8,24),(55,'T-shirt long-sleeve','Small','Red','Polyester',18,8,24),(56,'T-shirt long-sleeve','Medium','Red','Polyester',44,8,24),(57,'T-shirt long-sleeve','Large','Red','Polyester',28,8,24),(58,'T-shirt long-sleeve','Small','White','Polyester',28,8,24),(59,'T-shirt long-sleeve','Medium','White','Polyester',45,8,24),(60,'T-shirt long-sleeve','Large','White','Polyester',46,8,24),(61,'T-shirt long-sleeve','Small','Blue','Polyester',31,8,24),(62,'T-shirt long-sleeve','Medium','Blue','Polyester',12,8,24),(63,'T-shirt long-sleeve','Large','Blue','Polyester',34,8,24),(64,'T-shirt long-sleeve','Small','Green','Polyester',32,8,24),(65,'T-shirt long-sleeve','Medium','Green','Polyester',26,8,24),(66,'T-shirt long-sleeve','Large','Green','Polyester',47,8,24),(67,'T-shirt long-sleeve','Small','Black','Polyester',12,8,24),(68,'T-shirt long-sleeve','Medium','Black','Polyester',29,8,24),(69,'T-shirt long-sleeve','Large','Black','Polyester',6,8,24),(70,'T-shirt long-sleeve','Small','Yellow','Polyester',20,8,24),(71,'Sweatshirt','Medium','Yellow','Cotton/Polyester Blend',36,10,30),(72,'Sweatshirt','Large','Yellow','Cotton/Polyester Blend',15,10,30),(73,'Sweatshirt','Large','Red','Cotton/Polyester Blend',49,10,30),(74,'Sweatshirt','Small','White','Cotton/Polyester Blend',33,10,30),(75,'Sweatshirt','Medium','White','Cotton/Polyester Blend',48,10,30),(76,'Sweatshirt','Large','White','Cotton/Polyester Blend',48,10,30),(77,'Sweatshirt','Small','Blue','Cotton/Polyester Blend',34,10,30),(78,'Sweatshirt','Medium','Blue','Cotton/Polyester Blend',39,10,30),(79,'Sweatshirt','Large','Blue','Cotton/Polyester Blend',47,10,30),(80,'Sweatshirt','Small','Green','Cotton/Polyester Blend',5,10,30),(81,'Sweatshirt','Medium','Green','Cotton/Polyester Blend',39,10,30),(82,'Sweatshirt','Large','Green','Cotton/Polyester Blend',11,10,30),(83,'Sweatshirt','Small','Black','Cotton/Polyester Blend',19,10,30),(84,'Sweatshirt','Medium','Black','Cotton/Polyester Blend',33,10,30),(85,'Sweatshirt','Large','Black','Cotton/Polyester Blend',32,10,30),(86,'Sweatshirt','Small','Yellow','Cotton/Polyester Blend',27,10,30),(87,'Sweatshirt','Medium','Yellow','Cotton/Polyester Blend',34,10,30),(88,'Sweatshirt','Large','Yellow','Cotton/Polyester Blend',29,10,30);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` char(60) NOT NULL,
  `user_first_name` varchar(255) NOT NULL,
  `user_last_name` varchar(255) NOT NULL,
  `user_number` int(15) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'ron','$2a$10$wJadrEskMi2eJEQ0h.tIgOveYOKJZsM8P4t3KEraZNDaxDpy/plge','ron','artest',2,'abc@abc.com'),(2,'GarryHarris','$2a$10$AT2TDh6sTJ0jGzc6hHiq.O14MV7XV9sN2iGSGJd6GPE6VxaEyxhye','gary ','harris',123,'abc@abc.com'),(3,'Carrendale','$2a$10$b.G7rVHN8j9QxYwY80BbmOP1sg7PURpDNPAvVtFUi0YatYFueg2F.','Charlie','A',123,'abc@abc.com'),(4,'Carrendale1','$2a$10$nB9zVkjudPGw0665406YsOjgEFwNOAhyTXslX/jgrM0GZgPGaDwa.','chuck','a',1,'abc@abc.com'),(5,'RussWest','$2a$10$zNZwd4lyyWriF.i0isP1sOQdc9cjGaamY4f9ewQWZ8hCxO2kG7vUC','Russell','Westbrook',1234,'russell@westbrook.com'),(6,'ZachLowe','$2a$10$M4pEe..pyRlUrWnhVY/XJe3W9j62g5mTtFCub2W/MgUNTgA99YEGO','Zach','Lowe',1,'abc@abc.com'),(7,'BillyBurr','$2a$10$IYKXkY6WA5JmTddyu3K0vOWzyGvru8NG.6yaUJRHATPT88GgY48jm','Bill','Burr',1234,'bill@burr.com'),(8,'DaveFranco','$2a$10$7R9iDUGugimeluAAkYRlreQknPX8mj.MfFV.eaZNL2el67Lij/wcy','Dave','Franco',2123213,'abc@abc.com'),(9,'KMalone','$2a$10$bHHvn0gIMthQcVXgJ0U7DeET9gwPI4XyGRZHeiEJsg8DUYKWMzFA2','Karl','Malone',1234,'abc@abc.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-01 13:09:23
