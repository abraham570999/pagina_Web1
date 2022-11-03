-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-07-2021 a las 18:53:39
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `presidencia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reportes`
--

CREATE TABLE `reportes` (
  `id_reporte` bigint(20) NOT NULL,
  `fecha_reporte` date NOT NULL,
  `calle` varchar(50) NOT NULL,
  `entre_calle` varchar(50) NOT NULL,
  `y_calle` varchar(50) NOT NULL,
  `colonia` varchar(50) NOT NULL,
  `tipo_reporte` varchar(50) NOT NULL,
  `id_lum` varchar(20) DEFAULT NULL,
  `estatus` varchar(25) NOT NULL,
  `nota_comentario` varchar(80) DEFAULT NULL,
  `Imagen` varchar(100) DEFAULT NULL,
  `filtro` varchar(20) NOT NULL,
  `departamento` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `reportes`
--

INSERT INTO `reportes` (`id_reporte`, `fecha_reporte`, `calle`, `entre_calle`, `y_calle`, `colonia`, `tipo_reporte`, `id_lum`, `estatus`, `nota_comentario`, `Imagen`, `filtro`, `departamento`) VALUES
(95, '2021-07-12', 'Allende', 'Nuevo Mexico', 'Galeana', 'Centro', 'Baches', NULL, 'Sin Registrar', 'Sin Comentarios', NULL, 'Sin Verificar', 'Atencion Ciduadana'),
(96, '2021-07-12', 'Nuevo Mexico', 'Viesca', 'Jimenez', 'Centro', 'Falta de luminaria', '9', 'Registrado', 'Sin comentarios', 'img/subidas/lum.jpg', 'Verificado', 'Obras Publicas'),
(97, '2021-07-12', 'Morelos', 'Viesca', 'Jimenez', 'Centro', 'Baches', '', 'Sin Registrar', 'Sin comentarios', 'img/subidas/bache.jpg', 'Verificado', 'Obras Publicas y Simas'),
(98, '2021-07-12', 'Ocampo', 'Viesca', 'Jimenez', 'Centro', 'Fugas', '', 'Sin Registrar', 'Sin comentarios', 'img/subidas/calle.jpg', 'Verificado', 'Simas'),
(100, '2021-07-13', 'whbkj', 'vjb', 'vbskj', 'vjbd', 'Carreteras sin pavimentar', '', 'Sin Registrar', 'Sin comentarios', 'img/subidas/calle.jpg', 'Sin Verificar', 'Atencion Ciudadana');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rep_obraspublicas`
--

CREATE TABLE `rep_obraspublicas` (
  `id_reporteval` bigint(20) NOT NULL,
  `id_reporte` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rep_obraspublicas`
--

INSERT INTO `rep_obraspublicas` (`id_reporteval`, `id_reporte`) VALUES
(10, 96),
(12, 97),
(11, 98);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` bigint(20) NOT NULL,
  `nombre_usuario` varchar(50) NOT NULL,
  `correo` varchar(40) NOT NULL,
  `password` varchar(30) NOT NULL,
  `privilegio` varchar(50) NOT NULL,
  `departamento` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre_usuario`, `correo`, `password`, `privilegio`, `departamento`) VALUES
(17, 'Admin Principal', 'admin_princ@gmail.com', 'admin123', 'Admin', 'Atencion Ciudadana'),
(18, 'Admin Secundario', 'admin_sec@gmail.com', 'adminsec123', 'AdminAlterns', 'Atencion Ciudadana'),
(23, 'Prueba', 'prueba@gmail.com', 'prueba123', 'AdminAlterns', 'Simas');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `reportes`
--
ALTER TABLE `reportes`
  ADD PRIMARY KEY (`id_reporte`);

--
-- Indices de la tabla `rep_obraspublicas`
--
ALTER TABLE `rep_obraspublicas`
  ADD PRIMARY KEY (`id_reporteval`),
  ADD KEY `fkrep` (`id_reporte`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `reportes`
--
ALTER TABLE `reportes`
  MODIFY `id_reporte` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de la tabla `rep_obraspublicas`
--
ALTER TABLE `rep_obraspublicas`
  MODIFY `id_reporteval` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `rep_obraspublicas`
--
ALTER TABLE `rep_obraspublicas`
  ADD CONSTRAINT `fkrep` FOREIGN KEY (`id_reporte`) REFERENCES `reportes` (`id_reporte`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
