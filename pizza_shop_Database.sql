-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS customers;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE customers (
  CustomerID int NOT NULL AUTO_INCREMENT,
  first_Name varchar(100) NOT NULL,
  Phone varchar(10) NOT NULL,
  last_Name varchar(100) NOT NULL,
  Address text NOT NULL,
  Email varchar(100) DEFAULT NULL,
  PRIMARY KEY (CustomerID),
  UNIQUE KEY Phone (Phone),
  UNIQUE KEY Email (Email)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES customers WRITE;
/*!40000 ALTER TABLE customers DISABLE KEYS */;
INSERT INTO customers VALUES (1,'John','0789654356','Doe','San Diego','doejohn56@gmail.com'),(3,'Sofia','0789665342','Rashid','Atlanta','sofiarashid67@gmail.com'),(4,'Jamal','0777653401','Majok','Chicago','jamalmajok01@gmail.com'),(5,'Ester','0755342021','Watson','Los Angeles','watsonester90@gmail.com'),(6,'Mary','0790856736','Jane','Memphis','janemary@gmail.com');
/*!40000 ALTER TABLE customers ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS orders;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE orders (
  OrderID int NOT NULL AUTO_INCREMENT,
  CustomerID int NOT NULL,
  OrderDate datetime DEFAULT CURRENT_TIMESTAMP,
  TotalPrice decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (OrderID),
  KEY CustomerID (CustomerID),
  CONSTRAINT orders_ibfk_1 FOREIGN KEY (CustomerID) REFERENCES customers (CustomerID)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES orders WRITE;
/*!40000 ALTER TABLE orders DISABLE KEYS */;
INSERT INTO orders VALUES (1,1,'2023-11-01 00:00:00',7.99),(3,3,'2024-11-02 00:00:00',8.99),(5,4,'2024-11-02 00:00:00',7.99);
/*!40000 ALTER TABLE orders ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizza_ingredients`
--

DROP TABLE IF EXISTS pizza_ingredients;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE pizza_ingredients (
  PizzaID int NOT NULL,
  IngredientID int NOT NULL,
  QuantityUsed decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (PizzaID,IngredientID),
  CONSTRAINT pizza_ingredients_ibfk_1 FOREIGN KEY (PizzaID) REFERENCES pizza_types (PizzaID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizza_ingredients`
--

LOCK TABLES pizza_ingredients WRITE;
/*!40000 ALTER TABLE pizza_ingredients DISABLE KEYS */;
INSERT INTO pizza_ingredients VALUES (1,1,10.20),(2,2,15.00),(3,3,5.00);
/*!40000 ALTER TABLE pizza_ingredients ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizza_types`
--

DROP TABLE IF EXISTS pizza_types;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE pizza_types (
  PizzaID int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  BasePrice decimal(5,2) NOT NULL,
  PRIMARY KEY (PizzaID)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizza_types`
--

LOCK TABLES pizza_types WRITE;
/*!40000 ALTER TABLE pizza_types DISABLE KEYS */;
INSERT INTO pizza_types VALUES (1,'pizza pepperoni',8.99),(2,'pizza periperi',7.99),(3,'pizza chicken barbecue',5.99);
/*!40000 ALTER TABLE pizza_types ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS suppliers;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE suppliers (
  SupplierID int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  Contact varchar(10) DEFAULT NULL,
  Email varchar(100) DEFAULT NULL,
  PRIMARY KEY (SupplierID),
  UNIQUE KEY Email (Email)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES suppliers WRITE;
/*!40000 ALTER TABLE suppliers DISABLE KEYS */;
INSERT INTO suppliers VALUES (1,'Nummies Bakery','0788966654','nuumiesbakeryinc@gmail.com'),(2,'Home Run Inn','0767543778','homeruninn@gmail.com');
/*!40000 ALTER TABLE suppliers ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-22 23:35:20
