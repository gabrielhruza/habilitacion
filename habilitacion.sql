-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 01-07-2017 a las 15:08:11
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(2, 'gestionciclolectivo'),
(1, 'GestionPreinscripciones');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `auth_group_permissions`
--

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(1, 1, 32),
(2, 1, 33),
(4, 2, 22),
(5, 2, 23),
(3, 2, 24);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

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
(19, 'Can add postulante confirmado', 7, 'add_postulanteconfirmado'),
(20, 'Can change postulante confirmado', 7, 'change_postulanteconfirmado'),
(21, 'Can delete postulante confirmado', 7, 'delete_postulanteconfirmado'),
(22, 'Can add ciclo lectivo', 8, 'add_ciclolectivo'),
(23, 'Can change ciclo lectivo', 8, 'change_ciclolectivo'),
(24, 'Can delete ciclo lectivo', 8, 'delete_ciclolectivo'),
(25, 'Can add postulante', 9, 'add_postulante'),
(26, 'Can change postulante', 9, 'change_postulante'),
(27, 'Can delete postulante', 9, 'delete_postulante'),
(28, 'Can add responsable', 10, 'add_responsable'),
(29, 'Can change responsable', 10, 'change_responsable'),
(30, 'Can delete responsable', 10, 'delete_responsable'),
(31, 'Can add preinscripcion4 anios', 11, 'add_preinscripcion4anios'),
(32, 'Can change preinscripcion4 anios', 11, 'change_preinscripcion4anios'),
(33, 'Can delete preinscripcion4 anios', 11, 'delete_preinscripcion4anios'),
(34, 'Can add preinscripcion general', 12, 'add_preinscripciongeneral'),
(35, 'Can change preinscripcion general', 12, 'change_preinscripciongeneral'),
(36, 'Can delete preinscripcion general', 12, 'delete_preinscripciongeneral');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$36000$cJBUE4zcZsiu$PYBNBaoxA7+hiUm46VEF8VwIJeiIYwr2SkPiI4UCmqk=', '2017-06-30 21:16:47', 1, 'Habilitacion', '', '', 'habilitacion@gmail.com', 1, 1, '2017-06-26 13:29:58'),
(2, 'pbkdf2_sha256$36000$lfpRUDGP3YKt$vOmCy7mA/lB9Oopf900hkvpZluD3LPXQnEsfUkVmd2w=', '2017-07-01 17:19:54', 0, 'DirectoraNI', '', '', '', 0, 1, '2017-06-26 13:30:58'),
(3, 'pbkdf2_sha256$36000$g54hm3OVBcco$tXTKgncRX/xdxxnL/XzKty35zsNsgbThHAO46yY8fVM=', '2017-06-26 17:52:41', 0, 'Director', '', '', '', 0, 1, '2017-06-26 13:31:23');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 2, 1),
(2, 3, 2);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2017-06-26 13:30:58', '2', 'DirectoraNI', 1, '[{"added": {}}]', 4, 1),
(2, '2017-06-26 13:31:23', '3', 'Director', 1, '[{"added": {}}]', 4, 1),
(3, '2017-06-26 13:32:02', '1', 'GestionPreinscripciones', 1, '[{"added": {}}]', 2, 1),
(4, '2017-06-26 13:32:39', '2', 'gestionciclolectivo', 1, '[{"added": {}}]', 2, 1),
(5, '2017-06-26 13:32:53', '2', 'DirectoraNI', 2, '[]', 4, 1),
(6, '2017-06-26 13:33:01', '3', 'Director', 2, '[]', 4, 1),
(7, '2017-06-26 13:34:13', '3', 'Director', 2, '[]', 4, 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'group'),
(3, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(8, 'preinscripcion', 'ciclolectivo'),
(9, 'preinscripcion', 'postulante'),
(7, 'preinscripcion', 'postulanteconfirmado'),
(11, 'preinscripcion', 'preinscripcion4anios'),
(12, 'preinscripcion', 'preinscripciongeneral'),
(10, 'preinscripcion', 'responsable'),
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2017-06-26 13:23:23'),
(2, 'auth', '0001_initial', '2017-06-26 13:23:26'),
(3, 'admin', '0001_initial', '2017-06-26 13:23:27'),
(4, 'admin', '0002_logentry_remove_auto_add', '2017-06-26 13:23:27'),
(5, 'contenttypes', '0002_remove_content_type_name', '2017-06-26 13:23:28'),
(6, 'auth', '0002_alter_permission_name_max_length', '2017-06-26 13:23:28'),
(7, 'auth', '0003_alter_user_email_max_length', '2017-06-26 13:23:28'),
(8, 'auth', '0004_alter_user_username_opts', '2017-06-26 13:23:28'),
(9, 'auth', '0005_alter_user_last_login_null', '2017-06-26 13:23:29'),
(10, 'auth', '0006_require_contenttypes_0002', '2017-06-26 13:23:29'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2017-06-26 13:23:29'),
(12, 'auth', '0008_alter_user_username_max_length', '2017-06-26 13:23:29'),
(13, 'preinscripcion', '0001_initial', '2017-06-26 13:23:33'),
(14, 'preinscripcion', '0002_auto_20170622_2207', '2017-06-26 13:23:33'),
(15, 'preinscripcion', '0003_auto_20170623_2116', '2017-06-26 13:23:34'),
(16, 'preinscripcion', '0004_preinscripcion4anios_fecha_confirmado', '2017-06-26 13:23:34'),
(17, 'sessions', '0001_initial', '2017-06-26 13:23:35');

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

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('07k6bw8n7v4gxbtp6k9izdw2ggyz6vrp', 'MzI3OWYxMGY0YzBjMTE0Yjc1ZTc4NWQ5Y2E1Yzk4YWQ4NDhiNGU0ZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImU0NmQ5NzU3ZmVjY2FhOWEzMjhmYjljYjhkMzg2YzM2MDFhMDFhZDkiLCJfYXV0aF91c2VyX2lkIjoiMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2017-07-14 02:07:20'),
('11vadhsbesa2w9cei4ukxtpa5kl9tn9w', 'YThhNWI2ZWRhZGQ5NWE5MGJkZjJhNTRiMTk1YTMyNDViZjNiZjQ1MDp7Il9hdXRoX3VzZXJfaGFzaCI6ImU0NmQ5NzU3ZmVjY2FhOWEzMjhmYjljYjhkMzg2YzM2MDFhMDFhZDkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=', '2017-07-15 15:18:41'),
('7tgon99g07s0nvpikv4gm6p7ywkgjgmz', 'YThhNWI2ZWRhZGQ5NWE5MGJkZjJhNTRiMTk1YTMyNDViZjNiZjQ1MDp7Il9hdXRoX3VzZXJfaGFzaCI6ImU0NmQ5NzU3ZmVjY2FhOWEzMjhmYjljYjhkMzg2YzM2MDFhMDFhZDkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=', '2017-07-15 03:27:14'),
('94b2oe8rna84t3y06w9es2e3vjbngiob', 'YThhNWI2ZWRhZGQ5NWE5MGJkZjJhNTRiMTk1YTMyNDViZjNiZjQ1MDp7Il9hdXRoX3VzZXJfaGFzaCI6ImU0NmQ5NzU3ZmVjY2FhOWEzMjhmYjljYjhkMzg2YzM2MDFhMDFhZDkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=', '2017-07-15 17:19:55'),
('fdyscvacys3evtq2qvodgrq3b0n9xq2r', 'YThhNWI2ZWRhZGQ5NWE5MGJkZjJhNTRiMTk1YTMyNDViZjNiZjQ1MDp7Il9hdXRoX3VzZXJfaGFzaCI6ImU0NmQ5NzU3ZmVjY2FhOWEzMjhmYjljYjhkMzg2YzM2MDFhMDFhZDkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=', '2017-07-11 00:12:01'),
('qya759jjos0phvg2vlnix28vy6chbuat', 'YThhNWI2ZWRhZGQ5NWE5MGJkZjJhNTRiMTk1YTMyNDViZjNiZjQ1MDp7Il9hdXRoX3VzZXJfaGFzaCI6ImU0NmQ5NzU3ZmVjY2FhOWEzMjhmYjljYjhkMzg2YzM2MDFhMDFhZDkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=', '2017-07-10 18:26:38'),
('viz544ra2i4jp1xtbk8ir6wu5u8sqg4g', 'YThhNWI2ZWRhZGQ5NWE5MGJkZjJhNTRiMTk1YTMyNDViZjNiZjQ1MDp7Il9hdXRoX3VzZXJfaGFzaCI6ImU0NmQ5NzU3ZmVjY2FhOWEzMjhmYjljYjhkMzg2YzM2MDFhMDFhZDkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=', '2017-07-14 21:11:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preinscripcion_ciclolectivo`
--

CREATE TABLE IF NOT EXISTS `preinscripcion_ciclolectivo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_apertura_ciclo` date NOT NULL,
  `fecha_cierre_ciclo` date NOT NULL,
  `fecha_inicio_preinsc_ni` date NOT NULL,
  `fecha_fin_preinsc_ni` date NOT NULL,
  `vacantes` int(10) unsigned NOT NULL,
  `ultimo_nro_sorteo` int(10) unsigned NOT NULL,
  `fecha_dia_sorteo` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `preinscripcion_ciclolectivo`
--

INSERT INTO `preinscripcion_ciclolectivo` (`id`, `fecha_apertura_ciclo`, `fecha_cierre_ciclo`, `fecha_inicio_preinsc_ni`, `fecha_fin_preinsc_ni`, `vacantes`, `ultimo_nro_sorteo`, `fecha_dia_sorteo`) VALUES
(1, '2018-01-12', '2018-12-12', '2018-08-12', '2018-09-12', 35, 8, '2018-10-12');

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
  `madre_id` int(11) DEFAULT NULL,
  `padre_id` int(11) DEFAULT NULL,
  `preinscripcion_id` int(11) DEFAULT NULL,
  `tutor_id` int(11) DEFAULT NULL,
  `vive_con_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `preinscripcion_postu_madre_id_00826143_fk_preinscri` (`madre_id`),
  KEY `preinscripcion_postu_padre_id_dcc6a93c_fk_preinscri` (`padre_id`),
  KEY `preinscripcion_postu_preinscripcion_id_3926d06c_fk_preinscri` (`preinscripcion_id`),
  KEY `preinscripcion_postu_tutor_id_5da4810b_fk_preinscri` (`tutor_id`),
  KEY `preinscripcion_postu_vive_con_id_9425090a_fk_preinscri` (`vive_con_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Volcado de datos para la tabla `preinscripcion_postulante`
--

INSERT INTO `preinscripcion_postulante` (`id`, `apellido`, `nombre`, `fecha_nacimiento`, `edad`, `dni`, `genero`, `domicilio`, `madre_id`, `padre_id`, `preinscripcion_id`, `tutor_id`, `vive_con_id`) VALUES
(1, 'Perez', 'José Alberto', '2014-06-02', 3, '45980098', 'MASCULINO', 'French 414 Resistencia Chaco', 5, 4, 2, NULL, 6),
(2, 'Perez', 'Javier Adrián', '2014-06-02', 3, '45980097', 'MASCULINO', 'French 414 Resistencia Chaco', 5, 4, 3, NULL, 6),
(3, 'Lopez', 'Adrián', '2014-06-01', 3, '41234432', 'MASCULINO', 'López y Planes 1234 Resistencia Chaco', 8, 7, 4, NULL, 9),
(4, 'Rodriguez', 'Mariana Alejandra', '2014-06-02', 3, '46789987', 'FEMENINO', 'Avenida Rivadavia 980', 11, 10, 5, NULL, 12),
(5, 'Rivero', 'Lucía Andrea', '2014-06-02', 3, '45234432', 'FEMENINO', 'Avenida Paraguay 876', 14, 13, 6, NULL, 15),
(6, 'Hruza', 'Gabriel Carlos', '2014-06-13', 3, '45678876', 'MASCULINO', 'Avenida Rivadavia 454545', 17, 16, 7, NULL, 18),
(7, 'Perez', 'Jose luis', '2014-06-04', 3, '45789987', 'MASCULINO', 'French 414', 20, 19, 8, NULL, 21),
(8, 'Perez', 'Jose luis', '2014-06-04', 3, '45789987', 'MASCULINO', 'French 414 Presidencia Roque Saenz Peña Chaco', 23, 22, 10, NULL, 24),
(9, 'Perez', 'Gabriel', '2014-06-04', 3, '45780000', 'MASCULINO', 'French 414 Presidencia Roque Saenz Peña Chaco', 23, 22, 11, NULL, 24),
(10, 'Heinze', 'Gabriel', '2014-06-02', 3, '40000000', 'MASCULINO', 'French 414 Resistencia Chaco', 26, 25, 12, NULL, 27),
(11, 'Heinze', 'Gerardo', '2014-06-02', 3, '40000001', 'MASCULINO', 'French 414 Resistencia Chaco', 26, 25, 13, NULL, 27),
(12, 'Heinze', 'Aejandra', '2014-06-02', 3, '40000002', 'FEMENINO', 'French 414 Resistencia Chaco', 26, 25, 14, NULL, 27),
(13, 'Agunsa', 'Erwin', '2014-06-01', 3, '44000000', 'MASCULINO', 'Avenida Rivadavia 9090', 29, 28, 15, NULL, 30),
(14, 'Agunsa', 'Karina', '2014-06-01', 3, '44000001', 'FEMENINO', 'Avenida Rivadavia 9090', 29, 28, 16, NULL, 30),
(15, 'Gimenez', 'Marisol', '2014-06-04', 3, '44123321', 'FEMENINO', 'Corrientes 343', 32, 31, 17, NULL, 33),
(16, 'Perez', 'Jose luis', '2014-07-01', 3, '45789987', 'MASCULINO', 'French 414', 35, 34, 18, NULL, 36);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preinscripcion_postulanteconfirmado`
--

CREATE TABLE IF NOT EXISTS `preinscripcion_postulanteconfirmado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dni` varchar(8) NOT NULL,
  `postulante_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dni` (`dni`),
  KEY `preinscripcion_postu_postulante_id_bd53f49f_fk_preinscri` (`postulante_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `preinscripcion_postulanteconfirmado`
--

INSERT INTO `preinscripcion_postulanteconfirmado` (`id`, `dni`, `postulante_id`) VALUES
(1, '41234432', 3),
(2, '45678876', 6),
(3, '45980098', 1),
(4, '45980097', 2),
(5, '40000002', 12),
(6, '40000000', 10),
(7, '40000001', 11),
(8, '45789987', 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preinscripcion_postulante_hermanos`
--

CREATE TABLE IF NOT EXISTS `preinscripcion_postulante_hermanos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_postulante_id` int(11) NOT NULL,
  `to_postulante_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `preinscripcion_postulant_from_postulante_id_to_po_36bec22b_uniq` (`from_postulante_id`,`to_postulante_id`),
  KEY `preinscripcion_postu_to_postulante_id_ed788078_fk_preinscri` (`to_postulante_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `preinscripcion_postulante_hermanos`
--

INSERT INTO `preinscripcion_postulante_hermanos` (`id`, `from_postulante_id`, `to_postulante_id`) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 8, 9),
(4, 9, 8),
(5, 10, 11),
(7, 10, 12),
(6, 11, 10),
(8, 12, 10),
(9, 13, 14),
(10, 14, 13);

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
  `motivo` longtext NOT NULL,
  `confirmado` tinyint(1) NOT NULL,
  `cicloLectivo_id` int(11) DEFAULT NULL,
  `fecha_confirmado` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nro_de_preinscripto` (`nro_de_preinscripto`),
  KEY `preinscripcion_prein_cicloLectivo_id_3d0da2a0_fk_preinscri` (`cicloLectivo_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Volcado de datos para la tabla `preinscripcion_preinscripcion4anios`
--

INSERT INTO `preinscripcion_preinscripcion4anios` (`id`, `fecha`, `hora`, `nro_de_preinscripto`, `nro_de_sorteo`, `estado`, `motivo`, `confirmado`, `cicloLectivo_id`, `fecha_confirmado`) VALUES
(1, '2017-06-26', '10:28:46', '39224804', 0, 'PREINSCRIPTO', 'Si el estudio exige esfuerzo, hacer algo, todos los días en momentos que quizá no apetece, ¿Cómo se explica el que muchos estudiantes estudien por voluntad propia, incluso cuando no hay que preparar un examen? Solamente hay una respuesta: porque tienen motivos. Lo más importante para hacer algo que cuesta (estudiar, obedecer, ayudar a los demás, sacrificarse por alguien o por algo...) es tener un buen motivo para realizarlo.', 0, NULL, NULL),
(2, '2017-06-26', '10:35:52', '57487920', 3, 'CONFIRMADO', 'Si el estudio exige esfuerzo, hacer algo, todos los días en momentos que quizá no apetece, ¿Cómo se explica el que muchos estudiantes estudien por voluntad propia, incluso cuando no hay que preparar un examen? Solamente hay una respuesta: porque tienen motivos. Lo más importante para hacer algo que cuesta (estudiar, obedecer, ayudar a los demás, sacrificarse por alguien o por algo...) es tener un buen motivo para realizarlo.', 1, 1, '2017-06-26'),
(3, '2017-06-26', '10:35:52', '26750254', 4, 'CONFIRMADO', 'Si el estudio exige esfuerzo, hacer algo, todos los días en momentos que quizá no apetece, ¿Cómo se explica el que muchos estudiantes estudien por voluntad propia, incluso cuando no hay que preparar un examen? Solamente hay una respuesta: porque tienen motivos. Lo más importante para hacer algo que cuesta (estudiar, obedecer, ayudar a los demás, sacrificarse por alguien o por algo...) es tener un buen motivo para realizarlo.', 1, 1, '2017-06-26'),
(4, '2017-06-26', '10:51:05', '41245734', 1, 'CONFIRMADO', 'Tú sabes que para mover cargas muy pesadas, cargas que requieren una fuerza superior a la que tiene cualquier hombre, se usan unos instrumentos que se llaman palancas. Pues bien, para mover la voluntad, para iniciar su movimiento en cada caso, se necesitan también palancas. ¿Sabes qué nombre técnico tienen estas "palancas" dentro de la psicología? Tienen el nombre de "motivos". Los motivos son esas palancas que mueven la voluntad.', 1, 1, '2017-06-26'),
(5, '2017-06-26', '10:58:22', '62629782', 0, 'PREINSCRIPTO', 'Los motivos despiertan el interés, ayudan a centrar la atención, estimulan el deseo de aprender, conducen al esfuerzo. Aquí termina la función de los motivos. A partir de aquí empieza tu esfuerzo. Si éste llega habrás conseguido tener mucho interés por algunas cosas, pero no aprender esas cosas.\r\n\r\nDebes saber, además, que los motivos no surgen por sí mismos, sino que hay que adquirirlos y cultivarlos. También conviene que sepas que no sirve cualquier motivo: hay motivos buenos y malos, mejores y peores que otros.', 0, 1, NULL),
(6, '2017-06-26', '15:05:00', '94023243', 0, 'PREINSCRIPTO', 'Existe un segundo tipo de motivación que se basa en satisfacer necesidades internas del estudiante. Además, es realizada por el propio estudiante. El estudiante se motiva a sí mismo. Por eso se llama automotivación o motivación intrínseca.\r\n\r\nEs una motivación sin incentivos (sin estímulos que vienen de fuera del estudiante).', 0, 1, NULL),
(7, '2017-06-26', '16:14:23', '74300187', 2, 'CONFIRMADO', 'No contesta', 1, 1, '2017-06-26'),
(8, '2017-06-26', '19:52:47', '84015449', 0, 'PREINSCRIPTO', 'No contesta', 0, 1, NULL),
(9, '2017-06-26', '19:52:47', '96024447', 0, 'PREINSCRIPTO', 'No contesta', 0, 1, NULL),
(10, '2017-06-26', '20:53:11', '73494701', 0, 'PREINSCRIPTO', 'No contesta', 0, 1, NULL),
(11, '2017-06-26', '20:53:11', '81190765', 0, 'PREINSCRIPTO', 'No contesta', 0, 1, NULL),
(12, '2017-06-29', '22:01:56', '19596148', 6, 'CONFIRMADO', 'He adivinado lo que estás pensando en este momento: "Acabo de hacer el gran descubrimiento de mi vida. Es maravilloso que existan palancas para mover esa carga tan pesada que es el estudio de cada día. Los motivos son mi liberación."', 1, 1, '2017-06-29'),
(13, '2017-06-29', '22:01:56', '19297830', 7, 'CONFIRMADO', 'He adivinado lo que estás pensando en este momento: "Acabo de hacer el gran descubrimiento de mi vida. Es maravilloso que existan palancas para mover esa carga tan pesada que es el estudio de cada día. Los motivos son mi liberación."', 1, 1, '2017-06-29'),
(14, '2017-06-29', '22:01:57', '62981676', 5, 'CONFIRMADO', 'He adivinado lo que estás pensando en este momento: "Acabo de hacer el gran descubrimiento de mi vida. Es maravilloso que existan palancas para mover esa carga tan pesada que es el estudio de cada día. Los motivos son mi liberación."', 1, 1, '2017-06-29'),
(15, '2017-06-30', '09:45:38', '61710083', 0, 'PREINSCRIPTO', 'Se inicia indagando a los alumnos: "Si el estudio exige esfuerzo, hacer algo, todos los días en momentos en que quizá no tenemos ganas, ¿cómo se explica el que muchos estudiantes estudien por voluntad propia, incluso cuando no hay que preparar un examen? Solamente hay una respuesta: porque tienen motivos. Lo más importante para hacer algo que cuesta (estudiar, obedecer, ayudar a los demás, sacrificarse por alguien o por algo...) es un buen motivo para realizarlo, por eso hoy quiero que Uds. revisen cuál es el motivo que los lleva a estudiar." Se les muestra el siguiente listado y se los invita a que elijan aquel/los con los que se sientan más identificados.', 0, 1, NULL),
(16, '2017-06-30', '09:45:38', '02981685', 0, 'PREINSCRIPTO', 'Se inicia indagando a los alumnos: "Si el estudio exige esfuerzo, hacer algo, todos los días en momentos en que quizá no tenemos ganas, ¿cómo se explica el que muchos estudiantes estudien por voluntad propia, incluso cuando no hay que preparar un examen? Solamente hay una respuesta: porque tienen motivos. Lo más importante para hacer algo que cuesta (estudiar, obedecer, ayudar a los demás, sacrificarse por alguien o por algo...) es un buen motivo para realizarlo, por eso hoy quiero que Uds. revisen cuál es el motivo que los lleva a estudiar." Se les muestra el siguiente listado y se los invita a que elijan aquel/los con los que se sientan más identificados.', 0, 1, NULL),
(17, '2017-06-30', '18:16:22', '69462147', 0, 'PREINSCRIPTO', 'Todos estudiamos lo mismo o más o menos lo mismo en el colegio (Educación Primaria) pero luego ya se pueden tomar decisiones en uno u otro sentido. Empezando por la Secundaria, llegando a la Universidad o en Oposiciones, Cursos de Formación y certificaciones, en todas ellas hay que tomar decisiones.', 0, 1, NULL),
(18, '2017-07-01', '11:14:13', '99836292', 8, 'CONFIRMADO', 'No contesta', 1, 1, '2017-07-01');

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
  `telefonoPersonal` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

--
-- Volcado de datos para la tabla `preinscripcion_responsable`
--

INSERT INTO `preinscripcion_responsable` (`id`, `apellido`, `nombre`, `dni`, `email`, `domicilio`, `nacionalidad`, `telefonoPersonal`) VALUES
(1, 'Perez', 'Alberto Juan', '12345654', 'alberto@gmail.com', 'French 414 Resistencia Chaco', 'Argentino', '3624280492'),
(2, 'Alicides', 'María', '21098765', 'alcides@gmail.com', 'French 414 Resistencia Chaco', 'Argentino', '3624280492'),
(3, 'Perez', 'Alberto Juan', '12345654', 'alberto@gmail.com', 'French 414 Resistencia Chaco', 'Argentino', '3624280492'),
(4, 'Perez', 'Alberto Juan', '12345654', 'alberto@gmail.com', 'French 414 Resistencia Chaco', 'Argentino', '3624280492'),
(5, 'Alicides', 'María', '21098765', 'alcides@gmail.com', 'French 414 Resistencia Chaco', 'Argentino', '3624280492'),
(6, 'Perez', 'Alberto Juan', '12345654', 'alberto@gmail.com', 'French 414 Resistencia Chaco', 'Argentino', '3624280492'),
(7, 'López', 'Raúl Alejandro', '23456654', 'lopez@gmail.com', 'López y Planes 1234 Resistencia Chaco', 'Argentino', '3644312676'),
(8, 'Gómez', 'Mariana', '24987789', 'mariana@gmail.com', 'López y Planes 1234 Resistencia Chaco', 'Argentino', '3644312676'),
(9, 'López', 'Raúl Alejandro', '23456654', 'lopez@gmail.com', 'López y Planes 1234 Resistencia Chaco', 'Argentino', '3644312676'),
(10, 'Rodríguez', 'Nelson', '12345543', 'rodriguez@gmail.com', 'Avenida Rivadavia 980', 'Argentino', '23232323232'),
(11, 'Cuevas', 'Carolina Mercedes', '23123321', 'cuevas@gmail.com', 'Avenida Rivadavia 980', 'Argentino', '23232323232'),
(12, 'Cuevas', 'Carolina Mercedes', '23123321', 'cuevas@gmail.com', 'Avenida Rivadavia 980', 'Argentino', '23232323232'),
(13, 'Rivero', 'César Andres', '23098765', 'rivero@gmail.com', 'Avenida Paraguay 876', 'Argentino', '3624280492'),
(14, 'Fabiani', 'Lorena Belén', '24321123', 'fabiani@gmail.com', 'Avenida Paraguay 876', 'Argentino', '3624280492'),
(15, 'Rivero', 'César Andres', '23098765', 'rivero@gmail.com', 'Avenida Paraguay 876', 'Argentino', '3624280492'),
(16, 'Hruza', 'Jose', '23232332', 'hruza@gmail.com', 'Avenida rivadavia 232332', 'Argentino', '2398998998989'),
(17, 'Alicdeos', 'Maria', '23232323', 'hruza@gmail.com', 'Avenida rivadavia 232332', 'Argentino', '8989898989898'),
(18, 'Alicdeos', 'Maria', '23232323', 'hruza@gmail.com', 'Avenida rivadavia 232332', 'Argentino', '898989898989'),
(19, 'Pereziene', 'ddfsdf', '23232323', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'sdfsdfsdff', '55345345345'),
(20, 'Vastik', 'Marta', '16636212', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'Argentino', '55345345345'),
(21, 'Vastik', 'Marta', '16636212', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'Argentino', '55345345345'),
(22, 'Pereziene', 'Javier', '23232323', 'carlos@gmail.com', 'French 414', 'Argentino', '55345345345'),
(23, 'Vastik', 'Marta Elvira', '16636216', 'carlos@gmail.com', 'French 414', 'Argentino', '55345345345'),
(24, 'Vastik', 'Marta Elvira', '16636216', 'carlos@gmail.com', 'French 414', 'Argentino', '55345345345'),
(25, 'Heinze', 'Alberto', '23456654', 'heinze@gmail.com', 'French 414 Resistencia Chaco', 'Argentino', '081078666222'),
(26, 'López', 'María', '12988282', 'lopez@gmail.com', 'French 414 Resistencia Chaco', 'Argentino', '081078666222'),
(27, 'López', 'María', '12988282', 'lopez@gmail.com', 'French 414 Resistencia Chaco', 'Argentino', '081078666222'),
(28, 'Agunsa', 'Alberto', '23123321', 'agunsa@gmail.com', 'Avenida Rivadavia 9090', 'Argentino', '3624280492'),
(29, 'Koontz', 'Daniela', '23456652', 'agunsa@gmail.com', 'Avenida Rivadavia 9090', 'Argentino', '3624280492'),
(30, 'Agunsa', 'Alberto', '23123321', 'agunsa@gmail.com', 'Avenida Rivadavia 9090', 'Argentino', '3624280492'),
(31, 'Gimenez', 'Rolando', '23987635', 'gimenez@gmail.com', 'Corrientes 345', 'Argentino', '3624280492'),
(32, 'Van Damme', 'Lucía', '23900876', 'gimenez@gmail.com', 'Corrientes 345', 'Argentino', '3624280492'),
(33, 'Gimenez', 'Rolando', '23987635', 'gimenez@gmail.com', 'Corrientes 345', 'Argentino', '3624280492'),
(34, 'Pereziene', 'Javier', '15098890', 'carlos@gmail.com', 'French 414', 'Argentino', '23232323232'),
(35, 'Vastik', 'Marta', '16636212', 'carlos@gmail.com', 'French 414', 'Argentino', '23232323232'),
(36, 'Pereziene', 'Javier', '15098890', 'carlos@gmail.com', 'French 414', 'Argentino', '23232323232');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

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
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

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
-- Filtros para la tabla `preinscripcion_postulanteconfirmado`
--
ALTER TABLE `preinscripcion_postulanteconfirmado`
  ADD CONSTRAINT `preinscripcion_postu_postulante_id_bd53f49f_fk_preinscri` FOREIGN KEY (`postulante_id`) REFERENCES `preinscripcion_postulante` (`id`);

--
-- Filtros para la tabla `preinscripcion_postulante_hermanos`
--
ALTER TABLE `preinscripcion_postulante_hermanos`
  ADD CONSTRAINT `preinscripcion_postu_from_postulante_id_fbe3c8f8_fk_preinscri` FOREIGN KEY (`from_postulante_id`) REFERENCES `preinscripcion_postulante` (`id`),
  ADD CONSTRAINT `preinscripcion_postu_to_postulante_id_ed788078_fk_preinscri` FOREIGN KEY (`to_postulante_id`) REFERENCES `preinscripcion_postulante` (`id`);

--
-- Filtros para la tabla `preinscripcion_preinscripcion4anios`
--
ALTER TABLE `preinscripcion_preinscripcion4anios`
  ADD CONSTRAINT `preinscripcion_prein_cicloLectivo_id_3d0da2a0_fk_preinscri` FOREIGN KEY (`cicloLectivo_id`) REFERENCES `preinscripcion_ciclolectivo` (`id`);

--
-- Filtros para la tabla `preinscripcion_preinscripciongeneral`
--
ALTER TABLE `preinscripcion_preinscripciongeneral`
  ADD CONSTRAINT `preinscripcion_prein_cicloLectivo_id_5a790dec_fk_preinscri` FOREIGN KEY (`cicloLectivo_id`) REFERENCES `preinscripcion_ciclolectivo` (`id`),
  ADD CONSTRAINT `preinscripcion_prein_postulante_id_725d7457_fk_preinscri` FOREIGN KEY (`postulante_id`) REFERENCES `preinscripcion_postulante` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
