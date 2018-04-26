-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-04-2018 a las 21:16:33
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
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `TiempoPrep` int(11) NOT NULL,
  `NumPorc` int(11) NOT NULL,
  `IdCate` int(11) NOT NULL,
  `InstruccionRec` varchar(10000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Ingredientes` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `recetas`
--

INSERT INTO `recetas` (`IdRec`, `nombre`, `TiempoPrep`, `NumPorc`, `IdCate`, `InstruccionRec`, `Ingredientes`) VALUES
(3, ' paella', 30, 20, 7, 'Se pone la cebolla fresca a fuego lento con agua y una pastilla de un sofrito de verduras', 'arroz, pescado y carne.'),
(4, ' pizza', 12, 6, 4, 'Se mete 12 min en el horno a 220 grados', 'Queso, tomate, pimiento.'),
(5, ' pizza', 12, 6, 1, 'Se mete 12 min en el horno a 220 grados', 'Queso, tomate, chope'),
(6, ' tortilla de patata', 10, 5, 5, 'Se tritura la patata, el queso y el chorizo la cebolla y se bate todo.', 'Patata, huevo queso y chorizo');

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
  MODIFY `IdRec` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
