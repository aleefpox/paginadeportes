-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 07, 2026 at 09:29 AM
-- Server version: 8.4.3
-- PHP Version: 8.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `direccion_deportes`
--

-- --------------------------------------------------------

--
-- Table structure for table `contenido`
--

CREATE TABLE `contenido` (
  `id_contenido` int NOT NULL,
  `titulo` varchar(150) DEFAULT NULL,
  `descripcion` text,
  `tipo` varchar(50) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `id_usuario` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `contenido`
--

INSERT INTO `contenido` (`id_contenido`, `titulo`, `descripcion`, `tipo`, `url`, `fecha`, `id_usuario`) VALUES
(1, 'dfdfd', 'dfdfdf', 'noticia', 'uploads/img_69c2657224f116.86843614.png', '2026-03-16', 1);

-- --------------------------------------------------------

--
-- Table structure for table `curso`
--

CREATE TABLE `curso` (
  `id_curso` int NOT NULL,
  `nombre` varchar(150) DEFAULT NULL,
  `descripcion` text,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  `Requisitos` text,
  `costo` decimal(10,2) DEFAULT '0.00',
  `Imagen_url` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `curso`
--

INSERT INTO `curso` (`id_curso`, `nombre`, `descripcion`, `fecha_inicio`, `fecha_fin`, `id_usuario`, `Requisitos`, `costo`, `Imagen_url`) VALUES
(1, 'fg', 'df', '2026-03-15', '2026-03-29', 1, 'curp', 67.00, 'uploads/img_69fc5105ee0397.24048931.jpg'),
(2, 'l', 'hhh', '2026-05-19', '2026-05-18', 1, 'curp', 0.00, 'uploads/img_69fc541e1f6610.31742342.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `evento`
--

CREATE TABLE `evento` (
  `id_evento` int NOT NULL,
  `nombre` varchar(150) DEFAULT NULL,
  `descripcion` text,
  `fecha` date DEFAULT NULL,
  `lugar` varchar(150) DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  `Imagen_url` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `evento`
--

INSERT INTO `evento` (`id_evento`, `nombre`, `descripcion`, `fecha`, `lugar`, `id_usuario`, `Imagen_url`) VALUES
(1, 'partido', 'fgfgfgf', '2026-03-24', 'deportiva', 1, 'uploads/img_69c26500435877.57556744.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `inscripcion`
--

CREATE TABLE `inscripcion` (
  `id_inscripcion` int NOT NULL,
  `id_usuario` int NOT NULL,
  `id_curso` int NOT NULL,
  `fecha_inscripcion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` enum('pendiente','activo','cancelado') NOT NULL DEFAULT 'pendiente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `inscripcion`
--

INSERT INTO `inscripcion` (`id_inscripcion`, `id_usuario`, `id_curso`, `fecha_inscripcion`, `estado`) VALUES
(1, 2, 1, '2026-03-24 04:22:17', 'cancelado');

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `contraseña` varchar(100) DEFAULT NULL,
  `rol` varchar(50) DEFAULT NULL,
  `no_control` varchar(50) DEFAULT NULL,
  `rfc` varchar(13) DEFAULT NULL,
  `curp` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `correo`, `contraseña`, `rol`, `no_control`, `rfc`, `curp`) VALUES
(1, 'admin', '15@gmail.com', '$2y$10$IIYWSNqfUFhzQRoSwTRNTeGgXmwEN9GOlDwaHg83zTS26JRPRZ1O6', 'admin', NULL, NULL, NULL),
(2, 'usuario', 'sfasda@gmail.com', '$2y$10$r9BtMpeER3JSj0cV0g8eK.Q4M7Abgy/jYzoBKVw4frIyi7EartIZ6', 'usuario', '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contenido`
--
ALTER TABLE `contenido`
  ADD PRIMARY KEY (`id_contenido`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indexes for table `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`id_curso`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indexes for table `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`id_evento`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indexes for table `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD PRIMARY KEY (`id_inscripcion`),
  ADD UNIQUE KEY `uq_usuario_curso` (`id_usuario`,`id_curso`),
  ADD KEY `fk_insc_curso` (`id_curso`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contenido`
--
ALTER TABLE `contenido`
  MODIFY `id_contenido` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `curso`
--
ALTER TABLE `curso`
  MODIFY `id_curso` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `evento`
--
ALTER TABLE `evento`
  MODIFY `id_evento` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `inscripcion`
--
ALTER TABLE `inscripcion`
  MODIFY `id_inscripcion` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contenido`
--
ALTER TABLE `contenido`
  ADD CONSTRAINT `contenido_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Constraints for table `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `curso_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Constraints for table `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `evento_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Constraints for table `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD CONSTRAINT `fk_insc_curso` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_insc_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
