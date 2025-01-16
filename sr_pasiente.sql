-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 26, 2024 at 08:18 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sr_pasiente`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add categoria', 7, 'add_categoria'),
(26, 'Can change categoria', 7, 'change_categoria'),
(27, 'Can delete categoria', 7, 'delete_categoria'),
(28, 'Can view categoria', 7, 'view_categoria'),
(29, 'Can add pozisaun', 8, 'add_pozisaun'),
(30, 'Can change pozisaun', 8, 'change_pozisaun'),
(31, 'Can delete pozisaun', 8, 'delete_pozisaun'),
(32, 'Can view pozisaun', 8, 'view_pozisaun'),
(33, 'Can add suco', 9, 'add_suco'),
(34, 'Can change suco', 9, 'change_suco'),
(35, 'Can delete suco', 9, 'delete_suco'),
(36, 'Can view suco', 9, 'view_suco'),
(37, 'Can add aldeia', 10, 'add_aldeia'),
(38, 'Can change aldeia', 10, 'change_aldeia'),
(39, 'Can delete aldeia', 10, 'delete_aldeia'),
(40, 'Can view aldeia', 10, 'view_aldeia'),
(41, 'Can add profisaun', 11, 'add_profisaun'),
(42, 'Can change profisaun', 11, 'change_profisaun'),
(43, 'Can delete profisaun', 11, 'delete_profisaun'),
(44, 'Can view profisaun', 11, 'view_profisaun'),
(45, 'Can add staff', 12, 'add_staff'),
(46, 'Can change staff', 12, 'change_staff'),
(47, 'Can delete staff', 12, 'delete_staff'),
(48, 'Can view staff', 12, 'view_staff'),
(49, 'Can add ficha familia', 13, 'add_fichafamilia'),
(50, 'Can change ficha familia', 13, 'change_fichafamilia'),
(51, 'Can delete ficha familia', 13, 'delete_fichafamilia'),
(52, 'Can view ficha familia', 13, 'view_fichafamilia'),
(53, 'Can add pasiente', 14, 'add_pasiente'),
(54, 'Can change pasiente', 14, 'change_pasiente'),
(55, 'Can delete pasiente', 14, 'delete_pasiente'),
(56, 'Can view pasiente', 14, 'view_pasiente'),
(57, 'Can add registo', 15, 'add_registo'),
(58, 'Can change registo', 15, 'change_registo'),
(59, 'Can delete registo', 15, 'delete_registo'),
(60, 'Can view registo', 15, 'view_registo'),
(61, 'Can add diagnosaun', 16, 'add_diagnosaun'),
(62, 'Can change diagnosaun', 16, 'change_diagnosaun'),
(63, 'Can delete diagnosaun', 16, 'delete_diagnosaun'),
(64, 'Can view diagnosaun', 16, 'view_diagnosaun');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$0zIKbtZXdAzCf1WmzKNfZy$ojnqWcF+Lw8QFfyuThBUs6RUtVVReAxGdE3mR15lbHc=', '2024-11-26 08:16:41.562049', 1, 'john', '', '', '', 1, 1, '2024-11-26 08:16:25.149136');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_aldeia`
--

