CREATE DATABASE  IF NOT EXISTS `bank_database` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bank_database`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: bank_database
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `account_id` int NOT NULL AUTO_INCREMENT,
  `account_type` enum('savings','checking') DEFAULT NULL,
  `account_number` char(15) DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `balance` decimal(15,2) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  KEY `customer_id` (`customer_id`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `account_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `accounts_summary`
--

DROP TABLE IF EXISTS `accounts_summary`;
/*!50001 DROP VIEW IF EXISTS `accounts_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `accounts_summary` AS SELECT 
 1 AS `customer_id`,
 1 AS `checking_account_balance`,
 1 AS `savings_account_balance`,
 1 AS `fd_balance`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `branch_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `manager_id` int DEFAULT NULL,
  PRIMARY KEY (`branch_id`),
  KEY `manager_id` (`manager_id`),
  CONSTRAINT `branch_ibfk_1` FOREIGN KEY (`manager_id`) REFERENCES `manager` (`manager_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `checking_account`
--

DROP TABLE IF EXISTS `checking_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checking_account` (
  `checking_account_id` int NOT NULL AUTO_INCREMENT,
  `account_id` int DEFAULT NULL,
  PRIMARY KEY (`checking_account_id`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `checking_account_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `customer_type` enum('individual','organization') DEFAULT NULL,
  `mobile_number` varchar(10) DEFAULT NULL,
  `landline_number` varchar(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_log`
--

DROP TABLE IF EXISTS `customer_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `mobile_number` varchar(10) DEFAULT NULL,
  `landline_number` varchar(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `customer_log_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deposit`
--

DROP TABLE IF EXISTS `deposit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deposit` (
  `transaction_id` int NOT NULL,
  `branch_id` int DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `deposit_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`transaction_id`),
  CONSTRAINT `deposit_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `staff_id` int DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `staff_id` (`staff_id`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`),
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fd_plan`
--

DROP TABLE IF EXISTS `fd_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fd_plan` (
  `fd_plan_id` int NOT NULL AUTO_INCREMENT,
  `duration` int DEFAULT NULL,
  `Interest_rate` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`fd_plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fixed_deposit`
--

DROP TABLE IF EXISTS `fixed_deposit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fixed_deposit` (
  `fd_id` int NOT NULL AUTO_INCREMENT,
  `savings_account_id` int DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `fd_plan_id` int DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`fd_id`),
  KEY `savings_account_id` (`savings_account_id`),
  KEY `fd_plan_id` (`fd_plan_id`),
  CONSTRAINT `fixed_deposit_ibfk_1` FOREIGN KEY (`savings_account_id`) REFERENCES `savings_account` (`savings_account_id`),
  CONSTRAINT `fixed_deposit_ibfk_2` FOREIGN KEY (`fd_plan_id`) REFERENCES `fd_plan` (`fd_plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `individual`
--

DROP TABLE IF EXISTS `individual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `individual` (
  `customer_id` int NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `NIC` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  CONSTRAINT `individual_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `loan`
--

DROP TABLE IF EXISTS `loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan` (
  `loan_id` int NOT NULL AUTO_INCREMENT,
  `account_id` int DEFAULT NULL,
  `loan_type` enum('personal','business') DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `interest_rate` decimal(4,2) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` enum('approved','pending','rejected') DEFAULT NULL,
  PRIMARY KEY (`loan_id`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `loan_installment`
--

DROP TABLE IF EXISTS `loan_installment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan_installment` (
  `installment_id` int NOT NULL AUTO_INCREMENT,
  `loan_id` int DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `duration` int DEFAULT '30',
  PRIMARY KEY (`installment_id`),
  KEY `loan_id` (`loan_id`),
  CONSTRAINT `loan_installment_ibfk_1` FOREIGN KEY (`loan_id`) REFERENCES `loan` (`loan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `loan_payment`
--

DROP TABLE IF EXISTS `loan_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan_payment` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `instalment_id` int DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `payed_date` date DEFAULT NULL,
  `status` enum('paid','unpaid') DEFAULT NULL,
  `penalty_id` int DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `instalment_id` (`instalment_id`),
  KEY `penalty_id` (`penalty_id`),
  CONSTRAINT `loan_payment_ibfk_1` FOREIGN KEY (`instalment_id`) REFERENCES `loan_installment` (`installment_id`),
  CONSTRAINT `loan_payment_ibfk_2` FOREIGN KEY (`penalty_id`) REFERENCES `penalty` (`penalty_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `manager_id` int NOT NULL AUTO_INCREMENT,
  `staff_id` int DEFAULT NULL,
  PRIMARY KEY (`manager_id`),
  KEY `staff_id` (`staff_id`),
  CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organization` (
  `customer_id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `lisence_number` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  CONSTRAINT `organization_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `penalty`
--

DROP TABLE IF EXISTS `penalty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `penalty` (
  `penalty_id` int NOT NULL AUTO_INCREMENT,
  `penalty_type_id` int DEFAULT NULL,
  PRIMARY KEY (`penalty_id`),
  KEY `penalty_type_id` (`penalty_type_id`),
  CONSTRAINT `penalty_ibfk_1` FOREIGN KEY (`penalty_type_id`) REFERENCES `penalty_types` (`penalty_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `penalty_types`
--

DROP TABLE IF EXISTS `penalty_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `penalty_types` (
  `penalty_type_id` int NOT NULL AUTO_INCREMENT,
  `penalty_amount` decimal(10,2) DEFAULT NULL,
  `penalty_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`penalty_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `savings_account`
--

DROP TABLE IF EXISTS `savings_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `savings_account` (
  `savings_account_id` int NOT NULL AUTO_INCREMENT,
  `account_id` int DEFAULT NULL,
  `savings_plan_id` int DEFAULT NULL,
  PRIMARY KEY (`savings_account_id`),
  KEY `account_id` (`account_id`),
  KEY `savings_plan_id` (`savings_plan_id`),
  CONSTRAINT `savings_account_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  CONSTRAINT `savings_account_ibfk_2` FOREIGN KEY (`savings_plan_id`) REFERENCES `savings_plan` (`savings_plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `savings_plan`
--

DROP TABLE IF EXISTS `savings_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `savings_plan` (
  `savings_plan_id` int NOT NULL AUTO_INCREMENT,
  `type` enum('child','teen','adult','senior') DEFAULT NULL,
  `Interest_rate` decimal(4,2) DEFAULT NULL,
  `minimum_balance` decimal(15,2) DEFAULT NULL,
  `age_limit` int DEFAULT NULL,
  PRIMARY KEY (`savings_plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `NIC` varchar(12) DEFAULT NULL,
  `role` enum('manager','employee') DEFAULT NULL,
  PRIMARY KEY (`staff_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `account_id` int DEFAULT NULL,
  `transaction_type` enum('deposit','withdrawal','transfer') DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `transaction_history`
--

DROP TABLE IF EXISTS `transaction_history`;
/*!50001 DROP VIEW IF EXISTS `transaction_history`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `transaction_history` AS SELECT 
 1 AS `customer_id`,
 1 AS `transaction_id`,
 1 AS `account_id`,
 1 AS `transaction_type`,
 1 AS `amount`,
 1 AS `date`,
 1 AS `description`,
 1 AS `account_number`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `transfer`
--

DROP TABLE IF EXISTS `transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transfer` (
  `transaction_id` int NOT NULL,
  `beneficiary_account_id` int DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `beneficiary_account_id` (`beneficiary_account_id`),
  CONSTRAINT `transfer_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`transaction_id`),
  CONSTRAINT `transfer_ibfk_2` FOREIGN KEY (`beneficiary_account_id`) REFERENCES `account` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `role` enum('staff','customer') DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `withdrawal`
--

DROP TABLE IF EXISTS `withdrawal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `withdrawal` (
  `transaction_id` int NOT NULL,
  `branch_id` int DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `branch_id` (`branch_id`),
  CONSTRAINT `withdrawal_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`transaction_id`),
  CONSTRAINT `withdrawal_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'bank_database'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `add_fd_interest_event` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `add_fd_interest_event` ON SCHEDULE EVERY 1 DAY STARTS '2024-10-01 19:27:45' ON COMPLETION NOT PRESERVE ENABLE DO CALL add_fd_interest() */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'bank_database'
