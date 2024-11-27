CREATE DATABASE  IF NOT EXISTS `db_estok` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_estok`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_estok
-- ------------------------------------------------------
-- Server version	9.1.0

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
-- Table structure for table `tb_estabelecimento`
--

DROP TABLE IF EXISTS `tb_estabelecimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_estabelecimento` (
  `id_estabelecimento` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `foto` varchar(200) NOT NULL,
  `cnpj` varchar(200) NOT NULL,
  `endereco` varchar(200) NOT NULL,
  `telefone` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `website` varchar(200) NOT NULL,
  PRIMARY KEY (`id_estabelecimento`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_estabelecimento`
--

LOCK TABLES `tb_estabelecimento` WRITE;
/*!40000 ALTER TABLE `tb_estabelecimento` DISABLE KEYS */;
INSERT INTO `tb_estabelecimento` VALUES (1,'E-stok','estok.png','20.031.219/0002-46','Avenida Salgado Filho','estok@gmail.com','4002-8922','wwww.estok.com.br');
/*!40000 ALTER TABLE `tb_estabelecimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_lote`
--

DROP TABLE IF EXISTS `tb_lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_lote` (
  `id_lote` int NOT NULL AUTO_INCREMENT,
  `produto_id` int NOT NULL,
  `codigo_lote` varchar(200) NOT NULL,
  `quantidade_produtos` int NOT NULL,
  `data_entrega_lote` datetime NOT NULL,
  `data_validade_produto` datetime NOT NULL,
  `qrcode` text NOT NULL,
  PRIMARY KEY (`id_lote`),
  KEY `produto_id` (`produto_id`),
  CONSTRAINT `tb_lote_ibfk_1` FOREIGN KEY (`produto_id`) REFERENCES `tb_produto` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_lote`
--

LOCK TABLES `tb_lote` WRITE;
/*!40000 ALTER TABLE `tb_lote` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_lote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_notificacao`
--

DROP TABLE IF EXISTS `tb_notificacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_notificacao` (
  `id_notificacao` int NOT NULL AUTO_INCREMENT,
  `lote_id` int NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `conteudo` varchar(300) NOT NULL,
  `visualizado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_notificacao`),
  KEY `lote_id` (`lote_id`),
  CONSTRAINT `tb_notificacao_ibfk_1` FOREIGN KEY (`lote_id`) REFERENCES `tb_lote` (`id_lote`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_notificacao`
--

LOCK TABLES `tb_notificacao` WRITE;
/*!40000 ALTER TABLE `tb_notificacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_notificacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_produto`
--

DROP TABLE IF EXISTS `tb_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_produto` (
  `id_produto` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `foto` varchar(200) NOT NULL,
  `categoria_produto` varchar(20) NOT NULL,
  `fabricante` varchar(200) NOT NULL,
  PRIMARY KEY (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_produto`
--

LOCK TABLES `tb_produto` WRITE;
/*!40000 ALTER TABLE `tb_produto` DISABLE KEYS */;
INSERT INTO `tb_produto` VALUES (28,'Arroz','arroz.png','CEREAIS','Dona Benta'),(29,'Feijão','feijao.png','CEREAIS','Dona Benta'),(30,'Macarrão','macarrao.jpg','MASSAS','Dona Benta'),(31,'Cerveja','cerveja.png','BEBIDAS','Itaipava'),(32,'Banana','banana.png','FRUTAS','Banana+'),(33,'Soja','soja.png','CEREAIS','Dona Benta'),(34,'Manga','manga.png','FRUTAS','Manga+'),(35,'Tangerina','tangerina.png','FRUTAS','Tangerina+');
/*!40000 ALTER TABLE `tb_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_usuario`
--

DROP TABLE IF EXISTS `tb_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `estabelecimento_id` int DEFAULT NULL,
  `nome` varchar(200) NOT NULL,
  `login` varchar(200) NOT NULL,
  `senha` varchar(200) NOT NULL,
  `tipo_usuario` varchar(13) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `estabelecimento_id` (`estabelecimento_id`),
  CONSTRAINT `tb_administrador_ibfk_1` FOREIGN KEY (`estabelecimento_id`) REFERENCES `tb_estabelecimento` (`id_estabelecimento`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_usuario`
--

LOCK TABLES `tb_usuario` WRITE;
/*!40000 ALTER TABLE `tb_usuario` DISABLE KEYS */;
INSERT INTO `tb_usuario` VALUES (3,1,'Pedro','pedro@gmail.com','pedro123','ADMINISTRADOR'),(4,1,'Caio','caio@gmail.com','caio123','ADMINISTRADOR');
/*!40000 ALTER TABLE `tb_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_valores_nutricionais`
--

DROP TABLE IF EXISTS `tb_valores_nutricionais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_valores_nutricionais` (
  `id_valores_nutricionais` int NOT NULL AUTO_INCREMENT,
  `produto_id` int NOT NULL,
  `valor_energetico` double NOT NULL,
  `porcao` double NOT NULL,
  `carboidratos` double NOT NULL,
  `proteinas` double NOT NULL,
  `gorduras_trans` double NOT NULL,
  `gorduras_saturadas` double NOT NULL,
  `gorduras_total` double NOT NULL,
  `vitaminas` double DEFAULT NULL,
  PRIMARY KEY (`id_valores_nutricionais`),
  KEY `produto_id` (`produto_id`),
  CONSTRAINT `tb_valores_nutricionais_ibfk_1` FOREIGN KEY (`produto_id`) REFERENCES `tb_produto` (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_valores_nutricionais`
--

LOCK TABLES `tb_valores_nutricionais` WRITE;
/*!40000 ALTER TABLE `tb_valores_nutricionais` DISABLE KEYS */;
INSERT INTO `tb_valores_nutricionais` VALUES (28,28,20,200,25,45,15,30,45,2),(29,29,45,200,65,43,10,10,20,2),(30,30,670,200,23,54,5,5,10,3),(31,31,343,350,234,234,10,24,34,0),(32,32,32,300,32,22,11,11,22,34),(33,33,23,200,23,23,21,12,33,22),(34,34,33,211,3,3,11,11,22,2),(35,35,23,200,23,23,11,11,22,33);
/*!40000 ALTER TABLE `tb_valores_nutricionais` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-27 14:37:27
