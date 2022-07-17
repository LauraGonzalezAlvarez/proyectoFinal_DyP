-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3307
-- Tiempo de generación: 11-07-2022 a las 17:16:46
-- Versión del servidor: 10.6.5-MariaDB
-- Versión de PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `reservalibros`
--
CREATE SCHEMA IF NOT EXISTS `reservaLibros` DEFAULT CHARACTER SET utf8 ;
USE `reservaLibros` ;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrativo`
--

DROP TABLE IF EXISTS `administrativo`;
CREATE TABLE IF NOT EXISTS `administrativo` (
  `cedula` int(11) NOT NULL,
  `cargo` varchar(45) NOT NULL,
  `area` varchar(45) NOT NULL,
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `administrativo`
--

INSERT INTO `administrativo` (`cedula`, `cargo`, `area`) VALUES
(1, '-', '-'),
(1045678, 'Asesora de planeacion', 'Rectoria'),
(10222512, 'Secretaria', 'Comunicaciones'),
(10987512, 'Gerente', 'Decanaturas'),
(11111678, 'Asesora de planeacion', 'Rectoria'),
(1093337512, 'Secretario', 'Rectoria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

DROP TABLE IF EXISTS `carrera`;
CREATE TABLE IF NOT EXISTS `carrera` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`id`, `nombre`) VALUES
(0, '-'),
(1, 'Administración Pública'),
(2, 'Contaduría Pública'),
(3, 'Ingeniería de Productividad y Calidad'),
(4, 'Comunicación Audiovisual'),
(5, 'Ingeniería Informática');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

DROP TABLE IF EXISTS `estado`;
CREATE TABLE IF NOT EXISTS `estado` (
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`nombre`) VALUES
('Activo'),
('Cancelado'),
('Terminado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

DROP TABLE IF EXISTS `estudiante`;
CREATE TABLE IF NOT EXISTS `estudiante` (
  `cedula` int(11) NOT NULL,
  `semestre` int(11) NOT NULL,
  `Carrera_id` int(11) NOT NULL,
  PRIMARY KEY (`cedula`,`Carrera_id`),
  KEY `fk_Estudiante_Carrera1_idx` (`Carrera_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`cedula`, `semestre`, `Carrera_id`) VALUES
