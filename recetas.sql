-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-03-2018 a las 11:01:55
-- Versión del servidor: 10.1.28-MariaDB
-- Versión de PHP: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `recetas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `IdCate` int(11) NOT NULL,
  `NombreCate` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instruccionreceta`
--

CREATE TABLE `instruccionreceta` (
  `IdInstrucRec` int(11) NOT NULL,
  `FormahacerRec` varchar(10000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `IdCate` int(11) NOT NULL,
  `IdRec` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas`
--

CREATE TABLE `recetas` (
  `IdRec` int(5) NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `DescripRec` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TiempoPrep` int(11) NOT NULL,
  `NumPorc` int(11) NOT NULL,
  `IdCate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`IdCate`);

--
-- Indices de la tabla `instruccionreceta`
--
ALTER TABLE `instruccionreceta`
  ADD PRIMARY KEY (`IdInstrucRec`),
  ADD KEY `IdCate` (`IdCate`),
  ADD KEY `IdRec` (`IdRec`);

--
-- Indices de la tabla `recetas`
--
ALTER TABLE `recetas`
  ADD PRIMARY KEY (`IdRec`),
  ADD UNIQUE KEY `IdCate` (`IdCate`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `instruccionreceta`
--
ALTER TABLE `instruccionreceta`
  ADD CONSTRAINT `instruccionreceta_ibfk_1` FOREIGN KEY (`IdCate`) REFERENCES `categoria` (`IdCate`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `instruccionreceta_ibfk_2` FOREIGN KEY (`IdRec`) REFERENCES `recetas` (`IdRec`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `recetas`
--
ALTER TABLE `recetas`
  ADD CONSTRAINT `recetas_ibfk_1` FOREIGN KEY (`IdCate`) REFERENCES `categoria` (`IdCate`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
