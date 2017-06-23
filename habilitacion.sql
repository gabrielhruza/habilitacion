-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 15-06-2017 a las 19:41:56
-- Versión del servidor: 5.5.55-0ubuntu0.14.04.1
-- Versión de PHP: 5.5.9-1ubuntu4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `habilitacion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=40 ;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add group', 2, 'add_group'),
(5, 'Can change group', 2, 'change_group'),
(6, 'Can delete group', 2, 'delete_group'),
(7, 'Can add permission', 3, 'add_permission'),
(8, 'Can change permission', 3, 'change_permission'),
(9, 'Can delete permission', 3, 'delete_permission'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add ciclo lectivo', 7, 'add_ciclolectivo'),
(20, 'Can change ciclo lectivo', 7, 'change_ciclolectivo'),
(21, 'Can delete ciclo lectivo', 7, 'delete_ciclolectivo'),
(22, 'Can add preinscripcion4 anios', 8, 'add_preinscripcion4anios'),
(23, 'Can change preinscripcion4 anios', 8, 'change_preinscripcion4anios'),
(24, 'Can delete preinscripcion4 anios', 8, 'delete_preinscripcion4anios'),
(25, 'Can add responsable', 9, 'add_responsable'),
(26, 'Can change responsable', 9, 'change_responsable'),
(27, 'Can delete responsable', 9, 'delete_responsable'),
(28, 'Can add hermano', 10, 'add_hermano'),
(29, 'Can change hermano', 10, 'change_hermano'),
(30, 'Can delete hermano', 10, 'delete_hermano'),
(31, 'Can add postulante', 11, 'add_postulante'),
(32, 'Can change postulante', 11, 'change_postulante'),
(33, 'Can delete postulante', 11, 'delete_postulante'),
(34, 'Can add postulante limpio', 12, 'add_postulantelimpio'),
(35, 'Can change postulante limpio', 12, 'change_postulantelimpio'),
(36, 'Can delete postulante limpio', 12, 'delete_postulantelimpio'),
(37, 'Can add preinscripcion general', 13, 'add_preinscripciongeneral'),
(38, 'Can change preinscripcion general', 13, 'change_preinscripciongeneral'),
(39, 'Can delete preinscripcion general', 13, 'delete_preinscripciongeneral');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$36000$vkLQDFepygmq$t3FrgjemDftUvJxfJ/qF+n4f56KlDsLAS0FgGin7xNA=', '2017-06-15 22:40:16', 1, 'Habilitacion', '', '', 'habilitacion@gmail.com', 1, 1, '2017-06-15 22:10:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'group'),
(3, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'preinscripcion', 'ciclolectivo'),
(10, 'preinscripcion', 'hermano'),
(11, 'preinscripcion', 'postulante'),
(12, 'preinscripcion', 'postulantelimpio'),
(8, 'preinscripcion', 'preinscripcion4anios'),
(13, 'preinscripcion', 'preinscripciongeneral'),
(9, 'preinscripcion', 'responsable'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=38 ;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2017-06-15 21:57:51'),
(2, 'auth', '0001_initial', '2017-06-15 21:57:55'),
(3, 'admin', '0001_initial', '2017-06-15 21:57:55'),
(4, 'admin', '0002_logentry_remove_auto_add', '2017-06-15 21:57:55'),
(5, 'contenttypes', '0002_remove_content_type_name', '2017-06-15 21:57:56'),
(6, 'auth', '0002_alter_permission_name_max_length', '2017-06-15 21:57:56'),
(7, 'auth', '0003_alter_user_email_max_length', '2017-06-15 21:57:56'),
(8, 'auth', '0004_alter_user_username_opts', '2017-06-15 21:57:57'),
(9, 'auth', '0005_alter_user_last_login_null', '2017-06-15 21:57:57'),
(10, 'auth', '0006_require_contenttypes_0002', '2017-06-15 21:57:57'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2017-06-15 21:57:57'),
(12, 'auth', '0008_alter_user_username_max_length', '2017-06-15 21:57:57'),
(13, 'sessions', '0001_initial', '2017-06-15 21:57:58'),
(14, 'preinscripcion', '0001_initial', '2017-06-15 21:59:59'),
(15, 'preinscripcion', '0002_auto_20170530_2151', '2017-06-15 22:00:02'),
(16, 'preinscripcion', '0003_auto_20170530_2152', '2017-06-15 22:00:02'),
(17, 'preinscripcion', '0004_auto_20170609_1315', '2017-06-15 22:00:07'),
(18, 'preinscripcion', '0005_auto_20170609_1702', '2017-06-15 22:00:08'),
(19, 'preinscripcion', '0006_auto_20170610_0221', '2017-06-15 22:00:08'),
(20, 'preinscripcion', '0007_auto_20170610_0236', '2017-06-15 22:00:09'),
(21, 'preinscripcion', '0008_auto_20170610_0238', '2017-06-15 22:00:10'),
(22, 'preinscripcion', '0009_auto_20170610_0239', '2017-06-15 22:00:13'),
(23, 'preinscripcion', '0010_auto_20170610_1414', '2017-06-15 22:00:13'),
(24, 'preinscripcion', '0011_preinscripcion4anios_motivo', '2017-06-15 22:00:13'),
(25, 'preinscripcion', '0012_auto_20170610_1606', '2017-06-15 22:00:14'),
(26, 'preinscripcion', '0013_auto_20170610_1634', '2017-06-15 22:00:15'),
(27, 'preinscripcion', '0014_auto_20170610_1656', '2017-06-15 22:00:16'),
(28, 'preinscripcion', '0015_auto_20170610_1702', '2017-06-15 22:00:17'),
(29, 'preinscripcion', '0016_auto_20170610_1809', '2017-06-15 22:00:18'),
(30, 'preinscripcion', '0017_auto_20170610_2142', '2017-06-15 22:00:19'),
(31, 'preinscripcion', '0018_postulantelimpio', '2017-06-15 22:00:21'),
(32, 'preinscripcion', '0019_auto_20170610_2312', '2017-06-15 22:00:26'),
(33, 'preinscripcion', '0020_auto_20170612_2314', '2017-06-15 22:00:26'),
(34, 'preinscripcion', '0021_auto_20170612_2320', '2017-06-15 22:00:27'),
(35, 'preinscripcion', '0022_auto_20170613_1908', '2017-06-15 22:00:29'),
(36, 'preinscripcion', '0023_auto_20170614_1645', '2017-06-15 22:00:29'),
(37, 'preinscripcion', '0024_auto_20170614_1647', '2017-06-15 22:00:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preinscripcion_ciclolectivo`
--

