-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-03-2018 a las 13:57:34
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

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`IdCate`, `NombreCate`) VALUES
(1, 'Carne'),
(2, 'Pescado'),
(3, 'Salsas'),
(4, 'Vegetales'),
(5, 'Aperitivos'),
(6, 'Aves'),
(7, 'Arroz'),
(8, 'Legumbres'),
(9, 'Postres'),
(10, 'Sopa'),
(11, 'Pasta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas`
--

CREATE TABLE `recetas` (
  `IdRec` int(5) NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TiempoPrep` int(11) NOT NULL,
  `NumPorc` int(11) NOT NULL,
  `IdCate` int(11) NOT NULL,
  `InstruccionRec` varchar(10000) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `recetas`
--

INSERT INTO `recetas` (`IdRec`, `nombre`, `TiempoPrep`, `NumPorc`, `IdCate`, `InstruccionRec`) VALUES
(1, 'Paella', 37, 12, 7, 'Se pone el arroz a fuego lento con el caldo del pescado cuando se ha evaporado la mayor parte del caldo se le empieza a echar el sofrito de verduras el pollo, el pescado, las gambas...'),
(2, ' Huevos rotos', 14, 10, 5, 'Se rompe el huevo en la sarten y cuando se este poniendo con un color dorado de bate '),
(3, ' Tacos', 30, 15, 1, 'Se calienta la carne picada, se le hecha las especies y aparte se corta lechuga, pepino, queso, tomate y se ponen en respectivos cuencos'),
(4, ' Bocadillo de jamon y queso', 3, 1, 5, 'Se tuesta un poco el pan y despues se le pone el queso y el jamon'),
(5, ' Sopa de cebolla', 60, 15, 10, 'Se pone la cebolla fresca a fuego lento con agua y una pastilla de un sofrito de verduras'),
(6, ' Espagueti a la carbonara', 20, 8, 11, 'Se pone los espaguetis en una olla con agua hirviendo y aparte se hace una salsa bechamel y queso y una vez que este hecho los espaguetis se le hecha la salsa por encima'),
(10, ' pizza', 12, 8, 1, 'se mete en el horno a 220 grados durante 12 min y ya esta'),
(12, ' piza', 12, 6, 4, 'Se mete 12 min en el horno a 220 grados y ya esta');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`IdCate`);

--
-- Indices de la tabla `recetas`
--
ALTER TABLE `recetas`
  ADD PRIMARY KEY (`IdRec`),
  ADD KEY `IdCate` (`IdCate`) USING BTREE;

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `recetas`
--
ALTER TABLE `recetas`
  MODIFY `IdRec` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `recetas`
--
ALTER TABLE `recetas`
  ADD CONSTRAINT `recetas_ibfk_1` FOREIGN KEY (`IdCate`) REFERENCES `categoria` (`IdCate`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
