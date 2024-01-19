-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: cinemabookingsystem
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `Admin_id` int DEFAULT NULL,
  `Joining_date` int DEFAULT NULL,
  `phone` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  KEY `fk_user_admins` (`Admin_id`),
  CONSTRAINT `fk_user_admins` FOREIGN KEY (`Admin_id`) REFERENCES `users` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `BookingID` int NOT NULL AUTO_INCREMENT,
  `Customer_id` int DEFAULT NULL,
  `ShowID` int DEFAULT NULL,
  `SeatNumber` varchar(5) DEFAULT NULL,
  `Transactiondate` datetime DEFAULT NULL,
  `TransactionAmount` int DEFAULT NULL,
  `Number_tickets` int DEFAULT NULL,
  `promotionID` int DEFAULT NULL,
  PRIMARY KEY (`BookingID`),
  KEY `fk_show_reservation` (`ShowID`),
  KEY `fk_bookings_users` (`Customer_id`),
  KEY `promotionID` (`promotionID`),
  CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`promotionID`) REFERENCES `promotions` (`promotionID`),
  CONSTRAINT `fk_bookings_users` FOREIGN KEY (`Customer_id`) REFERENCES `customers` (`customerID`)
) ENGINE=InnoDB AUTO_INCREMENT=533134 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cartID` int NOT NULL,
  `customerID` int DEFAULT NULL,
  `movieID` int DEFAULT NULL,
  `tickettype` varchar(255) COLLATE latin1_general_cs DEFAULT NULL,
  `seats` varchar(255) COLLATE latin1_general_cs DEFAULT NULL,
  `date` varchar(255) COLLATE latin1_general_cs DEFAULT NULL,
  `time` varchar(255) COLLATE latin1_general_cs DEFAULT NULL,
  `ticketamount` int DEFAULT NULL,
  PRIMARY KEY (`cartID`),
  KEY `customerID` (`customerID`),
  KEY `movieID` (`movieID`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customers` (`customerID`),
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`movieID`) REFERENCES `movies` (`movieID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (187,80,96,'Adult','C11','2021-11-25,2021-12-03,2021-12-08','21:00',1);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkout`
--

DROP TABLE IF EXISTS `checkout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkout` (
  `Customer_id` int DEFAULT NULL,
  `Movie_id` int DEFAULT NULL,
  `BookingID` int DEFAULT NULL,
  KEY `fk_Checkout_customer` (`Customer_id`),
  KEY `fk_Checkout_movies` (`Movie_id`),
  KEY `fk_Checkout_booking` (`BookingID`),
  CONSTRAINT `fk_Checkout_booking` FOREIGN KEY (`BookingID`) REFERENCES `bookings` (`BookingID`),
  CONSTRAINT `fk_Checkout_customer` FOREIGN KEY (`Customer_id`) REFERENCES `customers` (`customerID`),
  CONSTRAINT `fk_Checkout_movies` FOREIGN KEY (`Movie_id`) REFERENCES `movies` (`movieID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkout`
--

LOCK TABLES `checkout` WRITE;
/*!40000 ALTER TABLE `checkout` DISABLE KEYS */;
/*!40000 ALTER TABLE `checkout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinema_hall`
--

DROP TABLE IF EXISTS `cinema_hall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinema_hall` (
  `CinemaHallID` int NOT NULL AUTO_INCREMENT,
  `Hall_name` varchar(50) NOT NULL,
  `TotalSeats` int DEFAULT NULL,
  `Movie_id` int DEFAULT NULL,
  PRIMARY KEY (`CinemaHallID`),
  KEY `fk_Cinemas_movies` (`Movie_id`),
  CONSTRAINT `fk_Cinemas_movies` FOREIGN KEY (`Movie_id`) REFERENCES `movies` (`movieID`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema_hall`
--

LOCK TABLES `cinema_hall` WRITE;
/*!40000 ALTER TABLE `cinema_hall` DISABLE KEYS */;
/*!40000 ALTER TABLE `cinema_hall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinema_screen`
--

DROP TABLE IF EXISTS `cinema_screen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinema_screen` (
  `CinemaSeatID` int NOT NULL AUTO_INCREMENT,
  `CinemaHallID` int DEFAULT NULL,
  `SeatNumber` varchar(5) DEFAULT NULL,
  `Movie_id` int DEFAULT NULL,
  PRIMARY KEY (`CinemaSeatID`),
  KEY `fk_Cinemaseat_hall` (`CinemaHallID`),
  KEY `fk_Cinemascreen_movie` (`Movie_id`),
  CONSTRAINT `fk_Cinemascreen_movie` FOREIGN KEY (`Movie_id`) REFERENCES `movies` (`movieID`),
  CONSTRAINT `fk_Cinemaseat_hall` FOREIGN KEY (`CinemaHallID`) REFERENCES `cinema_hall` (`CinemaHallID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema_screen`
--

LOCK TABLES `cinema_screen` WRITE;
/*!40000 ALTER TABLE `cinema_screen` DISABLE KEYS */;
/*!40000 ALTER TABLE `cinema_screen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customerID` int NOT NULL,
  `userID` int DEFAULT NULL,
  `age` int DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `subscribed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`customerID`),
  KEY `userID` (`userID`),
  CONSTRAINT `userID` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (80,79,NULL,'','','','',0),(178,177,NULL,'','','','',NULL),(180,179,NULL,'','','','30063',0);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (188);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moviecategory`
--

DROP TABLE IF EXISTS `moviecategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moviecategory` (
  `categoryID` int NOT NULL,
  `movieID` int DEFAULT NULL,
  `category` varchar(255) COLLATE latin1_general_cs DEFAULT NULL,
  PRIMARY KEY (`categoryID`),
  KEY `movieID` (`movieID`),
  CONSTRAINT `moviecategory_ibfk_1` FOREIGN KEY (`movieID`) REFERENCES `movies` (`movieID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moviecategory`
--

LOCK TABLES `moviecategory` WRITE;
/*!40000 ALTER TABLE `moviecategory` DISABLE KEYS */;
INSERT INTO `moviecategory` VALUES (106,105,'Action'),(107,105,'Adventure'),(108,105,'Sci-Fi'),(118,117,'Action'),(119,117,'Adventure'),(120,117,'Drama'),(182,181,'Action'),(183,181,'Adventure'),(184,181,'Sci-Fi');
/*!40000 ALTER TABLE `moviecategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `movieID` int NOT NULL AUTO_INCREMENT,
  `movietitle` varchar(50) NOT NULL,
  `cast` varchar(255) DEFAULT NULL,
  `director` varchar(255) DEFAULT NULL,
  `producer` varchar(255) DEFAULT NULL,
  `synopsis` varchar(255) DEFAULT NULL,
  `review` varchar(255) DEFAULT NULL,
  `trailerpicture` varchar(255) DEFAULT NULL,
  `trailervideo` varchar(255) DEFAULT NULL,
  `MPAArating` varchar(255) DEFAULT NULL,
  `movieprice` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`movieID`),
  KEY `fk_movies_idx` (`movieID`)
) ENGINE=InnoDB AUTO_INCREMENT=12341 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (82,'Star Wars: Episode III - Revenge of the Sith','Hayden Christensen, Natalie Portman, Ewan McGregor','George Lucas','George','Three years into the Clone Wars, the Jedi rescue Palpatine from Count Dooku. As Obi-Wan pursues a new threat, Anakin acts as a double agent between the Jedi Council and Palpatine and is lured into a sinister plan to rule the galaxy.','7.5 / 10','https://m.media-amazon.com/images/M/MV5BNTc4MTc3NTQ5OF5BMl5BanBnXkFtZTcwOTg0NjI4NA@@._V1_SX300.jpg','V','PG-13',NULL),(93,'Venom: Let There Be Carnage','Tom Hardy, Woody Harrelson, Michelle Williams','Andy Serkis','Producer','Eddie Brock attempts to reignite his career by interviewing serial killer Cletus Kasady, who becomes the host of the symbiote Carnage and escapes prison after a failed execution.','6.4 / 10','https://m.media-amazon.com/images/M/MV5BYTc3ZTAwYTgtMmM4ZS00MDRiLWI2Y2EtYmRiZmE0YjkzMGY1XkEyXkFqcGdeQXVyMDA4NzMyOA@@._V1_SX300.jpg','https://www.youtube.com/watch?v=-FmWuCgJmxo','PG-13',NULL),(94,'Star Wars: Episode IX - The Rise of Skywalker','Daisy Ridley, John Boyega, Oscar Isaac','J.J. Abrams','Producer','In the riveting conclusion of the landmark Skywalker saga, new legends will be born-and the final battle for freedom is yet to come.','6.6 / 10','https://m.media-amazon.com/images/M/MV5BMDljNTQ5ODItZmQwMy00M2ExLTljOTQtZTVjNGE2NTg0NGIxXkEyXkFqcGdeQXVyODkzNTgxMDg@._V1_SX300.jpg','https://www.youtube.com/watch?v=8Qn_spdM5Zg','PG-13',NULL),(95,'The Incredible Hulk','Edward Norton, Liv Tyler, Tim Roth','Louis Leterrier','Producer','Bruce Banner, a scientist on the run from the U.S. Government, must find a cure for the monster he turns into whenever he loses his temper.','6.6 / 10','https://m.media-amazon.com/images/M/MV5BMTUyNzk3MjA1OF5BMl5BanBnXkFtZTcwMTE1Njg2MQ@@._V1_SX300.jpg','https://www.youtube.com/watch?v=xbqNb2PFKKA','PG-13',NULL),(96,'Black Widow','Scarlett Johansson, Florence Pugh, David Harbour','Cate Shortland','Producer','Natasha Romanoff confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises.','6.8 / 10','https://m.media-amazon.com/images/M/MV5BNjRmNDI5MjMtMmFhZi00YzcwLWI4ZGItMGI2MjI0N2Q3YmIwXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_SX300.jpg','https://www.youtube.com/watch?v=Fp9pNPdNwjI','PG-13',NULL),(105,'Iron Man','Robert Downey Jr., Gwyneth Paltrow, Terrence Howard','Jon Favreau','Producer','After being held captive in an Afghan cave, billionaire engineer Tony Stark creates a unique weaponized suit of armor to fight evil.','7.9 / 10','https://m.media-amazon.com/images/M/MV5BMTczNTI2ODUwOF5BMl5BanBnXkFtZTcwMTU0NTIzMw@@._V1_SX300.jpg','Video','PG-13',NULL),(117,'Avengers: Endgame','Robert Downey Jr., Chris Evans, Mark Ruffalo','Anthony Russo, Joe Russo','Producer','After the devastating events of Avengers: Infinity War (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to reverse Thanos\' actions and restore balance to the universe.','8.4 / 10','https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_SX300.jpg','V','PG-13',NULL),(181,'Spider-Man','Tobey Maguire, Kirsten Dunst, Willem Dafoe','Sam Raimi','producer','When bitten by a genetically modified spider, a nerdy, shy, and awkward high school student gains spider-like abilities that he eventually must use to fight evil as a superhero after tragedy befalls his family.','7.3 / 10','https://m.media-amazon.com/images/M/MV5BZDEyN2NhMjgtMjdhNi00MmNlLWE5YTgtZGE4MzNjMTRlMGEwXkEyXkFqcGdeQXVyNDUyOTg3Njg@._V1_SX300.jpg','video','PG-13',NULL);
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `cardID` int NOT NULL,
  `customerID` int DEFAULT NULL,
  `cardNumber` varchar(255) DEFAULT NULL,
  `cardType` varchar(255) DEFAULT NULL,
  `expiration` date DEFAULT NULL,
  `securityCode` int DEFAULT NULL,
  PRIMARY KEY (`cardID`),
  KEY `fk_payments_customers` (`customerID`),
  CONSTRAINT `fk_payments_customers` FOREIGN KEY (`customerID`) REFERENCES `customers` (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions`
--

DROP TABLE IF EXISTS `promotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotions` (
  `promotionID` int NOT NULL,
  `promocode` varchar(255) DEFAULT NULL,
  `discountvalue` double DEFAULT NULL,
  `startdate` varchar(255) DEFAULT NULL,
  `enddate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`promotionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions`
--

LOCK TABLES `promotions` WRITE;
/*!40000 ALTER TABLE `promotions` DISABLE KEYS */;
INSERT INTO `promotions` VALUES (113,'123456',0.1,'2021-11-16','2021-11-18'),(114,'52689',0.23,'2021-11-16','2021-11-19'),(115,'123456',0.2,'2021-11-16','2021-11-19'),(116,'123456',0.2,'2021-11-16','2021-11-18'),(124,'789456',0.2,'2021-11-24','2021-11-26'),(186,'34567',0.2,'2021-05-24','2021-06-21');
/*!40000 ALTER TABLE `promotions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shows`
--

DROP TABLE IF EXISTS `shows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shows` (
  `showID` int NOT NULL,
  `movieID` int DEFAULT NULL,
  `cinemahallname` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`showID`),
  KEY `movieID` (`movieID`),
  CONSTRAINT `shows_ibfk_1` FOREIGN KEY (`movieID`) REFERENCES `movies` (`movieID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shows`
--

LOCK TABLES `shows` WRITE;
/*!40000 ALTER TABLE `shows` DISABLE KEYS */;
INSERT INTO `shows` VALUES (109,105,'Hall 1','2021-11-17','14:43'),(110,96,'Hall 1','2021-11-25','14:49'),(121,117,'Hall 2','2021-11-26','17:47'),(122,105,'Hall 2','2021-11-26','17:47'),(123,105,'Hall 2','2021-11-26','18:00'),(159,82,'Hall 1','2021-12-03','21:00'),(160,93,'Hall 1','2021-12-03','21:00'),(161,94,'Hall 1','2021-12-03','21:00'),(162,95,'Hall 1','2021-12-03','21:00'),(163,96,'Hall 1','2021-12-03','21:00'),(164,105,'Hall 1','2021-12-03','21:00'),(165,117,'Hall 1','2021-12-03','21:00'),(167,82,'Hall 2','2021-12-03','12:15'),(168,82,'Hall 3','2021-12-03','15:15'),(169,82,'Hall 2','2021-12-04','20:15'),(170,82,'Hall 3','2021-12-04','22:15'),(185,96,'Hall 1','2021-12-08','21:00');
/*!40000 ALTER TABLE `shows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userID` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `accountstatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userID`),
  KEY `fk_users_idx` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=71234 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','Admin','admin@admin.com','111-111-1111','admin','$2a$10$3T.gB70tBZR/8ChK8fh5AeEzvgwYLJwOEOzUKsAd2imG1kaKEKXZ2','ROLE_ADMIN','Active'),(79,'John','Doe','johndoe@email.com','111-111-1111','johndoe','$2a$10$DzT2wn/teHwbEJACWpGDReXpJrsvOJImSufm9a5n.dX41D7X7jPrG','ROLE_USER','Inactive'),(177,'kc','pal','kc_pal@gmail.com','999-999-9999','kc_pal','$2a$10$a1t5osd5z.7zHvDNqp0gsuXEq8.8/8xiMrrab0TWRt/e4TWFkOuwa','ROLE_USER','Inactive'),(179,'yaswanth','palli','yaswanth@gmail.com','989-233-3333','yaswanth','$2a$10$G9qxUVSxGEhnempv.XsKcORzzV6RLbqWyIddvH8.JDbhGq86L7xYa','ROLE_USER','Inactive');
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

-- Dump completed on 2021-12-03 20:50:45