CREATE TABLE IF NOT EXISTS `preinscripcion_ciclolectivo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_apertura_ciclo` date NOT NULL,
  `fecha_cierre_ciclo` date NOT NULL,
  `fecha_inicio_preinsc_ni` datetime NOT NULL,
  `fecha_fin_preinsc_ni` datetime NOT NULL,
  `vacantes` int(10) unsigned NOT NULL,
  `ultimo_nro_sorteo` int(10) unsigned NOT NULL,
  `fecha_dia_sorteo` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `preinscripcion_ciclolectivo`
--

INSERT INTO `preinscripcion_ciclolectivo` (`id`, `fecha_apertura_ciclo`, `fecha_cierre_ciclo`, `fecha_inicio_preinsc_ni`, `fecha_fin_preinsc_ni`, `vacantes`, `ultimo_nro_sorteo`, `fecha_dia_sorteo`) VALUES
(3, '2018-02-01', '2018-12-28', '2018-08-01 00:00:00', '2018-08-15 00:00:00', 10, 1, '2018-11-08 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preinscripcion_hermano`
--

CREATE TABLE IF NOT EXISTS `preinscripcion_hermano` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `apellido` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `dni` varchar(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `preinscripcion_hermano`
--

INSERT INTO `preinscripcion_hermano` (`id`, `apellido`, `nombre`, `dni`) VALUES
(1, '', '', ''),
(2, 'Yacuzzi', 'Javier', '1234543'),
(3, '', '', ''),
(4, 'Yacuzzi', 'Javier', '32121212'),
(5, 'Yacuzzi', 'Alberto', '90909090');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preinscripcion_postulante`
--

CREATE TABLE IF NOT EXISTS `preinscripcion_postulante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `apellido` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `edad` int(10) unsigned NOT NULL,
  `dni` varchar(8) NOT NULL,
  `genero` varchar(15) NOT NULL,
  `domicilio` varchar(150) NOT NULL,
  `nacionalidad` varchar(150) NOT NULL,
  `madre_id` int(11) DEFAULT NULL,
  `padre_id` int(11) DEFAULT NULL,
  `tutor_id` int(11) DEFAULT NULL,
  `vive_con_id` int(11) DEFAULT NULL,
  `preinscripcion_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `preinscripcion_postu_vive_con_id_9425090a_fk_preinscri` (`vive_con_id`),
  KEY `preinscripcion_postu_madre_id_00826143_fk_preinscri` (`madre_id`),
  KEY `preinscripcion_postu_padre_id_dcc6a93c_fk_preinscri` (`padre_id`),
  KEY `preinscripcion_postu_tutor_id_5da4810b_fk_preinscri` (`tutor_id`),
  KEY `preinscripcion_postu_preinscripcion_id_3926d06c_fk_preinscri` (`preinscripcion_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `preinscripcion_postulante`
--

INSERT INTO `preinscripcion_postulante` (`id`, `apellido`, `nombre`, `fecha_nacimiento`, `edad`, `dni`, `genero`, `domicilio`, `nacionalidad`, `madre_id`, `padre_id`, `tutor_id`, `vive_con_id`, `preinscripcion_id`) VALUES
(1, 'Yacuzzi', 'Jose', '2013-03-13', 4, '23789987', 'MASCULINO', 'French 414', 'Argentino', 4, 3, NULL, NULL, 2),
(2, 'Perez', 'Jose', '1900-03-12', 117, '23789987', 'MASCULINO', 'French 414', 'Argentino', 6, 5, NULL, NULL, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preinscripcion_postulantelimpio`
--

CREATE TABLE IF NOT EXISTS `preinscripcion_postulantelimpio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dni` varchar(8) NOT NULL,
  `postulante_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `preinscripcion_postulantelimpio_dni_2af71a8b_uniq` (`dni`),
  KEY `preinscripcion_postu_postulante_id_d2cb3f0b_fk_preinscri` (`postulante_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `preinscripcion_postulantelimpio`
--

INSERT INTO `preinscripcion_postulantelimpio` (`id`, `dni`, `postulante_id`) VALUES
(12, '23789987', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preinscripcion_postulante_hermanos`
--

CREATE TABLE IF NOT EXISTS `preinscripcion_postulante_hermanos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `postulante_id` int(11) NOT NULL,
  `hermano_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `preinscripcion_postulant_from_postulante_id_to_po_36bec22b_uniq` (`postulante_id`,`hermano_id`),
  KEY `preinscripcion_postu_hermano_id_a312caae_fk_preinscri` (`hermano_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `preinscripcion_postulante_hermanos`
--

INSERT INTO `preinscripcion_postulante_hermanos` (`id`, `postulante_id`, `hermano_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 2, 4),
(5, 2, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preinscripcion_preinscripcion4anios`
--

CREATE TABLE IF NOT EXISTS `preinscripcion_preinscripcion4anios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `nro_de_preinscripto` varchar(10) NOT NULL,
  `nro_de_sorteo` int(10) unsigned NOT NULL,
  `estado` varchar(20) NOT NULL,
  `cicloLectivo_id` int(11) DEFAULT NULL,
  `motivo` longtext NOT NULL,
  `confirmado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nro_de_preinscripto` (`nro_de_preinscripto`),
  KEY `preinscripcion_prein_cicloLectivo_id_3d0da2a0_fk_preinscri` (`cicloLectivo_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `preinscripcion_preinscripcion4anios`
--

INSERT INTO `preinscripcion_preinscripcion4anios` (`id`, `fecha`, `hora`, `nro_de_preinscripto`, `nro_de_sorteo`, `estado`, `cicloLectivo_id`, `motivo`, `confirmado`) VALUES
(1, '2017-06-15', '22:02:56', '18290894', 0, 'PREINSCRIPTO', NULL, 'No contesta', 0),
(2, '2017-06-15', '22:06:36', '26421313', 1, 'CONFIRMADO', 3, 'No contesta', 1),
(3, '2017-06-15', '22:19:07', '39506332', 0, 'PREINSCRIPTO', 3, 'No contesta', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preinscripcion_preinscripciongeneral`
--

CREATE TABLE IF NOT EXISTS `preinscripcion_preinscripciongeneral` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `nro_de_preinscripto` varchar(10) NOT NULL,
  `nivel` varchar(20) NOT NULL,
  `grado` int(10) unsigned NOT NULL,
  `confirmado` tinyint(1) NOT NULL,
  `cubrio_vacante` tinyint(1) NOT NULL,
  `cicloLectivo_id` int(11) NOT NULL,
  `postulante_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nro_de_preinscripto` (`nro_de_preinscripto`),
  KEY `preinscripcion_prein_cicloLectivo_id_5a790dec_fk_preinscri` (`cicloLectivo_id`),
  KEY `preinscripcion_prein_postulante_id_725d7457_fk_preinscri` (`postulante_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preinscripcion_responsable`
--

CREATE TABLE IF NOT EXISTS `preinscripcion_responsable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `apellido` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `dni` varchar(8) NOT NULL,
  `email` varchar(254) NOT NULL,
  `domicilio` varchar(150) NOT NULL,
  `nacionalidad` varchar(150) NOT NULL,
  `telefonoPersonal` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `preinscripcion_responsable`
--

INSERT INTO `preinscripcion_responsable` (`id`, `apellido`, `nombre`, `dni`, `email`, `domicilio`, `nacionalidad`, `telefonoPersonal`) VALUES
(1, 'Alfonso', 'Javier', '23232323', 'carlos@gmail.com', 'French 414', 'Argentino', '55345345345'),
(2, 'Vastik', 'Marta', '12345678', 'marta@gmail.com', 'Saenz Penia 214', 'Argentino', NULL),
(3, 'Alfonso', 'Javier', '23232323', 'carlos@gmail.com', 'French 414', 'Argentino', '55345345345'),
(4, 'Vastik', 'Marta', '12345678', 'marta@gmail.com', 'Saenz Penia 214', 'Argentino', NULL),
(5, 'Pereziene', 'Javier', '12345678', 'alfonso@gmail.com', 'French 414', 'Argentino', '55345345345'),
(6, 'Vastik', 'Marta', '12345678', 'marta@gmail.com', 'Saenz Penia 214', 'Argentino', NULL);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `preinscripcion_postulante`
--
ALTER TABLE `preinscripcion_postulante`
  ADD CONSTRAINT `preinscripcion_postu_madre_id_00826143_fk_preinscri` FOREIGN KEY (`madre_id`) REFERENCES `preinscripcion_responsable` (`id`),
  ADD CONSTRAINT `preinscripcion_postu_padre_id_dcc6a93c_fk_preinscri` FOREIGN KEY (`padre_id`) REFERENCES `preinscripcion_responsable` (`id`),
  ADD CONSTRAINT `preinscripcion_postu_preinscripcion_id_3926d06c_fk_preinscri` FOREIGN KEY (`preinscripcion_id`) REFERENCES `preinscripcion_preinscripcion4anios` (`id`),
  ADD CONSTRAINT `preinscripcion_postu_tutor_id_5da4810b_fk_preinscri` FOREIGN KEY (`tutor_id`) REFERENCES `preinscripcion_responsable` (`id`),
  ADD CONSTRAINT `preinscripcion_postu_vive_con_id_9425090a_fk_preinscri` FOREIGN KEY (`vive_con_id`) REFERENCES `preinscripcion_responsable` (`id`);

--
-- Filtros para la tabla `preinscripcion_postulantelimpio`
--
ALTER TABLE `preinscripcion_postulantelimpio`
  ADD CONSTRAINT `preinscripcion_postu_postulante_id_d2cb3f0b_fk_preinscri` FOREIGN KEY (`postulante_id`) REFERENCES `preinscripcion_postulante` (`id`);

--
-- Filtros para la tabla `preinscripcion_postulante_hermanos`
--
ALTER TABLE `preinscripcion_postulante_hermanos`
  ADD CONSTRAINT `preinscripcion_postu_postulante_id_c14b9092_fk_preinscri` FOREIGN KEY (`postulante_id`) REFERENCES `preinscripcion_postulante` (`id`),
  ADD CONSTRAINT `preinscripcion_postu_hermano_id_a312caae_fk_preinscri` FOREIGN KEY (`hermano_id`) REFERENCES `preinscripcion_hermano` (`id`);

--
-- Filtros para la tabla `preinscripcion_preinscripcion4anios`
--
ALTER TABLE `preinscripcion_preinscripcion4anios`
  ADD CONSTRAINT `preinscripcion_prein_cicloLectivo_id_3d0da2a0_fk_preinscri` FOREIGN KEY (`cicloLectivo_id`) REFERENCES `preinscripcion_ciclolectivo` (`id`);

--
-- Filtros para la tabla `preinscripcion_preinscripciongeneral`
--
ALTER TABLE `preinscripcion_preinscripciongeneral`
  ADD CONSTRAINT `preinscripcion_prein_postulante_id_725d7457_fk_preinscri` FOREIGN KEY (`postulante_id`) REFERENCES `preinscripcion_postulante` (`id`),
  ADD CONSTRAINT `preinscripcion_prein_cicloLectivo_id_5a790dec_fk_preinscri` FOREIGN KEY (`cicloLectivo_id`) REFERENCES `preinscripcion_ciclolectivo` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
