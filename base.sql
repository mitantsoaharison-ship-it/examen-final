-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: base
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorie` (
  `id_categorie` int(4) NOT NULL AUTO_INCREMENT,
  `nom_categorie` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_categorie`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorie`
--

LOCK TABLES `categorie` WRITE;
/*!40000 ALTER TABLE `categorie` DISABLE KEYS */;
INSERT INTO `categorie` VALUES (1,'plat'),(2,'boisson'),(3,'snack'),(4,'dessert');
/*!40000 ALTER TABLE `categorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membre`
--

DROP TABLE IF EXISTS `membre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `membre` (
  `id_membre` int(4) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `numero_etu` int(4) DEFAULT NULL,
  `image_profil` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_membre`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membre`
--

LOCK TABLES `membre` WRITE;
/*!40000 ALTER TABLE `membre` DISABLE KEYS */;
INSERT INTO `membre` VALUES (1,'Mita1',1234,'image1.jpg'),(2,'Mita2',5678,'image2.jpg'),(3,'Mita3',9101,'image3.jpg'),(4,'Mita4',1121,'image4.jpg'),(5,'Mita5',3141,'image5.jpg'),(6,'Nomena1',5161,'image6.jpg'),(7,'Nomena2',7181,'image7.jpg'),(8,'Nomena3',9202,'image8.jpg'),(9,'Nomena4',1222,'image9.jpg'),(10,'Nomena5',3242,'image10.jpg');
/*!40000 ALTER TABLE `membre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produit`
--

DROP TABLE IF EXISTS `produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produit` (
  `id_produit` int(4) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) DEFAULT NULL,
  `id_categorie` int(4) DEFAULT NULL,
  `prix_reference` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_produit`),
  KEY `id_categorie` (`id_categorie`),
  CONSTRAINT `produit_ibfk_1` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id_categorie`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produit`
--

LOCK TABLES `produit` WRITE;
/*!40000 ALTER TABLE `produit` DISABLE KEYS */;
INSERT INTO `produit` VALUES (1,'Pizza',1,8.99),(2,'Burger',1,5.99),(3,'Pasta',1,7.49),(4,'Coca-Cola',2,1.99),(5,'Pepsi',2,1.89),(6,'Water',2,0.99),(7,'Chips',3,1.49),(8,'Chocolate Bar',3,1.29),(9,'Cookies',3,1.99),(10,'Ice Cream',4,2.99),(11,'Cake',4,3.49),(12,'Pie',4,3.99),(13,'Salad',1,4.99),(14,'Juice',2,2.49),(15,'Sandwich',1,5.49);
/*!40000 ALTER TABLE `produit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produit_membre`
--

DROP TABLE IF EXISTS `produit_membre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produit_membre` (
  `id_produit_membre` int(4) DEFAULT NULL,
  `id_membre` int(4) DEFAULT NULL,
  `id_produit` int(4) DEFAULT NULL,
  `prix_vente` decimal(10,2) DEFAULT NULL,
  `quantite_dispo` int(4) DEFAULT NULL,
  `date_dispo` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produit_membre`
--

LOCK TABLES `produit_membre` WRITE;
/*!40000 ALTER TABLE `produit_membre` DISABLE KEYS */;
INSERT INTO `produit_membre` VALUES (1,1,1,5.99,10,'2024-06-01'),(2,1,2,6.99,15,'2024-06-02'),(3,1,3,8.49,20,'2024-06-03'),(4,2,4,2.49,25,'2024-06-04'),(5,2,5,2.39,30,'2024-06-05'),(6,2,6,1.49,35,'2024-06-06'),(7,3,7,1.99,40,'2024-06-07'),(8,3,8,1.79,45,'2024-06-08'),(9,3,9,2.49,50,'2024-06-09'),(10,4,10,3.49,55,'2024-06-10'),(11,4,11,3.99,60,'2024-06-11'),(12,4,12,4.49,65,'2024-06-12'),(13,5,13,5.49,70,'2024-06-13'),(14,5,14,3.49,75,'2024-06-14'),(15,5,15,6.49,80,'2024-06-15'),(16,6,1,9.49,85,'2024-06-16'),(17,6,2,6.49,90,'2024-06-17'),(18,6,3,8.29,95,'2024-06-18'),(19,7,4,2.29,100,'2024-06-19'),(20,7,5,2.19,105,'2024-06-20');
/*!40000 ALTER TABLE `produit_membre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vente`
--

DROP TABLE IF EXISTS `vente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vente` (
  `id_vente` int(4) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `heure` time DEFAULT NULL,
  `id_produit_membre` int(4) DEFAULT NULL,
  `quantite` int(4) DEFAULT NULL,
  PRIMARY KEY (`id_vente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vente`
--

LOCK TABLES `vente` WRITE;
/*!40000 ALTER TABLE `vente` DISABLE KEYS */;
/*!40000 ALTER TABLE `vente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-20  9:27:43
