-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: clube_indie_db
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'RPG'),(2,'Plataforma'),(3,'Ação & Aventura'),(4,'Terror'),(5,'RPG'),(6,'Plataforma'),(7,'Ação & Aventura'),(8,'Terror');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudio`
--

DROP TABLE IF EXISTS `estudio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `email` varchar(45) NOT NULL,
  `pais` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudio`
--

LOCK TABLES `estudio` WRITE;
/*!40000 ALTER TABLE `estudio` DISABLE KEYS */;
INSERT INTO `estudio` VALUES (1,'Moonlight Studios','contact@moonlight.com','Brasil'),(2,'Pixel Craft','dev@pixelcraft.io','Canadá'),(3,'RetroByte Games','info@retrobyte.jp','Japão'),(4,'Moonlight Studios','contact@moonlight.com','Brasil'),(5,'Pixel Craft','dev@pixelcraft.io','Canadá'),(6,'RetroByte Games','info@retrobyte.jp','Japão');
/*!40000 ALTER TABLE `estudio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jogadores`
--

DROP TABLE IF EXISTS `jogadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jogadores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome_completo` varchar(50) NOT NULL,
  `email` varchar(45) NOT NULL,
  `data_cadastro` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_jogadores` (`id`,`nome_completo`,`email`,`data_cadastro`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jogadores`
--

LOCK TABLES `jogadores` WRITE;
/*!40000 ALTER TABLE `jogadores` DISABLE KEYS */;
INSERT INTO `jogadores` VALUES (1,'Lucas Silveira','lucas.silva@gmail.com','2026-10-15 17:03:16'),(2,'Mariana Costa','mari.costa@hotmail.com','2026-10-15 17:03:16'),(3,'Beatriz Mendes','bea.mendes@gmail.com','2026-10-15 17:03:16'),(4,'Lucas Silveira','lucas.silva@gmail.com','2026-11-09 17:38:46'),(5,'Mariana Costa','mari.costa@hotmail.com','2026-11-09 17:38:46'),(6,'Beatriz Mendes','bea.mendes@gmail.com','2026-11-09 17:38:46');
/*!40000 ALTER TABLE `jogadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jogadores_compram_jogos`
--

DROP TABLE IF EXISTS `jogadores_compram_jogos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jogadores_compram_jogos` (
  `jogadores_id` int NOT NULL,
  `jogos_id` int NOT NULL,
  `data_compra` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `preco_jogo_cobrado` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`jogadores_id`,`jogos_id`,`data_compra`),
  KEY `fk_games_id` (`jogos_id`),
  CONSTRAINT `fk_games_id` FOREIGN KEY (`jogos_id`) REFERENCES `jogos` (`id`),
  CONSTRAINT `fk_jogadores_id` FOREIGN KEY (`jogadores_id`) REFERENCES `jogadores` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jogadores_compram_jogos`
--

LOCK TABLES `jogadores_compram_jogos` WRITE;
/*!40000 ALTER TABLE `jogadores_compram_jogos` DISABLE KEYS */;
INSERT INTO `jogadores_compram_jogos` VALUES (1,1,'2026-10-15 17:03:26',89.90),(1,1,'2026-11-09 17:38:46',89.90),(1,2,'2026-10-15 17:03:26',35.00),(1,2,'2026-11-09 17:38:46',35.00),(2,3,'2026-10-15 17:03:26',120.00),(2,3,'2026-11-09 17:38:46',120.00),(3,1,'2026-10-15 17:03:26',89.90),(3,1,'2026-11-09 17:38:46',89.90);
/*!40000 ALTER TABLE `jogadores_compram_jogos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jogos`
--

DROP TABLE IF EXISTS `jogos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jogos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `ano_lancamento` date NOT NULL,
  `preco` decimal(5,2) NOT NULL,
  `estudio_id` int NOT NULL,
  `categoria_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_estudio_id` (`estudio_id`),
  KEY `fk_categoria_id` (`categoria_id`),
  KEY `idx_jogos` (`id`,`titulo`,`ano_lancamento`,`preco`,`estudio_id`,`categoria_id`),
  CONSTRAINT `fk_categoria_id` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`),
  CONSTRAINT `fk_estudio_id` FOREIGN KEY (`estudio_id`) REFERENCES `estudio` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jogos`
--

LOCK TABLES `jogos` WRITE;
/*!40000 ALTER TABLE `jogos` DISABLE KEYS */;
INSERT INTO `jogos` VALUES (1,'Starbound Odyssey','2023-05-15',89.90,1,1),(2,'Pixel Knight','2022-11-20',35.00,2,2),(3,'Shadows in the Dark','2024-01-10',120.00,3,4),(4,'Cyber Runner','2023-08-30',50.00,2,3),(5,'Starbound Odyssey','2023-05-15',89.90,1,1),(6,'Pixel Knight','2022-11-20',35.00,2,2),(7,'Shadows in the Dark','2024-01-10',120.00,3,4),(8,'Cyber Runner','2023-08-30',50.00,2,3),(9,'The Witcher 3','2015-05-19',129.90,1,2);
/*!40000 ALTER TABLE `jogos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_valida_preco_jogos` BEFORE INSERT ON `jogos` FOR EACH ROW BEGIN
IF NEW.preco < 0
THEN SET NEW.preco = 0.00;
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `plataformas`
--

DROP TABLE IF EXISTS `plataformas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plataformas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plataformas`
--

LOCK TABLES `plataformas` WRITE;
/*!40000 ALTER TABLE `plataformas` DISABLE KEYS */;
INSERT INTO `plataformas` VALUES (1,'PC (Steam)'),(2,'PlayStation 5'),(3,'Nintendo Switch'),(4,'Xbox Series X'),(5,'PC (Steam)'),(6,'PlayStation 5'),(7,'Nintendo Switch'),(8,'Xbox Series X');
/*!40000 ALTER TABLE `plataformas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plataformas_lancam_jogos`
--

DROP TABLE IF EXISTS `plataformas_lancam_jogos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plataformas_lancam_jogos` (
  `plataformas_id` int NOT NULL,
  `jogos_id` int NOT NULL,
  PRIMARY KEY (`plataformas_id`,`jogos_id`),
  KEY `fk_jogos_id` (`jogos_id`),
  CONSTRAINT `fk_jogos_id` FOREIGN KEY (`jogos_id`) REFERENCES `jogos` (`id`),
  CONSTRAINT `fk_plataformas_id` FOREIGN KEY (`plataformas_id`) REFERENCES `plataformas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plataformas_lancam_jogos`
--

LOCK TABLES `plataformas_lancam_jogos` WRITE;
/*!40000 ALTER TABLE `plataformas_lancam_jogos` DISABLE KEYS */;
INSERT INTO `plataformas_lancam_jogos` VALUES (1,1),(2,1),(1,2),(3,2),(1,3),(2,3),(4,3),(1,4);
/*!40000 ALTER TABLE `plataformas_lancam_jogos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_catalogo_jogos`
--

DROP TABLE IF EXISTS `vw_catalogo_jogos`;
/*!50001 DROP VIEW IF EXISTS `vw_catalogo_jogos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_catalogo_jogos` AS SELECT 
 1 AS `titulo`,
 1 AS `estudio`,
 1 AS `categoria`,
 1 AS `preco`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_valor_promocional`
--

DROP TABLE IF EXISTS `vw_valor_promocional`;
/*!50001 DROP VIEW IF EXISTS `vw_valor_promocional`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_valor_promocional` AS SELECT 
 1 AS `titulo`,
 1 AS `preco`,
 1 AS `preco_promocional`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'clube_indie_db'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_preco_promocional` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_preco_promocional`(p_preco DECIMAL(5,2)) RETURNS decimal(5,2)
    DETERMINISTIC
BEGIN
RETURN p_preco * 0.90;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_cadastra_jogos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cadastra_jogos`(
IN p_titulo VARCHAR(100),
IN p_ano_lancamento DATE,
IN p_preco DECIMAL(5,2),
IN p_estudio_id INT,
IN p_categoria_id INT)
BEGIN
INSERT INTO jogos(titulo, ano_lancamento, preco, estudio_id, categoria_id)
VALUES (p_titulo, p_ano_lancamento, p_preco, p_estudio_id, p_categoria_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_catalogo_jogos`
--

/*!50001 DROP VIEW IF EXISTS `vw_catalogo_jogos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_catalogo_jogos` AS select `jogos`.`titulo` AS `titulo`,`estudio`.`nome` AS `estudio`,`categoria`.`nome` AS `categoria`,`jogos`.`preco` AS `preco` from ((`jogos` join `estudio` on((`estudio`.`id` = `jogos`.`estudio_id`))) join `categoria` on((`jogos`.`categoria_id` = `categoria`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_valor_promocional`
--

/*!50001 DROP VIEW IF EXISTS `vw_valor_promocional`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_valor_promocional` AS select `jogos`.`titulo` AS `titulo`,`jogos`.`preco` AS `preco`,`fn_preco_promocional`(`jogos`.`preco`) AS `preco_promocional` from `jogos` */;
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

-- Dump completed on 2026-11-22 16:57:26
