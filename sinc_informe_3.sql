-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-11-2023 a las 01:35:29
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cft`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bloque`
--

CREATE TABLE `bloque` (
  `bloque_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `id_carrera` int(10) NOT NULL,
  `nombre_c` char(10) DEFAULT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `modulo_id` int(255) NOT NULL,
  `id_jefe` int(10) NOT NULL,
  `jornada_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carr_mod`
--

CREATE TABLE `carr_mod` (
  `carre_mod_id` int(10) NOT NULL,
  `modulo_id` int(10) NOT NULL,
  `id_carrera` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dia`
--

CREATE TABLE `dia` (
  `dia_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `disp_docente`
--

CREATE TABLE `disp_docente` (
  `disp_doc_id` int(10) NOT NULL,
  `id_docente` int(10) NOT NULL,
  `bloque_id` int(10) NOT NULL,
  `jornada_id` int(10) NOT NULL,
  `estado_id` int(10) NOT NULL,
  `id_usuario` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docente`
--

CREATE TABLE `docente` (
  `id_docente` int(10) NOT NULL,
  `d_nombre` char(10) DEFAULT NULL,
  `email` char(15) DEFAULT NULL,
  `jornada_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `estado_id` int(10) NOT NULL,
  `id_usuario` int(10) NOT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `fecha_hora` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `est_id` int(10) NOT NULL,
  `id_usuario` int(10) DEFAULT NULL,
  `estado_id` int(10) DEFAULT NULL,
  `est_nombre` char(10) DEFAULT NULL,
  `email_est` char(10) DEFAULT NULL,
  `modulo_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `est_mod`
--

CREATE TABLE `est_mod` (
  `id_est_mod` int(10) NOT NULL,
  `est_id` int(10) NOT NULL,
  `modulo_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE `horario` (
  `horario_id` int(10) NOT NULL,
  `jornada_id` int(10) NOT NULL,
  `estado_id` int(10) NOT NULL,
  `horario_year` int(10) DEFAULT NULL,
  `bloque_id` int(10) NOT NULL,
  `sala_id` int(10) NOT NULL,
  `modulo_id` int(10) NOT NULL,
  `dia_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jefe_carrera`
--

CREATE TABLE `jefe_carrera` (
  `id_jefe` int(10) NOT NULL,
  `id_docente` int(10) DEFAULT NULL,
  `estado_id` int(10) DEFAULT NULL,
  `nombre_jefe` char(10) DEFAULT NULL,
  `email` char(10) DEFAULT NULL,
  `sala_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jornada`
--

CREATE TABLE `jornada` (
  `jornada_id` int(10) NOT NULL,
  `jor_inscrip` char(20) DEFAULT NULL,
  `jor_horario` char(10) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `diurna` varchar(255) DEFAULT NULL,
  `vespertina` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo`
--

CREATE TABLE `modulo` (
  `modulo_id` int(10) NOT NULL,
  `mod_nombre` char(1) DEFAULT NULL,
  `tipo_j` char(10) DEFAULT NULL,
  `fecha_hora` int(10) DEFAULT NULL,
  `estado_id` int(10) NOT NULL,
  `id_usuario` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mod_doc`
--

CREATE TABLE `mod_doc` (
  `id_mod_doc` int(10) NOT NULL,
  `modulo_id` int(10) NOT NULL,
  `id_docente` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sala`
--

CREATE TABLE `sala` (
  `sala_id` int(10) NOT NULL,
  `capacidad_sala` int(11) DEFAULT NULL,
  `sala_tipo` char(10) DEFAULT NULL,
  `id_usuario` int(10) NOT NULL,
  `estado_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `semestre`
--

CREATE TABLE `semestre` (
  `id_semestre` int(10) NOT NULL,
  `sem_ano` int(10) DEFAULT NULL,
  `fecha_inicio` int(10) DEFAULT NULL,
  `estado_id` int(10) NOT NULL,
  `id_usuario` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(10) NOT NULL,
  `nombre_usuario` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bloque`
--
ALTER TABLE `bloque`
  ADD PRIMARY KEY (`bloque_id`);

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`id_carrera`),
  ADD KEY `FK_PersonOrder` (`modulo_id`),
  ADD KEY `fk_carrera_jefe` (`id_jefe`),
  ADD KEY `fk_carrera_jef` (`jornada_id`);

--
-- Indices de la tabla `carr_mod`
--
ALTER TABLE `carr_mod`
  ADD PRIMARY KEY (`carre_mod_id`),
  ADD KEY `fk_carrera_modulo` (`modulo_id`),
  ADD KEY `fk_carrera_modul` (`id_carrera`);

--
-- Indices de la tabla `dia`
--
ALTER TABLE `dia`
  ADD PRIMARY KEY (`dia_id`);

--
-- Indices de la tabla `disp_docente`
--
ALTER TABLE `disp_docente`
  ADD PRIMARY KEY (`disp_doc_id`),
  ADD KEY `FK_disp_docente1` (`id_docente`),
  ADD KEY `FK_disp_docente2` (`bloque_id`),
  ADD KEY `FK_disp_docente3` (`jornada_id`),
  ADD KEY `FK_disp_docente4` (`estado_id`),
  ADD KEY `FK_disp_docente5` (`id_usuario`);

--
-- Indices de la tabla `docente`
--
ALTER TABLE `docente`
  ADD PRIMARY KEY (`id_docente`),
  ADD KEY `FK_jornada_docente` (`jornada_id`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`estado_id`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`est_id`),
  ADD KEY `fk_estudiante_usuario` (`id_usuario`),
  ADD KEY `fk_estudiante_estado` (`estado_id`),
  ADD KEY `FK_estmod` (`modulo_id`);

--
-- Indices de la tabla `est_mod`
--
ALTER TABLE `est_mod`
  ADD PRIMARY KEY (`id_est_mod`),
  ADD KEY `FK_est_id` (`est_id`),
  ADD KEY `FK_modulo` (`modulo_id`);

--
-- Indices de la tabla `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`horario_id`),
  ADD KEY `jornada_id` (`jornada_id`),
  ADD KEY `estado_id` (`estado_id`),
  ADD KEY `fk_bloque_horario` (`bloque_id`),
  ADD KEY `FK_sala_horario` (`sala_id`),
  ADD KEY `FK_modulo_horario` (`modulo_id`),
  ADD KEY `FK_dia_horario` (`dia_id`);

--
-- Indices de la tabla `jefe_carrera`
--
ALTER TABLE `jefe_carrera`
  ADD PRIMARY KEY (`id_jefe`),
  ADD KEY `fk_jefe_carrera_docente` (`id_docente`),
  ADD KEY `fk_jefe_carrera_estado` (`estado_id`),
  ADD KEY `FK_sala_id` (`sala_id`);

--
-- Indices de la tabla `jornada`
--
ALTER TABLE `jornada`
  ADD PRIMARY KEY (`jornada_id`);

--
-- Indices de la tabla `modulo`
--
ALTER TABLE `modulo`
  ADD PRIMARY KEY (`modulo_id`),
  ADD KEY `fk_estado_modulo` (`estado_id`),
  ADD KEY `fk_usuario_modulo` (`id_usuario`);

--
-- Indices de la tabla `mod_doc`
--
ALTER TABLE `mod_doc`
  ADD PRIMARY KEY (`id_mod_doc`),
  ADD KEY `FK_id_docente` (`id_docente`),
  ADD KEY `fk_modulo_id` (`modulo_id`);

--
-- Indices de la tabla `sala`
--
ALTER TABLE `sala`
  ADD PRIMARY KEY (`sala_id`),
  ADD KEY `FK_id_usuario` (`id_usuario`),
  ADD KEY `fk_estado_id` (`estado_id`);

--
-- Indices de la tabla `semestre`
--
ALTER TABLE `semestre`
  ADD PRIMARY KEY (`id_semestre`),
  ADD KEY `fk_estado_semestre` (`estado_id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD CONSTRAINT `FK_PersonOrder` FOREIGN KEY (`modulo_id`) REFERENCES `modulo` (`modulo_id`),
  ADD CONSTRAINT `fk_carrera_jef` FOREIGN KEY (`jornada_id`) REFERENCES `jornada` (`jornada_id`),
  ADD CONSTRAINT `fk_carrera_jefe` FOREIGN KEY (`id_jefe`) REFERENCES `jefe_carrera` (`id_jefe`);

--
-- Filtros para la tabla `carr_mod`
--
ALTER TABLE `carr_mod`
  ADD CONSTRAINT `fk_carrera_modul` FOREIGN KEY (`id_carrera`) REFERENCES `carrera` (`id_carrera`),
  ADD CONSTRAINT `fk_carrera_modulo` FOREIGN KEY (`modulo_id`) REFERENCES `modulo` (`modulo_id`);

--
-- Filtros para la tabla `disp_docente`
--
ALTER TABLE `disp_docente`
  ADD CONSTRAINT `FK_disp_docente1` FOREIGN KEY (`id_docente`) REFERENCES `docente` (`id_docente`),
  ADD CONSTRAINT `FK_disp_docente2` FOREIGN KEY (`bloque_id`) REFERENCES `bloque` (`bloque_id`),
  ADD CONSTRAINT `FK_disp_docente3` FOREIGN KEY (`jornada_id`) REFERENCES `jornada` (`jornada_id`),
  ADD CONSTRAINT `FK_disp_docente4` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`estado_id`),
  ADD CONSTRAINT `FK_disp_docente5` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `docente`
--
ALTER TABLE `docente`
  ADD CONSTRAINT `FK_jornada_docente` FOREIGN KEY (`jornada_id`) REFERENCES `jornada` (`jornada_id`);

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `FK_estmod` FOREIGN KEY (`modulo_id`) REFERENCES `modulo` (`modulo_id`),
  ADD CONSTRAINT `fk_estudiante_estado` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`estado_id`),
  ADD CONSTRAINT `fk_estudiante_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `est_mod`
--
ALTER TABLE `est_mod`
  ADD CONSTRAINT `FK_est_id` FOREIGN KEY (`est_id`) REFERENCES `estudiante` (`est_id`),
  ADD CONSTRAINT `FK_modulo` FOREIGN KEY (`modulo_id`) REFERENCES `modulo` (`modulo_id`);

--
-- Filtros para la tabla `horario`
--
ALTER TABLE `horario`
  ADD CONSTRAINT `FK_dia_horario` FOREIGN KEY (`dia_id`) REFERENCES `dia` (`dia_id`),
  ADD CONSTRAINT `FK_modulo_horario` FOREIGN KEY (`modulo_id`) REFERENCES `modulo` (`modulo_id`),
  ADD CONSTRAINT `FK_sala_horario` FOREIGN KEY (`sala_id`) REFERENCES `sala` (`sala_id`),
  ADD CONSTRAINT `fk_bloque_horario` FOREIGN KEY (`bloque_id`) REFERENCES `bloque` (`bloque_id`),
  ADD CONSTRAINT `horario_ibfk_1` FOREIGN KEY (`jornada_id`) REFERENCES `jornada` (`jornada_id`),
  ADD CONSTRAINT `horario_ibfk_2` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`estado_id`);

--
-- Filtros para la tabla `jefe_carrera`
--
ALTER TABLE `jefe_carrera`
  ADD CONSTRAINT `FK_sala_id` FOREIGN KEY (`sala_id`) REFERENCES `sala` (`sala_id`),
  ADD CONSTRAINT `fk_jefe_carrera_docente` FOREIGN KEY (`id_docente`) REFERENCES `docente` (`id_docente`),
  ADD CONSTRAINT `fk_jefe_carrera_estado` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`estado_id`);

--
-- Filtros para la tabla `modulo`
--
ALTER TABLE `modulo`
  ADD CONSTRAINT `fk_estado_modulo` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`estado_id`),
  ADD CONSTRAINT `fk_usuario_modulo` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `mod_doc`
--
ALTER TABLE `mod_doc`
  ADD CONSTRAINT `FK_id_docente` FOREIGN KEY (`id_docente`) REFERENCES `docente` (`id_docente`),
  ADD CONSTRAINT `fk_modulo_id` FOREIGN KEY (`modulo_id`) REFERENCES `modulo` (`modulo_id`);

--
-- Filtros para la tabla `sala`
--
ALTER TABLE `sala`
  ADD CONSTRAINT `FK_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `fk_estado_id` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`estado_id`);

--
-- Filtros para la tabla `semestre`
--
ALTER TABLE `semestre`
  ADD CONSTRAINT `fk_estado_semestre` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`estado_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
