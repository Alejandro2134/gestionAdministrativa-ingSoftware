-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-05-2019 a las 00:37:43
-- Versión del servidor: 10.1.31-MariaDB
-- Versión de PHP: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gestionbd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administradores`
--

CREATE TABLE `administradores` (
  `idAdmin` int(11) NOT NULL,
  `userAdmin` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `contraseñaAdmin` varchar(45) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `administradores`
--

INSERT INTO `administradores` (`idAdmin`, `userAdmin`, `contraseñaAdmin`) VALUES
(1000, 'DiegoMolina', 'dieguito'),
(1001, 'AlejandroZapata', 'alejandrito'),
(1002, 'DavidViuche', 'davidviuche'),
(1003, 'AndresSanchez', 'andressanchez');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apartamentos`
--

CREATE TABLE `apartamentos` (
  `idApartamentos` int(11) NOT NULL,
  `idTorreA` int(11) DEFAULT NULL,
  `idPropietario` int(11) DEFAULT NULL,
  `tipoApartamento` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `areaApartamento` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `numeroPersonas` int(11) DEFAULT NULL,
  `tipoVivienda` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `numeroParqueadero` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `apartamentos`
--

INSERT INTO `apartamentos` (`idApartamentos`, `idTorreA`, `idPropietario`, `tipoApartamento`, `areaApartamento`, `numeroPersonas`, `tipoVivienda`, `numeroParqueadero`) VALUES
(5000, 3000, 4000, 'Sencillo', '35', 3, 'Familiar', 10),
(5001, 3001, 4001, 'Doble', '50', 4, 'Propia', 9),
(5002, 3002, 4002, 'Sencillo', '35', 3, 'Familiar', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conjuntoscerrados`
--

CREATE TABLE `conjuntoscerrados` (
  `idConjuntosCerrados` int(11) NOT NULL,
  `nombreConjunto` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `direccionConjunto` varchar(70) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefonoConjunto` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `conjuntoscerrados`
--

INSERT INTO `conjuntoscerrados` (`idConjuntosCerrados`, `nombreConjunto`, `direccionConjunto`, `telefonoConjunto`) VALUES
(2000, 'Conjunto Residencial el Rosal', 'calle 54 # 76 - 12', '7152636');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresaaseo`
--

CREATE TABLE `empresaaseo` (
  `idEmpresaAseo` int(11) NOT NULL,
  `idConjuntoA` int(11) DEFAULT NULL,
  `nombreAseo` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `direccionAseo` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefonoAseo` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `celularAseo` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `empresaaseo`
--

INSERT INTO `empresaaseo` (`idEmpresaAseo`, `idConjuntoA`, `nombreAseo`, `direccionAseo`, `telefonoAseo`, `celularAseo`) VALUES
(6000, 2000, 'Aseo Mr Clean', 'Diag. 23 # 56 - 71', '7152639', '3023025849');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresavigilancia`
--

CREATE TABLE `empresavigilancia` (
  `idEmpresaVigilancia` int(11) NOT NULL,
  `idConjuntoV` int(11) DEFAULT NULL,
  `nombreVig` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `direccionVig` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefonoVig` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `celularVig` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `empresavigilancia`
--

INSERT INTO `empresavigilancia` (`idEmpresaVigilancia`, `idConjuntoV`, `nombreVig`, `direccionVig`, `telefonoVig`, `celularVig`) VALUES
(7000, 2000, 'Super Vigilancia SA', 'Kr 23 # 78 - 43', '7141536', '3033256947');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE `eventos` (
  `idEventos` int(11) NOT NULL,
  `idConjuntoE` int(11) DEFAULT NULL,
  `nombreEvento` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `contenidoEvento` text COLLATE utf8_spanish_ci,
  `fechaEvento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `eventos`
--

INSERT INTO `eventos` (`idEventos`, `idConjuntoE`, `nombreEvento`, `contenidoEvento`, `fechaEvento`) VALUES
(13000, 2000, 'Reunion Mensual Mayo', 'Se realizara la reunion mensual del mes de mayo, se pide el favor para que todos los propietarios de los apartamentos del conjunto asistan para que se informen de todas las queajs y reclamos de los demas por favor asistir todos de manera que se pueda iniciar la sesion de manera oportuna y a la hora que debe ser.', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informacionsocial`
--

CREATE TABLE `informacionsocial` (
  `idInformacionSocial` int(11) NOT NULL,
  `idConjuntoI` int(11) DEFAULT NULL,
  `nombreInfo` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `contenidoInfo` text COLLATE utf8_spanish_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `informacionsocial`
--

INSERT INTO `informacionsocial` (`idInformacionSocial`, `idConjuntoI`, `nombreInfo`, `contenidoInfo`) VALUES
(12000, 2000, 'Recoleccion de Basuras', 'Por medio de la presente se informa a toda la comunidad de residentes que desde el dia de mañana se cambiaran los horarios de recoleccion de basura en el sector, los nuevos horarios seran: los dias lunes miercoles y viernes en las horas de la mañana, gracias.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informes`
--

CREATE TABLE `informes` (
  `idInformes` int(11) NOT NULL,
  `idConjuntoI` int(11) DEFAULT NULL,
  `nombreInforme` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ubicacionInforme` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fechaPublicacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `informes`
--

INSERT INTO `informes` (`idInformes`, `idConjuntoI`, `nombreInforme`, `ubicacionInforme`, `fechaPublicacion`) VALUES
(11000, 2000, 'Informe Reunion Mensual Abril', 'Porteria 1 Conjunto', '2019-05-22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticias`
--

CREATE TABLE `noticias` (
  `idNoticias` int(11) NOT NULL,
  `idConjuntoN` int(11) DEFAULT NULL,
  `tituloNoticia` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `contenioNoticia` text COLLATE utf8_spanish_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `noticias`
--

INSERT INTO `noticias` (`idNoticias`, `idConjuntoN`, `tituloNoticia`, `contenioNoticia`) VALUES
(10000, 2000, 'Un policía alemán encontró la forma de combat', 'Oficiales de una ciudad alemana utilizan el trabajo de campo y las visitas en hogares para erradicar en línea y en la vida real los rumores surgidos en redes sociales que propagan el discurso de odio.'),
(10001, 2000, 'Si la inteligencia artificial nos miente, ¿cómo nos daremos cuenta?', 'Dos investigadores de una empresa de seguridad en Baltimore demostraron cómo el desarrollo de la inteligencia artificial, a través de un sistema matemático que puede aprender tareas analizando grandes cantidades de datos, solo dificultará la capacidad de los humanos para detectar qué es real.'),
(10002, 2000, 'Nos urge corregir WhatsApp, ¿por qué no lo hemos hecho aún?', 'La aplicación de mensajería ha sido usada para mandar mensajes en cadena que incentivan la violencia en India o que esparcen rumores electorales falsos en Brasil y México, pero la empresa ha sido lenta al reaccionar. Puede que la culpa sea de los usuarios.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamosalon`
--

CREATE TABLE `prestamosalon` (
  `idPrestamoSalon` int(11) NOT NULL,
  `idSalonP` int(11) DEFAULT NULL,
  `nombreEvento` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fechaEvento` date DEFAULT NULL,
  `nomResponsable` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `apeResponsable` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `torre` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `apartamento` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `prestamosalon`
--

INSERT INTO `prestamosalon` (`idPrestamoSalon`, `idSalonP`, `nombreEvento`, `fechaEvento`, `nomResponsable`, `apeResponsable`, `torre`, `apartamento`) VALUES
(9000, 8000, 'Bautizo Pedrito', '2019-05-30', 'Jose', 'Perez', '2', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propietarios`
--

CREATE TABLE `propietarios` (
  `idPropietarios` int(11) NOT NULL,
  `contraseña` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nombres` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `apellidos` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefono` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `celular` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `correo` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `userName` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `propietarios`
--

INSERT INTO `propietarios` (`idPropietarios`, `contraseña`, `nombres`, `apellidos`, `telefono`, `celular`, `correo`, `userName`) VALUES
(4000, '1234p1', 'Sergio', 'Cuervo', '7142536', '3023192544', 'sergio.cuervo@correo.com', 'SergioCuervo'),
(4001, '1234p2', 'Andres', 'Leon', '7141625', '302391526', 'andres.leon@correo.com', 'AndresLeon'),
(4002, '1234p3', 'Santiago', 'Torres', '7152648', '3033015496', 'santiago.torres@correo.com', 'SantiagoTorres');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `saloncomunal`
--

CREATE TABLE `saloncomunal` (
  `idSalonComunal` int(11) NOT NULL,
  `idConjuntoS` int(11) DEFAULT NULL,
  `nombreSalon` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `pisoSalon` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `alquilerSalon` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `saloncomunal`
--

INSERT INTO `saloncomunal` (`idSalonComunal`, `idConjuntoS`, `nombreSalon`, `pisoSalon`, `alquilerSalon`) VALUES
(8000, 2000, 'Salon Comunal El jardin', '2', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `torres`
--

CREATE TABLE `torres` (
  `idTorres` int(11) NOT NULL,
  `idConjuntoT` int(11) DEFAULT NULL,
  `nombreTorre` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `torres`
--

INSERT INTO `torres` (`idTorres`, `idConjuntoT`, `nombreTorre`) VALUES
(3000, 2000, 'Torre 1'),
(3001, 2000, 'Torre 2'),
(3002, 2000, 'Torre 3');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administradores`
--
ALTER TABLE `administradores`
  ADD PRIMARY KEY (`idAdmin`);

--
-- Indices de la tabla `apartamentos`
--
ALTER TABLE `apartamentos`
  ADD PRIMARY KEY (`idApartamentos`),
  ADD KEY `idTorreA_idx` (`idTorreA`),
  ADD KEY `idPropietarioA_idx` (`idPropietario`);

--
-- Indices de la tabla `conjuntoscerrados`
--
ALTER TABLE `conjuntoscerrados`
  ADD PRIMARY KEY (`idConjuntosCerrados`);

--
-- Indices de la tabla `empresaaseo`
--
ALTER TABLE `empresaaseo`
  ADD PRIMARY KEY (`idEmpresaAseo`),
  ADD KEY `idConjunto_idx` (`idConjuntoA`);

--
-- Indices de la tabla `empresavigilancia`
--
ALTER TABLE `empresavigilancia`
  ADD PRIMARY KEY (`idEmpresaVigilancia`),
  ADD KEY `idConjuntov_idx` (`idConjuntoV`);

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`idEventos`),
  ADD KEY `idConjuntoE_idx` (`idConjuntoE`);

--
-- Indices de la tabla `informacionsocial`
--
ALTER TABLE `informacionsocial`
  ADD PRIMARY KEY (`idInformacionSocial`),
  ADD KEY `idConjuntoI_idx` (`idConjuntoI`);

--
-- Indices de la tabla `informes`
--
ALTER TABLE `informes`
  ADD PRIMARY KEY (`idInformes`),
  ADD KEY `idConjuntoI` (`idConjuntoI`);

--
-- Indices de la tabla `noticias`
--
ALTER TABLE `noticias`
  ADD PRIMARY KEY (`idNoticias`),
  ADD KEY `idConjuntoN_idx` (`idConjuntoN`);

--
-- Indices de la tabla `prestamosalon`
--
ALTER TABLE `prestamosalon`
  ADD PRIMARY KEY (`idPrestamoSalon`),
  ADD KEY `idSalonP_idx` (`idSalonP`);

--
-- Indices de la tabla `propietarios`
--
ALTER TABLE `propietarios`
  ADD PRIMARY KEY (`idPropietarios`);

--
-- Indices de la tabla `saloncomunal`
--
ALTER TABLE `saloncomunal`
  ADD PRIMARY KEY (`idSalonComunal`),
  ADD KEY `idConjuntoS_idx` (`idConjuntoS`);

--
-- Indices de la tabla `torres`
--
ALTER TABLE `torres`
  ADD PRIMARY KEY (`idTorres`),
  ADD KEY `idConjuntoT_idx` (`idConjuntoT`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administradores`
--
ALTER TABLE `administradores`
  MODIFY `idAdmin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1004;

--
-- AUTO_INCREMENT de la tabla `apartamentos`
--
ALTER TABLE `apartamentos`
  MODIFY `idApartamentos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5003;

--
-- AUTO_INCREMENT de la tabla `conjuntoscerrados`
--
ALTER TABLE `conjuntoscerrados`
  MODIFY `idConjuntosCerrados` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2001;

--
-- AUTO_INCREMENT de la tabla `empresaaseo`
--
ALTER TABLE `empresaaseo`
  MODIFY `idEmpresaAseo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6001;

--
-- AUTO_INCREMENT de la tabla `empresavigilancia`
--
ALTER TABLE `empresavigilancia`
  MODIFY `idEmpresaVigilancia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7001;

--
-- AUTO_INCREMENT de la tabla `eventos`
--
ALTER TABLE `eventos`
  MODIFY `idEventos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13001;

--
-- AUTO_INCREMENT de la tabla `informacionsocial`
--
ALTER TABLE `informacionsocial`
  MODIFY `idInformacionSocial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12001;

--
-- AUTO_INCREMENT de la tabla `informes`
--
ALTER TABLE `informes`
  MODIFY `idInformes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11001;

--
-- AUTO_INCREMENT de la tabla `noticias`
--
ALTER TABLE `noticias`
  MODIFY `idNoticias` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10003;

--
-- AUTO_INCREMENT de la tabla `prestamosalon`
--
ALTER TABLE `prestamosalon`
  MODIFY `idPrestamoSalon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9001;

--
-- AUTO_INCREMENT de la tabla `propietarios`
--
ALTER TABLE `propietarios`
  MODIFY `idPropietarios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4003;

--
-- AUTO_INCREMENT de la tabla `saloncomunal`
--
ALTER TABLE `saloncomunal`
  MODIFY `idSalonComunal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8001;

--
-- AUTO_INCREMENT de la tabla `torres`
--
ALTER TABLE `torres`
  MODIFY `idTorres` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3003;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `apartamentos`
--
ALTER TABLE `apartamentos`
  ADD CONSTRAINT `idPropietarioA` FOREIGN KEY (`idPropietario`) REFERENCES `propietarios` (`idPropietarios`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `idTorreA` FOREIGN KEY (`idTorreA`) REFERENCES `torres` (`idTorres`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empresaaseo`
--
ALTER TABLE `empresaaseo`
  ADD CONSTRAINT `idConjunto` FOREIGN KEY (`idConjuntoA`) REFERENCES `conjuntoscerrados` (`idConjuntosCerrados`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empresavigilancia`
--
ALTER TABLE `empresavigilancia`
  ADD CONSTRAINT `idConjuntov` FOREIGN KEY (`idConjuntoV`) REFERENCES `conjuntoscerrados` (`idConjuntosCerrados`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD CONSTRAINT `idConjuntoE` FOREIGN KEY (`idConjuntoE`) REFERENCES `conjuntoscerrados` (`idConjuntosCerrados`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `informacionsocial`
--
ALTER TABLE `informacionsocial`
  ADD CONSTRAINT `idConjuntoI` FOREIGN KEY (`idConjuntoI`) REFERENCES `conjuntoscerrados` (`idConjuntosCerrados`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `informes`
--
ALTER TABLE `informes`
  ADD CONSTRAINT `informes_ibfk_1` FOREIGN KEY (`idConjuntoI`) REFERENCES `conjuntoscerrados` (`idConjuntosCerrados`);

--
-- Filtros para la tabla `noticias`
--
ALTER TABLE `noticias`
  ADD CONSTRAINT `idConjuntoN` FOREIGN KEY (`idConjuntoN`) REFERENCES `conjuntoscerrados` (`idConjuntosCerrados`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `prestamosalon`
--
ALTER TABLE `prestamosalon`
  ADD CONSTRAINT `idSalonP` FOREIGN KEY (`idSalonP`) REFERENCES `saloncomunal` (`idSalonComunal`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `saloncomunal`
--
ALTER TABLE `saloncomunal`
  ADD CONSTRAINT `idConjuntoS` FOREIGN KEY (`idConjuntoS`) REFERENCES `conjuntoscerrados` (`idConjuntosCerrados`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `torres`
--
ALTER TABLE `torres`
  ADD CONSTRAINT `idConjuntoT` FOREIGN KEY (`idConjuntoT`) REFERENCES `conjuntoscerrados` (`idConjuntosCerrados`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
