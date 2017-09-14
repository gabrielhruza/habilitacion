-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 14-09-2017 a las 00:21:38
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(2, 'gestionciclolectivo'),
(1, 'GestionPreinscripciones'),
(3, 'gestion_pg');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `auth_group_permissions`
--

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(1, 1, 32),
(2, 1, 33),
(4, 2, 22),
(5, 2, 23),
(3, 2, 24),
(6, 3, 34),
(7, 3, 35),
(8, 3, 36);

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
(36, 'Can delete preinscripcion general', 12, 'delete_preinscripciongeneral'),
(37, 'Can add profile', 13, 'add_profile'),
(38, 'Can change profile', 13, 'change_profile'),
(39, 'Can delete profile', 13, 'delete_profile');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$36000$cJBUE4zcZsiu$PYBNBaoxA7+hiUm46VEF8VwIJeiIYwr2SkPiI4UCmqk=', '2017-09-12 22:51:27', 1, 'Habilitacion', '', '', 'habilitacion@gmail.com', 1, 1, '2017-06-26 13:29:58'),
(2, 'pbkdf2_sha256$36000$lfpRUDGP3YKt$vOmCy7mA/lB9Oopf900hkvpZluD3LPXQnEsfUkVmd2w=', '2017-09-11 16:13:40', 0, 'DirectoraNI', '', '', '', 0, 1, '2017-06-26 13:30:58'),
(3, 'pbkdf2_sha256$36000$g54hm3OVBcco$tXTKgncRX/xdxxnL/XzKty35zsNsgbThHAO46yY8fVM=', '2017-09-11 23:16:49', 0, 'Director', '', '', '', 0, 1, '2017-06-26 13:31:23'),
(4, 'pbkdf2_sha256$36000$oKybHiHbYTDu$MqUSeSsJ9FCSN0DZuQIEggmPtawOc26VM5bClZx9sAg=', '2017-09-14 03:05:44', 0, 'DirectoraGNI', '', '', '', 0, 1, '2017-09-09 00:39:08'),
(6, 'pbkdf2_sha256$36000$w031KsMzZhDE$VUuHONBdYiVIMEBeQIYJTsp66uiU5Hwu40VgIJfRdyk=', '2017-09-14 02:43:08', 0, 'DirectoraGNP', '', '', '', 0, 1, '2017-09-12 23:08:25'),
(7, 'pbkdf2_sha256$36000$ULvU6sfKnlzM$VaWaRg3CDbwuf9aj2EHAMJT3rUd9Xypqt5xxfErQTis=', '2017-09-14 02:44:43', 0, 'DirectoraGNS', '', '', '', 0, 1, '2017-09-12 23:09:37');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 2, 1),
(2, 3, 2),
(3, 4, 3),
(4, 6, 3),
(5, 7, 3);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

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
(7, '2017-06-26 13:34:13', '3', 'Director', 2, '[]', 4, 1),
(8, '2017-09-09 00:38:27', '3', 'gestion_pg', 1, '[{"added": {}}]', 2, 1),
(9, '2017-09-09 00:39:08', '4', 'DirectoraG', 1, '[{"added": {}}]', 4, 1),
(10, '2017-09-09 00:39:26', '4', 'DirectoraG', 2, '[]', 4, 1),
(11, '2017-09-12 22:52:13', '1', 'Profile object', 1, '[{"added": {}}]', 13, 1),
(12, '2017-09-12 23:07:19', '4', 'DirectoraGNI', 2, '[{"changed": {"fields": ["username"]}}]', 4, 1),
(13, '2017-09-12 23:08:00', '5', 'DirectoraNP', 1, '[{"added": {}}]', 4, 1),
(14, '2017-09-12 23:08:25', '6', 'DirectoraGNP', 1, '[{"added": {}}]', 4, 1),
(15, '2017-09-12 23:08:50', '5', 'DirectoraNP', 3, '', 4, 1),
(16, '2017-09-12 23:09:04', '6', 'DirectoraGNP', 2, '[]', 4, 1),
(17, '2017-09-12 23:09:37', '7', 'DirectoraGNS', 1, '[{"added": {}}]', 4, 1),
(18, '2017-09-12 23:10:06', '7', 'DirectoraGNS', 2, '[]', 4, 1),
(19, '2017-09-12 23:10:42', '2', 'Profile object', 1, '[{"added": {}}]', 13, 1),
(20, '2017-09-12 23:10:54', '3', 'Profile object', 1, '[{"added": {}}]', 13, 1);

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
(13, 'pg', 'profile'),
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

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
(17, 'sessions', '0001_initial', '2017-06-26 13:23:35'),
(18, 'preinscripcion', '0005_auto_20170908_1545', '2017-09-08 18:55:56'),
(19, 'preinscripcion', '0006_auto_20170908_1548', '2017-09-08 18:55:59'),
(20, 'preinscripcion', '0007_preinscripciongeneral_motivo', '2017-09-08 19:03:09'),
(21, 'preinscripcion', '0008_auto_20170908_1608', '2017-09-08 19:08:25'),
(22, 'preinscripcion', '0009_auto_20170910_2003', '2017-09-10 23:03:32'),
(23, 'preinscripcion', '0010_preinscripciongeneral_institucionanterior', '2017-09-11 22:54:00'),
(24, 'preinscripcion', '0011_auto_20170911_2024', '2017-09-11 23:24:26'),
(25, 'preinscripcion', '0012_auto_20170911_2027', '2017-09-11 23:27:17'),
(26, 'pg', '0001_initial', '2017-09-12 22:46:39');

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
('egakahcq2zu5y61gxmoz64tc5gnwoera', 'ZjdlMWM0MTNjNDc2Mjk3NjRlMDkyNjkzY2UwMjQ2YjI2NTI5MjdmNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImUwNzUyZWY5Mzc4ZjliNTAxMTFlN2M4M2QwN2NiZWM5MTc1ODI0YzkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=', '2017-09-28 03:05:44'),
('fdyscvacys3evtq2qvodgrq3b0n9xq2r', 'YThhNWI2ZWRhZGQ5NWE5MGJkZjJhNTRiMTk1YTMyNDViZjNiZjQ1MDp7Il9hdXRoX3VzZXJfaGFzaCI6ImU0NmQ5NzU3ZmVjY2FhOWEzMjhmYjljYjhkMzg2YzM2MDFhMDFhZDkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=', '2017-07-11 00:12:01'),
('hphmkfax0n5nywprn7gby71wxqajc0jv', 'N2JlMDRkZTgzNmU5NDk5OWQwYWI2YzcyZTkxYWUzOTUyOGI5ZTc0Yjp7ImRhdGFfbWFkcmUiOnsidGVsZWZvbm9QZXJzb25hbCI6IjU1MzQ1MzQ1MzQ1IiwiYXBlbGxpZG8iOiJWYXN0aWsiLCJkbmkiOiIxNjYzNjIxMiIsIm5vbWJyZSI6Ik1hcnRhIiwibmFjaW9uYWxpZGFkIjoiQXJnZW50aW5vIiwiZW1haWwiOiJjYWZzZGZzZGZAc2QuY29tIiwiZG9taWNpbGlvIjoic2Rmc2ZkZnZ4Y3ZjdiJ9LCJkYXRhX3ZpdmVjb24iOnsidGVsZWZvbm9QZXJzb25hbCI6IjU1MzQ1MzQ1MzQ1IiwiYXBlbGxpZG8iOiJQZXJlemllbmUiLCJkbmkiOiIzNDM0MzQzNCIsIm5vbWJyZSI6ImRkZnNkZiIsIm5hY2lvbmFsaWRhZCI6InNkZnNkZnNkZmYiLCJlbWFpbCI6ImNhZnNkZnNkZkBzZC5jb20iLCJkb21pY2lsaW8iOiJzZGZzZmRmdnhjdmN2In0sIm5yb3ByZWluc2NyaXB0byI6IjkxOTU4NTM2IiwiZGF0YV9wYWRyZSI6eyJ0ZWxlZm9ub1BlcnNvbmFsIjoiNTUzNDUzNDUzNDUiLCJhcGVsbGlkbyI6IlBlcmV6aWVuZSIsImRuaSI6IjM0MzQzNDM0Iiwibm9tYnJlIjoiZGRmc2RmIiwibmFjaW9uYWxpZGFkIjoic2Rmc2Rmc2RmZiIsImVtYWlsIjoiY2Fmc2Rmc2RmQHNkLmNvbSIsImRvbWljaWxpbyI6InNkZnNmZGZ2eGN2Y3YifX0=', '2017-09-25 19:46:33'),
('o830s8dpuxd8fitmp7fcqvf5tyupo1qk', 'MTIyYzU0NmYwYzE0NmFkMDIzZGZiYzNjYTYxYjE1ZjJkMDQ5MTgxNDp7ImRhdGFfbWFkcmUiOnsidGVsZWZvbm9QZXJzb25hbCI6IjU1MzQ1MzQ1MzQ1IiwiYXBlbGxpZG8iOiJWYXN0aWsiLCJkbmkiOiIxNjYzNjIxMiIsIm5vbWJyZSI6Ik1hcnRhIiwibmFjaW9uYWxpZGFkIjoiQXJnZW50aW5vIiwiZW1haWwiOiJjYWZzZGZzZGZAc2QuY29tIiwiZG9taWNpbGlvIjoic2Rmc2ZkZnZ4Y3ZjdiJ9LCJkYXRhX3ZpdmVjb24iOnsidGVsZWZvbm9QZXJzb25hbCI6IjU1MzQ1MzQ1MzQ1IiwiYXBlbGxpZG8iOiJQZXJlemllbmUiLCJkbmkiOiIyMzIzMjMyMyIsIm5vbWJyZSI6ImRkZnNkZiIsIm5hY2lvbmFsaWRhZCI6InNkZnNkZnNkZmYiLCJlbWFpbCI6ImNhZnNkZnNkZkBzZC5jb20iLCJkb21pY2lsaW8iOiJzZGZzZmRmdnhjdmN2In0sIm5yb3ByZWluc2NyaXB0byI6IjUwMTk3MTgzIiwiZGF0YV9wYWRyZSI6eyJ0ZWxlZm9ub1BlcnNvbmFsIjoiNTUzNDUzNDUzNDUiLCJhcGVsbGlkbyI6IlBlcmV6aWVuZSIsImRuaSI6IjIzMjMyMzIzIiwibm9tYnJlIjoiZGRmc2RmIiwibmFjaW9uYWxpZGFkIjoic2Rmc2Rmc2RmZiIsImVtYWlsIjoiY2Fmc2Rmc2RmQHNkLmNvbSIsImRvbWljaWxpbyI6InNkZnNmZGZ2eGN2Y3YifX0=', '2017-09-24 23:40:43'),
('otab6rmx19duuuvv852e1eknxtkac877', 'ZjdlMWM0MTNjNDc2Mjk3NjRlMDkyNjkzY2UwMjQ2YjI2NTI5MjdmNDp7Il9hdXRoX3VzZXJfaGFzaCI6ImUwNzUyZWY5Mzc4ZjliNTAxMTFlN2M4M2QwN2NiZWM5MTc1ODI0YzkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=', '2017-09-24 23:31:41'),
('qv7tejf644woct19zag0v2tizf85tu8t', 'NjQ1OTI5MDdmYzMxOGU5MTAxNGIyNDJkNjEyMWY0ZDQzZDQyYjZmOTp7Il9hdXRoX3VzZXJfaGFzaCI6ImJlODBiNzFiYTkzYzA5MWM3YWYxZTU3YzE3ZTY5MzVjNDhhYjhmNTAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2017-09-26 22:51:28'),
('qya759jjos0phvg2vlnix28vy6chbuat', 'YThhNWI2ZWRhZGQ5NWE5MGJkZjJhNTRiMTk1YTMyNDViZjNiZjQ1MDp7Il9hdXRoX3VzZXJfaGFzaCI6ImU0NmQ5NzU3ZmVjY2FhOWEzMjhmYjljYjhkMzg2YzM2MDFhMDFhZDkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=', '2017-07-10 18:26:38'),
('viz544ra2i4jp1xtbk8ir6wu5u8sqg4g', 'YThhNWI2ZWRhZGQ5NWE5MGJkZjJhNTRiMTk1YTMyNDViZjNiZjQ1MDp7Il9hdXRoX3VzZXJfaGFzaCI6ImU0NmQ5NzU3ZmVjY2FhOWEzMjhmYjljYjhkMzg2YzM2MDFhMDFhZDkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=', '2017-07-14 21:11:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pg_profile`
--

CREATE TABLE IF NOT EXISTS `pg_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nivel` varchar(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `pg_profile`
--

INSERT INTO `pg_profile` (`id`, `nivel`, `user_id`) VALUES
(1, 'INICIAL', 4),
(2, 'PRIMARIO', 6),
(3, 'SECUNDARIO', 7);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `preinscripcion_ciclolectivo`
--

INSERT INTO `preinscripcion_ciclolectivo` (`id`, `fecha_apertura_ciclo`, `fecha_cierre_ciclo`, `fecha_inicio_preinsc_ni`, `fecha_fin_preinsc_ni`, `vacantes`, `ultimo_nro_sorteo`, `fecha_dia_sorteo`) VALUES
(1, '2018-01-12', '2018-12-12', '2018-08-12', '2018-09-12', 35, 9, '2018-10-12'),
(2, '2017-01-12', '2017-12-12', '2017-08-12', '2017-09-12', 34, 0, '2017-10-12');

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
  `pg_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `preinscripcion_postu_madre_id_00826143_fk_preinscri` (`madre_id`),
  KEY `preinscripcion_postu_padre_id_dcc6a93c_fk_preinscri` (`padre_id`),
  KEY `preinscripcion_postu_preinscripcion_id_3926d06c_fk_preinscri` (`preinscripcion_id`),
  KEY `preinscripcion_postu_tutor_id_5da4810b_fk_preinscri` (`tutor_id`),
  KEY `preinscripcion_postu_vive_con_id_9425090a_fk_preinscri` (`vive_con_id`),
  KEY `preinscripcion_postu_pg_id_6c4950e6_fk_preinscri` (`pg_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=115 ;

--
-- Volcado de datos para la tabla `preinscripcion_postulante`
--

INSERT INTO `preinscripcion_postulante` (`id`, `apellido`, `nombre`, `fecha_nacimiento`, `edad`, `dni`, `genero`, `domicilio`, `madre_id`, `padre_id`, `preinscripcion_id`, `tutor_id`, `vive_con_id`, `pg_id`) VALUES
(98, 'Perez', 'Jose', '2014-09-09', 3, '45789987', 'MASCULINO', 'French 414', 290, 289, NULL, NULL, 291, 81),
(99, 'Perez', 'Jose', '2017-06-01', 0, '45789987', 'MASCULINO', 'French 414', 293, 292, NULL, NULL, 294, 82),
(100, 'Perez', 'Jose', '2014-09-03', 3, '45454545', 'MASCULINO', 'French 414', 296, 295, NULL, NULL, 297, 83),
(101, 'Perez', 'Jose', '2014-09-03', 3, '45555554', 'MASCULINO', 'French 414', 299, 298, NULL, NULL, 300, 84),
(102, 'Perez', 'Jose luis', '2014-09-03', 3, '45789987', 'MASCULINO', 'French 414 Presidencia Roque Saenz Peña Chaco', 302, 301, NULL, NULL, 303, 85),
(103, 'Perez', 'Jose', '2014-09-03', 3, '45789987', 'MASCULINO', 'French 414', 305, 304, NULL, NULL, 306, 86),
(104, 'Pereziene', 'Jose', '2014-09-01', 3, '45789987', 'MASCULINO', 'French 414', 308, 307, NULL, NULL, 309, 87),
(105, 'Pereziene', 'Jose', '2014-09-01', 3, '45789987', 'MASCULINO', 'French 414', 311, 310, NULL, NULL, 312, 88),
(106, 'Pereziene', 'Jose', '2014-09-02', 3, '45789987', 'MASCULINO', 'French 414', 314, 313, NULL, NULL, 315, 89),
(107, 'Yacuzzi', 'Jose', '1900-03-12', 117, '45789987', 'MASCULINO', 'French 414', 317, 316, NULL, NULL, 318, 90),
(108, 'Yacuzzi', 'Jose', '1900-03-12', 117, '45789987', 'MASCULINO', 'French 414', 320, 319, NULL, NULL, 321, 91),
(109, 'Yacuzzi', 'Jose', '1900-03-12', 117, '45789987', 'MASCULINO', 'French 414', 323, 322, NULL, NULL, 324, 92),
(110, 'Hruza', 'Gabriel Carlso', '2014-09-01', 3, '45789987', 'MASCULINO', 'French 414', 326, 325, NULL, NULL, 327, 93),
(111, 'Yacuzzi', 'Jose', '2017-06-01', 0, '45789987', 'MASCULINO', 'French 414', 329, 328, NULL, NULL, 330, 94),
(112, 'Hruza', 'Gabriel CAarlos', '2017-06-01', 0, '45789987', 'MASCULINO', 'French 414', 344, 343, NULL, NULL, 345, 95),
(113, 'Perez', 'Jose', '2014-09-03', 3, '45789987', 'MASCULINO', 'French 414', 347, 346, NULL, NULL, 348, 96),
(114, 'Perez', 'Jose', '1900-03-12', 117, '32456789', 'MASCULINO', 'French 414', 350, 349, NULL, NULL, 351, 97);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  `responsablequeconfirma` varchar(20) DEFAULT NULL,
  `usuarioqueconfirma_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nro_de_preinscripto` (`nro_de_preinscripto`),
  KEY `preinscripcion_prein_cicloLectivo_id_3d0da2a0_fk_preinscri` (`cicloLectivo_id`),
  KEY `preinscripcion_preinscripci_usuarioqueconfirma_id_d4b60181` (`usuarioqueconfirma_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preinscripcion_preinscripciongeneral`
--

CREATE TABLE IF NOT EXISTS `preinscripcion_preinscripciongeneral` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `nro_de_preinscripto` varchar(10) NOT NULL,
  `nivel` varchar(10) NOT NULL,
  `anio` varchar(1) NOT NULL,
  `confirmado` tinyint(1) NOT NULL,
  `cubrio_vacante` tinyint(1) NOT NULL,
  `cicloLectivo_id` int(11) DEFAULT NULL,
  `estado` varchar(20) NOT NULL,
  `fecha_confirmado` date DEFAULT NULL,
  `responsablequeconfirma` varchar(20) DEFAULT NULL,
  `usuarioqueconfirma_id` int(11) DEFAULT NULL,
  `motivo` longtext NOT NULL,
  `institucion_anterior` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nro_de_preinscripto` (`nro_de_preinscripto`),
  KEY `preinscripcion_prein_cicloLectivo_id_5a790dec_fk_preinscri` (`cicloLectivo_id`),
  KEY `preinscripcion_preinscripci_usuarioqueconfirma_id_bfe0d098` (`usuarioqueconfirma_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=98 ;

--
-- Volcado de datos para la tabla `preinscripcion_preinscripciongeneral`
--

INSERT INTO `preinscripcion_preinscripciongeneral` (`id`, `fecha`, `hora`, `nro_de_preinscripto`, `nivel`, `anio`, `confirmado`, `cubrio_vacante`, `cicloLectivo_id`, `estado`, `fecha_confirmado`, `responsablequeconfirma`, `usuarioqueconfirma_id`, `motivo`, `institucion_anterior`) VALUES
(81, '2017-09-09', '21:54:46', '51750727', 'PRIMARIO', '3', 1, 0, 1, 'CONFIRMADO', '2017-09-10', NULL, 4, 'No contesta', 'Escuela anterior'),
(82, '2017-09-10', '19:09:27', '71930657', 'PRIMARIO', '1', 1, 0, 1, 'CONFIRMADO', '2017-09-10', NULL, 4, 'No contesta', 'Escuela anterior'),
(83, '2017-09-10', '20:31:15', '29984668', 'INICIAL', '1', 1, 0, 1, 'ALUMNO', '2017-09-10', NULL, 4, 'No contesta', 'Escuela anterior'),
(84, '2017-09-10', '20:35:47', '84023632', 'SECUNDARIO', '4', 1, 0, 1, 'ALUMNO', '2017-09-12', NULL, 7, 'No contesta', 'Escuela anterior'),
(85, '2017-09-10', '20:40:42', '50197183', 'PRIMARIO', '3', 0, 0, 1, 'PREINSCRIPTO', NULL, NULL, NULL, 'No contesta', 'Escuela anterior'),
(86, '2017-09-11', '12:18:37', '84694684', 'PRIMARIO', '3', 0, 0, 1, 'PREINSCRIPTO', NULL, NULL, NULL, 'No contesta', 'Escuela anterior'),
(87, '2017-09-11', '12:57:11', '17042019', 'PRIMARIO', '3', 1, 0, 1, 'CONFIRMADO', '2017-09-11', NULL, 4, 'Los tiempos han cambiado, vivimos una cultura dinámica donde los conocimientos tienen gran movilidad. En la actualidad diez años equivalen a un siglo de otros tiempos. La actitud generalizada de nuestro tiempo es la de seguir aprendiendo en un proceso de continuo aprendizaje y continua revisión de los conocimientos.', 'Escuela anterior'),
(88, '2017-09-11', '12:58:15', '56753124', 'PRIMARIO', '3', 0, 0, 1, 'PREINSCRIPTO', NULL, NULL, NULL, 'Los tiempos han cambiado, vivimos una cultura dinámica donde los conocimientos tienen gran movilidad. En la actualidad diez años equivalen a un siglo de otros tiempos. La actitud generalizada de nuestro tiempo es la de seguir aprendiendo en un proceso de continuo aprendizaje y continua revisión de los conocimientos.', 'Escuela anterior'),
(89, '2017-09-11', '13:31:14', '28818929', 'SECUNDARIO', '4', 0, 0, 1, 'PREINSCRIPTO', NULL, NULL, NULL, 'No contesta', 'Escuela anterior'),
(90, '2017-09-11', '13:31:39', '69085682', 'INICIAL', '6', 1, 0, 1, 'ALUMNO', '2017-09-12', NULL, 4, 'No contesta', 'Escuela anterior'),
(91, '2017-09-11', '13:31:48', '68231671', 'INICIAL', '6', 1, 0, 1, 'ALUMNO', '2017-09-12', NULL, 4, 'No contesta', 'Escuela anterior'),
(92, '2017-09-11', '13:32:13', '96038429', 'SECUNDARIO', '6', 0, 0, 1, 'PREINSCRIPTO', NULL, NULL, NULL, 'No contesta', 'Escuela anterior'),
(93, '2017-09-11', '16:45:32', '23852447', 'PRIMARIO', '4', 0, 0, 1, 'PREINSCRIPTO', NULL, NULL, NULL, 'No contesta', 'Escuela anterior'),
(94, '2017-09-11', '16:46:33', '91958536', 'INICIAL', '1', 0, 0, 1, 'PREINSCRIPTO', NULL, NULL, NULL, 'No contesta', 'Escuela anterior'),
(95, '2017-09-11', '20:24:34', '93079590', 'PRIMARIO', '2', 0, 0, 1, 'PREINSCRIPTO', NULL, NULL, NULL, 'No contesta', 'Escuela'),
(96, '2017-09-11', '20:29:55', '54956848', 'PRIMARIO', '3', 0, 0, 2, 'PREINSCRIPTO', NULL, NULL, NULL, 'No contesta', 'Escuela anterior'),
(97, '2017-09-11', '20:32:28', '51948871', 'PRIMARIO', '2', 0, 0, 2, 'PREINSCRIPTO', NULL, NULL, NULL, 'No contesta', 'Escuela anterior');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=352 ;

--
-- Volcado de datos para la tabla `preinscripcion_responsable`
--

INSERT INTO `preinscripcion_responsable` (`id`, `apellido`, `nombre`, `dni`, `email`, `domicilio`, `nacionalidad`, `telefonoPersonal`) VALUES
(289, 'Pereziene', 'ddfsdf', '23232323', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'sdfsdfsdff', '55345345345'),
(290, 'Vastik', 'Marta', '16636212', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'Argentino', '55345345345'),
(291, 'Pereziene', 'ddfsdf', '23232323', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'sdfsdfsdff', '55345345345'),
(292, 'Pereziene', 'ddfsdf', '23232323', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'sdfsdfsdff', '55345345345'),
(293, 'Vastik', 'Marta', '16636212', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'Argentino', '55345345345'),
(294, 'Vastik', 'Marta', '16636212', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'Argentino', '55345345345'),
(295, 'Pereziene', 'ddfsdf', '23232323', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'sdfsdfsdff', '55345345345'),
(296, 'Vastik', 'Marta', '16636212', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'Argentino', '55345345345'),
(297, 'Pereziene', 'ddfsdf', '23232323', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'sdfsdfsdff', '55345345345'),
(298, 'Pereziene', 'ddfsdf', '23232323', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'sdfsdfsdff', '55345345345'),
(299, 'Vastik', 'Marta', '16636212', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'Argentino', '55345345345'),
(300, 'Pereziene', 'ddfsdf', '23232323', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'sdfsdfsdff', '55345345345'),
(301, 'Pereziene', 'ddfsdf', '23232323', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'sdfsdfsdff', '55345345345'),
(302, 'Vastik', 'Marta', '16636212', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'Argentino', '55345345345'),
(303, 'Pereziene', 'ddfsdf', '23232323', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'sdfsdfsdff', '55345345345'),
(304, 'Pereziene', 'Javier', '23232323', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'sdfsdfsdff', '55345345345'),
(305, 'Vastik', 'Marta', '16636212', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'Argentino', '55345345345'),
(306, 'Pereziene', 'Javier', '23232323', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'sdfsdfsdff', '55345345345'),
(307, 'Pereziene', 'Javier', '23232323', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'sdfsdfsdff', '55345345345'),
(308, 'Vastik', 'Marta', '16636212', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'Argentino', '55345345345'),
(309, 'Vastik', 'Marta', '16636212', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'Argentino', '55345345345'),
(310, 'Pereziene', 'Javier', '23232323', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'sdfsdfsdff', '55345345345'),
(311, 'Vastik', 'Marta', '16636212', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'Argentino', '55345345345'),
(312, 'Vastik', 'Marta', '16636212', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'Argentino', '55345345345'),
(313, 'Pereziene', 'ddfsdf', '23232323', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'sdfsdfsdff', '55345345345'),
(314, 'Vastik Asdddd', 'Marta', '16636212', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'Argentino', '55345345345'),
(315, 'Pereziene', 'ddfsdf', '23232323', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'sdfsdfsdff', '55345345345'),
(316, 'Pereziene', 'ddfsdf', '23232323', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'sdfsdfsdff', '55345345345'),
(317, 'Vastik Asdddd', 'Marta', '16636212', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'Argentino', '55345345345'),
(318, 'Carlos', 'Carlos', '21111111', 'carlos@gmail.com', 'Rivadavia 243', 'Argentino', '362428973733'),
(319, 'Pereziene', 'ddfsdf', '23232323', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'sdfsdfsdff', '55345345345'),
(320, 'Vastik Asdddd', 'Marta', '16636212', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'Argentino', '55345345345'),
(321, 'Carlos', 'Carlos', '21111111', 'carlos@gmail.com', 'Rivadavia 243', 'Argentino', '362428973733'),
(322, 'Pereziene', 'ddfsdf', '23232323', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'sdfsdfsdff', '55345345345'),
(323, 'Vastik Asdddd', 'Marta', '16636212', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'Argentino', '55345345345'),
(324, 'Carlos', 'Carlos', '21111111', 'carlos@gmail.com', 'Rivadavia 243', 'Argentino', '362428973733'),
(325, 'Pereziene', 'ddfsdf', '34343434', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'sdfsdfsdff', '55345345345'),
(326, 'Vastik', 'Marta', '16636212', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'Argentino', '55345345345'),
(327, 'Pereziene', 'ddfsdf', '34343434', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'sdfsdfsdff', '55345345345'),
(328, 'Pereziene', 'ddfsdf', '34343434', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'sdfsdfsdff', '55345345345'),
(329, 'Vastik', 'Marta', '16636212', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'Argentino', '55345345345'),
(330, 'Pereziene', 'ddfsdf', '34343434', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'sdfsdfsdff', '55345345345'),
(331, 'Pereziene', 'Javier', '23232323', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'sdfsdfsdff', '55345345345'),
(332, 'Vastik', 'Marta', '16636212', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'Argentino', '55345345345'),
(333, 'Pereziene', 'Javier', '23232323', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'sdfsdfsdff', '55345345345'),
(334, 'Pereziene', 'Javier', '23232323', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'sdfsdfsdff', '55345345345'),
(335, 'Vastik', 'Marta', '16636212', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'Argentino', '55345345345'),
(336, 'Pereziene', 'Javier', '23232323', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'sdfsdfsdff', '55345345345'),
(337, 'Pereziene', 'Javier', '23232323', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'sdfsdfsdff', '55345345345'),
(338, 'Vastik', 'Marta', '16636212', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'Argentino', '55345345345'),
(339, 'Pereziene', 'Javier', '23232323', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'sdfsdfsdff', '55345345345'),
(340, 'Pereziene', 'ddfsdf', '23232323', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'sdfsdfsdff', '55345345345'),
(341, 'Vastik', 'Marta', '16636212', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'Argentino', '55345345345'),
(342, 'Pereziene', 'ddfsdf', '23232323', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'sdfsdfsdff', '55345345345'),
(343, 'Pereziene', 'ddfsdf', '23232323', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'sdfsdfsdff', '55345345345'),
(344, 'Vastik', 'Marta', '16636212', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'Argentino', '55345345345'),
(345, 'Pereziene', 'ddfsdf', '23232323', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'sdfsdfsdff', '55345345345'),
(346, 'Pereziene', 'ddfsdf', '23232323', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'sdfsdfsdff', '55345345345'),
(347, 'Vastik', 'Marta', '16636212', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'Argentino', '55345345345'),
(348, 'Pereziene', 'ddfsdf', '23232323', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'sdfsdfsdff', '55345345345'),
(349, 'Pereziene', 'ddfsdf', '23232323', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'sdfsdfsdff', '55345345345'),
(350, 'Vastik', 'Marta', '16636212', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'Argentino', '55345345345'),
(351, 'Vastik', 'Marta', '16636212', 'cafsdfsdf@sd.com', 'sdfsfdfvxcvcv', 'Argentino', '55345345345');

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
-- Filtros para la tabla `pg_profile`
--
ALTER TABLE `pg_profile`
  ADD CONSTRAINT `pg_profile_user_id_e085e8cc_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `preinscripcion_postulante`
--
ALTER TABLE `preinscripcion_postulante`
  ADD CONSTRAINT `preinscripcion_postu_madre_id_00826143_fk_preinscri` FOREIGN KEY (`madre_id`) REFERENCES `preinscripcion_responsable` (`id`),
  ADD CONSTRAINT `preinscripcion_postu_padre_id_dcc6a93c_fk_preinscri` FOREIGN KEY (`padre_id`) REFERENCES `preinscripcion_responsable` (`id`),
  ADD CONSTRAINT `preinscripcion_postu_pg_id_6c4950e6_fk_preinscri` FOREIGN KEY (`pg_id`) REFERENCES `preinscripcion_preinscripciongeneral` (`id`),
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
  ADD CONSTRAINT `preinscripcion_prein_cicloLectivo_id_3d0da2a0_fk_preinscri` FOREIGN KEY (`cicloLectivo_id`) REFERENCES `preinscripcion_ciclolectivo` (`id`),
  ADD CONSTRAINT `preinscripcion_prein_usuarioqueconfirma_i_d4b60181_fk_auth_user` FOREIGN KEY (`usuarioqueconfirma_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `preinscripcion_preinscripciongeneral`
--
ALTER TABLE `preinscripcion_preinscripciongeneral`
  ADD CONSTRAINT `preinscripcion_prein_cicloLectivo_id_5a790dec_fk_preinscri` FOREIGN KEY (`cicloLectivo_id`) REFERENCES `preinscripcion_ciclolectivo` (`id`),
  ADD CONSTRAINT `preinscripcion_prein_usuarioqueconfirma_i_bfe0d098_fk_auth_user` FOREIGN KEY (`usuarioqueconfirma_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