--
/*!50003 DROP FUNCTION IF EXISTS `Calculate_interest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Calculate_interest`(`fd_plan_id` INT, `amount` DECIMAL(15,2)) RETURNS decimal(10,2)
    READS SQL DATA
BEGIN
    DECLARE `interest_rate` DECIMAL(5,2);
    DECLARE `interest` DECIMAL(10,2);

    -- Retrieve the interest rate based on the fd_plan_id
    SELECT fd.interest_rate INTO `interest_rate`
    FROM fd_plan AS fd
    WHERE fd.fd_plan_id = `fd_plan_id`;

    -- Calculate interest
    SET `interest` = `amount` * (`interest_rate`/1200);

    -- Return the calculated interest
    RETURN `interest`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `is_manager` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `is_manager`(input_user_id INT) RETURNS tinyint(1)
    READS SQL DATA
BEGIN
    DECLARE user_role VARCHAR(10);
    DECLARE staff_role VARCHAR(10);
    
    SELECT role INTO user_role FROM user WHERE user_id = input_user_id LIMIT 1;

    IF user_role = 'staff' THEN
        SELECT role INTO staff_role FROM Staff WHERE user_id = input_user_id LIMIT 1;
        IF staff_role = 'manager' THEN
            RETURN TRUE;
        END IF;
    END IF;
    
    RETURN FALSE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_fd_interest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_fd_interest`()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE fd_id INT;
    DECLARE fd_amount DECIMAL(15,2);
    DECLARE plan_id INT;
    DECLARE interest DECIMAL(10,2);
    DECLARE p_account_id INT;
    DECLARE creation_date DATE;

    DECLARE cur CURSOR FOR 
        SELECT fd_id, amount, fd_plan_id, creation_date 
        FROM fixed_deposit
        WHERE DATEDIFF(CURDATE(), creation_date) >= 30
        AND MOD(DATEDIFF(CURDATE(), creation_date), 30) = 0;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO fd_id, fd_amount, plan_id, creation_date;
        IF done THEN
            LEAVE read_loop;
        END IF;

        SELECT Calculate_interest(plan_id, fd_amount) INTO interest;

        SELECT account_id INTO p_account_id 
        FROM account 
        WHERE account_id IN (
            SELECT account_id 
            FROM savings_account 
            JOIN fixed_deposit fd USING(savings_account_id) 
            WHERE fd.fd_id = fd_id
        );

        START TRANSACTION;
        UPDATE account 
        SET balance = balance + interest 
        WHERE account_id = p_account_id;
        COMMIT;
    END LOOP;

    CLOSE cur;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `approve_loan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `approve_loan`(IN input_loan_id INT, IN manager_user_id INT)
BEGIN
    DECLARE loan_status VARCHAR(20);
    
    START TRANSACTION;

    IF is_manager(manager_user_id) THEN
        SELECT status INTO loan_status FROM loan WHERE loan_id = input_loan_id;

        IF loan_status = 'pending' THEN
            UPDATE loan
            SET status = 'approved'
            WHERE loan_id = input_loan_id;
        ELSE
			ROLLBACK;
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Loan is already approved';
        END IF;
    ELSE 
		ROLLBACK;
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'User is not authorized to approve loans';
    END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `accounts_summary`
--

/*!50001 DROP VIEW IF EXISTS `accounts_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `accounts_summary` AS select `c`.`customer_id` AS `customer_id`,coalesce(sum((case when (`a`.`account_type` = 'checking') then `a`.`balance` else 0 end)),0) AS `checking_account_balance`,coalesce(sum((case when (`a`.`account_type` = 'savings') then `a`.`balance` else 0 end)),0) AS `savings_account_balance`,coalesce(sum(`fd`.`amount`),0) AS `fd_balance` from (((`customer` `c` left join `account` `a` on((`c`.`customer_id` = `a`.`customer_id`))) left join `savings_account` `sa` on((`a`.`account_id` = `sa`.`account_id`))) left join `fixed_deposit` `fd` on((`sa`.`savings_account_id` = `fd`.`savings_account_id`))) group by `c`.`customer_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `transaction_history`
--

/*!50001 DROP VIEW IF EXISTS `transaction_history`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `transaction_history` AS select `c`.`customer_id` AS `customer_id`,`t`.`transaction_id` AS `transaction_id`,`t`.`account_id` AS `account_id`,`t`.`transaction_type` AS `transaction_type`,`t`.`amount` AS `amount`,`t`.`date` AS `date`,`t`.`description` AS `description`,`a`.`account_number` AS `account_number` from ((`customer` `c` join `account` `a` on((`c`.`customer_id` = `a`.`customer_id`))) join `transaction` `t` on((`a`.`account_id` = `t`.`account_id`))) order by `t`.`date` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-02 19:06:16