CREATE DATABASE tienda_camisas;
USE tienda_camisas;

/*
 Navicat Premium Data Transfer

 Source Server         : conexion
 Source Server Type    : MySQL
 Source Server Version : 100138
 Source Host           : localhost:3306
 Source Schema         : tienda_camisas

 Target Server Type    : MySQL
 Target Server Version : 100138
 File Encoding         : 65001

 Date: 26/06/2021 05:28:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for categorias
-- ----------------------------
DROP TABLE IF EXISTS `categorias`;
CREATE TABLE `categorias`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of categorias
-- ----------------------------
INSERT INTO `categorias` VALUES (1, 'Manga corta');
INSERT INTO `categorias` VALUES (2, 'Tirantes');
INSERT INTO `categorias` VALUES (3, 'Manga larga');
INSERT INTO `categorias` VALUES (4, 'Sudaderas');

-- ----------------------------
-- Table structure for lineas_pedidos
-- ----------------------------
DROP TABLE IF EXISTS `lineas_pedidos`;
CREATE TABLE `lineas_pedidos`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `pedido_id` int(255) NOT NULL,
  `producto_id` int(255) NOT NULL,
  `unidades` int(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_linea_pedido`(`pedido_id`) USING BTREE,
  INDEX `fk_linea_producto`(`producto_id`) USING BTREE,
  CONSTRAINT `fk_linea_pedido` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_linea_producto` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pedidos
-- ----------------------------
DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE `pedidos`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(255) NOT NULL,
  `provincia` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `localidad` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `direccion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `coste` float(200, 2) NOT NULL,
  `estado` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `fecha` date NULL DEFAULT NULL,
  `hora` time(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_pedido_usuario`(`usuario_id`) USING BTREE,
  CONSTRAINT `fk_pedido_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for productos
-- ----------------------------
DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `categoria_id` int(255) NOT NULL,
  `nombre` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `descripcion` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `precio` float(100, 2) NOT NULL,
  `stock` int(255) NOT NULL,
  `fecha` date NOT NULL,
  `imagen` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_producto_categoria`(`categoria_id`) USING BTREE,
  CONSTRAINT `fk_producto_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of productos
-- ----------------------------
INSERT INTO `productos` VALUES (1, 4, 'Sudadera 1', 'Sudadera de color verde', 45.00, 20, '2021-06-26', 'sudadera1.jpg');
INSERT INTO `productos` VALUES (2, 4, 'Sudadera 2', 'Sudadera de color rojo', 35.00, 15, '2021-06-26', 'sudadera2.jpg');
INSERT INTO `productos` VALUES (3, 4, 'Sudadera 3', 'Sudadera de color humo', 42.00, 16, '2021-06-26', 'sudadera3.jpg');
INSERT INTO `productos` VALUES (4, 4, 'Sudadera 4', 'Sudadera de color azul', 46.00, 14, '2021-06-26', 'sudadera4.jpg');
INSERT INTO `productos` VALUES (5, 4, 'Sudadera 5', 'Sudadera de color negro', 50.00, 18, '2021-06-26', 'sudadera5.png');
INSERT INTO `productos` VALUES (6, 4, 'Sudadera 6', 'Sudadera de color negro con gris', 55.00, 17, '2021-06-26', 'sudadera6.jpg');
INSERT INTO `productos` VALUES (7, 4, 'Sudadera 7', 'Sudadera de color negro con rojo', 60.00, 12, '2021-06-26', 'sudadera7.jpg');
INSERT INTO `productos` VALUES (8, 3, 'Manga Larga 1', 'Manga Larga de color gris', 35.00, 15, '2021-06-26', 'mlarga1.jpg');
INSERT INTO `productos` VALUES (9, 3, 'Manga Larga 2', 'Manga Larga de color celeste', 31.00, 18, '2021-06-26', 'mlarga2.jpg');
INSERT INTO `productos` VALUES (10, 3, 'Manga Larga 3', 'Manga Larga de color naranja', 32.00, 13, '2021-06-26', 'mlarga3.jpg');
INSERT INTO `productos` VALUES (11, 3, 'Manga Larga 4', 'Manga Larga de color negro', 36.00, 14, '2021-06-26', 'mlarga4.jpg');
INSERT INTO `productos` VALUES (12, 3, 'Manga Larga 5', 'Manga Larga de color rojo con negro', 42.00, 16, '2021-06-26', 'mlarga5.jpg');
INSERT INTO `productos` VALUES (13, 3, 'Manga Larga 6', 'Manga Larga de color azul', 34.00, 19, '2021-06-26', 'mlarga6.jpg');
INSERT INTO `productos` VALUES (14, 3, 'Manga Larga 7', 'Manga Larga de color blanco con gris', 38.00, 17, '2021-06-26', 'mlarga7.jpg');
INSERT INTO `productos` VALUES (15, 3, 'Manga Larga 8', 'Manga Larga de color rojo', 33.00, 20, '2021-06-26', 'mlarga8.jpg');
INSERT INTO `productos` VALUES (16, 3, 'Manga Larga 9', 'Manga Larga de color gris con manchas oscuras', 45.00, 12, '2021-06-26', 'mlarga9.webp');
INSERT INTO `productos` VALUES (17, 3, 'Manga Larga 10', 'Manga Larga de color gris oscuro', 40.00, 15, '2021-06-26', 'mlarga10.jpg');
INSERT INTO `productos` VALUES (18, 2, 'Tirante 1', 'Tirante de color rojo con blanco y celeste', 30.00, 18, '2021-06-26', 'tirante1.jpg');
INSERT INTO `productos` VALUES (19, 2, 'Tirante 2', 'Tirante de color negro con blanco y rojo', 31.00, 17, '2021-06-26', 'tirante2.png');
INSERT INTO `productos` VALUES (20, 2, 'Tirante 3', 'Tirante de color blanco con gris y negro', 35.00, 14, '2021-06-26', 'tirante3.jpg');
INSERT INTO `productos` VALUES (21, 2, 'Tirante 4', 'Tirante de color blanco con rojo y azul', 32.00, 12, '2021-06-26', 'tirante4.jpg');
INSERT INTO `productos` VALUES (22, 2, 'Tirante 5', 'Tirante de color celeste con rayas horizontales', 27.00, 20, '2021-06-26', 'tirante5.jpg');
INSERT INTO `productos` VALUES (23, 2, 'Tirante 6', 'Tirante de color blanco', 28.00, 13, '2021-06-26', 'tirante6.jpg');
INSERT INTO `productos` VALUES (24, 2, 'Tirante 7', 'Tirante de color gris oscuro', 26.00, 15, '2021-06-26', 'tirante7.jpg');
INSERT INTO `productos` VALUES (25, 2, 'Tirante 8', 'Tirante de color negro con blanco y amarillo', 29.00, 19, '2021-06-26', 'tirante8.jpg');
INSERT INTO `productos` VALUES (26, 2, 'Tirante 9', 'Tirante de color gris claro', 25.00, 16, '2021-06-26', 'tirante9.jpg');
INSERT INTO `productos` VALUES (27, 1, 'Manga Corta 1', 'Manga Corta de color negro con gris', 40.00, 13, '2021-06-26', 'mcorta1.webp');
INSERT INTO `productos` VALUES (28, 1, 'Manga Corta 2', 'Manga Corta de color azul con negro y blanco', 38.00, 16, '2021-06-26', 'mcorta2.jpg');
INSERT INTO `productos` VALUES (29, 1, 'Manga Corta 3', 'Manga Corta de color azul oscuro con rojo y blanco', 37.00, 14, '2021-06-26', 'mcorta3.webp');
INSERT INTO `productos` VALUES (30, 1, 'Manga Corta 4', 'Manga Corta de color gris oscuro con rojo', 33.00, 19, '2021-06-26', 'mcorta4.jpg');
INSERT INTO `productos` VALUES (31, 1, 'Manga Corta 5', 'Manga Corta de color negro con una raya blanca', 36.00, 17, '2021-06-26', 'mcorta5.jpg');
INSERT INTO `productos` VALUES (32, 1, 'Manga Corta 6', 'Manga Corta de color blanco con negro y azul', 39.00, 12, '2021-06-26', 'mcorta6.jpg');
INSERT INTO `productos` VALUES (33, 1, 'Manga Corta 7', 'Manga Corta de color blanco con negro y rosado', 35.00, 15, '2021-06-26', 'mcorta7.webp');
INSERT INTO `productos` VALUES (34, 1, 'Manga Corta 8', 'Manga Corta de color azul con blanco y negro', 34.00, 17, '2021-06-26', 'mcorta8.webp');
INSERT INTO `productos` VALUES (35, 1, 'Manga Corta 9', 'Manga Corta de color verde con amarillo', 31.00, 20, '2021-06-26', 'mcorta9.jpg');
INSERT INTO `productos` VALUES (36, 1, 'Manga Corta 10', 'Manga Corta de color gris con celeste', 32.00, 18, '2021-06-26', 'mcorta10.jpg');
INSERT INTO `productos` VALUES (37, 1, 'Manga Corta 11', 'Manga Corta de color blanco con azul', 30.00, 15, '2021-06-26', 'mcorta11.jpg');

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `apellidos` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `rol` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uq_email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;