(1, 0, 0),
(1076512, 9, 5),
(3456899, 1, 1),
(10987512, 2, 1),
(109000512, 3, 3),
(109666512, 6, 4),
(112387512, 2, 2),
(1038546244, 10, 5),
(1152476356, 10, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

DROP TABLE IF EXISTS `libro`;
CREATE TABLE IF NOT EXISTS `libro` (
  `ubicacion` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `isbn` int(11) NOT NULL,
  `Sede_idSede` int(11) NOT NULL,
  `autor` varchar(40) NOT NULL,
  PRIMARY KEY (`ubicacion`),
  KEY `fk_Libro_Sede1_idx` (`Sede_idSede`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `libro`
--

INSERT INTO `libro` (`ubicacion`, `nombre`, `isbn`, `Sede_idSede`, `autor`) VALUES
('33.72 P895', 'Gestión en crisis sanitarias y algo más', 775544385, 3, 'Yamile Montoya Torres'),
('336.2 I61', 'Introducción del cigarrillo y del tabaco elaborados en el departamento del chocó', 659000643, 1, 'Gómez Zapata, Yuliana Torres'),
('618.204 J80', 'Acceso físico, social económico e inocuidad de los alimentos en los niños de 2.5 a 5 años.', 166190811, 2, 'Córdoba Rodríquez, Gloria Perez'),
('658.404 H557', 'La formulación de proyectos en ciencias ', 666769087, 1, 'Ignacio Hernández Molina');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

DROP TABLE IF EXISTS `persona`;
CREATE TABLE IF NOT EXISTS `persona` (
  `cedula` int(10) NOT NULL,
  `nombres` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `Administrativo_cedula` int(11) NOT NULL,
  `Estudiante_cedula` int(11) NOT NULL,
  `Sede_idSede` int(11) NOT NULL,
  PRIMARY KEY (`cedula`),
  KEY `fk_Persona_Administrativo1_idx` (`Administrativo_cedula`),
  KEY `fk_Persona_Estudiante1_idx` (`Estudiante_cedula`),
  KEY `fk_Persona_Sede1_idx` (`Sede_idSede`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`cedula`, `nombres`, `apellidos`, `correo`, `telefono`, `Administrativo_cedula`, `Estudiante_cedula`, `Sede_idSede`) VALUES
(1045678, 'Sofia ', 'Estrada Carmona', 'lasofiestrada@gmail.com', '', 1045678, 1, 3),
(1076512, 'Santiago ', 'Romero Gonzalez', 'san1998gonzalez@hotmail.com', '', 1, 1076512, 1),
(3456899, 'Carlos', 'Molina', 'molinacampeon09@yahoo.es', '', 1, 3456899, 2),
(10222512, 'Ana María', 'Sanchez Carmona', 'anitta234_carmona@gmail.com', '', 10222512, 1, 1),
(10987512, 'Edilma Andrea', 'Pereañez Castro', 'castricosinpereañez@hotmail.com', '', 10987512, 1, 2),
(11111678, 'Yenni', 'Londoño Quiroz', 'migatoesunamor@outlook.com', '3458976', 11111678, 1, 3),
(109666512, 'Mateo Alejandro', 'Benancur', 'beta09alejandro@gmail.com', '', 1, 109666512, 1),
(112387512, 'Elizabeth Sofia', 'Molina Monsalve', 'lalisalagarisa988809@hotmail.com', '', 1, 112387512, 1),
(1038546244, 'Laura Daniela ', 'Gonzalez Alvarez', 'lhaogonzaleza@gmail.com', NULL, 1, 1038546244, 1),
(1093337512, 'Juan Jose', 'Castaño Chaverra', 'soycastaño_980@hotmail.com', '2348790', 1093337512, 1, 3),
(1152476356, 'Santiago', 'Giraldo Parra', 'santiago_giraldo82191@elpoli.edu.co', '3197900049', 1, 1152476356, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

DROP TABLE IF EXISTS `reserva`;
CREATE TABLE IF NOT EXISTS `reserva` (
  `isbn` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `renovacion` int(1) NOT NULL,
  `Estado_nombre` varchar(20) NOT NULL,
  `Persona_cedula` int(10) NOT NULL,
  `Libro_ubicacion` varchar(20) NOT NULL,
  PRIMARY KEY (`isbn`,`Persona_cedula`),
  KEY `fk_Reserva_Estado1_idx` (`Estado_nombre`),
  KEY `fk_Reserva_Persona1_idx` (`Persona_cedula`),
  KEY `fk_Reserva_Libro1_idx` (`Libro_ubicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `reserva`
--

INSERT INTO `reserva` (`isbn`, `fecha`, `renovacion`, `Estado_nombre`, `Persona_cedula`, `Libro_ubicacion`) VALUES
(659000643, '2022-07-11', 1, 'Activo', 1152476356, '336.2 I61'),
(775544385, '2022-07-12', 0, 'Activo', 1038546244, '33.72 P895');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sede`
--

DROP TABLE IF EXISTS `sede`;
CREATE TABLE IF NOT EXISTS `sede` (
  `idSede` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idSede`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `sede`
--

INSERT INTO `sede` (`idSede`, `nombre`) VALUES
(1, 'Medellín y Bello'),
(2, 'Rionegro'),
(3, 'Apartado');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `fk_Estudiante_Carrera1` FOREIGN KEY (`Carrera_id`) REFERENCES `carrera` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `libro`
--
ALTER TABLE `libro`
  ADD CONSTRAINT `fk_Libro_Sede1` FOREIGN KEY (`Sede_idSede`) REFERENCES `sede` (`idSede`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `fk_Persona_Administrativo1` FOREIGN KEY (`Administrativo_cedula`) REFERENCES `administrativo` (`cedula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Persona_Estudiante1` FOREIGN KEY (`Estudiante_cedula`) REFERENCES `estudiante` (`cedula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Persona_Sede1` FOREIGN KEY (`Sede_idSede`) REFERENCES `sede` (`idSede`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `fk_Reserva_Estado1` FOREIGN KEY (`Estado_nombre`) REFERENCES `estado` (`nombre`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Reserva_Libro1` FOREIGN KEY (`Libro_ubicacion`) REFERENCES `libro` (`ubicacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Reserva_Persona1` FOREIGN KEY (`Persona_cedula`) REFERENCES `persona` (`cedula`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