CREATE TABLE `custom_aldeia` (
  `id` bigint NOT NULL,
  `aldeia` varchar(20) NOT NULL,
  `suco_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_categoria`
--

CREATE TABLE `custom_categoria` (
  `id` bigint NOT NULL,
  `categoria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_pozisaun`
--

CREATE TABLE `custom_pozisaun` (
  `id` bigint NOT NULL,
  `pozisaun` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_profisaun`
--

CREATE TABLE `custom_profisaun` (
  `id` bigint NOT NULL,
  `profisaun` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_suco`
--

CREATE TABLE `custom_suco` (
  `id` bigint NOT NULL,
  `suco` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(10, 'custom', 'aldeia'),
(7, 'custom', 'categoria'),
(8, 'custom', 'pozisaun'),
(11, 'custom', 'profisaun'),
(9, 'custom', 'suco'),
(16, 'registo', 'diagnosaun'),
(13, 'registo', 'fichafamilia'),
(14, 'registo', 'pasiente'),
(15, 'registo', 'registo'),
(6, 'sessions', 'session'),
(12, 'staff', 'staff');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-11-26 08:14:22.080051'),
(2, 'auth', '0001_initial', '2024-11-26 08:14:23.429475'),
(3, 'admin', '0001_initial', '2024-11-26 08:14:23.687214'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-11-26 08:14:23.703865'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-11-26 08:14:23.741879'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-11-26 08:14:23.894213'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-11-26 08:14:24.046112'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-11-26 08:14:24.122834'),
(9, 'auth', '0004_alter_user_username_opts', '2024-11-26 08:14:24.139511'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-11-26 08:14:24.261319'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-11-26 08:14:24.277269'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-11-26 08:14:24.293980'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-11-26 08:14:24.429886'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-11-26 08:14:24.565538'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-11-26 08:14:24.623372'),
(16, 'auth', '0011_update_proxy_permissions', '2024-11-26 08:14:24.645503'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-11-26 08:14:24.773765'),
(18, 'custom', '0001_initial', '2024-11-26 08:14:25.006024'),
(19, 'custom', '0002_profisaun', '2024-11-26 08:14:25.047213'),
(20, 'staff', '0001_initial', '2024-11-26 08:14:25.287817'),
(21, 'staff', '0002_staff_profile_photo_staff_user', '2024-11-26 08:14:25.470654'),
(22, 'staff', '0003_alter_staff_profile_photo', '2024-11-26 08:14:25.651545'),
(23, 'staff', '0004_staff_espesializasaun', '2024-11-26 08:14:25.706748'),
(24, 'registo', '0001_initial', '2024-11-26 08:14:26.580746'),
(25, 'registo', '0002_registo_doctor_registo_status', '2024-11-26 08:14:26.822653'),
(26, 'sessions', '0001_initial', '2024-11-26 08:14:26.913438');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('io1t6i00mv2f15497wmlgoamukb86zun', '.eJxVjEEOwiAQRe_C2pBOGZC6dO8ZCMwMUjU0Ke3KeHfbpAvdvvf-f6sQ16WEtckcRlYXBer0y1Kkp9Rd8CPW-6Rpqss8Jr0n-rBN3yaW1_Vo_w5KbGVbGyR39mCN63yX2UIaBtsjJo-mFwLckM9INqOQcxDZWJ_QQbZEwqw-X7MdN3k:1tFqkT:oSrdvi0Zp9ag_ZNf3km7HeNFZQTknJvprrp3sMxk1NM', '2024-12-10 08:16:41.562049');

-- --------------------------------------------------------

--
-- Table structure for table `registo_diagnosaun`
--

CREATE TABLE `registo_diagnosaun` (
  `id` bigint NOT NULL,
  `data_diagnosaun` date NOT NULL,
  `diagnosaun` longtext NOT NULL,
  `diagnose_by_id` bigint NOT NULL,
  `registo_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `registo_fichafamilia`
--

CREATE TABLE `registo_fichafamilia` (
  `no_ficha` varchar(5) NOT NULL,
  `chefe_familia` varchar(100) NOT NULL,
  `aldeia_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `registo_pasiente`
--

CREATE TABLE `registo_pasiente` (
  `id` bigint NOT NULL,
  `nome` varchar(100) NOT NULL,
  `sexo` varchar(10) NOT NULL,
  `hela_fatin` varchar(20) DEFAULT NULL,
  `ficha_familia_id` varchar(5) NOT NULL,
  `profisaun_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `registo_registo`
--

CREATE TABLE `registo_registo` (
  `id` bigint NOT NULL,
  `data_registo` date NOT NULL,
  `categoria_id` bigint NOT NULL,
  `pasiente_id` bigint NOT NULL,
  `doctor_id` bigint DEFAULT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff_staff`
--

CREATE TABLE `staff_staff` (
  `id` bigint NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` varchar(100) DEFAULT NULL,
  `aldeia_id` bigint NOT NULL,
  `pozisaun_id` bigint NOT NULL,
  `profile_photo` varchar(100) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `espesializasaun` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `custom_aldeia`
--
ALTER TABLE `custom_aldeia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_aldeia_suco_id_422c6554_fk_custom_suco_id` (`suco_id`);

--
-- Indexes for table `custom_categoria`
--
ALTER TABLE `custom_categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_pozisaun`
--
ALTER TABLE `custom_pozisaun`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_profisaun`
--
ALTER TABLE `custom_profisaun`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_suco`
--
ALTER TABLE `custom_suco`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `registo_diagnosaun`
--
ALTER TABLE `registo_diagnosaun`
  ADD PRIMARY KEY (`id`),
  ADD KEY `registo_diagnosaun_diagnose_by_id_479e5b3b_fk_staff_staff_id` (`diagnose_by_id`),
  ADD KEY `registo_diagnosaun_registo_id_d8a44402_fk_registo_registo_id` (`registo_id`);

--
-- Indexes for table `registo_fichafamilia`
--
ALTER TABLE `registo_fichafamilia`
  ADD PRIMARY KEY (`no_ficha`),
  ADD KEY `registo_fichafamilia_aldeia_id_dc338e0a_fk_custom_aldeia_id` (`aldeia_id`);

--
-- Indexes for table `registo_pasiente`
--
ALTER TABLE `registo_pasiente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `registo_pasiente_ficha_familia_id_bb2bddf3_fk_registo_f` (`ficha_familia_id`),
  ADD KEY `registo_pasiente_profisaun_id_ab407b96_fk_custom_profisaun_id` (`profisaun_id`);

--
-- Indexes for table `registo_registo`
--
ALTER TABLE `registo_registo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `registo_registo_categoria_id_49b894a5_fk_custom_categoria_id` (`categoria_id`),
  ADD KEY `registo_registo_pasiente_id_7cc8367c_fk_registo_pasiente_id` (`pasiente_id`),
  ADD KEY `registo_registo_doctor_id_cc1cc602_fk_staff_staff_id` (`doctor_id`);

--
-- Indexes for table `staff_staff`
--
ALTER TABLE `staff_staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `staff_staff_aldeia_id_61ee3ee7_fk_custom_aldeia_id` (`aldeia_id`),
  ADD KEY `staff_staff_pozisaun_id_bf940f19_fk_custom_pozisaun_id` (`pozisaun_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_aldeia`
--
ALTER TABLE `custom_aldeia`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_categoria`
--
ALTER TABLE `custom_categoria`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_pozisaun`
--
ALTER TABLE `custom_pozisaun`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_profisaun`
--
ALTER TABLE `custom_profisaun`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_suco`
--
ALTER TABLE `custom_suco`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `registo_diagnosaun`
--
ALTER TABLE `registo_diagnosaun`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `registo_pasiente`
--
ALTER TABLE `registo_pasiente`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `registo_registo`
--
ALTER TABLE `registo_registo`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_staff`
--
ALTER TABLE `staff_staff`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `custom_aldeia`
--
ALTER TABLE `custom_aldeia`
  ADD CONSTRAINT `custom_aldeia_suco_id_422c6554_fk_custom_suco_id` FOREIGN KEY (`suco_id`) REFERENCES `custom_suco` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `registo_diagnosaun`
--
ALTER TABLE `registo_diagnosaun`
  ADD CONSTRAINT `registo_diagnosaun_diagnose_by_id_479e5b3b_fk_staff_staff_id` FOREIGN KEY (`diagnose_by_id`) REFERENCES `staff_staff` (`id`),
  ADD CONSTRAINT `registo_diagnosaun_registo_id_d8a44402_fk_registo_registo_id` FOREIGN KEY (`registo_id`) REFERENCES `registo_registo` (`id`);

--
-- Constraints for table `registo_fichafamilia`
--
ALTER TABLE `registo_fichafamilia`
  ADD CONSTRAINT `registo_fichafamilia_aldeia_id_dc338e0a_fk_custom_aldeia_id` FOREIGN KEY (`aldeia_id`) REFERENCES `custom_aldeia` (`id`);

--
-- Constraints for table `registo_pasiente`
--
ALTER TABLE `registo_pasiente`
  ADD CONSTRAINT `registo_pasiente_ficha_familia_id_bb2bddf3_fk_registo_f` FOREIGN KEY (`ficha_familia_id`) REFERENCES `registo_fichafamilia` (`no_ficha`),
  ADD CONSTRAINT `registo_pasiente_profisaun_id_ab407b96_fk_custom_profisaun_id` FOREIGN KEY (`profisaun_id`) REFERENCES `custom_profisaun` (`id`);

--
-- Constraints for table `registo_registo`
--
ALTER TABLE `registo_registo`
  ADD CONSTRAINT `registo_registo_categoria_id_49b894a5_fk_custom_categoria_id` FOREIGN KEY (`categoria_id`) REFERENCES `custom_categoria` (`id`),
  ADD CONSTRAINT `registo_registo_doctor_id_cc1cc602_fk_staff_staff_id` FOREIGN KEY (`doctor_id`) REFERENCES `staff_staff` (`id`),
  ADD CONSTRAINT `registo_registo_pasiente_id_7cc8367c_fk_registo_pasiente_id` FOREIGN KEY (`pasiente_id`) REFERENCES `registo_pasiente` (`id`);

--
-- Constraints for table `staff_staff`
--
ALTER TABLE `staff_staff`
  ADD CONSTRAINT `staff_staff_aldeia_id_61ee3ee7_fk_custom_aldeia_id` FOREIGN KEY (`aldeia_id`) REFERENCES `custom_aldeia` (`id`),
  ADD CONSTRAINT `staff_staff_pozisaun_id_bf940f19_fk_custom_pozisaun_id` FOREIGN KEY (`pozisaun_id`) REFERENCES `custom_pozisaun` (`id`),
  ADD CONSTRAINT `staff_staff_user_id_abd8ba40_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
