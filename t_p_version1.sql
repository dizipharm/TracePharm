-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 30, 2021 at 10:14 AM
-- Server version: 8.0.27-0ubuntu0.20.04.1
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `t&p_version1`
--

-- --------------------------------------------------------

--
-- Table structure for table `api_basic_party_registration`
--

CREATE TABLE `api_basic_party_registration` (
  `id` smallint DEFAULT NULL,
  `creation_date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `document_status` varchar(10) DEFAULT NULL COMMENT 'ref: status codes',
  `entity_identification` varchar(30) DEFAULT NULL,
  `party_content_owner` varchar(30) DEFAULT NULL,
  `party_off_chain_db` varchar(100) DEFAULT NULL COMMENT 'Database Name (Multi tenant)',
  `lastUpdateDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `party_identifaction_info` varchar(30) DEFAULT NULL,
  `party_identifaction_org_head` varchar(30) DEFAULT NULL,
  `address_id` smallint DEFAULT NULL COMMENT 'FK MT ADDRESS',
  `party_activity` varchar(200) DEFAULT NULL COMMENT 'pack, ship, mfg, qc, etc',
  `party_role` varchar(20) DEFAULT NULL COMMENT 'Ref: LKP: DISTRIBUTOR',
  `party_contact_id` smallint DEFAULT NULL COMMENT 'FK Contacts',
  `Party_capability` smallint DEFAULT NULL COMMENT 'What they supposed to do, autheirze, search, register, data sync',
  `last_change_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `registration_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `registration_status` varchar(100) DEFAULT NULL COMMENT 'PUBLISHED, ACCPETED, REJECTED, DELETED',
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `api_json_trading_party_registration`
--

CREATE TABLE `api_json_trading_party_registration` (
  `id` smallint NOT NULL,
  `api_name` varchar(100) DEFAULT NULL,
  `sender_identtifier` varchar(20) DEFAULT NULL COMMENT 'Identifier Authority="GS1"',
  `receiver_identtifier` varchar(20) DEFAULT NULL COMMENT 'Identifier Authority="GS1"',
  `is_trading_active` tinyint(1) DEFAULT '1',
  `sender_gln` varchar(20) DEFAULT NULL COMMENT 'Organization''s corporate identity GLN',
  `party_address_id` smallint DEFAULT NULL COMMENT 'FK address - fields',
  `party_role_id` smallint DEFAULT NULL COMMENT 'use CORPORATE_IDENTITY for main, FK-Mfg, DISTRIBUTOR',
  `creation_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `api_user`
--

CREATE TABLE `api_user` (
  `id` int NOT NULL,
  `add_user_id` int DEFAULT NULL,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `uid` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  `created_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `modified_by` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contact_number` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `organization_id` smallint UNSIGNED DEFAULT NULL,
  `profile_access_id` smallint DEFAULT NULL,
  `user_type_id` smallint DEFAULT NULL,
  `alternate_contact_number` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `alternate_email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `designation` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role` smallint UNSIGNED DEFAULT NULL,
  `is_staff` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `api_user`
--

INSERT INTO `api_user` (`id`, `add_user_id`, `password`, `last_login`, `is_superuser`, `uid`, `email`, `first_name`, `last_name`, `date_joined`, `is_active`, `is_deleted`, `created_date`, `modified_date`, `created_by`, `modified_by`, `contact_number`, `organization_id`, `profile_access_id`, `user_type_id`, `alternate_contact_number`, `alternate_email`, `designation`, `user_name`, `role`, `is_staff`) VALUES
(1, NULL, 'pbkdf2_sha256$216000$DGzBDM2QFphB$YSmJTugkSrgtQPpgLRvymUQ+vj+svpmXJpxNtE2b+aI=', '2021-11-24 07:05:38.133336', 0, '72715045be3e4e569e0a546d065031c5', 'vikas.mfg.operator@aidizital.com', 'Vikas', 'vamsi', '2021-08-28 04:54:03.280340', 1, 0, '2021-08-28 04:54:03.107608', '2021-08-28 04:54:03.107608', '', 'vikas.mfg.operator@aidizital.com', '7416880323', 1, NULL, NULL, '9866617886', 'vamsi.y@aidizital.com', 'Operator', 'Vikas', 1, 1),
(2, NULL, 'pbkdf2_sha256$216000$JfctMhbMkLjK$aW/iOAnwz3vYPqLlN5M6F6QevG5LoI0B4acKwp0h2AY=', '2021-09-21 11:02:21.122905', 0, '64ff2e933ee34042a153c01c3b10b734', 'logistics@aidizital.com', 'logistics', 'transport', '2021-08-28 05:01:03.202386', 1, 0, '2021-08-28 05:01:03.029770', '2021-08-28 05:01:03.029770', '', '', '7416880333', 4, NULL, NULL, '986617882', 'vamsi@gmail.com', 'admin', 'Logistics', 1, 1),
(3, NULL, 'pbkdf2_sha256$216000$jq7XDBJDSLaq$+qhL3Jlh3kIat+XeP+RhMDbr7mGofl4//5io4avnR7o=', '2021-09-20 07:16:19.076252', 0, 'ad01ff4b5c77455e9c557c1e904677c8', 'vihan_retailer_operator@aidizital.com', 'Vihan', 'Jain', '2021-08-28 05:02:59.228923', 1, 0, '2021-08-28 05:02:59.057014', '2021-08-28 05:02:59.057014', '', '', '8886984854', 5, NULL, NULL, '8886984852', 'vamsice@outlook.com', 'Operator', 'Vihan', 1, 1),
(4, NULL, 'pbkdf2_sha256$216000$XBKqXogmQs5Q$UFNyAE96FUc8QBL3ZwiiGC3P3IIAaYoCL6r4rymv5Hg=', '2021-09-21 07:26:05.141797', 0, '61ba990da1e94509b40fef6f159ac83a', 'nikhil_distributor_operator@aidizital.com', 'Nikhil', 'Rohitt', '2021-08-28 05:04:58.283538', 1, 0, '2021-08-28 05:04:58.109928', '2021-08-28 05:04:58.109928', '', '', '7416880369', 3, NULL, NULL, '8745123698', 'vamsive@gmail.com', 'Operator', 'Nikhil', 1, 1),
(5, 1, 'pbkdf2_sha256$216000$05Bqnwr8WuMO$ddhn1b+7/VB1/lwgKI/Wpgr+E9siGXCxkMEKsK3lZP0=', '2021-11-23 07:22:06.678364', 0, 'e0da3167a5ef4d16954da65de330a5bb', 'admin@aidizital.com', 'Vamsi', 'Yarragunta', '2021-11-15 07:37:06.240140', 1, 0, '2021-11-15 07:37:06.000000', '2021-11-15 07:37:06.000000', '', 'admin@aidizital.com', '7416880323', 1, NULL, NULL, '9866617886', 'vamsi.y@aidizital.com', 'Admin', 'vamsiiiii', 1, 1),
(6, NULL, 'pbkdf2_sha256$216000$r9NHbgV2uZeK$hR1waz+Uv3R7wNRGgflN03f3ZjPY3btHR+dmJ08766A=', '2021-11-24 07:02:17.983971', 1, '51f0eedc6b6a4e60910925dd743bd605', 'raheed.mfg.admin@aidizital.com', 'Aidizital', 'Aidizi', '2021-11-15 07:40:44.699289', 1, 0, '2021-11-15 07:40:44.524680', '2021-11-15 07:40:44.524680', '', '', '9866617886', 1, NULL, NULL, '7416880323', 'sales@aidizital.com', 'Admin', 'Aidizital', 7, 1),
(8, 6, 'pbkdf2_sha256$216000$zLplf0Y038Ow$wWK7zlHi5mRxsqx5uVmrX1MyrtGgAKw/Nh+XcaFog58=', '2021-11-23 10:07:34.553086', 0, 'dc0446179f0443f68a6db585bbe50f3d', 'mohan.mfg.operator@aidizital.com', 'Mohan', 'Krishna', '2021-11-23 09:16:11.953902', 1, 0, '2021-11-23 09:16:11.782041', '2021-11-23 09:16:11.782041', '', '', '7416880323', 1, NULL, NULL, '9866617886', 'mohan@gmail.com', 'Operator', 'Mohan.Operator', 3, 1),
(10, NULL, 'pbkdf2_sha256$216000$MO6OoEJimX06$LGFIKzutrqIgSiu9r1P93MIiJ6ZeZUOaedQS2j64DSA=', NULL, 0, 'b97f127eb57347b0b47808dc5946a5d1', 'delete@gmail.com', '', '', '2021-11-23 10:20:20.526735', 1, 0, '2021-11-23 10:20:20.357167', '2021-11-23 10:20:20.357167', '', '', '', NULL, NULL, NULL, '', '', '', 'delete', NULL, 1),
(11, NULL, 'pbkdf2_sha256$216000$sr7M1FDPL3m8$1GXlNKccKawQvah/tPRhE4b7NgsA7lFjcn5400WOs98=', NULL, 0, 'd72131a8658a4035a37318f8b078ab11', 'venu@gmail.com', '', '', '2021-11-23 11:25:24.062677', 1, 0, '2021-11-23 11:25:23.875212', '2021-11-23 11:25:23.875212', '', '', '7898787978', NULL, NULL, NULL, '', 'venu@gmail.com', '', '', 1, 1),
(12, NULL, 'pbkdf2_sha256$216000$VuEXqgTU6Bzy$lGQqOQuHysa91mjyEXqmbnWVSedpYzLIBNMzhOL9usQ=', NULL, 0, '3b3eda817c3b4944a41155da256678f8', 'raj@gmail.com', '', '', '2021-11-23 11:58:15.370925', 1, 0, '2021-11-23 11:58:15.204471', '2021-11-23 11:58:15.204471', '', '', '8768776887', NULL, NULL, NULL, '', 'raj@gmail.com', '', '', 1, 1),
(13, NULL, 'pbkdf2_sha256$216000$NNVRugZty2kF$DO9h/jOHGoWaEavNmCCV6ajzh6vqz96+czCRr8jH430=', NULL, 0, '71c11dbc43934875869c1739d3b9a3d2', 'raja@gmail.com', '', '', '2021-11-23 12:00:04.999723', 1, 0, '2021-11-23 12:00:04.827840', '2021-11-23 12:00:04.827840', '', '', '98778768766', NULL, NULL, NULL, '', 'raja@gmail.com', '', '', 2, 1),
(14, NULL, 'pbkdf2_sha256$216000$ptTPfLqOSiY2$IBemJYMLhrjGdVGXz3QrsYtwpjpeIwJXcC66ULtEOG0=', NULL, 0, '7977fe295f9a4c4d88c1731a1a70068c', 'ram@gmail.com', '', '', '2021-11-23 12:57:12.161748', 1, 0, '2021-11-23 12:57:11.988760', '2021-11-23 12:57:11.988760', '', '', '8769876896', NULL, NULL, NULL, '', 'ram', '', '', 1, 1),
(15, NULL, 'pbkdf2_sha256$216000$3ImbR2HRybRh$SXwkjg8DNoNQJ/lekkzLlA2RO+Gd2eQK5XtWJFhRsgM=', '2021-11-23 13:43:21.552552', 0, 'ac7791aac81247c8b124074d138bf21f', 'hello@gmail.com', 'hello', 'like', '2021-11-23 13:41:32.363330', 1, 0, '2021-11-23 13:41:32.191377', '2021-11-23 13:41:32.191377', '', '', '', 1, NULL, NULL, '', '', 'admi', 'hai', 3, 1),
(16, NULL, 'pbkdf2_sha256$216000$qmFRmRvhPDKv$7aeO1xUU3BnE2ziU3CyeXPtzVsgA2Si00dTeJzIsD2k=', NULL, 0, 'b9120aa99da74b9e967b1647ad6a8b1a', 'babu@gmail.com', '', '', '2021-11-23 13:43:33.594306', 1, 0, '2021-11-23 13:43:33.419319', '2021-11-23 13:43:33.419319', '', '', '95425456765', 1, NULL, NULL, '', 'babu@gmail.com', '', 'babu', 2, 1),
(18, NULL, 'pbkdf2_sha256$216000$Q00FyAEeWgg9$JWW4kglEY5NzZ1vw4XuSZ842o/oJm6TAyfBT+6NYuRU=', '2021-11-24 06:50:23.488209', 1, '6b0cbe0481d3492a97eb8e6d5806f2b6', 'david.admin.mfg@aidizital.com', 'David', 'Richerds', '2021-11-23 15:24:08.749335', 1, 0, '2021-11-23 15:24:08.575804', '2021-11-23 15:24:08.575804', '', '', '7416880323', 1, NULL, NULL, '8886984854', 'david@gmail.com', 'Admin', 'David Richerds', 7, 1),
(19, 6, 'pbkdf2_sha256$216000$7j9IGDt1lyth$KXsFdj9c1ef9HBGWByJ2KgjEI1fId50LwlAyDS3rieA=', NULL, 0, 'd7e252f40d044bc2ac709a691264f1ff', 'michel.mfg.operator@aidigital.com', '', '', '2021-11-24 08:32:29.642503', 1, 0, '2021-11-24 08:32:29.466762', '2021-11-24 08:32:29.466762', '', '', '95425456765', 1, NULL, NULL, '', 'michel@gmail.com', '', 'Michel', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `api_user_groups`
--

CREATE TABLE `api_user_groups` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `api_user_user_permissions`
--

CREATE TABLE `api_user_user_permissions` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `id` int NOT NULL,
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

-- --------------------------------------------------------

--
-- Stand-in structure for view `dit_retailer_dispatch`
-- (See below for the actual view)
--
CREATE TABLE `dit_retailer_dispatch` (
`id` smallint unsigned
,`sscc_no` varchar(50)
,`consigner` varchar(50)
,`consignee` varchar(50)
,`sender_location` varchar(100)
,`sender_loc_gln` varchar(15)
,`dispatch_location` varchar(100)
,`dispatch_loc_gln` varchar(15)
,`lsp_provider` varchar(100)
,`purchase_order` varchar(20)
,`order_status` varchar(30)
,`owner_id` smallint unsigned
,`location_id` smallint unsigned
,`product_dispactch_id` smallint unsigned
);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2021-11-19 16:27:26.517202', '5', 'admin@aidizital.com', 2, '[{\"changed\": {\"fields\": [\"User name\", \"Modified by\"]}}]', 2, 6);

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
(1, 'api', 'mtproduct'),
(4, 'api', 'tptransactionevents'),
(2, 'api', 'user'),
(3, 'auth', 'group');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-08-26 09:40:18.218493'),
(2, 'contenttypes', '0002_remove_content_type_name', '2021-08-26 09:40:18.249749'),
(3, 'auth', '0001_initial', '2021-08-26 09:40:18.249749'),
(4, 'auth', '0002_alter_permission_name_max_length', '2021-08-26 09:40:18.265370'),
(5, 'auth', '0003_alter_user_email_max_length', '2021-08-26 09:40:18.281003'),
(6, 'auth', '0004_alter_user_username_opts', '2021-08-26 09:40:18.296620'),
(7, 'auth', '0005_alter_user_last_login_null', '2021-08-26 09:40:18.296620'),
(8, 'auth', '0006_require_contenttypes_0002', '2021-08-26 09:40:18.312248'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2021-08-26 09:40:18.327871'),
(10, 'auth', '0008_alter_user_username_max_length', '2021-08-26 09:40:18.327871'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2021-08-26 09:40:18.343499'),
(12, 'auth', '0010_alter_group_name_max_length', '2021-08-26 09:40:18.359116'),
(13, 'auth', '0011_update_proxy_permissions', '2021-08-26 09:40:18.359116'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2021-08-26 09:40:18.374731'),
(15, 'api', '0001_initial', '2021-08-26 09:40:18.374731'),
(16, 'admin', '0001_initial', '2021-08-26 09:40:18.390367'),
(17, 'admin', '0002_logentry_remove_auto_add', '2021-08-26 09:40:18.390367'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2021-08-26 09:40:18.405995'),
(19, 'api', '0002_auto_20210521_0358', '2021-08-26 09:40:18.405995'),
(20, 'api', '0003_apibasicpartyregistration_apijsontradingpartyregistration_gs1applicationidentifiers_gs1businessproce', '2021-08-26 09:40:18.421616'),
(21, 'api', '0004_user_company_category', '2021-08-26 09:40:18.437244'),
(22, 'api', '0005_auto_20210521_0801', '2021-08-26 09:40:18.437244'),
(23, 'api', '0006_auto_20210521_0809', '2021-08-26 09:40:18.452876'),
(24, 'api', '0007_user_user_type', '2021-08-26 09:40:18.468494'),
(25, 'api', '0008_user_company', '2021-08-26 09:40:18.468494'),
(26, 'api', '0009_auto_20210521_1623', '2021-08-26 09:40:18.484127'),
(27, 'api', '0010_user_user_name', '2021-08-26 09:40:18.499743'),
(28, 'api', '0011_remove_user_company', '2021-08-26 09:40:18.499743'),
(29, 'api', '0012_auto_20210527_0217', '2021-08-26 09:40:18.515373'),
(30, 'api', '0013_user_is_staff', '2021-08-26 09:40:18.531019'),
(31, 'api', '0014_user_add_user', '2021-08-26 09:40:18.546623'),
(32, 'api', '0015_auto_20210531_1014', '2021-08-26 09:40:18.546623'),
(33, 'api', '0016_auto_20210531_1031', '2021-08-26 09:40:18.562247'),
(34, 'api', '0017_auto_20210531_1106', '2021-08-26 09:40:18.562247'),
(35, 'sessions', '0001_initial', '2021-08-26 09:40:18.577869');

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
('gwjimo4m7gh3qaw1mfanzjbldtl116ek', 'ZDgzMjk5ZjFjYmQ0NTNkN2IxNGZlNWYxMzA2MWVlYzg3ZjJmYjYxMzp7ImVtYWlsIjpbeyJtZXNzYWdlIjoiU3VjY2Vzc2Z1bGx5IExvZ2dlZCBpbiEiLCJlbWFpbCI6InZpaGFuX3JldGFpbGVyX29wZXJhdG9yQGFpZGl6aXRhbC5jb20iLCJmaXJzdF9uYW1lIjoiVmloYW4iLCJsYXN0X25hbWUiOiJKYWluIiwiY29udGFjdF9udW1iZXIiOiI4ODg2OTg0ODU0IiwiYWx0ZXJuYXRlX2NvbnRhY3RfbnVtYmVyIjoiODg4Njk4NDg1MiIsImlkIjoiMyIsImFjY2VzcyI6ImV5SjBlWEFpT2lKS1YxUWlMQ0poYkdjaU9pSklVekkxTmlKOS5leUowYjJ0bGJsOTBlWEJsSWpvaVlXTmpaWE56SWl3aVpYaHdJam94TmpNd09UTXpOVFF6TENKcWRHa2lPaUl6TTJOak9UVTRPVFpoWkdNME5tVmhZV1prTUdGbU5HWXpNek5sTVRjNU1pSXNJblZ6WlhKZmFXUWlPak45LmNBbllaRFhtdmE4blNXUWo5ZmV3Sk9fMXZJaGwzcW90V3MwT3AzdHpGRUkiLCJyb2xlIjoiMSIsIm9yZ2FuaXphdGlvbl9pZCI6IjUifV19', '2021-09-20 12:59:55.778368'),
('kk1kc8qfkxqax3qo5xci2qsick3ug9f1', '.eJxVjEEOwiAQRe_C2hCwM4Au3fcMzQxDpWogKe3KeHfbpAvd_vfef6uB1iUPa0vzMIm6KqdOvxtTfKayA3lQuVcda1nmifWu6IM23VdJr9vh_h1kanmrQTx7BAeIbCSINR0jjBHOxGSZY4ierUkXEQjgEDprhDYFRwwUovp8AeMaN_U:1mnvFy:K_j1IVmnPdEM4KrnZq3iwwrCoe9A_bbdPbsnL3e3PWU', '2021-12-03 04:12:10.323580'),
('t4xwg0lj8osv2s5he64d2555gdarcd9f', '.eJxVjDEOwjAMRe-SGUU1MUnKyM4ZKjuxaQElUtNOiLtDpQ6w_vfef5mB1mUc1ibzMGVzNhDN4XdkSg8pG8l3KrdqUy3LPLHdFLvTZq81y_Oyu38HI7XxWyv3GXNHQF7RSehAOxXG3qcToAQJHFmD91EASY7oEYhdDI6gVyXz_gAk_jie:1mpm6p:9c2Hm204yxQj-5joUQvgcSwtIkpKc2J6UtFUkRw2QKA', '2021-12-08 06:50:23.503902');

-- --------------------------------------------------------

--
-- Table structure for table `gs1_application_identifiers`
--

CREATE TABLE `gs1_application_identifiers` (
  `id` smallint NOT NULL,
  `ai` varchar(15) DEFAULT NULL,
  `data_content` varchar(2000) DEFAULT NULL,
  `data_title` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `gs1_business_process`
--

CREATE TABLE `gs1_business_process` (
  `id` smallint NOT NULL,
  `business_process` varchar(100) DEFAULT NULL,
  `transaction_step` varchar(100) DEFAULT NULL,
  `buyer2seller` tinyint(1) DEFAULT '0',
  `seller2buyer` tinyint(1) DEFAULT '0',
  `api_name_url` varchar(2000) DEFAULT NULL,
  `api_staging_table` varchar(200) DEFAULT NULL COMMENT 'APINAME+YYYYMMDD+Holds JSON',
  `edi_fact` varchar(30) DEFAULT NULL,
  `transaction_code` varchar(5) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `gs1_company_gln_extensions`
--

CREATE TABLE `gs1_company_gln_extensions` (
  `id` smallint NOT NULL,
  `company_id` smallint DEFAULT NULL,
  `gln_contact_id` smallint DEFAULT NULL,
  `gln_loc_extension_type_id` smallint DEFAULT NULL COMMENT 'FK gln_location_types',
  `gln_extention` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'GLN extension component to distinguish unique sub-locations, e.g. bed bays, storage slots, door locations, bin storage, shelves, peg holes, rack, cabinet, computer/communication bays.',
  `gln_extension_activation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gln_extension_deactivation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `gs1_company_gln_extensions`
--

INSERT INTO `gs1_company_gln_extensions` (`id`, `company_id`, `gln_contact_id`, `gln_loc_extension_type_id`, `gln_extention`, `gln_extension_activation_date`, `gln_extension_deactivation_date`, `is_active`) VALUES
(1, NULL, 1, 1, '8906096622253_01', '2021-09-25 16:18:01', '2021-09-25 16:18:43', 1),
(2, NULL, 2, 1, '8054083999999_01', '2021-09-25 16:18:01', '2021-09-25 16:18:43', 1),
(3, NULL, 3, 1, '7897337700016_01', '2021-09-25 16:18:01', '2021-09-25 16:18:43', 1),
(6, NULL, 6, 1, '7640133680002_01', '2021-09-25 16:18:01', '2021-09-25 16:18:43', 1),
(7, NULL, 7, 1, '7601001000902_01', '2021-09-25 16:18:01', '2021-09-25 16:18:43', 1),
(8, NULL, 8, 1, '7601001002340_01', '2021-09-25 16:18:01', '2021-09-25 16:18:43', 1),
(9, NULL, 9, 1, '5012712000006_01', '2021-09-25 16:18:01', '2021-09-25 16:18:43', 1),
(10, NULL, 10, 1, '8637720000201_01', '2021-09-25 16:18:01', '2021-09-25 16:18:43', 1),
(11, NULL, 11, 1, '3596760000206_01', '2021-09-25 16:18:01', '2021-09-25 16:18:43', 1),
(12, NULL, 12, 1, '3807770000208_01', '2021-09-25 16:18:01', '2021-09-25 16:18:43', 1),
(13, NULL, 13, 1, '3807770011215_01', '2021-09-25 16:18:01', '2021-09-25 16:18:43', 1),
(14, NULL, 14, 1, '0095981000002_01', '2021-09-25 16:18:01', '2021-09-25 16:18:43', 1),
(15, NULL, 15, 1, '3499990002005_01', '2021-09-25 16:18:01', '2021-09-25 16:18:43', 1),
(16, NULL, 16, 1, '8907601990018_01', '2021-09-25 16:18:01', '2021-09-25 16:18:43', 1),
(17, NULL, 17, 1, '8906000990018_01', '2021-09-25 16:18:01', '2021-09-25 16:18:43', 1),
(18, NULL, 18, 1, '8906119222025_01', '2021-09-25 16:18:01', '2021-09-25 16:18:43', 1);

-- --------------------------------------------------------

--
-- Table structure for table `gs1_company_parent_gln`
--

CREATE TABLE `gs1_company_parent_gln` (
  `id` smallint NOT NULL,
  `company_id` smallint DEFAULT NULL,
  `gln_location_type` smallint DEFAULT '1',
  `parent_gln_contact_id` smallint DEFAULT NULL,
  `location_name` varchar(100) DEFAULT NULL,
  `source_system` varchar(100) DEFAULT NULL COMMENT 'created by system, urls',
  `location_activation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `gs1_company_prefix_epc` varchar(12) DEFAULT NULL COMMENT 'EPC Company Prefix must be between 6-12 characters',
  `global_location_no` varchar(14) DEFAULT NULL COMMENT 'GLN',
  `longitude` varchar(10) DEFAULT NULL,
  `latitude` varchar(10) DEFAULT NULL,
  `location_deactivation` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `gs1_company_parent_gln`
--

INSERT INTO `gs1_company_parent_gln` (`id`, `company_id`, `gln_location_type`, `parent_gln_contact_id`, `location_name`, `source_system`, `gs1_company_prefix_epc`, `global_location_no`, `longitude`, `latitude`, `location_deactivation`) VALUES
(1, 1, 1, 1, 'Taj Pharmaceuticals Ltd', 'FDA', '890609662', '8906096621253', '56.56 ', '48.96', '2028-09-23 16:36:00'),
(2, 2, 1, 2, 'AbbVie Srl Ltd', 'FDA', '805408301', '8054083999999', '57.56 ', '49.96', '2028-09-23 16:36:01'),
(3, 3, 1, 3, 'ORGANON FARMACEUTICA LTD', 'FDA', '789733771', '7897337700016', '58.56 ', '50.96', '2028-09-23 16:36:02'),
(6, 6, 1, 6, 'Cipla Pharmaceuticals Ltd', 'FDA', '764013368', '7640133680002', '61.56 ', '53.96', '2028-09-23 16:36:05'),
(7, 7, 1, 7, 'Janssen-Cilag AG', 'FDA', '768065173', '7601001000902', '62.56 ', '54.96', '2028-09-23 16:36:06'),
(8, 8, 1, 8, 'Sanofi-Aventis (Suisse) SA', 'FDA', '768066649', '7601001002340', '63.56 ', '55.96', '2028-09-23 16:36:07'),
(9, 9, 1, 9, 'BMS Pharmaceuticals Ltd', 'FDA', '501271200', '5012712000006', '64.56 ', '56.96', '2028-09-23 16:36:08'),
(10, 10, 1, 10, 'Pfizer Inc', 'FDA', '103040920', '1030409209871', '65.56 ', '57.96', '2028-09-23 16:36:09'),
(11, 11, 1, 11, 'Janssen Products LP', 'FDA', '359676000', '3596760000068', '66.56 ', '58.96', '2028-09-23 16:36:10'),
(12, 12, 1, 12, 'Moderna US, Inc', 'FDA', '380777000', '3807770000086', '67.56 ', '59.96', '2028-09-23 16:36:11'),
(13, 13, 1, 13, 'AstraZeneca', 'FDA', '665588965', '6655889656985', '68.56 ', '60.96', '2028-09-23 16:36:12'),
(14, 14, 1, 14, 'Janssen Pharmaceutical Inc', 'FDA', '959810000', '0095981000002', '69.56 ', '61.96', '2028-09-23 16:36:13'),
(15, 15, 1, 15, 'Lake Erie Medical DBA Quality Care Products LLC', 'FDA', '349999000', '349999000005', '70.56 ', '62.96', '2028-09-23 16:36:14'),
(16, 16, 1, 16, 'Elvia Care Pvt Ltd', 'FDA', '890760199', '8907601990018', '71.56 ', '63.96', '2028-09-23 16:36:15'),
(17, 17, 1, 17, 'Concept Biosciences Pvt Ltd', 'FDA', '890600099', '8906000990018', '72.56 ', '64.96', '2028-09-23 16:36:16'),
(18, 18, 1, 18, 'Ved Lifesavers Pvt Ltd', 'FDA', '890611922', '8906119220265', '73.56 ', '65.96', '2028-09-23 16:36:17');

-- --------------------------------------------------------

--
-- Table structure for table `gs1_country_code`
--

CREATE TABLE `gs1_country_code` (
  `id` smallint NOT NULL,
  `iso_country2_code` varchar(2) DEFAULT NULL COMMENT 'ISO Numeric 2 Country Code',
  `iso_country3_code` varchar(3) DEFAULT NULL COMMENT 'ISO Numeric 3 Country Code',
  `gs1_code` varchar(50) DEFAULT NULL COMMENT 'GS1 Country codes Range',
  `country_lat` varchar(12) DEFAULT NULL COMMENT 'Country Latitude:',
  `country_long` varchar(12) DEFAULT NULL COMMENT 'Country Longitude',
  `country_name` varchar(1000) DEFAULT NULL,
  `country_origin_prefix` varchar(3) DEFAULT NULL,
  `is_active` smallint DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `gs1_gln_contact`
--

CREATE TABLE `gs1_gln_contact` (
  `id` smallint NOT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_title` varchar(5) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `is_primary_contact` tinyint(1) NOT NULL DEFAULT '0',
  `user_telephone` varchar(14) DEFAULT NULL,
  `user_access_url` varchar(1000) DEFAULT NULL,
  `receive_alerts` smallint NOT NULL DEFAULT '0',
  `user_activation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_deactivation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_disabled_flag` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `gs1_gln_contact`
--

INSERT INTO `gs1_gln_contact` (`id`, `user_name`, `user_title`, `user_email`, `is_primary_contact`, `user_telephone`, `user_access_url`, `receive_alerts`, `user_activation_date`, `user_deactivation_date`, `user_disabled_flag`) VALUES
(1, 'Sudhir Kumar', 'Manag', 'sudhirkumar@taj.com', 1, '+91 8448 444 0', 'www.tajpharmaceuticals.com ', 1, '2021-09-25 13:42:48', '2021-09-25 15:48:08', 1),
(2, 'Jeorge', 'Manag', 'Jeorge@abbvie.com', 1, '39-06-928-921', 'www.abbvie.it ', 1, '2021-09-25 13:42:48', '2021-09-25 15:48:08', 1),
(3, 'Paul', 'Manag', 'paul@importgenius.com', 1, '+86-755-895175', 'www.importgenius.com', 1, '2021-09-25 13:42:48', '2021-09-25 15:48:08', 1),
(6, 'David', 'Manag', 'david@opencorporates', 1, '+41 32 729 85 ', 'www.opencorporates.com', 1, '2021-09-25 13:42:48', '2021-09-25 15:48:08', 1),
(7, 'George', 'Manag', 'jeorge@jansses', 1, '+41 58 231 34 ', 'www.janssen.com', 1, '2021-09-25 13:42:48', '2021-09-25 15:48:08', 1),
(8, 'Anna', 'Manag', 'anna@sanofiavents.com', 1, '41-584402100', 'www.sanofiaventis.ch', 1, '2021-09-25 13:42:48', '2021-09-25 15:48:08', 1),
(9, 'Tina', 'Manag', 'tina@bms.com', 1, '0800 731 1736', 'www.bms.com', 1, '2021-09-25 13:42:48', '2021-09-25 15:48:08', 1),
(10, 'Nora', 'Manag', 'nora@pfizer.com', 1, '(212) 733-2323', 'www.pfizer.com', 1, '2021-09-25 13:42:48', '2021-09-25 15:48:08', 1),
(11, 'Lina', 'Manag', 'lina@covid19vaccinejassen.com', 1, '01494 567 567', 'www.covid19vaccinejanssen.com', 1, '2021-09-25 13:42:48', '2021-09-25 15:48:08', 1),
(12, 'Chiv', 'Manag', 'chiv@modernatx.com', 1, '617-714-6500', 'www.modernatx.com', 1, '2021-09-25 13:42:48', '2021-09-25 15:48:08', 1),
(13, 'Sudhir ', 'Manag', 'sudhir@modernatx.com', 1, '617-714-6500', 'www.modernatx.com', 1, '2021-09-25 13:42:48', '2021-09-25 15:48:08', 1),
(14, 'Shan', 'Manag', 'shan@janssen.com', 1, '01494 567567', 'www.janssen.com ', 1, '2021-09-25 13:42:48', '2021-09-25 15:48:08', 1),
(15, 'Hannah', 'Manag', 'hannah@rxwiki.com', 1, '(877) 959-7550', 'www.rxwiki.com', 1, '2021-09-25 13:42:48', '2021-09-25 15:48:08', 1),
(16, 'Alex', 'Manag', 'alex@elvicare.com', 1, '+91 92155 2578', 'www.elviacare.in ', 1, '2021-09-25 13:42:48', '2021-09-25 15:48:08', 1),
(17, 'Rupal', 'Manag', 'NA', 1, '+91-7876759999', 'www.indiamart.com ', 1, '2021-09-25 13:42:48', '2021-09-25 15:48:08', 1),
(18, 'Jenny', 'Manag', 'NA', 1, '+91-8755733311', 'www.indiamart.com ', 1, '2021-09-25 13:42:48', '2021-09-25 15:48:08', 1);

-- --------------------------------------------------------

--
-- Table structure for table `gs1_gln_hierarchy_accounts`
--

CREATE TABLE `gs1_gln_hierarchy_accounts` (
  `id` smallint NOT NULL DEFAULT '0',
  `location_type` varchar(30) DEFAULT 'PHYSICAL' COMMENT 'physical or digital locations, legal entities, or functions',
  `gln_loc_type_id` smallint DEFAULT NULL COMMENT 'FK gln_location_types',
  `gln_extention` varchar(30) DEFAULT NULL COMMENT 'GLN extension component to distinguish unique sub-locations, e.g. bed bays, storage slots, door locations, bin storage, shelves, peg holes, rack, cabinet, computer/communication bays.',
  `parent_gln_id` smallint DEFAULT NULL COMMENT 'COmpany GLN Main',
  `ref_ai_gln` smallint DEFAULT NULL COMMENT 'FK gs1_application_identifiers, AI (410): Ship to-Deliver to GLN,AI (411): Bill to – Invoice to GLN',
  `child_gln` varchar(19) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `gs1_gln_location_types`
--

CREATE TABLE `gs1_gln_location_types` (
  `id` smallint NOT NULL,
  `gln_location_type` varchar(100) DEFAULT NULL COMMENT 'BILLED-TO, PAID-TO',
  `operational_type` smallint DEFAULT '1' COMMENT '1-Operational, 0-Legal',
  `location_type` smallint DEFAULT '1' COMMENT '1-Physical, 0-Digital',
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `gs1_gln_location_types`
--

INSERT INTO `gs1_gln_location_types` (`id`, `gln_location_type`, `operational_type`, `location_type`, `is_active`) VALUES
(1, 'Billed To', 0, 0, 0),
(2, 'Paid To', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `gs1_gln_make`
--

CREATE TABLE `gs1_gln_make` (
  `id` smallint NOT NULL,
  `gln` varchar(13) DEFAULT NULL,
  `gs1_company_prefix` varchar(6) DEFAULT NULL,
  `location_ref` varchar(6) DEFAULT NULL,
  `check_digit` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `gs1_gpc_bricks`
--

CREATE TABLE `gs1_gpc_bricks` (
  `id` smallint NOT NULL,
  `segment_code` varchar(15) DEFAULT NULL,
  `segment_description` varchar(100) DEFAULT NULL,
  `segment_definition` varchar(15) DEFAULT NULL,
  `family_code` varchar(15) DEFAULT NULL,
  `family_description` varchar(100) DEFAULT NULL,
  `family_definition` varchar(100) DEFAULT NULL,
  `class_code` varchar(20) DEFAULT NULL,
  `class_description` varchar(100) DEFAULT NULL,
  `class_definition` varchar(15) DEFAULT NULL,
  `brick_code` varchar(15) DEFAULT NULL,
  `brick_description` varchar(100) DEFAULT NULL,
  `brick_definition` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `gs1_gtin_indicator`
--

CREATE TABLE `gs1_gtin_indicator` (
  `id` smallint NOT NULL,
  `indicator` smallint DEFAULT NULL COMMENT 'Package Types',
  `description` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `gs1_gtin_make`
--

CREATE TABLE `gs1_gtin_make` (
  `id` smallint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `gs1_identification_keys`
--

CREATE TABLE `gs1_identification_keys` (
  `id` smallint NOT NULL,
  `key` varchar(100) DEFAULT NULL,
  `full_name` varchar(200) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `gs1_product_services_segments`
--

CREATE TABLE `gs1_product_services_segments` (
  `id` smallint NOT NULL,
  `segment_key` varchar(10) DEFAULT NULL COMMENT 'Product and Service Code',
  `segment_code` varchar(10) DEFAULT NULL COMMENT 'Ref GS1 classification segments-gpc-bricks',
  `segment_def` varchar(4000) DEFAULT NULL,
  `segment_other_name` varchar(500) DEFAULT NULL,
  `setment_title` varchar(500) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `gs1_trading_party_info`
--

CREATE TABLE `gs1_trading_party_info` (
  `id` smallint NOT NULL,
  `country_code_id` smallint DEFAULT NULL COMMENT 'FK GS1 Contry code',
  `key_licensee_gln` varchar(14) DEFAULT NULL COMMENT 'Assigned by your Country GS1, EPC Company Prefix',
  `company_name` varchar(100) DEFAULT NULL COMMENT 'Company Name,',
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `proviance` varchar(100) DEFAULT NULL,
  `company_prefix` varchar(14) DEFAULT NULL COMMENT 'GS1 Company code',
  `party_language` varchar(3) DEFAULT 'EN',
  `party_address_id` smallint DEFAULT NULL COMMENT 'FK List of addresses',
  `party_contact_id` smallint DEFAULT NULL COMMENT 'FK List of contacts',
  `information_shared_by_gln` varchar(14) DEFAULT NULL COMMENT 'Country GS1/ customer itself',
  `party_identification` varchar(50) DEFAULT NULL COMMENT 'Map Later, Information Provider,organisation Highest Level, content Owner',
  `party_capability` varchar(100) DEFAULT NULL COMMENT 'FK - Capability - Autherize, verify, pushData, pull,',
  `party_start_effective_datetime` timestamp NULL DEFAULT NULL,
  `party_end_effective_datetime` timestamp NULL DEFAULT NULL,
  `registration_datetime` timestamp NULL DEFAULT NULL,
  `tax_codes` varchar(100) DEFAULT NULL COMMENT 'VAT, GST, etc',
  `company_registration_no` varchar(100) DEFAULT NULL COMMENT 'Company House - optional',
  `party_type_code_id` smallint DEFAULT NULL COMMENT 'FK Company Role in Supplychain',
  `last_updated_date` timestamp NULL DEFAULT NULL,
  `tp_company_id` smallint DEFAULT NULL COMMENT 'FK',
  `parent_gln_id` smallint DEFAULT NULL COMMENT 'FK - to PK',
  `is_active` tinyint(1) DEFAULT '1' COMMENT 'default 1 active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Stand-in structure for view `gtin_lot_details`
-- (See below for the actual view)
--
CREATE TABLE `gtin_lot_details` (
`id` smallint unsigned
,`gtin` varchar(200)
,`product_name` varchar(100)
,`brand_name` varchar(50)
,`batch_no` varchar(25)
,`mfg_date` timestamp
,`expiry_date` timestamp
,`total_qty` int
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `gtin_lot_item_list`
-- (See below for the actual view)
--
CREATE TABLE `gtin_lot_item_list` (
`id` smallint unsigned
,`batch_no` varchar(25)
,`mfg_date` timestamp
,`expiry_date` timestamp
,`lot_qty` int
,`gtin` varchar(200)
,`product_id` smallint unsigned
,`product_name` varchar(100)
,`brand_name` varchar(50)
,`company_id` smallint
,`company_name` varchar(200)
,`company_gln` varchar(40)
,`company_address_id` smallint
,`item_list` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `gtin_lot_item_pack_type_summary`
-- (See below for the actual view)
--
CREATE TABLE `gtin_lot_item_pack_type_summary` (
`id` smallint unsigned
,`lot_id` smallint unsigned
,`product_id` smallint unsigned
,`gtin` varchar(200)
,`product_name` varchar(100)
,`brand_name` varchar(50)
,`batch_no` varchar(25)
,`mfg_date` timestamp
,`expiry_date` timestamp
,`lot_total_qty` int
,`package_sn` varchar(50)
,`is_active` tinyint
,`package_image` varchar(2000)
,`item_inner_count` varchar(50)
,`pack_type_id` smallint
,`item_pack_type` varchar(100)
,`company_name` varchar(200)
,`mfg_address` varchar(200)
,`company_gln` varchar(40)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `gtin_lot_summary`
-- (See below for the actual view)
--
CREATE TABLE `gtin_lot_summary` (
`id` smallint unsigned
,`batch_no` varchar(25)
,`mfg_date` timestamp
,`expiry_date` timestamp
,`lot_qty` int
,`is_active` smallint
,`gtin` varchar(200)
,`product_id` smallint unsigned
,`product_name` varchar(100)
,`brand_name` varchar(50)
,`company_id` smallint
,`company_name` varchar(200)
,`company_gln` varchar(40)
,`company_address_id` smallint
,`mfg_address` varchar(200)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `gtin_sscc_serial_number`
-- (See below for the actual view)
--
CREATE TABLE `gtin_sscc_serial_number` (
`gtin` varchar(200)
,`product_name` varchar(100)
,`batch_serial_no` varchar(25)
,`sscc_no` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `gtin_summary`
-- (See below for the actual view)
--
CREATE TABLE `gtin_summary` (
`id` smallint unsigned
,`gtin` varchar(200)
,`product_name` varchar(100)
,`brand_name` varchar(50)
,`labler_name` varchar(100)
,`strength` varchar(50)
,`product_form` varchar(10)
,`product_discription` varchar(100)
,`product_instruction` varchar(100)
,`product_image_url` varchar(1000)
,`product_ndc` varchar(20)
,`company_id` smallint
,`company_name` varchar(200)
,`company_gln` varchar(40)
,`company_code` varchar(10)
,`organization_category` varchar(30)
,`packing_type` varchar(100)
,`container_size` varchar(50)
,`container_qty` varchar(50)
,`pack_type_id` smallint
,`is_active` tinyint(1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `gtin_unit_serial_number`
-- (See below for the actual view)
--
CREATE TABLE `gtin_unit_serial_number` (
`gtin` varchar(200)
,`product_name` varchar(100)
,`batch_serial_no` varchar(25)
,`package_sn` varchar(50)
,`ineer_package_count` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `lkp_address_type`
--

CREATE TABLE `lkp_address_type` (
  `id` smallint NOT NULL,
  `address_code` varchar(20) DEFAULT NULL,
  `address_desc` varchar(1000) DEFAULT NULL COMMENT 'The type of address (i.e. source, destination, etc.)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `lkp_allowance_charge_type`
--

CREATE TABLE `lkp_allowance_charge_type` (
  `id` smallint NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `lkp_bar_code_type`
--

CREATE TABLE `lkp_bar_code_type` (
  `id` smallint NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `lkp_contact_type_code`
--

CREATE TABLE `lkp_contact_type_code` (
  `id` smallint NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `lkp_container_type`
--

CREATE TABLE `lkp_container_type` (
  `id` smallint NOT NULL,
  `container_type` varchar(30) NOT NULL,
  `description` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `lkp_countries`
--

CREATE TABLE `lkp_countries` (
  `id` smallint NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `alpha_2` char(2) DEFAULT NULL,
  `alpha_3` char(3) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `lkp_country_codes`
--

CREATE TABLE `lkp_country_codes` (
  `country_code` char(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `country_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `lkp_event_types`
--

CREATE TABLE `lkp_event_types` (
  `id` smallint NOT NULL,
  `event_actions` varchar(30) DEFAULT NULL,
  `event_desc` varchar(200) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `lkp_location_groups`
--

CREATE TABLE `lkp_location_groups` (
  `id` smallint NOT NULL,
  `location_group` varchar(100) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `is_group_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `lkp_location_type`
--

CREATE TABLE `lkp_location_type` (
  `id` smallint NOT NULL,
  `location_type` varchar(100) DEFAULT NULL COMMENT 'Company type + Location Type'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `lkp_location_type`
--

INSERT INTO `lkp_location_type` (`id`, `location_type`) VALUES
(1, 'Manufacturing'),
(2, 'Warehouse');

-- --------------------------------------------------------

--
-- Table structure for table `lkp_pallet_type`
--

CREATE TABLE `lkp_pallet_type` (
  `id` smallint NOT NULL,
  `pallet_type` varchar(30) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `lkp_party_capability_code`
--

CREATE TABLE `lkp_party_capability_code` (
  `id` smallint NOT NULL,
  `code_value` varchar(20) DEFAULT NULL,
  `code_definition` varchar(2000) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `lkp_party_topic_code`
--

CREATE TABLE `lkp_party_topic_code` (
  `id` smallint NOT NULL,
  `code_value` varchar(20) DEFAULT NULL,
  `code_name` varchar(20) DEFAULT NULL,
  `code_definition` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `lkp_product_code_standards`
--

CREATE TABLE `lkp_product_code_standards` (
  `id` smallint NOT NULL,
  `product_code_type` varchar(10) DEFAULT NULL COMMENT 'The type of product code (e.g. NDC, GTIN, DIN, etc.).',
  `product_code_desc` varchar(1000) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `lkp_response_status_code`
--

CREATE TABLE `lkp_response_status_code` (
  `id` smallint NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `lkp_serial_types`
--

CREATE TABLE `lkp_serial_types` (
  `id` smallint NOT NULL,
  `serial_type` varchar(20) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `lkp_tax_category_code`
--

CREATE TABLE `lkp_tax_category_code` (
  `id` smallint NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `lkp_temperature_unit_code`
--

CREATE TABLE `lkp_temperature_unit_code` (
  `id` smallint NOT NULL,
  `code` varchar(3) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `is_actvive` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `lkp_timezone`
--

CREATE TABLE `lkp_timezone` (
  `zone_id` int DEFAULT NULL,
  `abbreviation` varchar(6) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `time_start` decimal(11,0) NOT NULL,
  `gmt_offset` int NOT NULL,
  `dst` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `lkp_time_unit_code`
--

CREATE TABLE `lkp_time_unit_code` (
  `id` smallint NOT NULL,
  `code` char(3) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `lkp_transaction_codes`
--

CREATE TABLE `lkp_transaction_codes` (
  `id` smallint NOT NULL,
  `transaction_code` varchar(30) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `lkp_transport_mode`
--

CREATE TABLE `lkp_transport_mode` (
  `id` smallint NOT NULL,
  `trasnport_mode` varchar(30) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `lkp_weekend_day`
--

CREATE TABLE `lkp_weekend_day` (
  `id` smallint NOT NULL,
  `code` varchar(3) DEFAULT NULL,
  `weekend_day` varchar(12) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `lkp_zone`
--

CREATE TABLE `lkp_zone` (
  `zone_id` int NOT NULL,
  `country_code` char(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `zone_name` varchar(35) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Stand-in structure for view `location_summary`
-- (See below for the actual view)
--
CREATE TABLE `location_summary` (
`id` smallint unsigned
,`sscc_no` varchar(50)
,`package_sn` varchar(50)
,`package_pallet_sn` int
,`case_sn` int
,`event_type` varchar(50)
,`from_owner_id` smallint
,`to_owner_id` smallint
,`current_owner_id` smallint
,`current_owner_address_id` smallint
,`consigner` varchar(200)
,`consigner_gln` varchar(40)
,`consignee` varchar(200)
,`consignee_gln` varchar(40)
,`consigner_address` varchar(200)
,`consignee_address` varchar(200)
,`lsp_name` varchar(200)
,`current_owner` varchar(200)
,`current_company_gln` varchar(40)
,`street_address1` varchar(200)
,`entry_lat` varchar(50)
,`entry_long` varchar(50)
,`exit_latitude` varchar(50)
,`exit_long` varchar(50)
,`current_lat` varchar(15)
,`current_long` varchar(15)
,`current_location` varchar(250)
,`entry_point_gln` varchar(40)
,`exit_point_gln` varchar(19)
,`geo_last_rec_timestamp` timestamp
,`event_id` smallint unsigned
,`tranc_date_time` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `loc_sum`
-- (See below for the actual view)
--
CREATE TABLE `loc_sum` (
`id` smallint unsigned
,`product_id` smallint unsigned
,`pallet_id` smallint unsigned
,`case_id` smallint unsigned
,`primary_pack_id` smallint unsigned
,`lot_id` smallint unsigned
,`iot_tracking_id` smallint
,`from_owner_id` smallint
,`to_owner_id` smallint
,`lsp_provider_id` smallint
,`from_address_id` smallint
,`to_address_id` smallint
,`lsp_address_id` smallint
,`location_id` smallint unsigned
,`owner_id` smallint unsigned
,`sscc_no` varchar(50)
,`GRAI` varchar(50)
,`GIAI` varchar(50)
,`consigner` varchar(50)
,`lsp_provider` varchar(100)
,`consignee` varchar(50)
,`sender_location` varchar(100)
,`sender_loc_gln` varchar(15)
,`dispatch_location` varchar(100)
,`dispatch_loc_gln` varchar(15)
,`container_dimensions` varchar(50)
,`package_dimentions` varchar(100)
,`package_net_weight` varchar(50)
,`package_gross_weight` varchar(50)
,`purchase_order` varchar(20)
,`order_qty` varchar(20)
,`sale_order` varchar(20)
,`package_type` varchar(20)
,`package_inside_units` int unsigned
,`package_inside_salable_units` varchar(20)
,`delivary_date` varchar(50)
,`invoice_no` varchar(11)
,`packaging_time` datetime
,`order_status` varchar(30)
,`recall` varchar(50)
,`entry_lat` varchar(50)
,`entry_long` varchar(50)
,`exit_latitude` varchar(50)
,`exit_long` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `mt_access_level`
--

CREATE TABLE `mt_access_level` (
  `id` smallint NOT NULL,
  `access_level` smallint DEFAULT NULL COMMENT 'FK - user Roles',
  `access_details` varchar(200) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `mt_access_policies`
--

CREATE TABLE `mt_access_policies` (
  `id` smallint NOT NULL,
  `access_policy` varchar(100) DEFAULT NULL,
  `work_centre_code` varchar(100) DEFAULT NULL COMMENT 'On the same page Admin and user will have different editable items',
  `access_role_id` smallint DEFAULT NULL COMMENT 'mt_user_roles',
  `modules` varchar(100) DEFAULT NULL COMMENT 'Main Menu Tabs',
  `page_layout_url` varchar(2000) DEFAULT NULL COMMENT 'FK Define Later',
  `page_elements_id` varchar(2000) DEFAULT NULL COMMENT 'FK Define LaterElements attached to this policy - Read/EDIT',
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `mt_address`
--

CREATE TABLE `mt_address` (
  `id` smallint NOT NULL,
  `company_id` smallint DEFAULT NULL,
  `gln_extension_id` smallint DEFAULT NULL,
  `latitude` varchar(50) NOT NULL DEFAULT '55.23',
  `longitude` varchar(50) NOT NULL DEFAULT '23.56',
  `name` varchar(100) DEFAULT NULL,
  `street_address1` varchar(200) DEFAULT NULL,
  `street_address2` varchar(200) DEFAULT NULL,
  `cross_street` varchar(200) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `city_code` varchar(30) DEFAULT NULL,
  `party_currency` varchar(20) DEFAULT NULL,
  `language` varchar(2) DEFAULT 'EN',
  `po_box_no` varchar(20) DEFAULT NULL,
  `country_code` varchar(10) DEFAULT NULL COMMENT 'GS1-Country code ref',
  `postal_code` varchar(10) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `province_code` varchar(20) DEFAULT NULL,
  `contact_telehone` varchar(15) DEFAULT NULL COMMENT 'Contact person',
  `website` varchar(200) DEFAULT NULL COMMENT 'Website',
  `created_date` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `mt_address`
--

INSERT INTO `mt_address` (`id`, `company_id`, `gln_extension_id`, `latitude`, `longitude`, `name`, `street_address1`, `street_address2`, `cross_street`, `city`, `city_code`, `party_currency`, `language`, `po_box_no`, `country_code`, `postal_code`, `state`, `province_code`, `contact_telehone`, `website`, `created_date`, `is_active`) VALUES
(1, 1, NULL, '19.076090', '72.877426', 'Taj Pharmaceuticals Ltd', '904,9TH FLOOR, CRESESNT, Mumbai,Maharashtra,400059', '904,9TH FLOOR, CRESESNT, Mumbai,Maharashtra,400059', 'Cross_street', 'Mumbai', '400059', 'Rupees', 'En', '400059', '91', '400059', 'Maharastra', '5698745', '+91 8448 444 09', 'www.tajpharmaceuticals.com', '2021-09-24 00:00:00', 1),
(2, 2, NULL, '41.5525788', '12.7044265', 'AbbVie Srl Ltd', 'Strada Regionale Pontina Km 52,Aprilia,Italy,04011', 'Strada Regionale Pontina Km 52,Aprilia,Italy,04011', 'Cross_street', 'Aprilia', '04011', 'Euro', 'It', '04011', '+39', '00118', 'Italy', '2457124', '39-06-928-921', 'www.abbvie.it', '2021-09-24 00:00:00', 1),
(3, 3, NULL, '-23.6196909', '-46.6980276', 'ORGANON FARMACEUTICA LTD', 'Dr Chucri Zaidan, Sao Paulo,Brazil-04583110', 'Dr Chucri Zaidan, Sao Paulo,Brazil-04583110', 'Cross_street', 'Sao Paulo', '04583110', 'Brazilian real', 'Po', '04583110', '+55', '1800', 'sao Paulo', '457815', '+86-755-895175', 'www.importgenius.com', '2021-09-24 00:00:00', 1),
(6, 6, NULL, '46.9425395', '6.8251172', 'Celgene International Ltd', 'Route de Perreux 1,Boudry,Switzerland-2017', 'Route de Perreux 1,Boudry,Switzerland-2017', 'Cross_street', 'Boundry', '8124', 'swiss frac', 'Ge', '2017', '+41', '8124', 'Boudry', '78121', '+41 32 729 85 0', 'www.opencorporates.com', '2021-09-24 00:00:00', 1),
(7, 7, NULL, '55.23', '23.56', 'Janssen-Cilag AG', 'Gubelstrasse 34,Zug,Switzerland - 6300', 'Gubelstrasse 34,Zug,Switzerland - 6300', 'Cross_street', 'Zug', '6300', 'swiss frac', 'Ge', '2017', '+41', '6300', 'Zug', '65554', '+41 58 231 34 3', 'www.janssen.com', '2021-09-24 00:00:00', 1),
(8, 8, NULL, '46.2168744', '6.0828042', 'Sanofi-Aventis (Suisse) SA', 'Route de Montfleury 3,Vernier,Switzerland', 'Route de Montfleury 3,Vernier,Switzerland', 'Cross_street', 'Vernier', '1214', 'swiss frac', 'Ge', '2017', '+41', '1214', 'Vernier', '354544', '41-584402100', 'www.sanofiaventis.ch', '2021-09-24 00:00:00', 1),
(9, 9, NULL, '51.5557403', '-0.4799918', 'BMS Pharmaceuticals Ltd', 'Bristol Myers Squibb House,Uxbridge,UK - UB8 1DH', 'Bristol Myers Squibb House,Uxbridge,UK - UB8 1DH', 'Cross_street', 'Uxbridge', '?01895', 'Pounds', 'En', 'UB8 1DH', '+44', 'UB8 1DH', 'London', '4784558', '?0800 731 1736', 'www.bms.com', '2021-09-24 00:00:00', 1),
(10, 10, NULL, '55.23', '23.56', 'Pfizer Inc', '100 US-206,Gladstone,USA-07934', '100 US-206,Gladstone,USA-07934', 'Cross_street', 'Gladstone', '07934', 'Dollar', 'En', '07934', '+1', '7934', 'Oregon', '234354', '(212) 733-2323', 'www.pfizer.com', '2021-09-24 00:00:00', 1),
(11, 11, NULL, '40.5408968', '-74.4699756', 'Janssen Products LP', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '425 HOES LN,PISCATAWAY,USA - 08854-4103', 'Cross_street', 'Piscataway', '4103', 'Dollar', 'En', '4103', '088', '4103', 'New jersey', '3646355', '01494 567 567', 'www.covid19vaccinejanssen.com', '2021-09-24 00:00:00', 1),
(12, 12, NULL, '42.3633316', '-71.090694', 'Moderna US, Inc', '200 Technology Sq,Cambridge,USA-02139', '200 Technology Sq,Cambridge,USA-02139', 'Cross_street', 'Cambridge', '02139', 'Dollar', 'En', '02139', '088', 'NA', 'NA', '7523355', '617-714-6500', 'www.modernatx.com', '2021-09-24 00:00:00', 1),
(13, 13, NULL, '42.3633316', '-71.090694', 'AstraZeneca', '200 Technology Sq,Cambridge,USA-02139', '200 Technology Sq,Cambridge,USA-02139', 'Cross_street', 'Cambridge', '02139', 'Dollar', 'En', '02139', '088', 'NA', 'NA', '7523355', '617-714-6500', 'www.modernatx.com', '2021-09-24 00:00:00', 1),
(14, NULL, 14, '55.23', '23.56', 'Janssen Pharmaceutical Inc', '1125 BEAR TAVERN RD,TITUSVILLE,USA-08560-1499', '1125 BEAR TAVERN RD,TITUSVILLE,USA-08560-1499', 'Cross_street', 'Titusville', '1499', 'Dollar', 'En', '1499', '321', '32780', 'Florida', '5453453', '01494 567567', 'www.janssen.com', '2021-09-24 00:00:00', 1),
(15, NULL, 15, '55.23', '23.56', 'Lake Erie Medical DBA Quality Care Products LLC', '6920 HALL ST,Holland - 43528-9485', '6920 HALL ST,Holland - 43528-9485', 'Cross_street', 'Holland', '9485', 'Dollar', 'En', '9485', '+31', '49422', 'Mechigan', '895525', '?(877) 959-7550', 'www.rxwiki.com', '2021-09-24 00:00:00', 1),
(16, NULL, 16, '55.23', '23.56', 'Elvia Care Pvt Ltd', 'SCO 53, Tau Devilal Huda Sub Centre,Haryana - 135001', 'SCO 53, Tau Devilal Huda Sub Centre,Haryana - 135001', 'Cross_street', 'Haryana', '135001', 'Rupees', 'Hi', '135001', '+91', '133001', 'Chandigarh', '3647514', '+91 92155 25785', 'www.elviacare.in', '2021-09-24 00:00:00', 1),
(17, NULL, 17, '55.23', '23.56', 'Concept Biosciences Pvt Ltd', '1 AJC Bose Road, 3rd Floor,Kolkata-700020', '1 AJC Bose Road, 3rd Floor,Kolkata-700020', 'Cross_street', 'Kolkata', '700020', 'Rupees', 'Hi', '700020', '+91', '700020', 'West bengal', '3455254', '?+91-7876759999', 'www.indiamart.com', '2021-09-24 00:00:00', 1),
(18, NULL, 18, '55.23', '23.56', 'Ved Lifesavers Pvt Ltd', 'A3, SIE, Rampur,Uttarakhand - 248197', 'A3, SIE, Rampur,Uttarakhand - 248197', 'Cross_street', 'Rampur', '248197', 'Rupees', 'Hi', '248197', '+91', '248197', 'Uttarakhand', '254554', '?+91-8755733311', 'www.indiamart.com', '2021-09-24 00:00:00', 1),
(19, 20, NULL, '51.509865', '-0.118092', 'Firstline Pharma Distributors', 'Ravalco House, Cleveland Way, Hemel Hempstead HP2 7DL,UK', 'Ravalco House, Cleveland Way, Hemel Hempstead HP2 7DL,UK', 'Ravalco House, Cleveland Way', 'Hemel Hempstead', 'HP2 7DL', 'Pounds', 'En', 'HP2 7DL', 'UK', '', 'Hemel Hempstead', '', '+44558963256', 'www.firstlinepharma.com', '2021-10-14 10:58:00', 1),
(20, 21, NULL, '86.66', '36.98', 'DHL Logistics', 'Chakala, Andheri East, Mumbai, Maharashtra,India 400099', 'Chakala, Andheri East, Mumbai, Maharashtra,India 400099', 'Chakala, Andheri East', 'Mumbai', '400099', 'Rupees', 'En', '400099', '+91', '400099', 'Maharashtra', '', '9912361520', 'www.dhl.com', '2021-10-14 11:03:00', 1),
(21, 23, NULL, '24.23', '52.36', 'FeDex Logistics', 'Express House Atherstone, CV9 2RY United Kingdom', 'Express House Atherstone, CV9 2RY United Kingdom', '', '', '', '', '', '', '', '', '', '', '', '', '2021-10-14 14:52:00', 1),
(22, 22, NULL, '17.123184', '79.208824', 'Appolo Pharmacy', 'VST Colony, Hyderabad, Telangana 500082', 'VST Colony, Hyderabad, Telangana 500082', '', '', '', '', '', '', '', '', '', '', '', '', '2021-10-14 14:54:00', 1),
(23, 27, NULL, '51.6670068', '-0.3947776', '', 'Unit 1 Colonial Way, Watford, WD24 4YR, Uk', 'UNIT 1 COLONIAL WAY, WATFORD, WD24 4YR, Uk', '', '', '', '', '', '', '', '', '', '8778', '800-779-3784', 'www.sigmapharmactical.com', '2021-11-05 16:24:00', 1),
(24, 28, NULL, '52.1938656', '0.9905727', '0.988384', 'Violet Hill House, Violet Hill Road, Stow Market, IP14 1NL, UK', 'VIOLET HILL HOUSE, VIOLET HILL ROAD, STOWMARKET, IP14 1NL, UK', '', '', '', '', '', '', '', '', '', '8778', '800-779-3784', 'www.stowhealth.com', '2021-11-05 16:24:00', 1),
(25, 29, NULL, '52.7364272', '-2.7223277', '', 'Unit 15 Sundorne Trade Park, Featherbed Lane, Shrewsbury, SY1 4YQ, UK', 'UNIT 15 SUNDORNE TRADE PARK, FEATHERBED LANE, SHREWSBURY, SY1 4YQ, UNITED KINGDOM', '', '', '', '', '', '', '', '', '', '8778', '800-779-3784', 'www.medgas.com', '2021-11-05 16:24:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mt_company`
--

CREATE TABLE `mt_company` (
  `id` smallint NOT NULL,
  `company_category_id` smallint UNSIGNED DEFAULT NULL COMMENT 'FK company',
  `company_contact_id` smallint DEFAULT NULL,
  `company_name` varchar(200) DEFAULT NULL,
  `registration_no` varchar(100) DEFAULT NULL,
  `website` varchar(200) DEFAULT NULL,
  `company_logo` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'Logo',
  `taxcode` varchar(40) DEFAULT NULL,
  `gs1_company_prefix` varchar(10) DEFAULT NULL,
  `company_gln` varchar(40) DEFAULT NULL,
  `gln_activation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gln_deactivation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `mt_company`
--

INSERT INTO `mt_company` (`id`, `company_category_id`, `company_contact_id`, `company_name`, `registration_no`, `website`, `company_logo`, `taxcode`, `gs1_company_prefix`, `company_gln`, `gln_activation_date`, `gln_deactivation_date`, `is_active`) VALUES
(1, 1, 1, 'Taj Pharmaceuticals Ltd', '219226', 'www.tajpharmaceuticals.com', 'null', '149424', '890609662', '890609662253', '2021-09-25 16:23:06', '2021-09-25 16:23:06', 1),
(2, 1, 2, 'AbbVie Srl Ltd', '8004972', 'www.abbvie.it', 'null', '368984', '805408301', '8054083999999', '2021-09-25 16:23:06', '2021-09-25 16:23:06', 1),
(3, 1, 3, 'ORGANON FARMACEUTICA LTD', '00820771', 'www.importgenius.com', 'null', '234578', '789733771', '7897337700016', '2021-09-25 16:23:06', '2021-09-25 16:23:06', 1),
(6, 1, 6, 'Celgene International Ltd', '730886', 'www.opencorporates.com', 'null', '654258', '764013368', '7640133680002', '2021-09-25 16:23:06', '2021-09-25 16:23:06', 1),
(7, 1, 7, 'Janssen-Cilag AG', '346973', 'www.janssen.com', 'null', '369258', '768065173', '7601001000902', '2021-09-25 16:23:06', '2021-09-25 16:23:06', 1),
(8, 1, 8, 'Sanofi-Aventis (Suisse) SA', '466797', 'www.sanofiaventis.ch', 'null', '147258', '768066649', '7601001002340', '2021-09-25 16:23:06', '2021-09-25 16:23:06', 1),
(9, 1, 9, 'BMS Pharmaceuticals Ltd', '02487574', 'www.bms.com', 'null', '963852', '501271200', '5012712000006', '2021-09-25 16:23:06', '2021-09-25 16:23:06', 1),
(10, 1, 10, 'Pfizer Inc', '3932037', 'www.pfizer.com', 'null', '852741', '103040920', '863772000001', '2021-09-25 16:23:06', '2021-09-25 16:23:06', 1),
(11, 1, 11, 'Janssen Products LP', '1290895', 'www.covid19vaccinejanssen.com', 'null', '963741', '359676000', '359676000006', '2021-09-25 16:23:06', '2021-09-25 16:23:06', 1),
(12, 1, 12, 'Moderna US, Inc', '001-38753', 'www.modernatx.com', 'null', '369147', '380777000', '380777000008', '2021-09-25 16:23:06', '2021-09-25 16:23:06', 1),
(13, 1, 13, 'AstraZeneca', '2723534', 'www.astrazeneca.co.uk', 'null', '854678', '563214589', '5632145890236', '2021-09-25 16:23:06', '2021-09-25 16:23:06', 1),
(14, 1, 14, 'Janssen Pharmaceutical Inc', 'IE572261', 'www.janssen.com', 'null', '234578', '959810000', '0095981000002', '2021-09-25 16:23:06', '2021-09-25 16:23:06', 1),
(15, 1, 15, 'Lake Erie Medical DBA Quality Care Products LLC', 'ASDRE345', 'www.rxwiki.com', 'null', '235689', '349999000', '349999000005', '2021-09-25 16:23:06', '2021-09-25 16:23:06', 1),
(16, 1, 16, 'Elvia Care Pvt Ltd', '47260', 'www.elviacare.in', 'null', '461379', '890760199', '8907601990018', '2021-09-25 16:23:06', '2021-09-25 16:23:06', 1),
(17, 1, 17, 'Concept Biosciences Pvt Ltd', '127172', 'www.conceptbioscience.com', 'null', '629584', '890600099', '8906000990018', '2021-09-25 16:23:06', '2021-09-25 16:23:06', 1),
(18, 1, 18, 'Ved Lifesavers Pvt Ltd', '33571', 'www.indiamart.com', 'null', '849562', '890611922', '890611922025', '2021-09-25 16:23:06', '2021-09-25 16:23:06', 1),
(20, 3, 2, 'Firstline Pharma Distibutors', '526958742', 'www.firstlinepharma.com', 'NA', '58742', '69856325', '6985632589654', '2021-01-11 22:01:00', '2025-10-11 22:01:00', 1),
(21, 4, 3, 'DHL Logistics', '4523698547', 'www.dhllogistics.com', 'NA', '9854745', '63258965', '6325896546985', '2021-10-05 22:08:00', '2025-06-11 22:09:00', 1),
(22, 5, 3, 'Apollo Pharmacy', '256987458', 'www.appollopharmacy.com', 'NA', '987458', '63060966', '630609662225', '2021-01-04 13:21:00', '2025-10-14 13:21:00', 1),
(23, 4, 6, 'FeDex Logistics', '96854785', 'www.fedexlogistics.com', 'NA', '54785', '56323896', '5632389669854', '2021-01-05 13:24:00', '2025-10-12 13:24:00', 1),
(24, 3, 1, 'Alfresa Holdings', 'SD572211', 'www.alfresaholdings.com', 'NA', '587459', '66323096', '6632309669854', '2021-11-05 16:05:00', '2025-10-14 16:05:00', 1),
(25, 3, 1, 'Cardinal Health', 'WQ572000', 'www.cardinalhealth.com', 'NA', '587126', '88323096', '8832309669854', '2021-11-05 16:05:00', '2025-10-14 16:05:00', 1),
(26, 3, 1, 'Anda Inc', 'RF576666', 'www.anda.com', 'NA', '587126', '77323096', '7732309669854', '2021-11-05 16:05:00', '2025-10-14 16:05:00', 1),
(27, 3, 1, 'SIGMA PHARMACEUTICALS PLC', 'WDA(H) 8778', 'www.sigmapharmaciticals.com', 'NA', '599126', '66322296', '6632229669854', '2021-11-05 16:05:00', '2025-10-14 16:05:00', 1),
(28, 3, 1, 'Stow Health', 'WDA(H) 42492', 'www.stowhealth.com', 'NA', '599155', '96322296', '9632229669854', '2021-11-05 16:05:00', '2025-10-14 16:05:00', 1),
(29, 3, 1, 'Medgas Ltd', 'WDA(H) 52668', 'www.medgas.com', 'NA', '299155', '26322296', '2632229669854', '2021-11-05 16:05:00', '2025-10-14 16:05:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mt_company_contact`
--

CREATE TABLE `mt_company_contact` (
  `id` smallint NOT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_title` varchar(5) DEFAULT NULL,
  `contact_role` varchar(50) DEFAULT NULL,
  `contact_department` varchar(50) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `is_primary_contact` tinyint(1) NOT NULL DEFAULT '0',
  `user_telephone` varchar(14) DEFAULT NULL,
  `user_access_url` varchar(1000) DEFAULT NULL,
  `receive_alerts` smallint NOT NULL DEFAULT '0',
  `user_activation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_deactivation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_disabled_flag` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `mt_company_contact`
--

INSERT INTO `mt_company_contact` (`id`, `user_name`, `user_title`, `contact_role`, `contact_department`, `user_email`, `is_primary_contact`, `user_telephone`, `user_access_url`, `receive_alerts`, `user_activation_date`, `user_deactivation_date`, `user_disabled_flag`) VALUES
(1, 'Sudhir Kumar', 'Manag', NULL, NULL, 'sudhirkumar@taj.com', 1, '+91 8448 444 0', 'www.tajpharmaceuticals.com ', 1, '2021-09-25 13:42:48', '2021-09-25 15:48:08', 1),
(2, 'Jeorge', 'Manag', NULL, NULL, 'Jeorge@abbvie.com', 1, '39-06-928-921', 'www.abbvie.it ', 1, '2021-09-25 13:42:48', '2021-09-25 15:48:08', 1),
(3, 'Paul', 'Manag', NULL, NULL, 'paul@importgenius.com', 1, '+86-755-895175', 'www.importgenius.com', 1, '2021-09-25 13:42:48', '2021-09-25 15:48:08', 1),
(6, 'David', 'Manag', NULL, NULL, 'david@opencorporates', 1, '+41 32 729 85 ', 'www.opencorporates.com', 1, '2021-09-25 13:42:48', '2021-09-25 15:48:08', 1),
(7, 'George', 'Manag', NULL, NULL, 'jeorge@jansses', 1, '+41 58 231 34 ', 'www.janssen.com', 1, '2021-09-25 13:42:48', '2021-09-25 15:48:08', 1),
(8, 'Anna', 'Manag', NULL, NULL, 'anna@sanofiavents.com', 1, '41-584402100', 'www.sanofiaventis.ch', 1, '2021-09-25 13:42:48', '2021-09-25 15:48:08', 1),
(9, 'Tina', 'Manag', NULL, NULL, 'tina@bms.com', 1, '0800 731 1736', 'www.bms.com', 1, '2021-09-25 13:42:48', '2021-09-25 15:48:08', 1),
(10, 'Nora', 'Manag', NULL, NULL, 'nora@pfizer.com', 1, '(212) 733-2323', 'www.pfizer.com', 1, '2021-09-25 13:42:48', '2021-09-25 15:48:08', 1),
(11, 'Lina', 'Manag', NULL, NULL, 'lina@covid19vaccinejassen.com', 1, '01494 567 567', 'www.covid19vaccinejanssen.com', 1, '2021-09-25 13:42:48', '2021-09-25 15:48:08', 1),
(12, 'Chiv', 'Manag', NULL, NULL, 'chiv@modernatx.com', 1, '617-714-6500', 'www.modernatx.com', 1, '2021-09-25 13:42:48', '2021-09-25 15:48:08', 1),
(13, 'Sudhir ', 'Manag', NULL, NULL, 'sudhir@modernatx.com', 1, '617-714-6500', 'www.modernatx.com', 1, '2021-09-25 13:42:48', '2021-09-25 15:48:08', 1),
(14, 'Shan', 'Manag', NULL, NULL, 'shan@janssen.com', 1, '01494 567567', 'www.janssen.com ', 1, '2021-09-25 13:42:48', '2021-09-25 15:48:08', 1),
(15, 'Hannah', 'Manag', NULL, NULL, 'hannah@rxwiki.com', 1, '(877) 959-7550', 'www.rxwiki.com', 1, '2021-09-25 13:42:48', '2021-09-25 15:48:08', 1),
(16, 'Alex', 'Manag', NULL, NULL, 'alex@elvicare.com', 1, '+91 92155 2578', 'www.elviacare.in ', 1, '2021-09-25 13:42:48', '2021-09-25 15:48:08', 1),
(17, 'Rupal', 'Manag', NULL, NULL, 'NA', 1, '+91-7876759999', 'www.indiamart.com ', 1, '2021-09-25 13:42:48', '2021-09-25 15:48:08', 1),
(18, 'Jenny', 'Manag', NULL, NULL, 'NA', 1, '+91-8755733311', 'www.indiamart.com ', 1, '2021-09-25 13:42:48', '2021-09-25 15:48:08', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mt_container`
--

CREATE TABLE `mt_container` (
  `id` int NOT NULL,
  `container_height` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `container_width` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `container_length` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `container_weight` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mt_container_dimensions`
--

CREATE TABLE `mt_container_dimensions` (
  `id` int NOT NULL,
  `container_height` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `container_depth` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `container_width` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `container_weight` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mt_controlled_conditions`
--

CREATE TABLE `mt_controlled_conditions` (
  `id` smallint NOT NULL,
  `product_id` smallint DEFAULT NULL COMMENT 'FK company',
  `minimum_temperature` smallint DEFAULT NULL,
  `maximum_temperature` varchar(200) DEFAULT NULL,
  `humidity` varchar(100) DEFAULT NULL,
  `vibration` varchar(200) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `mt_document_type`
--

CREATE TABLE `mt_document_type` (
  `id` smallint NOT NULL,
  `docuemnt_type` varchar(50) DEFAULT NULL,
  `doc_description` varchar(2000) DEFAULT NULL COMMENT 'Type of document (e.g. Invoice Number, Shipping Number, Work Order, etc.)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `mt_dosage_form`
--

CREATE TABLE `mt_dosage_form` (
  `id` smallint NOT NULL,
  `dosage_form_code` varchar(2) DEFAULT NULL,
  `dosage_form_desc` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `mt_event_transaction_type`
--

CREATE TABLE `mt_event_transaction_type` (
  `id` smallint UNSIGNED NOT NULL,
  `event_type` varchar(50) NOT NULL,
  `is_active` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `mt_event_transaction_type`
--

INSERT INTO `mt_event_transaction_type` (`id`, `event_type`, `is_active`) VALUES
(1, 'Advanced Shipping Notice', 1),
(2, 'In Transit', 1),
(3, 'Delivered', 1),
(4, 'Dispatched', 1),
(5, 'Packaging', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mt_label_print_format`
--

CREATE TABLE `mt_label_print_format` (
  `id` smallint NOT NULL,
  `label_print_format` varchar(20) DEFAULT NULL,
  `format_desc` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `mt_license_types`
--

CREATE TABLE `mt_license_types` (
  `id` smallint NOT NULL,
  `license_type` varchar(100) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `mt_net_content_unit`
--

CREATE TABLE `mt_net_content_unit` (
  `id` smallint NOT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `net_content` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `mt_organization_category`
--

CREATE TABLE `mt_organization_category` (
  `id` smallint UNSIGNED NOT NULL,
  `organization_category` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `mt_organization_category`
--

INSERT INTO `mt_organization_category` (`id`, `organization_category`, `description`, `is_active`) VALUES
(1, 'Manufacturer', 'Manufacturer Company', 1),
(2, 'Wholesaler', 'Wholesaler Company', 1),
(3, 'Distributor', 'Distributor Company', 1),
(4, 'Logistics Service Provider', 'Logistics Service Provider Company', 1),
(5, 'Retailer', 'Retailer Company', 1),
(6, 'TracePharm', 'TracePharm', 1),
(56, '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mt_owner`
--

CREATE TABLE `mt_owner` (
  `id` smallint NOT NULL,
  `serial_number` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `product_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `owner_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `owner_gln` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `owner_address` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `event_time` timestamp NULL DEFAULT NULL,
  `recorded_time` timestamp NULL DEFAULT NULL,
  `previous_owner` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `previous_owner_recorded_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mt_packaging_dimensions`
--

CREATE TABLE `mt_packaging_dimensions` (
  `id` smallint NOT NULL,
  `height` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `width` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `length` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pallet_weight` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pallet_created_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mt_permissions`
--

CREATE TABLE `mt_permissions` (
  `id` smallint NOT NULL,
  `permission_name` varchar(100) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `license_id` smallint DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `mt_product_category`
--

CREATE TABLE `mt_product_category` (
  `id` smallint NOT NULL,
  `product_category` varchar(20) NOT NULL,
  `prodct_code_desc` varchar(2000) DEFAULT NULL COMMENT 'The type of product code (e.g. NDC, GTIN, DIN, etc.)',
  `product_gpc_id` smallint DEFAULT NULL COMMENT 'GPC Family Code Optional'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `mt_product_gtin`
--

CREATE TABLE `mt_product_gtin` (
  `id` smallint UNSIGNED NOT NULL,
  `company_id` smallint DEFAULT NULL,
  `address_id` smallint DEFAULT NULL,
  `gtin` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'GTIN',
  `product_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `brand_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `labler_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `strength` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `product_form` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'Tablet',
  `product_discription` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `patient_instruction` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'prescription Required',
  `product_image_url` varchar(1000) DEFAULT NULL COMMENT 'Store on S3 Bucket',
  `source_system` varchar(20) DEFAULT NULL,
  `product_ndc` varchar(20) DEFAULT NULL,
  `created_datetime` timestamp NULL DEFAULT NULL,
  `activation_date` date DEFAULT NULL,
  `deactivation_date` date DEFAULT NULL,
  `last_updated_datetime` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `mt_product_gtin`
--

INSERT INTO `mt_product_gtin` (`id`, `company_id`, `address_id`, `gtin`, `product_name`, `brand_name`, `labler_name`, `strength`, `product_form`, `product_discription`, `patient_instruction`, `product_image_url`, `source_system`, `product_ndc`, `created_datetime`, `activation_date`, `deactivation_date`, `last_updated_datetime`, `is_active`) VALUES
(1, 1, 1, '08906096620196', 'Azithromycin (500mg)', 'Azax 500 Tablet', 'Azax 500 Tablet', '500 mg', 'Tablet', 'Bacterial infections', 'Prescription Required', 'download_18_RXDw30m.jpg', 'FDA', '0002-0800', '2021-09-04 00:00:00', '2021-09-04', '2025-09-04', '2021-09-15 00:00:00', 1),
(2, 2, 2, '08054083010038', 'Humira', 'Adalimumab', 'Adalimumab', '25 mg', 'Tablet', 'Hypertension (high blood pressure),Edema,Low potassium,Heart failure', 'Prescription Required', 'download_5.jpg', 'FDA', '0002-1200', '2020-09-04 00:00:00', '2020-10-04', '2025-10-04', '2021-09-16 00:00:00', 1),
(3, 3, 3, '07897337713818', 'Keytruda', 'Pembrolizumab', 'Pembrolizumab', '25 mg/ml', 'Injection', 'Prevention of heart attack and stroke', 'Prescription Required', 'download_6.jpg', 'FDA', '0002-1210', '2019-11-02 00:00:00', '2030-02-02', '2030-02-02', '2021-09-17 00:00:00', 1),
(6, 6, 6, '07640133680274', 'Eylea', 'Aflibercept', 'Aflibercept', '2 mg/0.05 ml', 'Injection', 'Bacterial infections', 'Prescription Required', 'download_7.jpg', 'FDA', '0002-1436', '2019-11-02 00:00:00', '2030-02-02', '2030-02-02', '2021-09-20 00:00:00', 1),
(7, 7, 7, '07680651730025', 'Imbruvica', 'Ibrutinib', 'Ibrutinib', '50 mg', 'Tablet', 'Prevention of organ rejection in transplant patients,Rheumatoid arthritis', 'Prescription Required', 'NA', 'FDA', '0002-1445', '2021-09-04 00:00:00', '2021-09-04', '2025-09-04', '2021-09-21 00:00:00', 1),
(8, 8, 8, '07680666490013', 'Dupixent', 'Dupilumab', 'Dupilumab', '25 mg', 'Tablet', 'Nausea,Vomiting,Treatment of Allergic conditions,Motion sickness', 'Prescription Required', 'download_8.jpg', 'FDA', '0002-2236', '2020-09-04 00:00:00', '2020-10-04', '2025-10-04', '2021-09-22 00:00:00', 1),
(9, 9, 9, '05012712004394', 'Stelara', 'Ustekinumab', 'ustekinumab', '5 mg', 'Injection', 'Hypertension (high blood pressure),Prevention of Angina (heart-related chest pain)', 'Prescription Required', 'download_9.jpg', 'FDA', '0002-2377', '2019-11-02 00:00:00', '2030-02-02', '2030-02-02', '2021-09-23 00:00:00', 1),
(10, 10, 10, '01030409204902', 'Pfizer', 'Comirnaty', 'Comirnaty', '2 mg', 'Injection', 'Covid 19  Vaccine', 'Prescription Required', 'download_10.jpg', 'FDA', '0002-2980', '2021-09-04 00:00:00', '2021-09-04', '2025-09-04', '2021-09-24 00:00:00', 1),
(11, 11, 11, '00359676552017', 'Jansses', 'Priamide-Janss', 'Priamide-Janssen', '0.5 ml', 'Injection', 'Covid 19  Vaccine', 'Must Take Two Doses', 'download_4.jpg', 'FDA', '0002-3115', '2020-09-04 00:00:00', '2020-10-04', '2025-10-04', '2021-09-25 00:00:00', 1),
(12, 12, 12, '00380777273990', 'Moderna', 'mRNA-1273', 'mRNA-1273', '2 mg', 'Injection', 'Covid 19  Vaccine', 'Prescription Required', 'NA', 'FDA', '0002-3182', '2019-11-02 00:00:00', '2030-02-02', '2030-02-02', '2021-09-26 00:00:00', 1),
(13, 13, 13, '00380777202590', 'COVISHIELD', 'Vaxzevria', 'Vaxzevria', '14.08 mg', 'Injection', 'Covid 19  Vaccine', 'Prescription Required', 'NA', 'FDA', '0002-3227', '2021-09-04 00:00:00', '2021-09-04', '2025-09-04', '2021-09-27 00:00:00', 1),
(14, 14, 14, '00350458650600', 'Paracetamol', 'Panadol', 'Panadol', '4 mg', 'Tablet', 'Fever Relife Tablets', 'Prescription Required', 'NA', 'FDA', '0002-3228', '2020-09-04 00:00:00', '2020-10-04', '2025-10-04', '2021-09-28 00:00:00', 1),
(15, 15, 15, '00355700746605', 'Asprin', 'Zorprin', 'Zorprin', '3 mg', 'Tablet', 'Bacterial skin infections,Fungal skin infections,Skin conditions with inflammation & itching', 'Prescription Required', 'NA', 'FDA', '0002-3229', '2019-11-02 00:00:00', '2030-02-02', '2030-02-02', '2021-09-29 00:00:00', 1),
(16, 16, 16, '08907601007204', 'Ibuprofen', 'Advil', 'Advil', '6 mg', 'Tablet', 'Headache', 'Prescription Required', 'NA', 'FDA', '0002-3230', '2021-09-04 00:00:00', '2021-09-04', '2025-09-04', '2021-09-30 00:00:00', 1),
(17, 17, 17, '08906085154268', 'Pregabalin', 'Prepin-N', 'Prepin-N', '0.5 mg', 'Tablet', 'Allergic conditions', 'Prescription Required', 'NA', 'FDA', '0002-3231', '2020-09-04 00:00:00', '2020-10-04', '2025-10-04', '2021-10-01 00:00:00', 1),
(18, 18, 18, '08906119220884', 'Pantoprazole', 'Zolit-D', 'Zolit-D', '400 mg', 'Tablet', 'Pain relief,Fever', 'Prescription Required', 'NA', 'FDA', '0002-3235', '2019-11-02 00:00:00', '2030-02-02', '2030-02-02', '2021-10-02 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mt_product_hierarchies`
--

CREATE TABLE `mt_product_hierarchies` (
  `id` smallint NOT NULL,
  `product_id` smallint DEFAULT NULL COMMENT 'Parent Product Details Table',
  `gtin` varchar(14) DEFAULT NULL,
  `packaging_level_id` smallint DEFAULT NULL COMMENT 'FK package Levle',
  `packing_desc` varchar(1000) DEFAULT NULL,
  `parent_gtin` varchar(14) DEFAULT NULL COMMENT 'FK to GTINs',
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `mt_product_lot`
--

CREATE TABLE `mt_product_lot` (
  `id` smallint UNSIGNED NOT NULL,
  `product_id` int DEFAULT NULL COMMENT 'FK mt_product',
  `predefined_qty` int NOT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `mt_product_lot`
--

INSERT INTO `mt_product_lot` (`id`, `product_id`, `predefined_qty`, `is_active`) VALUES
(1, 1, 1000, 1),
(2, 2, 1000, 1),
(3, 3, 1000, 1),
(6, 6, 1000, 1),
(7, 7, 1000, 1),
(8, 8, 1000, 1),
(9, 9, 1000, 1),
(10, 10, 1000, 1),
(11, 11, 1000, 1),
(12, 12, 1000, 1),
(13, 13, 1000, 1),
(14, 14, 1000, 1),
(15, 15, 1000, 1),
(16, 16, 1000, 1),
(17, 17, 1000, 1),
(18, 18, 1000, 1),
(19, 10, 15000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mt_product_ndc_old`
--

CREATE TABLE `mt_product_ndc_old` (
  `id` smallint NOT NULL COMMENT 'Product Class-Product Category',
  `product_name` varchar(100) NOT NULL,
  `product_code` varchar(100) NOT NULL,
  `product_ndc` varchar(25) DEFAULT NULL,
  `product_code_type_id` smallint NOT NULL COMMENT 'The type of product code (e.g. NDC, GTIN, DIN, etc.).',
  `proprietary_name` varchar(20) DEFAULT NULL,
  `proprietary_name_suffix` varchar(2000) DEFAULT NULL,
  `nonproprietary_name` varchar(2000) DEFAULT NULL COMMENT 'Generic name',
  `dosage_form_id` smallint DEFAULT NULL COMMENT 'Product form is the description of the physical form',
  `usage_route` varchar(200) DEFAULT NULL COMMENT 'path by which a drug, fluid, or other substance is brought into contact with the body',
  `start_marketing_date` varchar(8) DEFAULT NULL,
  `end_marketing_date` varchar(8) DEFAULT NULL,
  `marketing_category_name` varchar(5) DEFAULT NULL,
  `application_number` varchar(100) DEFAULT NULL,
  `labeler_name` varchar(100) DEFAULT NULL,
  `substance_name` varchar(2000) DEFAULT NULL COMMENT 'strength of each ingredient in a trade item',
  `active_numerator_strength` varchar(200) DEFAULT NULL,
  `active_ingred_unit` varchar(200) DEFAULT NULL,
  `pharm_classes` varchar(2000) DEFAULT NULL,
  `dea_schedule` varchar(4) DEFAULT NULL,
  `ndc_exclude_flag` varchar(1) DEFAULT NULL,
  `listing_record_certified_through` varchar(8) DEFAULT NULL,
  `hs_code` varchar(24) DEFAULT NULL COMMENT 'Harmonized Commodity Description and Coding System (HS code) is an international standardized system of names and numbers for classifying commodities.',
  `health_insurance_flag` smallint DEFAULT NULL COMMENT 'Reimbursement status of the product',
  `is_active` smallint DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `mt_product_package`
--

CREATE TABLE `mt_product_package` (
  `id` smallint UNSIGNED NOT NULL,
  `product_gtin_id` smallint UNSIGNED DEFAULT NULL,
  `lot_id` smallint UNSIGNED DEFAULT NULL,
  `pack_type_id` smallint DEFAULT NULL COMMENT 'FK to Package Type Id',
  `inner_package_qty` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `mt_product_package`
--

INSERT INTO `mt_product_package` (`id`, `product_gtin_id`, `lot_id`, `pack_type_id`, `inner_package_qty`) VALUES
(1, 1, 1, 1, 10),
(2, 2, 2, 2, 10),
(3, 3, 3, 1, 10),
(6, 6, 6, 1, 10),
(7, 7, 7, 2, 10),
(8, 8, 8, 1, 10),
(9, 9, 9, 1, 10),
(10, 10, 10, 1, 10),
(11, 11, 11, 3, 10),
(12, 12, 12, 1, 10),
(13, 13, 13, 2, 10),
(14, 14, 14, 2, 10),
(15, 15, 15, 2, 10),
(16, 16, 17, 2, 10),
(17, 17, 17, 2, 10),
(18, 18, 18, 2, 10),
(19, 10, 19, 4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `mt_product_package_type`
--

CREATE TABLE `mt_product_package_type` (
  `id` smallint NOT NULL,
  `ndc_package_code` varchar(100) DEFAULT NULL,
  `container_size` varchar(50) DEFAULT NULL,
  `container_qty` varchar(50) NOT NULL DEFAULT '100',
  `package_desc` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `mt_product_package_type`
--

INSERT INTO `mt_product_package_type` (`id`, `ndc_package_code`, `container_size`, `container_qty`, `package_desc`) VALUES
(1, 'Bottle', NULL, '100', 'Drugs will be stored on bottles'),
(2, 'Strip', NULL, '100', 'Store Drugs on Strip'),
(3, 'Bottle', NULL, '50 ml', '50 ml of Anti Viral Drug'),
(4, '0002-2980', '10*0.5 ml size', '5 ml', 'Bottle');

-- --------------------------------------------------------

--
-- Table structure for table `mt_route_drug_admission`
--

CREATE TABLE `mt_route_drug_admission` (
  `id` smallint NOT NULL,
  `route_drug_admission` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `mt_trade_item`
--

CREATE TABLE `mt_trade_item` (
  `id` smallint NOT NULL,
  `item_number` varchar(4) DEFAULT NULL,
  `item_desc` varchar(100) DEFAULT NULL,
  `product_id` smallint DEFAULT NULL COMMENT 'Item details mapped to product',
  `package_unit_id` smallint DEFAULT NULL COMMENT 'Unit of measure, bottle, case',
  `serialization_id` smallint DEFAULT NULL COMMENT 'FK'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `mt_trade_item_unit`
--

CREATE TABLE `mt_trade_item_unit` (
  `id` smallint NOT NULL,
  `unit` varchar(4) DEFAULT NULL,
  `unit_description` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `mt_trading_party_role_code`
--

CREATE TABLE `mt_trading_party_role_code` (
  `id` smallint NOT NULL,
  `role_code_value` varchar(50) NOT NULL COMMENT 'FK Value',
  `role_details` varchar(1000) DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `is_active` smallint DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `mt_transport_group_hierarchy`
--

CREATE TABLE `mt_transport_group_hierarchy` (
  `id` smallint NOT NULL,
  `trasnport_group_code` varchar(30) DEFAULT NULL,
  `trasnport_group_desc` varchar(100) DEFAULT NULL,
  `parent_group_id` smallint DEFAULT NULL COMMENT 'FK self - ref',
  `description` varchar(200) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `mt_trans_events_status`
--

CREATE TABLE `mt_trans_events_status` (
  `id` smallint NOT NULL,
  `event_status` varchar(30) DEFAULT NULL,
  `event_desc` varchar(1000) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `mt_unit_depth`
--

CREATE TABLE `mt_unit_depth` (
  `id` smallint NOT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `unit_of_depth` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `mt_unit_height`
--

CREATE TABLE `mt_unit_height` (
  `id` smallint UNSIGNED NOT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `height_uoh` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `mt_unit_temp`
--

CREATE TABLE `mt_unit_temp` (
  `id` smallint NOT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `temperature_uom` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `mt_unit_volume`
--

CREATE TABLE `mt_unit_volume` (
  `id` smallint NOT NULL,
  `vol_uom_name` varchar(50) DEFAULT NULL,
  `vol_uom_desc` varchar(200) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `mt_unit_weight`
--

CREATE TABLE `mt_unit_weight` (
  `id` smallint NOT NULL,
  `wt_uom_name` varchar(50) DEFAULT NULL,
  `wt_uom_description` varchar(200) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `mt_unit_width`
--

CREATE TABLE `mt_unit_width` (
  `id` smallint NOT NULL,
  `unit` varchar(4) DEFAULT NULL,
  `width_uom` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `mt_user_access`
--

CREATE TABLE `mt_user_access` (
  `id` smallint DEFAULT NULL,
  `work_centre_code` varchar(30) DEFAULT NULL,
  `work_centre_name` varchar(100) DEFAULT NULL,
  `user_role_id` smallint DEFAULT NULL COMMENT 'Manager, Team, etc',
  `access_policy_id` varchar(15) DEFAULT 'READ' COMMENT 'Modules, pages, access'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `mt_user_groups`
--

CREATE TABLE `mt_user_groups` (
  `id` smallint NOT NULL,
  `user_group` varchar(200) DEFAULT NULL COMMENT 'Group Name',
  `description` varchar(2000) DEFAULT NULL COMMENT 'Description',
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `mt_user_profiles`
--

CREATE TABLE `mt_user_profiles` (
  `id` smallint NOT NULL,
  `profile_name` varchar(200) DEFAULT NULL,
  `license_id` smallint DEFAULT NULL COMMENT 'FK License',
  `menu_list` varchar(4000) DEFAULT NULL COMMENT 'JSON Array',
  `submenu_list` varchar(4000) DEFAULT NULL COMMENT 'JSON Array',
  `profile_desc` varchar(4000) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `mt_user_roles`
--

CREATE TABLE `mt_user_roles` (
  `id` smallint NOT NULL,
  `department_name` varchar(100) DEFAULT NULL COMMENT 'Department',
  `reports_to` smallint DEFAULT NULL COMMENT 'FK Roles',
  `user_role` varchar(100) DEFAULT NULL COMMENT 'Role',
  `description` varchar(1000) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `mt_user_types`
--

CREATE TABLE `mt_user_types` (
  `id` smallint NOT NULL,
  `user_type` varchar(100) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `access_id` smallint DEFAULT NULL COMMENT 'FK',
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `on_off_transactions`
--

CREATE TABLE `on_off_transactions` (
  `id` smallint DEFAULT NULL,
  `event_type_id` smallint DEFAULT NULL,
  `event_location_id` smallint DEFAULT NULL,
  `event_date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `recorded_date_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `product_id` smallint DEFAULT NULL,
  `quantity` decimal(10,2) DEFAULT NULL,
  `uom` varchar(20) DEFAULT NULL,
  `lot` decimal(10,2) DEFAULT NULL,
  `new_prod_id` varchar(20) DEFAULT NULL COMMENT 'Transformation',
  `after_qty` decimal(10,2) DEFAULT NULL,
  `after_uom` varchar(20) DEFAULT NULL,
  `po_ref` varchar(200) DEFAULT NULL COMMENT 'upload ref documents/ paths',
  `dispatch_note` varchar(200) DEFAULT NULL COMMENT 'upload ref documents/ paths',
  `receiver_note` varchar(200) DEFAULT NULL COMMENT 'upload ref documents/ paths'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Stand-in structure for view `org1_sscc_list`
-- (See below for the actual view)
--
CREATE TABLE `org1_sscc_list` (
`id` smallint unsigned
,`product_id` smallint unsigned
,`pallet_id` smallint unsigned
,`case_id` smallint unsigned
,`primary_pack_id` smallint unsigned
,`lot_id` smallint unsigned
,`iot_tracking_id` smallint
,`from_owner_id` smallint
,`to_owner_id` smallint
,`lsp_provider_id` smallint
,`location_id` smallint unsigned
,`owner_id` smallint unsigned
,`sscc_no` varchar(50)
,`GRAI` varchar(50)
,`GIAI` varchar(50)
,`consigner` varchar(50)
,`lsp_provider` varchar(100)
,`consignee` varchar(50)
,`sender_location` varchar(100)
,`sender_loc_gln` varchar(15)
,`dispatch_location` varchar(100)
,`dispatch_loc_gln` varchar(15)
,`container_dimensions` varchar(50)
,`package_dimentions` varchar(100)
,`package_net_weight` varchar(50)
,`package_gross_weight` varchar(50)
,`purchase_order` varchar(20)
,`order_qty` varchar(20)
,`sale_order` varchar(20)
,`package_type` varchar(20)
,`package_inside_units` int unsigned
,`package_inside_salable_units` varchar(20)
,`delivary_date` varchar(50)
,`invoice_no` varchar(11)
,`packaging_time` datetime
,`order_status` varchar(30)
,`recall` varchar(50)
,`company_id` smallint
,`category_id` smallint unsigned
,`organization_category` varchar(30)
);

-- --------------------------------------------------------

--
-- Table structure for table `product_serial_generation`
--

CREATE TABLE `product_serial_generation` (
  `id` smallint NOT NULL,
  `product_id` smallint DEFAULT NULL,
  `package_unit_id` smallint DEFAULT NULL COMMENT 'ref: Pallet, case,',
  `source_system` varchar(100) DEFAULT NULL COMMENT 'URL, system name, excell',
  `location_id` smallint DEFAULT NULL COMMENT 'FK',
  `location_group_id` smallint DEFAULT NULL COMMENT 'FK',
  `epc_range` varchar(10) DEFAULT NULL COMMENT 'Electronic Product Code',
  `serial_type_id` smallint DEFAULT '1' COMMENT 'not GTIN without serial number',
  `saleable_quantity_min` smallint DEFAULT '0',
  `company_prefix_id` smallint DEFAULT NULL COMMENT 'ref mt_gs1 company',
  `ref_serial_package_id` smallint DEFAULT NULL COMMENT 'related packaging unit.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Stand-in structure for view `sscc_pallet_sn_case_serail_numbers`
-- (See below for the actual view)
--
CREATE TABLE `sscc_pallet_sn_case_serail_numbers` (
`id` smallint unsigned
,`sscc_no` varchar(50)
,`product_name` varchar(100)
,`batch_no` varchar(25)
,`package_pallet_sn` int
,`case_numbers` text
);

-- --------------------------------------------------------

--
-- Table structure for table `testUserAuthencation`
--

CREATE TABLE `testUserAuthencation` (
  `id` int UNSIGNED NOT NULL,
  `userName` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `firstName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lastName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phoneNumber` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `registration_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tp_basic_trading_party_api_old`
--

CREATE TABLE `tp_basic_trading_party_api_old` (
  `id` int NOT NULL,
  `party_prefix` varchar(14) DEFAULT NULL COMMENT 'Company Name',
  `country_code` varchar(10) DEFAULT NULL,
  `company_name` varchar(200) DEFAULT NULL,
  `party_type_id` smallint DEFAULT '11' COMMENT 'CORPORATE_IDENTITY',
  `address_id` smallint DEFAULT NULL COMMENT 'mt_address',
  `primary_contact` varchar(100) DEFAULT NULL,
  `contact_role` varchar(100) DEFAULT NULL,
  `type_of_access` varchar(10) DEFAULT NULL COMMENT 'DEMO/ FREE/ TRAIL/ SUBSCRIPTION/ LICENSE',
  `user_id` smallint DEFAULT NULL COMMENT 'FK- Trading Party admin ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tp_contact`
--

CREATE TABLE `tp_contact` (
  `id` smallint NOT NULL,
  `contact_type` varchar(100) DEFAULT NULL COMMENT 'General,Sales, Ship To Contact, Bill To Contact',
  `contact_name` varchar(100) DEFAULT NULL,
  `steet` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `State_or_Province` varchar(100) DEFAULT NULL,
  `postal_code_or_zip` varchar(12) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tp_controlled_conditions`
--

CREATE TABLE `tp_controlled_conditions` (
  `id` smallint NOT NULL,
  `product_id` smallint DEFAULT NULL COMMENT 'FK company',
  `iot_device_sn` smallint DEFAULT NULL COMMENT 'FK company',
  `minimum_temperature` smallint DEFAULT NULL,
  `maximum_temperature` varchar(200) DEFAULT NULL,
  `humidity` varchar(100) DEFAULT NULL,
  `vibration` varchar(200) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tp_disb_whol_order_catalogue`
--

CREATE TABLE `tp_disb_whol_order_catalogue` (
  `id` smallint UNSIGNED NOT NULL,
  `product_dispactch_id` smallint UNSIGNED DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tp_disb_whol_order_catalogue`
--

INSERT INTO `tp_disb_whol_order_catalogue` (`id`, `product_dispactch_id`, `is_active`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tp_dispatch_package`
--

CREATE TABLE `tp_dispatch_package` (
  `id` smallint UNSIGNED NOT NULL,
  `sscc_no` varchar(50) DEFAULT NULL,
  `package_pallet_sn` varchar(50) DEFAULT NULL,
  `package_case_sn` varchar(50) DEFAULT NULL,
  `package_case_id` smallint DEFAULT NULL,
  `package_pallet_id` smallint UNSIGNED DEFAULT NULL,
  `package_unit_id` smallint UNSIGNED DEFAULT NULL,
  `package_type` varchar(30) DEFAULT NULL COMMENT 'hardcoded',
  `disptch_id` smallint UNSIGNED NOT NULL COMMENT 'Ref SSCC Dispatch Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tp_orders`
--

CREATE TABLE `tp_orders` (
  `id` int NOT NULL,
  `bill_no` varchar(255) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_address` varchar(255) NOT NULL,
  `customer_phone` varchar(255) NOT NULL,
  `date_time` varchar(255) NOT NULL,
  `gross_amount` varchar(255) NOT NULL,
  `service_charge_rate` varchar(255) NOT NULL,
  `service_charge` varchar(255) NOT NULL,
  `vat_charge_rate` varchar(255) NOT NULL,
  `vat_charge` varchar(255) NOT NULL,
  `net_amount` varchar(255) NOT NULL,
  `discount` varchar(255) NOT NULL,
  `paid_status` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tp_package_bundel`
--

CREATE TABLE `tp_package_bundel` (
  `id` int NOT NULL,
  `pallet_id` int NOT NULL,
  `case_id` int NOT NULL,
  `bundel_serial_no` int NOT NULL,
  `no_of_items` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tp_package_case`
--

CREATE TABLE `tp_package_case` (
  `id` smallint UNSIGNED NOT NULL COMMENT 'Referred by Pallet',
  `product_id` smallint UNSIGNED DEFAULT NULL,
  `lot_id` smallint UNSIGNED NOT NULL DEFAULT '1',
  `package_level` varchar(50) NOT NULL DEFAULT 'Case',
  `primary_package_id` smallint UNSIGNED DEFAULT NULL COMMENT 'FK to next table',
  `package_sn` int NOT NULL,
  `inner_primary_pack_count` smallint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tp_package_case`
--

INSERT INTO `tp_package_case` (`id`, `product_id`, `lot_id`, `package_level`, `primary_package_id`, `package_sn`, `inner_primary_pack_count`) VALUES
(1, 1, 1, '0', 1, 1000001, 1),
(2, 1, 1, '0', 2, 1000001, 1),
(3, 1, 1, '0', 3, 1000002, 1),
(4, 1, 1, '0', 4, 1000002, 1),
(5, 1, 1, '0', 5, 1000003, 1),
(6, 1, 1, '0', 6, 1000003, 1),
(7, 1, 1, '0', 7, 1000004, 1),
(8, 1, 1, '0', 8, 1000004, 1),
(9, 1, 1, '0', 9, 1000005, 1),
(10, 1, 1, '0', 10, 1000005, 1),
(11, 1, 19, 'Case', 11, 4564587, 1),
(12, 1, 19, 'Case', 12, 4564587, 1),
(13, 1, 19, 'Case', 13, 4564587, 1),
(14, 1, 19, 'Case', 14, 4564587, 1),
(15, 1, 19, 'Case', 15, 4564587, 1),
(16, 1, 19, 'Case', 16, 4564587, 1),
(17, 1, 19, 'Case', 17, 4564587, 1),
(18, 1, 19, 'Case', 18, 4564587, 1),
(19, 1, 19, 'Case', 19, 4564587, 1),
(20, 1, 19, 'Case', 20, 4564587, 1),
(21, 1, 19, 'Case', 21, 4564589, 1),
(22, 1, 19, 'Case', 22, 4564589, 1),
(23, 1, 19, 'Case', 23, 4564589, 1),
(24, 1, 19, 'Case', 24, 4564589, 1),
(25, 1, 19, 'Case', 25, 4564589, 1),
(26, 1, 19, 'Case', 26, 4564589, 1),
(27, 1, 19, 'Case', 27, 4564589, 1),
(28, 1, 19, 'Case', 28, 4564589, 1),
(29, 1, 19, 'Case', 29, 4564589, 1),
(30, 1, 19, 'Case', 30, 4564589, 1),
(31, 1, 19, 'Case', 31, 4564590, 1),
(32, 1, 19, 'Case', 32, 4564590, 1),
(33, 1, 19, 'Case', 33, 4564590, 1),
(34, 1, 19, 'Case', 34, 4564590, 1),
(35, 1, 19, 'Case', 35, 4564590, 1),
(36, 1, 19, 'Case', 36, 4564590, 1),
(37, 1, 19, 'Case', 37, 4564590, 1),
(38, 1, 19, 'Case', 38, 4564590, 1),
(39, 1, 19, 'Case', 39, 4564590, 1),
(40, 1, 19, 'Case', 40, 4564590, 1),
(41, 1, 19, 'Case', 41, 4564591, 1),
(42, 1, 19, 'Case', 42, 4564591, 1),
(43, 1, 19, 'Case', 43, 4564591, 1),
(44, 1, 19, 'Case', 44, 4564591, 1),
(45, 1, 19, 'Case', 45, 4564591, 1),
(46, 1, 19, 'Case', 46, 4564591, 1),
(47, 1, 19, 'Case', 47, 4564591, 1),
(48, 1, 19, 'Case', 48, 4564591, 1),
(49, 1, 19, 'Case', 49, 4564591, 1),
(50, 1, 19, 'Case', 50, 4564591, 1),
(51, 1, 19, 'Case', 51, 4564592, 1),
(52, 1, 19, 'Case', 52, 4564592, 1),
(53, 1, 19, 'Case', 53, 4564592, 1),
(54, 1, 19, 'Case', 54, 4564592, 1),
(55, 1, 19, 'Case', 55, 4564592, 1),
(56, 1, 19, 'Case', 56, 4564592, 1),
(57, 1, 19, 'Case', 57, 4564592, 1),
(58, 1, 19, 'Case', 58, 4564592, 1),
(59, 1, 19, 'Case', 59, 4564592, 1),
(60, 1, 19, 'Case', 60, 4564592, 1),
(61, 1, 19, 'Case', 61, 3644104, 1),
(62, 1, 19, 'Case', 62, 3644104, 1),
(63, 1, 19, 'Case', 63, 3644104, 1),
(64, 1, 19, 'Case', 64, 3644104, 1),
(65, 1, 19, 'Case', 65, 3644104, 1),
(66, 1, 19, 'Case', 66, 3644104, 1),
(67, 1, 19, 'Case', 67, 3644104, 1),
(68, 1, 19, 'Case', 68, 3644104, 1),
(69, 1, 19, 'Case', 69, 3644104, 1),
(70, 1, 19, 'Case', 70, 3644104, 1),
(71, 1, 1, 'Case', 1, 3644301, 2),
(72, 1, 1, 'Case', 2, 3644301, 2),
(73, 1, 1, 'Case', 3, 3644302, 2),
(74, 1, 1, 'Case', 4, 3644302, 2),
(75, 11, 11, 'Case', 71, 3260587, 10),
(76, 11, 11, 'Case', 72, 3260587, 10),
(77, 11, 11, 'Case', 73, 3260587, 10),
(78, 11, 11, 'Case', 74, 3260587, 10),
(79, 11, 11, 'Case', 75, 3260587, 10),
(80, 11, 11, 'Case', 76, 3260587, 10),
(81, 11, 11, 'Case', 77, 3260587, 10),
(82, 11, 11, 'Case', 78, 3260587, 10),
(83, 11, 11, 'Case', 79, 3260587, 10),
(84, 11, 11, 'Case', 80, 3260587, 10),
(85, 11, 11, 'Case', 81, 3260597, 10),
(86, 11, 11, 'Case', 82, 3260597, 10),
(87, 11, 11, 'Case', 83, 3260597, 10),
(88, 11, 11, 'Case', 84, 3260597, 10),
(89, 11, 11, 'Case', 85, 3260597, 10),
(90, 11, 11, 'Case', 86, 3260597, 10),
(91, 11, 11, 'Case', 87, 3260597, 10),
(92, 11, 11, 'Case', 88, 3260597, 10),
(93, 11, 11, 'Case', 89, 3260597, 10),
(94, 11, 11, 'Case', 90, 3260597, 10),
(95, 11, 11, 'Case', 91, 3260607, 10),
(96, 11, 11, 'Case', 92, 3260607, 10),
(97, 11, 11, 'Case', 93, 3260607, 10),
(98, 11, 11, 'Case', 94, 3260607, 10),
(99, 11, 11, 'Case', 95, 3260607, 10),
(100, 11, 11, 'Case', 96, 3260607, 10),
(101, 11, 11, 'Case', 97, 3260607, 10),
(102, 11, 11, 'Case', 98, 3260607, 10),
(103, 11, 11, 'Case', 99, 3260607, 10),
(104, 11, 11, 'Case', 100, 3260607, 10),
(105, 11, 11, 'Case', 101, 3260617, 10),
(106, 11, 11, 'Case', 102, 3260617, 10),
(107, 11, 11, 'Case', 103, 3260617, 10),
(108, 11, 11, 'Case', 104, 3260617, 10),
(109, 11, 11, 'Case', 105, 3260617, 10),
(110, 11, 11, 'Case', 106, 3260617, 10),
(111, 11, 11, 'Case', 107, 3260617, 10),
(112, 11, 11, 'Case', 108, 3260617, 10),
(113, 11, 11, 'Case', 109, 3260617, 10),
(114, 11, 11, 'Case', 110, 3260617, 10),
(115, 11, 11, 'Case', 111, 3260627, 10),
(116, 11, 11, 'Case', 112, 3260627, 10),
(117, 11, 11, 'Case', 113, 3260627, 10),
(118, 11, 11, 'Case', 114, 3260627, 10),
(119, 11, 11, 'Case', 115, 3260627, 10),
(120, 11, 11, 'Case', 116, 3260627, 10),
(121, 11, 11, 'Case', 117, 3260627, 10),
(122, 11, 11, 'Case', 118, 3260627, 10),
(123, 11, 11, 'Case', 119, 3260627, 10),
(124, 11, 11, 'Case', 120, 3260627, 10),
(125, 11, 11, 'Case', 121, 3260637, 10),
(126, 11, 11, 'Case', 122, 3260637, 10),
(127, 11, 11, 'Case', 123, 3260637, 10),
(128, 11, 11, 'Case', 124, 3260637, 10),
(129, 11, 11, 'Case', 125, 3260637, 10),
(130, 11, 11, 'Case', 126, 3260637, 10),
(131, 11, 11, 'Case', 127, 3260637, 10),
(132, 11, 11, 'Case', 128, 3260637, 10),
(133, 11, 11, 'Case', 129, 3260637, 10),
(134, 11, 11, 'Case', 130, 3260637, 10),
(135, 11, 11, 'Case', 131, 3260647, 10),
(136, 11, 11, 'Case', 132, 3260647, 10),
(137, 11, 11, 'Case', 133, 3260647, 10),
(138, 11, 11, 'Case', 134, 3260647, 10),
(139, 11, 11, 'Case', 135, 3260647, 10),
(140, 11, 11, 'Case', 136, 3260647, 10),
(141, 11, 11, 'Case', 137, 3260647, 10),
(142, 11, 11, 'Case', 138, 3260647, 10),
(143, 11, 11, 'Case', 139, 3260647, 10),
(144, 11, 11, 'Case', 140, 3260647, 10),
(145, 11, 11, 'Case', 141, 3260657, 10),
(146, 11, 11, 'Case', 142, 3260657, 10),
(147, 11, 11, 'Case', 143, 3260657, 10),
(148, 11, 11, 'Case', 144, 3260657, 10),
(149, 11, 11, 'Case', 145, 3260657, 10),
(150, 11, 11, 'Case', 146, 3260657, 10),
(151, 11, 11, 'Case', 147, 3260657, 10),
(152, 11, 11, 'Case', 148, 3260657, 10),
(153, 11, 11, 'Case', 149, 3260657, 10),
(154, 11, 11, 'Case', 150, 3260657, 10),
(155, 11, 11, 'Case', 151, 3260667, 10),
(156, 11, 11, 'Case', 152, 3260667, 10),
(157, 11, 11, 'Case', 153, 3260667, 10),
(158, 11, 11, 'Case', 154, 3260667, 10),
(159, 11, 11, 'Case', 155, 3260667, 10),
(160, 11, 11, 'Case', 156, 3260667, 10),
(161, 11, 11, 'Case', 157, 3260667, 10),
(162, 11, 11, 'Case', 158, 3260667, 10),
(163, 11, 11, 'Case', 159, 3260667, 10),
(164, 11, 11, 'Case', 160, 3260667, 10),
(165, 11, 11, 'Case', 161, 3260677, 10),
(166, 11, 11, 'Case', 162, 3260677, 10),
(167, 11, 11, 'Case', 163, 3260677, 10),
(168, 11, 11, 'Case', 164, 3260677, 10),
(169, 11, 11, 'Case', 165, 3260677, 10),
(170, 11, 11, 'Case', 166, 3260677, 10),
(171, 11, 11, 'Case', 167, 3260677, 10),
(172, 11, 11, 'Case', 168, 3260677, 10),
(173, 11, 11, 'Case', 169, 3260677, 10),
(174, 11, 11, 'Case', 170, 3260677, 10),
(175, 2, 2, 'Case', 171, 69854752, 1),
(176, 2, 2, 'Case', 172, 69854752, 1),
(177, 2, 2, 'Case', 173, 69854753, 1),
(178, 2, 2, 'Case', 174, 69854753, 1),
(179, 2, 2, 'Case', 175, 69854754, 1),
(180, 2, 2, 'Case', 176, 69854754, 1),
(181, 2, 2, 'Case', 177, 69854755, 1),
(182, 2, 2, 'Case', 178, 69854755, 1),
(183, 2, 2, 'Case', 179, 69854756, 1),
(184, 2, 2, 'Case', 180, 69854756, 1),
(185, 3, 3, 'Case', 181, 58741258, 1),
(186, 3, 3, 'Case', 182, 58741258, 1),
(187, 3, 3, 'Case', 183, 58741259, 1),
(188, 3, 3, 'Case', 184, 58741259, 1),
(189, 3, 3, 'Case', 185, 58741260, 1),
(190, 3, 3, 'Case', 186, 58741260, 1),
(191, 3, 3, 'Case', 187, 58741261, 1),
(192, 3, 3, 'Case', 188, 58741261, 1),
(193, 3, 3, 'Case', 189, 58741262, 1),
(194, 3, 3, 'Case', 190, 58741262, 1),
(195, 6, 6, 'Case', 191, 25874569, 1),
(196, 6, 6, 'Case', 192, 25874569, 1),
(197, 6, 6, 'Case', 193, 25874570, 1),
(198, 6, 6, 'Case', 194, 25874570, 1),
(199, 6, 6, 'Case', 195, 25874571, 1),
(200, 6, 6, 'Case', 196, 25874571, 1),
(201, 6, 6, 'Case', 197, 25874572, 1),
(202, 6, 6, 'Case', 198, 25874572, 1),
(203, 6, 6, 'Case', 199, 25874573, 1),
(204, 6, 6, 'Case', 200, 25874573, 1),
(205, 7, 7, 'Case', 201, 85478965, 1),
(206, 7, 7, 'Case', 202, 85478965, 1),
(207, 7, 7, 'Case', 203, 85478966, 1),
(208, 7, 7, 'Case', 204, 85478966, 1),
(209, 7, 7, 'Case', 205, 85478967, 1),
(210, 7, 7, 'Case', 206, 85478967, 1),
(211, 7, 7, 'Case', 207, 85478968, 1),
(212, 7, 7, 'Case', 208, 85478968, 1),
(213, 7, 7, 'Case', 209, 85478969, 1),
(214, 7, 7, 'Case', 210, 85478969, 1),
(215, 8, 8, 'Case', 211, 85478970, 1),
(216, 8, 8, 'Case', 212, 85478970, 1),
(217, 8, 8, 'Case', 213, 85478971, 1),
(218, 8, 8, 'Case', 214, 85478971, 1),
(219, 8, 8, 'Case', 215, 85478972, 1),
(220, 8, 8, 'Case', 216, 85478972, 1),
(221, 8, 8, 'Case', 217, 85478973, 1),
(222, 8, 8, 'Case', 218, 85478973, 1),
(223, 8, 8, 'Case', 219, 85478974, 1),
(224, 8, 8, 'Case', 220, 85478974, 1),
(225, 9, 9, 'Case', 221, 85478975, 1),
(226, 9, 9, 'Case', 222, 85478975, 1),
(227, 9, 9, 'Case', 223, 85478976, 1),
(228, 9, 9, 'Case', 224, 85478976, 1),
(229, 9, 9, 'Case', 225, 85478977, 1),
(230, 9, 9, 'Case', 226, 85478977, 1),
(231, 9, 9, 'Case', 227, 85478978, 1),
(232, 9, 9, 'Case', 228, 85478978, 1),
(233, 9, 9, 'Case', 229, 85478979, 1),
(234, 9, 9, 'Case', 230, 85478979, 1),
(235, 10, 10, 'Case', 231, 85478980, 1),
(236, 10, 10, 'Case', 232, 85478980, 1),
(237, 10, 10, 'Case', 233, 85478981, 1),
(238, 10, 10, 'Case', 234, 85478981, 1),
(239, 10, 10, 'Case', 235, 85478982, 1),
(240, 10, 10, 'Case', 236, 85478982, 1),
(241, 10, 10, 'Case', 237, 85478983, 1),
(242, 10, 10, 'Case', 238, 85478983, 1),
(243, 10, 10, 'Case', 239, 85478984, 1),
(244, 10, 10, 'Case', 240, 85478984, 1),
(245, 12, 12, 'Case', 241, 85478985, 1),
(246, 12, 12, 'Case', 242, 85478985, 1),
(247, 12, 12, 'Case', 243, 85478986, 1),
(248, 12, 12, 'Case', 244, 85478986, 1),
(249, 12, 12, 'Case', 245, 85478987, 1),
(250, 12, 12, 'Case', 246, 85478987, 1),
(251, 12, 12, 'Case', 247, 85478988, 1),
(252, 12, 12, 'Case', 248, 85478988, 1),
(253, 12, 12, 'Case', 249, 85478989, 1),
(254, 12, 12, 'Case', 250, 85478989, 1),
(255, 13, 13, 'Case', 251, 85478990, 1),
(256, 13, 13, 'Case', 252, 85478990, 1),
(257, 13, 13, 'Case', 253, 85478991, 1),
(258, 13, 13, 'Case', 254, 85478991, 1),
(259, 13, 13, 'Case', 255, 85478992, 1),
(260, 13, 13, 'Case', 256, 85478992, 1),
(261, 13, 13, 'Case', 257, 85478993, 1),
(262, 13, 13, 'Case', 258, 85478993, 1),
(263, 13, 13, 'Case', 259, 85478994, 1),
(264, 13, 13, 'Case', 260, 85478994, 1),
(265, 10, 21, 'Case', 261, 5287430, 10),
(266, 10, 21, 'Case', 262, 5287430, 10),
(267, 10, 21, 'Case', 263, 5287430, 10),
(268, 10, 21, 'Case', 264, 5287430, 10),
(269, 10, 21, 'Case', 265, 5287430, 10),
(270, 10, 21, 'Case', 266, 5287430, 10),
(271, 10, 21, 'Case', 267, 5287430, 10),
(272, 10, 21, 'Case', 268, 5287430, 10),
(273, 10, 21, 'Case', 269, 5287430, 10),
(274, 10, 21, 'Case', 270, 5287430, 10),
(275, 10, 21, 'Case', 271, 5287430, 10),
(276, 10, 21, 'Case', 272, 5287430, 10),
(277, 10, 21, 'Case', 273, 5287430, 10),
(278, 10, 21, 'Case', 274, 5287430, 10),
(279, 10, 21, 'Case', 275, 5287430, 10),
(280, 10, 21, 'Case', 276, 5287430, 10),
(281, 10, 21, 'Case', 277, 5287430, 10),
(282, 10, 21, 'Case', 278, 5287430, 10),
(283, 10, 21, 'Case', 279, 5287430, 10),
(284, 10, 21, 'Case', 280, 5287430, 10),
(285, 10, 21, 'Case', 281, 5287430, 10),
(286, 10, 21, 'Case', 282, 5287430, 10),
(287, 10, 21, 'Case', 283, 5287430, 10),
(288, 10, 21, 'Case', 284, 5287430, 10),
(289, 10, 21, 'Case', 285, 5287430, 10),
(290, 10, 21, 'Case', 286, 5287430, 10),
(291, 10, 21, 'Case', 287, 5287430, 10),
(292, 10, 21, 'Case', 288, 5287430, 10),
(293, 10, 21, 'Case', 289, 5287430, 10),
(294, 10, 21, 'Case', 290, 5287430, 10),
(295, 10, 21, 'Case', 291, 5287430, 10),
(296, 10, 21, 'Case', 292, 5287430, 10),
(297, 10, 21, 'Case', 293, 5287430, 10),
(298, 10, 21, 'Case', 294, 5287430, 10),
(299, 10, 21, 'Case', 295, 5287430, 10),
(300, 10, 21, 'Case', 296, 5287430, 10),
(301, 10, 21, 'Case', 297, 5287430, 10),
(302, 10, 21, 'Case', 298, 5287430, 10),
(303, 10, 21, 'Case', 299, 5287430, 10),
(304, 10, 21, 'Case', 300, 5287430, 10),
(305, 10, 21, 'Case', 301, 5287430, 10),
(306, 10, 21, 'Case', 302, 5287430, 10),
(307, 10, 21, 'Case', 303, 5287430, 10),
(308, 10, 21, 'Case', 304, 5287430, 10),
(309, 10, 21, 'Case', 305, 5287430, 10),
(310, 10, 21, 'Case', 306, 5287430, 10),
(311, 10, 21, 'Case', 307, 5287430, 10),
(312, 10, 21, 'Case', 308, 5287430, 10),
(313, 10, 21, 'Case', 309, 5287430, 10),
(314, 10, 21, 'Case', 310, 5287430, 10),
(315, 10, 21, 'Case', 311, 5287430, 10),
(316, 10, 21, 'Case', 312, 5287430, 10),
(317, 10, 21, 'Case', 313, 5287430, 10),
(318, 10, 21, 'Case', 314, 5287430, 10),
(319, 10, 21, 'Case', 315, 5287430, 10),
(320, 10, 21, 'Case', 316, 5287430, 10),
(321, 10, 21, 'Case', 317, 5287430, 10),
(322, 10, 21, 'Case', 318, 5287430, 10),
(323, 10, 21, 'Case', 319, 5287430, 10),
(324, 10, 21, 'Case', 320, 5287430, 10),
(325, 10, 21, 'Case', 321, 5287430, 10),
(326, 10, 21, 'Case', 322, 5287430, 10),
(327, 10, 21, 'Case', 323, 5287430, 10),
(328, 10, 21, 'Case', 324, 5287430, 10),
(329, 10, 21, 'Case', 325, 5287430, 10),
(330, 10, 21, 'Case', 326, 5287430, 10),
(331, 10, 21, 'Case', 327, 5287430, 10),
(332, 10, 21, 'Case', 328, 5287430, 10),
(333, 10, 21, 'Case', 329, 5287430, 10),
(334, 10, 21, 'Case', 330, 5287430, 10),
(335, 10, 21, 'Case', 331, 5287430, 10),
(336, 10, 21, 'Case', 332, 5287430, 10),
(337, 10, 21, 'Case', 333, 5287430, 10),
(338, 10, 21, 'Case', 334, 5287430, 10),
(339, 10, 21, 'Case', 335, 5287430, 10),
(340, 10, 21, 'Case', 336, 5287430, 10),
(341, 10, 21, 'Case', 337, 5287430, 10),
(342, 10, 21, 'Case', 338, 5287430, 10),
(343, 10, 21, 'Case', 339, 5287430, 10),
(344, 10, 21, 'Case', 340, 5287430, 10),
(345, 10, 21, 'Case', 341, 5287430, 10),
(346, 10, 21, 'Case', 342, 5287430, 10),
(347, 10, 21, 'Case', 343, 5287430, 10),
(348, 10, 21, 'Case', 344, 5287430, 10),
(349, 10, 21, 'Case', 345, 5287430, 10),
(350, 10, 21, 'Case', 346, 5287430, 10),
(351, 10, 21, 'Case', 347, 5287430, 10),
(352, 10, 21, 'Case', 348, 5287430, 10),
(353, 10, 21, 'Case', 349, 5287430, 10),
(354, 10, 21, 'Case', 350, 5287430, 10),
(355, 10, 21, 'Case', 351, 5287430, 10),
(356, 10, 21, 'Case', 352, 5287430, 10),
(357, 10, 21, 'Case', 353, 5287430, 10),
(358, 10, 21, 'Case', 354, 5287430, 10),
(359, 10, 21, 'Case', 355, 5287430, 10),
(360, 10, 21, 'Case', 356, 5287430, 10),
(361, 10, 21, 'Case', 357, 5287430, 10),
(362, 10, 21, 'Case', 358, 5287430, 10),
(363, 10, 21, 'Case', 359, 5287430, 10),
(364, 10, 21, 'Case', 360, 5287430, 10),
(365, 10, 21, 'Case', 361, 5287431, 10),
(366, 10, 21, 'Case', 362, 5287431, 10),
(367, 10, 21, 'Case', 363, 5287431, 10),
(368, 10, 21, 'Case', 364, 5287431, 10),
(369, 10, 21, 'Case', 365, 5287431, 10),
(370, 10, 21, 'Case', 366, 5287431, 10),
(371, 10, 21, 'Case', 367, 5287431, 10),
(372, 10, 21, 'Case', 368, 5287431, 10),
(373, 10, 21, 'Case', 369, 5287431, 10),
(374, 10, 21, 'Case', 370, 5287431, 10),
(375, 10, 21, 'Case', 371, 5287431, 10),
(376, 10, 21, 'Case', 372, 5287431, 10),
(377, 10, 21, 'Case', 373, 5287431, 10),
(378, 10, 21, 'Case', 374, 5287431, 10),
(379, 10, 21, 'Case', 375, 5287431, 10),
(380, 10, 21, 'Case', 376, 5287431, 10),
(381, 10, 21, 'Case', 377, 5287431, 10),
(382, 10, 21, 'Case', 378, 5287431, 10),
(383, 10, 21, 'Case', 379, 5287431, 10),
(384, 10, 21, 'Case', 380, 5287431, 10),
(385, 10, 21, 'Case', 381, 5287431, 10),
(386, 10, 21, 'Case', 382, 5287431, 10),
(387, 10, 21, 'Case', 383, 5287431, 10),
(388, 10, 21, 'Case', 384, 5287431, 10),
(389, 10, 21, 'Case', 385, 5287431, 10),
(390, 10, 21, 'Case', 386, 5287431, 10),
(391, 10, 21, 'Case', 387, 5287431, 10),
(392, 10, 21, 'Case', 388, 5287431, 10),
(393, 10, 21, 'Case', 389, 5287431, 10),
(394, 10, 21, 'Case', 390, 5287431, 10),
(395, 10, 21, 'Case', 391, 5287431, 10),
(396, 10, 21, 'Case', 392, 5287431, 10),
(397, 10, 21, 'Case', 393, 5287431, 10),
(398, 10, 21, 'Case', 394, 5287431, 10),
(399, 10, 21, 'Case', 395, 5287431, 10),
(400, 10, 21, 'Case', 396, 5287431, 10),
(401, 10, 21, 'Case', 397, 5287431, 10),
(402, 10, 21, 'Case', 398, 5287431, 10),
(403, 10, 21, 'Case', 399, 5287431, 10),
(404, 10, 21, 'Case', 400, 5287431, 10),
(405, 10, 21, 'Case', 401, 5287431, 10),
(406, 10, 21, 'Case', 402, 5287431, 10),
(407, 10, 21, 'Case', 403, 5287431, 10),
(408, 10, 21, 'Case', 404, 5287431, 10),
(409, 10, 21, 'Case', 405, 5287431, 10),
(410, 10, 21, 'Case', 406, 5287431, 10),
(411, 10, 21, 'Case', 407, 5287431, 10),
(412, 10, 21, 'Case', 408, 5287431, 10),
(413, 10, 21, 'Case', 409, 5287431, 10),
(414, 10, 21, 'Case', 410, 5287431, 10),
(415, 10, 21, 'Case', 411, 5287431, 10),
(416, 10, 21, 'Case', 412, 5287431, 10),
(417, 10, 21, 'Case', 413, 5287431, 10),
(418, 10, 21, 'Case', 414, 5287431, 10),
(419, 10, 21, 'Case', 415, 5287431, 10),
(420, 10, 21, 'Case', 416, 5287431, 10),
(421, 10, 21, 'Case', 417, 5287431, 10),
(422, 10, 21, 'Case', 418, 5287431, 10),
(423, 10, 21, 'Case', 419, 5287431, 10),
(424, 10, 21, 'Case', 420, 5287431, 10),
(425, 10, 21, 'Case', 421, 5287431, 10),
(426, 10, 21, 'Case', 422, 5287431, 10),
(427, 10, 21, 'Case', 423, 5287431, 10),
(428, 10, 21, 'Case', 424, 5287431, 10),
(429, 10, 21, 'Case', 425, 5287431, 10),
(430, 10, 21, 'Case', 426, 5287431, 10),
(431, 10, 21, 'Case', 427, 5287431, 10),
(432, 10, 21, 'Case', 428, 5287431, 10),
(433, 10, 21, 'Case', 429, 5287431, 10),
(434, 10, 21, 'Case', 430, 5287431, 10),
(435, 10, 21, 'Case', 431, 5287431, 10),
(436, 10, 21, 'Case', 432, 5287431, 10),
(437, 10, 21, 'Case', 433, 5287431, 10),
(438, 10, 21, 'Case', 434, 5287431, 10),
(439, 10, 21, 'Case', 435, 5287431, 10),
(440, 10, 21, 'Case', 436, 5287431, 10),
(441, 10, 21, 'Case', 437, 5287431, 10),
(442, 10, 21, 'Case', 438, 5287431, 10),
(443, 10, 21, 'Case', 439, 5287431, 10),
(444, 10, 21, 'Case', 440, 5287431, 10),
(445, 10, 21, 'Case', 441, 5287431, 10),
(446, 10, 21, 'Case', 442, 5287431, 10),
(447, 10, 21, 'Case', 443, 5287431, 10),
(448, 10, 21, 'Case', 444, 5287431, 10),
(449, 10, 21, 'Case', 445, 5287431, 10),
(450, 10, 21, 'Case', 446, 5287431, 10),
(451, 10, 21, 'Case', 447, 5287431, 10),
(452, 10, 21, 'Case', 448, 5287431, 10),
(453, 10, 21, 'Case', 449, 5287431, 10),
(454, 10, 21, 'Case', 450, 5287431, 10),
(455, 10, 21, 'Case', 451, 5287431, 10),
(456, 10, 21, 'Case', 452, 5287431, 10),
(457, 10, 21, 'Case', 453, 5287431, 10),
(458, 10, 21, 'Case', 454, 5287431, 10),
(459, 10, 21, 'Case', 455, 5287431, 10),
(460, 10, 21, 'Case', 456, 5287431, 10),
(461, 10, 21, 'Case', 457, 5287431, 10),
(462, 10, 21, 'Case', 458, 5287431, 10),
(463, 10, 21, 'Case', 459, 5287431, 10),
(464, 10, 21, 'Case', 460, 5287431, 10),
(465, 10, 21, 'Case', 461, 5287432, 10),
(466, 10, 21, 'Case', 462, 5287432, 10),
(467, 10, 21, 'Case', 463, 5287432, 10),
(468, 10, 21, 'Case', 464, 5287432, 10),
(469, 10, 21, 'Case', 465, 5287432, 10),
(470, 10, 21, 'Case', 466, 5287432, 10),
(471, 10, 21, 'Case', 467, 5287432, 10),
(472, 10, 21, 'Case', 468, 5287432, 10),
(473, 10, 21, 'Case', 469, 5287432, 10),
(474, 10, 21, 'Case', 470, 5287432, 10),
(475, 10, 21, 'Case', 471, 5287432, 10),
(476, 10, 21, 'Case', 472, 5287432, 10),
(477, 10, 21, 'Case', 473, 5287432, 10),
(478, 10, 21, 'Case', 474, 5287432, 10),
(479, 10, 21, 'Case', 475, 5287432, 10),
(480, 10, 21, 'Case', 476, 5287432, 10),
(481, 10, 21, 'Case', 477, 5287432, 10),
(482, 10, 21, 'Case', 478, 5287432, 10),
(483, 10, 21, 'Case', 479, 5287432, 10),
(484, 10, 21, 'Case', 480, 5287432, 10),
(485, 10, 21, 'Case', 481, 5287432, 10),
(486, 10, 21, 'Case', 482, 5287432, 10),
(487, 10, 21, 'Case', 483, 5287432, 10),
(488, 10, 21, 'Case', 484, 5287432, 10),
(489, 10, 21, 'Case', 485, 5287432, 10),
(490, 10, 21, 'Case', 486, 5287432, 10),
(491, 10, 21, 'Case', 487, 5287432, 10),
(492, 10, 21, 'Case', 488, 5287432, 10),
(493, 10, 21, 'Case', 489, 5287432, 10),
(494, 10, 21, 'Case', 490, 5287432, 10),
(495, 10, 21, 'Case', 491, 5287432, 10),
(496, 10, 21, 'Case', 492, 5287432, 10),
(497, 10, 21, 'Case', 493, 5287432, 10),
(498, 10, 21, 'Case', 494, 5287432, 10),
(499, 10, 21, 'Case', 495, 5287432, 10),
(500, 10, 21, 'Case', 496, 5287432, 10),
(501, 10, 21, 'Case', 497, 5287432, 10),
(502, 10, 21, 'Case', 498, 5287432, 10),
(503, 10, 21, 'Case', 499, 5287432, 10),
(504, 10, 21, 'Case', 500, 5287432, 10),
(505, 10, 21, 'Case', 501, 5287432, 10),
(506, 10, 21, 'Case', 502, 5287432, 10),
(507, 10, 21, 'Case', 503, 5287432, 10),
(508, 10, 21, 'Case', 504, 5287432, 10),
(509, 10, 21, 'Case', 505, 5287432, 10),
(510, 10, 21, 'Case', 506, 5287432, 10),
(511, 10, 21, 'Case', 507, 5287432, 10),
(512, 10, 21, 'Case', 508, 5287432, 10),
(513, 10, 21, 'Case', 509, 5287432, 10),
(514, 10, 21, 'Case', 510, 5287432, 10),
(515, 10, 21, 'Case', 511, 5287432, 10),
(516, 10, 21, 'Case', 512, 5287432, 10),
(517, 10, 21, 'Case', 513, 5287432, 10),
(518, 10, 21, 'Case', 514, 5287432, 10),
(519, 10, 21, 'Case', 515, 5287432, 10),
(520, 10, 21, 'Case', 516, 5287432, 10),
(521, 10, 21, 'Case', 517, 5287432, 10),
(522, 10, 21, 'Case', 518, 5287432, 10),
(523, 10, 21, 'Case', 519, 5287432, 10),
(524, 10, 21, 'Case', 520, 5287432, 10),
(525, 10, 21, 'Case', 521, 5287432, 10),
(526, 10, 21, 'Case', 522, 5287432, 10),
(527, 10, 21, 'Case', 523, 5287432, 10),
(528, 10, 21, 'Case', 524, 5287432, 10),
(529, 10, 21, 'Case', 525, 5287432, 10),
(530, 10, 21, 'Case', 526, 5287432, 10),
(531, 10, 21, 'Case', 527, 5287432, 10),
(532, 10, 21, 'Case', 528, 5287432, 10),
(533, 10, 21, 'Case', 529, 5287432, 10),
(534, 10, 21, 'Case', 530, 5287432, 10),
(535, 10, 21, 'Case', 531, 5287432, 10),
(536, 10, 21, 'Case', 532, 5287432, 10),
(537, 10, 21, 'Case', 533, 5287432, 10),
(538, 10, 21, 'Case', 534, 5287432, 10),
(539, 10, 21, 'Case', 535, 5287432, 10),
(540, 10, 21, 'Case', 536, 5287432, 10),
(541, 10, 21, 'Case', 537, 5287432, 10),
(542, 10, 21, 'Case', 538, 5287432, 10),
(543, 10, 21, 'Case', 539, 5287432, 10),
(544, 10, 21, 'Case', 540, 5287432, 10),
(545, 10, 21, 'Case', 541, 5287432, 10),
(546, 10, 21, 'Case', 542, 5287432, 10),
(547, 10, 21, 'Case', 543, 5287432, 10),
(548, 10, 21, 'Case', 544, 5287432, 10),
(549, 10, 21, 'Case', 545, 5287432, 10),
(550, 10, 21, 'Case', 546, 5287432, 10),
(551, 10, 21, 'Case', 547, 5287432, 10),
(552, 10, 21, 'Case', 548, 5287432, 10),
(553, 10, 21, 'Case', 549, 5287432, 10),
(554, 10, 21, 'Case', 550, 5287432, 10),
(555, 10, 21, 'Case', 551, 5287432, 10),
(556, 10, 21, 'Case', 552, 5287432, 10),
(557, 10, 21, 'Case', 553, 5287432, 10),
(558, 10, 21, 'Case', 554, 5287432, 10),
(559, 10, 21, 'Case', 555, 5287432, 10),
(560, 10, 21, 'Case', 556, 5287432, 10),
(561, 10, 21, 'Case', 557, 5287432, 10),
(562, 10, 21, 'Case', 558, 5287432, 10),
(563, 10, 21, 'Case', 559, 5287432, 10),
(564, 10, 21, 'Case', 560, 5287432, 10),
(565, 10, 21, 'Case', 561, 5287433, 10),
(566, 10, 21, 'Case', 562, 5287433, 10),
(567, 10, 21, 'Case', 563, 5287433, 10),
(568, 10, 21, 'Case', 564, 5287433, 10),
(569, 10, 21, 'Case', 565, 5287433, 10),
(570, 10, 21, 'Case', 566, 5287433, 10),
(571, 10, 21, 'Case', 567, 5287433, 10),
(572, 10, 21, 'Case', 568, 5287433, 10),
(573, 10, 21, 'Case', 569, 5287433, 10),
(574, 10, 21, 'Case', 570, 5287433, 10),
(575, 10, 21, 'Case', 571, 5287433, 10),
(576, 10, 21, 'Case', 572, 5287433, 10),
(577, 10, 21, 'Case', 573, 5287433, 10),
(578, 10, 21, 'Case', 574, 5287433, 10),
(579, 10, 21, 'Case', 575, 5287433, 10),
(580, 10, 21, 'Case', 576, 5287433, 10),
(581, 10, 21, 'Case', 577, 5287433, 10),
(582, 10, 21, 'Case', 578, 5287433, 10),
(583, 10, 21, 'Case', 579, 5287433, 10),
(584, 10, 21, 'Case', 580, 5287433, 10),
(585, 10, 21, 'Case', 581, 5287433, 10),
(586, 10, 21, 'Case', 582, 5287433, 10),
(587, 10, 21, 'Case', 583, 5287433, 10),
(588, 10, 21, 'Case', 584, 5287433, 10),
(589, 10, 21, 'Case', 585, 5287433, 10),
(590, 10, 21, 'Case', 586, 5287433, 10),
(591, 10, 21, 'Case', 587, 5287433, 10),
(592, 10, 21, 'Case', 588, 5287433, 10),
(593, 10, 21, 'Case', 589, 5287433, 10),
(594, 10, 21, 'Case', 590, 5287433, 10),
(595, 10, 21, 'Case', 591, 5287433, 10),
(596, 10, 21, 'Case', 592, 5287433, 10),
(597, 10, 21, 'Case', 593, 5287433, 10),
(598, 10, 21, 'Case', 594, 5287433, 10),
(599, 10, 21, 'Case', 595, 5287433, 10),
(600, 10, 21, 'Case', 596, 5287433, 10),
(601, 10, 21, 'Case', 597, 5287433, 10),
(602, 10, 21, 'Case', 598, 5287433, 10),
(603, 10, 21, 'Case', 599, 5287433, 10),
(604, 10, 21, 'Case', 600, 5287433, 10),
(605, 10, 21, 'Case', 601, 5287433, 10),
(606, 10, 21, 'Case', 602, 5287433, 10),
(607, 10, 21, 'Case', 603, 5287433, 10),
(608, 10, 21, 'Case', 604, 5287433, 10),
(609, 10, 21, 'Case', 605, 5287433, 10),
(610, 10, 21, 'Case', 606, 5287433, 10),
(611, 10, 21, 'Case', 607, 5287433, 10),
(612, 10, 21, 'Case', 608, 5287433, 10),
(613, 10, 21, 'Case', 609, 5287433, 10),
(614, 10, 21, 'Case', 610, 5287433, 10),
(615, 10, 21, 'Case', 611, 5287433, 10),
(616, 10, 21, 'Case', 612, 5287433, 10),
(617, 10, 21, 'Case', 613, 5287433, 10),
(618, 10, 21, 'Case', 614, 5287433, 10),
(619, 10, 21, 'Case', 615, 5287433, 10),
(620, 10, 21, 'Case', 616, 5287433, 10),
(621, 10, 21, 'Case', 617, 5287433, 10),
(622, 10, 21, 'Case', 618, 5287433, 10),
(623, 10, 21, 'Case', 619, 5287433, 10),
(624, 10, 21, 'Case', 620, 5287433, 10),
(625, 10, 21, 'Case', 621, 5287433, 10),
(626, 10, 21, 'Case', 622, 5287433, 10),
(627, 10, 21, 'Case', 623, 5287433, 10),
(628, 10, 21, 'Case', 624, 5287433, 10),
(629, 10, 21, 'Case', 625, 5287433, 10),
(630, 10, 21, 'Case', 626, 5287433, 10),
(631, 10, 21, 'Case', 627, 5287433, 10),
(632, 10, 21, 'Case', 628, 5287433, 10),
(633, 10, 21, 'Case', 629, 5287433, 10),
(634, 10, 21, 'Case', 630, 5287433, 10),
(635, 10, 21, 'Case', 631, 5287433, 10),
(636, 10, 21, 'Case', 632, 5287433, 10),
(637, 10, 21, 'Case', 633, 5287433, 10),
(638, 10, 21, 'Case', 634, 5287433, 10),
(639, 10, 21, 'Case', 635, 5287433, 10),
(640, 10, 21, 'Case', 636, 5287433, 10),
(641, 10, 21, 'Case', 637, 5287433, 10),
(642, 10, 21, 'Case', 638, 5287433, 10),
(643, 10, 21, 'Case', 639, 5287433, 10),
(644, 10, 21, 'Case', 640, 5287433, 10),
(645, 10, 21, 'Case', 641, 5287433, 10),
(646, 10, 21, 'Case', 642, 5287433, 10),
(647, 10, 21, 'Case', 643, 5287433, 10),
(648, 10, 21, 'Case', 644, 5287433, 10),
(649, 10, 21, 'Case', 645, 5287433, 10),
(650, 10, 21, 'Case', 646, 5287433, 10),
(651, 10, 21, 'Case', 647, 5287433, 10),
(652, 10, 21, 'Case', 648, 5287433, 10),
(653, 10, 21, 'Case', 649, 5287433, 10),
(654, 10, 21, 'Case', 650, 5287433, 10),
(655, 10, 21, 'Case', 651, 5287433, 10),
(656, 10, 21, 'Case', 652, 5287433, 10),
(657, 10, 21, 'Case', 653, 5287433, 10),
(658, 10, 21, 'Case', 654, 5287433, 10),
(659, 10, 21, 'Case', 655, 5287433, 10),
(660, 10, 21, 'Case', 656, 5287433, 10),
(661, 10, 21, 'Case', 657, 5287433, 10),
(662, 10, 21, 'Case', 658, 5287433, 10),
(663, 10, 21, 'Case', 659, 5287433, 10),
(664, 10, 21, 'Case', 660, 5287433, 10),
(665, 10, 21, 'Case', 661, 5287434, 10),
(666, 10, 21, 'Case', 662, 5287434, 10),
(667, 10, 21, 'Case', 663, 5287434, 10),
(668, 10, 21, 'Case', 664, 5287434, 10),
(669, 10, 21, 'Case', 665, 5287434, 10),
(670, 10, 21, 'Case', 666, 5287434, 10),
(671, 10, 21, 'Case', 667, 5287434, 10),
(672, 10, 21, 'Case', 668, 5287434, 10),
(673, 10, 21, 'Case', 669, 5287434, 10),
(674, 10, 21, 'Case', 670, 5287434, 10),
(675, 10, 21, 'Case', 671, 5287434, 10),
(676, 10, 21, 'Case', 672, 5287434, 10),
(677, 10, 21, 'Case', 673, 5287434, 10),
(678, 10, 21, 'Case', 674, 5287434, 10),
(679, 10, 21, 'Case', 675, 5287434, 10),
(680, 10, 21, 'Case', 676, 5287434, 10),
(681, 10, 21, 'Case', 677, 5287434, 10),
(682, 10, 21, 'Case', 678, 5287434, 10),
(683, 10, 21, 'Case', 679, 5287434, 10),
(684, 10, 21, 'Case', 680, 5287434, 10),
(685, 10, 21, 'Case', 681, 5287434, 10),
(686, 10, 21, 'Case', 682, 5287434, 10),
(687, 10, 21, 'Case', 683, 5287434, 10),
(688, 10, 21, 'Case', 684, 5287434, 10),
(689, 10, 21, 'Case', 685, 5287434, 10),
(690, 10, 21, 'Case', 686, 5287434, 10),
(691, 10, 21, 'Case', 687, 5287434, 10),
(692, 10, 21, 'Case', 688, 5287434, 10),
(693, 10, 21, 'Case', 689, 5287434, 10),
(694, 10, 21, 'Case', 690, 5287434, 10),
(695, 10, 21, 'Case', 691, 5287434, 10),
(696, 10, 21, 'Case', 692, 5287434, 10),
(697, 10, 21, 'Case', 693, 5287434, 10),
(698, 10, 21, 'Case', 694, 5287434, 10),
(699, 10, 21, 'Case', 695, 5287434, 10),
(700, 10, 21, 'Case', 696, 5287434, 10),
(701, 10, 21, 'Case', 697, 5287434, 10),
(702, 10, 21, 'Case', 698, 5287434, 10),
(703, 10, 21, 'Case', 699, 5287434, 10),
(704, 10, 21, 'Case', 700, 5287434, 10),
(705, 10, 21, 'Case', 701, 5287434, 10),
(706, 10, 21, 'Case', 702, 5287434, 10),
(707, 10, 21, 'Case', 703, 5287434, 10),
(708, 10, 21, 'Case', 704, 5287434, 10),
(709, 10, 21, 'Case', 705, 5287434, 10),
(710, 10, 21, 'Case', 706, 5287434, 10),
(711, 10, 21, 'Case', 707, 5287434, 10),
(712, 10, 21, 'Case', 708, 5287434, 10),
(713, 10, 21, 'Case', 709, 5287434, 10),
(714, 10, 21, 'Case', 710, 5287434, 10),
(715, 10, 21, 'Case', 711, 5287434, 10),
(716, 10, 21, 'Case', 712, 5287434, 10),
(717, 10, 21, 'Case', 713, 5287434, 10),
(718, 10, 21, 'Case', 714, 5287434, 10),
(719, 10, 21, 'Case', 715, 5287434, 10),
(720, 10, 21, 'Case', 716, 5287434, 10),
(721, 10, 21, 'Case', 717, 5287434, 10),
(722, 10, 21, 'Case', 718, 5287434, 10),
(723, 10, 21, 'Case', 719, 5287434, 10),
(724, 10, 21, 'Case', 720, 5287434, 10),
(725, 10, 21, 'Case', 721, 5287434, 10),
(726, 10, 21, 'Case', 722, 5287434, 10),
(727, 10, 21, 'Case', 723, 5287434, 10),
(728, 10, 21, 'Case', 724, 5287434, 10),
(729, 10, 21, 'Case', 725, 5287434, 10),
(730, 10, 21, 'Case', 726, 5287434, 10),
(731, 10, 21, 'Case', 727, 5287434, 10),
(732, 10, 21, 'Case', 728, 5287434, 10),
(733, 10, 21, 'Case', 729, 5287434, 10),
(734, 10, 21, 'Case', 730, 5287434, 10),
(735, 10, 21, 'Case', 731, 5287434, 10),
(736, 10, 21, 'Case', 732, 5287434, 10),
(737, 10, 21, 'Case', 733, 5287434, 10),
(738, 10, 21, 'Case', 734, 5287434, 10),
(739, 10, 21, 'Case', 735, 5287434, 10),
(740, 10, 21, 'Case', 736, 5287434, 10),
(741, 10, 21, 'Case', 737, 5287434, 10),
(742, 10, 21, 'Case', 738, 5287434, 10),
(743, 10, 21, 'Case', 739, 5287434, 10),
(744, 10, 21, 'Case', 740, 5287434, 10),
(745, 10, 21, 'Case', 741, 5287434, 10),
(746, 10, 21, 'Case', 742, 5287434, 10),
(747, 10, 21, 'Case', 743, 5287434, 10),
(748, 10, 21, 'Case', 744, 5287434, 10),
(749, 10, 21, 'Case', 745, 5287434, 10),
(750, 10, 21, 'Case', 746, 5287434, 10),
(751, 10, 21, 'Case', 747, 5287434, 10),
(752, 10, 21, 'Case', 748, 5287434, 10),
(753, 10, 21, 'Case', 749, 5287434, 10),
(754, 10, 21, 'Case', 750, 5287434, 10),
(755, 10, 21, 'Case', 751, 5287434, 10),
(756, 10, 21, 'Case', 752, 5287434, 10),
(757, 10, 21, 'Case', 753, 5287434, 10),
(758, 10, 21, 'Case', 754, 5287434, 10),
(759, 10, 21, 'Case', 755, 5287434, 10),
(760, 10, 21, 'Case', 756, 5287434, 10),
(761, 10, 21, 'Case', 757, 5287434, 10),
(762, 10, 21, 'Case', 758, 5287434, 10),
(763, 10, 21, 'Case', 759, 5287434, 10),
(764, 10, 21, 'Case', 760, 5287434, 10),
(765, 10, 21, 'Case', 761, 5287435, 10),
(766, 10, 21, 'Case', 762, 5287435, 10),
(767, 10, 21, 'Case', 763, 5287435, 10),
(768, 10, 21, 'Case', 764, 5287435, 10),
(769, 10, 21, 'Case', 765, 5287435, 10),
(770, 10, 21, 'Case', 766, 5287435, 10),
(771, 10, 21, 'Case', 767, 5287435, 10),
(772, 10, 21, 'Case', 768, 5287435, 10),
(773, 10, 21, 'Case', 769, 5287435, 10),
(774, 10, 21, 'Case', 770, 5287435, 10),
(775, 10, 21, 'Case', 771, 5287435, 10),
(776, 10, 21, 'Case', 772, 5287435, 10),
(777, 10, 21, 'Case', 773, 5287435, 10),
(778, 10, 21, 'Case', 774, 5287435, 10),
(779, 10, 21, 'Case', 775, 5287435, 10),
(780, 10, 21, 'Case', 776, 5287435, 10),
(781, 10, 21, 'Case', 777, 5287435, 10),
(782, 10, 21, 'Case', 778, 5287435, 10),
(783, 10, 21, 'Case', 779, 5287435, 10),
(784, 10, 21, 'Case', 780, 5287435, 10),
(785, 10, 21, 'Case', 781, 5287435, 10),
(786, 10, 21, 'Case', 782, 5287435, 10),
(787, 10, 21, 'Case', 783, 5287435, 10),
(788, 10, 21, 'Case', 784, 5287435, 10),
(789, 10, 21, 'Case', 785, 5287435, 10),
(790, 10, 21, 'Case', 786, 5287435, 10),
(791, 10, 21, 'Case', 787, 5287435, 10),
(792, 10, 21, 'Case', 788, 5287435, 10),
(793, 10, 21, 'Case', 789, 5287435, 10),
(794, 10, 21, 'Case', 790, 5287435, 10),
(795, 10, 21, 'Case', 791, 5287435, 10),
(796, 10, 21, 'Case', 792, 5287435, 10),
(797, 10, 21, 'Case', 793, 5287435, 10),
(798, 10, 21, 'Case', 794, 5287435, 10),
(799, 10, 21, 'Case', 795, 5287435, 10),
(800, 10, 21, 'Case', 796, 5287435, 10),
(801, 10, 21, 'Case', 797, 5287435, 10),
(802, 10, 21, 'Case', 798, 5287435, 10),
(803, 10, 21, 'Case', 799, 5287435, 10),
(804, 10, 21, 'Case', 800, 5287435, 10),
(805, 10, 21, 'Case', 801, 5287435, 10),
(806, 10, 21, 'Case', 802, 5287435, 10),
(807, 10, 21, 'Case', 803, 5287435, 10),
(808, 10, 21, 'Case', 804, 5287435, 10),
(809, 10, 21, 'Case', 805, 5287435, 10),
(810, 10, 21, 'Case', 806, 5287435, 10),
(811, 10, 21, 'Case', 807, 5287435, 10),
(812, 10, 21, 'Case', 808, 5287435, 10),
(813, 10, 21, 'Case', 809, 5287435, 10),
(814, 10, 21, 'Case', 810, 5287435, 10),
(815, 10, 21, 'Case', 811, 5287435, 10),
(816, 10, 21, 'Case', 812, 5287435, 10),
(817, 10, 21, 'Case', 813, 5287435, 10),
(818, 10, 21, 'Case', 814, 5287435, 10),
(819, 10, 21, 'Case', 815, 5287435, 10),
(820, 10, 21, 'Case', 816, 5287435, 10),
(821, 10, 21, 'Case', 817, 5287435, 10),
(822, 10, 21, 'Case', 818, 5287435, 10),
(823, 10, 21, 'Case', 819, 5287435, 10),
(824, 10, 21, 'Case', 820, 5287435, 10),
(825, 10, 21, 'Case', 821, 5287435, 10),
(826, 10, 21, 'Case', 822, 5287435, 10),
(827, 10, 21, 'Case', 823, 5287435, 10),
(828, 10, 21, 'Case', 824, 5287435, 10),
(829, 10, 21, 'Case', 825, 5287435, 10),
(830, 10, 21, 'Case', 826, 5287435, 10),
(831, 10, 21, 'Case', 827, 5287435, 10),
(832, 10, 21, 'Case', 828, 5287435, 10),
(833, 10, 21, 'Case', 829, 5287435, 10),
(834, 10, 21, 'Case', 830, 5287435, 10),
(835, 10, 21, 'Case', 831, 5287435, 10),
(836, 10, 21, 'Case', 832, 5287435, 10),
(837, 10, 21, 'Case', 833, 5287435, 10),
(838, 10, 21, 'Case', 834, 5287435, 10),
(839, 10, 21, 'Case', 835, 5287435, 10),
(840, 10, 21, 'Case', 836, 5287435, 10),
(841, 10, 21, 'Case', 837, 5287435, 10),
(842, 10, 21, 'Case', 838, 5287435, 10),
(843, 10, 21, 'Case', 839, 5287435, 10),
(844, 10, 21, 'Case', 840, 5287435, 10),
(845, 10, 21, 'Case', 841, 5287435, 10),
(846, 10, 21, 'Case', 842, 5287435, 10),
(847, 10, 21, 'Case', 843, 5287435, 10),
(848, 10, 21, 'Case', 844, 5287435, 10),
(849, 10, 21, 'Case', 845, 5287435, 10),
(850, 10, 21, 'Case', 846, 5287435, 10),
(851, 10, 21, 'Case', 847, 5287435, 10),
(852, 10, 21, 'Case', 848, 5287435, 10),
(853, 10, 21, 'Case', 849, 5287435, 10),
(854, 10, 21, 'Case', 850, 5287435, 10),
(855, 10, 21, 'Case', 851, 5287435, 10),
(856, 10, 21, 'Case', 852, 5287435, 10),
(857, 10, 21, 'Case', 853, 5287435, 10),
(858, 10, 21, 'Case', 854, 5287435, 10),
(859, 10, 21, 'Case', 855, 5287435, 10),
(860, 10, 21, 'Case', 856, 5287435, 10),
(861, 10, 21, 'Case', 857, 5287435, 10),
(862, 10, 21, 'Case', 858, 5287435, 10),
(863, 10, 21, 'Case', 859, 5287435, 10),
(864, 10, 21, 'Case', 860, 5287435, 10),
(865, 10, 21, 'Case', 861, 5287436, 10),
(866, 10, 21, 'Case', 862, 5287436, 10),
(867, 10, 21, 'Case', 863, 5287436, 10),
(868, 10, 21, 'Case', 864, 5287436, 10),
(869, 10, 21, 'Case', 865, 5287436, 10),
(870, 10, 21, 'Case', 866, 5287436, 10),
(871, 10, 21, 'Case', 867, 5287436, 10),
(872, 10, 21, 'Case', 868, 5287436, 10),
(873, 10, 21, 'Case', 869, 5287436, 10),
(874, 10, 21, 'Case', 870, 5287436, 10),
(875, 10, 21, 'Case', 871, 5287436, 10),
(876, 10, 21, 'Case', 872, 5287436, 10),
(877, 10, 21, 'Case', 873, 5287436, 10),
(878, 10, 21, 'Case', 874, 5287436, 10),
(879, 10, 21, 'Case', 875, 5287436, 10),
(880, 10, 21, 'Case', 876, 5287436, 10),
(881, 10, 21, 'Case', 877, 5287436, 10),
(882, 10, 21, 'Case', 878, 5287436, 10),
(883, 10, 21, 'Case', 879, 5287436, 10),
(884, 10, 21, 'Case', 880, 5287436, 10),
(885, 10, 21, 'Case', 881, 5287436, 10),
(886, 10, 21, 'Case', 882, 5287436, 10),
(887, 10, 21, 'Case', 883, 5287436, 10),
(888, 10, 21, 'Case', 884, 5287436, 10),
(889, 10, 21, 'Case', 885, 5287436, 10),
(890, 10, 21, 'Case', 886, 5287436, 10),
(891, 10, 21, 'Case', 887, 5287436, 10),
(892, 10, 21, 'Case', 888, 5287436, 10),
(893, 10, 21, 'Case', 889, 5287436, 10),
(894, 10, 21, 'Case', 890, 5287436, 10),
(895, 10, 21, 'Case', 891, 5287436, 10),
(896, 10, 21, 'Case', 892, 5287436, 10),
(897, 10, 21, 'Case', 893, 5287436, 10),
(898, 10, 21, 'Case', 894, 5287436, 10),
(899, 10, 21, 'Case', 895, 5287436, 10),
(900, 10, 21, 'Case', 896, 5287436, 10),
(901, 10, 21, 'Case', 897, 5287436, 10),
(902, 10, 21, 'Case', 898, 5287436, 10),
(903, 10, 21, 'Case', 899, 5287436, 10),
(904, 10, 21, 'Case', 900, 5287436, 10),
(905, 10, 21, 'Case', 901, 5287436, 10),
(906, 10, 21, 'Case', 902, 5287436, 10),
(907, 10, 21, 'Case', 903, 5287436, 10),
(908, 10, 21, 'Case', 904, 5287436, 10),
(909, 10, 21, 'Case', 905, 5287436, 10),
(910, 10, 21, 'Case', 906, 5287436, 10),
(911, 10, 21, 'Case', 907, 5287436, 10),
(912, 10, 21, 'Case', 908, 5287436, 10),
(913, 10, 21, 'Case', 909, 5287436, 10),
(914, 10, 21, 'Case', 910, 5287436, 10),
(915, 10, 21, 'Case', 911, 5287436, 10),
(916, 10, 21, 'Case', 912, 5287436, 10),
(917, 10, 21, 'Case', 913, 5287436, 10),
(918, 10, 21, 'Case', 914, 5287436, 10),
(919, 10, 21, 'Case', 915, 5287436, 10),
(920, 10, 21, 'Case', 916, 5287436, 10),
(921, 10, 21, 'Case', 917, 5287436, 10),
(922, 10, 21, 'Case', 918, 5287436, 10),
(923, 10, 21, 'Case', 919, 5287436, 10),
(924, 10, 21, 'Case', 920, 5287436, 10),
(925, 10, 21, 'Case', 921, 5287436, 10),
(926, 10, 21, 'Case', 922, 5287436, 10),
(927, 10, 21, 'Case', 923, 5287436, 10),
(928, 10, 21, 'Case', 924, 5287436, 10),
(929, 10, 21, 'Case', 925, 5287436, 10),
(930, 10, 21, 'Case', 926, 5287436, 10),
(931, 10, 21, 'Case', 927, 5287436, 10),
(932, 10, 21, 'Case', 928, 5287436, 10),
(933, 10, 21, 'Case', 929, 5287436, 10),
(934, 10, 21, 'Case', 930, 5287436, 10),
(935, 10, 21, 'Case', 931, 5287436, 10),
(936, 10, 21, 'Case', 932, 5287436, 10),
(937, 10, 21, 'Case', 933, 5287436, 10),
(938, 10, 21, 'Case', 934, 5287436, 10),
(939, 10, 21, 'Case', 935, 5287436, 10),
(940, 10, 21, 'Case', 936, 5287436, 10),
(941, 10, 21, 'Case', 937, 5287436, 10),
(942, 10, 21, 'Case', 938, 5287436, 10),
(943, 10, 21, 'Case', 939, 5287436, 10),
(944, 10, 21, 'Case', 940, 5287436, 10),
(945, 10, 21, 'Case', 941, 5287436, 10),
(946, 10, 21, 'Case', 942, 5287436, 10),
(947, 10, 21, 'Case', 943, 5287436, 10),
(948, 10, 21, 'Case', 944, 5287436, 10),
(949, 10, 21, 'Case', 945, 5287436, 10),
(950, 10, 21, 'Case', 946, 5287436, 10),
(951, 10, 21, 'Case', 947, 5287436, 10),
(952, 10, 21, 'Case', 948, 5287436, 10),
(953, 10, 21, 'Case', 949, 5287436, 10),
(954, 10, 21, 'Case', 950, 5287436, 10),
(955, 10, 21, 'Case', 951, 5287436, 10),
(956, 10, 21, 'Case', 952, 5287436, 10),
(957, 10, 21, 'Case', 953, 5287436, 10),
(958, 10, 21, 'Case', 954, 5287436, 10),
(959, 10, 21, 'Case', 955, 5287436, 10),
(960, 10, 21, 'Case', 956, 5287436, 10),
(961, 10, 21, 'Case', 957, 5287436, 10),
(962, 10, 21, 'Case', 958, 5287436, 10),
(963, 10, 21, 'Case', 959, 5287436, 10),
(964, 10, 21, 'Case', 960, 5287436, 10),
(965, 10, 21, 'Case', 961, 5287437, 10),
(966, 10, 21, 'Case', 962, 5287437, 10),
(967, 10, 21, 'Case', 963, 5287437, 10),
(968, 10, 21, 'Case', 964, 5287437, 10),
(969, 10, 21, 'Case', 965, 5287437, 10),
(970, 10, 21, 'Case', 966, 5287437, 10),
(971, 10, 21, 'Case', 967, 5287437, 10),
(972, 10, 21, 'Case', 968, 5287437, 10),
(973, 10, 21, 'Case', 969, 5287437, 10),
(974, 10, 21, 'Case', 970, 5287437, 10),
(975, 10, 21, 'Case', 971, 5287437, 10),
(976, 10, 21, 'Case', 972, 5287437, 10),
(977, 10, 21, 'Case', 973, 5287437, 10),
(978, 10, 21, 'Case', 974, 5287437, 10),
(979, 10, 21, 'Case', 975, 5287437, 10),
(980, 10, 21, 'Case', 976, 5287437, 10),
(981, 10, 21, 'Case', 977, 5287437, 10),
(982, 10, 21, 'Case', 978, 5287437, 10),
(983, 10, 21, 'Case', 979, 5287437, 10),
(984, 10, 21, 'Case', 980, 5287437, 10),
(985, 10, 21, 'Case', 981, 5287437, 10),
(986, 10, 21, 'Case', 982, 5287437, 10),
(987, 10, 21, 'Case', 983, 5287437, 10),
(988, 10, 21, 'Case', 984, 5287437, 10),
(989, 10, 21, 'Case', 985, 5287437, 10),
(990, 10, 21, 'Case', 986, 5287437, 10),
(991, 10, 21, 'Case', 987, 5287437, 10),
(992, 10, 21, 'Case', 988, 5287437, 10),
(993, 10, 21, 'Case', 989, 5287437, 10),
(994, 10, 21, 'Case', 990, 5287437, 10),
(995, 10, 21, 'Case', 991, 5287437, 10),
(996, 10, 21, 'Case', 992, 5287437, 10),
(997, 10, 21, 'Case', 993, 5287437, 10),
(998, 10, 21, 'Case', 994, 5287437, 10),
(999, 10, 21, 'Case', 995, 5287437, 10),
(1000, 10, 21, 'Case', 996, 5287437, 10),
(1001, 10, 21, 'Case', 997, 5287437, 10),
(1002, 10, 21, 'Case', 998, 5287437, 10),
(1003, 10, 21, 'Case', 999, 5287437, 10),
(1004, 10, 21, 'Case', 1000, 5287437, 10),
(1005, 10, 21, 'Case', 1001, 5287437, 10),
(1006, 10, 21, 'Case', 1002, 5287437, 10),
(1007, 10, 21, 'Case', 1003, 5287437, 10),
(1008, 10, 21, 'Case', 1004, 5287437, 10),
(1009, 10, 21, 'Case', 1005, 5287437, 10),
(1010, 10, 21, 'Case', 1006, 5287437, 10),
(1011, 10, 21, 'Case', 1007, 5287437, 10),
(1012, 10, 21, 'Case', 1008, 5287437, 10),
(1013, 10, 21, 'Case', 1009, 5287437, 10),
(1014, 10, 21, 'Case', 1010, 5287437, 10),
(1015, 10, 21, 'Case', 1011, 5287437, 10),
(1016, 10, 21, 'Case', 1012, 5287437, 10),
(1017, 10, 21, 'Case', 1013, 5287437, 10),
(1018, 10, 21, 'Case', 1014, 5287437, 10),
(1019, 10, 21, 'Case', 1015, 5287437, 10),
(1020, 10, 21, 'Case', 1016, 5287437, 10),
(1021, 10, 21, 'Case', 1017, 5287437, 10),
(1022, 10, 21, 'Case', 1018, 5287437, 10),
(1023, 10, 21, 'Case', 1019, 5287437, 10),
(1024, 10, 21, 'Case', 1020, 5287437, 10),
(1025, 10, 21, 'Case', 1021, 5287437, 10),
(1026, 10, 21, 'Case', 1022, 5287437, 10),
(1027, 10, 21, 'Case', 1023, 5287437, 10),
(1028, 10, 21, 'Case', 1024, 5287437, 10),
(1029, 10, 21, 'Case', 1025, 5287437, 10),
(1030, 10, 21, 'Case', 1026, 5287437, 10),
(1031, 10, 21, 'Case', 1027, 5287437, 10),
(1032, 10, 21, 'Case', 1028, 5287437, 10),
(1033, 10, 21, 'Case', 1029, 5287437, 10),
(1034, 10, 21, 'Case', 1030, 5287437, 10),
(1035, 10, 21, 'Case', 1031, 5287437, 10),
(1036, 10, 21, 'Case', 1032, 5287437, 10),
(1037, 10, 21, 'Case', 1033, 5287437, 10),
(1038, 10, 21, 'Case', 1034, 5287437, 10),
(1039, 10, 21, 'Case', 1035, 5287437, 10),
(1040, 10, 21, 'Case', 1036, 5287437, 10),
(1041, 10, 21, 'Case', 1037, 5287437, 10),
(1042, 10, 21, 'Case', 1038, 5287437, 10),
(1043, 10, 21, 'Case', 1039, 5287437, 10),
(1044, 10, 21, 'Case', 1040, 5287437, 10),
(1045, 10, 21, 'Case', 1041, 5287437, 10),
(1046, 10, 21, 'Case', 1042, 5287437, 10),
(1047, 10, 21, 'Case', 1043, 5287437, 10),
(1048, 10, 21, 'Case', 1044, 5287437, 10),
(1049, 10, 21, 'Case', 1045, 5287437, 10),
(1050, 10, 21, 'Case', 1046, 5287437, 10),
(1051, 10, 21, 'Case', 1047, 5287437, 10),
(1052, 10, 21, 'Case', 1048, 5287437, 10),
(1053, 10, 21, 'Case', 1049, 5287437, 10),
(1054, 10, 21, 'Case', 1050, 5287437, 10),
(1055, 10, 21, 'Case', 1051, 5287437, 10),
(1056, 10, 21, 'Case', 1052, 5287437, 10),
(1057, 10, 21, 'Case', 1053, 5287437, 10),
(1058, 10, 21, 'Case', 1054, 5287437, 10),
(1059, 10, 21, 'Case', 1055, 5287437, 10),
(1060, 10, 21, 'Case', 1056, 5287437, 10),
(1061, 10, 21, 'Case', 1057, 5287437, 10),
(1062, 10, 21, 'Case', 1058, 5287437, 10),
(1063, 10, 21, 'Case', 1059, 5287437, 10),
(1064, 10, 21, 'Case', 1060, 5287437, 10),
(1065, 10, 21, 'Case', 1061, 5287438, 10),
(1066, 10, 21, 'Case', 1062, 5287438, 10),
(1067, 10, 21, 'Case', 1063, 5287438, 10),
(1068, 10, 21, 'Case', 1064, 5287438, 10),
(1069, 10, 21, 'Case', 1065, 5287438, 10),
(1070, 10, 21, 'Case', 1066, 5287438, 10),
(1071, 10, 21, 'Case', 1067, 5287438, 10),
(1072, 10, 21, 'Case', 1068, 5287438, 10),
(1073, 10, 21, 'Case', 1069, 5287438, 10),
(1074, 10, 21, 'Case', 1070, 5287438, 10),
(1075, 10, 21, 'Case', 1071, 5287438, 10),
(1076, 10, 21, 'Case', 1072, 5287438, 10),
(1077, 10, 21, 'Case', 1073, 5287438, 10),
(1078, 10, 21, 'Case', 1074, 5287438, 10),
(1079, 10, 21, 'Case', 1075, 5287438, 10),
(1080, 10, 21, 'Case', 1076, 5287438, 10),
(1081, 10, 21, 'Case', 1077, 5287438, 10),
(1082, 10, 21, 'Case', 1078, 5287438, 10),
(1083, 10, 21, 'Case', 1079, 5287438, 10),
(1084, 10, 21, 'Case', 1080, 5287438, 10),
(1085, 10, 21, 'Case', 1081, 5287438, 10),
(1086, 10, 21, 'Case', 1082, 5287438, 10),
(1087, 10, 21, 'Case', 1083, 5287438, 10),
(1088, 10, 21, 'Case', 1084, 5287438, 10),
(1089, 10, 21, 'Case', 1085, 5287438, 10),
(1090, 10, 21, 'Case', 1086, 5287438, 10),
(1091, 10, 21, 'Case', 1087, 5287438, 10),
(1092, 10, 21, 'Case', 1088, 5287438, 10),
(1093, 10, 21, 'Case', 1089, 5287438, 10),
(1094, 10, 21, 'Case', 1090, 5287438, 10),
(1095, 10, 21, 'Case', 1091, 5287438, 10),
(1096, 10, 21, 'Case', 1092, 5287438, 10),
(1097, 10, 21, 'Case', 1093, 5287438, 10),
(1098, 10, 21, 'Case', 1094, 5287438, 10),
(1099, 10, 21, 'Case', 1095, 5287438, 10),
(1100, 10, 21, 'Case', 1096, 5287438, 10),
(1101, 10, 21, 'Case', 1097, 5287438, 10),
(1102, 10, 21, 'Case', 1098, 5287438, 10),
(1103, 10, 21, 'Case', 1099, 5287438, 10),
(1104, 10, 21, 'Case', 1100, 5287438, 10),
(1105, 10, 21, 'Case', 1101, 5287438, 10),
(1106, 10, 21, 'Case', 1102, 5287438, 10),
(1107, 10, 21, 'Case', 1103, 5287438, 10),
(1108, 10, 21, 'Case', 1104, 5287438, 10),
(1109, 10, 21, 'Case', 1105, 5287438, 10),
(1110, 10, 21, 'Case', 1106, 5287438, 10),
(1111, 10, 21, 'Case', 1107, 5287438, 10),
(1112, 10, 21, 'Case', 1108, 5287438, 10),
(1113, 10, 21, 'Case', 1109, 5287438, 10),
(1114, 10, 21, 'Case', 1110, 5287438, 10),
(1115, 10, 21, 'Case', 1111, 5287438, 10),
(1116, 10, 21, 'Case', 1112, 5287438, 10),
(1117, 10, 21, 'Case', 1113, 5287438, 10),
(1118, 10, 21, 'Case', 1114, 5287438, 10),
(1119, 10, 21, 'Case', 1115, 5287438, 10),
(1120, 10, 21, 'Case', 1116, 5287438, 10),
(1121, 10, 21, 'Case', 1117, 5287438, 10),
(1122, 10, 21, 'Case', 1118, 5287438, 10),
(1123, 10, 21, 'Case', 1119, 5287438, 10),
(1124, 10, 21, 'Case', 1120, 5287438, 10),
(1125, 10, 21, 'Case', 1121, 5287438, 10),
(1126, 10, 21, 'Case', 1122, 5287438, 10),
(1127, 10, 21, 'Case', 1123, 5287438, 10),
(1128, 10, 21, 'Case', 1124, 5287438, 10),
(1129, 10, 21, 'Case', 1125, 5287438, 10),
(1130, 10, 21, 'Case', 1126, 5287438, 10),
(1131, 10, 21, 'Case', 1127, 5287438, 10),
(1132, 10, 21, 'Case', 1128, 5287438, 10),
(1133, 10, 21, 'Case', 1129, 5287438, 10),
(1134, 10, 21, 'Case', 1130, 5287438, 10),
(1135, 10, 21, 'Case', 1131, 5287438, 10),
(1136, 10, 21, 'Case', 1132, 5287438, 10),
(1137, 10, 21, 'Case', 1133, 5287438, 10),
(1138, 10, 21, 'Case', 1134, 5287438, 10),
(1139, 10, 21, 'Case', 1135, 5287438, 10),
(1140, 10, 21, 'Case', 1136, 5287438, 10),
(1141, 10, 21, 'Case', 1137, 5287438, 10),
(1142, 10, 21, 'Case', 1138, 5287438, 10),
(1143, 10, 21, 'Case', 1139, 5287438, 10),
(1144, 10, 21, 'Case', 1140, 5287438, 10),
(1145, 10, 21, 'Case', 1141, 5287438, 10),
(1146, 10, 21, 'Case', 1142, 5287438, 10),
(1147, 10, 21, 'Case', 1143, 5287438, 10),
(1148, 10, 21, 'Case', 1144, 5287438, 10),
(1149, 10, 21, 'Case', 1145, 5287438, 10),
(1150, 10, 21, 'Case', 1146, 5287438, 10),
(1151, 10, 21, 'Case', 1147, 5287438, 10),
(1152, 10, 21, 'Case', 1148, 5287438, 10),
(1153, 10, 21, 'Case', 1149, 5287438, 10),
(1154, 10, 21, 'Case', 1150, 5287438, 10),
(1155, 10, 21, 'Case', 1151, 5287438, 10),
(1156, 10, 21, 'Case', 1152, 5287438, 10),
(1157, 10, 21, 'Case', 1153, 5287438, 10),
(1158, 10, 21, 'Case', 1154, 5287438, 10),
(1159, 10, 21, 'Case', 1155, 5287438, 10),
(1160, 10, 21, 'Case', 1156, 5287438, 10),
(1161, 10, 21, 'Case', 1157, 5287438, 10),
(1162, 10, 21, 'Case', 1158, 5287438, 10),
(1163, 10, 21, 'Case', 1159, 5287438, 10),
(1164, 10, 21, 'Case', 1160, 5287438, 10),
(1165, 10, 21, 'Case', 1161, 5287439, 10),
(1166, 10, 21, 'Case', 1162, 5287439, 10),
(1167, 10, 21, 'Case', 1163, 5287439, 10),
(1168, 10, 21, 'Case', 1164, 5287439, 10),
(1169, 10, 21, 'Case', 1165, 5287439, 10),
(1170, 10, 21, 'Case', 1166, 5287439, 10),
(1171, 10, 21, 'Case', 1167, 5287439, 10),
(1172, 10, 21, 'Case', 1168, 5287439, 10),
(1173, 10, 21, 'Case', 1169, 5287439, 10),
(1174, 10, 21, 'Case', 1170, 5287439, 10),
(1175, 10, 21, 'Case', 1171, 5287439, 10),
(1176, 10, 21, 'Case', 1172, 5287439, 10),
(1177, 10, 21, 'Case', 1173, 5287439, 10),
(1178, 10, 21, 'Case', 1174, 5287439, 10),
(1179, 10, 21, 'Case', 1175, 5287439, 10),
(1180, 10, 21, 'Case', 1176, 5287439, 10),
(1181, 10, 21, 'Case', 1177, 5287439, 10),
(1182, 10, 21, 'Case', 1178, 5287439, 10),
(1183, 10, 21, 'Case', 1179, 5287439, 10),
(1184, 10, 21, 'Case', 1180, 5287439, 10),
(1185, 10, 21, 'Case', 1181, 5287439, 10),
(1186, 10, 21, 'Case', 1182, 5287439, 10),
(1187, 10, 21, 'Case', 1183, 5287439, 10),
(1188, 10, 21, 'Case', 1184, 5287439, 10),
(1189, 10, 21, 'Case', 1185, 5287439, 10),
(1190, 10, 21, 'Case', 1186, 5287439, 10),
(1191, 10, 21, 'Case', 1187, 5287439, 10),
(1192, 10, 21, 'Case', 1188, 5287439, 10),
(1193, 10, 21, 'Case', 1189, 5287439, 10),
(1194, 10, 21, 'Case', 1190, 5287439, 10),
(1195, 10, 21, 'Case', 1191, 5287439, 10),
(1196, 10, 21, 'Case', 1192, 5287439, 10),
(1197, 10, 21, 'Case', 1193, 5287439, 10),
(1198, 10, 21, 'Case', 1194, 5287439, 10),
(1199, 10, 21, 'Case', 1195, 5287439, 10),
(1200, 10, 21, 'Case', 1196, 5287439, 10),
(1201, 10, 21, 'Case', 1197, 5287439, 10),
(1202, 10, 21, 'Case', 1198, 5287439, 10),
(1203, 10, 21, 'Case', 1199, 5287439, 10),
(1204, 10, 21, 'Case', 1200, 5287439, 10),
(1205, 10, 21, 'Case', 1201, 5287439, 10),
(1206, 10, 21, 'Case', 1202, 5287439, 10),
(1207, 10, 21, 'Case', 1203, 5287439, 10),
(1208, 10, 21, 'Case', 1204, 5287439, 10),
(1209, 10, 21, 'Case', 1205, 5287439, 10),
(1210, 10, 21, 'Case', 1206, 5287439, 10),
(1211, 10, 21, 'Case', 1207, 5287439, 10),
(1212, 10, 21, 'Case', 1208, 5287439, 10),
(1213, 10, 21, 'Case', 1209, 5287439, 10),
(1214, 10, 21, 'Case', 1210, 5287439, 10),
(1215, 10, 21, 'Case', 1211, 5287439, 10),
(1216, 10, 21, 'Case', 1212, 5287439, 10),
(1217, 10, 21, 'Case', 1213, 5287439, 10),
(1218, 10, 21, 'Case', 1214, 5287439, 10),
(1219, 10, 21, 'Case', 1215, 5287439, 10),
(1220, 10, 21, 'Case', 1216, 5287439, 10),
(1221, 10, 21, 'Case', 1217, 5287439, 10),
(1222, 10, 21, 'Case', 1218, 5287439, 10),
(1223, 10, 21, 'Case', 1219, 5287439, 10),
(1224, 10, 21, 'Case', 1220, 5287439, 10),
(1225, 10, 21, 'Case', 1221, 5287439, 10),
(1226, 10, 21, 'Case', 1222, 5287439, 10),
(1227, 10, 21, 'Case', 1223, 5287439, 10),
(1228, 10, 21, 'Case', 1224, 5287439, 10),
(1229, 10, 21, 'Case', 1225, 5287439, 10),
(1230, 10, 21, 'Case', 1226, 5287439, 10),
(1231, 10, 21, 'Case', 1227, 5287439, 10),
(1232, 10, 21, 'Case', 1228, 5287439, 10),
(1233, 10, 21, 'Case', 1229, 5287439, 10),
(1234, 10, 21, 'Case', 1230, 5287439, 10),
(1235, 10, 21, 'Case', 1231, 5287439, 10),
(1236, 10, 21, 'Case', 1232, 5287439, 10),
(1237, 10, 21, 'Case', 1233, 5287439, 10),
(1238, 10, 21, 'Case', 1234, 5287439, 10),
(1239, 10, 21, 'Case', 1235, 5287439, 10),
(1240, 10, 21, 'Case', 1236, 5287439, 10),
(1241, 10, 21, 'Case', 1237, 5287439, 10),
(1242, 10, 21, 'Case', 1238, 5287439, 10),
(1243, 10, 21, 'Case', 1239, 5287439, 10),
(1244, 10, 21, 'Case', 1240, 5287439, 10),
(1245, 10, 21, 'Case', 1241, 5287439, 10),
(1246, 10, 21, 'Case', 1242, 5287439, 10),
(1247, 10, 21, 'Case', 1243, 5287439, 10),
(1248, 10, 21, 'Case', 1244, 5287439, 10),
(1249, 10, 21, 'Case', 1245, 5287439, 10),
(1250, 10, 21, 'Case', 1246, 5287439, 10),
(1251, 10, 21, 'Case', 1247, 5287439, 10),
(1252, 10, 21, 'Case', 1248, 5287439, 10),
(1253, 10, 21, 'Case', 1249, 5287439, 10),
(1254, 10, 21, 'Case', 1250, 5287439, 10),
(1255, 10, 21, 'Case', 1251, 5287439, 10),
(1256, 10, 21, 'Case', 1252, 5287439, 10),
(1257, 10, 21, 'Case', 1253, 5287439, 10),
(1258, 10, 21, 'Case', 1254, 5287439, 10),
(1259, 10, 21, 'Case', 1255, 5287439, 10),
(1260, 10, 21, 'Case', 1256, 5287439, 10),
(1261, 10, 21, 'Case', 1257, 5287439, 10),
(1262, 10, 21, 'Case', 1258, 5287439, 10),
(1263, 10, 21, 'Case', 1259, 5287439, 10),
(1264, 10, 21, 'Case', 1260, 5287439, 10),
(1265, 10, 21, 'Case', 1261, 5287440, 10),
(1266, 10, 21, 'Case', 1262, 5287440, 10),
(1267, 10, 21, 'Case', 1263, 5287440, 10),
(1268, 10, 21, 'Case', 1264, 5287440, 10),
(1269, 10, 21, 'Case', 1265, 5287440, 10),
(1270, 10, 21, 'Case', 1266, 5287440, 10),
(1271, 10, 21, 'Case', 1267, 5287440, 10),
(1272, 10, 21, 'Case', 1268, 5287440, 10),
(1273, 10, 21, 'Case', 1269, 5287440, 10),
(1274, 10, 21, 'Case', 1270, 5287440, 10),
(1275, 10, 21, 'Case', 1271, 5287440, 10),
(1276, 10, 21, 'Case', 1272, 5287440, 10),
(1277, 10, 21, 'Case', 1273, 5287440, 10);
INSERT INTO `tp_package_case` (`id`, `product_id`, `lot_id`, `package_level`, `primary_package_id`, `package_sn`, `inner_primary_pack_count`) VALUES
(1278, 10, 21, 'Case', 1274, 5287440, 10),
(1279, 10, 21, 'Case', 1275, 5287440, 10),
(1280, 10, 21, 'Case', 1276, 5287440, 10),
(1281, 10, 21, 'Case', 1277, 5287440, 10),
(1282, 10, 21, 'Case', 1278, 5287440, 10),
(1283, 10, 21, 'Case', 1279, 5287440, 10),
(1284, 10, 21, 'Case', 1280, 5287440, 10),
(1285, 10, 21, 'Case', 1281, 5287440, 10),
(1286, 10, 21, 'Case', 1282, 5287440, 10),
(1287, 10, 21, 'Case', 1283, 5287440, 10),
(1288, 10, 21, 'Case', 1284, 5287440, 10),
(1289, 10, 21, 'Case', 1285, 5287440, 10),
(1290, 10, 21, 'Case', 1286, 5287440, 10),
(1291, 10, 21, 'Case', 1287, 5287440, 10),
(1292, 10, 21, 'Case', 1288, 5287440, 10),
(1293, 10, 21, 'Case', 1289, 5287440, 10),
(1294, 10, 21, 'Case', 1290, 5287440, 10),
(1295, 10, 21, 'Case', 1291, 5287440, 10),
(1296, 10, 21, 'Case', 1292, 5287440, 10),
(1297, 10, 21, 'Case', 1293, 5287440, 10),
(1298, 10, 21, 'Case', 1294, 5287440, 10),
(1299, 10, 21, 'Case', 1295, 5287440, 10),
(1300, 10, 21, 'Case', 1296, 5287440, 10),
(1301, 10, 21, 'Case', 1297, 5287440, 10),
(1302, 10, 21, 'Case', 1298, 5287440, 10),
(1303, 10, 21, 'Case', 1299, 5287440, 10),
(1304, 10, 21, 'Case', 1300, 5287440, 10),
(1305, 10, 21, 'Case', 1301, 5287440, 10),
(1306, 10, 21, 'Case', 1302, 5287440, 10),
(1307, 10, 21, 'Case', 1303, 5287440, 10),
(1308, 10, 21, 'Case', 1304, 5287440, 10),
(1309, 10, 21, 'Case', 1305, 5287440, 10),
(1310, 10, 21, 'Case', 1306, 5287440, 10),
(1311, 10, 21, 'Case', 1307, 5287440, 10),
(1312, 10, 21, 'Case', 1308, 5287440, 10),
(1313, 10, 21, 'Case', 1309, 5287440, 10),
(1314, 10, 21, 'Case', 1310, 5287440, 10),
(1315, 10, 21, 'Case', 1311, 5287440, 10),
(1316, 10, 21, 'Case', 1312, 5287440, 10),
(1317, 10, 21, 'Case', 1313, 5287440, 10),
(1318, 10, 21, 'Case', 1314, 5287440, 10),
(1319, 10, 21, 'Case', 1315, 5287440, 10),
(1320, 10, 21, 'Case', 1316, 5287440, 10),
(1321, 10, 21, 'Case', 1317, 5287440, 10),
(1322, 10, 21, 'Case', 1318, 5287440, 10),
(1323, 10, 21, 'Case', 1319, 5287440, 10),
(1324, 10, 21, 'Case', 1320, 5287440, 10),
(1325, 10, 21, 'Case', 1321, 5287440, 10),
(1326, 10, 21, 'Case', 1322, 5287440, 10),
(1327, 10, 21, 'Case', 1323, 5287440, 10),
(1328, 10, 21, 'Case', 1324, 5287440, 10),
(1329, 10, 21, 'Case', 1325, 5287440, 10),
(1330, 10, 21, 'Case', 1326, 5287440, 10),
(1331, 10, 21, 'Case', 1327, 5287440, 10),
(1332, 10, 21, 'Case', 1328, 5287440, 10),
(1333, 10, 21, 'Case', 1329, 5287440, 10),
(1334, 10, 21, 'Case', 1330, 5287440, 10),
(1335, 10, 21, 'Case', 1331, 5287440, 10),
(1336, 10, 21, 'Case', 1332, 5287440, 10),
(1337, 10, 21, 'Case', 1333, 5287440, 10),
(1338, 10, 21, 'Case', 1334, 5287440, 10),
(1339, 10, 21, 'Case', 1335, 5287440, 10),
(1340, 10, 21, 'Case', 1336, 5287440, 10),
(1341, 10, 21, 'Case', 1337, 5287440, 10),
(1342, 10, 21, 'Case', 1338, 5287440, 10),
(1343, 10, 21, 'Case', 1339, 5287440, 10),
(1344, 10, 21, 'Case', 1340, 5287440, 10),
(1345, 10, 21, 'Case', 1341, 5287440, 10),
(1346, 10, 21, 'Case', 1342, 5287440, 10),
(1347, 10, 21, 'Case', 1343, 5287440, 10),
(1348, 10, 21, 'Case', 1344, 5287440, 10),
(1349, 10, 21, 'Case', 1345, 5287440, 10),
(1350, 10, 21, 'Case', 1346, 5287440, 10),
(1351, 10, 21, 'Case', 1347, 5287440, 10),
(1352, 10, 21, 'Case', 1348, 5287440, 10),
(1353, 10, 21, 'Case', 1349, 5287440, 10),
(1354, 10, 21, 'Case', 1350, 5287440, 10),
(1355, 10, 21, 'Case', 1351, 5287440, 10),
(1356, 10, 21, 'Case', 1352, 5287440, 10),
(1357, 10, 21, 'Case', 1353, 5287440, 10),
(1358, 10, 21, 'Case', 1354, 5287440, 10),
(1359, 10, 21, 'Case', 1355, 5287440, 10),
(1360, 10, 21, 'Case', 1356, 5287440, 10),
(1361, 10, 21, 'Case', 1357, 5287440, 10),
(1362, 10, 21, 'Case', 1358, 5287440, 10),
(1363, 10, 21, 'Case', 1359, 5287440, 10),
(1364, 10, 21, 'Case', 1360, 5287440, 10),
(1365, 10, 21, 'Case', 1361, 5287441, 10),
(1366, 10, 21, 'Case', 1362, 5287441, 10),
(1367, 10, 21, 'Case', 1363, 5287441, 10),
(1368, 10, 21, 'Case', 1364, 5287441, 10),
(1369, 10, 21, 'Case', 1365, 5287441, 10),
(1370, 10, 21, 'Case', 1366, 5287441, 10),
(1371, 10, 21, 'Case', 1367, 5287441, 10),
(1372, 10, 21, 'Case', 1368, 5287441, 10),
(1373, 10, 21, 'Case', 1369, 5287441, 10),
(1374, 10, 21, 'Case', 1370, 5287441, 10),
(1375, 10, 21, 'Case', 1371, 5287441, 10),
(1376, 10, 21, 'Case', 1372, 5287441, 10),
(1377, 10, 21, 'Case', 1373, 5287441, 10),
(1378, 10, 21, 'Case', 1374, 5287441, 10),
(1379, 10, 21, 'Case', 1375, 5287441, 10),
(1380, 10, 21, 'Case', 1376, 5287441, 10),
(1381, 10, 21, 'Case', 1377, 5287441, 10),
(1382, 10, 21, 'Case', 1378, 5287441, 10),
(1383, 10, 21, 'Case', 1379, 5287441, 10),
(1384, 10, 21, 'Case', 1380, 5287441, 10),
(1385, 10, 21, 'Case', 1381, 5287441, 10),
(1386, 10, 21, 'Case', 1382, 5287441, 10),
(1387, 10, 21, 'Case', 1383, 5287441, 10),
(1388, 10, 21, 'Case', 1384, 5287441, 10),
(1389, 10, 21, 'Case', 1385, 5287441, 10),
(1390, 10, 21, 'Case', 1386, 5287441, 10),
(1391, 10, 21, 'Case', 1387, 5287441, 10),
(1392, 10, 21, 'Case', 1388, 5287441, 10),
(1393, 10, 21, 'Case', 1389, 5287441, 10),
(1394, 10, 21, 'Case', 1390, 5287441, 10),
(1395, 10, 21, 'Case', 1391, 5287441, 10),
(1396, 10, 21, 'Case', 1392, 5287441, 10),
(1397, 10, 21, 'Case', 1393, 5287441, 10),
(1398, 10, 21, 'Case', 1394, 5287441, 10),
(1399, 10, 21, 'Case', 1395, 5287441, 10),
(1400, 10, 21, 'Case', 1396, 5287441, 10),
(1401, 10, 21, 'Case', 1397, 5287441, 10),
(1402, 10, 21, 'Case', 1398, 5287441, 10),
(1403, 10, 21, 'Case', 1399, 5287441, 10),
(1404, 10, 21, 'Case', 1400, 5287441, 10),
(1405, 10, 21, 'Case', 1401, 5287441, 10),
(1406, 10, 21, 'Case', 1402, 5287441, 10),
(1407, 10, 21, 'Case', 1403, 5287441, 10),
(1408, 10, 21, 'Case', 1404, 5287441, 10),
(1409, 10, 21, 'Case', 1405, 5287441, 10),
(1410, 10, 21, 'Case', 1406, 5287441, 10),
(1411, 10, 21, 'Case', 1407, 5287441, 10),
(1412, 10, 21, 'Case', 1408, 5287441, 10),
(1413, 10, 21, 'Case', 1409, 5287441, 10),
(1414, 10, 21, 'Case', 1410, 5287441, 10),
(1415, 10, 21, 'Case', 1411, 5287441, 10),
(1416, 10, 21, 'Case', 1412, 5287441, 10),
(1417, 10, 21, 'Case', 1413, 5287441, 10),
(1418, 10, 21, 'Case', 1414, 5287441, 10),
(1419, 10, 21, 'Case', 1415, 5287441, 10),
(1420, 10, 21, 'Case', 1416, 5287441, 10),
(1421, 10, 21, 'Case', 1417, 5287441, 10),
(1422, 10, 21, 'Case', 1418, 5287441, 10),
(1423, 10, 21, 'Case', 1419, 5287441, 10),
(1424, 10, 21, 'Case', 1420, 5287441, 10),
(1425, 10, 21, 'Case', 1421, 5287441, 10),
(1426, 10, 21, 'Case', 1422, 5287441, 10),
(1427, 10, 21, 'Case', 1423, 5287441, 10),
(1428, 10, 21, 'Case', 1424, 5287441, 10),
(1429, 10, 21, 'Case', 1425, 5287441, 10),
(1430, 10, 21, 'Case', 1426, 5287441, 10),
(1431, 10, 21, 'Case', 1427, 5287441, 10),
(1432, 10, 21, 'Case', 1428, 5287441, 10),
(1433, 10, 21, 'Case', 1429, 5287441, 10),
(1434, 10, 21, 'Case', 1430, 5287441, 10),
(1435, 10, 21, 'Case', 1431, 5287441, 10),
(1436, 10, 21, 'Case', 1432, 5287441, 10),
(1437, 10, 21, 'Case', 1433, 5287441, 10),
(1438, 10, 21, 'Case', 1434, 5287441, 10),
(1439, 10, 21, 'Case', 1435, 5287441, 10),
(1440, 10, 21, 'Case', 1436, 5287441, 10),
(1441, 10, 21, 'Case', 1437, 5287441, 10),
(1442, 10, 21, 'Case', 1438, 5287441, 10),
(1443, 10, 21, 'Case', 1439, 5287441, 10),
(1444, 10, 21, 'Case', 1440, 5287441, 10),
(1445, 10, 21, 'Case', 1441, 5287441, 10),
(1446, 10, 21, 'Case', 1442, 5287441, 10),
(1447, 10, 21, 'Case', 1443, 5287441, 10),
(1448, 10, 21, 'Case', 1444, 5287441, 10),
(1449, 10, 21, 'Case', 1445, 5287441, 10),
(1450, 10, 21, 'Case', 1446, 5287441, 10),
(1451, 10, 21, 'Case', 1447, 5287441, 10),
(1452, 10, 21, 'Case', 1448, 5287441, 10),
(1453, 10, 21, 'Case', 1449, 5287441, 10),
(1454, 10, 21, 'Case', 1450, 5287441, 10),
(1455, 10, 21, 'Case', 1451, 5287441, 10),
(1456, 10, 21, 'Case', 1452, 5287441, 10),
(1457, 10, 21, 'Case', 1453, 5287441, 10),
(1458, 10, 21, 'Case', 1454, 5287441, 10),
(1459, 10, 21, 'Case', 1455, 5287441, 10),
(1460, 10, 21, 'Case', 1456, 5287441, 10),
(1461, 10, 21, 'Case', 1457, 5287441, 10),
(1462, 10, 21, 'Case', 1458, 5287441, 10),
(1463, 10, 21, 'Case', 1459, 5287441, 10),
(1464, 10, 21, 'Case', 1460, 5287441, 10),
(1465, 10, 21, 'Case', 1461, 5287442, 10),
(1466, 10, 21, 'Case', 1462, 5287442, 10),
(1467, 10, 21, 'Case', 1463, 5287442, 10),
(1468, 10, 21, 'Case', 1464, 5287442, 10),
(1469, 10, 21, 'Case', 1465, 5287442, 10),
(1470, 10, 21, 'Case', 1466, 5287442, 10),
(1471, 10, 21, 'Case', 1467, 5287442, 10),
(1472, 10, 21, 'Case', 1468, 5287442, 10),
(1473, 10, 21, 'Case', 1469, 5287442, 10),
(1474, 10, 21, 'Case', 1470, 5287442, 10),
(1475, 10, 21, 'Case', 1471, 5287442, 10),
(1476, 10, 21, 'Case', 1472, 5287442, 10),
(1477, 10, 21, 'Case', 1473, 5287442, 10),
(1478, 10, 21, 'Case', 1474, 5287442, 10),
(1479, 10, 21, 'Case', 1475, 5287442, 10),
(1480, 10, 21, 'Case', 1476, 5287442, 10),
(1481, 10, 21, 'Case', 1477, 5287442, 10),
(1482, 10, 21, 'Case', 1478, 5287442, 10),
(1483, 10, 21, 'Case', 1479, 5287442, 10),
(1484, 10, 21, 'Case', 1480, 5287442, 10),
(1485, 10, 21, 'Case', 1481, 5287442, 10),
(1486, 10, 21, 'Case', 1482, 5287442, 10),
(1487, 10, 21, 'Case', 1483, 5287442, 10),
(1488, 10, 21, 'Case', 1484, 5287442, 10),
(1489, 10, 21, 'Case', 1485, 5287442, 10),
(1490, 10, 21, 'Case', 1486, 5287442, 10),
(1491, 10, 21, 'Case', 1487, 5287442, 10),
(1492, 10, 21, 'Case', 1488, 5287442, 10),
(1493, 10, 21, 'Case', 1489, 5287442, 10),
(1494, 10, 21, 'Case', 1490, 5287442, 10),
(1495, 10, 21, 'Case', 1491, 5287442, 10),
(1496, 10, 21, 'Case', 1492, 5287442, 10),
(1497, 10, 21, 'Case', 1493, 5287442, 10),
(1498, 10, 21, 'Case', 1494, 5287442, 10),
(1499, 10, 21, 'Case', 1495, 5287442, 10),
(1500, 10, 21, 'Case', 1496, 5287442, 10),
(1501, 10, 21, 'Case', 1497, 5287442, 10),
(1502, 10, 21, 'Case', 1498, 5287442, 10),
(1503, 10, 21, 'Case', 1499, 5287442, 10),
(1504, 10, 21, 'Case', 1500, 5287442, 10),
(1505, 10, 21, 'Case', 1501, 5287442, 10),
(1506, 10, 21, 'Case', 1502, 5287442, 10),
(1507, 10, 21, 'Case', 1503, 5287442, 10),
(1508, 10, 21, 'Case', 1504, 5287442, 10),
(1509, 10, 21, 'Case', 1505, 5287442, 10),
(1510, 10, 21, 'Case', 1506, 5287442, 10),
(1511, 10, 21, 'Case', 1507, 5287442, 10),
(1512, 10, 21, 'Case', 1508, 5287442, 10),
(1513, 10, 21, 'Case', 1509, 5287442, 10),
(1514, 10, 21, 'Case', 1510, 5287442, 10),
(1515, 10, 21, 'Case', 1511, 5287442, 10),
(1516, 10, 21, 'Case', 1512, 5287442, 10),
(1517, 10, 21, 'Case', 1513, 5287442, 10),
(1518, 10, 21, 'Case', 1514, 5287442, 10),
(1519, 10, 21, 'Case', 1515, 5287442, 10),
(1520, 10, 21, 'Case', 1516, 5287442, 10),
(1521, 10, 21, 'Case', 1517, 5287442, 10),
(1522, 10, 21, 'Case', 1518, 5287442, 10),
(1523, 10, 21, 'Case', 1519, 5287442, 10),
(1524, 10, 21, 'Case', 1520, 5287442, 10),
(1525, 10, 21, 'Case', 1521, 5287442, 10),
(1526, 10, 21, 'Case', 1522, 5287442, 10),
(1527, 10, 21, 'Case', 1523, 5287442, 10),
(1528, 10, 21, 'Case', 1524, 5287442, 10),
(1529, 10, 21, 'Case', 1525, 5287442, 10),
(1530, 10, 21, 'Case', 1526, 5287442, 10),
(1531, 10, 21, 'Case', 1527, 5287442, 10),
(1532, 10, 21, 'Case', 1528, 5287442, 10),
(1533, 10, 21, 'Case', 1529, 5287442, 10),
(1534, 10, 21, 'Case', 1530, 5287442, 10),
(1535, 10, 21, 'Case', 1531, 5287442, 10),
(1536, 10, 21, 'Case', 1532, 5287442, 10),
(1537, 10, 21, 'Case', 1533, 5287442, 10),
(1538, 10, 21, 'Case', 1534, 5287442, 10),
(1539, 10, 21, 'Case', 1535, 5287442, 10),
(1540, 10, 21, 'Case', 1536, 5287442, 10),
(1541, 10, 21, 'Case', 1537, 5287442, 10),
(1542, 10, 21, 'Case', 1538, 5287442, 10),
(1543, 10, 21, 'Case', 1539, 5287442, 10),
(1544, 10, 21, 'Case', 1540, 5287442, 10),
(1545, 10, 21, 'Case', 1541, 5287442, 10),
(1546, 10, 21, 'Case', 1542, 5287442, 10),
(1547, 10, 21, 'Case', 1543, 5287442, 10),
(1548, 10, 21, 'Case', 1544, 5287442, 10),
(1549, 10, 21, 'Case', 1545, 5287442, 10),
(1550, 10, 21, 'Case', 1546, 5287442, 10),
(1551, 10, 21, 'Case', 1547, 5287442, 10),
(1552, 10, 21, 'Case', 1548, 5287442, 10),
(1553, 10, 21, 'Case', 1549, 5287442, 10),
(1554, 10, 21, 'Case', 1550, 5287442, 10),
(1555, 10, 21, 'Case', 1551, 5287442, 10),
(1556, 10, 21, 'Case', 1552, 5287442, 10),
(1557, 10, 21, 'Case', 1553, 5287442, 10),
(1558, 10, 21, 'Case', 1554, 5287442, 10),
(1559, 10, 21, 'Case', 1555, 5287442, 10),
(1560, 10, 21, 'Case', 1556, 5287442, 10),
(1561, 10, 21, 'Case', 1557, 5287442, 10),
(1562, 10, 21, 'Case', 1558, 5287442, 10),
(1563, 10, 21, 'Case', 1559, 5287442, 10),
(1564, 10, 21, 'Case', 1560, 5287442, 10),
(1565, 10, 21, 'Case', 1561, 5287443, 10),
(1566, 10, 21, 'Case', 1562, 5287443, 10),
(1567, 10, 21, 'Case', 1563, 5287443, 10),
(1568, 10, 21, 'Case', 1564, 5287443, 10),
(1569, 10, 21, 'Case', 1565, 5287443, 10),
(1570, 10, 21, 'Case', 1566, 5287443, 10),
(1571, 10, 21, 'Case', 1567, 5287443, 10),
(1572, 10, 21, 'Case', 1568, 5287443, 10),
(1573, 10, 21, 'Case', 1569, 5287443, 10),
(1574, 10, 21, 'Case', 1570, 5287443, 10),
(1575, 10, 21, 'Case', 1571, 5287443, 10),
(1576, 10, 21, 'Case', 1572, 5287443, 10),
(1577, 10, 21, 'Case', 1573, 5287443, 10),
(1578, 10, 21, 'Case', 1574, 5287443, 10),
(1579, 10, 21, 'Case', 1575, 5287443, 10),
(1580, 10, 21, 'Case', 1576, 5287443, 10),
(1581, 10, 21, 'Case', 1577, 5287443, 10),
(1582, 10, 21, 'Case', 1578, 5287443, 10),
(1583, 10, 21, 'Case', 1579, 5287443, 10),
(1584, 10, 21, 'Case', 1580, 5287443, 10),
(1585, 10, 21, 'Case', 1581, 5287443, 10),
(1586, 10, 21, 'Case', 1582, 5287443, 10),
(1587, 10, 21, 'Case', 1583, 5287443, 10),
(1588, 10, 21, 'Case', 1584, 5287443, 10),
(1589, 10, 21, 'Case', 1585, 5287443, 10),
(1590, 10, 21, 'Case', 1586, 5287443, 10),
(1591, 10, 21, 'Case', 1587, 5287443, 10),
(1592, 10, 21, 'Case', 1588, 5287443, 10),
(1593, 10, 21, 'Case', 1589, 5287443, 10),
(1594, 10, 21, 'Case', 1590, 5287443, 10),
(1595, 10, 21, 'Case', 1591, 5287443, 10),
(1596, 10, 21, 'Case', 1592, 5287443, 10),
(1597, 10, 21, 'Case', 1593, 5287443, 10),
(1598, 10, 21, 'Case', 1594, 5287443, 10),
(1599, 10, 21, 'Case', 1595, 5287443, 10),
(1600, 10, 21, 'Case', 1596, 5287443, 10),
(1601, 10, 21, 'Case', 1597, 5287443, 10),
(1602, 10, 21, 'Case', 1598, 5287443, 10),
(1603, 10, 21, 'Case', 1599, 5287443, 10),
(1604, 10, 21, 'Case', 1600, 5287443, 10),
(1605, 10, 21, 'Case', 1601, 5287443, 10),
(1606, 10, 21, 'Case', 1602, 5287443, 10),
(1607, 10, 21, 'Case', 1603, 5287443, 10),
(1608, 10, 21, 'Case', 1604, 5287443, 10),
(1609, 10, 21, 'Case', 1605, 5287443, 10),
(1610, 10, 21, 'Case', 1606, 5287443, 10),
(1611, 10, 21, 'Case', 1607, 5287443, 10),
(1612, 10, 21, 'Case', 1608, 5287443, 10),
(1613, 10, 21, 'Case', 1609, 5287443, 10),
(1614, 10, 21, 'Case', 1610, 5287443, 10),
(1615, 10, 21, 'Case', 1611, 5287443, 10),
(1616, 10, 21, 'Case', 1612, 5287443, 10),
(1617, 10, 21, 'Case', 1613, 5287443, 10),
(1618, 10, 21, 'Case', 1614, 5287443, 10),
(1619, 10, 21, 'Case', 1615, 5287443, 10),
(1620, 10, 21, 'Case', 1616, 5287443, 10),
(1621, 10, 21, 'Case', 1617, 5287443, 10),
(1622, 10, 21, 'Case', 1618, 5287443, 10),
(1623, 10, 21, 'Case', 1619, 5287443, 10),
(1624, 10, 21, 'Case', 1620, 5287443, 10),
(1625, 10, 21, 'Case', 1621, 5287443, 10),
(1626, 10, 21, 'Case', 1622, 5287443, 10),
(1627, 10, 21, 'Case', 1623, 5287443, 10),
(1628, 10, 21, 'Case', 1624, 5287443, 10),
(1629, 10, 21, 'Case', 1625, 5287443, 10),
(1630, 10, 21, 'Case', 1626, 5287443, 10),
(1631, 10, 21, 'Case', 1627, 5287443, 10),
(1632, 10, 21, 'Case', 1628, 5287443, 10),
(1633, 10, 21, 'Case', 1629, 5287443, 10),
(1634, 10, 21, 'Case', 1630, 5287443, 10),
(1635, 10, 21, 'Case', 1631, 5287443, 10),
(1636, 10, 21, 'Case', 1632, 5287443, 10),
(1637, 10, 21, 'Case', 1633, 5287443, 10),
(1638, 10, 21, 'Case', 1634, 5287443, 10),
(1639, 10, 21, 'Case', 1635, 5287443, 10),
(1640, 10, 21, 'Case', 1636, 5287443, 10),
(1641, 10, 21, 'Case', 1637, 5287443, 10),
(1642, 10, 21, 'Case', 1638, 5287443, 10),
(1643, 10, 21, 'Case', 1639, 5287443, 10),
(1644, 10, 21, 'Case', 1640, 5287443, 10),
(1645, 10, 21, 'Case', 1641, 5287443, 10),
(1646, 10, 21, 'Case', 1642, 5287443, 10),
(1647, 10, 21, 'Case', 1643, 5287443, 10),
(1648, 10, 21, 'Case', 1644, 5287443, 10),
(1649, 10, 21, 'Case', 1645, 5287443, 10),
(1650, 10, 21, 'Case', 1646, 5287443, 10),
(1651, 10, 21, 'Case', 1647, 5287443, 10),
(1652, 10, 21, 'Case', 1648, 5287443, 10),
(1653, 10, 21, 'Case', 1649, 5287443, 10),
(1654, 10, 21, 'Case', 1650, 5287443, 10),
(1655, 10, 21, 'Case', 1651, 5287443, 10),
(1656, 10, 21, 'Case', 1652, 5287443, 10),
(1657, 10, 21, 'Case', 1653, 5287443, 10),
(1658, 10, 21, 'Case', 1654, 5287443, 10),
(1659, 10, 21, 'Case', 1655, 5287443, 10),
(1660, 10, 21, 'Case', 1656, 5287443, 10),
(1661, 10, 21, 'Case', 1657, 5287443, 10),
(1662, 10, 21, 'Case', 1658, 5287443, 10),
(1663, 10, 21, 'Case', 1659, 5287443, 10),
(1664, 10, 21, 'Case', 1660, 5287443, 10),
(1665, 10, 21, 'Case', 1661, 5287444, 10),
(1666, 10, 21, 'Case', 1662, 5287444, 10),
(1667, 10, 21, 'Case', 1663, 5287444, 10),
(1668, 10, 21, 'Case', 1664, 5287444, 10),
(1669, 10, 21, 'Case', 1665, 5287444, 10),
(1670, 10, 21, 'Case', 1666, 5287444, 10),
(1671, 10, 21, 'Case', 1667, 5287444, 10),
(1672, 10, 21, 'Case', 1668, 5287444, 10),
(1673, 10, 21, 'Case', 1669, 5287444, 10),
(1674, 10, 21, 'Case', 1670, 5287444, 10),
(1675, 10, 21, 'Case', 1671, 5287444, 10),
(1676, 10, 21, 'Case', 1672, 5287444, 10),
(1677, 10, 21, 'Case', 1673, 5287444, 10),
(1678, 10, 21, 'Case', 1674, 5287444, 10),
(1679, 10, 21, 'Case', 1675, 5287444, 10),
(1680, 10, 21, 'Case', 1676, 5287444, 10),
(1681, 10, 21, 'Case', 1677, 5287444, 10),
(1682, 10, 21, 'Case', 1678, 5287444, 10),
(1683, 10, 21, 'Case', 1679, 5287444, 10),
(1684, 10, 21, 'Case', 1680, 5287444, 10),
(1685, 10, 21, 'Case', 1681, 5287444, 10),
(1686, 10, 21, 'Case', 1682, 5287444, 10),
(1687, 10, 21, 'Case', 1683, 5287444, 10),
(1688, 10, 21, 'Case', 1684, 5287444, 10),
(1689, 10, 21, 'Case', 1685, 5287444, 10),
(1690, 10, 21, 'Case', 1686, 5287444, 10),
(1691, 10, 21, 'Case', 1687, 5287444, 10),
(1692, 10, 21, 'Case', 1688, 5287444, 10),
(1693, 10, 21, 'Case', 1689, 5287444, 10),
(1694, 10, 21, 'Case', 1690, 5287444, 10),
(1695, 10, 21, 'Case', 1691, 5287444, 10),
(1696, 10, 21, 'Case', 1692, 5287444, 10),
(1697, 10, 21, 'Case', 1693, 5287444, 10),
(1698, 10, 21, 'Case', 1694, 5287444, 10),
(1699, 10, 21, 'Case', 1695, 5287444, 10),
(1700, 10, 21, 'Case', 1696, 5287444, 10),
(1701, 10, 21, 'Case', 1697, 5287444, 10),
(1702, 10, 21, 'Case', 1698, 5287444, 10),
(1703, 10, 21, 'Case', 1699, 5287444, 10),
(1704, 10, 21, 'Case', 1700, 5287444, 10),
(1705, 10, 21, 'Case', 1701, 5287444, 10),
(1706, 10, 21, 'Case', 1702, 5287444, 10),
(1707, 10, 21, 'Case', 1703, 5287444, 10),
(1708, 10, 21, 'Case', 1704, 5287444, 10),
(1709, 10, 21, 'Case', 1705, 5287444, 10),
(1710, 10, 21, 'Case', 1706, 5287444, 10),
(1711, 10, 21, 'Case', 1707, 5287444, 10),
(1712, 10, 21, 'Case', 1708, 5287444, 10),
(1713, 10, 21, 'Case', 1709, 5287444, 10),
(1714, 10, 21, 'Case', 1710, 5287444, 10),
(1715, 10, 21, 'Case', 1711, 5287444, 10),
(1716, 10, 21, 'Case', 1712, 5287444, 10),
(1717, 10, 21, 'Case', 1713, 5287444, 10),
(1718, 10, 21, 'Case', 1714, 5287444, 10),
(1719, 10, 21, 'Case', 1715, 5287444, 10),
(1720, 10, 21, 'Case', 1716, 5287444, 10),
(1721, 10, 21, 'Case', 1717, 5287444, 10),
(1722, 10, 21, 'Case', 1718, 5287444, 10),
(1723, 10, 21, 'Case', 1719, 5287444, 10),
(1724, 10, 21, 'Case', 1720, 5287444, 10),
(1725, 10, 21, 'Case', 1721, 5287444, 10),
(1726, 10, 21, 'Case', 1722, 5287444, 10),
(1727, 10, 21, 'Case', 1723, 5287444, 10),
(1728, 10, 21, 'Case', 1724, 5287444, 10),
(1729, 10, 21, 'Case', 1725, 5287444, 10),
(1730, 10, 21, 'Case', 1726, 5287444, 10),
(1731, 10, 21, 'Case', 1727, 5287444, 10),
(1732, 10, 21, 'Case', 1728, 5287444, 10),
(1733, 10, 21, 'Case', 1729, 5287444, 10),
(1734, 10, 21, 'Case', 1730, 5287444, 10),
(1735, 10, 21, 'Case', 1731, 5287444, 10),
(1736, 10, 21, 'Case', 1732, 5287444, 10),
(1737, 10, 21, 'Case', 1733, 5287444, 10),
(1738, 10, 21, 'Case', 1734, 5287444, 10),
(1739, 10, 21, 'Case', 1735, 5287444, 10),
(1740, 10, 21, 'Case', 1736, 5287444, 10),
(1741, 10, 21, 'Case', 1737, 5287444, 10),
(1742, 10, 21, 'Case', 1738, 5287444, 10),
(1743, 10, 21, 'Case', 1739, 5287444, 10),
(1744, 10, 21, 'Case', 1740, 5287444, 10),
(1745, 10, 21, 'Case', 1741, 5287444, 10),
(1746, 10, 21, 'Case', 1742, 5287444, 10),
(1747, 10, 21, 'Case', 1743, 5287444, 10),
(1748, 10, 21, 'Case', 1744, 5287444, 10),
(1749, 10, 21, 'Case', 1745, 5287444, 10),
(1750, 10, 21, 'Case', 1746, 5287444, 10),
(1751, 10, 21, 'Case', 1747, 5287444, 10),
(1752, 10, 21, 'Case', 1748, 5287444, 10),
(1753, 10, 21, 'Case', 1749, 5287444, 10),
(1754, 10, 21, 'Case', 1750, 5287444, 10),
(1755, 10, 21, 'Case', 1751, 5287444, 10),
(1756, 10, 21, 'Case', 1752, 5287444, 10),
(1757, 10, 21, 'Case', 1753, 5287444, 10),
(1758, 10, 21, 'Case', 1754, 5287444, 10),
(1759, 10, 21, 'Case', 1755, 5287444, 10),
(1760, 10, 21, 'Case', 1756, 5287444, 10),
(1761, 10, 21, 'Case', 1757, 5287444, 10),
(1762, 10, 21, 'Case', 1758, 5287444, 10),
(1763, 10, 21, 'Case', 1759, 5287444, 10),
(1764, 10, 21, 'Case', 1760, 5287444, 10),
(1765, 10, 21, 'Case', 1761, 5287445, 10),
(1766, 10, 21, 'Case', 1762, 5287445, 10),
(1767, 10, 21, 'Case', 1763, 5287445, 10),
(1768, 10, 21, 'Case', 1764, 5287445, 10),
(1769, 10, 21, 'Case', 1765, 5287445, 10),
(1770, 10, 21, 'Case', 1766, 5287445, 10),
(1771, 10, 21, 'Case', 1767, 5287445, 10),
(1772, 10, 21, 'Case', 1768, 5287445, 10),
(1773, 10, 21, 'Case', 1769, 5287445, 10),
(1774, 10, 21, 'Case', 1770, 5287445, 10),
(1775, 10, 21, 'Case', 1771, 5287445, 10),
(1776, 10, 21, 'Case', 1772, 5287445, 10),
(1777, 10, 21, 'Case', 1773, 5287445, 10),
(1778, 10, 21, 'Case', 1774, 5287445, 10),
(1779, 10, 21, 'Case', 1775, 5287445, 10),
(1780, 10, 21, 'Case', 1776, 5287445, 10),
(1781, 10, 21, 'Case', 1777, 5287445, 10),
(1782, 10, 21, 'Case', 1778, 5287445, 10),
(1783, 10, 21, 'Case', 1779, 5287445, 10),
(1784, 10, 21, 'Case', 1780, 5287445, 10),
(1785, 10, 21, 'Case', 1781, 5287445, 10),
(1786, 10, 21, 'Case', 1782, 5287445, 10),
(1787, 10, 21, 'Case', 1783, 5287445, 10),
(1788, 10, 21, 'Case', 1784, 5287445, 10),
(1789, 10, 21, 'Case', 1785, 5287445, 10),
(1790, 10, 21, 'Case', 1786, 5287445, 10),
(1791, 10, 21, 'Case', 1787, 5287445, 10),
(1792, 10, 21, 'Case', 1788, 5287445, 10),
(1793, 10, 21, 'Case', 1789, 5287445, 10),
(1794, 10, 21, 'Case', 1790, 5287445, 10),
(1795, 10, 21, 'Case', 1791, 5287445, 10),
(1796, 10, 21, 'Case', 1792, 5287445, 10),
(1797, 10, 21, 'Case', 1793, 5287445, 10),
(1798, 10, 21, 'Case', 1794, 5287445, 10),
(1799, 10, 21, 'Case', 1795, 5287445, 10),
(1800, 10, 21, 'Case', 1796, 5287445, 10),
(1801, 10, 21, 'Case', 1797, 5287445, 10),
(1802, 10, 21, 'Case', 1798, 5287445, 10),
(1803, 10, 21, 'Case', 1799, 5287445, 10),
(1804, 10, 21, 'Case', 1800, 5287445, 10),
(1805, 10, 21, 'Case', 1801, 5287445, 10),
(1806, 10, 21, 'Case', 1802, 5287445, 10),
(1807, 10, 21, 'Case', 1803, 5287445, 10),
(1808, 10, 21, 'Case', 1804, 5287445, 10),
(1809, 10, 21, 'Case', 1805, 5287445, 10),
(1810, 10, 21, 'Case', 1806, 5287445, 10),
(1811, 10, 21, 'Case', 1807, 5287445, 10),
(1812, 10, 21, 'Case', 1808, 5287445, 10),
(1813, 10, 21, 'Case', 1809, 5287445, 10),
(1814, 10, 21, 'Case', 1810, 5287445, 10),
(1815, 10, 21, 'Case', 1811, 5287445, 10),
(1816, 10, 21, 'Case', 1812, 5287445, 10),
(1817, 10, 21, 'Case', 1813, 5287445, 10),
(1818, 10, 21, 'Case', 1814, 5287445, 10),
(1819, 10, 21, 'Case', 1815, 5287445, 10),
(1820, 10, 21, 'Case', 1816, 5287445, 10),
(1821, 10, 21, 'Case', 1817, 5287445, 10),
(1822, 10, 21, 'Case', 1818, 5287445, 10),
(1823, 10, 21, 'Case', 1819, 5287445, 10),
(1824, 10, 21, 'Case', 1820, 5287445, 10),
(1825, 10, 21, 'Case', 1821, 5287445, 10),
(1826, 10, 21, 'Case', 1822, 5287445, 10),
(1827, 10, 21, 'Case', 1823, 5287445, 10),
(1828, 10, 21, 'Case', 1824, 5287445, 10),
(1829, 10, 21, 'Case', 1825, 5287445, 10),
(1830, 10, 21, 'Case', 1826, 5287445, 10),
(1831, 10, 21, 'Case', 1827, 5287445, 10),
(1832, 10, 21, 'Case', 1828, 5287445, 10),
(1833, 10, 21, 'Case', 1829, 5287445, 10),
(1834, 10, 21, 'Case', 1830, 5287445, 10),
(1835, 10, 21, 'Case', 1831, 5287445, 10),
(1836, 10, 21, 'Case', 1832, 5287445, 10),
(1837, 10, 21, 'Case', 1833, 5287445, 10),
(1838, 10, 21, 'Case', 1834, 5287445, 10),
(1839, 10, 21, 'Case', 1835, 5287445, 10),
(1840, 10, 21, 'Case', 1836, 5287445, 10),
(1841, 10, 21, 'Case', 1837, 5287445, 10),
(1842, 10, 21, 'Case', 1838, 5287445, 10),
(1843, 10, 21, 'Case', 1839, 5287445, 10),
(1844, 10, 21, 'Case', 1840, 5287445, 10),
(1845, 10, 21, 'Case', 1841, 5287445, 10),
(1846, 10, 21, 'Case', 1842, 5287445, 10),
(1847, 10, 21, 'Case', 1843, 5287445, 10),
(1848, 10, 21, 'Case', 1844, 5287445, 10),
(1849, 10, 21, 'Case', 1845, 5287445, 10),
(1850, 10, 21, 'Case', 1846, 5287445, 10),
(1851, 10, 21, 'Case', 1847, 5287445, 10),
(1852, 10, 21, 'Case', 1848, 5287445, 10),
(1853, 10, 21, 'Case', 1849, 5287445, 10),
(1854, 10, 21, 'Case', 1850, 5287445, 10),
(1855, 10, 21, 'Case', 1851, 5287445, 10),
(1856, 10, 21, 'Case', 1852, 5287445, 10),
(1857, 10, 21, 'Case', 1853, 5287445, 10),
(1858, 10, 21, 'Case', 1854, 5287445, 10),
(1859, 10, 21, 'Case', 1855, 5287445, 10),
(1860, 10, 21, 'Case', 1856, 5287445, 10),
(1861, 10, 21, 'Case', 1857, 5287445, 10),
(1862, 10, 21, 'Case', 1858, 5287445, 10),
(1863, 10, 21, 'Case', 1859, 5287445, 10),
(1864, 10, 21, 'Case', 1860, 5287445, 10),
(1865, 10, 21, 'Case', 1861, 5287446, 10),
(1866, 10, 21, 'Case', 1862, 5287446, 10),
(1867, 10, 21, 'Case', 1863, 5287446, 10),
(1868, 10, 21, 'Case', 1864, 5287446, 10),
(1869, 10, 21, 'Case', 1865, 5287446, 10),
(1870, 10, 21, 'Case', 1866, 5287446, 10),
(1871, 10, 21, 'Case', 1867, 5287446, 10),
(1872, 10, 21, 'Case', 1868, 5287446, 10),
(1873, 10, 21, 'Case', 1869, 5287446, 10),
(1874, 10, 21, 'Case', 1870, 5287446, 10),
(1875, 10, 21, 'Case', 1871, 5287446, 10),
(1876, 10, 21, 'Case', 1872, 5287446, 10),
(1877, 10, 21, 'Case', 1873, 5287446, 10),
(1878, 10, 21, 'Case', 1874, 5287446, 10),
(1879, 10, 21, 'Case', 1875, 5287446, 10),
(1880, 10, 21, 'Case', 1876, 5287446, 10),
(1881, 10, 21, 'Case', 1877, 5287446, 10),
(1882, 10, 21, 'Case', 1878, 5287446, 10),
(1883, 10, 21, 'Case', 1879, 5287446, 10),
(1884, 10, 21, 'Case', 1880, 5287446, 10),
(1885, 10, 21, 'Case', 1881, 5287446, 10),
(1886, 10, 21, 'Case', 1882, 5287446, 10),
(1887, 10, 21, 'Case', 1883, 5287446, 10),
(1888, 10, 21, 'Case', 1884, 5287446, 10),
(1889, 10, 21, 'Case', 1885, 5287446, 10),
(1890, 10, 21, 'Case', 1886, 5287446, 10),
(1891, 10, 21, 'Case', 1887, 5287446, 10),
(1892, 10, 21, 'Case', 1888, 5287446, 10),
(1893, 10, 21, 'Case', 1889, 5287446, 10),
(1894, 10, 21, 'Case', 1890, 5287446, 10),
(1895, 10, 21, 'Case', 1891, 5287446, 10),
(1896, 10, 21, 'Case', 1892, 5287446, 10),
(1897, 10, 21, 'Case', 1893, 5287446, 10),
(1898, 10, 21, 'Case', 1894, 5287446, 10),
(1899, 10, 21, 'Case', 1895, 5287446, 10),
(1900, 10, 21, 'Case', 1896, 5287446, 10),
(1901, 10, 21, 'Case', 1897, 5287446, 10),
(1902, 10, 21, 'Case', 1898, 5287446, 10),
(1903, 10, 21, 'Case', 1899, 5287446, 10),
(1904, 10, 21, 'Case', 1900, 5287446, 10),
(1905, 10, 21, 'Case', 1901, 5287446, 10),
(1906, 10, 21, 'Case', 1902, 5287446, 10),
(1907, 10, 21, 'Case', 1903, 5287446, 10),
(1908, 10, 21, 'Case', 1904, 5287446, 10),
(1909, 10, 21, 'Case', 1905, 5287446, 10),
(1910, 10, 21, 'Case', 1906, 5287446, 10),
(1911, 10, 21, 'Case', 1907, 5287446, 10),
(1912, 10, 21, 'Case', 1908, 5287446, 10),
(1913, 10, 21, 'Case', 1909, 5287446, 10),
(1914, 10, 21, 'Case', 1910, 5287446, 10),
(1915, 10, 21, 'Case', 1911, 5287446, 10),
(1916, 10, 21, 'Case', 1912, 5287446, 10),
(1917, 10, 21, 'Case', 1913, 5287446, 10),
(1918, 10, 21, 'Case', 1914, 5287446, 10),
(1919, 10, 21, 'Case', 1915, 5287446, 10),
(1920, 10, 21, 'Case', 1916, 5287446, 10),
(1921, 10, 21, 'Case', 1917, 5287446, 10),
(1922, 10, 21, 'Case', 1918, 5287446, 10),
(1923, 10, 21, 'Case', 1919, 5287446, 10),
(1924, 10, 21, 'Case', 1920, 5287446, 10),
(1925, 10, 21, 'Case', 1921, 5287446, 10),
(1926, 10, 21, 'Case', 1922, 5287446, 10),
(1927, 10, 21, 'Case', 1923, 5287446, 10),
(1928, 10, 21, 'Case', 1924, 5287446, 10),
(1929, 10, 21, 'Case', 1925, 5287446, 10),
(1930, 10, 21, 'Case', 1926, 5287446, 10),
(1931, 10, 21, 'Case', 1927, 5287446, 10),
(1932, 10, 21, 'Case', 1928, 5287446, 10),
(1933, 10, 21, 'Case', 1929, 5287446, 10),
(1934, 10, 21, 'Case', 1930, 5287446, 10),
(1935, 10, 21, 'Case', 1931, 5287446, 10),
(1936, 10, 21, 'Case', 1932, 5287446, 10),
(1937, 10, 21, 'Case', 1933, 5287446, 10),
(1938, 10, 21, 'Case', 1934, 5287446, 10),
(1939, 10, 21, 'Case', 1935, 5287446, 10),
(1940, 10, 21, 'Case', 1936, 5287446, 10),
(1941, 10, 21, 'Case', 1937, 5287446, 10),
(1942, 10, 21, 'Case', 1938, 5287446, 10),
(1943, 10, 21, 'Case', 1939, 5287446, 10),
(1944, 10, 21, 'Case', 1940, 5287446, 10),
(1945, 10, 21, 'Case', 1941, 5287446, 10),
(1946, 10, 21, 'Case', 1942, 5287446, 10),
(1947, 10, 21, 'Case', 1943, 5287446, 10),
(1948, 10, 21, 'Case', 1944, 5287446, 10),
(1949, 10, 21, 'Case', 1945, 5287446, 10),
(1950, 10, 21, 'Case', 1946, 5287446, 10),
(1951, 10, 21, 'Case', 1947, 5287446, 10),
(1952, 10, 21, 'Case', 1948, 5287446, 10),
(1953, 10, 21, 'Case', 1949, 5287446, 10),
(1954, 10, 21, 'Case', 1950, 5287446, 10),
(1955, 10, 21, 'Case', 1951, 5287446, 10),
(1956, 10, 21, 'Case', 1952, 5287446, 10),
(1957, 10, 21, 'Case', 1953, 5287446, 10),
(1958, 10, 21, 'Case', 1954, 5287446, 10),
(1959, 10, 21, 'Case', 1955, 5287446, 10),
(1960, 10, 21, 'Case', 1956, 5287446, 10),
(1961, 10, 21, 'Case', 1957, 5287446, 10),
(1962, 10, 21, 'Case', 1958, 5287446, 10),
(1963, 10, 21, 'Case', 1959, 5287446, 10),
(1964, 10, 21, 'Case', 1960, 5287446, 10),
(1965, 10, 21, 'Case', 1961, 5287447, 10),
(1966, 10, 21, 'Case', 1962, 5287447, 10),
(1967, 10, 21, 'Case', 1963, 5287447, 10),
(1968, 10, 21, 'Case', 1964, 5287447, 10),
(1969, 10, 21, 'Case', 1965, 5287447, 10),
(1970, 10, 21, 'Case', 1966, 5287447, 10),
(1971, 10, 21, 'Case', 1967, 5287447, 10),
(1972, 10, 21, 'Case', 1968, 5287447, 10),
(1973, 10, 21, 'Case', 1969, 5287447, 10),
(1974, 10, 21, 'Case', 1970, 5287447, 10),
(1975, 10, 21, 'Case', 1971, 5287447, 10),
(1976, 10, 21, 'Case', 1972, 5287447, 10),
(1977, 10, 21, 'Case', 1973, 5287447, 10),
(1978, 10, 21, 'Case', 1974, 5287447, 10),
(1979, 10, 21, 'Case', 1975, 5287447, 10),
(1980, 10, 21, 'Case', 1976, 5287447, 10),
(1981, 10, 21, 'Case', 1977, 5287447, 10),
(1982, 10, 21, 'Case', 1978, 5287447, 10),
(1983, 10, 21, 'Case', 1979, 5287447, 10),
(1984, 10, 21, 'Case', 1980, 5287447, 10),
(1985, 10, 21, 'Case', 1981, 5287447, 10),
(1986, 10, 21, 'Case', 1982, 5287447, 10),
(1987, 10, 21, 'Case', 1983, 5287447, 10),
(1988, 10, 21, 'Case', 1984, 5287447, 10),
(1989, 10, 21, 'Case', 1985, 5287447, 10),
(1990, 10, 21, 'Case', 1986, 5287447, 10),
(1991, 10, 21, 'Case', 1987, 5287447, 10),
(1992, 10, 21, 'Case', 1988, 5287447, 10),
(1993, 10, 21, 'Case', 1989, 5287447, 10),
(1994, 10, 21, 'Case', 1990, 5287447, 10),
(1995, 10, 21, 'Case', 1991, 5287447, 10),
(1996, 10, 21, 'Case', 1992, 5287447, 10),
(1997, 10, 21, 'Case', 1993, 5287447, 10),
(1998, 10, 21, 'Case', 1994, 5287447, 10),
(1999, 10, 21, 'Case', 1995, 5287447, 10),
(2000, 10, 21, 'Case', 1996, 5287447, 10),
(2001, 10, 21, 'Case', 1997, 5287447, 10),
(2002, 10, 21, 'Case', 1998, 5287447, 10),
(2003, 10, 21, 'Case', 1999, 5287447, 10),
(2004, 10, 21, 'Case', 2000, 5287447, 10),
(2005, 10, 21, 'Case', 2001, 5287447, 10),
(2006, 10, 21, 'Case', 2002, 5287447, 10),
(2007, 10, 21, 'Case', 2003, 5287447, 10),
(2008, 10, 21, 'Case', 2004, 5287447, 10),
(2009, 10, 21, 'Case', 2005, 5287447, 10),
(2010, 10, 21, 'Case', 2006, 5287447, 10),
(2011, 10, 21, 'Case', 2007, 5287447, 10),
(2012, 10, 21, 'Case', 2008, 5287447, 10),
(2013, 10, 21, 'Case', 2009, 5287447, 10),
(2014, 10, 21, 'Case', 2010, 5287447, 10),
(2015, 10, 21, 'Case', 2011, 5287447, 10),
(2016, 10, 21, 'Case', 2012, 5287447, 10),
(2017, 10, 21, 'Case', 2013, 5287447, 10),
(2018, 10, 21, 'Case', 2014, 5287447, 10),
(2019, 10, 21, 'Case', 2015, 5287447, 10),
(2020, 10, 21, 'Case', 2016, 5287447, 10),
(2021, 10, 21, 'Case', 2017, 5287447, 10),
(2022, 10, 21, 'Case', 2018, 5287447, 10),
(2023, 10, 21, 'Case', 2019, 5287447, 10),
(2024, 10, 21, 'Case', 2020, 5287447, 10),
(2025, 10, 21, 'Case', 2021, 5287447, 10),
(2026, 10, 21, 'Case', 2022, 5287447, 10),
(2027, 10, 21, 'Case', 2023, 5287447, 10),
(2028, 10, 21, 'Case', 2024, 5287447, 10),
(2029, 10, 21, 'Case', 2025, 5287447, 10),
(2030, 10, 21, 'Case', 2026, 5287447, 10),
(2031, 10, 21, 'Case', 2027, 5287447, 10),
(2032, 10, 21, 'Case', 2028, 5287447, 10),
(2033, 10, 21, 'Case', 2029, 5287447, 10),
(2034, 10, 21, 'Case', 2030, 5287447, 10),
(2035, 10, 21, 'Case', 2031, 5287447, 10),
(2036, 10, 21, 'Case', 2032, 5287447, 10),
(2037, 10, 21, 'Case', 2033, 5287447, 10),
(2038, 10, 21, 'Case', 2034, 5287447, 10),
(2039, 10, 21, 'Case', 2035, 5287447, 10),
(2040, 10, 21, 'Case', 2036, 5287447, 10),
(2041, 10, 21, 'Case', 2037, 5287447, 10),
(2042, 10, 21, 'Case', 2038, 5287447, 10),
(2043, 10, 21, 'Case', 2039, 5287447, 10),
(2044, 10, 21, 'Case', 2040, 5287447, 10),
(2045, 10, 21, 'Case', 2041, 5287447, 10),
(2046, 10, 21, 'Case', 2042, 5287447, 10),
(2047, 10, 21, 'Case', 2043, 5287447, 10),
(2048, 10, 21, 'Case', 2044, 5287447, 10),
(2049, 10, 21, 'Case', 2045, 5287447, 10),
(2050, 10, 21, 'Case', 2046, 5287447, 10),
(2051, 10, 21, 'Case', 2047, 5287447, 10),
(2052, 10, 21, 'Case', 2048, 5287447, 10),
(2053, 10, 21, 'Case', 2049, 5287447, 10),
(2054, 10, 21, 'Case', 2050, 5287447, 10),
(2055, 10, 21, 'Case', 2051, 5287447, 10),
(2056, 10, 21, 'Case', 2052, 5287447, 10),
(2057, 10, 21, 'Case', 2053, 5287447, 10),
(2058, 10, 21, 'Case', 2054, 5287447, 10),
(2059, 10, 21, 'Case', 2055, 5287447, 10),
(2060, 10, 21, 'Case', 2056, 5287447, 10),
(2061, 10, 21, 'Case', 2057, 5287447, 10),
(2062, 10, 21, 'Case', 2058, 5287447, 10),
(2063, 10, 21, 'Case', 2059, 5287447, 10),
(2064, 10, 21, 'Case', 2060, 5287447, 10),
(2065, 10, 21, 'Case', 2061, 5287448, 10),
(2066, 10, 21, 'Case', 2062, 5287448, 10),
(2067, 10, 21, 'Case', 2063, 5287448, 10),
(2068, 10, 21, 'Case', 2064, 5287448, 10),
(2069, 10, 21, 'Case', 2065, 5287448, 10),
(2070, 10, 21, 'Case', 2066, 5287448, 10),
(2071, 10, 21, 'Case', 2067, 5287448, 10),
(2072, 10, 21, 'Case', 2068, 5287448, 10),
(2073, 10, 21, 'Case', 2069, 5287448, 10),
(2074, 10, 21, 'Case', 2070, 5287448, 10),
(2075, 10, 21, 'Case', 2071, 5287448, 10),
(2076, 10, 21, 'Case', 2072, 5287448, 10),
(2077, 10, 21, 'Case', 2073, 5287448, 10),
(2078, 10, 21, 'Case', 2074, 5287448, 10),
(2079, 10, 21, 'Case', 2075, 5287448, 10),
(2080, 10, 21, 'Case', 2076, 5287448, 10),
(2081, 10, 21, 'Case', 2077, 5287448, 10),
(2082, 10, 21, 'Case', 2078, 5287448, 10),
(2083, 10, 21, 'Case', 2079, 5287448, 10),
(2084, 10, 21, 'Case', 2080, 5287448, 10),
(2085, 10, 21, 'Case', 2081, 5287448, 10),
(2086, 10, 21, 'Case', 2082, 5287448, 10),
(2087, 10, 21, 'Case', 2083, 5287448, 10),
(2088, 10, 21, 'Case', 2084, 5287448, 10),
(2089, 10, 21, 'Case', 2085, 5287448, 10),
(2090, 10, 21, 'Case', 2086, 5287448, 10),
(2091, 10, 21, 'Case', 2087, 5287448, 10),
(2092, 10, 21, 'Case', 2088, 5287448, 10),
(2093, 10, 21, 'Case', 2089, 5287448, 10),
(2094, 10, 21, 'Case', 2090, 5287448, 10),
(2095, 10, 21, 'Case', 2091, 5287448, 10),
(2096, 10, 21, 'Case', 2092, 5287448, 10),
(2097, 10, 21, 'Case', 2093, 5287448, 10),
(2098, 10, 21, 'Case', 2094, 5287448, 10),
(2099, 10, 21, 'Case', 2095, 5287448, 10),
(2100, 10, 21, 'Case', 2096, 5287448, 10),
(2101, 10, 21, 'Case', 2097, 5287448, 10),
(2102, 10, 21, 'Case', 2098, 5287448, 10),
(2103, 10, 21, 'Case', 2099, 5287448, 10),
(2104, 10, 21, 'Case', 2100, 5287448, 10),
(2105, 10, 21, 'Case', 2101, 5287448, 10),
(2106, 10, 21, 'Case', 2102, 5287448, 10),
(2107, 10, 21, 'Case', 2103, 5287448, 10),
(2108, 10, 21, 'Case', 2104, 5287448, 10),
(2109, 10, 21, 'Case', 2105, 5287448, 10),
(2110, 10, 21, 'Case', 2106, 5287448, 10),
(2111, 10, 21, 'Case', 2107, 5287448, 10),
(2112, 10, 21, 'Case', 2108, 5287448, 10),
(2113, 10, 21, 'Case', 2109, 5287448, 10),
(2114, 10, 21, 'Case', 2110, 5287448, 10),
(2115, 10, 21, 'Case', 2111, 5287448, 10),
(2116, 10, 21, 'Case', 2112, 5287448, 10),
(2117, 10, 21, 'Case', 2113, 5287448, 10),
(2118, 10, 21, 'Case', 2114, 5287448, 10),
(2119, 10, 21, 'Case', 2115, 5287448, 10),
(2120, 10, 21, 'Case', 2116, 5287448, 10),
(2121, 10, 21, 'Case', 2117, 5287448, 10),
(2122, 10, 21, 'Case', 2118, 5287448, 10),
(2123, 10, 21, 'Case', 2119, 5287448, 10),
(2124, 10, 21, 'Case', 2120, 5287448, 10),
(2125, 10, 21, 'Case', 2121, 5287448, 10),
(2126, 10, 21, 'Case', 2122, 5287448, 10),
(2127, 10, 21, 'Case', 2123, 5287448, 10),
(2128, 10, 21, 'Case', 2124, 5287448, 10),
(2129, 10, 21, 'Case', 2125, 5287448, 10),
(2130, 10, 21, 'Case', 2126, 5287448, 10),
(2131, 10, 21, 'Case', 2127, 5287448, 10),
(2132, 10, 21, 'Case', 2128, 5287448, 10),
(2133, 10, 21, 'Case', 2129, 5287448, 10),
(2134, 10, 21, 'Case', 2130, 5287448, 10),
(2135, 10, 21, 'Case', 2131, 5287448, 10),
(2136, 10, 21, 'Case', 2132, 5287448, 10),
(2137, 10, 21, 'Case', 2133, 5287448, 10),
(2138, 10, 21, 'Case', 2134, 5287448, 10),
(2139, 10, 21, 'Case', 2135, 5287448, 10),
(2140, 10, 21, 'Case', 2136, 5287448, 10),
(2141, 10, 21, 'Case', 2137, 5287448, 10),
(2142, 10, 21, 'Case', 2138, 5287448, 10),
(2143, 10, 21, 'Case', 2139, 5287448, 10),
(2144, 10, 21, 'Case', 2140, 5287448, 10),
(2145, 10, 21, 'Case', 2141, 5287448, 10),
(2146, 10, 21, 'Case', 2142, 5287448, 10),
(2147, 10, 21, 'Case', 2143, 5287448, 10),
(2148, 10, 21, 'Case', 2144, 5287448, 10),
(2149, 10, 21, 'Case', 2145, 5287448, 10),
(2150, 10, 21, 'Case', 2146, 5287448, 10),
(2151, 10, 21, 'Case', 2147, 5287448, 10),
(2152, 10, 21, 'Case', 2148, 5287448, 10),
(2153, 10, 21, 'Case', 2149, 5287448, 10),
(2154, 10, 21, 'Case', 2150, 5287448, 10),
(2155, 10, 21, 'Case', 2151, 5287448, 10),
(2156, 10, 21, 'Case', 2152, 5287448, 10),
(2157, 10, 21, 'Case', 2153, 5287448, 10),
(2158, 10, 21, 'Case', 2154, 5287448, 10),
(2159, 10, 21, 'Case', 2155, 5287448, 10),
(2160, 10, 21, 'Case', 2156, 5287448, 10),
(2161, 10, 21, 'Case', 2157, 5287448, 10),
(2162, 10, 21, 'Case', 2158, 5287448, 10),
(2163, 10, 21, 'Case', 2159, 5287448, 10),
(2164, 10, 21, 'Case', 2160, 5287448, 10),
(2165, 10, 21, 'Case', 2161, 5287449, 10),
(2166, 10, 21, 'Case', 2162, 5287449, 10),
(2167, 10, 21, 'Case', 2163, 5287449, 10),
(2168, 10, 21, 'Case', 2164, 5287449, 10),
(2169, 10, 21, 'Case', 2165, 5287449, 10),
(2170, 10, 21, 'Case', 2166, 5287449, 10),
(2171, 10, 21, 'Case', 2167, 5287449, 10),
(2172, 10, 21, 'Case', 2168, 5287449, 10),
(2173, 10, 21, 'Case', 2169, 5287449, 10),
(2174, 10, 21, 'Case', 2170, 5287449, 10),
(2175, 10, 21, 'Case', 2171, 5287449, 10),
(2176, 10, 21, 'Case', 2172, 5287449, 10),
(2177, 10, 21, 'Case', 2173, 5287449, 10),
(2178, 10, 21, 'Case', 2174, 5287449, 10),
(2179, 10, 21, 'Case', 2175, 5287449, 10),
(2180, 10, 21, 'Case', 2176, 5287449, 10),
(2181, 10, 21, 'Case', 2177, 5287449, 10),
(2182, 10, 21, 'Case', 2178, 5287449, 10),
(2183, 10, 21, 'Case', 2179, 5287449, 10),
(2184, 10, 21, 'Case', 2180, 5287449, 10),
(2185, 10, 21, 'Case', 2181, 5287449, 10),
(2186, 10, 21, 'Case', 2182, 5287449, 10),
(2187, 10, 21, 'Case', 2183, 5287449, 10),
(2188, 10, 21, 'Case', 2184, 5287449, 10),
(2189, 10, 21, 'Case', 2185, 5287449, 10),
(2190, 10, 21, 'Case', 2186, 5287449, 10),
(2191, 10, 21, 'Case', 2187, 5287449, 10),
(2192, 10, 21, 'Case', 2188, 5287449, 10),
(2193, 10, 21, 'Case', 2189, 5287449, 10),
(2194, 10, 21, 'Case', 2190, 5287449, 10),
(2195, 10, 21, 'Case', 2191, 5287449, 10),
(2196, 10, 21, 'Case', 2192, 5287449, 10),
(2197, 10, 21, 'Case', 2193, 5287449, 10),
(2198, 10, 21, 'Case', 2194, 5287449, 10),
(2199, 10, 21, 'Case', 2195, 5287449, 10),
(2200, 10, 21, 'Case', 2196, 5287449, 10),
(2201, 10, 21, 'Case', 2197, 5287449, 10),
(2202, 10, 21, 'Case', 2198, 5287449, 10),
(2203, 10, 21, 'Case', 2199, 5287449, 10),
(2204, 10, 21, 'Case', 2200, 5287449, 10),
(2205, 10, 21, 'Case', 2201, 5287449, 10),
(2206, 10, 21, 'Case', 2202, 5287449, 10),
(2207, 10, 21, 'Case', 2203, 5287449, 10),
(2208, 10, 21, 'Case', 2204, 5287449, 10),
(2209, 10, 21, 'Case', 2205, 5287449, 10),
(2210, 10, 21, 'Case', 2206, 5287449, 10),
(2211, 10, 21, 'Case', 2207, 5287449, 10),
(2212, 10, 21, 'Case', 2208, 5287449, 10),
(2213, 10, 21, 'Case', 2209, 5287449, 10),
(2214, 10, 21, 'Case', 2210, 5287449, 10),
(2215, 10, 21, 'Case', 2211, 5287449, 10),
(2216, 10, 21, 'Case', 2212, 5287449, 10),
(2217, 10, 21, 'Case', 2213, 5287449, 10),
(2218, 10, 21, 'Case', 2214, 5287449, 10),
(2219, 10, 21, 'Case', 2215, 5287449, 10),
(2220, 10, 21, 'Case', 2216, 5287449, 10),
(2221, 10, 21, 'Case', 2217, 5287449, 10),
(2222, 10, 21, 'Case', 2218, 5287449, 10),
(2223, 10, 21, 'Case', 2219, 5287449, 10),
(2224, 10, 21, 'Case', 2220, 5287449, 10),
(2225, 10, 21, 'Case', 2221, 5287449, 10),
(2226, 10, 21, 'Case', 2222, 5287449, 10),
(2227, 10, 21, 'Case', 2223, 5287449, 10),
(2228, 10, 21, 'Case', 2224, 5287449, 10),
(2229, 10, 21, 'Case', 2225, 5287449, 10),
(2230, 10, 21, 'Case', 2226, 5287449, 10),
(2231, 10, 21, 'Case', 2227, 5287449, 10),
(2232, 10, 21, 'Case', 2228, 5287449, 10),
(2233, 10, 21, 'Case', 2229, 5287449, 10),
(2234, 10, 21, 'Case', 2230, 5287449, 10),
(2235, 10, 21, 'Case', 2231, 5287449, 10),
(2236, 10, 21, 'Case', 2232, 5287449, 10),
(2237, 10, 21, 'Case', 2233, 5287449, 10),
(2238, 10, 21, 'Case', 2234, 5287449, 10),
(2239, 10, 21, 'Case', 2235, 5287449, 10),
(2240, 10, 21, 'Case', 2236, 5287449, 10),
(2241, 10, 21, 'Case', 2237, 5287449, 10),
(2242, 10, 21, 'Case', 2238, 5287449, 10),
(2243, 10, 21, 'Case', 2239, 5287449, 10),
(2244, 10, 21, 'Case', 2240, 5287449, 10),
(2245, 10, 21, 'Case', 2241, 5287449, 10),
(2246, 10, 21, 'Case', 2242, 5287449, 10),
(2247, 10, 21, 'Case', 2243, 5287449, 10),
(2248, 10, 21, 'Case', 2244, 5287449, 10),
(2249, 10, 21, 'Case', 2245, 5287449, 10),
(2250, 10, 21, 'Case', 2246, 5287449, 10),
(2251, 10, 21, 'Case', 2247, 5287449, 10),
(2252, 10, 21, 'Case', 2248, 5287449, 10),
(2253, 10, 21, 'Case', 2249, 5287449, 10),
(2254, 10, 21, 'Case', 2250, 5287449, 10),
(2255, 10, 21, 'Case', 2251, 5287449, 10),
(2256, 10, 21, 'Case', 2252, 5287449, 10),
(2257, 10, 21, 'Case', 2253, 5287449, 10),
(2258, 10, 21, 'Case', 2254, 5287449, 10),
(2259, 10, 21, 'Case', 2255, 5287449, 10),
(2260, 10, 21, 'Case', 2256, 5287449, 10),
(2261, 10, 21, 'Case', 2257, 5287449, 10),
(2262, 10, 21, 'Case', 2258, 5287449, 10),
(2263, 10, 21, 'Case', 2259, 5287449, 10),
(2264, 10, 21, 'Case', 2260, 5287449, 10),
(2265, 10, 21, 'Case', 2261, 5287450, 10),
(2266, 10, 21, 'Case', 2262, 5287450, 10),
(2267, 10, 21, 'Case', 2263, 5287450, 10),
(2268, 10, 21, 'Case', 2264, 5287450, 10),
(2269, 10, 21, 'Case', 2265, 5287450, 10),
(2270, 10, 21, 'Case', 2266, 5287450, 10),
(2271, 10, 21, 'Case', 2267, 5287450, 10),
(2272, 10, 21, 'Case', 2268, 5287450, 10),
(2273, 10, 21, 'Case', 2269, 5287450, 10),
(2274, 10, 21, 'Case', 2270, 5287450, 10),
(2275, 10, 21, 'Case', 2271, 5287450, 10),
(2276, 10, 21, 'Case', 2272, 5287450, 10),
(2277, 10, 21, 'Case', 2273, 5287450, 10),
(2278, 10, 21, 'Case', 2274, 5287450, 10),
(2279, 10, 21, 'Case', 2275, 5287450, 10),
(2280, 10, 21, 'Case', 2276, 5287450, 10),
(2281, 10, 21, 'Case', 2277, 5287450, 10),
(2282, 10, 21, 'Case', 2278, 5287450, 10),
(2283, 10, 21, 'Case', 2279, 5287450, 10),
(2284, 10, 21, 'Case', 2280, 5287450, 10),
(2285, 10, 21, 'Case', 2281, 5287450, 10),
(2286, 10, 21, 'Case', 2282, 5287450, 10),
(2287, 10, 21, 'Case', 2283, 5287450, 10),
(2288, 10, 21, 'Case', 2284, 5287450, 10),
(2289, 10, 21, 'Case', 2285, 5287450, 10),
(2290, 10, 21, 'Case', 2286, 5287450, 10),
(2291, 10, 21, 'Case', 2287, 5287450, 10),
(2292, 10, 21, 'Case', 2288, 5287450, 10),
(2293, 10, 21, 'Case', 2289, 5287450, 10),
(2294, 10, 21, 'Case', 2290, 5287450, 10),
(2295, 10, 21, 'Case', 2291, 5287450, 10),
(2296, 10, 21, 'Case', 2292, 5287450, 10),
(2297, 10, 21, 'Case', 2293, 5287450, 10),
(2298, 10, 21, 'Case', 2294, 5287450, 10),
(2299, 10, 21, 'Case', 2295, 5287450, 10),
(2300, 10, 21, 'Case', 2296, 5287450, 10),
(2301, 10, 21, 'Case', 2297, 5287450, 10),
(2302, 10, 21, 'Case', 2298, 5287450, 10),
(2303, 10, 21, 'Case', 2299, 5287450, 10),
(2304, 10, 21, 'Case', 2300, 5287450, 10),
(2305, 10, 21, 'Case', 2301, 5287450, 10),
(2306, 10, 21, 'Case', 2302, 5287450, 10),
(2307, 10, 21, 'Case', 2303, 5287450, 10),
(2308, 10, 21, 'Case', 2304, 5287450, 10),
(2309, 10, 21, 'Case', 2305, 5287450, 10),
(2310, 10, 21, 'Case', 2306, 5287450, 10),
(2311, 10, 21, 'Case', 2307, 5287450, 10),
(2312, 10, 21, 'Case', 2308, 5287450, 10),
(2313, 10, 21, 'Case', 2309, 5287450, 10),
(2314, 10, 21, 'Case', 2310, 5287450, 10),
(2315, 10, 21, 'Case', 2311, 5287450, 10),
(2316, 10, 21, 'Case', 2312, 5287450, 10),
(2317, 10, 21, 'Case', 2313, 5287450, 10),
(2318, 10, 21, 'Case', 2314, 5287450, 10),
(2319, 10, 21, 'Case', 2315, 5287450, 10),
(2320, 10, 21, 'Case', 2316, 5287450, 10),
(2321, 10, 21, 'Case', 2317, 5287450, 10),
(2322, 10, 21, 'Case', 2318, 5287450, 10),
(2323, 10, 21, 'Case', 2319, 5287450, 10),
(2324, 10, 21, 'Case', 2320, 5287450, 10),
(2325, 10, 21, 'Case', 2321, 5287450, 10),
(2326, 10, 21, 'Case', 2322, 5287450, 10),
(2327, 10, 21, 'Case', 2323, 5287450, 10),
(2328, 10, 21, 'Case', 2324, 5287450, 10),
(2329, 10, 21, 'Case', 2325, 5287450, 10),
(2330, 10, 21, 'Case', 2326, 5287450, 10),
(2331, 10, 21, 'Case', 2327, 5287450, 10),
(2332, 10, 21, 'Case', 2328, 5287450, 10),
(2333, 10, 21, 'Case', 2329, 5287450, 10),
(2334, 10, 21, 'Case', 2330, 5287450, 10),
(2335, 10, 21, 'Case', 2331, 5287450, 10),
(2336, 10, 21, 'Case', 2332, 5287450, 10),
(2337, 10, 21, 'Case', 2333, 5287450, 10),
(2338, 10, 21, 'Case', 2334, 5287450, 10),
(2339, 10, 21, 'Case', 2335, 5287450, 10),
(2340, 10, 21, 'Case', 2336, 5287450, 10),
(2341, 10, 21, 'Case', 2337, 5287450, 10),
(2342, 10, 21, 'Case', 2338, 5287450, 10),
(2343, 10, 21, 'Case', 2339, 5287450, 10),
(2344, 10, 21, 'Case', 2340, 5287450, 10),
(2345, 10, 21, 'Case', 2341, 5287450, 10),
(2346, 10, 21, 'Case', 2342, 5287450, 10),
(2347, 10, 21, 'Case', 2343, 5287450, 10),
(2348, 10, 21, 'Case', 2344, 5287450, 10),
(2349, 10, 21, 'Case', 2345, 5287450, 10),
(2350, 10, 21, 'Case', 2346, 5287450, 10),
(2351, 10, 21, 'Case', 2347, 5287450, 10),
(2352, 10, 21, 'Case', 2348, 5287450, 10),
(2353, 10, 21, 'Case', 2349, 5287450, 10),
(2354, 10, 21, 'Case', 2350, 5287450, 10),
(2355, 10, 21, 'Case', 2351, 5287450, 10),
(2356, 10, 21, 'Case', 2352, 5287450, 10),
(2357, 10, 21, 'Case', 2353, 5287450, 10),
(2358, 10, 21, 'Case', 2354, 5287450, 10),
(2359, 10, 21, 'Case', 2355, 5287450, 10),
(2360, 10, 21, 'Case', 2356, 5287450, 10),
(2361, 10, 21, 'Case', 2357, 5287450, 10),
(2362, 10, 21, 'Case', 2358, 5287450, 10),
(2363, 10, 21, 'Case', 2359, 5287450, 10),
(2364, 10, 21, 'Case', 2360, 5287450, 10),
(2365, 10, 21, 'Case', 2361, 5287451, 10),
(2366, 10, 21, 'Case', 2362, 5287451, 10),
(2367, 10, 21, 'Case', 2363, 5287451, 10),
(2368, 10, 21, 'Case', 2364, 5287451, 10),
(2369, 10, 21, 'Case', 2365, 5287451, 10),
(2370, 10, 21, 'Case', 2366, 5287451, 10),
(2371, 10, 21, 'Case', 2367, 5287451, 10),
(2372, 10, 21, 'Case', 2368, 5287451, 10),
(2373, 10, 21, 'Case', 2369, 5287451, 10),
(2374, 10, 21, 'Case', 2370, 5287451, 10),
(2375, 10, 21, 'Case', 2371, 5287451, 10),
(2376, 10, 21, 'Case', 2372, 5287451, 10),
(2377, 10, 21, 'Case', 2373, 5287451, 10),
(2378, 10, 21, 'Case', 2374, 5287451, 10),
(2379, 10, 21, 'Case', 2375, 5287451, 10),
(2380, 10, 21, 'Case', 2376, 5287451, 10),
(2381, 10, 21, 'Case', 2377, 5287451, 10),
(2382, 10, 21, 'Case', 2378, 5287451, 10),
(2383, 10, 21, 'Case', 2379, 5287451, 10),
(2384, 10, 21, 'Case', 2380, 5287451, 10),
(2385, 10, 21, 'Case', 2381, 5287451, 10),
(2386, 10, 21, 'Case', 2382, 5287451, 10),
(2387, 10, 21, 'Case', 2383, 5287451, 10),
(2388, 10, 21, 'Case', 2384, 5287451, 10),
(2389, 10, 21, 'Case', 2385, 5287451, 10),
(2390, 10, 21, 'Case', 2386, 5287451, 10),
(2391, 10, 21, 'Case', 2387, 5287451, 10),
(2392, 10, 21, 'Case', 2388, 5287451, 10),
(2393, 10, 21, 'Case', 2389, 5287451, 10),
(2394, 10, 21, 'Case', 2390, 5287451, 10),
(2395, 10, 21, 'Case', 2391, 5287451, 10),
(2396, 10, 21, 'Case', 2392, 5287451, 10),
(2397, 10, 21, 'Case', 2393, 5287451, 10),
(2398, 10, 21, 'Case', 2394, 5287451, 10),
(2399, 10, 21, 'Case', 2395, 5287451, 10),
(2400, 10, 21, 'Case', 2396, 5287451, 10),
(2401, 10, 21, 'Case', 2397, 5287451, 10),
(2402, 10, 21, 'Case', 2398, 5287451, 10),
(2403, 10, 21, 'Case', 2399, 5287451, 10),
(2404, 10, 21, 'Case', 2400, 5287451, 10),
(2405, 10, 21, 'Case', 2401, 5287451, 10),
(2406, 10, 21, 'Case', 2402, 5287451, 10),
(2407, 10, 21, 'Case', 2403, 5287451, 10),
(2408, 10, 21, 'Case', 2404, 5287451, 10),
(2409, 10, 21, 'Case', 2405, 5287451, 10),
(2410, 10, 21, 'Case', 2406, 5287451, 10),
(2411, 10, 21, 'Case', 2407, 5287451, 10),
(2412, 10, 21, 'Case', 2408, 5287451, 10),
(2413, 10, 21, 'Case', 2409, 5287451, 10),
(2414, 10, 21, 'Case', 2410, 5287451, 10),
(2415, 10, 21, 'Case', 2411, 5287451, 10),
(2416, 10, 21, 'Case', 2412, 5287451, 10),
(2417, 10, 21, 'Case', 2413, 5287451, 10),
(2418, 10, 21, 'Case', 2414, 5287451, 10),
(2419, 10, 21, 'Case', 2415, 5287451, 10),
(2420, 10, 21, 'Case', 2416, 5287451, 10),
(2421, 10, 21, 'Case', 2417, 5287451, 10),
(2422, 10, 21, 'Case', 2418, 5287451, 10),
(2423, 10, 21, 'Case', 2419, 5287451, 10),
(2424, 10, 21, 'Case', 2420, 5287451, 10),
(2425, 10, 21, 'Case', 2421, 5287451, 10),
(2426, 10, 21, 'Case', 2422, 5287451, 10),
(2427, 10, 21, 'Case', 2423, 5287451, 10),
(2428, 10, 21, 'Case', 2424, 5287451, 10),
(2429, 10, 21, 'Case', 2425, 5287451, 10),
(2430, 10, 21, 'Case', 2426, 5287451, 10),
(2431, 10, 21, 'Case', 2427, 5287451, 10),
(2432, 10, 21, 'Case', 2428, 5287451, 10),
(2433, 10, 21, 'Case', 2429, 5287451, 10),
(2434, 10, 21, 'Case', 2430, 5287451, 10),
(2435, 10, 21, 'Case', 2431, 5287451, 10),
(2436, 10, 21, 'Case', 2432, 5287451, 10),
(2437, 10, 21, 'Case', 2433, 5287451, 10),
(2438, 10, 21, 'Case', 2434, 5287451, 10),
(2439, 10, 21, 'Case', 2435, 5287451, 10),
(2440, 10, 21, 'Case', 2436, 5287451, 10),
(2441, 10, 21, 'Case', 2437, 5287451, 10),
(2442, 10, 21, 'Case', 2438, 5287451, 10),
(2443, 10, 21, 'Case', 2439, 5287451, 10),
(2444, 10, 21, 'Case', 2440, 5287451, 10),
(2445, 10, 21, 'Case', 2441, 5287451, 10),
(2446, 10, 21, 'Case', 2442, 5287451, 10),
(2447, 10, 21, 'Case', 2443, 5287451, 10),
(2448, 10, 21, 'Case', 2444, 5287451, 10),
(2449, 10, 21, 'Case', 2445, 5287451, 10),
(2450, 10, 21, 'Case', 2446, 5287451, 10),
(2451, 10, 21, 'Case', 2447, 5287451, 10),
(2452, 10, 21, 'Case', 2448, 5287451, 10),
(2453, 10, 21, 'Case', 2449, 5287451, 10),
(2454, 10, 21, 'Case', 2450, 5287451, 10),
(2455, 10, 21, 'Case', 2451, 5287451, 10),
(2456, 10, 21, 'Case', 2452, 5287451, 10),
(2457, 10, 21, 'Case', 2453, 5287451, 10),
(2458, 10, 21, 'Case', 2454, 5287451, 10),
(2459, 10, 21, 'Case', 2455, 5287451, 10),
(2460, 10, 21, 'Case', 2456, 5287451, 10),
(2461, 10, 21, 'Case', 2457, 5287451, 10),
(2462, 10, 21, 'Case', 2458, 5287451, 10),
(2463, 10, 21, 'Case', 2459, 5287451, 10),
(2464, 10, 21, 'Case', 2460, 5287451, 10),
(2465, 10, 21, 'Case', 2461, 5287452, 10),
(2466, 10, 21, 'Case', 2462, 5287452, 10),
(2467, 10, 21, 'Case', 2463, 5287452, 10),
(2468, 10, 21, 'Case', 2464, 5287452, 10),
(2469, 10, 21, 'Case', 2465, 5287452, 10),
(2470, 10, 21, 'Case', 2466, 5287452, 10),
(2471, 10, 21, 'Case', 2467, 5287452, 10),
(2472, 10, 21, 'Case', 2468, 5287452, 10),
(2473, 10, 21, 'Case', 2469, 5287452, 10),
(2474, 10, 21, 'Case', 2470, 5287452, 10),
(2475, 10, 21, 'Case', 2471, 5287452, 10),
(2476, 10, 21, 'Case', 2472, 5287452, 10),
(2477, 10, 21, 'Case', 2473, 5287452, 10),
(2478, 10, 21, 'Case', 2474, 5287452, 10),
(2479, 10, 21, 'Case', 2475, 5287452, 10),
(2480, 10, 21, 'Case', 2476, 5287452, 10),
(2481, 10, 21, 'Case', 2477, 5287452, 10),
(2482, 10, 21, 'Case', 2478, 5287452, 10),
(2483, 10, 21, 'Case', 2479, 5287452, 10),
(2484, 10, 21, 'Case', 2480, 5287452, 10),
(2485, 10, 21, 'Case', 2481, 5287452, 10),
(2486, 10, 21, 'Case', 2482, 5287452, 10),
(2487, 10, 21, 'Case', 2483, 5287452, 10),
(2488, 10, 21, 'Case', 2484, 5287452, 10),
(2489, 10, 21, 'Case', 2485, 5287452, 10),
(2490, 10, 21, 'Case', 2486, 5287452, 10),
(2491, 10, 21, 'Case', 2487, 5287452, 10),
(2492, 10, 21, 'Case', 2488, 5287452, 10);
INSERT INTO `tp_package_case` (`id`, `product_id`, `lot_id`, `package_level`, `primary_package_id`, `package_sn`, `inner_primary_pack_count`) VALUES
(2493, 10, 21, 'Case', 2489, 5287452, 10),
(2494, 10, 21, 'Case', 2490, 5287452, 10),
(2495, 10, 21, 'Case', 2491, 5287452, 10),
(2496, 10, 21, 'Case', 2492, 5287452, 10),
(2497, 10, 21, 'Case', 2493, 5287452, 10),
(2498, 10, 21, 'Case', 2494, 5287452, 10),
(2499, 10, 21, 'Case', 2495, 5287452, 10),
(2500, 10, 21, 'Case', 2496, 5287452, 10),
(2501, 10, 21, 'Case', 2497, 5287452, 10),
(2502, 10, 21, 'Case', 2498, 5287452, 10),
(2503, 10, 21, 'Case', 2499, 5287452, 10),
(2504, 10, 21, 'Case', 2500, 5287452, 10),
(2505, 10, 21, 'Case', 2501, 5287452, 10),
(2506, 10, 21, 'Case', 2502, 5287452, 10),
(2507, 10, 21, 'Case', 2503, 5287452, 10),
(2508, 10, 21, 'Case', 2504, 5287452, 10),
(2509, 10, 21, 'Case', 2505, 5287452, 10),
(2510, 10, 21, 'Case', 2506, 5287452, 10),
(2511, 10, 21, 'Case', 2507, 5287452, 10),
(2512, 10, 21, 'Case', 2508, 5287452, 10),
(2513, 10, 21, 'Case', 2509, 5287452, 10),
(2514, 10, 21, 'Case', 2510, 5287452, 10),
(2515, 10, 21, 'Case', 2511, 5287452, 10),
(2516, 10, 21, 'Case', 2512, 5287452, 10),
(2517, 10, 21, 'Case', 2513, 5287452, 10),
(2518, 10, 21, 'Case', 2514, 5287452, 10),
(2519, 10, 21, 'Case', 2515, 5287452, 10),
(2520, 10, 21, 'Case', 2516, 5287452, 10),
(2521, 10, 21, 'Case', 2517, 5287452, 10),
(2522, 10, 21, 'Case', 2518, 5287452, 10),
(2523, 10, 21, 'Case', 2519, 5287452, 10),
(2524, 10, 21, 'Case', 2520, 5287452, 10),
(2525, 10, 21, 'Case', 2521, 5287452, 10),
(2526, 10, 21, 'Case', 2522, 5287452, 10),
(2527, 10, 21, 'Case', 2523, 5287452, 10),
(2528, 10, 21, 'Case', 2524, 5287452, 10),
(2529, 10, 21, 'Case', 2525, 5287452, 10),
(2530, 10, 21, 'Case', 2526, 5287452, 10),
(2531, 10, 21, 'Case', 2527, 5287452, 10),
(2532, 10, 21, 'Case', 2528, 5287452, 10),
(2533, 10, 21, 'Case', 2529, 5287452, 10),
(2534, 10, 21, 'Case', 2530, 5287452, 10),
(2535, 10, 21, 'Case', 2531, 5287452, 10),
(2536, 10, 21, 'Case', 2532, 5287452, 10),
(2537, 10, 21, 'Case', 2533, 5287452, 10),
(2538, 10, 21, 'Case', 2534, 5287452, 10),
(2539, 10, 21, 'Case', 2535, 5287452, 10),
(2540, 10, 21, 'Case', 2536, 5287452, 10),
(2541, 10, 21, 'Case', 2537, 5287452, 10),
(2542, 10, 21, 'Case', 2538, 5287452, 10),
(2543, 10, 21, 'Case', 2539, 5287452, 10),
(2544, 10, 21, 'Case', 2540, 5287452, 10),
(2545, 10, 21, 'Case', 2541, 5287452, 10),
(2546, 10, 21, 'Case', 2542, 5287452, 10),
(2547, 10, 21, 'Case', 2543, 5287452, 10),
(2548, 10, 21, 'Case', 2544, 5287452, 10),
(2549, 10, 21, 'Case', 2545, 5287452, 10),
(2550, 10, 21, 'Case', 2546, 5287452, 10),
(2551, 10, 21, 'Case', 2547, 5287452, 10),
(2552, 10, 21, 'Case', 2548, 5287452, 10),
(2553, 10, 21, 'Case', 2549, 5287452, 10),
(2554, 10, 21, 'Case', 2550, 5287452, 10),
(2555, 10, 21, 'Case', 2551, 5287452, 10),
(2556, 10, 21, 'Case', 2552, 5287452, 10),
(2557, 10, 21, 'Case', 2553, 5287452, 10),
(2558, 10, 21, 'Case', 2554, 5287452, 10),
(2559, 10, 21, 'Case', 2555, 5287452, 10),
(2560, 10, 21, 'Case', 2556, 5287452, 10),
(2561, 10, 21, 'Case', 2557, 5287452, 10),
(2562, 10, 21, 'Case', 2558, 5287452, 10),
(2563, 10, 21, 'Case', 2559, 5287452, 10),
(2564, 10, 21, 'Case', 2560, 5287452, 10),
(2565, 10, 21, 'Case', 2561, 5287453, 10),
(2566, 10, 21, 'Case', 2562, 5287453, 10),
(2567, 10, 21, 'Case', 2563, 5287453, 10),
(2568, 10, 21, 'Case', 2564, 5287453, 10),
(2569, 10, 21, 'Case', 2565, 5287453, 10),
(2570, 10, 21, 'Case', 2566, 5287453, 10),
(2571, 10, 21, 'Case', 2567, 5287453, 10),
(2572, 10, 21, 'Case', 2568, 5287453, 10),
(2573, 10, 21, 'Case', 2569, 5287453, 10),
(2574, 10, 21, 'Case', 2570, 5287453, 10),
(2575, 10, 21, 'Case', 2571, 5287453, 10),
(2576, 10, 21, 'Case', 2572, 5287453, 10),
(2577, 10, 21, 'Case', 2573, 5287453, 10),
(2578, 10, 21, 'Case', 2574, 5287453, 10),
(2579, 10, 21, 'Case', 2575, 5287453, 10),
(2580, 10, 21, 'Case', 2576, 5287453, 10),
(2581, 10, 21, 'Case', 2577, 5287453, 10),
(2582, 10, 21, 'Case', 2578, 5287453, 10),
(2583, 10, 21, 'Case', 2579, 5287453, 10),
(2584, 10, 21, 'Case', 2580, 5287453, 10),
(2585, 10, 21, 'Case', 2581, 5287453, 10),
(2586, 10, 21, 'Case', 2582, 5287453, 10),
(2587, 10, 21, 'Case', 2583, 5287453, 10),
(2588, 10, 21, 'Case', 2584, 5287453, 10),
(2589, 10, 21, 'Case', 2585, 5287453, 10),
(2590, 10, 21, 'Case', 2586, 5287453, 10),
(2591, 10, 21, 'Case', 2587, 5287453, 10),
(2592, 10, 21, 'Case', 2588, 5287453, 10),
(2593, 10, 21, 'Case', 2589, 5287453, 10),
(2594, 10, 21, 'Case', 2590, 5287453, 10),
(2595, 10, 21, 'Case', 2591, 5287453, 10),
(2596, 10, 21, 'Case', 2592, 5287453, 10),
(2597, 10, 21, 'Case', 2593, 5287453, 10),
(2598, 10, 21, 'Case', 2594, 5287453, 10),
(2599, 10, 21, 'Case', 2595, 5287453, 10),
(2600, 10, 21, 'Case', 2596, 5287453, 10),
(2601, 10, 21, 'Case', 2597, 5287453, 10),
(2602, 10, 21, 'Case', 2598, 5287453, 10),
(2603, 10, 21, 'Case', 2599, 5287453, 10),
(2604, 10, 21, 'Case', 2600, 5287453, 10),
(2605, 10, 21, 'Case', 2601, 5287453, 10),
(2606, 10, 21, 'Case', 2602, 5287453, 10),
(2607, 10, 21, 'Case', 2603, 5287453, 10),
(2608, 10, 21, 'Case', 2604, 5287453, 10),
(2609, 10, 21, 'Case', 2605, 5287453, 10),
(2610, 10, 21, 'Case', 2606, 5287453, 10),
(2611, 10, 21, 'Case', 2607, 5287453, 10),
(2612, 10, 21, 'Case', 2608, 5287453, 10),
(2613, 10, 21, 'Case', 2609, 5287453, 10),
(2614, 10, 21, 'Case', 2610, 5287453, 10),
(2615, 10, 21, 'Case', 2611, 5287453, 10),
(2616, 10, 21, 'Case', 2612, 5287453, 10),
(2617, 10, 21, 'Case', 2613, 5287453, 10),
(2618, 10, 21, 'Case', 2614, 5287453, 10),
(2619, 10, 21, 'Case', 2615, 5287453, 10),
(2620, 10, 21, 'Case', 2616, 5287453, 10),
(2621, 10, 21, 'Case', 2617, 5287453, 10),
(2622, 10, 21, 'Case', 2618, 5287453, 10),
(2623, 10, 21, 'Case', 2619, 5287453, 10),
(2624, 10, 21, 'Case', 2620, 5287453, 10),
(2625, 10, 21, 'Case', 2621, 5287453, 10),
(2626, 10, 21, 'Case', 2622, 5287453, 10),
(2627, 10, 21, 'Case', 2623, 5287453, 10),
(2628, 10, 21, 'Case', 2624, 5287453, 10),
(2629, 10, 21, 'Case', 2625, 5287453, 10),
(2630, 10, 21, 'Case', 2626, 5287453, 10),
(2631, 10, 21, 'Case', 2627, 5287453, 10),
(2632, 10, 21, 'Case', 2628, 5287453, 10),
(2633, 10, 21, 'Case', 2629, 5287453, 10),
(2634, 10, 21, 'Case', 2630, 5287453, 10),
(2635, 10, 21, 'Case', 2631, 5287453, 10),
(2636, 10, 21, 'Case', 2632, 5287453, 10),
(2637, 10, 21, 'Case', 2633, 5287453, 10),
(2638, 10, 21, 'Case', 2634, 5287453, 10),
(2639, 10, 21, 'Case', 2635, 5287453, 10),
(2640, 10, 21, 'Case', 2636, 5287453, 10),
(2641, 10, 21, 'Case', 2637, 5287453, 10),
(2642, 10, 21, 'Case', 2638, 5287453, 10),
(2643, 10, 21, 'Case', 2639, 5287453, 10),
(2644, 10, 21, 'Case', 2640, 5287453, 10),
(2645, 10, 21, 'Case', 2641, 5287453, 10),
(2646, 10, 21, 'Case', 2642, 5287453, 10),
(2647, 10, 21, 'Case', 2643, 5287453, 10),
(2648, 10, 21, 'Case', 2644, 5287453, 10),
(2649, 10, 21, 'Case', 2645, 5287453, 10),
(2650, 10, 21, 'Case', 2646, 5287453, 10),
(2651, 10, 21, 'Case', 2647, 5287453, 10),
(2652, 10, 21, 'Case', 2648, 5287453, 10),
(2653, 10, 21, 'Case', 2649, 5287453, 10),
(2654, 10, 21, 'Case', 2650, 5287453, 10),
(2655, 10, 21, 'Case', 2651, 5287453, 10),
(2656, 10, 21, 'Case', 2652, 5287453, 10),
(2657, 10, 21, 'Case', 2653, 5287453, 10),
(2658, 10, 21, 'Case', 2654, 5287453, 10),
(2659, 10, 21, 'Case', 2655, 5287453, 10),
(2660, 10, 21, 'Case', 2656, 5287453, 10),
(2661, 10, 21, 'Case', 2657, 5287453, 10),
(2662, 10, 21, 'Case', 2658, 5287453, 10),
(2663, 10, 21, 'Case', 2659, 5287453, 10),
(2664, 10, 21, 'Case', 2660, 5287453, 10),
(2665, 10, 21, 'Case', 2661, 5287454, 10),
(2666, 10, 21, 'Case', 2662, 5287454, 10),
(2667, 10, 21, 'Case', 2663, 5287454, 10),
(2668, 10, 21, 'Case', 2664, 5287454, 10),
(2669, 10, 21, 'Case', 2665, 5287454, 10),
(2670, 10, 21, 'Case', 2666, 5287454, 10),
(2671, 10, 21, 'Case', 2667, 5287454, 10),
(2672, 10, 21, 'Case', 2668, 5287454, 10),
(2673, 10, 21, 'Case', 2669, 5287454, 10),
(2674, 10, 21, 'Case', 2670, 5287454, 10),
(2675, 10, 21, 'Case', 2671, 5287454, 10),
(2676, 10, 21, 'Case', 2672, 5287454, 10),
(2677, 10, 21, 'Case', 2673, 5287454, 10),
(2678, 10, 21, 'Case', 2674, 5287454, 10),
(2679, 10, 21, 'Case', 2675, 5287454, 10),
(2680, 10, 21, 'Case', 2676, 5287454, 10),
(2681, 10, 21, 'Case', 2677, 5287454, 10),
(2682, 10, 21, 'Case', 2678, 5287454, 10),
(2683, 10, 21, 'Case', 2679, 5287454, 10),
(2684, 10, 21, 'Case', 2680, 5287454, 10),
(2685, 10, 21, 'Case', 2681, 5287454, 10),
(2686, 10, 21, 'Case', 2682, 5287454, 10),
(2687, 10, 21, 'Case', 2683, 5287454, 10),
(2688, 10, 21, 'Case', 2684, 5287454, 10),
(2689, 10, 21, 'Case', 2685, 5287454, 10),
(2690, 10, 21, 'Case', 2686, 5287454, 10),
(2691, 10, 21, 'Case', 2687, 5287454, 10),
(2692, 10, 21, 'Case', 2688, 5287454, 10),
(2693, 10, 21, 'Case', 2689, 5287454, 10),
(2694, 10, 21, 'Case', 2690, 5287454, 10),
(2695, 10, 21, 'Case', 2691, 5287454, 10),
(2696, 10, 21, 'Case', 2692, 5287454, 10),
(2697, 10, 21, 'Case', 2693, 5287454, 10),
(2698, 10, 21, 'Case', 2694, 5287454, 10),
(2699, 10, 21, 'Case', 2695, 5287454, 10),
(2700, 10, 21, 'Case', 2696, 5287454, 10),
(2701, 10, 21, 'Case', 2697, 5287454, 10),
(2702, 10, 21, 'Case', 2698, 5287454, 10),
(2703, 10, 21, 'Case', 2699, 5287454, 10),
(2704, 10, 21, 'Case', 2700, 5287454, 10),
(2705, 10, 21, 'Case', 2701, 5287454, 10),
(2706, 10, 21, 'Case', 2702, 5287454, 10),
(2707, 10, 21, 'Case', 2703, 5287454, 10),
(2708, 10, 21, 'Case', 2704, 5287454, 10),
(2709, 10, 21, 'Case', 2705, 5287454, 10),
(2710, 10, 21, 'Case', 2706, 5287454, 10),
(2711, 10, 21, 'Case', 2707, 5287454, 10),
(2712, 10, 21, 'Case', 2708, 5287454, 10),
(2713, 10, 21, 'Case', 2709, 5287454, 10),
(2714, 10, 21, 'Case', 2710, 5287454, 10),
(2715, 10, 21, 'Case', 2711, 5287454, 10),
(2716, 10, 21, 'Case', 2712, 5287454, 10),
(2717, 10, 21, 'Case', 2713, 5287454, 10),
(2718, 10, 21, 'Case', 2714, 5287454, 10),
(2719, 10, 21, 'Case', 2715, 5287454, 10),
(2720, 10, 21, 'Case', 2716, 5287454, 10),
(2721, 10, 21, 'Case', 2717, 5287454, 10),
(2722, 10, 21, 'Case', 2718, 5287454, 10),
(2723, 10, 21, 'Case', 2719, 5287454, 10),
(2724, 10, 21, 'Case', 2720, 5287454, 10),
(2725, 10, 21, 'Case', 2721, 5287454, 10),
(2726, 10, 21, 'Case', 2722, 5287454, 10),
(2727, 10, 21, 'Case', 2723, 5287454, 10),
(2728, 10, 21, 'Case', 2724, 5287454, 10),
(2729, 10, 21, 'Case', 2725, 5287454, 10),
(2730, 10, 21, 'Case', 2726, 5287454, 10),
(2731, 10, 21, 'Case', 2727, 5287454, 10),
(2732, 10, 21, 'Case', 2728, 5287454, 10),
(2733, 10, 21, 'Case', 2729, 5287454, 10),
(2734, 10, 21, 'Case', 2730, 5287454, 10),
(2735, 10, 21, 'Case', 2731, 5287454, 10),
(2736, 10, 21, 'Case', 2732, 5287454, 10),
(2737, 10, 21, 'Case', 2733, 5287454, 10),
(2738, 10, 21, 'Case', 2734, 5287454, 10),
(2739, 10, 21, 'Case', 2735, 5287454, 10),
(2740, 10, 21, 'Case', 2736, 5287454, 10),
(2741, 10, 21, 'Case', 2737, 5287454, 10),
(2742, 10, 21, 'Case', 2738, 5287454, 10),
(2743, 10, 21, 'Case', 2739, 5287454, 10),
(2744, 10, 21, 'Case', 2740, 5287454, 10),
(2745, 10, 21, 'Case', 2741, 5287454, 10),
(2746, 10, 21, 'Case', 2742, 5287454, 10),
(2747, 10, 21, 'Case', 2743, 5287454, 10),
(2748, 10, 21, 'Case', 2744, 5287454, 10),
(2749, 10, 21, 'Case', 2745, 5287454, 10),
(2750, 10, 21, 'Case', 2746, 5287454, 10),
(2751, 10, 21, 'Case', 2747, 5287454, 10),
(2752, 10, 21, 'Case', 2748, 5287454, 10),
(2753, 10, 21, 'Case', 2749, 5287454, 10),
(2754, 10, 21, 'Case', 2750, 5287454, 10),
(2755, 10, 21, 'Case', 2751, 5287454, 10),
(2756, 10, 21, 'Case', 2752, 5287454, 10),
(2757, 10, 21, 'Case', 2753, 5287454, 10),
(2758, 10, 21, 'Case', 2754, 5287454, 10),
(2759, 10, 21, 'Case', 2755, 5287454, 10),
(2760, 10, 21, 'Case', 2756, 5287454, 10),
(2761, 10, 21, 'Case', 2757, 5287454, 10),
(2762, 10, 21, 'Case', 2758, 5287454, 10),
(2763, 10, 21, 'Case', 2759, 5287454, 10),
(2764, 10, 21, 'Case', 2760, 5287454, 10),
(2765, 10, 21, 'Case', 2761, 5287455, 10),
(2766, 10, 21, 'Case', 2762, 5287455, 10),
(2767, 10, 21, 'Case', 2763, 5287455, 10),
(2768, 10, 21, 'Case', 2764, 5287455, 10),
(2769, 10, 21, 'Case', 2765, 5287455, 10),
(2770, 10, 21, 'Case', 2766, 5287455, 10),
(2771, 10, 21, 'Case', 2767, 5287455, 10),
(2772, 10, 21, 'Case', 2768, 5287455, 10),
(2773, 10, 21, 'Case', 2769, 5287455, 10),
(2774, 10, 21, 'Case', 2770, 5287455, 10),
(2775, 10, 21, 'Case', 2771, 5287455, 10),
(2776, 10, 21, 'Case', 2772, 5287455, 10),
(2777, 10, 21, 'Case', 2773, 5287455, 10),
(2778, 10, 21, 'Case', 2774, 5287455, 10),
(2779, 10, 21, 'Case', 2775, 5287455, 10),
(2780, 10, 21, 'Case', 2776, 5287455, 10),
(2781, 10, 21, 'Case', 2777, 5287455, 10),
(2782, 10, 21, 'Case', 2778, 5287455, 10),
(2783, 10, 21, 'Case', 2779, 5287455, 10),
(2784, 10, 21, 'Case', 2780, 5287455, 10),
(2785, 10, 21, 'Case', 2781, 5287455, 10),
(2786, 10, 21, 'Case', 2782, 5287455, 10),
(2787, 10, 21, 'Case', 2783, 5287455, 10),
(2788, 10, 21, 'Case', 2784, 5287455, 10),
(2789, 10, 21, 'Case', 2785, 5287455, 10),
(2790, 10, 21, 'Case', 2786, 5287455, 10),
(2791, 10, 21, 'Case', 2787, 5287455, 10),
(2792, 10, 21, 'Case', 2788, 5287455, 10),
(2793, 10, 21, 'Case', 2789, 5287455, 10),
(2794, 10, 21, 'Case', 2790, 5287455, 10),
(2795, 10, 21, 'Case', 2791, 5287455, 10),
(2796, 10, 21, 'Case', 2792, 5287455, 10),
(2797, 10, 21, 'Case', 2793, 5287455, 10),
(2798, 10, 21, 'Case', 2794, 5287455, 10),
(2799, 10, 21, 'Case', 2795, 5287455, 10),
(2800, 10, 21, 'Case', 2796, 5287455, 10),
(2801, 10, 21, 'Case', 2797, 5287455, 10),
(2802, 10, 21, 'Case', 2798, 5287455, 10),
(2803, 10, 21, 'Case', 2799, 5287455, 10),
(2804, 10, 21, 'Case', 2800, 5287455, 10),
(2805, 10, 21, 'Case', 2801, 5287455, 10),
(2806, 10, 21, 'Case', 2802, 5287455, 10),
(2807, 10, 21, 'Case', 2803, 5287455, 10),
(2808, 10, 21, 'Case', 2804, 5287455, 10),
(2809, 10, 21, 'Case', 2805, 5287455, 10),
(2810, 10, 21, 'Case', 2806, 5287455, 10),
(2811, 10, 21, 'Case', 2807, 5287455, 10),
(2812, 10, 21, 'Case', 2808, 5287455, 10),
(2813, 10, 21, 'Case', 2809, 5287455, 10),
(2814, 10, 21, 'Case', 2810, 5287455, 10),
(2815, 10, 21, 'Case', 2811, 5287455, 10),
(2816, 10, 21, 'Case', 2812, 5287455, 10),
(2817, 10, 21, 'Case', 2813, 5287455, 10),
(2818, 10, 21, 'Case', 2814, 5287455, 10),
(2819, 10, 21, 'Case', 2815, 5287455, 10),
(2820, 10, 21, 'Case', 2816, 5287455, 10),
(2821, 10, 21, 'Case', 2817, 5287455, 10),
(2822, 10, 21, 'Case', 2818, 5287455, 10),
(2823, 10, 21, 'Case', 2819, 5287455, 10),
(2824, 10, 21, 'Case', 2820, 5287455, 10),
(2825, 10, 21, 'Case', 2821, 5287455, 10),
(2826, 10, 21, 'Case', 2822, 5287455, 10),
(2827, 10, 21, 'Case', 2823, 5287455, 10),
(2828, 10, 21, 'Case', 2824, 5287455, 10),
(2829, 10, 21, 'Case', 2825, 5287455, 10),
(2830, 10, 21, 'Case', 2826, 5287455, 10),
(2831, 10, 21, 'Case', 2827, 5287455, 10),
(2832, 10, 21, 'Case', 2828, 5287455, 10),
(2833, 10, 21, 'Case', 2829, 5287455, 10),
(2834, 10, 21, 'Case', 2830, 5287455, 10),
(2835, 10, 21, 'Case', 2831, 5287455, 10),
(2836, 10, 21, 'Case', 2832, 5287455, 10),
(2837, 10, 21, 'Case', 2833, 5287455, 10),
(2838, 10, 21, 'Case', 2834, 5287455, 10),
(2839, 10, 21, 'Case', 2835, 5287455, 10),
(2840, 10, 21, 'Case', 2836, 5287455, 10),
(2841, 10, 21, 'Case', 2837, 5287455, 10),
(2842, 10, 21, 'Case', 2838, 5287455, 10),
(2843, 10, 21, 'Case', 2839, 5287455, 10),
(2844, 10, 21, 'Case', 2840, 5287455, 10),
(2845, 10, 21, 'Case', 2841, 5287455, 10),
(2846, 10, 21, 'Case', 2842, 5287455, 10),
(2847, 10, 21, 'Case', 2843, 5287455, 10),
(2848, 10, 21, 'Case', 2844, 5287455, 10),
(2849, 10, 21, 'Case', 2845, 5287455, 10),
(2850, 10, 21, 'Case', 2846, 5287455, 10),
(2851, 10, 21, 'Case', 2847, 5287455, 10),
(2852, 10, 21, 'Case', 2848, 5287455, 10),
(2853, 10, 21, 'Case', 2849, 5287455, 10),
(2854, 10, 21, 'Case', 2850, 5287455, 10),
(2855, 10, 21, 'Case', 2851, 5287455, 10),
(2856, 10, 21, 'Case', 2852, 5287455, 10),
(2857, 10, 21, 'Case', 2853, 5287455, 10),
(2858, 10, 21, 'Case', 2854, 5287455, 10),
(2859, 10, 21, 'Case', 2855, 5287455, 10),
(2860, 10, 21, 'Case', 2856, 5287455, 10),
(2861, 10, 21, 'Case', 2857, 5287455, 10),
(2862, 10, 21, 'Case', 2858, 5287455, 10),
(2863, 10, 21, 'Case', 2859, 5287455, 10),
(2864, 10, 21, 'Case', 2860, 5287455, 10),
(2865, 10, 21, 'Case', 2861, 5287456, 10),
(2866, 10, 21, 'Case', 2862, 5287456, 10),
(2867, 10, 21, 'Case', 2863, 5287456, 10),
(2868, 10, 21, 'Case', 2864, 5287456, 10),
(2869, 10, 21, 'Case', 2865, 5287456, 10),
(2870, 10, 21, 'Case', 2866, 5287456, 10),
(2871, 10, 21, 'Case', 2867, 5287456, 10),
(2872, 10, 21, 'Case', 2868, 5287456, 10),
(2873, 10, 21, 'Case', 2869, 5287456, 10),
(2874, 10, 21, 'Case', 2870, 5287456, 10),
(2875, 10, 21, 'Case', 2871, 5287456, 10),
(2876, 10, 21, 'Case', 2872, 5287456, 10),
(2877, 10, 21, 'Case', 2873, 5287456, 10),
(2878, 10, 21, 'Case', 2874, 5287456, 10),
(2879, 10, 21, 'Case', 2875, 5287456, 10),
(2880, 10, 21, 'Case', 2876, 5287456, 10),
(2881, 10, 21, 'Case', 2877, 5287456, 10),
(2882, 10, 21, 'Case', 2878, 5287456, 10),
(2883, 10, 21, 'Case', 2879, 5287456, 10),
(2884, 10, 21, 'Case', 2880, 5287456, 10),
(2885, 10, 21, 'Case', 2881, 5287456, 10),
(2886, 10, 21, 'Case', 2882, 5287456, 10),
(2887, 10, 21, 'Case', 2883, 5287456, 10),
(2888, 10, 21, 'Case', 2884, 5287456, 10),
(2889, 10, 21, 'Case', 2885, 5287456, 10),
(2890, 10, 21, 'Case', 2886, 5287456, 10),
(2891, 10, 21, 'Case', 2887, 5287456, 10),
(2892, 10, 21, 'Case', 2888, 5287456, 10),
(2893, 10, 21, 'Case', 2889, 5287456, 10),
(2894, 10, 21, 'Case', 2890, 5287456, 10),
(2895, 10, 21, 'Case', 2891, 5287456, 10),
(2896, 10, 21, 'Case', 2892, 5287456, 10),
(2897, 10, 21, 'Case', 2893, 5287456, 10),
(2898, 10, 21, 'Case', 2894, 5287456, 10),
(2899, 10, 21, 'Case', 2895, 5287456, 10),
(2900, 10, 21, 'Case', 2896, 5287456, 10),
(2901, 10, 21, 'Case', 2897, 5287456, 10),
(2902, 10, 21, 'Case', 2898, 5287456, 10),
(2903, 10, 21, 'Case', 2899, 5287456, 10),
(2904, 10, 21, 'Case', 2900, 5287456, 10),
(2905, 10, 21, 'Case', 2901, 5287456, 10),
(2906, 10, 21, 'Case', 2902, 5287456, 10),
(2907, 10, 21, 'Case', 2903, 5287456, 10),
(2908, 10, 21, 'Case', 2904, 5287456, 10),
(2909, 10, 21, 'Case', 2905, 5287456, 10),
(2910, 10, 21, 'Case', 2906, 5287456, 10),
(2911, 10, 21, 'Case', 2907, 5287456, 10),
(2912, 10, 21, 'Case', 2908, 5287456, 10),
(2913, 10, 21, 'Case', 2909, 5287456, 10),
(2914, 10, 21, 'Case', 2910, 5287456, 10),
(2915, 10, 21, 'Case', 2911, 5287456, 10),
(2916, 10, 21, 'Case', 2912, 5287456, 10),
(2917, 10, 21, 'Case', 2913, 5287456, 10),
(2918, 10, 21, 'Case', 2914, 5287456, 10),
(2919, 10, 21, 'Case', 2915, 5287456, 10),
(2920, 10, 21, 'Case', 2916, 5287456, 10),
(2921, 10, 21, 'Case', 2917, 5287456, 10),
(2922, 10, 21, 'Case', 2918, 5287456, 10),
(2923, 10, 21, 'Case', 2919, 5287456, 10),
(2924, 10, 21, 'Case', 2920, 5287456, 10),
(2925, 10, 21, 'Case', 2921, 5287456, 10),
(2926, 10, 21, 'Case', 2922, 5287456, 10),
(2927, 10, 21, 'Case', 2923, 5287456, 10),
(2928, 10, 21, 'Case', 2924, 5287456, 10),
(2929, 10, 21, 'Case', 2925, 5287456, 10),
(2930, 10, 21, 'Case', 2926, 5287456, 10),
(2931, 10, 21, 'Case', 2927, 5287456, 10),
(2932, 10, 21, 'Case', 2928, 5287456, 10),
(2933, 10, 21, 'Case', 2929, 5287456, 10),
(2934, 10, 21, 'Case', 2930, 5287456, 10),
(2935, 10, 21, 'Case', 2931, 5287456, 10),
(2936, 10, 21, 'Case', 2932, 5287456, 10),
(2937, 10, 21, 'Case', 2933, 5287456, 10),
(2938, 10, 21, 'Case', 2934, 5287456, 10),
(2939, 10, 21, 'Case', 2935, 5287456, 10),
(2940, 10, 21, 'Case', 2936, 5287456, 10),
(2941, 10, 21, 'Case', 2937, 5287456, 10),
(2942, 10, 21, 'Case', 2938, 5287456, 10),
(2943, 10, 21, 'Case', 2939, 5287456, 10),
(2944, 10, 21, 'Case', 2940, 5287456, 10),
(2945, 10, 21, 'Case', 2941, 5287456, 10),
(2946, 10, 21, 'Case', 2942, 5287456, 10),
(2947, 10, 21, 'Case', 2943, 5287456, 10),
(2948, 10, 21, 'Case', 2944, 5287456, 10),
(2949, 10, 21, 'Case', 2945, 5287456, 10),
(2950, 10, 21, 'Case', 2946, 5287456, 10),
(2951, 10, 21, 'Case', 2947, 5287456, 10),
(2952, 10, 21, 'Case', 2948, 5287456, 10),
(2953, 10, 21, 'Case', 2949, 5287456, 10),
(2954, 10, 21, 'Case', 2950, 5287456, 10),
(2955, 10, 21, 'Case', 2951, 5287456, 10),
(2956, 10, 21, 'Case', 2952, 5287456, 10),
(2957, 10, 21, 'Case', 2953, 5287456, 10),
(2958, 10, 21, 'Case', 2954, 5287456, 10),
(2959, 10, 21, 'Case', 2955, 5287456, 10),
(2960, 10, 21, 'Case', 2956, 5287456, 10),
(2961, 10, 21, 'Case', 2957, 5287456, 10),
(2962, 10, 21, 'Case', 2958, 5287456, 10),
(2963, 10, 21, 'Case', 2959, 5287456, 10),
(2964, 10, 21, 'Case', 2960, 5287456, 10),
(2965, 10, 21, 'Case', 2961, 5287457, 10),
(2966, 10, 21, 'Case', 2962, 5287457, 10),
(2967, 10, 21, 'Case', 2963, 5287457, 10),
(2968, 10, 21, 'Case', 2964, 5287457, 10),
(2969, 10, 21, 'Case', 2965, 5287457, 10),
(2970, 10, 21, 'Case', 2966, 5287457, 10),
(2971, 10, 21, 'Case', 2967, 5287457, 10),
(2972, 10, 21, 'Case', 2968, 5287457, 10),
(2973, 10, 21, 'Case', 2969, 5287457, 10),
(2974, 10, 21, 'Case', 2970, 5287457, 10),
(2975, 10, 21, 'Case', 2971, 5287457, 10),
(2976, 10, 21, 'Case', 2972, 5287457, 10),
(2977, 10, 21, 'Case', 2973, 5287457, 10),
(2978, 10, 21, 'Case', 2974, 5287457, 10),
(2979, 10, 21, 'Case', 2975, 5287457, 10),
(2980, 10, 21, 'Case', 2976, 5287457, 10),
(2981, 10, 21, 'Case', 2977, 5287457, 10),
(2982, 10, 21, 'Case', 2978, 5287457, 10),
(2983, 10, 21, 'Case', 2979, 5287457, 10),
(2984, 10, 21, 'Case', 2980, 5287457, 10),
(2985, 10, 21, 'Case', 2981, 5287457, 10),
(2986, 10, 21, 'Case', 2982, 5287457, 10),
(2987, 10, 21, 'Case', 2983, 5287457, 10),
(2988, 10, 21, 'Case', 2984, 5287457, 10),
(2989, 10, 21, 'Case', 2985, 5287457, 10),
(2990, 10, 21, 'Case', 2986, 5287457, 10),
(2991, 10, 21, 'Case', 2987, 5287457, 10),
(2992, 10, 21, 'Case', 2988, 5287457, 10),
(2993, 10, 21, 'Case', 2989, 5287457, 10),
(2994, 10, 21, 'Case', 2990, 5287457, 10),
(2995, 10, 21, 'Case', 2991, 5287457, 10),
(2996, 10, 21, 'Case', 2992, 5287457, 10),
(2997, 10, 21, 'Case', 2993, 5287457, 10),
(2998, 10, 21, 'Case', 2994, 5287457, 10),
(2999, 10, 21, 'Case', 2995, 5287457, 10),
(3000, 10, 21, 'Case', 2996, 5287457, 10),
(3001, 10, 21, 'Case', 2997, 5287457, 10),
(3002, 10, 21, 'Case', 2998, 5287457, 10),
(3003, 10, 21, 'Case', 2999, 5287457, 10),
(3004, 10, 21, 'Case', 3000, 5287457, 10),
(3005, 10, 21, 'Case', 3001, 5287457, 10),
(3006, 10, 21, 'Case', 3002, 5287457, 10),
(3007, 10, 21, 'Case', 3003, 5287457, 10),
(3008, 10, 21, 'Case', 3004, 5287457, 10),
(3009, 10, 21, 'Case', 3005, 5287457, 10),
(3010, 10, 21, 'Case', 3006, 5287457, 10),
(3011, 10, 21, 'Case', 3007, 5287457, 10),
(3012, 10, 21, 'Case', 3008, 5287457, 10),
(3013, 10, 21, 'Case', 3009, 5287457, 10),
(3014, 10, 21, 'Case', 3010, 5287457, 10),
(3015, 10, 21, 'Case', 3011, 5287457, 10),
(3016, 10, 21, 'Case', 3012, 5287457, 10),
(3017, 10, 21, 'Case', 3013, 5287457, 10),
(3018, 10, 21, 'Case', 3014, 5287457, 10),
(3019, 10, 21, 'Case', 3015, 5287457, 10),
(3020, 10, 21, 'Case', 3016, 5287457, 10),
(3021, 10, 21, 'Case', 3017, 5287457, 10),
(3022, 10, 21, 'Case', 3018, 5287457, 10),
(3023, 10, 21, 'Case', 3019, 5287457, 10),
(3024, 10, 21, 'Case', 3020, 5287457, 10),
(3025, 10, 21, 'Case', 3021, 5287457, 10),
(3026, 10, 21, 'Case', 3022, 5287457, 10),
(3027, 10, 21, 'Case', 3023, 5287457, 10),
(3028, 10, 21, 'Case', 3024, 5287457, 10),
(3029, 10, 21, 'Case', 3025, 5287457, 10),
(3030, 10, 21, 'Case', 3026, 5287457, 10),
(3031, 10, 21, 'Case', 3027, 5287457, 10),
(3032, 10, 21, 'Case', 3028, 5287457, 10),
(3033, 10, 21, 'Case', 3029, 5287457, 10),
(3034, 10, 21, 'Case', 3030, 5287457, 10),
(3035, 10, 21, 'Case', 3031, 5287457, 10),
(3036, 10, 21, 'Case', 3032, 5287457, 10),
(3037, 10, 21, 'Case', 3033, 5287457, 10),
(3038, 10, 21, 'Case', 3034, 5287457, 10),
(3039, 10, 21, 'Case', 3035, 5287457, 10),
(3040, 10, 21, 'Case', 3036, 5287457, 10),
(3041, 10, 21, 'Case', 3037, 5287457, 10),
(3042, 10, 21, 'Case', 3038, 5287457, 10),
(3043, 10, 21, 'Case', 3039, 5287457, 10),
(3044, 10, 21, 'Case', 3040, 5287457, 10),
(3045, 10, 21, 'Case', 3041, 5287457, 10),
(3046, 10, 21, 'Case', 3042, 5287457, 10),
(3047, 10, 21, 'Case', 3043, 5287457, 10),
(3048, 10, 21, 'Case', 3044, 5287457, 10),
(3049, 10, 21, 'Case', 3045, 5287457, 10),
(3050, 10, 21, 'Case', 3046, 5287457, 10),
(3051, 10, 21, 'Case', 3047, 5287457, 10),
(3052, 10, 21, 'Case', 3048, 5287457, 10),
(3053, 10, 21, 'Case', 3049, 5287457, 10),
(3054, 10, 21, 'Case', 3050, 5287457, 10),
(3055, 10, 21, 'Case', 3051, 5287457, 10),
(3056, 10, 21, 'Case', 3052, 5287457, 10),
(3057, 10, 21, 'Case', 3053, 5287457, 10),
(3058, 10, 21, 'Case', 3054, 5287457, 10),
(3059, 10, 21, 'Case', 3055, 5287457, 10),
(3060, 10, 21, 'Case', 3056, 5287457, 10),
(3061, 10, 21, 'Case', 3057, 5287457, 10),
(3062, 10, 21, 'Case', 3058, 5287457, 10),
(3063, 10, 21, 'Case', 3059, 5287457, 10),
(3064, 10, 21, 'Case', 3060, 5287457, 10),
(3065, 10, 21, 'Case', 3061, 5287458, 10),
(3066, 10, 21, 'Case', 3062, 5287458, 10),
(3067, 10, 21, 'Case', 3063, 5287458, 10),
(3068, 10, 21, 'Case', 3064, 5287458, 10),
(3069, 10, 21, 'Case', 3065, 5287458, 10),
(3070, 10, 21, 'Case', 3066, 5287458, 10),
(3071, 10, 21, 'Case', 3067, 5287458, 10),
(3072, 10, 21, 'Case', 3068, 5287458, 10),
(3073, 10, 21, 'Case', 3069, 5287458, 10),
(3074, 10, 21, 'Case', 3070, 5287458, 10),
(3075, 10, 21, 'Case', 3071, 5287458, 10),
(3076, 10, 21, 'Case', 3072, 5287458, 10),
(3077, 10, 21, 'Case', 3073, 5287458, 10),
(3078, 10, 21, 'Case', 3074, 5287458, 10),
(3079, 10, 21, 'Case', 3075, 5287458, 10),
(3080, 10, 21, 'Case', 3076, 5287458, 10),
(3081, 10, 21, 'Case', 3077, 5287458, 10),
(3082, 10, 21, 'Case', 3078, 5287458, 10),
(3083, 10, 21, 'Case', 3079, 5287458, 10),
(3084, 10, 21, 'Case', 3080, 5287458, 10),
(3085, 10, 21, 'Case', 3081, 5287458, 10),
(3086, 10, 21, 'Case', 3082, 5287458, 10),
(3087, 10, 21, 'Case', 3083, 5287458, 10),
(3088, 10, 21, 'Case', 3084, 5287458, 10),
(3089, 10, 21, 'Case', 3085, 5287458, 10),
(3090, 10, 21, 'Case', 3086, 5287458, 10),
(3091, 10, 21, 'Case', 3087, 5287458, 10),
(3092, 10, 21, 'Case', 3088, 5287458, 10),
(3093, 10, 21, 'Case', 3089, 5287458, 10),
(3094, 10, 21, 'Case', 3090, 5287458, 10),
(3095, 10, 21, 'Case', 3091, 5287458, 10),
(3096, 10, 21, 'Case', 3092, 5287458, 10),
(3097, 10, 21, 'Case', 3093, 5287458, 10),
(3098, 10, 21, 'Case', 3094, 5287458, 10),
(3099, 10, 21, 'Case', 3095, 5287458, 10),
(3100, 10, 21, 'Case', 3096, 5287458, 10),
(3101, 10, 21, 'Case', 3097, 5287458, 10),
(3102, 10, 21, 'Case', 3098, 5287458, 10),
(3103, 10, 21, 'Case', 3099, 5287458, 10),
(3104, 10, 21, 'Case', 3100, 5287458, 10),
(3105, 10, 21, 'Case', 3101, 5287458, 10),
(3106, 10, 21, 'Case', 3102, 5287458, 10),
(3107, 10, 21, 'Case', 3103, 5287458, 10),
(3108, 10, 21, 'Case', 3104, 5287458, 10),
(3109, 10, 21, 'Case', 3105, 5287458, 10),
(3110, 10, 21, 'Case', 3106, 5287458, 10),
(3111, 10, 21, 'Case', 3107, 5287458, 10),
(3112, 10, 21, 'Case', 3108, 5287458, 10),
(3113, 10, 21, 'Case', 3109, 5287458, 10),
(3114, 10, 21, 'Case', 3110, 5287458, 10),
(3115, 10, 21, 'Case', 3111, 5287458, 10),
(3116, 10, 21, 'Case', 3112, 5287458, 10),
(3117, 10, 21, 'Case', 3113, 5287458, 10),
(3118, 10, 21, 'Case', 3114, 5287458, 10),
(3119, 10, 21, 'Case', 3115, 5287458, 10),
(3120, 10, 21, 'Case', 3116, 5287458, 10),
(3121, 10, 21, 'Case', 3117, 5287458, 10),
(3122, 10, 21, 'Case', 3118, 5287458, 10),
(3123, 10, 21, 'Case', 3119, 5287458, 10),
(3124, 10, 21, 'Case', 3120, 5287458, 10),
(3125, 10, 21, 'Case', 3121, 5287458, 10),
(3126, 10, 21, 'Case', 3122, 5287458, 10),
(3127, 10, 21, 'Case', 3123, 5287458, 10),
(3128, 10, 21, 'Case', 3124, 5287458, 10),
(3129, 10, 21, 'Case', 3125, 5287458, 10),
(3130, 10, 21, 'Case', 3126, 5287458, 10),
(3131, 10, 21, 'Case', 3127, 5287458, 10),
(3132, 10, 21, 'Case', 3128, 5287458, 10),
(3133, 10, 21, 'Case', 3129, 5287458, 10),
(3134, 10, 21, 'Case', 3130, 5287458, 10),
(3135, 10, 21, 'Case', 3131, 5287458, 10),
(3136, 10, 21, 'Case', 3132, 5287458, 10),
(3137, 10, 21, 'Case', 3133, 5287458, 10),
(3138, 10, 21, 'Case', 3134, 5287458, 10),
(3139, 10, 21, 'Case', 3135, 5287458, 10),
(3140, 10, 21, 'Case', 3136, 5287458, 10),
(3141, 10, 21, 'Case', 3137, 5287458, 10),
(3142, 10, 21, 'Case', 3138, 5287458, 10),
(3143, 10, 21, 'Case', 3139, 5287458, 10),
(3144, 10, 21, 'Case', 3140, 5287458, 10),
(3145, 10, 21, 'Case', 3141, 5287458, 10),
(3146, 10, 21, 'Case', 3142, 5287458, 10),
(3147, 10, 21, 'Case', 3143, 5287458, 10),
(3148, 10, 21, 'Case', 3144, 5287458, 10),
(3149, 10, 21, 'Case', 3145, 5287458, 10),
(3150, 10, 21, 'Case', 3146, 5287458, 10),
(3151, 10, 21, 'Case', 3147, 5287458, 10),
(3152, 10, 21, 'Case', 3148, 5287458, 10),
(3153, 10, 21, 'Case', 3149, 5287458, 10),
(3154, 10, 21, 'Case', 3150, 5287458, 10),
(3155, 10, 21, 'Case', 3151, 5287458, 10),
(3156, 10, 21, 'Case', 3152, 5287458, 10),
(3157, 10, 21, 'Case', 3153, 5287458, 10),
(3158, 10, 21, 'Case', 3154, 5287458, 10),
(3159, 10, 21, 'Case', 3155, 5287458, 10),
(3160, 10, 21, 'Case', 3156, 5287458, 10),
(3161, 10, 21, 'Case', 3157, 5287458, 10),
(3162, 10, 21, 'Case', 3158, 5287458, 10),
(3163, 10, 21, 'Case', 3159, 5287458, 10),
(3164, 10, 21, 'Case', 3160, 5287458, 10),
(3165, 10, 21, 'Case', 3161, 5287459, 10),
(3166, 10, 21, 'Case', 3162, 5287459, 10),
(3167, 10, 21, 'Case', 3163, 5287459, 10),
(3168, 10, 21, 'Case', 3164, 5287459, 10),
(3169, 10, 21, 'Case', 3165, 5287459, 10),
(3170, 10, 21, 'Case', 3166, 5287459, 10),
(3171, 10, 21, 'Case', 3167, 5287459, 10),
(3172, 10, 21, 'Case', 3168, 5287459, 10),
(3173, 10, 21, 'Case', 3169, 5287459, 10),
(3174, 10, 21, 'Case', 3170, 5287459, 10),
(3175, 10, 21, 'Case', 3171, 5287459, 10),
(3176, 10, 21, 'Case', 3172, 5287459, 10),
(3177, 10, 21, 'Case', 3173, 5287459, 10),
(3178, 10, 21, 'Case', 3174, 5287459, 10),
(3179, 10, 21, 'Case', 3175, 5287459, 10),
(3180, 10, 21, 'Case', 3176, 5287459, 10),
(3181, 10, 21, 'Case', 3177, 5287459, 10),
(3182, 10, 21, 'Case', 3178, 5287459, 10),
(3183, 10, 21, 'Case', 3179, 5287459, 10),
(3184, 10, 21, 'Case', 3180, 5287459, 10),
(3185, 10, 21, 'Case', 3181, 5287459, 10),
(3186, 10, 21, 'Case', 3182, 5287459, 10),
(3187, 10, 21, 'Case', 3183, 5287459, 10),
(3188, 10, 21, 'Case', 3184, 5287459, 10),
(3189, 10, 21, 'Case', 3185, 5287459, 10),
(3190, 10, 21, 'Case', 3186, 5287459, 10),
(3191, 10, 21, 'Case', 3187, 5287459, 10),
(3192, 10, 21, 'Case', 3188, 5287459, 10),
(3193, 10, 21, 'Case', 3189, 5287459, 10),
(3194, 10, 21, 'Case', 3190, 5287459, 10),
(3195, 10, 21, 'Case', 3191, 5287459, 10),
(3196, 10, 21, 'Case', 3192, 5287459, 10),
(3197, 10, 21, 'Case', 3193, 5287459, 10),
(3198, 10, 21, 'Case', 3194, 5287459, 10),
(3199, 10, 21, 'Case', 3195, 5287459, 10),
(3200, 10, 21, 'Case', 3196, 5287459, 10),
(3201, 10, 21, 'Case', 3197, 5287459, 10),
(3202, 10, 21, 'Case', 3198, 5287459, 10),
(3203, 10, 21, 'Case', 3199, 5287459, 10),
(3204, 10, 21, 'Case', 3200, 5287459, 10),
(3205, 10, 21, 'Case', 3201, 5287459, 10),
(3206, 10, 21, 'Case', 3202, 5287459, 10),
(3207, 10, 21, 'Case', 3203, 5287459, 10),
(3208, 10, 21, 'Case', 3204, 5287459, 10),
(3209, 10, 21, 'Case', 3205, 5287459, 10),
(3210, 10, 21, 'Case', 3206, 5287459, 10),
(3211, 10, 21, 'Case', 3207, 5287459, 10),
(3212, 10, 21, 'Case', 3208, 5287459, 10),
(3213, 10, 21, 'Case', 3209, 5287459, 10),
(3214, 10, 21, 'Case', 3210, 5287459, 10),
(3215, 10, 21, 'Case', 3211, 5287459, 10),
(3216, 10, 21, 'Case', 3212, 5287459, 10),
(3217, 10, 21, 'Case', 3213, 5287459, 10),
(3218, 10, 21, 'Case', 3214, 5287459, 10),
(3219, 10, 21, 'Case', 3215, 5287459, 10),
(3220, 10, 21, 'Case', 3216, 5287459, 10),
(3221, 10, 21, 'Case', 3217, 5287459, 10),
(3222, 10, 21, 'Case', 3218, 5287459, 10),
(3223, 10, 21, 'Case', 3219, 5287459, 10),
(3224, 10, 21, 'Case', 3220, 5287459, 10),
(3225, 10, 21, 'Case', 3221, 5287459, 10),
(3226, 10, 21, 'Case', 3222, 5287459, 10),
(3227, 10, 21, 'Case', 3223, 5287459, 10),
(3228, 10, 21, 'Case', 3224, 5287459, 10),
(3229, 10, 21, 'Case', 3225, 5287459, 10),
(3230, 10, 21, 'Case', 3226, 5287459, 10),
(3231, 10, 21, 'Case', 3227, 5287459, 10),
(3232, 10, 21, 'Case', 3228, 5287459, 10),
(3233, 10, 21, 'Case', 3229, 5287459, 10),
(3234, 10, 21, 'Case', 3230, 5287459, 10),
(3235, 10, 21, 'Case', 3231, 5287459, 10),
(3236, 10, 21, 'Case', 3232, 5287459, 10),
(3237, 10, 21, 'Case', 3233, 5287459, 10),
(3238, 10, 21, 'Case', 3234, 5287459, 10),
(3239, 10, 21, 'Case', 3235, 5287459, 10),
(3240, 10, 21, 'Case', 3236, 5287459, 10),
(3241, 10, 21, 'Case', 3237, 5287459, 10),
(3242, 10, 21, 'Case', 3238, 5287459, 10),
(3243, 10, 21, 'Case', 3239, 5287459, 10),
(3244, 10, 21, 'Case', 3240, 5287459, 10),
(3245, 10, 21, 'Case', 3241, 5287459, 10),
(3246, 10, 21, 'Case', 3242, 5287459, 10),
(3247, 10, 21, 'Case', 3243, 5287459, 10),
(3248, 10, 21, 'Case', 3244, 5287459, 10),
(3249, 10, 21, 'Case', 3245, 5287459, 10),
(3250, 10, 21, 'Case', 3246, 5287459, 10),
(3251, 10, 21, 'Case', 3247, 5287459, 10),
(3252, 10, 21, 'Case', 3248, 5287459, 10),
(3253, 10, 21, 'Case', 3249, 5287459, 10),
(3254, 10, 21, 'Case', 3250, 5287459, 10),
(3255, 10, 21, 'Case', 3251, 5287459, 10),
(3256, 10, 21, 'Case', 3252, 5287459, 10),
(3257, 10, 21, 'Case', 3253, 5287459, 10),
(3258, 10, 21, 'Case', 3254, 5287459, 10),
(3259, 10, 21, 'Case', 3255, 5287459, 10),
(3260, 10, 21, 'Case', 3256, 5287459, 10),
(3261, 10, 21, 'Case', 3257, 5287459, 10),
(3262, 10, 21, 'Case', 3258, 5287459, 10),
(3263, 10, 21, 'Case', 3259, 5287459, 10),
(3264, 10, 21, 'Case', 3260, 5287459, 10);

-- --------------------------------------------------------

--
-- Table structure for table `tp_package_pallet`
--

CREATE TABLE `tp_package_pallet` (
  `id` smallint UNSIGNED NOT NULL COMMENT 'PK',
  `lot_id` smallint UNSIGNED DEFAULT NULL COMMENT 'Lot',
  `product_id` smallint UNSIGNED DEFAULT NULL COMMENT 'Master Data',
  `case_id` smallint UNSIGNED NOT NULL,
  `dimensions_id` smallint UNSIGNED DEFAULT NULL,
  `pallet_images_id` smallint UNSIGNED DEFAULT NULL,
  `package_pallet_sn` int NOT NULL COMMENT 'Use Integers',
  `package_type` varchar(9) DEFAULT NULL,
  `inner_package_count` smallint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tp_package_pallet`
--

INSERT INTO `tp_package_pallet` (`id`, `lot_id`, `product_id`, `case_id`, `dimensions_id`, `pallet_images_id`, `package_pallet_sn`, `package_type`, `inner_package_count`) VALUES
(1, 1, 1, 1, 1, 1, 4250001, 'Pallet', 5),
(2, 1, 1, 2, 1, 1, 4250001, 'Pallet', 5),
(3, 1, 1, 3, 1, 1, 4250001, 'Pallet', 5),
(4, 1, 1, 4, 1, 1, 4250001, 'Pallet', 5),
(5, 1, 1, 5, 1, 1, 4250001, 'Pallet', 5),
(6, 1, 1, 6, 1, 1, 4250001, 'Pallet', 5),
(7, 1, 1, 7, 1, 1, 4250001, 'Pallet', 5),
(8, 1, 1, 8, 1, 1, 4250001, 'Pallet', 5),
(9, 1, 1, 9, 1, 1, 4250001, 'Pallet', 5),
(10, 1, 1, 10, 1, 1, 4250001, 'Pallet', 5),
(11, 19, 1, 11, 1, 1, 452365245, 'Pallet', 6),
(12, 19, 1, 12, 1, 1, 452365245, 'Pallet', 6),
(13, 19, 1, 13, 1, 1, 452365245, 'Pallet', 6),
(14, 19, 1, 14, 1, 1, 452365245, 'Pallet', 6),
(15, 19, 1, 15, 1, 1, 452365245, 'Pallet', 6),
(16, 19, 1, 16, 1, 1, 452365245, 'Pallet', 6),
(17, 19, 1, 17, 1, 1, 452365245, 'Pallet', 6),
(18, 19, 1, 18, 1, 1, 452365245, 'Pallet', 6),
(19, 19, 1, 19, 1, 1, 452365245, 'Pallet', 6),
(20, 19, 1, 20, 1, 1, 452365245, 'Pallet', 6),
(21, 19, 1, 21, 1, 1, 452365245, 'Pallet', 6),
(22, 19, 1, 22, 1, 1, 452365245, 'Pallet', 6),
(23, 19, 1, 23, 1, 1, 452365245, 'Pallet', 6),
(24, 19, 1, 24, 1, 1, 452365245, 'Pallet', 6),
(25, 19, 1, 25, 1, 1, 452365245, 'Pallet', 6),
(26, 19, 1, 26, 1, 1, 452365245, 'Pallet', 6),
(27, 19, 1, 27, 1, 1, 452365245, 'Pallet', 6),
(28, 19, 1, 28, 1, 1, 452365245, 'Pallet', 6),
(29, 19, 1, 29, 1, 1, 452365245, 'Pallet', 6),
(30, 19, 1, 30, 1, 1, 452365245, 'Pallet', 6),
(31, 19, 1, 31, 1, 1, 452365245, 'Pallet', 6),
(32, 19, 1, 32, 1, 1, 452365245, 'Pallet', 6),
(33, 19, 1, 33, 1, 1, 452365245, 'Pallet', 6),
(34, 19, 1, 34, 1, 1, 452365245, 'Pallet', 6),
(35, 19, 1, 35, 1, 1, 452365245, 'Pallet', 6),
(36, 19, 1, 36, 1, 1, 452365245, 'Pallet', 6),
(37, 19, 1, 37, 1, 1, 452365245, 'Pallet', 6),
(38, 19, 1, 38, 1, 1, 452365245, 'Pallet', 6),
(39, 19, 1, 39, 1, 1, 452365245, 'Pallet', 6),
(40, 19, 1, 40, 1, 1, 452365245, 'Pallet', 6),
(41, 19, 1, 41, 1, 1, 452365245, 'Pallet', 6),
(42, 19, 1, 42, 1, 1, 452365245, 'Pallet', 6),
(43, 19, 1, 43, 1, 1, 452365245, 'Pallet', 6),
(44, 19, 1, 44, 1, 1, 452365245, 'Pallet', 6),
(45, 19, 1, 45, 1, 1, 452365245, 'Pallet', 6),
(46, 19, 1, 46, 1, 1, 452365245, 'Pallet', 6),
(47, 19, 1, 47, 1, 1, 452365245, 'Pallet', 6),
(48, 19, 1, 48, 1, 1, 452365245, 'Pallet', 6),
(49, 19, 1, 49, 1, 1, 452365245, 'Pallet', 6),
(50, 19, 1, 50, 1, 1, 452365245, 'Pallet', 6),
(51, 19, 1, 51, 1, 1, 452365245, 'Pallet', 6),
(52, 19, 1, 52, 1, 1, 452365245, 'Pallet', 6),
(53, 19, 1, 53, 1, 1, 452365245, 'Pallet', 6),
(54, 19, 1, 54, 1, 1, 452365245, 'Pallet', 6),
(55, 19, 1, 55, 1, 1, 452365245, 'Pallet', 6),
(56, 19, 1, 56, 1, 1, 452365245, 'Pallet', 6),
(57, 19, 1, 57, 1, 1, 452365245, 'Pallet', 6),
(58, 19, 1, 58, 1, 1, 452365245, 'Pallet', 6),
(59, 19, 1, 59, 1, 1, 452365245, 'Pallet', 6),
(60, 19, 1, 60, 1, 1, 452365245, 'Pallet', 6),
(61, 19, 1, 61, 1, 1, 452365245, 'Pallet', 6),
(62, 19, 1, 62, 1, 1, 452365245, 'Pallet', 6),
(63, 19, 1, 63, 1, 1, 452365245, 'Pallet', 6),
(64, 19, 1, 64, 1, 1, 452365245, 'Pallet', 6),
(65, 19, 1, 65, 1, 1, 452365245, 'Pallet', 6),
(66, 19, 1, 66, 1, 1, 452365245, 'Pallet', 6),
(67, 19, 1, 67, 1, 1, 452365245, 'Pallet', 6),
(68, 19, 1, 68, 1, 1, 452365245, 'Pallet', 6),
(69, 19, 1, 69, 1, 1, 452365245, 'Pallet', 6),
(70, 19, 1, 70, 1, 1, 452365245, 'Pallet', 6),
(71, 1, 1, 71, 1, 1, 452365246, 'Pallet', 2),
(72, 1, 1, 72, 1, 1, 452365246, 'Pallet', 2),
(73, 1, 1, 73, 1, 1, 452365246, 'Pallet', 2),
(74, 1, 1, 74, 1, 1, 452365246, 'Pallet', 2),
(75, 11, 11, 76, 1, 1, 400065245, 'Pallet', 10),
(76, 11, 11, 77, 1, 1, 400065245, 'Pallet', 10),
(77, 11, 11, 78, 1, 1, 400065245, 'Pallet', 10),
(78, 11, 11, 79, 1, 1, 400065245, 'Pallet', 10),
(79, 11, 11, 80, 1, 1, 400065245, 'Pallet', 10),
(80, 11, 11, 81, 1, 1, 400065245, 'Pallet', 10),
(81, 11, 11, 82, 1, 1, 400065245, 'Pallet', 10),
(82, 11, 11, 83, 1, 1, 400065245, 'Pallet', 10),
(83, 11, 11, 84, 1, 1, 400065245, 'Pallet', 10),
(84, 11, 11, 85, 1, 1, 400065245, 'Pallet', 10),
(85, 11, 11, 86, 1, 1, 400065245, 'Pallet', 10),
(86, 11, 11, 87, 1, 1, 400065245, 'Pallet', 10),
(87, 11, 11, 88, 1, 1, 400065245, 'Pallet', 10),
(88, 11, 11, 89, 1, 1, 400065245, 'Pallet', 10),
(89, 11, 11, 90, 1, 1, 400065245, 'Pallet', 10),
(90, 11, 11, 91, 1, 1, 400065245, 'Pallet', 10),
(91, 11, 11, 92, 1, 1, 400065245, 'Pallet', 10),
(92, 11, 11, 93, 1, 1, 400065245, 'Pallet', 10),
(93, 11, 11, 94, 1, 1, 400065245, 'Pallet', 10),
(94, 11, 11, 95, 1, 1, 400065245, 'Pallet', 10),
(95, 11, 11, 96, 1, 1, 400065245, 'Pallet', 10),
(96, 11, 11, 97, 1, 1, 400065245, 'Pallet', 10),
(97, 11, 11, 98, 1, 1, 400065245, 'Pallet', 10),
(98, 11, 11, 99, 1, 1, 400065245, 'Pallet', 10),
(99, 11, 11, 100, 1, 1, 400065245, 'Pallet', 10),
(100, 11, 11, 101, 1, 1, 400065245, 'Pallet', 10),
(101, 11, 11, 102, 1, 1, 400065245, 'Pallet', 10),
(102, 11, 11, 103, 1, 1, 400065245, 'Pallet', 10),
(103, 11, 11, 104, 1, 1, 400065245, 'Pallet', 10),
(104, 11, 11, 105, 1, 1, 400065245, 'Pallet', 10),
(105, 11, 11, 106, 1, 1, 400065245, 'Pallet', 10),
(106, 11, 11, 107, 1, 1, 400065245, 'Pallet', 10),
(107, 11, 11, 108, 1, 1, 400065245, 'Pallet', 10),
(108, 11, 11, 109, 1, 1, 400065245, 'Pallet', 10),
(109, 11, 11, 110, 1, 1, 400065245, 'Pallet', 10),
(110, 11, 11, 111, 1, 1, 400065245, 'Pallet', 10),
(111, 11, 11, 112, 1, 1, 400065245, 'Pallet', 10),
(112, 11, 11, 113, 1, 1, 400065245, 'Pallet', 10),
(113, 11, 11, 114, 1, 1, 400065245, 'Pallet', 10),
(114, 11, 11, 115, 1, 1, 400065245, 'Pallet', 10),
(115, 11, 11, 116, 1, 1, 400065245, 'Pallet', 10),
(116, 11, 11, 117, 1, 1, 400065245, 'Pallet', 10),
(117, 11, 11, 118, 1, 1, 400065245, 'Pallet', 10),
(118, 11, 11, 119, 1, 1, 400065245, 'Pallet', 10),
(119, 11, 11, 120, 1, 1, 400065245, 'Pallet', 10),
(120, 11, 11, 121, 1, 1, 400065245, 'Pallet', 10),
(121, 11, 11, 122, 1, 1, 400065245, 'Pallet', 10),
(122, 11, 11, 123, 1, 1, 400065245, 'Pallet', 10),
(123, 11, 11, 124, 1, 1, 400065245, 'Pallet', 10),
(124, 11, 11, 125, 1, 1, 400065245, 'Pallet', 10),
(125, 11, 11, 126, 1, 1, 400065245, 'Pallet', 10),
(126, 11, 11, 127, 1, 1, 400065245, 'Pallet', 10),
(127, 11, 11, 128, 1, 1, 400065245, 'Pallet', 10),
(128, 11, 11, 129, 1, 1, 400065245, 'Pallet', 10),
(129, 11, 11, 130, 1, 1, 400065245, 'Pallet', 10),
(130, 11, 11, 131, 1, 1, 400065245, 'Pallet', 10),
(131, 11, 11, 132, 1, 1, 400065245, 'Pallet', 10),
(132, 11, 11, 133, 1, 1, 400065245, 'Pallet', 10),
(133, 11, 11, 134, 1, 1, 400065245, 'Pallet', 10),
(134, 11, 11, 135, 1, 1, 400065245, 'Pallet', 10),
(135, 11, 11, 136, 1, 1, 400065245, 'Pallet', 10),
(136, 11, 11, 137, 1, 1, 400065245, 'Pallet', 10),
(137, 11, 11, 138, 1, 1, 400065245, 'Pallet', 10),
(138, 11, 11, 139, 1, 1, 400065245, 'Pallet', 10),
(139, 11, 11, 140, 1, 1, 400065245, 'Pallet', 10),
(140, 11, 11, 141, 1, 1, 400065245, 'Pallet', 10),
(141, 11, 11, 142, 1, 1, 400065245, 'Pallet', 10),
(142, 11, 11, 143, 1, 1, 400065245, 'Pallet', 10),
(143, 11, 11, 144, 1, 1, 400065245, 'Pallet', 10),
(144, 11, 11, 145, 1, 1, 400065245, 'Pallet', 10),
(145, 11, 11, 146, 1, 1, 400065245, 'Pallet', 10),
(146, 11, 11, 147, 1, 1, 400065245, 'Pallet', 10),
(147, 11, 11, 148, 1, 1, 400065245, 'Pallet', 10),
(148, 11, 11, 149, 1, 1, 400065245, 'Pallet', 10),
(149, 11, 11, 150, 1, 1, 400065245, 'Pallet', 10),
(150, 11, 11, 151, 1, 1, 400065245, 'Pallet', 10),
(151, 11, 11, 152, 1, 1, 400065245, 'Pallet', 10),
(152, 11, 11, 153, 1, 1, 400065245, 'Pallet', 10),
(153, 11, 11, 154, 1, 1, 400065245, 'Pallet', 10),
(154, 11, 11, 155, 1, 1, 400065245, 'Pallet', 10),
(155, 11, 11, 156, 1, 1, 400065245, 'Pallet', 10),
(156, 11, 11, 157, 1, 1, 400065245, 'Pallet', 10),
(157, 11, 11, 158, 1, 1, 400065245, 'Pallet', 10),
(158, 11, 11, 159, 1, 1, 400065245, 'Pallet', 10),
(159, 11, 11, 160, 1, 1, 400065245, 'Pallet', 10),
(160, 11, 11, 161, 1, 1, 400065245, 'Pallet', 10),
(161, 11, 11, 162, 1, 1, 400065245, 'Pallet', 10),
(162, 11, 11, 163, 1, 1, 400065245, 'Pallet', 10),
(163, 11, 11, 164, 1, 1, 400065245, 'Pallet', 10),
(164, 11, 11, 165, 1, 1, 400065245, 'Pallet', 10),
(165, 11, 11, 166, 1, 1, 400065245, 'Pallet', 10),
(166, 11, 11, 167, 1, 1, 400065245, 'Pallet', 10),
(167, 11, 11, 168, 1, 1, 400065245, 'Pallet', 10),
(168, 11, 11, 169, 1, 1, 400065245, 'Pallet', 10),
(169, 11, 11, 170, 1, 1, 400065245, 'Pallet', 10),
(170, 11, 11, 171, 1, 1, 400065245, 'Pallet', 10),
(171, 11, 11, 172, 1, 1, 400065245, 'Pallet', 10),
(172, 11, 11, 173, 1, 1, 400065245, 'Pallet', 10),
(173, 11, 11, 174, 1, 1, 400065245, 'Pallet', 10),
(174, 11, 11, 174, 1, 1, 400065245, 'Pallet', 10),
(175, 2, 2, 175, 1, 1, 4589632, 'Pallet', 5),
(176, 2, 2, 176, 1, 1, 4589632, 'Pallet', 5),
(177, 2, 2, 177, 1, 1, 4589632, 'Pallet', 5),
(178, 2, 2, 178, 1, 1, 4589632, 'Pallet', 5),
(179, 2, 2, 179, 1, 1, 4589632, 'Pallet', 5),
(180, 2, 2, 180, 1, 1, 4589632, 'Pallet', 5),
(181, 2, 2, 181, 1, 1, 4589632, 'Pallet', 5),
(182, 2, 2, 182, 1, 1, 4589632, 'Pallet', 5),
(183, 2, 2, 183, 1, 1, 4589632, 'Pallet', 5),
(184, 2, 2, 184, 1, 1, 4589632, 'Pallet', 5),
(185, 3, 3, 185, 1, 1, 4589633, 'Pallet', 5),
(186, 3, 3, 186, 1, 1, 4589633, 'Pallet', 5),
(187, 3, 3, 187, 1, 1, 4589633, 'Pallet', 5),
(188, 3, 3, 188, 1, 1, 4589633, 'Pallet', 5),
(189, 3, 3, 189, 1, 1, 4589633, 'Pallet', 5),
(190, 3, 3, 190, 1, 1, 4589633, 'Pallet', 5),
(191, 3, 3, 191, 1, 1, 4589633, 'Pallet', 5),
(192, 3, 3, 192, 1, 1, 4589633, 'Pallet', 5),
(193, 3, 3, 193, 1, 1, 4589633, 'Pallet', 5),
(194, 3, 3, 194, 1, 1, 4589633, 'Pallet', 5),
(195, 6, 6, 195, 1, 1, 4589634, 'Pallet', 5),
(196, 6, 6, 196, 1, 1, 4589634, 'Pallet', 5),
(197, 6, 6, 197, 1, 1, 4589634, 'Pallet', 5),
(198, 6, 6, 198, 1, 1, 4589634, 'Pallet', 5),
(199, 6, 6, 199, 1, 1, 4589634, 'Pallet', 5),
(200, 6, 6, 200, 1, 1, 4589634, 'Pallet', 5),
(201, 6, 6, 201, 1, 1, 4589634, 'Pallet', 5),
(202, 6, 6, 202, 1, 1, 4589634, 'Pallet', 5),
(203, 6, 6, 203, 1, 1, 4589634, 'Pallet', 5),
(204, 6, 6, 204, 1, 1, 4589634, 'Pallet', 5),
(205, 7, 7, 205, 1, 1, 4589635, 'Pallet', 5),
(206, 7, 7, 206, 1, 1, 4589635, 'Pallet', 5),
(207, 7, 7, 207, 1, 1, 4589635, 'Pallet', 5),
(208, 7, 7, 208, 1, 1, 4589635, 'Pallet', 5),
(209, 7, 7, 209, 1, 1, 4589635, 'Pallet', 5),
(210, 7, 7, 210, 1, 1, 4589635, 'Pallet', 5),
(211, 7, 7, 211, 1, 1, 4589635, 'Pallet', 5),
(212, 7, 7, 212, 1, 1, 4589635, 'Pallet', 5),
(213, 7, 7, 213, 1, 1, 4589635, 'Pallet', 5),
(214, 7, 7, 214, 1, 1, 4589635, 'Pallet', 5),
(215, 8, 8, 215, 1, 1, 4589636, 'Pallet', 5),
(216, 8, 8, 216, 1, 1, 4589636, 'Pallet', 5),
(217, 8, 8, 217, 1, 1, 4589636, 'Pallet', 5),
(218, 8, 8, 218, 1, 1, 4589636, 'Pallet', 5),
(219, 8, 8, 219, 1, 1, 4589636, 'Pallet', 5),
(220, 8, 8, 220, 1, 1, 4589636, 'Pallet', 5),
(221, 8, 8, 221, 1, 1, 4589636, 'Pallet', 5),
(222, 8, 8, 222, 1, 1, 4589636, 'Pallet', 5),
(223, 8, 8, 223, 1, 1, 4589636, 'Pallet', 5),
(224, 8, 8, 224, 1, 1, 4589636, 'Pallet', 5),
(225, 9, 9, 225, 1, 1, 4589637, 'Pallet', 5),
(226, 9, 9, 226, 1, 1, 4589637, 'Pallet', 5),
(227, 9, 9, 227, 1, 1, 4589637, 'Pallet', 5),
(228, 9, 9, 228, 1, 1, 4589637, 'Pallet', 5),
(229, 9, 9, 229, 1, 1, 4589637, 'Pallet', 5),
(230, 9, 9, 230, 1, 1, 4589637, 'Pallet', 5),
(231, 9, 9, 231, 1, 1, 4589637, 'Pallet', 5),
(232, 9, 9, 232, 1, 1, 4589637, 'Pallet', 5),
(233, 9, 9, 233, 1, 1, 4589637, 'Pallet', 5),
(234, 9, 9, 234, 1, 1, 4589637, 'Pallet', 5),
(235, 10, 10, 235, 1, 1, 4589638, 'Pallet', 5),
(236, 10, 10, 236, 1, 1, 4589638, 'Pallet', 5),
(237, 10, 10, 237, 1, 1, 4589638, 'Pallet', 5),
(238, 10, 10, 238, 1, 1, 4589638, 'Pallet', 5),
(239, 10, 10, 239, 1, 1, 4589638, 'Pallet', 5),
(240, 10, 10, 240, 1, 1, 4589638, 'Pallet', 5),
(241, 10, 10, 241, 1, 1, 4589638, 'Pallet', 5),
(242, 10, 10, 242, 1, 1, 4589638, 'Pallet', 5),
(243, 10, 10, 243, 1, 1, 4589638, 'Pallet', 5),
(244, 10, 10, 244, 1, 1, 4589638, 'Pallet', 5),
(245, 12, 12, 245, 1, 1, 4589639, 'Pallet', 5),
(246, 12, 12, 246, 1, 1, 4589639, 'Pallet', 5),
(247, 12, 12, 247, 1, 1, 4589639, 'Pallet', 5),
(248, 12, 12, 248, 1, 1, 4589639, 'Pallet', 5),
(249, 12, 12, 249, 1, 1, 4589639, 'Pallet', 5),
(250, 12, 12, 250, 1, 1, 4589639, 'Pallet', 5),
(251, 12, 12, 251, 1, 1, 4589639, 'Pallet', 5),
(252, 12, 12, 252, 1, 1, 4589639, 'Pallet', 5),
(253, 12, 12, 253, 1, 1, 4589639, 'Pallet', 5),
(254, 12, 12, 254, 1, 1, 4589639, 'Pallet', 5),
(255, 13, 13, 255, 1, 1, 4589640, 'Pallet', 5),
(256, 13, 13, 256, 1, 1, 4589640, 'Pallet', 5),
(257, 13, 13, 257, 1, 1, 4589640, 'Pallet', 5),
(258, 13, 13, 258, 1, 1, 4589640, 'Pallet', 5),
(259, 13, 13, 259, 1, 1, 4589640, 'Pallet', 5),
(260, 13, 13, 260, 1, 1, 4589640, 'Pallet', 5),
(261, 13, 13, 261, 1, 1, 4589640, 'Pallet', 5),
(262, 13, 13, 262, 1, 1, 4589640, 'Pallet', 5),
(263, 13, 13, 263, 1, 1, 4589640, 'Pallet', 5),
(264, 13, 13, 264, 1, 1, 4589640, 'Pallet', 5),
(265, 21, 10, 265, 1, 1, 458758962, 'Pallet', 300),
(266, 21, 10, 266, 1, 1, 458758962, 'Pallet', 300),
(267, 21, 10, 267, 1, 1, 458758962, 'Pallet', 300),
(268, 21, 10, 268, 1, 1, 458758962, 'Pallet', 300),
(269, 21, 10, 269, 1, 1, 458758962, 'Pallet', 300),
(270, 21, 10, 270, 1, 1, 458758962, 'Pallet', 300),
(271, 21, 10, 271, 1, 1, 458758962, 'Pallet', 300),
(272, 21, 10, 272, 1, 1, 458758962, 'Pallet', 300),
(273, 21, 10, 273, 1, 1, 458758962, 'Pallet', 300),
(274, 21, 10, 274, 1, 1, 458758962, 'Pallet', 300),
(275, 21, 10, 275, 1, 1, 458758962, 'Pallet', 300),
(276, 21, 10, 276, 1, 1, 458758962, 'Pallet', 300),
(277, 21, 10, 277, 1, 1, 458758962, 'Pallet', 300),
(278, 21, 10, 278, 1, 1, 458758962, 'Pallet', 300),
(279, 21, 10, 279, 1, 1, 458758962, 'Pallet', 300),
(280, 21, 10, 280, 1, 1, 458758962, 'Pallet', 300),
(281, 21, 10, 281, 1, 1, 458758962, 'Pallet', 300),
(282, 21, 10, 282, 1, 1, 458758962, 'Pallet', 300),
(283, 21, 10, 283, 1, 1, 458758962, 'Pallet', 300),
(284, 21, 10, 284, 1, 1, 458758962, 'Pallet', 300),
(285, 21, 10, 285, 1, 1, 458758962, 'Pallet', 300),
(286, 21, 10, 286, 1, 1, 458758962, 'Pallet', 300),
(287, 21, 10, 287, 1, 1, 458758962, 'Pallet', 300),
(288, 21, 10, 288, 1, 1, 458758962, 'Pallet', 300),
(289, 21, 10, 289, 1, 1, 458758962, 'Pallet', 300),
(290, 21, 10, 290, 1, 1, 458758962, 'Pallet', 300),
(291, 21, 10, 291, 1, 1, 458758962, 'Pallet', 300),
(292, 21, 10, 292, 1, 1, 458758962, 'Pallet', 300),
(293, 21, 10, 293, 1, 1, 458758962, 'Pallet', 300),
(294, 21, 10, 294, 1, 1, 458758962, 'Pallet', 300),
(295, 21, 10, 295, 1, 1, 458758962, 'Pallet', 300),
(296, 21, 10, 296, 1, 1, 458758962, 'Pallet', 300),
(297, 21, 10, 297, 1, 1, 458758962, 'Pallet', 300),
(298, 21, 10, 298, 1, 1, 458758962, 'Pallet', 300),
(299, 21, 10, 299, 1, 1, 458758962, 'Pallet', 300),
(300, 21, 10, 300, 1, 1, 458758962, 'Pallet', 300),
(301, 21, 10, 301, 1, 1, 458758962, 'Pallet', 300),
(302, 21, 10, 302, 1, 1, 458758962, 'Pallet', 300),
(303, 21, 10, 303, 1, 1, 458758962, 'Pallet', 300),
(304, 21, 10, 304, 1, 1, 458758962, 'Pallet', 300),
(305, 21, 10, 305, 1, 1, 458758962, 'Pallet', 300),
(306, 21, 10, 306, 1, 1, 458758962, 'Pallet', 300),
(307, 21, 10, 307, 1, 1, 458758962, 'Pallet', 300),
(308, 21, 10, 308, 1, 1, 458758962, 'Pallet', 300),
(309, 21, 10, 309, 1, 1, 458758962, 'Pallet', 300),
(310, 21, 10, 310, 1, 1, 458758962, 'Pallet', 300),
(311, 21, 10, 311, 1, 1, 458758962, 'Pallet', 300),
(312, 21, 10, 312, 1, 1, 458758962, 'Pallet', 300),
(313, 21, 10, 313, 1, 1, 458758962, 'Pallet', 300),
(314, 21, 10, 314, 1, 1, 458758962, 'Pallet', 300),
(315, 21, 10, 315, 1, 1, 458758962, 'Pallet', 300),
(316, 21, 10, 316, 1, 1, 458758962, 'Pallet', 300),
(317, 21, 10, 317, 1, 1, 458758962, 'Pallet', 300),
(318, 21, 10, 318, 1, 1, 458758962, 'Pallet', 300),
(319, 21, 10, 319, 1, 1, 458758962, 'Pallet', 300),
(320, 21, 10, 320, 1, 1, 458758962, 'Pallet', 300),
(321, 21, 10, 321, 1, 1, 458758962, 'Pallet', 300),
(322, 21, 10, 322, 1, 1, 458758962, 'Pallet', 300),
(323, 21, 10, 323, 1, 1, 458758962, 'Pallet', 300),
(324, 21, 10, 324, 1, 1, 458758962, 'Pallet', 300),
(325, 21, 10, 325, 1, 1, 458758962, 'Pallet', 300),
(326, 21, 10, 326, 1, 1, 458758962, 'Pallet', 300),
(327, 21, 10, 327, 1, 1, 458758962, 'Pallet', 300),
(328, 21, 10, 328, 1, 1, 458758962, 'Pallet', 300),
(329, 21, 10, 329, 1, 1, 458758962, 'Pallet', 300),
(330, 21, 10, 330, 1, 1, 458758962, 'Pallet', 300),
(331, 21, 10, 331, 1, 1, 458758962, 'Pallet', 300),
(332, 21, 10, 332, 1, 1, 458758962, 'Pallet', 300),
(333, 21, 10, 333, 1, 1, 458758962, 'Pallet', 300),
(334, 21, 10, 334, 1, 1, 458758962, 'Pallet', 300),
(335, 21, 10, 335, 1, 1, 458758962, 'Pallet', 300),
(336, 21, 10, 336, 1, 1, 458758962, 'Pallet', 300),
(337, 21, 10, 337, 1, 1, 458758962, 'Pallet', 300),
(338, 21, 10, 338, 1, 1, 458758962, 'Pallet', 300),
(339, 21, 10, 339, 1, 1, 458758962, 'Pallet', 300),
(340, 21, 10, 340, 1, 1, 458758962, 'Pallet', 300),
(341, 21, 10, 341, 1, 1, 458758962, 'Pallet', 300),
(342, 21, 10, 342, 1, 1, 458758962, 'Pallet', 300),
(343, 21, 10, 343, 1, 1, 458758962, 'Pallet', 300),
(344, 21, 10, 344, 1, 1, 458758962, 'Pallet', 300),
(345, 21, 10, 345, 1, 1, 458758962, 'Pallet', 300),
(346, 21, 10, 346, 1, 1, 458758962, 'Pallet', 300),
(347, 21, 10, 347, 1, 1, 458758962, 'Pallet', 300),
(348, 21, 10, 348, 1, 1, 458758962, 'Pallet', 300),
(349, 21, 10, 349, 1, 1, 458758962, 'Pallet', 300),
(350, 21, 10, 350, 1, 1, 458758962, 'Pallet', 300),
(351, 21, 10, 351, 1, 1, 458758962, 'Pallet', 300),
(352, 21, 10, 352, 1, 1, 458758962, 'Pallet', 300),
(353, 21, 10, 353, 1, 1, 458758962, 'Pallet', 300),
(354, 21, 10, 354, 1, 1, 458758962, 'Pallet', 300),
(355, 21, 10, 355, 1, 1, 458758962, 'Pallet', 300),
(356, 21, 10, 356, 1, 1, 458758962, 'Pallet', 300),
(357, 21, 10, 357, 1, 1, 458758962, 'Pallet', 300),
(358, 21, 10, 358, 1, 1, 458758962, 'Pallet', 300),
(359, 21, 10, 359, 1, 1, 458758962, 'Pallet', 300),
(360, 21, 10, 360, 1, 1, 458758962, 'Pallet', 300),
(361, 21, 10, 361, 1, 1, 458758962, 'Pallet', 300),
(362, 21, 10, 362, 1, 1, 458758962, 'Pallet', 300),
(363, 21, 10, 363, 1, 1, 458758962, 'Pallet', 300),
(364, 21, 10, 364, 1, 1, 458758962, 'Pallet', 300),
(365, 21, 10, 365, 1, 1, 458758962, 'Pallet', 300),
(366, 21, 10, 366, 1, 1, 458758962, 'Pallet', 300),
(367, 21, 10, 367, 1, 1, 458758962, 'Pallet', 300),
(368, 21, 10, 368, 1, 1, 458758962, 'Pallet', 300),
(369, 21, 10, 369, 1, 1, 458758962, 'Pallet', 300),
(370, 21, 10, 370, 1, 1, 458758962, 'Pallet', 300),
(371, 21, 10, 371, 1, 1, 458758962, 'Pallet', 300),
(372, 21, 10, 372, 1, 1, 458758962, 'Pallet', 300),
(373, 21, 10, 373, 1, 1, 458758962, 'Pallet', 300),
(374, 21, 10, 374, 1, 1, 458758962, 'Pallet', 300),
(375, 21, 10, 375, 1, 1, 458758962, 'Pallet', 300),
(376, 21, 10, 376, 1, 1, 458758962, 'Pallet', 300),
(377, 21, 10, 377, 1, 1, 458758962, 'Pallet', 300),
(378, 21, 10, 378, 1, 1, 458758962, 'Pallet', 300),
(379, 21, 10, 379, 1, 1, 458758962, 'Pallet', 300),
(380, 21, 10, 380, 1, 1, 458758962, 'Pallet', 300),
(381, 21, 10, 381, 1, 1, 458758962, 'Pallet', 300),
(382, 21, 10, 382, 1, 1, 458758962, 'Pallet', 300),
(383, 21, 10, 383, 1, 1, 458758962, 'Pallet', 300),
(384, 21, 10, 384, 1, 1, 458758962, 'Pallet', 300),
(385, 21, 10, 385, 1, 1, 458758962, 'Pallet', 300),
(386, 21, 10, 386, 1, 1, 458758962, 'Pallet', 300),
(387, 21, 10, 387, 1, 1, 458758962, 'Pallet', 300),
(388, 21, 10, 388, 1, 1, 458758962, 'Pallet', 300),
(389, 21, 10, 389, 1, 1, 458758962, 'Pallet', 300),
(390, 21, 10, 390, 1, 1, 458758962, 'Pallet', 300),
(391, 21, 10, 391, 1, 1, 458758962, 'Pallet', 300),
(392, 21, 10, 392, 1, 1, 458758962, 'Pallet', 300),
(393, 21, 10, 393, 1, 1, 458758962, 'Pallet', 300),
(394, 21, 10, 394, 1, 1, 458758962, 'Pallet', 300),
(395, 21, 10, 395, 1, 1, 458758962, 'Pallet', 300),
(396, 21, 10, 396, 1, 1, 458758962, 'Pallet', 300),
(397, 21, 10, 397, 1, 1, 458758962, 'Pallet', 300),
(398, 21, 10, 398, 1, 1, 458758962, 'Pallet', 300),
(399, 21, 10, 399, 1, 1, 458758962, 'Pallet', 300),
(400, 21, 10, 400, 1, 1, 458758962, 'Pallet', 300),
(401, 21, 10, 401, 1, 1, 458758962, 'Pallet', 300),
(402, 21, 10, 402, 1, 1, 458758962, 'Pallet', 300),
(403, 21, 10, 403, 1, 1, 458758962, 'Pallet', 300),
(404, 21, 10, 404, 1, 1, 458758962, 'Pallet', 300),
(405, 21, 10, 405, 1, 1, 458758962, 'Pallet', 300),
(406, 21, 10, 406, 1, 1, 458758962, 'Pallet', 300),
(407, 21, 10, 407, 1, 1, 458758962, 'Pallet', 300),
(408, 21, 10, 408, 1, 1, 458758962, 'Pallet', 300),
(409, 21, 10, 409, 1, 1, 458758962, 'Pallet', 300),
(410, 21, 10, 410, 1, 1, 458758962, 'Pallet', 300),
(411, 21, 10, 411, 1, 1, 458758962, 'Pallet', 300),
(412, 21, 10, 412, 1, 1, 458758962, 'Pallet', 300),
(413, 21, 10, 413, 1, 1, 458758962, 'Pallet', 300),
(414, 21, 10, 414, 1, 1, 458758962, 'Pallet', 300),
(415, 21, 10, 415, 1, 1, 458758962, 'Pallet', 300),
(416, 21, 10, 416, 1, 1, 458758962, 'Pallet', 300),
(417, 21, 10, 417, 1, 1, 458758962, 'Pallet', 300),
(418, 21, 10, 418, 1, 1, 458758962, 'Pallet', 300),
(419, 21, 10, 419, 1, 1, 458758962, 'Pallet', 300),
(420, 21, 10, 420, 1, 1, 458758962, 'Pallet', 300),
(421, 21, 10, 421, 1, 1, 458758962, 'Pallet', 300),
(422, 21, 10, 422, 1, 1, 458758962, 'Pallet', 300),
(423, 21, 10, 423, 1, 1, 458758962, 'Pallet', 300),
(424, 21, 10, 424, 1, 1, 458758962, 'Pallet', 300),
(425, 21, 10, 425, 1, 1, 458758962, 'Pallet', 300),
(426, 21, 10, 426, 1, 1, 458758962, 'Pallet', 300),
(427, 21, 10, 427, 1, 1, 458758962, 'Pallet', 300),
(428, 21, 10, 428, 1, 1, 458758962, 'Pallet', 300),
(429, 21, 10, 429, 1, 1, 458758962, 'Pallet', 300),
(430, 21, 10, 430, 1, 1, 458758962, 'Pallet', 300),
(431, 21, 10, 431, 1, 1, 458758962, 'Pallet', 300),
(432, 21, 10, 432, 1, 1, 458758962, 'Pallet', 300),
(433, 21, 10, 433, 1, 1, 458758962, 'Pallet', 300),
(434, 21, 10, 434, 1, 1, 458758962, 'Pallet', 300),
(435, 21, 10, 435, 1, 1, 458758962, 'Pallet', 300),
(436, 21, 10, 436, 1, 1, 458758962, 'Pallet', 300),
(437, 21, 10, 437, 1, 1, 458758962, 'Pallet', 300),
(438, 21, 10, 438, 1, 1, 458758962, 'Pallet', 300),
(439, 21, 10, 439, 1, 1, 458758962, 'Pallet', 300),
(440, 21, 10, 440, 1, 1, 458758962, 'Pallet', 300),
(441, 21, 10, 441, 1, 1, 458758962, 'Pallet', 300),
(442, 21, 10, 442, 1, 1, 458758962, 'Pallet', 300),
(443, 21, 10, 443, 1, 1, 458758962, 'Pallet', 300),
(444, 21, 10, 444, 1, 1, 458758962, 'Pallet', 300),
(445, 21, 10, 445, 1, 1, 458758962, 'Pallet', 300),
(446, 21, 10, 446, 1, 1, 458758962, 'Pallet', 300),
(447, 21, 10, 447, 1, 1, 458758962, 'Pallet', 300),
(448, 21, 10, 448, 1, 1, 458758962, 'Pallet', 300),
(449, 21, 10, 449, 1, 1, 458758962, 'Pallet', 300),
(450, 21, 10, 450, 1, 1, 458758962, 'Pallet', 300),
(451, 21, 10, 451, 1, 1, 458758962, 'Pallet', 300),
(452, 21, 10, 452, 1, 1, 458758962, 'Pallet', 300),
(453, 21, 10, 453, 1, 1, 458758962, 'Pallet', 300),
(454, 21, 10, 454, 1, 1, 458758962, 'Pallet', 300),
(455, 21, 10, 455, 1, 1, 458758962, 'Pallet', 300),
(456, 21, 10, 456, 1, 1, 458758962, 'Pallet', 300),
(457, 21, 10, 457, 1, 1, 458758962, 'Pallet', 300),
(458, 21, 10, 458, 1, 1, 458758962, 'Pallet', 300),
(459, 21, 10, 459, 1, 1, 458758962, 'Pallet', 300),
(460, 21, 10, 460, 1, 1, 458758962, 'Pallet', 300),
(461, 21, 10, 461, 1, 1, 458758962, 'Pallet', 300),
(462, 21, 10, 462, 1, 1, 458758962, 'Pallet', 300),
(463, 21, 10, 463, 1, 1, 458758962, 'Pallet', 300),
(464, 21, 10, 464, 1, 1, 458758962, 'Pallet', 300),
(465, 21, 10, 465, 1, 1, 458758962, 'Pallet', 300),
(466, 21, 10, 466, 1, 1, 458758962, 'Pallet', 300),
(467, 21, 10, 467, 1, 1, 458758962, 'Pallet', 300),
(468, 21, 10, 468, 1, 1, 458758962, 'Pallet', 300),
(469, 21, 10, 469, 1, 1, 458758962, 'Pallet', 300),
(470, 21, 10, 470, 1, 1, 458758962, 'Pallet', 300),
(471, 21, 10, 471, 1, 1, 458758962, 'Pallet', 300),
(472, 21, 10, 472, 1, 1, 458758962, 'Pallet', 300),
(473, 21, 10, 473, 1, 1, 458758962, 'Pallet', 300),
(474, 21, 10, 474, 1, 1, 458758962, 'Pallet', 300),
(475, 21, 10, 475, 1, 1, 458758962, 'Pallet', 300),
(476, 21, 10, 476, 1, 1, 458758962, 'Pallet', 300),
(477, 21, 10, 477, 1, 1, 458758962, 'Pallet', 300),
(478, 21, 10, 478, 1, 1, 458758962, 'Pallet', 300),
(479, 21, 10, 479, 1, 1, 458758962, 'Pallet', 300),
(480, 21, 10, 480, 1, 1, 458758962, 'Pallet', 300),
(481, 21, 10, 481, 1, 1, 458758962, 'Pallet', 300),
(482, 21, 10, 482, 1, 1, 458758962, 'Pallet', 300),
(483, 21, 10, 483, 1, 1, 458758962, 'Pallet', 300),
(484, 21, 10, 484, 1, 1, 458758962, 'Pallet', 300),
(485, 21, 10, 485, 1, 1, 458758962, 'Pallet', 300),
(486, 21, 10, 486, 1, 1, 458758962, 'Pallet', 300),
(487, 21, 10, 487, 1, 1, 458758962, 'Pallet', 300),
(488, 21, 10, 488, 1, 1, 458758962, 'Pallet', 300),
(489, 21, 10, 489, 1, 1, 458758962, 'Pallet', 300),
(490, 21, 10, 490, 1, 1, 458758962, 'Pallet', 300),
(491, 21, 10, 491, 1, 1, 458758962, 'Pallet', 300),
(492, 21, 10, 492, 1, 1, 458758962, 'Pallet', 300),
(493, 21, 10, 493, 1, 1, 458758962, 'Pallet', 300),
(494, 21, 10, 494, 1, 1, 458758962, 'Pallet', 300),
(495, 21, 10, 495, 1, 1, 458758962, 'Pallet', 300),
(496, 21, 10, 496, 1, 1, 458758962, 'Pallet', 300),
(497, 21, 10, 497, 1, 1, 458758962, 'Pallet', 300),
(498, 21, 10, 498, 1, 1, 458758962, 'Pallet', 300),
(499, 21, 10, 499, 1, 1, 458758962, 'Pallet', 300),
(500, 21, 10, 500, 1, 1, 458758962, 'Pallet', 300),
(501, 21, 10, 501, 1, 1, 458758962, 'Pallet', 300),
(502, 21, 10, 502, 1, 1, 458758962, 'Pallet', 300),
(503, 21, 10, 503, 1, 1, 458758962, 'Pallet', 300),
(504, 21, 10, 504, 1, 1, 458758962, 'Pallet', 300),
(505, 21, 10, 505, 1, 1, 458758962, 'Pallet', 300),
(506, 21, 10, 506, 1, 1, 458758962, 'Pallet', 300),
(507, 21, 10, 507, 1, 1, 458758962, 'Pallet', 300),
(508, 21, 10, 508, 1, 1, 458758962, 'Pallet', 300),
(509, 21, 10, 509, 1, 1, 458758962, 'Pallet', 300),
(510, 21, 10, 510, 1, 1, 458758962, 'Pallet', 300),
(511, 21, 10, 511, 1, 1, 458758962, 'Pallet', 300),
(512, 21, 10, 512, 1, 1, 458758962, 'Pallet', 300),
(513, 21, 10, 513, 1, 1, 458758962, 'Pallet', 300),
(514, 21, 10, 514, 1, 1, 458758962, 'Pallet', 300),
(515, 21, 10, 515, 1, 1, 458758962, 'Pallet', 300),
(516, 21, 10, 516, 1, 1, 458758962, 'Pallet', 300),
(517, 21, 10, 517, 1, 1, 458758962, 'Pallet', 300),
(518, 21, 10, 518, 1, 1, 458758962, 'Pallet', 300),
(519, 21, 10, 519, 1, 1, 458758962, 'Pallet', 300),
(520, 21, 10, 520, 1, 1, 458758962, 'Pallet', 300),
(521, 21, 10, 521, 1, 1, 458758962, 'Pallet', 300),
(522, 21, 10, 522, 1, 1, 458758962, 'Pallet', 300),
(523, 21, 10, 523, 1, 1, 458758962, 'Pallet', 300),
(524, 21, 10, 524, 1, 1, 458758962, 'Pallet', 300),
(525, 21, 10, 525, 1, 1, 458758962, 'Pallet', 300),
(526, 21, 10, 526, 1, 1, 458758962, 'Pallet', 300),
(527, 21, 10, 527, 1, 1, 458758962, 'Pallet', 300),
(528, 21, 10, 528, 1, 1, 458758962, 'Pallet', 300),
(529, 21, 10, 529, 1, 1, 458758962, 'Pallet', 300),
(530, 21, 10, 530, 1, 1, 458758962, 'Pallet', 300),
(531, 21, 10, 531, 1, 1, 458758962, 'Pallet', 300),
(532, 21, 10, 532, 1, 1, 458758962, 'Pallet', 300),
(533, 21, 10, 533, 1, 1, 458758962, 'Pallet', 300),
(534, 21, 10, 534, 1, 1, 458758962, 'Pallet', 300),
(535, 21, 10, 535, 1, 1, 458758962, 'Pallet', 300),
(536, 21, 10, 536, 1, 1, 458758962, 'Pallet', 300),
(537, 21, 10, 537, 1, 1, 458758962, 'Pallet', 300),
(538, 21, 10, 538, 1, 1, 458758962, 'Pallet', 300),
(539, 21, 10, 539, 1, 1, 458758962, 'Pallet', 300),
(540, 21, 10, 540, 1, 1, 458758962, 'Pallet', 300),
(541, 21, 10, 541, 1, 1, 458758962, 'Pallet', 300),
(542, 21, 10, 542, 1, 1, 458758962, 'Pallet', 300),
(543, 21, 10, 543, 1, 1, 458758962, 'Pallet', 300),
(544, 21, 10, 544, 1, 1, 458758962, 'Pallet', 300),
(545, 21, 10, 545, 1, 1, 458758962, 'Pallet', 300),
(546, 21, 10, 546, 1, 1, 458758962, 'Pallet', 300),
(547, 21, 10, 547, 1, 1, 458758962, 'Pallet', 300),
(548, 21, 10, 548, 1, 1, 458758962, 'Pallet', 300),
(549, 21, 10, 549, 1, 1, 458758962, 'Pallet', 300),
(550, 21, 10, 550, 1, 1, 458758962, 'Pallet', 300),
(551, 21, 10, 551, 1, 1, 458758962, 'Pallet', 300),
(552, 21, 10, 552, 1, 1, 458758962, 'Pallet', 300),
(553, 21, 10, 553, 1, 1, 458758962, 'Pallet', 300),
(554, 21, 10, 554, 1, 1, 458758962, 'Pallet', 300),
(555, 21, 10, 555, 1, 1, 458758962, 'Pallet', 300),
(556, 21, 10, 556, 1, 1, 458758962, 'Pallet', 300),
(557, 21, 10, 557, 1, 1, 458758962, 'Pallet', 300),
(558, 21, 10, 558, 1, 1, 458758962, 'Pallet', 300),
(559, 21, 10, 559, 1, 1, 458758962, 'Pallet', 300),
(560, 21, 10, 560, 1, 1, 458758962, 'Pallet', 300),
(561, 21, 10, 561, 1, 1, 458758962, 'Pallet', 300),
(562, 21, 10, 562, 1, 1, 458758962, 'Pallet', 300),
(563, 21, 10, 563, 1, 1, 458758962, 'Pallet', 300),
(564, 21, 10, 564, 1, 1, 458758962, 'Pallet', 300),
(565, 21, 10, 565, 1, 1, 458758962, 'Pallet', 300),
(566, 21, 10, 566, 1, 1, 458758962, 'Pallet', 300),
(567, 21, 10, 567, 1, 1, 458758962, 'Pallet', 300),
(568, 21, 10, 568, 1, 1, 458758962, 'Pallet', 300),
(569, 21, 10, 569, 1, 1, 458758962, 'Pallet', 300),
(570, 21, 10, 570, 1, 1, 458758962, 'Pallet', 300),
(571, 21, 10, 571, 1, 1, 458758962, 'Pallet', 300),
(572, 21, 10, 572, 1, 1, 458758962, 'Pallet', 300),
(573, 21, 10, 573, 1, 1, 458758962, 'Pallet', 300),
(574, 21, 10, 574, 1, 1, 458758962, 'Pallet', 300),
(575, 21, 10, 575, 1, 1, 458758962, 'Pallet', 300),
(576, 21, 10, 576, 1, 1, 458758962, 'Pallet', 300),
(577, 21, 10, 577, 1, 1, 458758962, 'Pallet', 300),
(578, 21, 10, 578, 1, 1, 458758962, 'Pallet', 300),
(579, 21, 10, 579, 1, 1, 458758962, 'Pallet', 300),
(580, 21, 10, 580, 1, 1, 458758962, 'Pallet', 300),
(581, 21, 10, 581, 1, 1, 458758962, 'Pallet', 300),
(582, 21, 10, 582, 1, 1, 458758962, 'Pallet', 300),
(583, 21, 10, 583, 1, 1, 458758962, 'Pallet', 300),
(584, 21, 10, 584, 1, 1, 458758962, 'Pallet', 300),
(585, 21, 10, 585, 1, 1, 458758962, 'Pallet', 300),
(586, 21, 10, 586, 1, 1, 458758962, 'Pallet', 300),
(587, 21, 10, 587, 1, 1, 458758962, 'Pallet', 300),
(588, 21, 10, 588, 1, 1, 458758962, 'Pallet', 300),
(589, 21, 10, 589, 1, 1, 458758962, 'Pallet', 300),
(590, 21, 10, 590, 1, 1, 458758962, 'Pallet', 300),
(591, 21, 10, 591, 1, 1, 458758962, 'Pallet', 300),
(592, 21, 10, 592, 1, 1, 458758962, 'Pallet', 300),
(593, 21, 10, 593, 1, 1, 458758962, 'Pallet', 300),
(594, 21, 10, 594, 1, 1, 458758962, 'Pallet', 300),
(595, 21, 10, 595, 1, 1, 458758962, 'Pallet', 300),
(596, 21, 10, 596, 1, 1, 458758962, 'Pallet', 300),
(597, 21, 10, 597, 1, 1, 458758962, 'Pallet', 300),
(598, 21, 10, 598, 1, 1, 458758962, 'Pallet', 300),
(599, 21, 10, 599, 1, 1, 458758962, 'Pallet', 300),
(600, 21, 10, 600, 1, 1, 458758962, 'Pallet', 300),
(601, 21, 10, 601, 1, 1, 458758962, 'Pallet', 300),
(602, 21, 10, 602, 1, 1, 458758962, 'Pallet', 300),
(603, 21, 10, 603, 1, 1, 458758962, 'Pallet', 300),
(604, 21, 10, 604, 1, 1, 458758962, 'Pallet', 300),
(605, 21, 10, 605, 1, 1, 458758962, 'Pallet', 300),
(606, 21, 10, 606, 1, 1, 458758962, 'Pallet', 300),
(607, 21, 10, 607, 1, 1, 458758962, 'Pallet', 300),
(608, 21, 10, 608, 1, 1, 458758962, 'Pallet', 300),
(609, 21, 10, 609, 1, 1, 458758962, 'Pallet', 300),
(610, 21, 10, 610, 1, 1, 458758962, 'Pallet', 300),
(611, 21, 10, 611, 1, 1, 458758962, 'Pallet', 300),
(612, 21, 10, 612, 1, 1, 458758962, 'Pallet', 300),
(613, 21, 10, 613, 1, 1, 458758962, 'Pallet', 300),
(614, 21, 10, 614, 1, 1, 458758962, 'Pallet', 300),
(615, 21, 10, 615, 1, 1, 458758962, 'Pallet', 300),
(616, 21, 10, 616, 1, 1, 458758962, 'Pallet', 300),
(617, 21, 10, 617, 1, 1, 458758962, 'Pallet', 300),
(618, 21, 10, 618, 1, 1, 458758962, 'Pallet', 300),
(619, 21, 10, 619, 1, 1, 458758962, 'Pallet', 300),
(620, 21, 10, 620, 1, 1, 458758962, 'Pallet', 300),
(621, 21, 10, 621, 1, 1, 458758962, 'Pallet', 300),
(622, 21, 10, 622, 1, 1, 458758962, 'Pallet', 300),
(623, 21, 10, 623, 1, 1, 458758962, 'Pallet', 300),
(624, 21, 10, 624, 1, 1, 458758962, 'Pallet', 300),
(625, 21, 10, 625, 1, 1, 458758962, 'Pallet', 300),
(626, 21, 10, 626, 1, 1, 458758962, 'Pallet', 300),
(627, 21, 10, 627, 1, 1, 458758962, 'Pallet', 300),
(628, 21, 10, 628, 1, 1, 458758962, 'Pallet', 300),
(629, 21, 10, 629, 1, 1, 458758962, 'Pallet', 300),
(630, 21, 10, 630, 1, 1, 458758962, 'Pallet', 300),
(631, 21, 10, 631, 1, 1, 458758962, 'Pallet', 300),
(632, 21, 10, 632, 1, 1, 458758962, 'Pallet', 300),
(633, 21, 10, 633, 1, 1, 458758962, 'Pallet', 300),
(634, 21, 10, 634, 1, 1, 458758962, 'Pallet', 300),
(635, 21, 10, 635, 1, 1, 458758962, 'Pallet', 300),
(636, 21, 10, 636, 1, 1, 458758962, 'Pallet', 300),
(637, 21, 10, 637, 1, 1, 458758962, 'Pallet', 300),
(638, 21, 10, 638, 1, 1, 458758962, 'Pallet', 300),
(639, 21, 10, 639, 1, 1, 458758962, 'Pallet', 300),
(640, 21, 10, 640, 1, 1, 458758962, 'Pallet', 300),
(641, 21, 10, 641, 1, 1, 458758962, 'Pallet', 300),
(642, 21, 10, 642, 1, 1, 458758962, 'Pallet', 300),
(643, 21, 10, 643, 1, 1, 458758962, 'Pallet', 300),
(644, 21, 10, 644, 1, 1, 458758962, 'Pallet', 300),
(645, 21, 10, 645, 1, 1, 458758962, 'Pallet', 300),
(646, 21, 10, 646, 1, 1, 458758962, 'Pallet', 300),
(647, 21, 10, 647, 1, 1, 458758962, 'Pallet', 300),
(648, 21, 10, 648, 1, 1, 458758962, 'Pallet', 300),
(649, 21, 10, 649, 1, 1, 458758962, 'Pallet', 300),
(650, 21, 10, 650, 1, 1, 458758962, 'Pallet', 300),
(651, 21, 10, 651, 1, 1, 458758962, 'Pallet', 300),
(652, 21, 10, 652, 1, 1, 458758962, 'Pallet', 300),
(653, 21, 10, 653, 1, 1, 458758962, 'Pallet', 300),
(654, 21, 10, 654, 1, 1, 458758962, 'Pallet', 300),
(655, 21, 10, 655, 1, 1, 458758962, 'Pallet', 300),
(656, 21, 10, 656, 1, 1, 458758962, 'Pallet', 300),
(657, 21, 10, 657, 1, 1, 458758962, 'Pallet', 300),
(658, 21, 10, 658, 1, 1, 458758962, 'Pallet', 300),
(659, 21, 10, 659, 1, 1, 458758962, 'Pallet', 300),
(660, 21, 10, 660, 1, 1, 458758962, 'Pallet', 300),
(661, 21, 10, 661, 1, 1, 458758962, 'Pallet', 300),
(662, 21, 10, 662, 1, 1, 458758962, 'Pallet', 300),
(663, 21, 10, 663, 1, 1, 458758962, 'Pallet', 300),
(664, 21, 10, 664, 1, 1, 458758962, 'Pallet', 300),
(665, 21, 10, 665, 1, 1, 458758962, 'Pallet', 300),
(666, 21, 10, 666, 1, 1, 458758962, 'Pallet', 300),
(667, 21, 10, 667, 1, 1, 458758962, 'Pallet', 300),
(668, 21, 10, 668, 1, 1, 458758962, 'Pallet', 300),
(669, 21, 10, 669, 1, 1, 458758962, 'Pallet', 300),
(670, 21, 10, 670, 1, 1, 458758962, 'Pallet', 300),
(671, 21, 10, 671, 1, 1, 458758962, 'Pallet', 300),
(672, 21, 10, 672, 1, 1, 458758962, 'Pallet', 300),
(673, 21, 10, 673, 1, 1, 458758962, 'Pallet', 300),
(674, 21, 10, 674, 1, 1, 458758962, 'Pallet', 300),
(675, 21, 10, 675, 1, 1, 458758962, 'Pallet', 300),
(676, 21, 10, 676, 1, 1, 458758962, 'Pallet', 300),
(677, 21, 10, 677, 1, 1, 458758962, 'Pallet', 300),
(678, 21, 10, 678, 1, 1, 458758962, 'Pallet', 300),
(679, 21, 10, 679, 1, 1, 458758962, 'Pallet', 300),
(680, 21, 10, 680, 1, 1, 458758962, 'Pallet', 300),
(681, 21, 10, 681, 1, 1, 458758962, 'Pallet', 300),
(682, 21, 10, 682, 1, 1, 458758962, 'Pallet', 300),
(683, 21, 10, 683, 1, 1, 458758962, 'Pallet', 300),
(684, 21, 10, 684, 1, 1, 458758962, 'Pallet', 300),
(685, 21, 10, 685, 1, 1, 458758962, 'Pallet', 300),
(686, 21, 10, 686, 1, 1, 458758962, 'Pallet', 300),
(687, 21, 10, 687, 1, 1, 458758962, 'Pallet', 300),
(688, 21, 10, 688, 1, 1, 458758962, 'Pallet', 300),
(689, 21, 10, 689, 1, 1, 458758962, 'Pallet', 300),
(690, 21, 10, 690, 1, 1, 458758962, 'Pallet', 300),
(691, 21, 10, 691, 1, 1, 458758962, 'Pallet', 300),
(692, 21, 10, 692, 1, 1, 458758962, 'Pallet', 300),
(693, 21, 10, 693, 1, 1, 458758962, 'Pallet', 300),
(694, 21, 10, 694, 1, 1, 458758962, 'Pallet', 300),
(695, 21, 10, 695, 1, 1, 458758962, 'Pallet', 300),
(696, 21, 10, 696, 1, 1, 458758962, 'Pallet', 300),
(697, 21, 10, 697, 1, 1, 458758962, 'Pallet', 300),
(698, 21, 10, 698, 1, 1, 458758962, 'Pallet', 300),
(699, 21, 10, 699, 1, 1, 458758962, 'Pallet', 300),
(700, 21, 10, 700, 1, 1, 458758962, 'Pallet', 300),
(701, 21, 10, 701, 1, 1, 458758962, 'Pallet', 300),
(702, 21, 10, 702, 1, 1, 458758962, 'Pallet', 300),
(703, 21, 10, 703, 1, 1, 458758962, 'Pallet', 300),
(704, 21, 10, 704, 1, 1, 458758962, 'Pallet', 300),
(705, 21, 10, 705, 1, 1, 458758962, 'Pallet', 300),
(706, 21, 10, 706, 1, 1, 458758962, 'Pallet', 300),
(707, 21, 10, 707, 1, 1, 458758962, 'Pallet', 300),
(708, 21, 10, 708, 1, 1, 458758962, 'Pallet', 300),
(709, 21, 10, 709, 1, 1, 458758962, 'Pallet', 300),
(710, 21, 10, 710, 1, 1, 458758962, 'Pallet', 300),
(711, 21, 10, 711, 1, 1, 458758962, 'Pallet', 300),
(712, 21, 10, 712, 1, 1, 458758962, 'Pallet', 300),
(713, 21, 10, 713, 1, 1, 458758962, 'Pallet', 300),
(714, 21, 10, 714, 1, 1, 458758962, 'Pallet', 300),
(715, 21, 10, 715, 1, 1, 458758962, 'Pallet', 300),
(716, 21, 10, 716, 1, 1, 458758962, 'Pallet', 300),
(717, 21, 10, 717, 1, 1, 458758962, 'Pallet', 300),
(718, 21, 10, 718, 1, 1, 458758962, 'Pallet', 300),
(719, 21, 10, 719, 1, 1, 458758962, 'Pallet', 300),
(720, 21, 10, 720, 1, 1, 458758962, 'Pallet', 300),
(721, 21, 10, 721, 1, 1, 458758962, 'Pallet', 300),
(722, 21, 10, 722, 1, 1, 458758962, 'Pallet', 300),
(723, 21, 10, 723, 1, 1, 458758962, 'Pallet', 300),
(724, 21, 10, 724, 1, 1, 458758962, 'Pallet', 300),
(725, 21, 10, 725, 1, 1, 458758962, 'Pallet', 300),
(726, 21, 10, 726, 1, 1, 458758962, 'Pallet', 300),
(727, 21, 10, 727, 1, 1, 458758962, 'Pallet', 300),
(728, 21, 10, 728, 1, 1, 458758962, 'Pallet', 300),
(729, 21, 10, 729, 1, 1, 458758962, 'Pallet', 300),
(730, 21, 10, 730, 1, 1, 458758962, 'Pallet', 300),
(731, 21, 10, 731, 1, 1, 458758962, 'Pallet', 300),
(732, 21, 10, 732, 1, 1, 458758962, 'Pallet', 300),
(733, 21, 10, 733, 1, 1, 458758962, 'Pallet', 300),
(734, 21, 10, 734, 1, 1, 458758962, 'Pallet', 300),
(735, 21, 10, 735, 1, 1, 458758962, 'Pallet', 300),
(736, 21, 10, 736, 1, 1, 458758962, 'Pallet', 300),
(737, 21, 10, 737, 1, 1, 458758962, 'Pallet', 300),
(738, 21, 10, 738, 1, 1, 458758962, 'Pallet', 300),
(739, 21, 10, 739, 1, 1, 458758962, 'Pallet', 300),
(740, 21, 10, 740, 1, 1, 458758962, 'Pallet', 300),
(741, 21, 10, 741, 1, 1, 458758962, 'Pallet', 300),
(742, 21, 10, 742, 1, 1, 458758962, 'Pallet', 300),
(743, 21, 10, 743, 1, 1, 458758962, 'Pallet', 300),
(744, 21, 10, 744, 1, 1, 458758962, 'Pallet', 300),
(745, 21, 10, 745, 1, 1, 458758962, 'Pallet', 300),
(746, 21, 10, 746, 1, 1, 458758962, 'Pallet', 300),
(747, 21, 10, 747, 1, 1, 458758962, 'Pallet', 300),
(748, 21, 10, 748, 1, 1, 458758962, 'Pallet', 300),
(749, 21, 10, 749, 1, 1, 458758962, 'Pallet', 300),
(750, 21, 10, 750, 1, 1, 458758962, 'Pallet', 300),
(751, 21, 10, 751, 1, 1, 458758962, 'Pallet', 300),
(752, 21, 10, 752, 1, 1, 458758962, 'Pallet', 300),
(753, 21, 10, 753, 1, 1, 458758962, 'Pallet', 300),
(754, 21, 10, 754, 1, 1, 458758962, 'Pallet', 300),
(755, 21, 10, 755, 1, 1, 458758962, 'Pallet', 300),
(756, 21, 10, 756, 1, 1, 458758962, 'Pallet', 300),
(757, 21, 10, 757, 1, 1, 458758962, 'Pallet', 300),
(758, 21, 10, 758, 1, 1, 458758962, 'Pallet', 300),
(759, 21, 10, 759, 1, 1, 458758962, 'Pallet', 300),
(760, 21, 10, 760, 1, 1, 458758962, 'Pallet', 300),
(761, 21, 10, 761, 1, 1, 458758962, 'Pallet', 300),
(762, 21, 10, 762, 1, 1, 458758962, 'Pallet', 300),
(763, 21, 10, 763, 1, 1, 458758962, 'Pallet', 300),
(764, 21, 10, 764, 1, 1, 458758962, 'Pallet', 300),
(765, 21, 10, 765, 1, 1, 458758962, 'Pallet', 300),
(766, 21, 10, 766, 1, 1, 458758962, 'Pallet', 300),
(767, 21, 10, 767, 1, 1, 458758962, 'Pallet', 300),
(768, 21, 10, 768, 1, 1, 458758962, 'Pallet', 300),
(769, 21, 10, 769, 1, 1, 458758962, 'Pallet', 300),
(770, 21, 10, 770, 1, 1, 458758962, 'Pallet', 300),
(771, 21, 10, 771, 1, 1, 458758962, 'Pallet', 300),
(772, 21, 10, 772, 1, 1, 458758962, 'Pallet', 300),
(773, 21, 10, 773, 1, 1, 458758962, 'Pallet', 300),
(774, 21, 10, 774, 1, 1, 458758962, 'Pallet', 300),
(775, 21, 10, 775, 1, 1, 458758962, 'Pallet', 300),
(776, 21, 10, 776, 1, 1, 458758962, 'Pallet', 300),
(777, 21, 10, 777, 1, 1, 458758962, 'Pallet', 300),
(778, 21, 10, 778, 1, 1, 458758962, 'Pallet', 300),
(779, 21, 10, 779, 1, 1, 458758962, 'Pallet', 300),
(780, 21, 10, 780, 1, 1, 458758962, 'Pallet', 300),
(781, 21, 10, 781, 1, 1, 458758962, 'Pallet', 300),
(782, 21, 10, 782, 1, 1, 458758962, 'Pallet', 300),
(783, 21, 10, 783, 1, 1, 458758962, 'Pallet', 300),
(784, 21, 10, 784, 1, 1, 458758962, 'Pallet', 300),
(785, 21, 10, 785, 1, 1, 458758962, 'Pallet', 300),
(786, 21, 10, 786, 1, 1, 458758962, 'Pallet', 300),
(787, 21, 10, 787, 1, 1, 458758962, 'Pallet', 300),
(788, 21, 10, 788, 1, 1, 458758962, 'Pallet', 300),
(789, 21, 10, 789, 1, 1, 458758962, 'Pallet', 300),
(790, 21, 10, 790, 1, 1, 458758962, 'Pallet', 300),
(791, 21, 10, 791, 1, 1, 458758962, 'Pallet', 300),
(792, 21, 10, 792, 1, 1, 458758962, 'Pallet', 300),
(793, 21, 10, 793, 1, 1, 458758962, 'Pallet', 300),
(794, 21, 10, 794, 1, 1, 458758962, 'Pallet', 300),
(795, 21, 10, 795, 1, 1, 458758962, 'Pallet', 300),
(796, 21, 10, 796, 1, 1, 458758962, 'Pallet', 300),
(797, 21, 10, 797, 1, 1, 458758962, 'Pallet', 300),
(798, 21, 10, 798, 1, 1, 458758962, 'Pallet', 300),
(799, 21, 10, 799, 1, 1, 458758962, 'Pallet', 300),
(800, 21, 10, 800, 1, 1, 458758962, 'Pallet', 300),
(801, 21, 10, 801, 1, 1, 458758962, 'Pallet', 300),
(802, 21, 10, 802, 1, 1, 458758962, 'Pallet', 300),
(803, 21, 10, 803, 1, 1, 458758962, 'Pallet', 300),
(804, 21, 10, 804, 1, 1, 458758962, 'Pallet', 300),
(805, 21, 10, 805, 1, 1, 458758962, 'Pallet', 300),
(806, 21, 10, 806, 1, 1, 458758962, 'Pallet', 300),
(807, 21, 10, 807, 1, 1, 458758962, 'Pallet', 300),
(808, 21, 10, 808, 1, 1, 458758962, 'Pallet', 300),
(809, 21, 10, 809, 1, 1, 458758962, 'Pallet', 300),
(810, 21, 10, 810, 1, 1, 458758962, 'Pallet', 300),
(811, 21, 10, 811, 1, 1, 458758962, 'Pallet', 300),
(812, 21, 10, 812, 1, 1, 458758962, 'Pallet', 300),
(813, 21, 10, 813, 1, 1, 458758962, 'Pallet', 300),
(814, 21, 10, 814, 1, 1, 458758962, 'Pallet', 300),
(815, 21, 10, 815, 1, 1, 458758962, 'Pallet', 300),
(816, 21, 10, 816, 1, 1, 458758962, 'Pallet', 300),
(817, 21, 10, 817, 1, 1, 458758962, 'Pallet', 300),
(818, 21, 10, 818, 1, 1, 458758962, 'Pallet', 300),
(819, 21, 10, 819, 1, 1, 458758962, 'Pallet', 300),
(820, 21, 10, 820, 1, 1, 458758962, 'Pallet', 300),
(821, 21, 10, 821, 1, 1, 458758962, 'Pallet', 300),
(822, 21, 10, 822, 1, 1, 458758962, 'Pallet', 300),
(823, 21, 10, 823, 1, 1, 458758962, 'Pallet', 300),
(824, 21, 10, 824, 1, 1, 458758962, 'Pallet', 300),
(825, 21, 10, 825, 1, 1, 458758962, 'Pallet', 300),
(826, 21, 10, 826, 1, 1, 458758962, 'Pallet', 300),
(827, 21, 10, 827, 1, 1, 458758962, 'Pallet', 300),
(828, 21, 10, 828, 1, 1, 458758962, 'Pallet', 300),
(829, 21, 10, 829, 1, 1, 458758962, 'Pallet', 300),
(830, 21, 10, 830, 1, 1, 458758962, 'Pallet', 300),
(831, 21, 10, 831, 1, 1, 458758962, 'Pallet', 300),
(832, 21, 10, 832, 1, 1, 458758962, 'Pallet', 300),
(833, 21, 10, 833, 1, 1, 458758962, 'Pallet', 300),
(834, 21, 10, 834, 1, 1, 458758962, 'Pallet', 300),
(835, 21, 10, 835, 1, 1, 458758962, 'Pallet', 300),
(836, 21, 10, 836, 1, 1, 458758962, 'Pallet', 300),
(837, 21, 10, 837, 1, 1, 458758962, 'Pallet', 300),
(838, 21, 10, 838, 1, 1, 458758962, 'Pallet', 300),
(839, 21, 10, 839, 1, 1, 458758962, 'Pallet', 300),
(840, 21, 10, 840, 1, 1, 458758962, 'Pallet', 300),
(841, 21, 10, 841, 1, 1, 458758962, 'Pallet', 300),
(842, 21, 10, 842, 1, 1, 458758962, 'Pallet', 300),
(843, 21, 10, 843, 1, 1, 458758962, 'Pallet', 300),
(844, 21, 10, 844, 1, 1, 458758962, 'Pallet', 300),
(845, 21, 10, 845, 1, 1, 458758962, 'Pallet', 300),
(846, 21, 10, 846, 1, 1, 458758962, 'Pallet', 300),
(847, 21, 10, 847, 1, 1, 458758962, 'Pallet', 300),
(848, 21, 10, 848, 1, 1, 458758962, 'Pallet', 300),
(849, 21, 10, 849, 1, 1, 458758962, 'Pallet', 300),
(850, 21, 10, 850, 1, 1, 458758962, 'Pallet', 300),
(851, 21, 10, 851, 1, 1, 458758962, 'Pallet', 300),
(852, 21, 10, 852, 1, 1, 458758962, 'Pallet', 300),
(853, 21, 10, 853, 1, 1, 458758962, 'Pallet', 300),
(854, 21, 10, 854, 1, 1, 458758962, 'Pallet', 300),
(855, 21, 10, 855, 1, 1, 458758962, 'Pallet', 300),
(856, 21, 10, 856, 1, 1, 458758962, 'Pallet', 300),
(857, 21, 10, 857, 1, 1, 458758962, 'Pallet', 300),
(858, 21, 10, 858, 1, 1, 458758962, 'Pallet', 300),
(859, 21, 10, 859, 1, 1, 458758962, 'Pallet', 300),
(860, 21, 10, 860, 1, 1, 458758962, 'Pallet', 300),
(861, 21, 10, 861, 1, 1, 458758962, 'Pallet', 300),
(862, 21, 10, 862, 1, 1, 458758962, 'Pallet', 300),
(863, 21, 10, 863, 1, 1, 458758962, 'Pallet', 300),
(864, 21, 10, 864, 1, 1, 458758962, 'Pallet', 300),
(865, 21, 10, 865, 1, 1, 458758962, 'Pallet', 300),
(866, 21, 10, 866, 1, 1, 458758962, 'Pallet', 300),
(867, 21, 10, 867, 1, 1, 458758962, 'Pallet', 300),
(868, 21, 10, 868, 1, 1, 458758962, 'Pallet', 300),
(869, 21, 10, 869, 1, 1, 458758962, 'Pallet', 300),
(870, 21, 10, 870, 1, 1, 458758962, 'Pallet', 300),
(871, 21, 10, 871, 1, 1, 458758962, 'Pallet', 300),
(872, 21, 10, 872, 1, 1, 458758962, 'Pallet', 300),
(873, 21, 10, 873, 1, 1, 458758962, 'Pallet', 300),
(874, 21, 10, 874, 1, 1, 458758962, 'Pallet', 300),
(875, 21, 10, 875, 1, 1, 458758962, 'Pallet', 300),
(876, 21, 10, 876, 1, 1, 458758962, 'Pallet', 300),
(877, 21, 10, 877, 1, 1, 458758962, 'Pallet', 300),
(878, 21, 10, 878, 1, 1, 458758962, 'Pallet', 300),
(879, 21, 10, 879, 1, 1, 458758962, 'Pallet', 300),
(880, 21, 10, 880, 1, 1, 458758962, 'Pallet', 300),
(881, 21, 10, 881, 1, 1, 458758962, 'Pallet', 300),
(882, 21, 10, 882, 1, 1, 458758962, 'Pallet', 300),
(883, 21, 10, 883, 1, 1, 458758962, 'Pallet', 300),
(884, 21, 10, 884, 1, 1, 458758962, 'Pallet', 300),
(885, 21, 10, 885, 1, 1, 458758962, 'Pallet', 300),
(886, 21, 10, 886, 1, 1, 458758962, 'Pallet', 300),
(887, 21, 10, 887, 1, 1, 458758962, 'Pallet', 300),
(888, 21, 10, 888, 1, 1, 458758962, 'Pallet', 300),
(889, 21, 10, 889, 1, 1, 458758962, 'Pallet', 300),
(890, 21, 10, 890, 1, 1, 458758962, 'Pallet', 300),
(891, 21, 10, 891, 1, 1, 458758962, 'Pallet', 300),
(892, 21, 10, 892, 1, 1, 458758962, 'Pallet', 300),
(893, 21, 10, 893, 1, 1, 458758962, 'Pallet', 300),
(894, 21, 10, 894, 1, 1, 458758962, 'Pallet', 300),
(895, 21, 10, 895, 1, 1, 458758962, 'Pallet', 300),
(896, 21, 10, 896, 1, 1, 458758962, 'Pallet', 300),
(897, 21, 10, 897, 1, 1, 458758962, 'Pallet', 300),
(898, 21, 10, 898, 1, 1, 458758962, 'Pallet', 300),
(899, 21, 10, 899, 1, 1, 458758962, 'Pallet', 300),
(900, 21, 10, 900, 1, 1, 458758962, 'Pallet', 300),
(901, 21, 10, 901, 1, 1, 458758962, 'Pallet', 300),
(902, 21, 10, 902, 1, 1, 458758962, 'Pallet', 300),
(903, 21, 10, 903, 1, 1, 458758962, 'Pallet', 300),
(904, 21, 10, 904, 1, 1, 458758962, 'Pallet', 300),
(905, 21, 10, 905, 1, 1, 458758962, 'Pallet', 300),
(906, 21, 10, 906, 1, 1, 458758962, 'Pallet', 300),
(907, 21, 10, 907, 1, 1, 458758962, 'Pallet', 300),
(908, 21, 10, 908, 1, 1, 458758962, 'Pallet', 300),
(909, 21, 10, 909, 1, 1, 458758962, 'Pallet', 300),
(910, 21, 10, 910, 1, 1, 458758962, 'Pallet', 300),
(911, 21, 10, 911, 1, 1, 458758962, 'Pallet', 300),
(912, 21, 10, 912, 1, 1, 458758962, 'Pallet', 300),
(913, 21, 10, 913, 1, 1, 458758962, 'Pallet', 300),
(914, 21, 10, 914, 1, 1, 458758962, 'Pallet', 300),
(915, 21, 10, 915, 1, 1, 458758962, 'Pallet', 300),
(916, 21, 10, 916, 1, 1, 458758962, 'Pallet', 300),
(917, 21, 10, 917, 1, 1, 458758962, 'Pallet', 300),
(918, 21, 10, 918, 1, 1, 458758962, 'Pallet', 300),
(919, 21, 10, 919, 1, 1, 458758962, 'Pallet', 300),
(920, 21, 10, 920, 1, 1, 458758962, 'Pallet', 300),
(921, 21, 10, 921, 1, 1, 458758962, 'Pallet', 300),
(922, 21, 10, 922, 1, 1, 458758962, 'Pallet', 300),
(923, 21, 10, 923, 1, 1, 458758962, 'Pallet', 300),
(924, 21, 10, 924, 1, 1, 458758962, 'Pallet', 300),
(925, 21, 10, 925, 1, 1, 458758962, 'Pallet', 300),
(926, 21, 10, 926, 1, 1, 458758962, 'Pallet', 300),
(927, 21, 10, 927, 1, 1, 458758962, 'Pallet', 300),
(928, 21, 10, 928, 1, 1, 458758962, 'Pallet', 300),
(929, 21, 10, 929, 1, 1, 458758962, 'Pallet', 300),
(930, 21, 10, 930, 1, 1, 458758962, 'Pallet', 300),
(931, 21, 10, 931, 1, 1, 458758962, 'Pallet', 300),
(932, 21, 10, 932, 1, 1, 458758962, 'Pallet', 300),
(933, 21, 10, 933, 1, 1, 458758962, 'Pallet', 300),
(934, 21, 10, 934, 1, 1, 458758962, 'Pallet', 300),
(935, 21, 10, 935, 1, 1, 458758962, 'Pallet', 300),
(936, 21, 10, 936, 1, 1, 458758962, 'Pallet', 300),
(937, 21, 10, 937, 1, 1, 458758962, 'Pallet', 300),
(938, 21, 10, 938, 1, 1, 458758962, 'Pallet', 300),
(939, 21, 10, 939, 1, 1, 458758962, 'Pallet', 300),
(940, 21, 10, 940, 1, 1, 458758962, 'Pallet', 300),
(941, 21, 10, 941, 1, 1, 458758962, 'Pallet', 300),
(942, 21, 10, 942, 1, 1, 458758962, 'Pallet', 300),
(943, 21, 10, 943, 1, 1, 458758962, 'Pallet', 300),
(944, 21, 10, 944, 1, 1, 458758962, 'Pallet', 300),
(945, 21, 10, 945, 1, 1, 458758962, 'Pallet', 300),
(946, 21, 10, 946, 1, 1, 458758962, 'Pallet', 300),
(947, 21, 10, 947, 1, 1, 458758962, 'Pallet', 300),
(948, 21, 10, 948, 1, 1, 458758962, 'Pallet', 300),
(949, 21, 10, 949, 1, 1, 458758962, 'Pallet', 300),
(950, 21, 10, 950, 1, 1, 458758962, 'Pallet', 300),
(951, 21, 10, 951, 1, 1, 458758962, 'Pallet', 300),
(952, 21, 10, 952, 1, 1, 458758962, 'Pallet', 300),
(953, 21, 10, 953, 1, 1, 458758962, 'Pallet', 300),
(954, 21, 10, 954, 1, 1, 458758962, 'Pallet', 300),
(955, 21, 10, 955, 1, 1, 458758962, 'Pallet', 300),
(956, 21, 10, 956, 1, 1, 458758962, 'Pallet', 300),
(957, 21, 10, 957, 1, 1, 458758962, 'Pallet', 300),
(958, 21, 10, 958, 1, 1, 458758962, 'Pallet', 300),
(959, 21, 10, 959, 1, 1, 458758962, 'Pallet', 300),
(960, 21, 10, 960, 1, 1, 458758962, 'Pallet', 300),
(961, 21, 10, 961, 1, 1, 458758962, 'Pallet', 300),
(962, 21, 10, 962, 1, 1, 458758962, 'Pallet', 300),
(963, 21, 10, 963, 1, 1, 458758962, 'Pallet', 300),
(964, 21, 10, 964, 1, 1, 458758962, 'Pallet', 300),
(965, 21, 10, 965, 1, 1, 458758962, 'Pallet', 300),
(966, 21, 10, 966, 1, 1, 458758962, 'Pallet', 300),
(967, 21, 10, 967, 1, 1, 458758962, 'Pallet', 300),
(968, 21, 10, 968, 1, 1, 458758962, 'Pallet', 300),
(969, 21, 10, 969, 1, 1, 458758962, 'Pallet', 300),
(970, 21, 10, 970, 1, 1, 458758962, 'Pallet', 300),
(971, 21, 10, 971, 1, 1, 458758962, 'Pallet', 300),
(972, 21, 10, 972, 1, 1, 458758962, 'Pallet', 300),
(973, 21, 10, 973, 1, 1, 458758962, 'Pallet', 300),
(974, 21, 10, 974, 1, 1, 458758962, 'Pallet', 300),
(975, 21, 10, 975, 1, 1, 458758962, 'Pallet', 300),
(976, 21, 10, 976, 1, 1, 458758962, 'Pallet', 300),
(977, 21, 10, 977, 1, 1, 458758962, 'Pallet', 300),
(978, 21, 10, 978, 1, 1, 458758962, 'Pallet', 300),
(979, 21, 10, 979, 1, 1, 458758962, 'Pallet', 300),
(980, 21, 10, 980, 1, 1, 458758962, 'Pallet', 300),
(981, 21, 10, 981, 1, 1, 458758962, 'Pallet', 300),
(982, 21, 10, 982, 1, 1, 458758962, 'Pallet', 300),
(983, 21, 10, 983, 1, 1, 458758962, 'Pallet', 300),
(984, 21, 10, 984, 1, 1, 458758962, 'Pallet', 300),
(985, 21, 10, 985, 1, 1, 458758962, 'Pallet', 300),
(986, 21, 10, 986, 1, 1, 458758962, 'Pallet', 300),
(987, 21, 10, 987, 1, 1, 458758962, 'Pallet', 300),
(988, 21, 10, 988, 1, 1, 458758962, 'Pallet', 300),
(989, 21, 10, 989, 1, 1, 458758962, 'Pallet', 300),
(990, 21, 10, 990, 1, 1, 458758962, 'Pallet', 300),
(991, 21, 10, 991, 1, 1, 458758962, 'Pallet', 300),
(992, 21, 10, 992, 1, 1, 458758962, 'Pallet', 300),
(993, 21, 10, 993, 1, 1, 458758962, 'Pallet', 300),
(994, 21, 10, 994, 1, 1, 458758962, 'Pallet', 300),
(995, 21, 10, 995, 1, 1, 458758962, 'Pallet', 300),
(996, 21, 10, 996, 1, 1, 458758962, 'Pallet', 300),
(997, 21, 10, 997, 1, 1, 458758962, 'Pallet', 300),
(998, 21, 10, 998, 1, 1, 458758962, 'Pallet', 300),
(999, 21, 10, 999, 1, 1, 458758962, 'Pallet', 300),
(1000, 21, 10, 1000, 1, 1, 458758962, 'Pallet', 300),
(1001, 21, 10, 1001, 1, 1, 458758962, 'Pallet', 300),
(1002, 21, 10, 1002, 1, 1, 458758962, 'Pallet', 300),
(1003, 21, 10, 1003, 1, 1, 458758962, 'Pallet', 300),
(1004, 21, 10, 1004, 1, 1, 458758962, 'Pallet', 300),
(1005, 21, 10, 1005, 1, 1, 458758962, 'Pallet', 300),
(1006, 21, 10, 1006, 1, 1, 458758962, 'Pallet', 300),
(1007, 21, 10, 1007, 1, 1, 458758962, 'Pallet', 300),
(1008, 21, 10, 1008, 1, 1, 458758962, 'Pallet', 300),
(1009, 21, 10, 1009, 1, 1, 458758962, 'Pallet', 300),
(1010, 21, 10, 1010, 1, 1, 458758962, 'Pallet', 300),
(1011, 21, 10, 1011, 1, 1, 458758962, 'Pallet', 300),
(1012, 21, 10, 1012, 1, 1, 458758962, 'Pallet', 300),
(1013, 21, 10, 1013, 1, 1, 458758962, 'Pallet', 300),
(1014, 21, 10, 1014, 1, 1, 458758962, 'Pallet', 300),
(1015, 21, 10, 1015, 1, 1, 458758962, 'Pallet', 300),
(1016, 21, 10, 1016, 1, 1, 458758962, 'Pallet', 300);
INSERT INTO `tp_package_pallet` (`id`, `lot_id`, `product_id`, `case_id`, `dimensions_id`, `pallet_images_id`, `package_pallet_sn`, `package_type`, `inner_package_count`) VALUES
(1017, 21, 10, 1017, 1, 1, 458758962, 'Pallet', 300),
(1018, 21, 10, 1018, 1, 1, 458758962, 'Pallet', 300),
(1019, 21, 10, 1019, 1, 1, 458758962, 'Pallet', 300),
(1020, 21, 10, 1020, 1, 1, 458758962, 'Pallet', 300),
(1021, 21, 10, 1021, 1, 1, 458758962, 'Pallet', 300),
(1022, 21, 10, 1022, 1, 1, 458758962, 'Pallet', 300),
(1023, 21, 10, 1023, 1, 1, 458758962, 'Pallet', 300),
(1024, 21, 10, 1024, 1, 1, 458758962, 'Pallet', 300),
(1025, 21, 10, 1025, 1, 1, 458758962, 'Pallet', 300),
(1026, 21, 10, 1026, 1, 1, 458758962, 'Pallet', 300),
(1027, 21, 10, 1027, 1, 1, 458758962, 'Pallet', 300),
(1028, 21, 10, 1028, 1, 1, 458758962, 'Pallet', 300),
(1029, 21, 10, 1029, 1, 1, 458758962, 'Pallet', 300),
(1030, 21, 10, 1030, 1, 1, 458758962, 'Pallet', 300),
(1031, 21, 10, 1031, 1, 1, 458758962, 'Pallet', 300),
(1032, 21, 10, 1032, 1, 1, 458758962, 'Pallet', 300),
(1033, 21, 10, 1033, 1, 1, 458758962, 'Pallet', 300),
(1034, 21, 10, 1034, 1, 1, 458758962, 'Pallet', 300),
(1035, 21, 10, 1035, 1, 1, 458758962, 'Pallet', 300),
(1036, 21, 10, 1036, 1, 1, 458758962, 'Pallet', 300),
(1037, 21, 10, 1037, 1, 1, 458758962, 'Pallet', 300),
(1038, 21, 10, 1038, 1, 1, 458758962, 'Pallet', 300),
(1039, 21, 10, 1039, 1, 1, 458758962, 'Pallet', 300),
(1040, 21, 10, 1040, 1, 1, 458758962, 'Pallet', 300),
(1041, 21, 10, 1041, 1, 1, 458758962, 'Pallet', 300),
(1042, 21, 10, 1042, 1, 1, 458758962, 'Pallet', 300),
(1043, 21, 10, 1043, 1, 1, 458758962, 'Pallet', 300),
(1044, 21, 10, 1044, 1, 1, 458758962, 'Pallet', 300),
(1045, 21, 10, 1045, 1, 1, 458758962, 'Pallet', 300),
(1046, 21, 10, 1046, 1, 1, 458758962, 'Pallet', 300),
(1047, 21, 10, 1047, 1, 1, 458758962, 'Pallet', 300),
(1048, 21, 10, 1048, 1, 1, 458758962, 'Pallet', 300),
(1049, 21, 10, 1049, 1, 1, 458758962, 'Pallet', 300),
(1050, 21, 10, 1050, 1, 1, 458758962, 'Pallet', 300),
(1051, 21, 10, 1051, 1, 1, 458758962, 'Pallet', 300),
(1052, 21, 10, 1052, 1, 1, 458758962, 'Pallet', 300),
(1053, 21, 10, 1053, 1, 1, 458758962, 'Pallet', 300),
(1054, 21, 10, 1054, 1, 1, 458758962, 'Pallet', 300),
(1055, 21, 10, 1055, 1, 1, 458758962, 'Pallet', 300),
(1056, 21, 10, 1056, 1, 1, 458758962, 'Pallet', 300),
(1057, 21, 10, 1057, 1, 1, 458758962, 'Pallet', 300),
(1058, 21, 10, 1058, 1, 1, 458758962, 'Pallet', 300),
(1059, 21, 10, 1059, 1, 1, 458758962, 'Pallet', 300),
(1060, 21, 10, 1060, 1, 1, 458758962, 'Pallet', 300),
(1061, 21, 10, 1061, 1, 1, 458758962, 'Pallet', 300),
(1062, 21, 10, 1062, 1, 1, 458758962, 'Pallet', 300),
(1063, 21, 10, 1063, 1, 1, 458758962, 'Pallet', 300),
(1064, 21, 10, 1064, 1, 1, 458758962, 'Pallet', 300),
(1065, 21, 10, 1065, 1, 1, 458758962, 'Pallet', 300),
(1066, 21, 10, 1066, 1, 1, 458758962, 'Pallet', 300),
(1067, 21, 10, 1067, 1, 1, 458758962, 'Pallet', 300),
(1068, 21, 10, 1068, 1, 1, 458758962, 'Pallet', 300),
(1069, 21, 10, 1069, 1, 1, 458758962, 'Pallet', 300),
(1070, 21, 10, 1070, 1, 1, 458758962, 'Pallet', 300),
(1071, 21, 10, 1071, 1, 1, 458758962, 'Pallet', 300),
(1072, 21, 10, 1072, 1, 1, 458758962, 'Pallet', 300),
(1073, 21, 10, 1073, 1, 1, 458758962, 'Pallet', 300),
(1074, 21, 10, 1074, 1, 1, 458758962, 'Pallet', 300),
(1075, 21, 10, 1075, 1, 1, 458758962, 'Pallet', 300),
(1076, 21, 10, 1076, 1, 1, 458758962, 'Pallet', 300),
(1077, 21, 10, 1077, 1, 1, 458758962, 'Pallet', 300),
(1078, 21, 10, 1078, 1, 1, 458758962, 'Pallet', 300),
(1079, 21, 10, 1079, 1, 1, 458758962, 'Pallet', 300),
(1080, 21, 10, 1080, 1, 1, 458758962, 'Pallet', 300),
(1081, 21, 10, 1081, 1, 1, 458758962, 'Pallet', 300),
(1082, 21, 10, 1082, 1, 1, 458758962, 'Pallet', 300),
(1083, 21, 10, 1083, 1, 1, 458758962, 'Pallet', 300),
(1084, 21, 10, 1084, 1, 1, 458758962, 'Pallet', 300),
(1085, 21, 10, 1085, 1, 1, 458758962, 'Pallet', 300),
(1086, 21, 10, 1086, 1, 1, 458758962, 'Pallet', 300),
(1087, 21, 10, 1087, 1, 1, 458758962, 'Pallet', 300),
(1088, 21, 10, 1088, 1, 1, 458758962, 'Pallet', 300),
(1089, 21, 10, 1089, 1, 1, 458758962, 'Pallet', 300),
(1090, 21, 10, 1090, 1, 1, 458758962, 'Pallet', 300),
(1091, 21, 10, 1091, 1, 1, 458758962, 'Pallet', 300),
(1092, 21, 10, 1092, 1, 1, 458758962, 'Pallet', 300),
(1093, 21, 10, 1093, 1, 1, 458758962, 'Pallet', 300),
(1094, 21, 10, 1094, 1, 1, 458758962, 'Pallet', 300),
(1095, 21, 10, 1095, 1, 1, 458758962, 'Pallet', 300),
(1096, 21, 10, 1096, 1, 1, 458758962, 'Pallet', 300),
(1097, 21, 10, 1097, 1, 1, 458758962, 'Pallet', 300),
(1098, 21, 10, 1098, 1, 1, 458758962, 'Pallet', 300),
(1099, 21, 10, 1099, 1, 1, 458758962, 'Pallet', 300),
(1100, 21, 10, 1100, 1, 1, 458758962, 'Pallet', 300),
(1101, 21, 10, 1101, 1, 1, 458758962, 'Pallet', 300),
(1102, 21, 10, 1102, 1, 1, 458758962, 'Pallet', 300),
(1103, 21, 10, 1103, 1, 1, 458758962, 'Pallet', 300),
(1104, 21, 10, 1104, 1, 1, 458758962, 'Pallet', 300),
(1105, 21, 10, 1105, 1, 1, 458758962, 'Pallet', 300),
(1106, 21, 10, 1106, 1, 1, 458758962, 'Pallet', 300),
(1107, 21, 10, 1107, 1, 1, 458758962, 'Pallet', 300),
(1108, 21, 10, 1108, 1, 1, 458758962, 'Pallet', 300),
(1109, 21, 10, 1109, 1, 1, 458758962, 'Pallet', 300),
(1110, 21, 10, 1110, 1, 1, 458758962, 'Pallet', 300),
(1111, 21, 10, 1111, 1, 1, 458758962, 'Pallet', 300),
(1112, 21, 10, 1112, 1, 1, 458758962, 'Pallet', 300),
(1113, 21, 10, 1113, 1, 1, 458758962, 'Pallet', 300),
(1114, 21, 10, 1114, 1, 1, 458758962, 'Pallet', 300),
(1115, 21, 10, 1115, 1, 1, 458758962, 'Pallet', 300),
(1116, 21, 10, 1116, 1, 1, 458758962, 'Pallet', 300),
(1117, 21, 10, 1117, 1, 1, 458758962, 'Pallet', 300),
(1118, 21, 10, 1118, 1, 1, 458758962, 'Pallet', 300),
(1119, 21, 10, 1119, 1, 1, 458758962, 'Pallet', 300),
(1120, 21, 10, 1120, 1, 1, 458758962, 'Pallet', 300),
(1121, 21, 10, 1121, 1, 1, 458758962, 'Pallet', 300),
(1122, 21, 10, 1122, 1, 1, 458758962, 'Pallet', 300),
(1123, 21, 10, 1123, 1, 1, 458758962, 'Pallet', 300),
(1124, 21, 10, 1124, 1, 1, 458758962, 'Pallet', 300),
(1125, 21, 10, 1125, 1, 1, 458758962, 'Pallet', 300),
(1126, 21, 10, 1126, 1, 1, 458758962, 'Pallet', 300),
(1127, 21, 10, 1127, 1, 1, 458758962, 'Pallet', 300),
(1128, 21, 10, 1128, 1, 1, 458758962, 'Pallet', 300),
(1129, 21, 10, 1129, 1, 1, 458758962, 'Pallet', 300),
(1130, 21, 10, 1130, 1, 1, 458758962, 'Pallet', 300),
(1131, 21, 10, 1131, 1, 1, 458758962, 'Pallet', 300),
(1132, 21, 10, 1132, 1, 1, 458758962, 'Pallet', 300),
(1133, 21, 10, 1133, 1, 1, 458758962, 'Pallet', 300),
(1134, 21, 10, 1134, 1, 1, 458758962, 'Pallet', 300),
(1135, 21, 10, 1135, 1, 1, 458758962, 'Pallet', 300),
(1136, 21, 10, 1136, 1, 1, 458758962, 'Pallet', 300),
(1137, 21, 10, 1137, 1, 1, 458758962, 'Pallet', 300),
(1138, 21, 10, 1138, 1, 1, 458758962, 'Pallet', 300),
(1139, 21, 10, 1139, 1, 1, 458758962, 'Pallet', 300),
(1140, 21, 10, 1140, 1, 1, 458758962, 'Pallet', 300),
(1141, 21, 10, 1141, 1, 1, 458758962, 'Pallet', 300),
(1142, 21, 10, 1142, 1, 1, 458758962, 'Pallet', 300),
(1143, 21, 10, 1143, 1, 1, 458758962, 'Pallet', 300),
(1144, 21, 10, 1144, 1, 1, 458758962, 'Pallet', 300),
(1145, 21, 10, 1145, 1, 1, 458758962, 'Pallet', 300),
(1146, 21, 10, 1146, 1, 1, 458758962, 'Pallet', 300),
(1147, 21, 10, 1147, 1, 1, 458758962, 'Pallet', 300),
(1148, 21, 10, 1148, 1, 1, 458758962, 'Pallet', 300),
(1149, 21, 10, 1149, 1, 1, 458758962, 'Pallet', 300),
(1150, 21, 10, 1150, 1, 1, 458758962, 'Pallet', 300),
(1151, 21, 10, 1151, 1, 1, 458758962, 'Pallet', 300),
(1152, 21, 10, 1152, 1, 1, 458758962, 'Pallet', 300),
(1153, 21, 10, 1153, 1, 1, 458758962, 'Pallet', 300),
(1154, 21, 10, 1154, 1, 1, 458758962, 'Pallet', 300),
(1155, 21, 10, 1155, 1, 1, 458758962, 'Pallet', 300),
(1156, 21, 10, 1156, 1, 1, 458758962, 'Pallet', 300),
(1157, 21, 10, 1157, 1, 1, 458758962, 'Pallet', 300),
(1158, 21, 10, 1158, 1, 1, 458758962, 'Pallet', 300),
(1159, 21, 10, 1159, 1, 1, 458758962, 'Pallet', 300),
(1160, 21, 10, 1160, 1, 1, 458758962, 'Pallet', 300),
(1161, 21, 10, 1161, 1, 1, 458758962, 'Pallet', 300),
(1162, 21, 10, 1162, 1, 1, 458758962, 'Pallet', 300),
(1163, 21, 10, 1163, 1, 1, 458758962, 'Pallet', 300),
(1164, 21, 10, 1164, 1, 1, 458758962, 'Pallet', 300),
(1165, 21, 10, 1165, 1, 1, 458758962, 'Pallet', 300),
(1166, 21, 10, 1166, 1, 1, 458758962, 'Pallet', 300),
(1167, 21, 10, 1167, 1, 1, 458758962, 'Pallet', 300),
(1168, 21, 10, 1168, 1, 1, 458758962, 'Pallet', 300),
(1169, 21, 10, 1169, 1, 1, 458758962, 'Pallet', 300),
(1170, 21, 10, 1170, 1, 1, 458758962, 'Pallet', 300),
(1171, 21, 10, 1171, 1, 1, 458758962, 'Pallet', 300),
(1172, 21, 10, 1172, 1, 1, 458758962, 'Pallet', 300),
(1173, 21, 10, 1173, 1, 1, 458758962, 'Pallet', 300),
(1174, 21, 10, 1174, 1, 1, 458758962, 'Pallet', 300),
(1175, 21, 10, 1175, 1, 1, 458758962, 'Pallet', 300),
(1176, 21, 10, 1176, 1, 1, 458758962, 'Pallet', 300),
(1177, 21, 10, 1177, 1, 1, 458758962, 'Pallet', 300),
(1178, 21, 10, 1178, 1, 1, 458758962, 'Pallet', 300),
(1179, 21, 10, 1179, 1, 1, 458758962, 'Pallet', 300),
(1180, 21, 10, 1180, 1, 1, 458758962, 'Pallet', 300),
(1181, 21, 10, 1181, 1, 1, 458758962, 'Pallet', 300),
(1182, 21, 10, 1182, 1, 1, 458758962, 'Pallet', 300),
(1183, 21, 10, 1183, 1, 1, 458758962, 'Pallet', 300),
(1184, 21, 10, 1184, 1, 1, 458758962, 'Pallet', 300),
(1185, 21, 10, 1185, 1, 1, 458758962, 'Pallet', 300),
(1186, 21, 10, 1186, 1, 1, 458758962, 'Pallet', 300),
(1187, 21, 10, 1187, 1, 1, 458758962, 'Pallet', 300),
(1188, 21, 10, 1188, 1, 1, 458758962, 'Pallet', 300),
(1189, 21, 10, 1189, 1, 1, 458758962, 'Pallet', 300),
(1190, 21, 10, 1190, 1, 1, 458758962, 'Pallet', 300),
(1191, 21, 10, 1191, 1, 1, 458758962, 'Pallet', 300),
(1192, 21, 10, 1192, 1, 1, 458758962, 'Pallet', 300),
(1193, 21, 10, 1193, 1, 1, 458758962, 'Pallet', 300),
(1194, 21, 10, 1194, 1, 1, 458758962, 'Pallet', 300),
(1195, 21, 10, 1195, 1, 1, 458758962, 'Pallet', 300),
(1196, 21, 10, 1196, 1, 1, 458758962, 'Pallet', 300),
(1197, 21, 10, 1197, 1, 1, 458758962, 'Pallet', 300),
(1198, 21, 10, 1198, 1, 1, 458758962, 'Pallet', 300),
(1199, 21, 10, 1199, 1, 1, 458758962, 'Pallet', 300),
(1200, 21, 10, 1200, 1, 1, 458758962, 'Pallet', 300),
(1201, 21, 10, 1201, 1, 1, 458758962, 'Pallet', 300),
(1202, 21, 10, 1202, 1, 1, 458758962, 'Pallet', 300),
(1203, 21, 10, 1203, 1, 1, 458758962, 'Pallet', 300),
(1204, 21, 10, 1204, 1, 1, 458758962, 'Pallet', 300),
(1205, 21, 10, 1205, 1, 1, 458758962, 'Pallet', 300),
(1206, 21, 10, 1206, 1, 1, 458758962, 'Pallet', 300),
(1207, 21, 10, 1207, 1, 1, 458758962, 'Pallet', 300),
(1208, 21, 10, 1208, 1, 1, 458758962, 'Pallet', 300),
(1209, 21, 10, 1209, 1, 1, 458758962, 'Pallet', 300),
(1210, 21, 10, 1210, 1, 1, 458758962, 'Pallet', 300),
(1211, 21, 10, 1211, 1, 1, 458758962, 'Pallet', 300),
(1212, 21, 10, 1212, 1, 1, 458758962, 'Pallet', 300),
(1213, 21, 10, 1213, 1, 1, 458758962, 'Pallet', 300),
(1214, 21, 10, 1214, 1, 1, 458758962, 'Pallet', 300),
(1215, 21, 10, 1215, 1, 1, 458758962, 'Pallet', 300),
(1216, 21, 10, 1216, 1, 1, 458758962, 'Pallet', 300),
(1217, 21, 10, 1217, 1, 1, 458758962, 'Pallet', 300),
(1218, 21, 10, 1218, 1, 1, 458758962, 'Pallet', 300),
(1219, 21, 10, 1219, 1, 1, 458758962, 'Pallet', 300),
(1220, 21, 10, 1220, 1, 1, 458758962, 'Pallet', 300),
(1221, 21, 10, 1221, 1, 1, 458758962, 'Pallet', 300),
(1222, 21, 10, 1222, 1, 1, 458758962, 'Pallet', 300),
(1223, 21, 10, 1223, 1, 1, 458758962, 'Pallet', 300),
(1224, 21, 10, 1224, 1, 1, 458758962, 'Pallet', 300),
(1225, 21, 10, 1225, 1, 1, 458758962, 'Pallet', 300),
(1226, 21, 10, 1226, 1, 1, 458758962, 'Pallet', 300),
(1227, 21, 10, 1227, 1, 1, 458758962, 'Pallet', 300),
(1228, 21, 10, 1228, 1, 1, 458758962, 'Pallet', 300),
(1229, 21, 10, 1229, 1, 1, 458758962, 'Pallet', 300),
(1230, 21, 10, 1230, 1, 1, 458758962, 'Pallet', 300),
(1231, 21, 10, 1231, 1, 1, 458758962, 'Pallet', 300),
(1232, 21, 10, 1232, 1, 1, 458758962, 'Pallet', 300),
(1233, 21, 10, 1233, 1, 1, 458758962, 'Pallet', 300),
(1234, 21, 10, 1234, 1, 1, 458758962, 'Pallet', 300),
(1235, 21, 10, 1235, 1, 1, 458758962, 'Pallet', 300),
(1236, 21, 10, 1236, 1, 1, 458758962, 'Pallet', 300),
(1237, 21, 10, 1237, 1, 1, 458758962, 'Pallet', 300),
(1238, 21, 10, 1238, 1, 1, 458758962, 'Pallet', 300),
(1239, 21, 10, 1239, 1, 1, 458758962, 'Pallet', 300),
(1240, 21, 10, 1240, 1, 1, 458758962, 'Pallet', 300),
(1241, 21, 10, 1241, 1, 1, 458758962, 'Pallet', 300),
(1242, 21, 10, 1242, 1, 1, 458758962, 'Pallet', 300),
(1243, 21, 10, 1243, 1, 1, 458758962, 'Pallet', 300),
(1244, 21, 10, 1244, 1, 1, 458758962, 'Pallet', 300),
(1245, 21, 10, 1245, 1, 1, 458758962, 'Pallet', 300),
(1246, 21, 10, 1246, 1, 1, 458758962, 'Pallet', 300),
(1247, 21, 10, 1247, 1, 1, 458758962, 'Pallet', 300),
(1248, 21, 10, 1248, 1, 1, 458758962, 'Pallet', 300),
(1249, 21, 10, 1249, 1, 1, 458758962, 'Pallet', 300),
(1250, 21, 10, 1250, 1, 1, 458758962, 'Pallet', 300),
(1251, 21, 10, 1251, 1, 1, 458758962, 'Pallet', 300),
(1252, 21, 10, 1252, 1, 1, 458758962, 'Pallet', 300),
(1253, 21, 10, 1253, 1, 1, 458758962, 'Pallet', 300),
(1254, 21, 10, 1254, 1, 1, 458758962, 'Pallet', 300),
(1255, 21, 10, 1255, 1, 1, 458758962, 'Pallet', 300),
(1256, 21, 10, 1256, 1, 1, 458758962, 'Pallet', 300),
(1257, 21, 10, 1257, 1, 1, 458758962, 'Pallet', 300),
(1258, 21, 10, 1258, 1, 1, 458758962, 'Pallet', 300),
(1259, 21, 10, 1259, 1, 1, 458758962, 'Pallet', 300),
(1260, 21, 10, 1260, 1, 1, 458758962, 'Pallet', 300),
(1261, 21, 10, 1261, 1, 1, 458758962, 'Pallet', 300),
(1262, 21, 10, 1262, 1, 1, 458758962, 'Pallet', 300),
(1263, 21, 10, 1263, 1, 1, 458758962, 'Pallet', 300),
(1264, 21, 10, 1264, 1, 1, 458758962, 'Pallet', 300),
(1265, 21, 10, 1265, 1, 1, 458758962, 'Pallet', 300),
(1266, 21, 10, 1266, 1, 1, 458758962, 'Pallet', 300),
(1267, 21, 10, 1267, 1, 1, 458758962, 'Pallet', 300),
(1268, 21, 10, 1268, 1, 1, 458758962, 'Pallet', 300),
(1269, 21, 10, 1269, 1, 1, 458758962, 'Pallet', 300),
(1270, 21, 10, 1270, 1, 1, 458758962, 'Pallet', 300),
(1271, 21, 10, 1271, 1, 1, 458758962, 'Pallet', 300),
(1272, 21, 10, 1272, 1, 1, 458758962, 'Pallet', 300),
(1273, 21, 10, 1273, 1, 1, 458758962, 'Pallet', 300),
(1274, 21, 10, 1274, 1, 1, 458758962, 'Pallet', 300),
(1275, 21, 10, 1275, 1, 1, 458758962, 'Pallet', 300),
(1276, 21, 10, 1276, 1, 1, 458758962, 'Pallet', 300),
(1277, 21, 10, 1277, 1, 1, 458758962, 'Pallet', 300),
(1278, 21, 10, 1278, 1, 1, 458758962, 'Pallet', 300),
(1279, 21, 10, 1279, 1, 1, 458758962, 'Pallet', 300),
(1280, 21, 10, 1280, 1, 1, 458758962, 'Pallet', 300),
(1281, 21, 10, 1281, 1, 1, 458758962, 'Pallet', 300),
(1282, 21, 10, 1282, 1, 1, 458758962, 'Pallet', 300),
(1283, 21, 10, 1283, 1, 1, 458758962, 'Pallet', 300),
(1284, 21, 10, 1284, 1, 1, 458758962, 'Pallet', 300),
(1285, 21, 10, 1285, 1, 1, 458758962, 'Pallet', 300),
(1286, 21, 10, 1286, 1, 1, 458758962, 'Pallet', 300),
(1287, 21, 10, 1287, 1, 1, 458758962, 'Pallet', 300),
(1288, 21, 10, 1288, 1, 1, 458758962, 'Pallet', 300),
(1289, 21, 10, 1289, 1, 1, 458758962, 'Pallet', 300),
(1290, 21, 10, 1290, 1, 1, 458758962, 'Pallet', 300),
(1291, 21, 10, 1291, 1, 1, 458758962, 'Pallet', 300),
(1292, 21, 10, 1292, 1, 1, 458758962, 'Pallet', 300),
(1293, 21, 10, 1293, 1, 1, 458758962, 'Pallet', 300),
(1294, 21, 10, 1294, 1, 1, 458758962, 'Pallet', 300),
(1295, 21, 10, 1295, 1, 1, 458758962, 'Pallet', 300),
(1296, 21, 10, 1296, 1, 1, 458758962, 'Pallet', 300),
(1297, 21, 10, 1297, 1, 1, 458758962, 'Pallet', 300),
(1298, 21, 10, 1298, 1, 1, 458758962, 'Pallet', 300),
(1299, 21, 10, 1299, 1, 1, 458758962, 'Pallet', 300),
(1300, 21, 10, 1300, 1, 1, 458758962, 'Pallet', 300),
(1301, 21, 10, 1301, 1, 1, 458758962, 'Pallet', 300),
(1302, 21, 10, 1302, 1, 1, 458758962, 'Pallet', 300),
(1303, 21, 10, 1303, 1, 1, 458758962, 'Pallet', 300),
(1304, 21, 10, 1304, 1, 1, 458758962, 'Pallet', 300),
(1305, 21, 10, 1305, 1, 1, 458758962, 'Pallet', 300),
(1306, 21, 10, 1306, 1, 1, 458758962, 'Pallet', 300),
(1307, 21, 10, 1307, 1, 1, 458758962, 'Pallet', 300),
(1308, 21, 10, 1308, 1, 1, 458758962, 'Pallet', 300),
(1309, 21, 10, 1309, 1, 1, 458758962, 'Pallet', 300),
(1310, 21, 10, 1310, 1, 1, 458758962, 'Pallet', 300),
(1311, 21, 10, 1311, 1, 1, 458758962, 'Pallet', 300),
(1312, 21, 10, 1312, 1, 1, 458758962, 'Pallet', 300),
(1313, 21, 10, 1313, 1, 1, 458758962, 'Pallet', 300),
(1314, 21, 10, 1314, 1, 1, 458758962, 'Pallet', 300),
(1315, 21, 10, 1315, 1, 1, 458758962, 'Pallet', 300),
(1316, 21, 10, 1316, 1, 1, 458758962, 'Pallet', 300),
(1317, 21, 10, 1317, 1, 1, 458758962, 'Pallet', 300),
(1318, 21, 10, 1318, 1, 1, 458758962, 'Pallet', 300),
(1319, 21, 10, 1319, 1, 1, 458758962, 'Pallet', 300),
(1320, 21, 10, 1320, 1, 1, 458758962, 'Pallet', 300),
(1321, 21, 10, 1321, 1, 1, 458758962, 'Pallet', 300),
(1322, 21, 10, 1322, 1, 1, 458758962, 'Pallet', 300),
(1323, 21, 10, 1323, 1, 1, 458758962, 'Pallet', 300),
(1324, 21, 10, 1324, 1, 1, 458758962, 'Pallet', 300),
(1325, 21, 10, 1325, 1, 1, 458758962, 'Pallet', 300),
(1326, 21, 10, 1326, 1, 1, 458758962, 'Pallet', 300),
(1327, 21, 10, 1327, 1, 1, 458758962, 'Pallet', 300),
(1328, 21, 10, 1328, 1, 1, 458758962, 'Pallet', 300),
(1329, 21, 10, 1329, 1, 1, 458758962, 'Pallet', 300),
(1330, 21, 10, 1330, 1, 1, 458758962, 'Pallet', 300),
(1331, 21, 10, 1331, 1, 1, 458758962, 'Pallet', 300),
(1332, 21, 10, 1332, 1, 1, 458758962, 'Pallet', 300),
(1333, 21, 10, 1333, 1, 1, 458758962, 'Pallet', 300),
(1334, 21, 10, 1334, 1, 1, 458758962, 'Pallet', 300),
(1335, 21, 10, 1335, 1, 1, 458758962, 'Pallet', 300),
(1336, 21, 10, 1336, 1, 1, 458758962, 'Pallet', 300),
(1337, 21, 10, 1337, 1, 1, 458758962, 'Pallet', 300),
(1338, 21, 10, 1338, 1, 1, 458758962, 'Pallet', 300),
(1339, 21, 10, 1339, 1, 1, 458758962, 'Pallet', 300),
(1340, 21, 10, 1340, 1, 1, 458758962, 'Pallet', 300),
(1341, 21, 10, 1341, 1, 1, 458758962, 'Pallet', 300),
(1342, 21, 10, 1342, 1, 1, 458758962, 'Pallet', 300),
(1343, 21, 10, 1343, 1, 1, 458758962, 'Pallet', 300),
(1344, 21, 10, 1344, 1, 1, 458758962, 'Pallet', 300),
(1345, 21, 10, 1345, 1, 1, 458758962, 'Pallet', 300),
(1346, 21, 10, 1346, 1, 1, 458758962, 'Pallet', 300),
(1347, 21, 10, 1347, 1, 1, 458758962, 'Pallet', 300),
(1348, 21, 10, 1348, 1, 1, 458758962, 'Pallet', 300),
(1349, 21, 10, 1349, 1, 1, 458758962, 'Pallet', 300),
(1350, 21, 10, 1350, 1, 1, 458758962, 'Pallet', 300),
(1351, 21, 10, 1351, 1, 1, 458758962, 'Pallet', 300),
(1352, 21, 10, 1352, 1, 1, 458758962, 'Pallet', 300),
(1353, 21, 10, 1353, 1, 1, 458758962, 'Pallet', 300),
(1354, 21, 10, 1354, 1, 1, 458758962, 'Pallet', 300),
(1355, 21, 10, 1355, 1, 1, 458758962, 'Pallet', 300),
(1356, 21, 10, 1356, 1, 1, 458758962, 'Pallet', 300),
(1357, 21, 10, 1357, 1, 1, 458758962, 'Pallet', 300),
(1358, 21, 10, 1358, 1, 1, 458758962, 'Pallet', 300),
(1359, 21, 10, 1359, 1, 1, 458758962, 'Pallet', 300),
(1360, 21, 10, 1360, 1, 1, 458758962, 'Pallet', 300),
(1361, 21, 10, 1361, 1, 1, 458758962, 'Pallet', 300),
(1362, 21, 10, 1362, 1, 1, 458758962, 'Pallet', 300),
(1363, 21, 10, 1363, 1, 1, 458758962, 'Pallet', 300),
(1364, 21, 10, 1364, 1, 1, 458758962, 'Pallet', 300),
(1365, 21, 10, 1365, 1, 1, 458758962, 'Pallet', 300),
(1366, 21, 10, 1366, 1, 1, 458758962, 'Pallet', 300),
(1367, 21, 10, 1367, 1, 1, 458758962, 'Pallet', 300),
(1368, 21, 10, 1368, 1, 1, 458758962, 'Pallet', 300),
(1369, 21, 10, 1369, 1, 1, 458758962, 'Pallet', 300),
(1370, 21, 10, 1370, 1, 1, 458758962, 'Pallet', 300),
(1371, 21, 10, 1371, 1, 1, 458758962, 'Pallet', 300),
(1372, 21, 10, 1372, 1, 1, 458758962, 'Pallet', 300),
(1373, 21, 10, 1373, 1, 1, 458758962, 'Pallet', 300),
(1374, 21, 10, 1374, 1, 1, 458758962, 'Pallet', 300),
(1375, 21, 10, 1375, 1, 1, 458758962, 'Pallet', 300),
(1376, 21, 10, 1376, 1, 1, 458758962, 'Pallet', 300),
(1377, 21, 10, 1377, 1, 1, 458758962, 'Pallet', 300),
(1378, 21, 10, 1378, 1, 1, 458758962, 'Pallet', 300),
(1379, 21, 10, 1379, 1, 1, 458758962, 'Pallet', 300),
(1380, 21, 10, 1380, 1, 1, 458758962, 'Pallet', 300),
(1381, 21, 10, 1381, 1, 1, 458758962, 'Pallet', 300),
(1382, 21, 10, 1382, 1, 1, 458758962, 'Pallet', 300),
(1383, 21, 10, 1383, 1, 1, 458758962, 'Pallet', 300),
(1384, 21, 10, 1384, 1, 1, 458758962, 'Pallet', 300),
(1385, 21, 10, 1385, 1, 1, 458758962, 'Pallet', 300),
(1386, 21, 10, 1386, 1, 1, 458758962, 'Pallet', 300),
(1387, 21, 10, 1387, 1, 1, 458758962, 'Pallet', 300),
(1388, 21, 10, 1388, 1, 1, 458758962, 'Pallet', 300),
(1389, 21, 10, 1389, 1, 1, 458758962, 'Pallet', 300),
(1390, 21, 10, 1390, 1, 1, 458758962, 'Pallet', 300),
(1391, 21, 10, 1391, 1, 1, 458758962, 'Pallet', 300),
(1392, 21, 10, 1392, 1, 1, 458758962, 'Pallet', 300),
(1393, 21, 10, 1393, 1, 1, 458758962, 'Pallet', 300),
(1394, 21, 10, 1394, 1, 1, 458758962, 'Pallet', 300),
(1395, 21, 10, 1395, 1, 1, 458758962, 'Pallet', 300),
(1396, 21, 10, 1396, 1, 1, 458758962, 'Pallet', 300),
(1397, 21, 10, 1397, 1, 1, 458758962, 'Pallet', 300),
(1398, 21, 10, 1398, 1, 1, 458758962, 'Pallet', 300),
(1399, 21, 10, 1399, 1, 1, 458758962, 'Pallet', 300),
(1400, 21, 10, 1400, 1, 1, 458758962, 'Pallet', 300),
(1401, 21, 10, 1401, 1, 1, 458758962, 'Pallet', 300),
(1402, 21, 10, 1402, 1, 1, 458758962, 'Pallet', 300),
(1403, 21, 10, 1403, 1, 1, 458758962, 'Pallet', 300),
(1404, 21, 10, 1404, 1, 1, 458758962, 'Pallet', 300),
(1405, 21, 10, 1405, 1, 1, 458758962, 'Pallet', 300),
(1406, 21, 10, 1406, 1, 1, 458758962, 'Pallet', 300),
(1407, 21, 10, 1407, 1, 1, 458758962, 'Pallet', 300),
(1408, 21, 10, 1408, 1, 1, 458758962, 'Pallet', 300),
(1409, 21, 10, 1409, 1, 1, 458758962, 'Pallet', 300),
(1410, 21, 10, 1410, 1, 1, 458758962, 'Pallet', 300),
(1411, 21, 10, 1411, 1, 1, 458758962, 'Pallet', 300),
(1412, 21, 10, 1412, 1, 1, 458758962, 'Pallet', 300),
(1413, 21, 10, 1413, 1, 1, 458758962, 'Pallet', 300),
(1414, 21, 10, 1414, 1, 1, 458758962, 'Pallet', 300),
(1415, 21, 10, 1415, 1, 1, 458758962, 'Pallet', 300),
(1416, 21, 10, 1416, 1, 1, 458758962, 'Pallet', 300),
(1417, 21, 10, 1417, 1, 1, 458758962, 'Pallet', 300),
(1418, 21, 10, 1418, 1, 1, 458758962, 'Pallet', 300),
(1419, 21, 10, 1419, 1, 1, 458758962, 'Pallet', 300),
(1420, 21, 10, 1420, 1, 1, 458758962, 'Pallet', 300),
(1421, 21, 10, 1421, 1, 1, 458758962, 'Pallet', 300),
(1422, 21, 10, 1422, 1, 1, 458758962, 'Pallet', 300),
(1423, 21, 10, 1423, 1, 1, 458758962, 'Pallet', 300),
(1424, 21, 10, 1424, 1, 1, 458758962, 'Pallet', 300),
(1425, 21, 10, 1425, 1, 1, 458758962, 'Pallet', 300),
(1426, 21, 10, 1426, 1, 1, 458758962, 'Pallet', 300),
(1427, 21, 10, 1427, 1, 1, 458758962, 'Pallet', 300),
(1428, 21, 10, 1428, 1, 1, 458758962, 'Pallet', 300),
(1429, 21, 10, 1429, 1, 1, 458758962, 'Pallet', 300),
(1430, 21, 10, 1430, 1, 1, 458758962, 'Pallet', 300),
(1431, 21, 10, 1431, 1, 1, 458758962, 'Pallet', 300),
(1432, 21, 10, 1432, 1, 1, 458758962, 'Pallet', 300),
(1433, 21, 10, 1433, 1, 1, 458758962, 'Pallet', 300),
(1434, 21, 10, 1434, 1, 1, 458758962, 'Pallet', 300),
(1435, 21, 10, 1435, 1, 1, 458758962, 'Pallet', 300),
(1436, 21, 10, 1436, 1, 1, 458758962, 'Pallet', 300),
(1437, 21, 10, 1437, 1, 1, 458758962, 'Pallet', 300),
(1438, 21, 10, 1438, 1, 1, 458758962, 'Pallet', 300),
(1439, 21, 10, 1439, 1, 1, 458758962, 'Pallet', 300),
(1440, 21, 10, 1440, 1, 1, 458758962, 'Pallet', 300),
(1441, 21, 10, 1441, 1, 1, 458758962, 'Pallet', 300),
(1442, 21, 10, 1442, 1, 1, 458758962, 'Pallet', 300),
(1443, 21, 10, 1443, 1, 1, 458758962, 'Pallet', 300),
(1444, 21, 10, 1444, 1, 1, 458758962, 'Pallet', 300),
(1445, 21, 10, 1445, 1, 1, 458758962, 'Pallet', 300),
(1446, 21, 10, 1446, 1, 1, 458758962, 'Pallet', 300),
(1447, 21, 10, 1447, 1, 1, 458758962, 'Pallet', 300),
(1448, 21, 10, 1448, 1, 1, 458758962, 'Pallet', 300),
(1449, 21, 10, 1449, 1, 1, 458758962, 'Pallet', 300),
(1450, 21, 10, 1450, 1, 1, 458758962, 'Pallet', 300),
(1451, 21, 10, 1451, 1, 1, 458758962, 'Pallet', 300),
(1452, 21, 10, 1452, 1, 1, 458758962, 'Pallet', 300),
(1453, 21, 10, 1453, 1, 1, 458758962, 'Pallet', 300),
(1454, 21, 10, 1454, 1, 1, 458758962, 'Pallet', 300),
(1455, 21, 10, 1455, 1, 1, 458758962, 'Pallet', 300),
(1456, 21, 10, 1456, 1, 1, 458758962, 'Pallet', 300),
(1457, 21, 10, 1457, 1, 1, 458758962, 'Pallet', 300),
(1458, 21, 10, 1458, 1, 1, 458758962, 'Pallet', 300),
(1459, 21, 10, 1459, 1, 1, 458758962, 'Pallet', 300),
(1460, 21, 10, 1460, 1, 1, 458758962, 'Pallet', 300),
(1461, 21, 10, 1461, 1, 1, 458758962, 'Pallet', 300),
(1462, 21, 10, 1462, 1, 1, 458758962, 'Pallet', 300),
(1463, 21, 10, 1463, 1, 1, 458758962, 'Pallet', 300),
(1464, 21, 10, 1464, 1, 1, 458758962, 'Pallet', 300),
(1465, 21, 10, 1465, 1, 1, 458758962, 'Pallet', 300),
(1466, 21, 10, 1466, 1, 1, 458758962, 'Pallet', 300),
(1467, 21, 10, 1467, 1, 1, 458758962, 'Pallet', 300),
(1468, 21, 10, 1468, 1, 1, 458758962, 'Pallet', 300),
(1469, 21, 10, 1469, 1, 1, 458758962, 'Pallet', 300),
(1470, 21, 10, 1470, 1, 1, 458758962, 'Pallet', 300),
(1471, 21, 10, 1471, 1, 1, 458758962, 'Pallet', 300),
(1472, 21, 10, 1472, 1, 1, 458758962, 'Pallet', 300),
(1473, 21, 10, 1473, 1, 1, 458758962, 'Pallet', 300),
(1474, 21, 10, 1474, 1, 1, 458758962, 'Pallet', 300),
(1475, 21, 10, 1475, 1, 1, 458758962, 'Pallet', 300),
(1476, 21, 10, 1476, 1, 1, 458758962, 'Pallet', 300),
(1477, 21, 10, 1477, 1, 1, 458758962, 'Pallet', 300),
(1478, 21, 10, 1478, 1, 1, 458758962, 'Pallet', 300),
(1479, 21, 10, 1479, 1, 1, 458758962, 'Pallet', 300),
(1480, 21, 10, 1480, 1, 1, 458758962, 'Pallet', 300),
(1481, 21, 10, 1481, 1, 1, 458758962, 'Pallet', 300),
(1482, 21, 10, 1482, 1, 1, 458758962, 'Pallet', 300),
(1483, 21, 10, 1483, 1, 1, 458758962, 'Pallet', 300),
(1484, 21, 10, 1484, 1, 1, 458758962, 'Pallet', 300),
(1485, 21, 10, 1485, 1, 1, 458758962, 'Pallet', 300),
(1486, 21, 10, 1486, 1, 1, 458758962, 'Pallet', 300),
(1487, 21, 10, 1487, 1, 1, 458758962, 'Pallet', 300),
(1488, 21, 10, 1488, 1, 1, 458758962, 'Pallet', 300),
(1489, 21, 10, 1489, 1, 1, 458758962, 'Pallet', 300),
(1490, 21, 10, 1490, 1, 1, 458758962, 'Pallet', 300),
(1491, 21, 10, 1491, 1, 1, 458758962, 'Pallet', 300),
(1492, 21, 10, 1492, 1, 1, 458758962, 'Pallet', 300),
(1493, 21, 10, 1493, 1, 1, 458758962, 'Pallet', 300),
(1494, 21, 10, 1494, 1, 1, 458758962, 'Pallet', 300),
(1495, 21, 10, 1495, 1, 1, 458758962, 'Pallet', 300),
(1496, 21, 10, 1496, 1, 1, 458758962, 'Pallet', 300),
(1497, 21, 10, 1497, 1, 1, 458758962, 'Pallet', 300),
(1498, 21, 10, 1498, 1, 1, 458758962, 'Pallet', 300),
(1499, 21, 10, 1499, 1, 1, 458758962, 'Pallet', 300),
(1500, 21, 10, 1500, 1, 1, 458758962, 'Pallet', 300),
(1501, 21, 10, 1501, 1, 1, 458758962, 'Pallet', 300),
(1502, 21, 10, 1502, 1, 1, 458758962, 'Pallet', 300),
(1503, 21, 10, 1503, 1, 1, 458758962, 'Pallet', 300),
(1504, 21, 10, 1504, 1, 1, 458758962, 'Pallet', 300),
(1505, 21, 10, 1505, 1, 1, 458758962, 'Pallet', 300),
(1506, 21, 10, 1506, 1, 1, 458758962, 'Pallet', 300),
(1507, 21, 10, 1507, 1, 1, 458758962, 'Pallet', 300),
(1508, 21, 10, 1508, 1, 1, 458758962, 'Pallet', 300),
(1509, 21, 10, 1509, 1, 1, 458758962, 'Pallet', 300),
(1510, 21, 10, 1510, 1, 1, 458758962, 'Pallet', 300),
(1511, 21, 10, 1511, 1, 1, 458758962, 'Pallet', 300),
(1512, 21, 10, 1512, 1, 1, 458758962, 'Pallet', 300),
(1513, 21, 10, 1513, 1, 1, 458758962, 'Pallet', 300),
(1514, 21, 10, 1514, 1, 1, 458758962, 'Pallet', 300),
(1515, 21, 10, 1515, 1, 1, 458758962, 'Pallet', 300),
(1516, 21, 10, 1516, 1, 1, 458758962, 'Pallet', 300),
(1517, 21, 10, 1517, 1, 1, 458758962, 'Pallet', 300),
(1518, 21, 10, 1518, 1, 1, 458758962, 'Pallet', 300),
(1519, 21, 10, 1519, 1, 1, 458758962, 'Pallet', 300),
(1520, 21, 10, 1520, 1, 1, 458758962, 'Pallet', 300),
(1521, 21, 10, 1521, 1, 1, 458758962, 'Pallet', 300),
(1522, 21, 10, 1522, 1, 1, 458758962, 'Pallet', 300),
(1523, 21, 10, 1523, 1, 1, 458758962, 'Pallet', 300),
(1524, 21, 10, 1524, 1, 1, 458758962, 'Pallet', 300),
(1525, 21, 10, 1525, 1, 1, 458758962, 'Pallet', 300),
(1526, 21, 10, 1526, 1, 1, 458758962, 'Pallet', 300),
(1527, 21, 10, 1527, 1, 1, 458758962, 'Pallet', 300),
(1528, 21, 10, 1528, 1, 1, 458758962, 'Pallet', 300),
(1529, 21, 10, 1529, 1, 1, 458758962, 'Pallet', 300),
(1530, 21, 10, 1530, 1, 1, 458758962, 'Pallet', 300),
(1531, 21, 10, 1531, 1, 1, 458758962, 'Pallet', 300),
(1532, 21, 10, 1532, 1, 1, 458758962, 'Pallet', 300),
(1533, 21, 10, 1533, 1, 1, 458758962, 'Pallet', 300),
(1534, 21, 10, 1534, 1, 1, 458758962, 'Pallet', 300),
(1535, 21, 10, 1535, 1, 1, 458758962, 'Pallet', 300),
(1536, 21, 10, 1536, 1, 1, 458758962, 'Pallet', 300),
(1537, 21, 10, 1537, 1, 1, 458758962, 'Pallet', 300),
(1538, 21, 10, 1538, 1, 1, 458758962, 'Pallet', 300),
(1539, 21, 10, 1539, 1, 1, 458758962, 'Pallet', 300),
(1540, 21, 10, 1540, 1, 1, 458758962, 'Pallet', 300),
(1541, 21, 10, 1541, 1, 1, 458758962, 'Pallet', 300),
(1542, 21, 10, 1542, 1, 1, 458758962, 'Pallet', 300),
(1543, 21, 10, 1543, 1, 1, 458758962, 'Pallet', 300),
(1544, 21, 10, 1544, 1, 1, 458758962, 'Pallet', 300),
(1545, 21, 10, 1545, 1, 1, 458758962, 'Pallet', 300),
(1546, 21, 10, 1546, 1, 1, 458758962, 'Pallet', 300),
(1547, 21, 10, 1547, 1, 1, 458758962, 'Pallet', 300),
(1548, 21, 10, 1548, 1, 1, 458758962, 'Pallet', 300),
(1549, 21, 10, 1549, 1, 1, 458758962, 'Pallet', 300),
(1550, 21, 10, 1550, 1, 1, 458758962, 'Pallet', 300),
(1551, 21, 10, 1551, 1, 1, 458758962, 'Pallet', 300),
(1552, 21, 10, 1552, 1, 1, 458758962, 'Pallet', 300),
(1553, 21, 10, 1553, 1, 1, 458758962, 'Pallet', 300),
(1554, 21, 10, 1554, 1, 1, 458758962, 'Pallet', 300),
(1555, 21, 10, 1555, 1, 1, 458758962, 'Pallet', 300),
(1556, 21, 10, 1556, 1, 1, 458758962, 'Pallet', 300),
(1557, 21, 10, 1557, 1, 1, 458758962, 'Pallet', 300),
(1558, 21, 10, 1558, 1, 1, 458758962, 'Pallet', 300),
(1559, 21, 10, 1559, 1, 1, 458758962, 'Pallet', 300),
(1560, 21, 10, 1560, 1, 1, 458758962, 'Pallet', 300),
(1561, 21, 10, 1561, 1, 1, 458758962, 'Pallet', 300),
(1562, 21, 10, 1562, 1, 1, 458758962, 'Pallet', 300),
(1563, 21, 10, 1563, 1, 1, 458758962, 'Pallet', 300),
(1564, 21, 10, 1564, 1, 1, 458758962, 'Pallet', 300),
(1565, 21, 10, 1565, 1, 1, 458758962, 'Pallet', 300),
(1566, 21, 10, 1566, 1, 1, 458758962, 'Pallet', 300),
(1567, 21, 10, 1567, 1, 1, 458758962, 'Pallet', 300),
(1568, 21, 10, 1568, 1, 1, 458758962, 'Pallet', 300),
(1569, 21, 10, 1569, 1, 1, 458758962, 'Pallet', 300),
(1570, 21, 10, 1570, 1, 1, 458758962, 'Pallet', 300),
(1571, 21, 10, 1571, 1, 1, 458758962, 'Pallet', 300),
(1572, 21, 10, 1572, 1, 1, 458758962, 'Pallet', 300),
(1573, 21, 10, 1573, 1, 1, 458758962, 'Pallet', 300),
(1574, 21, 10, 1574, 1, 1, 458758962, 'Pallet', 300),
(1575, 21, 10, 1575, 1, 1, 458758962, 'Pallet', 300),
(1576, 21, 10, 1576, 1, 1, 458758962, 'Pallet', 300),
(1577, 21, 10, 1577, 1, 1, 458758962, 'Pallet', 300),
(1578, 21, 10, 1578, 1, 1, 458758962, 'Pallet', 300),
(1579, 21, 10, 1579, 1, 1, 458758962, 'Pallet', 300),
(1580, 21, 10, 1580, 1, 1, 458758962, 'Pallet', 300),
(1581, 21, 10, 1581, 1, 1, 458758962, 'Pallet', 300),
(1582, 21, 10, 1582, 1, 1, 458758962, 'Pallet', 300),
(1583, 21, 10, 1583, 1, 1, 458758962, 'Pallet', 300),
(1584, 21, 10, 1584, 1, 1, 458758962, 'Pallet', 300),
(1585, 21, 10, 1585, 1, 1, 458758962, 'Pallet', 300),
(1586, 21, 10, 1586, 1, 1, 458758962, 'Pallet', 300),
(1587, 21, 10, 1587, 1, 1, 458758962, 'Pallet', 300),
(1588, 21, 10, 1588, 1, 1, 458758962, 'Pallet', 300),
(1589, 21, 10, 1589, 1, 1, 458758962, 'Pallet', 300),
(1590, 21, 10, 1590, 1, 1, 458758962, 'Pallet', 300),
(1591, 21, 10, 1591, 1, 1, 458758962, 'Pallet', 300),
(1592, 21, 10, 1592, 1, 1, 458758962, 'Pallet', 300),
(1593, 21, 10, 1593, 1, 1, 458758962, 'Pallet', 300),
(1594, 21, 10, 1594, 1, 1, 458758962, 'Pallet', 300),
(1595, 21, 10, 1595, 1, 1, 458758962, 'Pallet', 300),
(1596, 21, 10, 1596, 1, 1, 458758962, 'Pallet', 300),
(1597, 21, 10, 1597, 1, 1, 458758962, 'Pallet', 300),
(1598, 21, 10, 1598, 1, 1, 458758962, 'Pallet', 300),
(1599, 21, 10, 1599, 1, 1, 458758962, 'Pallet', 300),
(1600, 21, 10, 1600, 1, 1, 458758962, 'Pallet', 300),
(1601, 21, 10, 1601, 1, 1, 458758962, 'Pallet', 300),
(1602, 21, 10, 1602, 1, 1, 458758962, 'Pallet', 300),
(1603, 21, 10, 1603, 1, 1, 458758962, 'Pallet', 300),
(1604, 21, 10, 1604, 1, 1, 458758962, 'Pallet', 300),
(1605, 21, 10, 1605, 1, 1, 458758962, 'Pallet', 300),
(1606, 21, 10, 1606, 1, 1, 458758962, 'Pallet', 300),
(1607, 21, 10, 1607, 1, 1, 458758962, 'Pallet', 300),
(1608, 21, 10, 1608, 1, 1, 458758962, 'Pallet', 300),
(1609, 21, 10, 1609, 1, 1, 458758962, 'Pallet', 300),
(1610, 21, 10, 1610, 1, 1, 458758962, 'Pallet', 300),
(1611, 21, 10, 1611, 1, 1, 458758962, 'Pallet', 300),
(1612, 21, 10, 1612, 1, 1, 458758962, 'Pallet', 300),
(1613, 21, 10, 1613, 1, 1, 458758962, 'Pallet', 300),
(1614, 21, 10, 1614, 1, 1, 458758962, 'Pallet', 300),
(1615, 21, 10, 1615, 1, 1, 458758962, 'Pallet', 300),
(1616, 21, 10, 1616, 1, 1, 458758962, 'Pallet', 300),
(1617, 21, 10, 1617, 1, 1, 458758962, 'Pallet', 300),
(1618, 21, 10, 1618, 1, 1, 458758962, 'Pallet', 300),
(1619, 21, 10, 1619, 1, 1, 458758962, 'Pallet', 300),
(1620, 21, 10, 1620, 1, 1, 458758962, 'Pallet', 300),
(1621, 21, 10, 1621, 1, 1, 458758962, 'Pallet', 300),
(1622, 21, 10, 1622, 1, 1, 458758962, 'Pallet', 300),
(1623, 21, 10, 1623, 1, 1, 458758962, 'Pallet', 300),
(1624, 21, 10, 1624, 1, 1, 458758962, 'Pallet', 300),
(1625, 21, 10, 1625, 1, 1, 458758962, 'Pallet', 300),
(1626, 21, 10, 1626, 1, 1, 458758962, 'Pallet', 300),
(1627, 21, 10, 1627, 1, 1, 458758962, 'Pallet', 300),
(1628, 21, 10, 1628, 1, 1, 458758962, 'Pallet', 300),
(1629, 21, 10, 1629, 1, 1, 458758962, 'Pallet', 300),
(1630, 21, 10, 1630, 1, 1, 458758962, 'Pallet', 300),
(1631, 21, 10, 1631, 1, 1, 458758962, 'Pallet', 300),
(1632, 21, 10, 1632, 1, 1, 458758962, 'Pallet', 300),
(1633, 21, 10, 1633, 1, 1, 458758962, 'Pallet', 300),
(1634, 21, 10, 1634, 1, 1, 458758962, 'Pallet', 300),
(1635, 21, 10, 1635, 1, 1, 458758962, 'Pallet', 300),
(1636, 21, 10, 1636, 1, 1, 458758962, 'Pallet', 300),
(1637, 21, 10, 1637, 1, 1, 458758962, 'Pallet', 300),
(1638, 21, 10, 1638, 1, 1, 458758962, 'Pallet', 300),
(1639, 21, 10, 1639, 1, 1, 458758962, 'Pallet', 300),
(1640, 21, 10, 1640, 1, 1, 458758962, 'Pallet', 300),
(1641, 21, 10, 1641, 1, 1, 458758962, 'Pallet', 300),
(1642, 21, 10, 1642, 1, 1, 458758962, 'Pallet', 300),
(1643, 21, 10, 1643, 1, 1, 458758962, 'Pallet', 300),
(1644, 21, 10, 1644, 1, 1, 458758962, 'Pallet', 300),
(1645, 21, 10, 1645, 1, 1, 458758962, 'Pallet', 300),
(1646, 21, 10, 1646, 1, 1, 458758962, 'Pallet', 300),
(1647, 21, 10, 1647, 1, 1, 458758962, 'Pallet', 300),
(1648, 21, 10, 1648, 1, 1, 458758962, 'Pallet', 300),
(1649, 21, 10, 1649, 1, 1, 458758962, 'Pallet', 300),
(1650, 21, 10, 1650, 1, 1, 458758962, 'Pallet', 300),
(1651, 21, 10, 1651, 1, 1, 458758962, 'Pallet', 300),
(1652, 21, 10, 1652, 1, 1, 458758962, 'Pallet', 300),
(1653, 21, 10, 1653, 1, 1, 458758962, 'Pallet', 300),
(1654, 21, 10, 1654, 1, 1, 458758962, 'Pallet', 300),
(1655, 21, 10, 1655, 1, 1, 458758962, 'Pallet', 300),
(1656, 21, 10, 1656, 1, 1, 458758962, 'Pallet', 300),
(1657, 21, 10, 1657, 1, 1, 458758962, 'Pallet', 300),
(1658, 21, 10, 1658, 1, 1, 458758962, 'Pallet', 300),
(1659, 21, 10, 1659, 1, 1, 458758962, 'Pallet', 300),
(1660, 21, 10, 1660, 1, 1, 458758962, 'Pallet', 300),
(1661, 21, 10, 1661, 1, 1, 458758962, 'Pallet', 300),
(1662, 21, 10, 1662, 1, 1, 458758962, 'Pallet', 300),
(1663, 21, 10, 1663, 1, 1, 458758962, 'Pallet', 300),
(1664, 21, 10, 1664, 1, 1, 458758962, 'Pallet', 300),
(1665, 21, 10, 1665, 1, 1, 458758962, 'Pallet', 300),
(1666, 21, 10, 1666, 1, 1, 458758962, 'Pallet', 300),
(1667, 21, 10, 1667, 1, 1, 458758962, 'Pallet', 300),
(1668, 21, 10, 1668, 1, 1, 458758962, 'Pallet', 300),
(1669, 21, 10, 1669, 1, 1, 458758962, 'Pallet', 300),
(1670, 21, 10, 1670, 1, 1, 458758962, 'Pallet', 300),
(1671, 21, 10, 1671, 1, 1, 458758962, 'Pallet', 300),
(1672, 21, 10, 1672, 1, 1, 458758962, 'Pallet', 300),
(1673, 21, 10, 1673, 1, 1, 458758962, 'Pallet', 300),
(1674, 21, 10, 1674, 1, 1, 458758962, 'Pallet', 300),
(1675, 21, 10, 1675, 1, 1, 458758962, 'Pallet', 300),
(1676, 21, 10, 1676, 1, 1, 458758962, 'Pallet', 300),
(1677, 21, 10, 1677, 1, 1, 458758962, 'Pallet', 300),
(1678, 21, 10, 1678, 1, 1, 458758962, 'Pallet', 300),
(1679, 21, 10, 1679, 1, 1, 458758962, 'Pallet', 300),
(1680, 21, 10, 1680, 1, 1, 458758962, 'Pallet', 300),
(1681, 21, 10, 1681, 1, 1, 458758962, 'Pallet', 300),
(1682, 21, 10, 1682, 1, 1, 458758962, 'Pallet', 300),
(1683, 21, 10, 1683, 1, 1, 458758962, 'Pallet', 300),
(1684, 21, 10, 1684, 1, 1, 458758962, 'Pallet', 300),
(1685, 21, 10, 1685, 1, 1, 458758962, 'Pallet', 300),
(1686, 21, 10, 1686, 1, 1, 458758962, 'Pallet', 300),
(1687, 21, 10, 1687, 1, 1, 458758962, 'Pallet', 300),
(1688, 21, 10, 1688, 1, 1, 458758962, 'Pallet', 300),
(1689, 21, 10, 1689, 1, 1, 458758962, 'Pallet', 300),
(1690, 21, 10, 1690, 1, 1, 458758962, 'Pallet', 300),
(1691, 21, 10, 1691, 1, 1, 458758962, 'Pallet', 300),
(1692, 21, 10, 1692, 1, 1, 458758962, 'Pallet', 300),
(1693, 21, 10, 1693, 1, 1, 458758962, 'Pallet', 300),
(1694, 21, 10, 1694, 1, 1, 458758962, 'Pallet', 300),
(1695, 21, 10, 1695, 1, 1, 458758962, 'Pallet', 300),
(1696, 21, 10, 1696, 1, 1, 458758962, 'Pallet', 300),
(1697, 21, 10, 1697, 1, 1, 458758962, 'Pallet', 300),
(1698, 21, 10, 1698, 1, 1, 458758962, 'Pallet', 300),
(1699, 21, 10, 1699, 1, 1, 458758962, 'Pallet', 300),
(1700, 21, 10, 1700, 1, 1, 458758962, 'Pallet', 300),
(1701, 21, 10, 1701, 1, 1, 458758962, 'Pallet', 300),
(1702, 21, 10, 1702, 1, 1, 458758962, 'Pallet', 300),
(1703, 21, 10, 1703, 1, 1, 458758962, 'Pallet', 300),
(1704, 21, 10, 1704, 1, 1, 458758962, 'Pallet', 300),
(1705, 21, 10, 1705, 1, 1, 458758962, 'Pallet', 300),
(1706, 21, 10, 1706, 1, 1, 458758962, 'Pallet', 300),
(1707, 21, 10, 1707, 1, 1, 458758962, 'Pallet', 300),
(1708, 21, 10, 1708, 1, 1, 458758962, 'Pallet', 300),
(1709, 21, 10, 1709, 1, 1, 458758962, 'Pallet', 300),
(1710, 21, 10, 1710, 1, 1, 458758962, 'Pallet', 300),
(1711, 21, 10, 1711, 1, 1, 458758962, 'Pallet', 300),
(1712, 21, 10, 1712, 1, 1, 458758962, 'Pallet', 300),
(1713, 21, 10, 1713, 1, 1, 458758962, 'Pallet', 300),
(1714, 21, 10, 1714, 1, 1, 458758962, 'Pallet', 300),
(1715, 21, 10, 1715, 1, 1, 458758962, 'Pallet', 300),
(1716, 21, 10, 1716, 1, 1, 458758962, 'Pallet', 300),
(1717, 21, 10, 1717, 1, 1, 458758962, 'Pallet', 300),
(1718, 21, 10, 1718, 1, 1, 458758962, 'Pallet', 300),
(1719, 21, 10, 1719, 1, 1, 458758962, 'Pallet', 300),
(1720, 21, 10, 1720, 1, 1, 458758962, 'Pallet', 300),
(1721, 21, 10, 1721, 1, 1, 458758962, 'Pallet', 300),
(1722, 21, 10, 1722, 1, 1, 458758962, 'Pallet', 300),
(1723, 21, 10, 1723, 1, 1, 458758962, 'Pallet', 300),
(1724, 21, 10, 1724, 1, 1, 458758962, 'Pallet', 300),
(1725, 21, 10, 1725, 1, 1, 458758962, 'Pallet', 300),
(1726, 21, 10, 1726, 1, 1, 458758962, 'Pallet', 300),
(1727, 21, 10, 1727, 1, 1, 458758962, 'Pallet', 300),
(1728, 21, 10, 1728, 1, 1, 458758962, 'Pallet', 300),
(1729, 21, 10, 1729, 1, 1, 458758962, 'Pallet', 300),
(1730, 21, 10, 1730, 1, 1, 458758962, 'Pallet', 300),
(1731, 21, 10, 1731, 1, 1, 458758962, 'Pallet', 300),
(1732, 21, 10, 1732, 1, 1, 458758962, 'Pallet', 300),
(1733, 21, 10, 1733, 1, 1, 458758962, 'Pallet', 300),
(1734, 21, 10, 1734, 1, 1, 458758962, 'Pallet', 300),
(1735, 21, 10, 1735, 1, 1, 458758962, 'Pallet', 300),
(1736, 21, 10, 1736, 1, 1, 458758962, 'Pallet', 300),
(1737, 21, 10, 1737, 1, 1, 458758962, 'Pallet', 300),
(1738, 21, 10, 1738, 1, 1, 458758962, 'Pallet', 300),
(1739, 21, 10, 1739, 1, 1, 458758962, 'Pallet', 300),
(1740, 21, 10, 1740, 1, 1, 458758962, 'Pallet', 300),
(1741, 21, 10, 1741, 1, 1, 458758962, 'Pallet', 300),
(1742, 21, 10, 1742, 1, 1, 458758962, 'Pallet', 300),
(1743, 21, 10, 1743, 1, 1, 458758962, 'Pallet', 300),
(1744, 21, 10, 1744, 1, 1, 458758962, 'Pallet', 300),
(1745, 21, 10, 1745, 1, 1, 458758962, 'Pallet', 300),
(1746, 21, 10, 1746, 1, 1, 458758962, 'Pallet', 300),
(1747, 21, 10, 1747, 1, 1, 458758962, 'Pallet', 300),
(1748, 21, 10, 1748, 1, 1, 458758962, 'Pallet', 300),
(1749, 21, 10, 1749, 1, 1, 458758962, 'Pallet', 300),
(1750, 21, 10, 1750, 1, 1, 458758962, 'Pallet', 300),
(1751, 21, 10, 1751, 1, 1, 458758962, 'Pallet', 300),
(1752, 21, 10, 1752, 1, 1, 458758962, 'Pallet', 300),
(1753, 21, 10, 1753, 1, 1, 458758962, 'Pallet', 300),
(1754, 21, 10, 1754, 1, 1, 458758962, 'Pallet', 300),
(1755, 21, 10, 1755, 1, 1, 458758962, 'Pallet', 300),
(1756, 21, 10, 1756, 1, 1, 458758962, 'Pallet', 300),
(1757, 21, 10, 1757, 1, 1, 458758962, 'Pallet', 300),
(1758, 21, 10, 1758, 1, 1, 458758962, 'Pallet', 300),
(1759, 21, 10, 1759, 1, 1, 458758962, 'Pallet', 300),
(1760, 21, 10, 1760, 1, 1, 458758962, 'Pallet', 300),
(1761, 21, 10, 1761, 1, 1, 458758962, 'Pallet', 300),
(1762, 21, 10, 1762, 1, 1, 458758962, 'Pallet', 300),
(1763, 21, 10, 1763, 1, 1, 458758962, 'Pallet', 300),
(1764, 21, 10, 1764, 1, 1, 458758962, 'Pallet', 300),
(1765, 21, 10, 1765, 1, 1, 458758962, 'Pallet', 300),
(1766, 21, 10, 1766, 1, 1, 458758962, 'Pallet', 300),
(1767, 21, 10, 1767, 1, 1, 458758962, 'Pallet', 300),
(1768, 21, 10, 1768, 1, 1, 458758962, 'Pallet', 300),
(1769, 21, 10, 1769, 1, 1, 458758962, 'Pallet', 300),
(1770, 21, 10, 1770, 1, 1, 458758962, 'Pallet', 300),
(1771, 21, 10, 1771, 1, 1, 458758962, 'Pallet', 300),
(1772, 21, 10, 1772, 1, 1, 458758962, 'Pallet', 300),
(1773, 21, 10, 1773, 1, 1, 458758962, 'Pallet', 300),
(1774, 21, 10, 1774, 1, 1, 458758962, 'Pallet', 300),
(1775, 21, 10, 1775, 1, 1, 458758962, 'Pallet', 300),
(1776, 21, 10, 1776, 1, 1, 458758962, 'Pallet', 300),
(1777, 21, 10, 1777, 1, 1, 458758962, 'Pallet', 300),
(1778, 21, 10, 1778, 1, 1, 458758962, 'Pallet', 300),
(1779, 21, 10, 1779, 1, 1, 458758962, 'Pallet', 300),
(1780, 21, 10, 1780, 1, 1, 458758962, 'Pallet', 300),
(1781, 21, 10, 1781, 1, 1, 458758962, 'Pallet', 300),
(1782, 21, 10, 1782, 1, 1, 458758962, 'Pallet', 300),
(1783, 21, 10, 1783, 1, 1, 458758962, 'Pallet', 300),
(1784, 21, 10, 1784, 1, 1, 458758962, 'Pallet', 300),
(1785, 21, 10, 1785, 1, 1, 458758962, 'Pallet', 300),
(1786, 21, 10, 1786, 1, 1, 458758962, 'Pallet', 300),
(1787, 21, 10, 1787, 1, 1, 458758962, 'Pallet', 300),
(1788, 21, 10, 1788, 1, 1, 458758962, 'Pallet', 300),
(1789, 21, 10, 1789, 1, 1, 458758962, 'Pallet', 300),
(1790, 21, 10, 1790, 1, 1, 458758962, 'Pallet', 300),
(1791, 21, 10, 1791, 1, 1, 458758962, 'Pallet', 300),
(1792, 21, 10, 1792, 1, 1, 458758962, 'Pallet', 300),
(1793, 21, 10, 1793, 1, 1, 458758962, 'Pallet', 300),
(1794, 21, 10, 1794, 1, 1, 458758962, 'Pallet', 300),
(1795, 21, 10, 1795, 1, 1, 458758962, 'Pallet', 300),
(1796, 21, 10, 1796, 1, 1, 458758962, 'Pallet', 300),
(1797, 21, 10, 1797, 1, 1, 458758962, 'Pallet', 300),
(1798, 21, 10, 1798, 1, 1, 458758962, 'Pallet', 300),
(1799, 21, 10, 1799, 1, 1, 458758962, 'Pallet', 300),
(1800, 21, 10, 1800, 1, 1, 458758962, 'Pallet', 300),
(1801, 21, 10, 1801, 1, 1, 458758962, 'Pallet', 300),
(1802, 21, 10, 1802, 1, 1, 458758962, 'Pallet', 300),
(1803, 21, 10, 1803, 1, 1, 458758962, 'Pallet', 300),
(1804, 21, 10, 1804, 1, 1, 458758962, 'Pallet', 300),
(1805, 21, 10, 1805, 1, 1, 458758962, 'Pallet', 300),
(1806, 21, 10, 1806, 1, 1, 458758962, 'Pallet', 300),
(1807, 21, 10, 1807, 1, 1, 458758962, 'Pallet', 300),
(1808, 21, 10, 1808, 1, 1, 458758962, 'Pallet', 300),
(1809, 21, 10, 1809, 1, 1, 458758962, 'Pallet', 300),
(1810, 21, 10, 1810, 1, 1, 458758962, 'Pallet', 300),
(1811, 21, 10, 1811, 1, 1, 458758962, 'Pallet', 300),
(1812, 21, 10, 1812, 1, 1, 458758962, 'Pallet', 300),
(1813, 21, 10, 1813, 1, 1, 458758962, 'Pallet', 300),
(1814, 21, 10, 1814, 1, 1, 458758962, 'Pallet', 300),
(1815, 21, 10, 1815, 1, 1, 458758962, 'Pallet', 300),
(1816, 21, 10, 1816, 1, 1, 458758962, 'Pallet', 300),
(1817, 21, 10, 1817, 1, 1, 458758962, 'Pallet', 300),
(1818, 21, 10, 1818, 1, 1, 458758962, 'Pallet', 300),
(1819, 21, 10, 1819, 1, 1, 458758962, 'Pallet', 300),
(1820, 21, 10, 1820, 1, 1, 458758962, 'Pallet', 300),
(1821, 21, 10, 1821, 1, 1, 458758962, 'Pallet', 300),
(1822, 21, 10, 1822, 1, 1, 458758962, 'Pallet', 300),
(1823, 21, 10, 1823, 1, 1, 458758962, 'Pallet', 300),
(1824, 21, 10, 1824, 1, 1, 458758962, 'Pallet', 300),
(1825, 21, 10, 1825, 1, 1, 458758962, 'Pallet', 300),
(1826, 21, 10, 1826, 1, 1, 458758962, 'Pallet', 300),
(1827, 21, 10, 1827, 1, 1, 458758962, 'Pallet', 300),
(1828, 21, 10, 1828, 1, 1, 458758962, 'Pallet', 300),
(1829, 21, 10, 1829, 1, 1, 458758962, 'Pallet', 300),
(1830, 21, 10, 1830, 1, 1, 458758962, 'Pallet', 300),
(1831, 21, 10, 1831, 1, 1, 458758962, 'Pallet', 300),
(1832, 21, 10, 1832, 1, 1, 458758962, 'Pallet', 300),
(1833, 21, 10, 1833, 1, 1, 458758962, 'Pallet', 300),
(1834, 21, 10, 1834, 1, 1, 458758962, 'Pallet', 300),
(1835, 21, 10, 1835, 1, 1, 458758962, 'Pallet', 300),
(1836, 21, 10, 1836, 1, 1, 458758962, 'Pallet', 300),
(1837, 21, 10, 1837, 1, 1, 458758962, 'Pallet', 300),
(1838, 21, 10, 1838, 1, 1, 458758962, 'Pallet', 300),
(1839, 21, 10, 1839, 1, 1, 458758962, 'Pallet', 300),
(1840, 21, 10, 1840, 1, 1, 458758962, 'Pallet', 300),
(1841, 21, 10, 1841, 1, 1, 458758962, 'Pallet', 300),
(1842, 21, 10, 1842, 1, 1, 458758962, 'Pallet', 300),
(1843, 21, 10, 1843, 1, 1, 458758962, 'Pallet', 300),
(1844, 21, 10, 1844, 1, 1, 458758962, 'Pallet', 300),
(1845, 21, 10, 1845, 1, 1, 458758962, 'Pallet', 300),
(1846, 21, 10, 1846, 1, 1, 458758962, 'Pallet', 300),
(1847, 21, 10, 1847, 1, 1, 458758962, 'Pallet', 300),
(1848, 21, 10, 1848, 1, 1, 458758962, 'Pallet', 300),
(1849, 21, 10, 1849, 1, 1, 458758962, 'Pallet', 300),
(1850, 21, 10, 1850, 1, 1, 458758962, 'Pallet', 300),
(1851, 21, 10, 1851, 1, 1, 458758962, 'Pallet', 300),
(1852, 21, 10, 1852, 1, 1, 458758962, 'Pallet', 300),
(1853, 21, 10, 1853, 1, 1, 458758962, 'Pallet', 300),
(1854, 21, 10, 1854, 1, 1, 458758962, 'Pallet', 300),
(1855, 21, 10, 1855, 1, 1, 458758962, 'Pallet', 300),
(1856, 21, 10, 1856, 1, 1, 458758962, 'Pallet', 300),
(1857, 21, 10, 1857, 1, 1, 458758962, 'Pallet', 300),
(1858, 21, 10, 1858, 1, 1, 458758962, 'Pallet', 300),
(1859, 21, 10, 1859, 1, 1, 458758962, 'Pallet', 300),
(1860, 21, 10, 1860, 1, 1, 458758962, 'Pallet', 300),
(1861, 21, 10, 1861, 1, 1, 458758962, 'Pallet', 300),
(1862, 21, 10, 1862, 1, 1, 458758962, 'Pallet', 300),
(1863, 21, 10, 1863, 1, 1, 458758962, 'Pallet', 300),
(1864, 21, 10, 1864, 1, 1, 458758962, 'Pallet', 300),
(1865, 21, 10, 1865, 1, 1, 458758962, 'Pallet', 300),
(1866, 21, 10, 1866, 1, 1, 458758962, 'Pallet', 300),
(1867, 21, 10, 1867, 1, 1, 458758962, 'Pallet', 300),
(1868, 21, 10, 1868, 1, 1, 458758962, 'Pallet', 300),
(1869, 21, 10, 1869, 1, 1, 458758962, 'Pallet', 300),
(1870, 21, 10, 1870, 1, 1, 458758962, 'Pallet', 300),
(1871, 21, 10, 1871, 1, 1, 458758962, 'Pallet', 300),
(1872, 21, 10, 1872, 1, 1, 458758962, 'Pallet', 300),
(1873, 21, 10, 1873, 1, 1, 458758962, 'Pallet', 300),
(1874, 21, 10, 1874, 1, 1, 458758962, 'Pallet', 300),
(1875, 21, 10, 1875, 1, 1, 458758962, 'Pallet', 300),
(1876, 21, 10, 1876, 1, 1, 458758962, 'Pallet', 300),
(1877, 21, 10, 1877, 1, 1, 458758962, 'Pallet', 300),
(1878, 21, 10, 1878, 1, 1, 458758962, 'Pallet', 300),
(1879, 21, 10, 1879, 1, 1, 458758962, 'Pallet', 300),
(1880, 21, 10, 1880, 1, 1, 458758962, 'Pallet', 300),
(1881, 21, 10, 1881, 1, 1, 458758962, 'Pallet', 300),
(1882, 21, 10, 1882, 1, 1, 458758962, 'Pallet', 300),
(1883, 21, 10, 1883, 1, 1, 458758962, 'Pallet', 300),
(1884, 21, 10, 1884, 1, 1, 458758962, 'Pallet', 300),
(1885, 21, 10, 1885, 1, 1, 458758962, 'Pallet', 300),
(1886, 21, 10, 1886, 1, 1, 458758962, 'Pallet', 300),
(1887, 21, 10, 1887, 1, 1, 458758962, 'Pallet', 300),
(1888, 21, 10, 1888, 1, 1, 458758962, 'Pallet', 300),
(1889, 21, 10, 1889, 1, 1, 458758962, 'Pallet', 300),
(1890, 21, 10, 1890, 1, 1, 458758962, 'Pallet', 300),
(1891, 21, 10, 1891, 1, 1, 458758962, 'Pallet', 300),
(1892, 21, 10, 1892, 1, 1, 458758962, 'Pallet', 300),
(1893, 21, 10, 1893, 1, 1, 458758962, 'Pallet', 300),
(1894, 21, 10, 1894, 1, 1, 458758962, 'Pallet', 300),
(1895, 21, 10, 1895, 1, 1, 458758962, 'Pallet', 300),
(1896, 21, 10, 1896, 1, 1, 458758962, 'Pallet', 300),
(1897, 21, 10, 1897, 1, 1, 458758962, 'Pallet', 300),
(1898, 21, 10, 1898, 1, 1, 458758962, 'Pallet', 300),
(1899, 21, 10, 1899, 1, 1, 458758962, 'Pallet', 300),
(1900, 21, 10, 1900, 1, 1, 458758962, 'Pallet', 300),
(1901, 21, 10, 1901, 1, 1, 458758962, 'Pallet', 300),
(1902, 21, 10, 1902, 1, 1, 458758962, 'Pallet', 300),
(1903, 21, 10, 1903, 1, 1, 458758962, 'Pallet', 300),
(1904, 21, 10, 1904, 1, 1, 458758962, 'Pallet', 300),
(1905, 21, 10, 1905, 1, 1, 458758962, 'Pallet', 300),
(1906, 21, 10, 1906, 1, 1, 458758962, 'Pallet', 300),
(1907, 21, 10, 1907, 1, 1, 458758962, 'Pallet', 300),
(1908, 21, 10, 1908, 1, 1, 458758962, 'Pallet', 300),
(1909, 21, 10, 1909, 1, 1, 458758962, 'Pallet', 300),
(1910, 21, 10, 1910, 1, 1, 458758962, 'Pallet', 300),
(1911, 21, 10, 1911, 1, 1, 458758962, 'Pallet', 300),
(1912, 21, 10, 1912, 1, 1, 458758962, 'Pallet', 300),
(1913, 21, 10, 1913, 1, 1, 458758962, 'Pallet', 300),
(1914, 21, 10, 1914, 1, 1, 458758962, 'Pallet', 300),
(1915, 21, 10, 1915, 1, 1, 458758962, 'Pallet', 300),
(1916, 21, 10, 1916, 1, 1, 458758962, 'Pallet', 300),
(1917, 21, 10, 1917, 1, 1, 458758962, 'Pallet', 300),
(1918, 21, 10, 1918, 1, 1, 458758962, 'Pallet', 300),
(1919, 21, 10, 1919, 1, 1, 458758962, 'Pallet', 300),
(1920, 21, 10, 1920, 1, 1, 458758962, 'Pallet', 300),
(1921, 21, 10, 1921, 1, 1, 458758962, 'Pallet', 300),
(1922, 21, 10, 1922, 1, 1, 458758962, 'Pallet', 300),
(1923, 21, 10, 1923, 1, 1, 458758962, 'Pallet', 300),
(1924, 21, 10, 1924, 1, 1, 458758962, 'Pallet', 300),
(1925, 21, 10, 1925, 1, 1, 458758962, 'Pallet', 300),
(1926, 21, 10, 1926, 1, 1, 458758962, 'Pallet', 300),
(1927, 21, 10, 1927, 1, 1, 458758962, 'Pallet', 300),
(1928, 21, 10, 1928, 1, 1, 458758962, 'Pallet', 300),
(1929, 21, 10, 1929, 1, 1, 458758962, 'Pallet', 300),
(1930, 21, 10, 1930, 1, 1, 458758962, 'Pallet', 300),
(1931, 21, 10, 1931, 1, 1, 458758962, 'Pallet', 300),
(1932, 21, 10, 1932, 1, 1, 458758962, 'Pallet', 300),
(1933, 21, 10, 1933, 1, 1, 458758962, 'Pallet', 300),
(1934, 21, 10, 1934, 1, 1, 458758962, 'Pallet', 300),
(1935, 21, 10, 1935, 1, 1, 458758962, 'Pallet', 300),
(1936, 21, 10, 1936, 1, 1, 458758962, 'Pallet', 300),
(1937, 21, 10, 1937, 1, 1, 458758962, 'Pallet', 300),
(1938, 21, 10, 1938, 1, 1, 458758962, 'Pallet', 300),
(1939, 21, 10, 1939, 1, 1, 458758962, 'Pallet', 300),
(1940, 21, 10, 1940, 1, 1, 458758962, 'Pallet', 300),
(1941, 21, 10, 1941, 1, 1, 458758962, 'Pallet', 300),
(1942, 21, 10, 1942, 1, 1, 458758962, 'Pallet', 300),
(1943, 21, 10, 1943, 1, 1, 458758962, 'Pallet', 300),
(1944, 21, 10, 1944, 1, 1, 458758962, 'Pallet', 300),
(1945, 21, 10, 1945, 1, 1, 458758962, 'Pallet', 300),
(1946, 21, 10, 1946, 1, 1, 458758962, 'Pallet', 300),
(1947, 21, 10, 1947, 1, 1, 458758962, 'Pallet', 300),
(1948, 21, 10, 1948, 1, 1, 458758962, 'Pallet', 300),
(1949, 21, 10, 1949, 1, 1, 458758962, 'Pallet', 300),
(1950, 21, 10, 1950, 1, 1, 458758962, 'Pallet', 300),
(1951, 21, 10, 1951, 1, 1, 458758962, 'Pallet', 300),
(1952, 21, 10, 1952, 1, 1, 458758962, 'Pallet', 300),
(1953, 21, 10, 1953, 1, 1, 458758962, 'Pallet', 300),
(1954, 21, 10, 1954, 1, 1, 458758962, 'Pallet', 300),
(1955, 21, 10, 1955, 1, 1, 458758962, 'Pallet', 300),
(1956, 21, 10, 1956, 1, 1, 458758962, 'Pallet', 300),
(1957, 21, 10, 1957, 1, 1, 458758962, 'Pallet', 300),
(1958, 21, 10, 1958, 1, 1, 458758962, 'Pallet', 300),
(1959, 21, 10, 1959, 1, 1, 458758962, 'Pallet', 300),
(1960, 21, 10, 1960, 1, 1, 458758962, 'Pallet', 300),
(1961, 21, 10, 1961, 1, 1, 458758962, 'Pallet', 300),
(1962, 21, 10, 1962, 1, 1, 458758962, 'Pallet', 300),
(1963, 21, 10, 1963, 1, 1, 458758962, 'Pallet', 300),
(1964, 21, 10, 1964, 1, 1, 458758962, 'Pallet', 300),
(1965, 21, 10, 1965, 1, 1, 458758962, 'Pallet', 300),
(1966, 21, 10, 1966, 1, 1, 458758962, 'Pallet', 300),
(1967, 21, 10, 1967, 1, 1, 458758962, 'Pallet', 300),
(1968, 21, 10, 1968, 1, 1, 458758962, 'Pallet', 300),
(1969, 21, 10, 1969, 1, 1, 458758962, 'Pallet', 300),
(1970, 21, 10, 1970, 1, 1, 458758962, 'Pallet', 300),
(1971, 21, 10, 1971, 1, 1, 458758962, 'Pallet', 300),
(1972, 21, 10, 1972, 1, 1, 458758962, 'Pallet', 300),
(1973, 21, 10, 1973, 1, 1, 458758962, 'Pallet', 300),
(1974, 21, 10, 1974, 1, 1, 458758962, 'Pallet', 300);
INSERT INTO `tp_package_pallet` (`id`, `lot_id`, `product_id`, `case_id`, `dimensions_id`, `pallet_images_id`, `package_pallet_sn`, `package_type`, `inner_package_count`) VALUES
(1975, 21, 10, 1975, 1, 1, 458758962, 'Pallet', 300),
(1976, 21, 10, 1976, 1, 1, 458758962, 'Pallet', 300),
(1977, 21, 10, 1977, 1, 1, 458758962, 'Pallet', 300),
(1978, 21, 10, 1978, 1, 1, 458758962, 'Pallet', 300),
(1979, 21, 10, 1979, 1, 1, 458758962, 'Pallet', 300),
(1980, 21, 10, 1980, 1, 1, 458758962, 'Pallet', 300),
(1981, 21, 10, 1981, 1, 1, 458758962, 'Pallet', 300),
(1982, 21, 10, 1982, 1, 1, 458758962, 'Pallet', 300),
(1983, 21, 10, 1983, 1, 1, 458758962, 'Pallet', 300),
(1984, 21, 10, 1984, 1, 1, 458758962, 'Pallet', 300),
(1985, 21, 10, 1985, 1, 1, 458758962, 'Pallet', 300),
(1986, 21, 10, 1986, 1, 1, 458758962, 'Pallet', 300),
(1987, 21, 10, 1987, 1, 1, 458758962, 'Pallet', 300),
(1988, 21, 10, 1988, 1, 1, 458758962, 'Pallet', 300),
(1989, 21, 10, 1989, 1, 1, 458758962, 'Pallet', 300),
(1990, 21, 10, 1990, 1, 1, 458758962, 'Pallet', 300),
(1991, 21, 10, 1991, 1, 1, 458758962, 'Pallet', 300),
(1992, 21, 10, 1992, 1, 1, 458758962, 'Pallet', 300),
(1993, 21, 10, 1993, 1, 1, 458758962, 'Pallet', 300),
(1994, 21, 10, 1994, 1, 1, 458758962, 'Pallet', 300),
(1995, 21, 10, 1995, 1, 1, 458758962, 'Pallet', 300),
(1996, 21, 10, 1996, 1, 1, 458758962, 'Pallet', 300),
(1997, 21, 10, 1997, 1, 1, 458758962, 'Pallet', 300),
(1998, 21, 10, 1998, 1, 1, 458758962, 'Pallet', 300),
(1999, 21, 10, 1999, 1, 1, 458758962, 'Pallet', 300),
(2000, 21, 10, 2000, 1, 1, 458758962, 'Pallet', 300),
(2001, 21, 10, 2001, 1, 1, 458758962, 'Pallet', 300),
(2002, 21, 10, 2002, 1, 1, 458758962, 'Pallet', 300),
(2003, 21, 10, 2003, 1, 1, 458758962, 'Pallet', 300),
(2004, 21, 10, 2004, 1, 1, 458758962, 'Pallet', 300),
(2005, 21, 10, 2005, 1, 1, 458758962, 'Pallet', 300),
(2006, 21, 10, 2006, 1, 1, 458758962, 'Pallet', 300),
(2007, 21, 10, 2007, 1, 1, 458758962, 'Pallet', 300),
(2008, 21, 10, 2008, 1, 1, 458758962, 'Pallet', 300),
(2009, 21, 10, 2009, 1, 1, 458758962, 'Pallet', 300),
(2010, 21, 10, 2010, 1, 1, 458758962, 'Pallet', 300),
(2011, 21, 10, 2011, 1, 1, 458758962, 'Pallet', 300),
(2012, 21, 10, 2012, 1, 1, 458758962, 'Pallet', 300),
(2013, 21, 10, 2013, 1, 1, 458758962, 'Pallet', 300),
(2014, 21, 10, 2014, 1, 1, 458758962, 'Pallet', 300),
(2015, 21, 10, 2015, 1, 1, 458758962, 'Pallet', 300),
(2016, 21, 10, 2016, 1, 1, 458758962, 'Pallet', 300),
(2017, 21, 10, 2017, 1, 1, 458758962, 'Pallet', 300),
(2018, 21, 10, 2018, 1, 1, 458758962, 'Pallet', 300),
(2019, 21, 10, 2019, 1, 1, 458758962, 'Pallet', 300),
(2020, 21, 10, 2020, 1, 1, 458758962, 'Pallet', 300),
(2021, 21, 10, 2021, 1, 1, 458758962, 'Pallet', 300),
(2022, 21, 10, 2022, 1, 1, 458758962, 'Pallet', 300),
(2023, 21, 10, 2023, 1, 1, 458758962, 'Pallet', 300),
(2024, 21, 10, 2024, 1, 1, 458758962, 'Pallet', 300),
(2025, 21, 10, 2025, 1, 1, 458758962, 'Pallet', 300),
(2026, 21, 10, 2026, 1, 1, 458758962, 'Pallet', 300),
(2027, 21, 10, 2027, 1, 1, 458758962, 'Pallet', 300),
(2028, 21, 10, 2028, 1, 1, 458758962, 'Pallet', 300),
(2029, 21, 10, 2029, 1, 1, 458758962, 'Pallet', 300),
(2030, 21, 10, 2030, 1, 1, 458758962, 'Pallet', 300),
(2031, 21, 10, 2031, 1, 1, 458758962, 'Pallet', 300),
(2032, 21, 10, 2032, 1, 1, 458758962, 'Pallet', 300),
(2033, 21, 10, 2033, 1, 1, 458758962, 'Pallet', 300),
(2034, 21, 10, 2034, 1, 1, 458758962, 'Pallet', 300),
(2035, 21, 10, 2035, 1, 1, 458758962, 'Pallet', 300),
(2036, 21, 10, 2036, 1, 1, 458758962, 'Pallet', 300),
(2037, 21, 10, 2037, 1, 1, 458758962, 'Pallet', 300),
(2038, 21, 10, 2038, 1, 1, 458758962, 'Pallet', 300),
(2039, 21, 10, 2039, 1, 1, 458758962, 'Pallet', 300),
(2040, 21, 10, 2040, 1, 1, 458758962, 'Pallet', 300),
(2041, 21, 10, 2041, 1, 1, 458758962, 'Pallet', 300),
(2042, 21, 10, 2042, 1, 1, 458758962, 'Pallet', 300),
(2043, 21, 10, 2043, 1, 1, 458758962, 'Pallet', 300),
(2044, 21, 10, 2044, 1, 1, 458758962, 'Pallet', 300),
(2045, 21, 10, 2045, 1, 1, 458758962, 'Pallet', 300),
(2046, 21, 10, 2046, 1, 1, 458758962, 'Pallet', 300),
(2047, 21, 10, 2047, 1, 1, 458758962, 'Pallet', 300),
(2048, 21, 10, 2048, 1, 1, 458758962, 'Pallet', 300),
(2049, 21, 10, 2049, 1, 1, 458758962, 'Pallet', 300),
(2050, 21, 10, 2050, 1, 1, 458758962, 'Pallet', 300),
(2051, 21, 10, 2051, 1, 1, 458758962, 'Pallet', 300),
(2052, 21, 10, 2052, 1, 1, 458758962, 'Pallet', 300),
(2053, 21, 10, 2053, 1, 1, 458758962, 'Pallet', 300),
(2054, 21, 10, 2054, 1, 1, 458758962, 'Pallet', 300),
(2055, 21, 10, 2055, 1, 1, 458758962, 'Pallet', 300),
(2056, 21, 10, 2056, 1, 1, 458758962, 'Pallet', 300),
(2057, 21, 10, 2057, 1, 1, 458758962, 'Pallet', 300),
(2058, 21, 10, 2058, 1, 1, 458758962, 'Pallet', 300),
(2059, 21, 10, 2059, 1, 1, 458758962, 'Pallet', 300),
(2060, 21, 10, 2060, 1, 1, 458758962, 'Pallet', 300),
(2061, 21, 10, 2061, 1, 1, 458758962, 'Pallet', 300),
(2062, 21, 10, 2062, 1, 1, 458758962, 'Pallet', 300),
(2063, 21, 10, 2063, 1, 1, 458758962, 'Pallet', 300),
(2064, 21, 10, 2064, 1, 1, 458758962, 'Pallet', 300),
(2065, 21, 10, 2065, 1, 1, 458758962, 'Pallet', 300),
(2066, 21, 10, 2066, 1, 1, 458758962, 'Pallet', 300),
(2067, 21, 10, 2067, 1, 1, 458758962, 'Pallet', 300),
(2068, 21, 10, 2068, 1, 1, 458758962, 'Pallet', 300),
(2069, 21, 10, 2069, 1, 1, 458758962, 'Pallet', 300),
(2070, 21, 10, 2070, 1, 1, 458758962, 'Pallet', 300),
(2071, 21, 10, 2071, 1, 1, 458758962, 'Pallet', 300),
(2072, 21, 10, 2072, 1, 1, 458758962, 'Pallet', 300),
(2073, 21, 10, 2073, 1, 1, 458758962, 'Pallet', 300),
(2074, 21, 10, 2074, 1, 1, 458758962, 'Pallet', 300),
(2075, 21, 10, 2075, 1, 1, 458758962, 'Pallet', 300),
(2076, 21, 10, 2076, 1, 1, 458758962, 'Pallet', 300),
(2077, 21, 10, 2077, 1, 1, 458758962, 'Pallet', 300),
(2078, 21, 10, 2078, 1, 1, 458758962, 'Pallet', 300),
(2079, 21, 10, 2079, 1, 1, 458758962, 'Pallet', 300),
(2080, 21, 10, 2080, 1, 1, 458758962, 'Pallet', 300),
(2081, 21, 10, 2081, 1, 1, 458758962, 'Pallet', 300),
(2082, 21, 10, 2082, 1, 1, 458758962, 'Pallet', 300),
(2083, 21, 10, 2083, 1, 1, 458758962, 'Pallet', 300),
(2084, 21, 10, 2084, 1, 1, 458758962, 'Pallet', 300),
(2085, 21, 10, 2085, 1, 1, 458758962, 'Pallet', 300),
(2086, 21, 10, 2086, 1, 1, 458758962, 'Pallet', 300),
(2087, 21, 10, 2087, 1, 1, 458758962, 'Pallet', 300),
(2088, 21, 10, 2088, 1, 1, 458758962, 'Pallet', 300),
(2089, 21, 10, 2089, 1, 1, 458758962, 'Pallet', 300),
(2090, 21, 10, 2090, 1, 1, 458758962, 'Pallet', 300),
(2091, 21, 10, 2091, 1, 1, 458758962, 'Pallet', 300),
(2092, 21, 10, 2092, 1, 1, 458758962, 'Pallet', 300),
(2093, 21, 10, 2093, 1, 1, 458758962, 'Pallet', 300),
(2094, 21, 10, 2094, 1, 1, 458758962, 'Pallet', 300),
(2095, 21, 10, 2095, 1, 1, 458758962, 'Pallet', 300),
(2096, 21, 10, 2096, 1, 1, 458758962, 'Pallet', 300),
(2097, 21, 10, 2097, 1, 1, 458758962, 'Pallet', 300),
(2098, 21, 10, 2098, 1, 1, 458758962, 'Pallet', 300),
(2099, 21, 10, 2099, 1, 1, 458758962, 'Pallet', 300),
(2100, 21, 10, 2100, 1, 1, 458758962, 'Pallet', 300),
(2101, 21, 10, 2101, 1, 1, 458758962, 'Pallet', 300),
(2102, 21, 10, 2102, 1, 1, 458758962, 'Pallet', 300),
(2103, 21, 10, 2103, 1, 1, 458758962, 'Pallet', 300),
(2104, 21, 10, 2104, 1, 1, 458758962, 'Pallet', 300),
(2105, 21, 10, 2105, 1, 1, 458758962, 'Pallet', 300),
(2106, 21, 10, 2106, 1, 1, 458758962, 'Pallet', 300),
(2107, 21, 10, 2107, 1, 1, 458758962, 'Pallet', 300),
(2108, 21, 10, 2108, 1, 1, 458758962, 'Pallet', 300),
(2109, 21, 10, 2109, 1, 1, 458758962, 'Pallet', 300),
(2110, 21, 10, 2110, 1, 1, 458758962, 'Pallet', 300),
(2111, 21, 10, 2111, 1, 1, 458758962, 'Pallet', 300),
(2112, 21, 10, 2112, 1, 1, 458758962, 'Pallet', 300),
(2113, 21, 10, 2113, 1, 1, 458758962, 'Pallet', 300),
(2114, 21, 10, 2114, 1, 1, 458758962, 'Pallet', 300),
(2115, 21, 10, 2115, 1, 1, 458758962, 'Pallet', 300),
(2116, 21, 10, 2116, 1, 1, 458758962, 'Pallet', 300),
(2117, 21, 10, 2117, 1, 1, 458758962, 'Pallet', 300),
(2118, 21, 10, 2118, 1, 1, 458758962, 'Pallet', 300),
(2119, 21, 10, 2119, 1, 1, 458758962, 'Pallet', 300),
(2120, 21, 10, 2120, 1, 1, 458758962, 'Pallet', 300),
(2121, 21, 10, 2121, 1, 1, 458758962, 'Pallet', 300),
(2122, 21, 10, 2122, 1, 1, 458758962, 'Pallet', 300),
(2123, 21, 10, 2123, 1, 1, 458758962, 'Pallet', 300),
(2124, 21, 10, 2124, 1, 1, 458758962, 'Pallet', 300),
(2125, 21, 10, 2125, 1, 1, 458758962, 'Pallet', 300),
(2126, 21, 10, 2126, 1, 1, 458758962, 'Pallet', 300),
(2127, 21, 10, 2127, 1, 1, 458758962, 'Pallet', 300),
(2128, 21, 10, 2128, 1, 1, 458758962, 'Pallet', 300),
(2129, 21, 10, 2129, 1, 1, 458758962, 'Pallet', 300),
(2130, 21, 10, 2130, 1, 1, 458758962, 'Pallet', 300),
(2131, 21, 10, 2131, 1, 1, 458758962, 'Pallet', 300),
(2132, 21, 10, 2132, 1, 1, 458758962, 'Pallet', 300),
(2133, 21, 10, 2133, 1, 1, 458758962, 'Pallet', 300),
(2134, 21, 10, 2134, 1, 1, 458758962, 'Pallet', 300),
(2135, 21, 10, 2135, 1, 1, 458758962, 'Pallet', 300),
(2136, 21, 10, 2136, 1, 1, 458758962, 'Pallet', 300),
(2137, 21, 10, 2137, 1, 1, 458758962, 'Pallet', 300),
(2138, 21, 10, 2138, 1, 1, 458758962, 'Pallet', 300),
(2139, 21, 10, 2139, 1, 1, 458758962, 'Pallet', 300),
(2140, 21, 10, 2140, 1, 1, 458758962, 'Pallet', 300),
(2141, 21, 10, 2141, 1, 1, 458758962, 'Pallet', 300),
(2142, 21, 10, 2142, 1, 1, 458758962, 'Pallet', 300),
(2143, 21, 10, 2143, 1, 1, 458758962, 'Pallet', 300),
(2144, 21, 10, 2144, 1, 1, 458758962, 'Pallet', 300),
(2145, 21, 10, 2145, 1, 1, 458758962, 'Pallet', 300),
(2146, 21, 10, 2146, 1, 1, 458758962, 'Pallet', 300),
(2147, 21, 10, 2147, 1, 1, 458758962, 'Pallet', 300),
(2148, 21, 10, 2148, 1, 1, 458758962, 'Pallet', 300),
(2149, 21, 10, 2149, 1, 1, 458758962, 'Pallet', 300),
(2150, 21, 10, 2150, 1, 1, 458758962, 'Pallet', 300),
(2151, 21, 10, 2151, 1, 1, 458758962, 'Pallet', 300),
(2152, 21, 10, 2152, 1, 1, 458758962, 'Pallet', 300),
(2153, 21, 10, 2153, 1, 1, 458758962, 'Pallet', 300),
(2154, 21, 10, 2154, 1, 1, 458758962, 'Pallet', 300),
(2155, 21, 10, 2155, 1, 1, 458758962, 'Pallet', 300),
(2156, 21, 10, 2156, 1, 1, 458758962, 'Pallet', 300),
(2157, 21, 10, 2157, 1, 1, 458758962, 'Pallet', 300),
(2158, 21, 10, 2158, 1, 1, 458758962, 'Pallet', 300),
(2159, 21, 10, 2159, 1, 1, 458758962, 'Pallet', 300),
(2160, 21, 10, 2160, 1, 1, 458758962, 'Pallet', 300),
(2161, 21, 10, 2161, 1, 1, 458758962, 'Pallet', 300),
(2162, 21, 10, 2162, 1, 1, 458758962, 'Pallet', 300),
(2163, 21, 10, 2163, 1, 1, 458758962, 'Pallet', 300),
(2164, 21, 10, 2164, 1, 1, 458758962, 'Pallet', 300),
(2165, 21, 10, 2165, 1, 1, 458758962, 'Pallet', 300),
(2166, 21, 10, 2166, 1, 1, 458758962, 'Pallet', 300),
(2167, 21, 10, 2167, 1, 1, 458758962, 'Pallet', 300),
(2168, 21, 10, 2168, 1, 1, 458758962, 'Pallet', 300),
(2169, 21, 10, 2169, 1, 1, 458758962, 'Pallet', 300),
(2170, 21, 10, 2170, 1, 1, 458758962, 'Pallet', 300),
(2171, 21, 10, 2171, 1, 1, 458758962, 'Pallet', 300),
(2172, 21, 10, 2172, 1, 1, 458758962, 'Pallet', 300),
(2173, 21, 10, 2173, 1, 1, 458758962, 'Pallet', 300),
(2174, 21, 10, 2174, 1, 1, 458758962, 'Pallet', 300),
(2175, 21, 10, 2175, 1, 1, 458758962, 'Pallet', 300),
(2176, 21, 10, 2176, 1, 1, 458758962, 'Pallet', 300),
(2177, 21, 10, 2177, 1, 1, 458758962, 'Pallet', 300),
(2178, 21, 10, 2178, 1, 1, 458758962, 'Pallet', 300),
(2179, 21, 10, 2179, 1, 1, 458758962, 'Pallet', 300),
(2180, 21, 10, 2180, 1, 1, 458758962, 'Pallet', 300),
(2181, 21, 10, 2181, 1, 1, 458758962, 'Pallet', 300),
(2182, 21, 10, 2182, 1, 1, 458758962, 'Pallet', 300),
(2183, 21, 10, 2183, 1, 1, 458758962, 'Pallet', 300),
(2184, 21, 10, 2184, 1, 1, 458758962, 'Pallet', 300),
(2185, 21, 10, 2185, 1, 1, 458758962, 'Pallet', 300),
(2186, 21, 10, 2186, 1, 1, 458758962, 'Pallet', 300),
(2187, 21, 10, 2187, 1, 1, 458758962, 'Pallet', 300),
(2188, 21, 10, 2188, 1, 1, 458758962, 'Pallet', 300),
(2189, 21, 10, 2189, 1, 1, 458758962, 'Pallet', 300),
(2190, 21, 10, 2190, 1, 1, 458758962, 'Pallet', 300),
(2191, 21, 10, 2191, 1, 1, 458758962, 'Pallet', 300),
(2192, 21, 10, 2192, 1, 1, 458758962, 'Pallet', 300),
(2193, 21, 10, 2193, 1, 1, 458758962, 'Pallet', 300),
(2194, 21, 10, 2194, 1, 1, 458758962, 'Pallet', 300),
(2195, 21, 10, 2195, 1, 1, 458758962, 'Pallet', 300),
(2196, 21, 10, 2196, 1, 1, 458758962, 'Pallet', 300),
(2197, 21, 10, 2197, 1, 1, 458758962, 'Pallet', 300),
(2198, 21, 10, 2198, 1, 1, 458758962, 'Pallet', 300),
(2199, 21, 10, 2199, 1, 1, 458758962, 'Pallet', 300),
(2200, 21, 10, 2200, 1, 1, 458758962, 'Pallet', 300),
(2201, 21, 10, 2201, 1, 1, 458758962, 'Pallet', 300),
(2202, 21, 10, 2202, 1, 1, 458758962, 'Pallet', 300),
(2203, 21, 10, 2203, 1, 1, 458758962, 'Pallet', 300),
(2204, 21, 10, 2204, 1, 1, 458758962, 'Pallet', 300),
(2205, 21, 10, 2205, 1, 1, 458758962, 'Pallet', 300),
(2206, 21, 10, 2206, 1, 1, 458758962, 'Pallet', 300),
(2207, 21, 10, 2207, 1, 1, 458758962, 'Pallet', 300),
(2208, 21, 10, 2208, 1, 1, 458758962, 'Pallet', 300),
(2209, 21, 10, 2209, 1, 1, 458758962, 'Pallet', 300),
(2210, 21, 10, 2210, 1, 1, 458758962, 'Pallet', 300),
(2211, 21, 10, 2211, 1, 1, 458758962, 'Pallet', 300),
(2212, 21, 10, 2212, 1, 1, 458758962, 'Pallet', 300),
(2213, 21, 10, 2213, 1, 1, 458758962, 'Pallet', 300),
(2214, 21, 10, 2214, 1, 1, 458758962, 'Pallet', 300),
(2215, 21, 10, 2215, 1, 1, 458758962, 'Pallet', 300),
(2216, 21, 10, 2216, 1, 1, 458758962, 'Pallet', 300),
(2217, 21, 10, 2217, 1, 1, 458758962, 'Pallet', 300),
(2218, 21, 10, 2218, 1, 1, 458758962, 'Pallet', 300),
(2219, 21, 10, 2219, 1, 1, 458758962, 'Pallet', 300),
(2220, 21, 10, 2220, 1, 1, 458758962, 'Pallet', 300),
(2221, 21, 10, 2221, 1, 1, 458758962, 'Pallet', 300),
(2222, 21, 10, 2222, 1, 1, 458758962, 'Pallet', 300),
(2223, 21, 10, 2223, 1, 1, 458758962, 'Pallet', 300),
(2224, 21, 10, 2224, 1, 1, 458758962, 'Pallet', 300),
(2225, 21, 10, 2225, 1, 1, 458758962, 'Pallet', 300),
(2226, 21, 10, 2226, 1, 1, 458758962, 'Pallet', 300),
(2227, 21, 10, 2227, 1, 1, 458758962, 'Pallet', 300),
(2228, 21, 10, 2228, 1, 1, 458758962, 'Pallet', 300),
(2229, 21, 10, 2229, 1, 1, 458758962, 'Pallet', 300),
(2230, 21, 10, 2230, 1, 1, 458758962, 'Pallet', 300),
(2231, 21, 10, 2231, 1, 1, 458758962, 'Pallet', 300),
(2232, 21, 10, 2232, 1, 1, 458758962, 'Pallet', 300),
(2233, 21, 10, 2233, 1, 1, 458758962, 'Pallet', 300),
(2234, 21, 10, 2234, 1, 1, 458758962, 'Pallet', 300),
(2235, 21, 10, 2235, 1, 1, 458758962, 'Pallet', 300),
(2236, 21, 10, 2236, 1, 1, 458758962, 'Pallet', 300),
(2237, 21, 10, 2237, 1, 1, 458758962, 'Pallet', 300),
(2238, 21, 10, 2238, 1, 1, 458758962, 'Pallet', 300),
(2239, 21, 10, 2239, 1, 1, 458758962, 'Pallet', 300),
(2240, 21, 10, 2240, 1, 1, 458758962, 'Pallet', 300),
(2241, 21, 10, 2241, 1, 1, 458758962, 'Pallet', 300),
(2242, 21, 10, 2242, 1, 1, 458758962, 'Pallet', 300),
(2243, 21, 10, 2243, 1, 1, 458758962, 'Pallet', 300),
(2244, 21, 10, 2244, 1, 1, 458758962, 'Pallet', 300),
(2245, 21, 10, 2245, 1, 1, 458758962, 'Pallet', 300),
(2246, 21, 10, 2246, 1, 1, 458758962, 'Pallet', 300),
(2247, 21, 10, 2247, 1, 1, 458758962, 'Pallet', 300),
(2248, 21, 10, 2248, 1, 1, 458758962, 'Pallet', 300),
(2249, 21, 10, 2249, 1, 1, 458758962, 'Pallet', 300),
(2250, 21, 10, 2250, 1, 1, 458758962, 'Pallet', 300),
(2251, 21, 10, 2251, 1, 1, 458758962, 'Pallet', 300),
(2252, 21, 10, 2252, 1, 1, 458758962, 'Pallet', 300),
(2253, 21, 10, 2253, 1, 1, 458758962, 'Pallet', 300),
(2254, 21, 10, 2254, 1, 1, 458758962, 'Pallet', 300),
(2255, 21, 10, 2255, 1, 1, 458758962, 'Pallet', 300),
(2256, 21, 10, 2256, 1, 1, 458758962, 'Pallet', 300),
(2257, 21, 10, 2257, 1, 1, 458758962, 'Pallet', 300),
(2258, 21, 10, 2258, 1, 1, 458758962, 'Pallet', 300),
(2259, 21, 10, 2259, 1, 1, 458758962, 'Pallet', 300),
(2260, 21, 10, 2260, 1, 1, 458758962, 'Pallet', 300),
(2261, 21, 10, 2261, 1, 1, 458758962, 'Pallet', 300),
(2262, 21, 10, 2262, 1, 1, 458758962, 'Pallet', 300),
(2263, 21, 10, 2263, 1, 1, 458758962, 'Pallet', 300),
(2264, 21, 10, 2264, 1, 1, 458758962, 'Pallet', 300),
(2265, 21, 10, 2265, 1, 1, 458758962, 'Pallet', 300),
(2266, 21, 10, 2266, 1, 1, 458758962, 'Pallet', 300),
(2267, 21, 10, 2267, 1, 1, 458758962, 'Pallet', 300),
(2268, 21, 10, 2268, 1, 1, 458758962, 'Pallet', 300),
(2269, 21, 10, 2269, 1, 1, 458758962, 'Pallet', 300),
(2270, 21, 10, 2270, 1, 1, 458758962, 'Pallet', 300),
(2271, 21, 10, 2271, 1, 1, 458758962, 'Pallet', 300),
(2272, 21, 10, 2272, 1, 1, 458758962, 'Pallet', 300),
(2273, 21, 10, 2273, 1, 1, 458758962, 'Pallet', 300),
(2274, 21, 10, 2274, 1, 1, 458758962, 'Pallet', 300),
(2275, 21, 10, 2275, 1, 1, 458758962, 'Pallet', 300),
(2276, 21, 10, 2276, 1, 1, 458758962, 'Pallet', 300),
(2277, 21, 10, 2277, 1, 1, 458758962, 'Pallet', 300),
(2278, 21, 10, 2278, 1, 1, 458758962, 'Pallet', 300),
(2279, 21, 10, 2279, 1, 1, 458758962, 'Pallet', 300),
(2280, 21, 10, 2280, 1, 1, 458758962, 'Pallet', 300),
(2281, 21, 10, 2281, 1, 1, 458758962, 'Pallet', 300),
(2282, 21, 10, 2282, 1, 1, 458758962, 'Pallet', 300),
(2283, 21, 10, 2283, 1, 1, 458758962, 'Pallet', 300),
(2284, 21, 10, 2284, 1, 1, 458758962, 'Pallet', 300),
(2285, 21, 10, 2285, 1, 1, 458758962, 'Pallet', 300),
(2286, 21, 10, 2286, 1, 1, 458758962, 'Pallet', 300),
(2287, 21, 10, 2287, 1, 1, 458758962, 'Pallet', 300),
(2288, 21, 10, 2288, 1, 1, 458758962, 'Pallet', 300),
(2289, 21, 10, 2289, 1, 1, 458758962, 'Pallet', 300),
(2290, 21, 10, 2290, 1, 1, 458758962, 'Pallet', 300),
(2291, 21, 10, 2291, 1, 1, 458758962, 'Pallet', 300),
(2292, 21, 10, 2292, 1, 1, 458758962, 'Pallet', 300),
(2293, 21, 10, 2293, 1, 1, 458758962, 'Pallet', 300),
(2294, 21, 10, 2294, 1, 1, 458758962, 'Pallet', 300),
(2295, 21, 10, 2295, 1, 1, 458758962, 'Pallet', 300),
(2296, 21, 10, 2296, 1, 1, 458758962, 'Pallet', 300),
(2297, 21, 10, 2297, 1, 1, 458758962, 'Pallet', 300),
(2298, 21, 10, 2298, 1, 1, 458758962, 'Pallet', 300),
(2299, 21, 10, 2299, 1, 1, 458758962, 'Pallet', 300),
(2300, 21, 10, 2300, 1, 1, 458758962, 'Pallet', 300),
(2301, 21, 10, 2301, 1, 1, 458758962, 'Pallet', 300),
(2302, 21, 10, 2302, 1, 1, 458758962, 'Pallet', 300),
(2303, 21, 10, 2303, 1, 1, 458758962, 'Pallet', 300),
(2304, 21, 10, 2304, 1, 1, 458758962, 'Pallet', 300),
(2305, 21, 10, 2305, 1, 1, 458758962, 'Pallet', 300),
(2306, 21, 10, 2306, 1, 1, 458758962, 'Pallet', 300),
(2307, 21, 10, 2307, 1, 1, 458758962, 'Pallet', 300),
(2308, 21, 10, 2308, 1, 1, 458758962, 'Pallet', 300),
(2309, 21, 10, 2309, 1, 1, 458758962, 'Pallet', 300),
(2310, 21, 10, 2310, 1, 1, 458758962, 'Pallet', 300),
(2311, 21, 10, 2311, 1, 1, 458758962, 'Pallet', 300),
(2312, 21, 10, 2312, 1, 1, 458758962, 'Pallet', 300),
(2313, 21, 10, 2313, 1, 1, 458758962, 'Pallet', 300),
(2314, 21, 10, 2314, 1, 1, 458758962, 'Pallet', 300),
(2315, 21, 10, 2315, 1, 1, 458758962, 'Pallet', 300),
(2316, 21, 10, 2316, 1, 1, 458758962, 'Pallet', 300),
(2317, 21, 10, 2317, 1, 1, 458758962, 'Pallet', 300),
(2318, 21, 10, 2318, 1, 1, 458758962, 'Pallet', 300),
(2319, 21, 10, 2319, 1, 1, 458758962, 'Pallet', 300),
(2320, 21, 10, 2320, 1, 1, 458758962, 'Pallet', 300),
(2321, 21, 10, 2321, 1, 1, 458758962, 'Pallet', 300),
(2322, 21, 10, 2322, 1, 1, 458758962, 'Pallet', 300),
(2323, 21, 10, 2323, 1, 1, 458758962, 'Pallet', 300),
(2324, 21, 10, 2324, 1, 1, 458758962, 'Pallet', 300),
(2325, 21, 10, 2325, 1, 1, 458758962, 'Pallet', 300),
(2326, 21, 10, 2326, 1, 1, 458758962, 'Pallet', 300),
(2327, 21, 10, 2327, 1, 1, 458758962, 'Pallet', 300),
(2328, 21, 10, 2328, 1, 1, 458758962, 'Pallet', 300),
(2329, 21, 10, 2329, 1, 1, 458758962, 'Pallet', 300),
(2330, 21, 10, 2330, 1, 1, 458758962, 'Pallet', 300),
(2331, 21, 10, 2331, 1, 1, 458758962, 'Pallet', 300),
(2332, 21, 10, 2332, 1, 1, 458758962, 'Pallet', 300),
(2333, 21, 10, 2333, 1, 1, 458758962, 'Pallet', 300),
(2334, 21, 10, 2334, 1, 1, 458758962, 'Pallet', 300),
(2335, 21, 10, 2335, 1, 1, 458758962, 'Pallet', 300),
(2336, 21, 10, 2336, 1, 1, 458758962, 'Pallet', 300),
(2337, 21, 10, 2337, 1, 1, 458758962, 'Pallet', 300),
(2338, 21, 10, 2338, 1, 1, 458758962, 'Pallet', 300),
(2339, 21, 10, 2339, 1, 1, 458758962, 'Pallet', 300),
(2340, 21, 10, 2340, 1, 1, 458758962, 'Pallet', 300),
(2341, 21, 10, 2341, 1, 1, 458758962, 'Pallet', 300),
(2342, 21, 10, 2342, 1, 1, 458758962, 'Pallet', 300),
(2343, 21, 10, 2343, 1, 1, 458758962, 'Pallet', 300),
(2344, 21, 10, 2344, 1, 1, 458758962, 'Pallet', 300),
(2345, 21, 10, 2345, 1, 1, 458758962, 'Pallet', 300),
(2346, 21, 10, 2346, 1, 1, 458758962, 'Pallet', 300),
(2347, 21, 10, 2347, 1, 1, 458758962, 'Pallet', 300),
(2348, 21, 10, 2348, 1, 1, 458758962, 'Pallet', 300),
(2349, 21, 10, 2349, 1, 1, 458758962, 'Pallet', 300),
(2350, 21, 10, 2350, 1, 1, 458758962, 'Pallet', 300),
(2351, 21, 10, 2351, 1, 1, 458758962, 'Pallet', 300),
(2352, 21, 10, 2352, 1, 1, 458758962, 'Pallet', 300),
(2353, 21, 10, 2353, 1, 1, 458758962, 'Pallet', 300),
(2354, 21, 10, 2354, 1, 1, 458758962, 'Pallet', 300),
(2355, 21, 10, 2355, 1, 1, 458758962, 'Pallet', 300),
(2356, 21, 10, 2356, 1, 1, 458758962, 'Pallet', 300),
(2357, 21, 10, 2357, 1, 1, 458758962, 'Pallet', 300),
(2358, 21, 10, 2358, 1, 1, 458758962, 'Pallet', 300),
(2359, 21, 10, 2359, 1, 1, 458758962, 'Pallet', 300),
(2360, 21, 10, 2360, 1, 1, 458758962, 'Pallet', 300),
(2361, 21, 10, 2361, 1, 1, 458758962, 'Pallet', 300),
(2362, 21, 10, 2362, 1, 1, 458758962, 'Pallet', 300),
(2363, 21, 10, 2363, 1, 1, 458758962, 'Pallet', 300),
(2364, 21, 10, 2364, 1, 1, 458758962, 'Pallet', 300),
(2365, 21, 10, 2365, 1, 1, 458758962, 'Pallet', 300),
(2366, 21, 10, 2366, 1, 1, 458758962, 'Pallet', 300),
(2367, 21, 10, 2367, 1, 1, 458758962, 'Pallet', 300),
(2368, 21, 10, 2368, 1, 1, 458758962, 'Pallet', 300),
(2369, 21, 10, 2369, 1, 1, 458758962, 'Pallet', 300),
(2370, 21, 10, 2370, 1, 1, 458758962, 'Pallet', 300),
(2371, 21, 10, 2371, 1, 1, 458758962, 'Pallet', 300),
(2372, 21, 10, 2372, 1, 1, 458758962, 'Pallet', 300),
(2373, 21, 10, 2373, 1, 1, 458758962, 'Pallet', 300),
(2374, 21, 10, 2374, 1, 1, 458758962, 'Pallet', 300),
(2375, 21, 10, 2375, 1, 1, 458758962, 'Pallet', 300),
(2376, 21, 10, 2376, 1, 1, 458758962, 'Pallet', 300),
(2377, 21, 10, 2377, 1, 1, 458758962, 'Pallet', 300),
(2378, 21, 10, 2378, 1, 1, 458758962, 'Pallet', 300),
(2379, 21, 10, 2379, 1, 1, 458758962, 'Pallet', 300),
(2380, 21, 10, 2380, 1, 1, 458758962, 'Pallet', 300),
(2381, 21, 10, 2381, 1, 1, 458758962, 'Pallet', 300),
(2382, 21, 10, 2382, 1, 1, 458758962, 'Pallet', 300),
(2383, 21, 10, 2383, 1, 1, 458758962, 'Pallet', 300),
(2384, 21, 10, 2384, 1, 1, 458758962, 'Pallet', 300),
(2385, 21, 10, 2385, 1, 1, 458758962, 'Pallet', 300),
(2386, 21, 10, 2386, 1, 1, 458758962, 'Pallet', 300),
(2387, 21, 10, 2387, 1, 1, 458758962, 'Pallet', 300),
(2388, 21, 10, 2388, 1, 1, 458758962, 'Pallet', 300),
(2389, 21, 10, 2389, 1, 1, 458758962, 'Pallet', 300),
(2390, 21, 10, 2390, 1, 1, 458758962, 'Pallet', 300),
(2391, 21, 10, 2391, 1, 1, 458758962, 'Pallet', 300),
(2392, 21, 10, 2392, 1, 1, 458758962, 'Pallet', 300),
(2393, 21, 10, 2393, 1, 1, 458758962, 'Pallet', 300),
(2394, 21, 10, 2394, 1, 1, 458758962, 'Pallet', 300),
(2395, 21, 10, 2395, 1, 1, 458758962, 'Pallet', 300),
(2396, 21, 10, 2396, 1, 1, 458758962, 'Pallet', 300),
(2397, 21, 10, 2397, 1, 1, 458758962, 'Pallet', 300),
(2398, 21, 10, 2398, 1, 1, 458758962, 'Pallet', 300),
(2399, 21, 10, 2399, 1, 1, 458758962, 'Pallet', 300),
(2400, 21, 10, 2400, 1, 1, 458758962, 'Pallet', 300),
(2401, 21, 10, 2401, 1, 1, 458758962, 'Pallet', 300),
(2402, 21, 10, 2402, 1, 1, 458758962, 'Pallet', 300),
(2403, 21, 10, 2403, 1, 1, 458758962, 'Pallet', 300),
(2404, 21, 10, 2404, 1, 1, 458758962, 'Pallet', 300),
(2405, 21, 10, 2405, 1, 1, 458758962, 'Pallet', 300),
(2406, 21, 10, 2406, 1, 1, 458758962, 'Pallet', 300),
(2407, 21, 10, 2407, 1, 1, 458758962, 'Pallet', 300),
(2408, 21, 10, 2408, 1, 1, 458758962, 'Pallet', 300),
(2409, 21, 10, 2409, 1, 1, 458758962, 'Pallet', 300),
(2410, 21, 10, 2410, 1, 1, 458758962, 'Pallet', 300),
(2411, 21, 10, 2411, 1, 1, 458758962, 'Pallet', 300),
(2412, 21, 10, 2412, 1, 1, 458758962, 'Pallet', 300),
(2413, 21, 10, 2413, 1, 1, 458758962, 'Pallet', 300),
(2414, 21, 10, 2414, 1, 1, 458758962, 'Pallet', 300),
(2415, 21, 10, 2415, 1, 1, 458758962, 'Pallet', 300),
(2416, 21, 10, 2416, 1, 1, 458758962, 'Pallet', 300),
(2417, 21, 10, 2417, 1, 1, 458758962, 'Pallet', 300),
(2418, 21, 10, 2418, 1, 1, 458758962, 'Pallet', 300),
(2419, 21, 10, 2419, 1, 1, 458758962, 'Pallet', 300),
(2420, 21, 10, 2420, 1, 1, 458758962, 'Pallet', 300),
(2421, 21, 10, 2421, 1, 1, 458758962, 'Pallet', 300),
(2422, 21, 10, 2422, 1, 1, 458758962, 'Pallet', 300),
(2423, 21, 10, 2423, 1, 1, 458758962, 'Pallet', 300),
(2424, 21, 10, 2424, 1, 1, 458758962, 'Pallet', 300),
(2425, 21, 10, 2425, 1, 1, 458758962, 'Pallet', 300),
(2426, 21, 10, 2426, 1, 1, 458758962, 'Pallet', 300),
(2427, 21, 10, 2427, 1, 1, 458758962, 'Pallet', 300),
(2428, 21, 10, 2428, 1, 1, 458758962, 'Pallet', 300),
(2429, 21, 10, 2429, 1, 1, 458758962, 'Pallet', 300),
(2430, 21, 10, 2430, 1, 1, 458758962, 'Pallet', 300),
(2431, 21, 10, 2431, 1, 1, 458758962, 'Pallet', 300),
(2432, 21, 10, 2432, 1, 1, 458758962, 'Pallet', 300),
(2433, 21, 10, 2433, 1, 1, 458758962, 'Pallet', 300),
(2434, 21, 10, 2434, 1, 1, 458758962, 'Pallet', 300),
(2435, 21, 10, 2435, 1, 1, 458758962, 'Pallet', 300),
(2436, 21, 10, 2436, 1, 1, 458758962, 'Pallet', 300),
(2437, 21, 10, 2437, 1, 1, 458758962, 'Pallet', 300),
(2438, 21, 10, 2438, 1, 1, 458758962, 'Pallet', 300),
(2439, 21, 10, 2439, 1, 1, 458758962, 'Pallet', 300),
(2440, 21, 10, 2440, 1, 1, 458758962, 'Pallet', 300),
(2441, 21, 10, 2441, 1, 1, 458758962, 'Pallet', 300),
(2442, 21, 10, 2442, 1, 1, 458758962, 'Pallet', 300),
(2443, 21, 10, 2443, 1, 1, 458758962, 'Pallet', 300),
(2444, 21, 10, 2444, 1, 1, 458758962, 'Pallet', 300),
(2445, 21, 10, 2445, 1, 1, 458758962, 'Pallet', 300),
(2446, 21, 10, 2446, 1, 1, 458758962, 'Pallet', 300),
(2447, 21, 10, 2447, 1, 1, 458758962, 'Pallet', 300),
(2448, 21, 10, 2448, 1, 1, 458758962, 'Pallet', 300),
(2449, 21, 10, 2449, 1, 1, 458758962, 'Pallet', 300),
(2450, 21, 10, 2450, 1, 1, 458758962, 'Pallet', 300),
(2451, 21, 10, 2451, 1, 1, 458758962, 'Pallet', 300),
(2452, 21, 10, 2452, 1, 1, 458758962, 'Pallet', 300),
(2453, 21, 10, 2453, 1, 1, 458758962, 'Pallet', 300),
(2454, 21, 10, 2454, 1, 1, 458758962, 'Pallet', 300),
(2455, 21, 10, 2455, 1, 1, 458758962, 'Pallet', 300),
(2456, 21, 10, 2456, 1, 1, 458758962, 'Pallet', 300),
(2457, 21, 10, 2457, 1, 1, 458758962, 'Pallet', 300),
(2458, 21, 10, 2458, 1, 1, 458758962, 'Pallet', 300),
(2459, 21, 10, 2459, 1, 1, 458758962, 'Pallet', 300),
(2460, 21, 10, 2460, 1, 1, 458758962, 'Pallet', 300),
(2461, 21, 10, 2461, 1, 1, 458758962, 'Pallet', 300),
(2462, 21, 10, 2462, 1, 1, 458758962, 'Pallet', 300),
(2463, 21, 10, 2463, 1, 1, 458758962, 'Pallet', 300),
(2464, 21, 10, 2464, 1, 1, 458758962, 'Pallet', 300),
(2465, 21, 10, 2465, 1, 1, 458758962, 'Pallet', 300),
(2466, 21, 10, 2466, 1, 1, 458758962, 'Pallet', 300),
(2467, 21, 10, 2467, 1, 1, 458758962, 'Pallet', 300),
(2468, 21, 10, 2468, 1, 1, 458758962, 'Pallet', 300),
(2469, 21, 10, 2469, 1, 1, 458758962, 'Pallet', 300),
(2470, 21, 10, 2470, 1, 1, 458758962, 'Pallet', 300),
(2471, 21, 10, 2471, 1, 1, 458758962, 'Pallet', 300),
(2472, 21, 10, 2472, 1, 1, 458758962, 'Pallet', 300),
(2473, 21, 10, 2473, 1, 1, 458758962, 'Pallet', 300),
(2474, 21, 10, 2474, 1, 1, 458758962, 'Pallet', 300),
(2475, 21, 10, 2475, 1, 1, 458758962, 'Pallet', 300),
(2476, 21, 10, 2476, 1, 1, 458758962, 'Pallet', 300),
(2477, 21, 10, 2477, 1, 1, 458758962, 'Pallet', 300),
(2478, 21, 10, 2478, 1, 1, 458758962, 'Pallet', 300),
(2479, 21, 10, 2479, 1, 1, 458758962, 'Pallet', 300),
(2480, 21, 10, 2480, 1, 1, 458758962, 'Pallet', 300),
(2481, 21, 10, 2481, 1, 1, 458758962, 'Pallet', 300),
(2482, 21, 10, 2482, 1, 1, 458758962, 'Pallet', 300),
(2483, 21, 10, 2483, 1, 1, 458758962, 'Pallet', 300),
(2484, 21, 10, 2484, 1, 1, 458758962, 'Pallet', 300),
(2485, 21, 10, 2485, 1, 1, 458758962, 'Pallet', 300),
(2486, 21, 10, 2486, 1, 1, 458758962, 'Pallet', 300),
(2487, 21, 10, 2487, 1, 1, 458758962, 'Pallet', 300),
(2488, 21, 10, 2488, 1, 1, 458758962, 'Pallet', 300),
(2489, 21, 10, 2489, 1, 1, 458758962, 'Pallet', 300),
(2490, 21, 10, 2490, 1, 1, 458758962, 'Pallet', 300),
(2491, 21, 10, 2491, 1, 1, 458758962, 'Pallet', 300),
(2492, 21, 10, 2492, 1, 1, 458758962, 'Pallet', 300),
(2493, 21, 10, 2493, 1, 1, 458758962, 'Pallet', 300),
(2494, 21, 10, 2494, 1, 1, 458758962, 'Pallet', 300),
(2495, 21, 10, 2495, 1, 1, 458758962, 'Pallet', 300),
(2496, 21, 10, 2496, 1, 1, 458758962, 'Pallet', 300),
(2497, 21, 10, 2497, 1, 1, 458758962, 'Pallet', 300),
(2498, 21, 10, 2498, 1, 1, 458758962, 'Pallet', 300),
(2499, 21, 10, 2499, 1, 1, 458758962, 'Pallet', 300),
(2500, 21, 10, 2500, 1, 1, 458758962, 'Pallet', 300),
(2501, 21, 10, 2501, 1, 1, 458758962, 'Pallet', 300),
(2502, 21, 10, 2502, 1, 1, 458758962, 'Pallet', 300),
(2503, 21, 10, 2503, 1, 1, 458758962, 'Pallet', 300),
(2504, 21, 10, 2504, 1, 1, 458758962, 'Pallet', 300),
(2505, 21, 10, 2505, 1, 1, 458758962, 'Pallet', 300),
(2506, 21, 10, 2506, 1, 1, 458758962, 'Pallet', 300),
(2507, 21, 10, 2507, 1, 1, 458758962, 'Pallet', 300),
(2508, 21, 10, 2508, 1, 1, 458758962, 'Pallet', 300),
(2509, 21, 10, 2509, 1, 1, 458758962, 'Pallet', 300),
(2510, 21, 10, 2510, 1, 1, 458758962, 'Pallet', 300),
(2511, 21, 10, 2511, 1, 1, 458758962, 'Pallet', 300),
(2512, 21, 10, 2512, 1, 1, 458758962, 'Pallet', 300),
(2513, 21, 10, 2513, 1, 1, 458758962, 'Pallet', 300),
(2514, 21, 10, 2514, 1, 1, 458758962, 'Pallet', 300),
(2515, 21, 10, 2515, 1, 1, 458758962, 'Pallet', 300),
(2516, 21, 10, 2516, 1, 1, 458758962, 'Pallet', 300),
(2517, 21, 10, 2517, 1, 1, 458758962, 'Pallet', 300),
(2518, 21, 10, 2518, 1, 1, 458758962, 'Pallet', 300),
(2519, 21, 10, 2519, 1, 1, 458758962, 'Pallet', 300),
(2520, 21, 10, 2520, 1, 1, 458758962, 'Pallet', 300),
(2521, 21, 10, 2521, 1, 1, 458758962, 'Pallet', 300),
(2522, 21, 10, 2522, 1, 1, 458758962, 'Pallet', 300),
(2523, 21, 10, 2523, 1, 1, 458758962, 'Pallet', 300),
(2524, 21, 10, 2524, 1, 1, 458758962, 'Pallet', 300),
(2525, 21, 10, 2525, 1, 1, 458758962, 'Pallet', 300),
(2526, 21, 10, 2526, 1, 1, 458758962, 'Pallet', 300),
(2527, 21, 10, 2527, 1, 1, 458758962, 'Pallet', 300),
(2528, 21, 10, 2528, 1, 1, 458758962, 'Pallet', 300),
(2529, 21, 10, 2529, 1, 1, 458758962, 'Pallet', 300),
(2530, 21, 10, 2530, 1, 1, 458758962, 'Pallet', 300),
(2531, 21, 10, 2531, 1, 1, 458758962, 'Pallet', 300),
(2532, 21, 10, 2532, 1, 1, 458758962, 'Pallet', 300),
(2533, 21, 10, 2533, 1, 1, 458758962, 'Pallet', 300),
(2534, 21, 10, 2534, 1, 1, 458758962, 'Pallet', 300),
(2535, 21, 10, 2535, 1, 1, 458758962, 'Pallet', 300),
(2536, 21, 10, 2536, 1, 1, 458758962, 'Pallet', 300),
(2537, 21, 10, 2537, 1, 1, 458758962, 'Pallet', 300),
(2538, 21, 10, 2538, 1, 1, 458758962, 'Pallet', 300),
(2539, 21, 10, 2539, 1, 1, 458758962, 'Pallet', 300),
(2540, 21, 10, 2540, 1, 1, 458758962, 'Pallet', 300),
(2541, 21, 10, 2541, 1, 1, 458758962, 'Pallet', 300),
(2542, 21, 10, 2542, 1, 1, 458758962, 'Pallet', 300),
(2543, 21, 10, 2543, 1, 1, 458758962, 'Pallet', 300),
(2544, 21, 10, 2544, 1, 1, 458758962, 'Pallet', 300),
(2545, 21, 10, 2545, 1, 1, 458758962, 'Pallet', 300),
(2546, 21, 10, 2546, 1, 1, 458758962, 'Pallet', 300),
(2547, 21, 10, 2547, 1, 1, 458758962, 'Pallet', 300),
(2548, 21, 10, 2548, 1, 1, 458758962, 'Pallet', 300),
(2549, 21, 10, 2549, 1, 1, 458758962, 'Pallet', 300),
(2550, 21, 10, 2550, 1, 1, 458758962, 'Pallet', 300),
(2551, 21, 10, 2551, 1, 1, 458758962, 'Pallet', 300),
(2552, 21, 10, 2552, 1, 1, 458758962, 'Pallet', 300),
(2553, 21, 10, 2553, 1, 1, 458758962, 'Pallet', 300),
(2554, 21, 10, 2554, 1, 1, 458758962, 'Pallet', 300),
(2555, 21, 10, 2555, 1, 1, 458758962, 'Pallet', 300),
(2556, 21, 10, 2556, 1, 1, 458758962, 'Pallet', 300),
(2557, 21, 10, 2557, 1, 1, 458758962, 'Pallet', 300),
(2558, 21, 10, 2558, 1, 1, 458758962, 'Pallet', 300),
(2559, 21, 10, 2559, 1, 1, 458758962, 'Pallet', 300),
(2560, 21, 10, 2560, 1, 1, 458758962, 'Pallet', 300),
(2561, 21, 10, 2561, 1, 1, 458758962, 'Pallet', 300),
(2562, 21, 10, 2562, 1, 1, 458758962, 'Pallet', 300),
(2563, 21, 10, 2563, 1, 1, 458758962, 'Pallet', 300),
(2564, 21, 10, 2564, 1, 1, 458758962, 'Pallet', 300),
(2565, 21, 10, 2565, 1, 1, 458758962, 'Pallet', 300),
(2566, 21, 10, 2566, 1, 1, 458758962, 'Pallet', 300),
(2567, 21, 10, 2567, 1, 1, 458758962, 'Pallet', 300),
(2568, 21, 10, 2568, 1, 1, 458758962, 'Pallet', 300),
(2569, 21, 10, 2569, 1, 1, 458758962, 'Pallet', 300),
(2570, 21, 10, 2570, 1, 1, 458758962, 'Pallet', 300),
(2571, 21, 10, 2571, 1, 1, 458758962, 'Pallet', 300),
(2572, 21, 10, 2572, 1, 1, 458758962, 'Pallet', 300),
(2573, 21, 10, 2573, 1, 1, 458758962, 'Pallet', 300),
(2574, 21, 10, 2574, 1, 1, 458758962, 'Pallet', 300),
(2575, 21, 10, 2575, 1, 1, 458758962, 'Pallet', 300),
(2576, 21, 10, 2576, 1, 1, 458758962, 'Pallet', 300),
(2577, 21, 10, 2577, 1, 1, 458758962, 'Pallet', 300),
(2578, 21, 10, 2578, 1, 1, 458758962, 'Pallet', 300),
(2579, 21, 10, 2579, 1, 1, 458758962, 'Pallet', 300),
(2580, 21, 10, 2580, 1, 1, 458758962, 'Pallet', 300),
(2581, 21, 10, 2581, 1, 1, 458758962, 'Pallet', 300),
(2582, 21, 10, 2582, 1, 1, 458758962, 'Pallet', 300),
(2583, 21, 10, 2583, 1, 1, 458758962, 'Pallet', 300),
(2584, 21, 10, 2584, 1, 1, 458758962, 'Pallet', 300),
(2585, 21, 10, 2585, 1, 1, 458758962, 'Pallet', 300),
(2586, 21, 10, 2586, 1, 1, 458758962, 'Pallet', 300),
(2587, 21, 10, 2587, 1, 1, 458758962, 'Pallet', 300),
(2588, 21, 10, 2588, 1, 1, 458758962, 'Pallet', 300),
(2589, 21, 10, 2589, 1, 1, 458758962, 'Pallet', 300),
(2590, 21, 10, 2590, 1, 1, 458758962, 'Pallet', 300),
(2591, 21, 10, 2591, 1, 1, 458758962, 'Pallet', 300),
(2592, 21, 10, 2592, 1, 1, 458758962, 'Pallet', 300),
(2593, 21, 10, 2593, 1, 1, 458758962, 'Pallet', 300),
(2594, 21, 10, 2594, 1, 1, 458758962, 'Pallet', 300),
(2595, 21, 10, 2595, 1, 1, 458758962, 'Pallet', 300),
(2596, 21, 10, 2596, 1, 1, 458758962, 'Pallet', 300),
(2597, 21, 10, 2597, 1, 1, 458758962, 'Pallet', 300),
(2598, 21, 10, 2598, 1, 1, 458758962, 'Pallet', 300),
(2599, 21, 10, 2599, 1, 1, 458758962, 'Pallet', 300),
(2600, 21, 10, 2600, 1, 1, 458758962, 'Pallet', 300),
(2601, 21, 10, 2601, 1, 1, 458758962, 'Pallet', 300),
(2602, 21, 10, 2602, 1, 1, 458758962, 'Pallet', 300),
(2603, 21, 10, 2603, 1, 1, 458758962, 'Pallet', 300),
(2604, 21, 10, 2604, 1, 1, 458758962, 'Pallet', 300),
(2605, 21, 10, 2605, 1, 1, 458758962, 'Pallet', 300),
(2606, 21, 10, 2606, 1, 1, 458758962, 'Pallet', 300),
(2607, 21, 10, 2607, 1, 1, 458758962, 'Pallet', 300),
(2608, 21, 10, 2608, 1, 1, 458758962, 'Pallet', 300),
(2609, 21, 10, 2609, 1, 1, 458758962, 'Pallet', 300),
(2610, 21, 10, 2610, 1, 1, 458758962, 'Pallet', 300),
(2611, 21, 10, 2611, 1, 1, 458758962, 'Pallet', 300),
(2612, 21, 10, 2612, 1, 1, 458758962, 'Pallet', 300),
(2613, 21, 10, 2613, 1, 1, 458758962, 'Pallet', 300),
(2614, 21, 10, 2614, 1, 1, 458758962, 'Pallet', 300),
(2615, 21, 10, 2615, 1, 1, 458758962, 'Pallet', 300),
(2616, 21, 10, 2616, 1, 1, 458758962, 'Pallet', 300),
(2617, 21, 10, 2617, 1, 1, 458758962, 'Pallet', 300),
(2618, 21, 10, 2618, 1, 1, 458758962, 'Pallet', 300),
(2619, 21, 10, 2619, 1, 1, 458758962, 'Pallet', 300),
(2620, 21, 10, 2620, 1, 1, 458758962, 'Pallet', 300),
(2621, 21, 10, 2621, 1, 1, 458758962, 'Pallet', 300),
(2622, 21, 10, 2622, 1, 1, 458758962, 'Pallet', 300),
(2623, 21, 10, 2623, 1, 1, 458758962, 'Pallet', 300),
(2624, 21, 10, 2624, 1, 1, 458758962, 'Pallet', 300),
(2625, 21, 10, 2625, 1, 1, 458758962, 'Pallet', 300),
(2626, 21, 10, 2626, 1, 1, 458758962, 'Pallet', 300),
(2627, 21, 10, 2627, 1, 1, 458758962, 'Pallet', 300),
(2628, 21, 10, 2628, 1, 1, 458758962, 'Pallet', 300),
(2629, 21, 10, 2629, 1, 1, 458758962, 'Pallet', 300),
(2630, 21, 10, 2630, 1, 1, 458758962, 'Pallet', 300),
(2631, 21, 10, 2631, 1, 1, 458758962, 'Pallet', 300),
(2632, 21, 10, 2632, 1, 1, 458758962, 'Pallet', 300),
(2633, 21, 10, 2633, 1, 1, 458758962, 'Pallet', 300),
(2634, 21, 10, 2634, 1, 1, 458758962, 'Pallet', 300),
(2635, 21, 10, 2635, 1, 1, 458758962, 'Pallet', 300),
(2636, 21, 10, 2636, 1, 1, 458758962, 'Pallet', 300),
(2637, 21, 10, 2637, 1, 1, 458758962, 'Pallet', 300),
(2638, 21, 10, 2638, 1, 1, 458758962, 'Pallet', 300),
(2639, 21, 10, 2639, 1, 1, 458758962, 'Pallet', 300),
(2640, 21, 10, 2640, 1, 1, 458758962, 'Pallet', 300),
(2641, 21, 10, 2641, 1, 1, 458758962, 'Pallet', 300),
(2642, 21, 10, 2642, 1, 1, 458758962, 'Pallet', 300),
(2643, 21, 10, 2643, 1, 1, 458758962, 'Pallet', 300),
(2644, 21, 10, 2644, 1, 1, 458758962, 'Pallet', 300),
(2645, 21, 10, 2645, 1, 1, 458758962, 'Pallet', 300),
(2646, 21, 10, 2646, 1, 1, 458758962, 'Pallet', 300),
(2647, 21, 10, 2647, 1, 1, 458758962, 'Pallet', 300),
(2648, 21, 10, 2648, 1, 1, 458758962, 'Pallet', 300),
(2649, 21, 10, 2649, 1, 1, 458758962, 'Pallet', 300),
(2650, 21, 10, 2650, 1, 1, 458758962, 'Pallet', 300),
(2651, 21, 10, 2651, 1, 1, 458758962, 'Pallet', 300),
(2652, 21, 10, 2652, 1, 1, 458758962, 'Pallet', 300),
(2653, 21, 10, 2653, 1, 1, 458758962, 'Pallet', 300),
(2654, 21, 10, 2654, 1, 1, 458758962, 'Pallet', 300),
(2655, 21, 10, 2655, 1, 1, 458758962, 'Pallet', 300),
(2656, 21, 10, 2656, 1, 1, 458758962, 'Pallet', 300),
(2657, 21, 10, 2657, 1, 1, 458758962, 'Pallet', 300),
(2658, 21, 10, 2658, 1, 1, 458758962, 'Pallet', 300),
(2659, 21, 10, 2659, 1, 1, 458758962, 'Pallet', 300),
(2660, 21, 10, 2660, 1, 1, 458758962, 'Pallet', 300),
(2661, 21, 10, 2661, 1, 1, 458758962, 'Pallet', 300),
(2662, 21, 10, 2662, 1, 1, 458758962, 'Pallet', 300),
(2663, 21, 10, 2663, 1, 1, 458758962, 'Pallet', 300),
(2664, 21, 10, 2664, 1, 1, 458758962, 'Pallet', 300),
(2665, 21, 10, 2665, 1, 1, 458758962, 'Pallet', 300),
(2666, 21, 10, 2666, 1, 1, 458758962, 'Pallet', 300),
(2667, 21, 10, 2667, 1, 1, 458758962, 'Pallet', 300),
(2668, 21, 10, 2668, 1, 1, 458758962, 'Pallet', 300),
(2669, 21, 10, 2669, 1, 1, 458758962, 'Pallet', 300),
(2670, 21, 10, 2670, 1, 1, 458758962, 'Pallet', 300),
(2671, 21, 10, 2671, 1, 1, 458758962, 'Pallet', 300),
(2672, 21, 10, 2672, 1, 1, 458758962, 'Pallet', 300),
(2673, 21, 10, 2673, 1, 1, 458758962, 'Pallet', 300),
(2674, 21, 10, 2674, 1, 1, 458758962, 'Pallet', 300),
(2675, 21, 10, 2675, 1, 1, 458758962, 'Pallet', 300),
(2676, 21, 10, 2676, 1, 1, 458758962, 'Pallet', 300),
(2677, 21, 10, 2677, 1, 1, 458758962, 'Pallet', 300),
(2678, 21, 10, 2678, 1, 1, 458758962, 'Pallet', 300),
(2679, 21, 10, 2679, 1, 1, 458758962, 'Pallet', 300),
(2680, 21, 10, 2680, 1, 1, 458758962, 'Pallet', 300),
(2681, 21, 10, 2681, 1, 1, 458758962, 'Pallet', 300),
(2682, 21, 10, 2682, 1, 1, 458758962, 'Pallet', 300),
(2683, 21, 10, 2683, 1, 1, 458758962, 'Pallet', 300),
(2684, 21, 10, 2684, 1, 1, 458758962, 'Pallet', 300),
(2685, 21, 10, 2685, 1, 1, 458758962, 'Pallet', 300),
(2686, 21, 10, 2686, 1, 1, 458758962, 'Pallet', 300),
(2687, 21, 10, 2687, 1, 1, 458758962, 'Pallet', 300),
(2688, 21, 10, 2688, 1, 1, 458758962, 'Pallet', 300),
(2689, 21, 10, 2689, 1, 1, 458758962, 'Pallet', 300),
(2690, 21, 10, 2690, 1, 1, 458758962, 'Pallet', 300),
(2691, 21, 10, 2691, 1, 1, 458758962, 'Pallet', 300),
(2692, 21, 10, 2692, 1, 1, 458758962, 'Pallet', 300),
(2693, 21, 10, 2693, 1, 1, 458758962, 'Pallet', 300),
(2694, 21, 10, 2694, 1, 1, 458758962, 'Pallet', 300),
(2695, 21, 10, 2695, 1, 1, 458758962, 'Pallet', 300),
(2696, 21, 10, 2696, 1, 1, 458758962, 'Pallet', 300),
(2697, 21, 10, 2697, 1, 1, 458758962, 'Pallet', 300),
(2698, 21, 10, 2698, 1, 1, 458758962, 'Pallet', 300),
(2699, 21, 10, 2699, 1, 1, 458758962, 'Pallet', 300),
(2700, 21, 10, 2700, 1, 1, 458758962, 'Pallet', 300),
(2701, 21, 10, 2701, 1, 1, 458758962, 'Pallet', 300),
(2702, 21, 10, 2702, 1, 1, 458758962, 'Pallet', 300),
(2703, 21, 10, 2703, 1, 1, 458758962, 'Pallet', 300),
(2704, 21, 10, 2704, 1, 1, 458758962, 'Pallet', 300),
(2705, 21, 10, 2705, 1, 1, 458758962, 'Pallet', 300),
(2706, 21, 10, 2706, 1, 1, 458758962, 'Pallet', 300),
(2707, 21, 10, 2707, 1, 1, 458758962, 'Pallet', 300),
(2708, 21, 10, 2708, 1, 1, 458758962, 'Pallet', 300),
(2709, 21, 10, 2709, 1, 1, 458758962, 'Pallet', 300),
(2710, 21, 10, 2710, 1, 1, 458758962, 'Pallet', 300),
(2711, 21, 10, 2711, 1, 1, 458758962, 'Pallet', 300),
(2712, 21, 10, 2712, 1, 1, 458758962, 'Pallet', 300),
(2713, 21, 10, 2713, 1, 1, 458758962, 'Pallet', 300),
(2714, 21, 10, 2714, 1, 1, 458758962, 'Pallet', 300),
(2715, 21, 10, 2715, 1, 1, 458758962, 'Pallet', 300),
(2716, 21, 10, 2716, 1, 1, 458758962, 'Pallet', 300),
(2717, 21, 10, 2717, 1, 1, 458758962, 'Pallet', 300),
(2718, 21, 10, 2718, 1, 1, 458758962, 'Pallet', 300),
(2719, 21, 10, 2719, 1, 1, 458758962, 'Pallet', 300),
(2720, 21, 10, 2720, 1, 1, 458758962, 'Pallet', 300),
(2721, 21, 10, 2721, 1, 1, 458758962, 'Pallet', 300),
(2722, 21, 10, 2722, 1, 1, 458758962, 'Pallet', 300),
(2723, 21, 10, 2723, 1, 1, 458758962, 'Pallet', 300),
(2724, 21, 10, 2724, 1, 1, 458758962, 'Pallet', 300),
(2725, 21, 10, 2725, 1, 1, 458758962, 'Pallet', 300),
(2726, 21, 10, 2726, 1, 1, 458758962, 'Pallet', 300),
(2727, 21, 10, 2727, 1, 1, 458758962, 'Pallet', 300),
(2728, 21, 10, 2728, 1, 1, 458758962, 'Pallet', 300),
(2729, 21, 10, 2729, 1, 1, 458758962, 'Pallet', 300),
(2730, 21, 10, 2730, 1, 1, 458758962, 'Pallet', 300),
(2731, 21, 10, 2731, 1, 1, 458758962, 'Pallet', 300),
(2732, 21, 10, 2732, 1, 1, 458758962, 'Pallet', 300),
(2733, 21, 10, 2733, 1, 1, 458758962, 'Pallet', 300),
(2734, 21, 10, 2734, 1, 1, 458758962, 'Pallet', 300),
(2735, 21, 10, 2735, 1, 1, 458758962, 'Pallet', 300),
(2736, 21, 10, 2736, 1, 1, 458758962, 'Pallet', 300),
(2737, 21, 10, 2737, 1, 1, 458758962, 'Pallet', 300),
(2738, 21, 10, 2738, 1, 1, 458758962, 'Pallet', 300),
(2739, 21, 10, 2739, 1, 1, 458758962, 'Pallet', 300),
(2740, 21, 10, 2740, 1, 1, 458758962, 'Pallet', 300),
(2741, 21, 10, 2741, 1, 1, 458758962, 'Pallet', 300),
(2742, 21, 10, 2742, 1, 1, 458758962, 'Pallet', 300),
(2743, 21, 10, 2743, 1, 1, 458758962, 'Pallet', 300),
(2744, 21, 10, 2744, 1, 1, 458758962, 'Pallet', 300),
(2745, 21, 10, 2745, 1, 1, 458758962, 'Pallet', 300),
(2746, 21, 10, 2746, 1, 1, 458758962, 'Pallet', 300),
(2747, 21, 10, 2747, 1, 1, 458758962, 'Pallet', 300),
(2748, 21, 10, 2748, 1, 1, 458758962, 'Pallet', 300),
(2749, 21, 10, 2749, 1, 1, 458758962, 'Pallet', 300),
(2750, 21, 10, 2750, 1, 1, 458758962, 'Pallet', 300),
(2751, 21, 10, 2751, 1, 1, 458758962, 'Pallet', 300),
(2752, 21, 10, 2752, 1, 1, 458758962, 'Pallet', 300),
(2753, 21, 10, 2753, 1, 1, 458758962, 'Pallet', 300),
(2754, 21, 10, 2754, 1, 1, 458758962, 'Pallet', 300),
(2755, 21, 10, 2755, 1, 1, 458758962, 'Pallet', 300),
(2756, 21, 10, 2756, 1, 1, 458758962, 'Pallet', 300),
(2757, 21, 10, 2757, 1, 1, 458758962, 'Pallet', 300),
(2758, 21, 10, 2758, 1, 1, 458758962, 'Pallet', 300),
(2759, 21, 10, 2759, 1, 1, 458758962, 'Pallet', 300),
(2760, 21, 10, 2760, 1, 1, 458758962, 'Pallet', 300),
(2761, 21, 10, 2761, 1, 1, 458758962, 'Pallet', 300),
(2762, 21, 10, 2762, 1, 1, 458758962, 'Pallet', 300),
(2763, 21, 10, 2763, 1, 1, 458758962, 'Pallet', 300),
(2764, 21, 10, 2764, 1, 1, 458758962, 'Pallet', 300),
(2765, 21, 10, 2765, 1, 1, 458758962, 'Pallet', 300),
(2766, 21, 10, 2766, 1, 1, 458758962, 'Pallet', 300),
(2767, 21, 10, 2767, 1, 1, 458758962, 'Pallet', 300),
(2768, 21, 10, 2768, 1, 1, 458758962, 'Pallet', 300),
(2769, 21, 10, 2769, 1, 1, 458758962, 'Pallet', 300),
(2770, 21, 10, 2770, 1, 1, 458758962, 'Pallet', 300),
(2771, 21, 10, 2771, 1, 1, 458758962, 'Pallet', 300),
(2772, 21, 10, 2772, 1, 1, 458758962, 'Pallet', 300),
(2773, 21, 10, 2773, 1, 1, 458758962, 'Pallet', 300),
(2774, 21, 10, 2774, 1, 1, 458758962, 'Pallet', 300),
(2775, 21, 10, 2775, 1, 1, 458758962, 'Pallet', 300),
(2776, 21, 10, 2776, 1, 1, 458758962, 'Pallet', 300),
(2777, 21, 10, 2777, 1, 1, 458758962, 'Pallet', 300),
(2778, 21, 10, 2778, 1, 1, 458758962, 'Pallet', 300),
(2779, 21, 10, 2779, 1, 1, 458758962, 'Pallet', 300),
(2780, 21, 10, 2780, 1, 1, 458758962, 'Pallet', 300),
(2781, 21, 10, 2781, 1, 1, 458758962, 'Pallet', 300),
(2782, 21, 10, 2782, 1, 1, 458758962, 'Pallet', 300),
(2783, 21, 10, 2783, 1, 1, 458758962, 'Pallet', 300),
(2784, 21, 10, 2784, 1, 1, 458758962, 'Pallet', 300),
(2785, 21, 10, 2785, 1, 1, 458758962, 'Pallet', 300),
(2786, 21, 10, 2786, 1, 1, 458758962, 'Pallet', 300),
(2787, 21, 10, 2787, 1, 1, 458758962, 'Pallet', 300),
(2788, 21, 10, 2788, 1, 1, 458758962, 'Pallet', 300),
(2789, 21, 10, 2789, 1, 1, 458758962, 'Pallet', 300),
(2790, 21, 10, 2790, 1, 1, 458758962, 'Pallet', 300),
(2791, 21, 10, 2791, 1, 1, 458758962, 'Pallet', 300),
(2792, 21, 10, 2792, 1, 1, 458758962, 'Pallet', 300),
(2793, 21, 10, 2793, 1, 1, 458758962, 'Pallet', 300),
(2794, 21, 10, 2794, 1, 1, 458758962, 'Pallet', 300),
(2795, 21, 10, 2795, 1, 1, 458758962, 'Pallet', 300),
(2796, 21, 10, 2796, 1, 1, 458758962, 'Pallet', 300),
(2797, 21, 10, 2797, 1, 1, 458758962, 'Pallet', 300),
(2798, 21, 10, 2798, 1, 1, 458758962, 'Pallet', 300),
(2799, 21, 10, 2799, 1, 1, 458758962, 'Pallet', 300),
(2800, 21, 10, 2800, 1, 1, 458758962, 'Pallet', 300),
(2801, 21, 10, 2801, 1, 1, 458758962, 'Pallet', 300),
(2802, 21, 10, 2802, 1, 1, 458758962, 'Pallet', 300),
(2803, 21, 10, 2803, 1, 1, 458758962, 'Pallet', 300),
(2804, 21, 10, 2804, 1, 1, 458758962, 'Pallet', 300),
(2805, 21, 10, 2805, 1, 1, 458758962, 'Pallet', 300),
(2806, 21, 10, 2806, 1, 1, 458758962, 'Pallet', 300),
(2807, 21, 10, 2807, 1, 1, 458758962, 'Pallet', 300),
(2808, 21, 10, 2808, 1, 1, 458758962, 'Pallet', 300),
(2809, 21, 10, 2809, 1, 1, 458758962, 'Pallet', 300),
(2810, 21, 10, 2810, 1, 1, 458758962, 'Pallet', 300),
(2811, 21, 10, 2811, 1, 1, 458758962, 'Pallet', 300),
(2812, 21, 10, 2812, 1, 1, 458758962, 'Pallet', 300),
(2813, 21, 10, 2813, 1, 1, 458758962, 'Pallet', 300),
(2814, 21, 10, 2814, 1, 1, 458758962, 'Pallet', 300),
(2815, 21, 10, 2815, 1, 1, 458758962, 'Pallet', 300),
(2816, 21, 10, 2816, 1, 1, 458758962, 'Pallet', 300),
(2817, 21, 10, 2817, 1, 1, 458758962, 'Pallet', 300),
(2818, 21, 10, 2818, 1, 1, 458758962, 'Pallet', 300),
(2819, 21, 10, 2819, 1, 1, 458758962, 'Pallet', 300),
(2820, 21, 10, 2820, 1, 1, 458758962, 'Pallet', 300),
(2821, 21, 10, 2821, 1, 1, 458758962, 'Pallet', 300),
(2822, 21, 10, 2822, 1, 1, 458758962, 'Pallet', 300),
(2823, 21, 10, 2823, 1, 1, 458758962, 'Pallet', 300),
(2824, 21, 10, 2824, 1, 1, 458758962, 'Pallet', 300),
(2825, 21, 10, 2825, 1, 1, 458758962, 'Pallet', 300),
(2826, 21, 10, 2826, 1, 1, 458758962, 'Pallet', 300),
(2827, 21, 10, 2827, 1, 1, 458758962, 'Pallet', 300),
(2828, 21, 10, 2828, 1, 1, 458758962, 'Pallet', 300),
(2829, 21, 10, 2829, 1, 1, 458758962, 'Pallet', 300),
(2830, 21, 10, 2830, 1, 1, 458758962, 'Pallet', 300),
(2831, 21, 10, 2831, 1, 1, 458758962, 'Pallet', 300),
(2832, 21, 10, 2832, 1, 1, 458758962, 'Pallet', 300),
(2833, 21, 10, 2833, 1, 1, 458758962, 'Pallet', 300),
(2834, 21, 10, 2834, 1, 1, 458758962, 'Pallet', 300),
(2835, 21, 10, 2835, 1, 1, 458758962, 'Pallet', 300),
(2836, 21, 10, 2836, 1, 1, 458758962, 'Pallet', 300),
(2837, 21, 10, 2837, 1, 1, 458758962, 'Pallet', 300),
(2838, 21, 10, 2838, 1, 1, 458758962, 'Pallet', 300),
(2839, 21, 10, 2839, 1, 1, 458758962, 'Pallet', 300),
(2840, 21, 10, 2840, 1, 1, 458758962, 'Pallet', 300),
(2841, 21, 10, 2841, 1, 1, 458758962, 'Pallet', 300),
(2842, 21, 10, 2842, 1, 1, 458758962, 'Pallet', 300),
(2843, 21, 10, 2843, 1, 1, 458758962, 'Pallet', 300),
(2844, 21, 10, 2844, 1, 1, 458758962, 'Pallet', 300),
(2845, 21, 10, 2845, 1, 1, 458758962, 'Pallet', 300),
(2846, 21, 10, 2846, 1, 1, 458758962, 'Pallet', 300),
(2847, 21, 10, 2847, 1, 1, 458758962, 'Pallet', 300),
(2848, 21, 10, 2848, 1, 1, 458758962, 'Pallet', 300),
(2849, 21, 10, 2849, 1, 1, 458758962, 'Pallet', 300),
(2850, 21, 10, 2850, 1, 1, 458758962, 'Pallet', 300),
(2851, 21, 10, 2851, 1, 1, 458758962, 'Pallet', 300),
(2852, 21, 10, 2852, 1, 1, 458758962, 'Pallet', 300),
(2853, 21, 10, 2853, 1, 1, 458758962, 'Pallet', 300),
(2854, 21, 10, 2854, 1, 1, 458758962, 'Pallet', 300),
(2855, 21, 10, 2855, 1, 1, 458758962, 'Pallet', 300),
(2856, 21, 10, 2856, 1, 1, 458758962, 'Pallet', 300),
(2857, 21, 10, 2857, 1, 1, 458758962, 'Pallet', 300),
(2858, 21, 10, 2858, 1, 1, 458758962, 'Pallet', 300),
(2859, 21, 10, 2859, 1, 1, 458758962, 'Pallet', 300),
(2860, 21, 10, 2860, 1, 1, 458758962, 'Pallet', 300),
(2861, 21, 10, 2861, 1, 1, 458758962, 'Pallet', 300),
(2862, 21, 10, 2862, 1, 1, 458758962, 'Pallet', 300),
(2863, 21, 10, 2863, 1, 1, 458758962, 'Pallet', 300),
(2864, 21, 10, 2864, 1, 1, 458758962, 'Pallet', 300),
(2865, 21, 10, 2865, 1, 1, 458758962, 'Pallet', 300),
(2866, 21, 10, 2866, 1, 1, 458758962, 'Pallet', 300),
(2867, 21, 10, 2867, 1, 1, 458758962, 'Pallet', 300),
(2868, 21, 10, 2868, 1, 1, 458758962, 'Pallet', 300),
(2869, 21, 10, 2869, 1, 1, 458758962, 'Pallet', 300),
(2870, 21, 10, 2870, 1, 1, 458758962, 'Pallet', 300),
(2871, 21, 10, 2871, 1, 1, 458758962, 'Pallet', 300),
(2872, 21, 10, 2872, 1, 1, 458758962, 'Pallet', 300),
(2873, 21, 10, 2873, 1, 1, 458758962, 'Pallet', 300),
(2874, 21, 10, 2874, 1, 1, 458758962, 'Pallet', 300),
(2875, 21, 10, 2875, 1, 1, 458758962, 'Pallet', 300),
(2876, 21, 10, 2876, 1, 1, 458758962, 'Pallet', 300),
(2877, 21, 10, 2877, 1, 1, 458758962, 'Pallet', 300),
(2878, 21, 10, 2878, 1, 1, 458758962, 'Pallet', 300),
(2879, 21, 10, 2879, 1, 1, 458758962, 'Pallet', 300),
(2880, 21, 10, 2880, 1, 1, 458758962, 'Pallet', 300),
(2881, 21, 10, 2881, 1, 1, 458758962, 'Pallet', 300),
(2882, 21, 10, 2882, 1, 1, 458758962, 'Pallet', 300),
(2883, 21, 10, 2883, 1, 1, 458758962, 'Pallet', 300),
(2884, 21, 10, 2884, 1, 1, 458758962, 'Pallet', 300),
(2885, 21, 10, 2885, 1, 1, 458758962, 'Pallet', 300),
(2886, 21, 10, 2886, 1, 1, 458758962, 'Pallet', 300),
(2887, 21, 10, 2887, 1, 1, 458758962, 'Pallet', 300),
(2888, 21, 10, 2888, 1, 1, 458758962, 'Pallet', 300),
(2889, 21, 10, 2889, 1, 1, 458758962, 'Pallet', 300),
(2890, 21, 10, 2890, 1, 1, 458758962, 'Pallet', 300),
(2891, 21, 10, 2891, 1, 1, 458758962, 'Pallet', 300),
(2892, 21, 10, 2892, 1, 1, 458758962, 'Pallet', 300),
(2893, 21, 10, 2893, 1, 1, 458758962, 'Pallet', 300),
(2894, 21, 10, 2894, 1, 1, 458758962, 'Pallet', 300),
(2895, 21, 10, 2895, 1, 1, 458758962, 'Pallet', 300),
(2896, 21, 10, 2896, 1, 1, 458758962, 'Pallet', 300),
(2897, 21, 10, 2897, 1, 1, 458758962, 'Pallet', 300),
(2898, 21, 10, 2898, 1, 1, 458758962, 'Pallet', 300),
(2899, 21, 10, 2899, 1, 1, 458758962, 'Pallet', 300),
(2900, 21, 10, 2900, 1, 1, 458758962, 'Pallet', 300),
(2901, 21, 10, 2901, 1, 1, 458758962, 'Pallet', 300),
(2902, 21, 10, 2902, 1, 1, 458758962, 'Pallet', 300),
(2903, 21, 10, 2903, 1, 1, 458758962, 'Pallet', 300),
(2904, 21, 10, 2904, 1, 1, 458758962, 'Pallet', 300),
(2905, 21, 10, 2905, 1, 1, 458758962, 'Pallet', 300),
(2906, 21, 10, 2906, 1, 1, 458758962, 'Pallet', 300),
(2907, 21, 10, 2907, 1, 1, 458758962, 'Pallet', 300),
(2908, 21, 10, 2908, 1, 1, 458758962, 'Pallet', 300),
(2909, 21, 10, 2909, 1, 1, 458758962, 'Pallet', 300),
(2910, 21, 10, 2910, 1, 1, 458758962, 'Pallet', 300),
(2911, 21, 10, 2911, 1, 1, 458758962, 'Pallet', 300),
(2912, 21, 10, 2912, 1, 1, 458758962, 'Pallet', 300),
(2913, 21, 10, 2913, 1, 1, 458758962, 'Pallet', 300),
(2914, 21, 10, 2914, 1, 1, 458758962, 'Pallet', 300),
(2915, 21, 10, 2915, 1, 1, 458758962, 'Pallet', 300),
(2916, 21, 10, 2916, 1, 1, 458758962, 'Pallet', 300),
(2917, 21, 10, 2917, 1, 1, 458758962, 'Pallet', 300),
(2918, 21, 10, 2918, 1, 1, 458758962, 'Pallet', 300),
(2919, 21, 10, 2919, 1, 1, 458758962, 'Pallet', 300),
(2920, 21, 10, 2920, 1, 1, 458758962, 'Pallet', 300),
(2921, 21, 10, 2921, 1, 1, 458758962, 'Pallet', 300),
(2922, 21, 10, 2922, 1, 1, 458758962, 'Pallet', 300),
(2923, 21, 10, 2923, 1, 1, 458758962, 'Pallet', 300),
(2924, 21, 10, 2924, 1, 1, 458758962, 'Pallet', 300),
(2925, 21, 10, 2925, 1, 1, 458758962, 'Pallet', 300),
(2926, 21, 10, 2926, 1, 1, 458758962, 'Pallet', 300),
(2927, 21, 10, 2927, 1, 1, 458758962, 'Pallet', 300),
(2928, 21, 10, 2928, 1, 1, 458758962, 'Pallet', 300),
(2929, 21, 10, 2929, 1, 1, 458758962, 'Pallet', 300),
(2930, 21, 10, 2930, 1, 1, 458758962, 'Pallet', 300),
(2931, 21, 10, 2931, 1, 1, 458758962, 'Pallet', 300),
(2932, 21, 10, 2932, 1, 1, 458758962, 'Pallet', 300);
INSERT INTO `tp_package_pallet` (`id`, `lot_id`, `product_id`, `case_id`, `dimensions_id`, `pallet_images_id`, `package_pallet_sn`, `package_type`, `inner_package_count`) VALUES
(2933, 21, 10, 2933, 1, 1, 458758962, 'Pallet', 300),
(2934, 21, 10, 2934, 1, 1, 458758962, 'Pallet', 300),
(2935, 21, 10, 2935, 1, 1, 458758962, 'Pallet', 300),
(2936, 21, 10, 2936, 1, 1, 458758962, 'Pallet', 300),
(2937, 21, 10, 2937, 1, 1, 458758962, 'Pallet', 300),
(2938, 21, 10, 2938, 1, 1, 458758962, 'Pallet', 300),
(2939, 21, 10, 2939, 1, 1, 458758962, 'Pallet', 300),
(2940, 21, 10, 2940, 1, 1, 458758962, 'Pallet', 300),
(2941, 21, 10, 2941, 1, 1, 458758962, 'Pallet', 300),
(2942, 21, 10, 2942, 1, 1, 458758962, 'Pallet', 300),
(2943, 21, 10, 2943, 1, 1, 458758962, 'Pallet', 300),
(2944, 21, 10, 2944, 1, 1, 458758962, 'Pallet', 300),
(2945, 21, 10, 2945, 1, 1, 458758962, 'Pallet', 300),
(2946, 21, 10, 2946, 1, 1, 458758962, 'Pallet', 300),
(2947, 21, 10, 2947, 1, 1, 458758962, 'Pallet', 300),
(2948, 21, 10, 2948, 1, 1, 458758962, 'Pallet', 300),
(2949, 21, 10, 2949, 1, 1, 458758962, 'Pallet', 300),
(2950, 21, 10, 2950, 1, 1, 458758962, 'Pallet', 300),
(2951, 21, 10, 2951, 1, 1, 458758962, 'Pallet', 300),
(2952, 21, 10, 2952, 1, 1, 458758962, 'Pallet', 300),
(2953, 21, 10, 2953, 1, 1, 458758962, 'Pallet', 300),
(2954, 21, 10, 2954, 1, 1, 458758962, 'Pallet', 300),
(2955, 21, 10, 2955, 1, 1, 458758962, 'Pallet', 300),
(2956, 21, 10, 2956, 1, 1, 458758962, 'Pallet', 300),
(2957, 21, 10, 2957, 1, 1, 458758962, 'Pallet', 300),
(2958, 21, 10, 2958, 1, 1, 458758962, 'Pallet', 300),
(2959, 21, 10, 2959, 1, 1, 458758962, 'Pallet', 300),
(2960, 21, 10, 2960, 1, 1, 458758962, 'Pallet', 300),
(2961, 21, 10, 2961, 1, 1, 458758962, 'Pallet', 300),
(2962, 21, 10, 2962, 1, 1, 458758962, 'Pallet', 300),
(2963, 21, 10, 2963, 1, 1, 458758962, 'Pallet', 300),
(2964, 21, 10, 2964, 1, 1, 458758962, 'Pallet', 300),
(2965, 21, 10, 2965, 1, 1, 458758962, 'Pallet', 300),
(2966, 21, 10, 2966, 1, 1, 458758962, 'Pallet', 300),
(2967, 21, 10, 2967, 1, 1, 458758962, 'Pallet', 300),
(2968, 21, 10, 2968, 1, 1, 458758962, 'Pallet', 300),
(2969, 21, 10, 2969, 1, 1, 458758962, 'Pallet', 300),
(2970, 21, 10, 2970, 1, 1, 458758962, 'Pallet', 300),
(2971, 21, 10, 2971, 1, 1, 458758962, 'Pallet', 300),
(2972, 21, 10, 2972, 1, 1, 458758962, 'Pallet', 300),
(2973, 21, 10, 2973, 1, 1, 458758962, 'Pallet', 300),
(2974, 21, 10, 2974, 1, 1, 458758962, 'Pallet', 300),
(2975, 21, 10, 2975, 1, 1, 458758962, 'Pallet', 300),
(2976, 21, 10, 2976, 1, 1, 458758962, 'Pallet', 300),
(2977, 21, 10, 2977, 1, 1, 458758962, 'Pallet', 300),
(2978, 21, 10, 2978, 1, 1, 458758962, 'Pallet', 300),
(2979, 21, 10, 2979, 1, 1, 458758962, 'Pallet', 300),
(2980, 21, 10, 2980, 1, 1, 458758962, 'Pallet', 300),
(2981, 21, 10, 2981, 1, 1, 458758962, 'Pallet', 300),
(2982, 21, 10, 2982, 1, 1, 458758962, 'Pallet', 300),
(2983, 21, 10, 2983, 1, 1, 458758962, 'Pallet', 300),
(2984, 21, 10, 2984, 1, 1, 458758962, 'Pallet', 300),
(2985, 21, 10, 2985, 1, 1, 458758962, 'Pallet', 300),
(2986, 21, 10, 2986, 1, 1, 458758962, 'Pallet', 300),
(2987, 21, 10, 2987, 1, 1, 458758962, 'Pallet', 300),
(2988, 21, 10, 2988, 1, 1, 458758962, 'Pallet', 300),
(2989, 21, 10, 2989, 1, 1, 458758962, 'Pallet', 300),
(2990, 21, 10, 2990, 1, 1, 458758962, 'Pallet', 300),
(2991, 21, 10, 2991, 1, 1, 458758962, 'Pallet', 300),
(2992, 21, 10, 2992, 1, 1, 458758962, 'Pallet', 300),
(2993, 21, 10, 2993, 1, 1, 458758962, 'Pallet', 300),
(2994, 21, 10, 2994, 1, 1, 458758962, 'Pallet', 300),
(2995, 21, 10, 2995, 1, 1, 458758962, 'Pallet', 300),
(2996, 21, 10, 2996, 1, 1, 458758962, 'Pallet', 300),
(2997, 21, 10, 2997, 1, 1, 458758962, 'Pallet', 300),
(2998, 21, 10, 2998, 1, 1, 458758962, 'Pallet', 300),
(2999, 21, 10, 2999, 1, 1, 458758962, 'Pallet', 300),
(3000, 21, 10, 3000, 1, 1, 458758962, 'Pallet', 300),
(3001, 21, 10, 3001, 1, 1, 458758962, 'Pallet', 300),
(3002, 21, 10, 3002, 1, 1, 458758962, 'Pallet', 300),
(3003, 21, 10, 3003, 1, 1, 458758962, 'Pallet', 300),
(3004, 21, 10, 3004, 1, 1, 458758962, 'Pallet', 300),
(3005, 21, 10, 3005, 1, 1, 458758962, 'Pallet', 300),
(3006, 21, 10, 3006, 1, 1, 458758962, 'Pallet', 300),
(3007, 21, 10, 3007, 1, 1, 458758962, 'Pallet', 300),
(3008, 21, 10, 3008, 1, 1, 458758962, 'Pallet', 300),
(3009, 21, 10, 3009, 1, 1, 458758962, 'Pallet', 300),
(3010, 21, 10, 3010, 1, 1, 458758962, 'Pallet', 300),
(3011, 21, 10, 3011, 1, 1, 458758962, 'Pallet', 300),
(3012, 21, 10, 3012, 1, 1, 458758962, 'Pallet', 300),
(3013, 21, 10, 3013, 1, 1, 458758962, 'Pallet', 300),
(3014, 21, 10, 3014, 1, 1, 458758962, 'Pallet', 300),
(3015, 21, 10, 3015, 1, 1, 458758962, 'Pallet', 300),
(3016, 21, 10, 3016, 1, 1, 458758962, 'Pallet', 300),
(3017, 21, 10, 3017, 1, 1, 458758962, 'Pallet', 300),
(3018, 21, 10, 3018, 1, 1, 458758962, 'Pallet', 300),
(3019, 21, 10, 3019, 1, 1, 458758962, 'Pallet', 300),
(3020, 21, 10, 3020, 1, 1, 458758962, 'Pallet', 300),
(3021, 21, 10, 3021, 1, 1, 458758962, 'Pallet', 300),
(3022, 21, 10, 3022, 1, 1, 458758962, 'Pallet', 300),
(3023, 21, 10, 3023, 1, 1, 458758962, 'Pallet', 300),
(3024, 21, 10, 3024, 1, 1, 458758962, 'Pallet', 300),
(3025, 21, 10, 3025, 1, 1, 458758962, 'Pallet', 300),
(3026, 21, 10, 3026, 1, 1, 458758962, 'Pallet', 300),
(3027, 21, 10, 3027, 1, 1, 458758962, 'Pallet', 300),
(3028, 21, 10, 3028, 1, 1, 458758962, 'Pallet', 300),
(3029, 21, 10, 3029, 1, 1, 458758962, 'Pallet', 300),
(3030, 21, 10, 3030, 1, 1, 458758962, 'Pallet', 300),
(3031, 21, 10, 3031, 1, 1, 458758962, 'Pallet', 300),
(3032, 21, 10, 3032, 1, 1, 458758962, 'Pallet', 300),
(3033, 21, 10, 3033, 1, 1, 458758962, 'Pallet', 300),
(3034, 21, 10, 3034, 1, 1, 458758962, 'Pallet', 300),
(3035, 21, 10, 3035, 1, 1, 458758962, 'Pallet', 300),
(3036, 21, 10, 3036, 1, 1, 458758962, 'Pallet', 300),
(3037, 21, 10, 3037, 1, 1, 458758962, 'Pallet', 300),
(3038, 21, 10, 3038, 1, 1, 458758962, 'Pallet', 300),
(3039, 21, 10, 3039, 1, 1, 458758962, 'Pallet', 300),
(3040, 21, 10, 3040, 1, 1, 458758962, 'Pallet', 300),
(3041, 21, 10, 3041, 1, 1, 458758962, 'Pallet', 300),
(3042, 21, 10, 3042, 1, 1, 458758962, 'Pallet', 300),
(3043, 21, 10, 3043, 1, 1, 458758962, 'Pallet', 300),
(3044, 21, 10, 3044, 1, 1, 458758962, 'Pallet', 300),
(3045, 21, 10, 3045, 1, 1, 458758962, 'Pallet', 300),
(3046, 21, 10, 3046, 1, 1, 458758962, 'Pallet', 300),
(3047, 21, 10, 3047, 1, 1, 458758962, 'Pallet', 300),
(3048, 21, 10, 3048, 1, 1, 458758962, 'Pallet', 300),
(3049, 21, 10, 3049, 1, 1, 458758962, 'Pallet', 300),
(3050, 21, 10, 3050, 1, 1, 458758962, 'Pallet', 300),
(3051, 21, 10, 3051, 1, 1, 458758962, 'Pallet', 300),
(3052, 21, 10, 3052, 1, 1, 458758962, 'Pallet', 300),
(3053, 21, 10, 3053, 1, 1, 458758962, 'Pallet', 300),
(3054, 21, 10, 3054, 1, 1, 458758962, 'Pallet', 300),
(3055, 21, 10, 3055, 1, 1, 458758962, 'Pallet', 300),
(3056, 21, 10, 3056, 1, 1, 458758962, 'Pallet', 300),
(3057, 21, 10, 3057, 1, 1, 458758962, 'Pallet', 300),
(3058, 21, 10, 3058, 1, 1, 458758962, 'Pallet', 300),
(3059, 21, 10, 3059, 1, 1, 458758962, 'Pallet', 300),
(3060, 21, 10, 3060, 1, 1, 458758962, 'Pallet', 300),
(3061, 21, 10, 3061, 1, 1, 458758962, 'Pallet', 300),
(3062, 21, 10, 3062, 1, 1, 458758962, 'Pallet', 300),
(3063, 21, 10, 3063, 1, 1, 458758962, 'Pallet', 300),
(3064, 21, 10, 3064, 1, 1, 458758962, 'Pallet', 300),
(3065, 21, 10, 3065, 1, 1, 458758962, 'Pallet', 300),
(3066, 21, 10, 3066, 1, 1, 458758962, 'Pallet', 300),
(3067, 21, 10, 3067, 1, 1, 458758962, 'Pallet', 300),
(3068, 21, 10, 3068, 1, 1, 458758962, 'Pallet', 300),
(3069, 21, 10, 3069, 1, 1, 458758962, 'Pallet', 300),
(3070, 21, 10, 3070, 1, 1, 458758962, 'Pallet', 300),
(3071, 21, 10, 3071, 1, 1, 458758962, 'Pallet', 300),
(3072, 21, 10, 3072, 1, 1, 458758962, 'Pallet', 300),
(3073, 21, 10, 3073, 1, 1, 458758962, 'Pallet', 300),
(3074, 21, 10, 3074, 1, 1, 458758962, 'Pallet', 300),
(3075, 21, 10, 3075, 1, 1, 458758962, 'Pallet', 300),
(3076, 21, 10, 3076, 1, 1, 458758962, 'Pallet', 300),
(3077, 21, 10, 3077, 1, 1, 458758962, 'Pallet', 300),
(3078, 21, 10, 3078, 1, 1, 458758962, 'Pallet', 300),
(3079, 21, 10, 3079, 1, 1, 458758962, 'Pallet', 300),
(3080, 21, 10, 3080, 1, 1, 458758962, 'Pallet', 300),
(3081, 21, 10, 3081, 1, 1, 458758962, 'Pallet', 300),
(3082, 21, 10, 3082, 1, 1, 458758962, 'Pallet', 300),
(3083, 21, 10, 3083, 1, 1, 458758962, 'Pallet', 300),
(3084, 21, 10, 3084, 1, 1, 458758962, 'Pallet', 300),
(3085, 21, 10, 3085, 1, 1, 458758962, 'Pallet', 300),
(3086, 21, 10, 3086, 1, 1, 458758962, 'Pallet', 300),
(3087, 21, 10, 3087, 1, 1, 458758962, 'Pallet', 300),
(3088, 21, 10, 3088, 1, 1, 458758962, 'Pallet', 300),
(3089, 21, 10, 3089, 1, 1, 458758962, 'Pallet', 300),
(3090, 21, 10, 3090, 1, 1, 458758962, 'Pallet', 300),
(3091, 21, 10, 3091, 1, 1, 458758962, 'Pallet', 300),
(3092, 21, 10, 3092, 1, 1, 458758962, 'Pallet', 300),
(3093, 21, 10, 3093, 1, 1, 458758962, 'Pallet', 300),
(3094, 21, 10, 3094, 1, 1, 458758962, 'Pallet', 300),
(3095, 21, 10, 3095, 1, 1, 458758962, 'Pallet', 300),
(3096, 21, 10, 3096, 1, 1, 458758962, 'Pallet', 300),
(3097, 21, 10, 3097, 1, 1, 458758962, 'Pallet', 300),
(3098, 21, 10, 3098, 1, 1, 458758962, 'Pallet', 300),
(3099, 21, 10, 3099, 1, 1, 458758962, 'Pallet', 300),
(3100, 21, 10, 3100, 1, 1, 458758962, 'Pallet', 300),
(3101, 21, 10, 3101, 1, 1, 458758962, 'Pallet', 300),
(3102, 21, 10, 3102, 1, 1, 458758962, 'Pallet', 300),
(3103, 21, 10, 3103, 1, 1, 458758962, 'Pallet', 300),
(3104, 21, 10, 3104, 1, 1, 458758962, 'Pallet', 300),
(3105, 21, 10, 3105, 1, 1, 458758962, 'Pallet', 300),
(3106, 21, 10, 3106, 1, 1, 458758962, 'Pallet', 300),
(3107, 21, 10, 3107, 1, 1, 458758962, 'Pallet', 300),
(3108, 21, 10, 3108, 1, 1, 458758962, 'Pallet', 300),
(3109, 21, 10, 3109, 1, 1, 458758962, 'Pallet', 300),
(3110, 21, 10, 3110, 1, 1, 458758962, 'Pallet', 300),
(3111, 21, 10, 3111, 1, 1, 458758962, 'Pallet', 300),
(3112, 21, 10, 3112, 1, 1, 458758962, 'Pallet', 300),
(3113, 21, 10, 3113, 1, 1, 458758962, 'Pallet', 300),
(3114, 21, 10, 3114, 1, 1, 458758962, 'Pallet', 300),
(3115, 21, 10, 3115, 1, 1, 458758962, 'Pallet', 300),
(3116, 21, 10, 3116, 1, 1, 458758962, 'Pallet', 300),
(3117, 21, 10, 3117, 1, 1, 458758962, 'Pallet', 300),
(3118, 21, 10, 3118, 1, 1, 458758962, 'Pallet', 300),
(3119, 21, 10, 3119, 1, 1, 458758962, 'Pallet', 300),
(3120, 21, 10, 3120, 1, 1, 458758962, 'Pallet', 300),
(3121, 21, 10, 3121, 1, 1, 458758962, 'Pallet', 300),
(3122, 21, 10, 3122, 1, 1, 458758962, 'Pallet', 300),
(3123, 21, 10, 3123, 1, 1, 458758962, 'Pallet', 300),
(3124, 21, 10, 3124, 1, 1, 458758962, 'Pallet', 300),
(3125, 21, 10, 3125, 1, 1, 458758962, 'Pallet', 300),
(3126, 21, 10, 3126, 1, 1, 458758962, 'Pallet', 300),
(3127, 21, 10, 3127, 1, 1, 458758962, 'Pallet', 300),
(3128, 21, 10, 3128, 1, 1, 458758962, 'Pallet', 300),
(3129, 21, 10, 3129, 1, 1, 458758962, 'Pallet', 300),
(3130, 21, 10, 3130, 1, 1, 458758962, 'Pallet', 300),
(3131, 21, 10, 3131, 1, 1, 458758962, 'Pallet', 300),
(3132, 21, 10, 3132, 1, 1, 458758962, 'Pallet', 300),
(3133, 21, 10, 3133, 1, 1, 458758962, 'Pallet', 300),
(3134, 21, 10, 3134, 1, 1, 458758962, 'Pallet', 300),
(3135, 21, 10, 3135, 1, 1, 458758962, 'Pallet', 300),
(3136, 21, 10, 3136, 1, 1, 458758962, 'Pallet', 300),
(3137, 21, 10, 3137, 1, 1, 458758962, 'Pallet', 300),
(3138, 21, 10, 3138, 1, 1, 458758962, 'Pallet', 300),
(3139, 21, 10, 3139, 1, 1, 458758962, 'Pallet', 300),
(3140, 21, 10, 3140, 1, 1, 458758962, 'Pallet', 300),
(3141, 21, 10, 3141, 1, 1, 458758962, 'Pallet', 300),
(3142, 21, 10, 3142, 1, 1, 458758962, 'Pallet', 300),
(3143, 21, 10, 3143, 1, 1, 458758962, 'Pallet', 300),
(3144, 21, 10, 3144, 1, 1, 458758962, 'Pallet', 300),
(3145, 21, 10, 3145, 1, 1, 458758962, 'Pallet', 300),
(3146, 21, 10, 3146, 1, 1, 458758962, 'Pallet', 300),
(3147, 21, 10, 3147, 1, 1, 458758962, 'Pallet', 300),
(3148, 21, 10, 3148, 1, 1, 458758962, 'Pallet', 300),
(3149, 21, 10, 3149, 1, 1, 458758962, 'Pallet', 300),
(3150, 21, 10, 3150, 1, 1, 458758962, 'Pallet', 300),
(3151, 21, 10, 3151, 1, 1, 458758962, 'Pallet', 300),
(3152, 21, 10, 3152, 1, 1, 458758962, 'Pallet', 300),
(3153, 21, 10, 3153, 1, 1, 458758962, 'Pallet', 300),
(3154, 21, 10, 3154, 1, 1, 458758962, 'Pallet', 300),
(3155, 21, 10, 3155, 1, 1, 458758962, 'Pallet', 300),
(3156, 21, 10, 3156, 1, 1, 458758962, 'Pallet', 300),
(3157, 21, 10, 3157, 1, 1, 458758962, 'Pallet', 300),
(3158, 21, 10, 3158, 1, 1, 458758962, 'Pallet', 300),
(3159, 21, 10, 3159, 1, 1, 458758962, 'Pallet', 300),
(3160, 21, 10, 3160, 1, 1, 458758962, 'Pallet', 300),
(3161, 21, 10, 3161, 1, 1, 458758962, 'Pallet', 300),
(3162, 21, 10, 3162, 1, 1, 458758962, 'Pallet', 300),
(3163, 21, 10, 3163, 1, 1, 458758962, 'Pallet', 300),
(3164, 21, 10, 3164, 1, 1, 458758962, 'Pallet', 300),
(3165, 21, 10, 3165, 1, 1, 458758962, 'Pallet', 300),
(3166, 21, 10, 3166, 1, 1, 458758962, 'Pallet', 300),
(3167, 21, 10, 3167, 1, 1, 458758962, 'Pallet', 300),
(3168, 21, 10, 3168, 1, 1, 458758962, 'Pallet', 300),
(3169, 21, 10, 3169, 1, 1, 458758962, 'Pallet', 300),
(3170, 21, 10, 3170, 1, 1, 458758962, 'Pallet', 300),
(3171, 21, 10, 3171, 1, 1, 458758962, 'Pallet', 300),
(3172, 21, 10, 3172, 1, 1, 458758962, 'Pallet', 300),
(3173, 21, 10, 3173, 1, 1, 458758962, 'Pallet', 300),
(3174, 21, 10, 3174, 1, 1, 458758962, 'Pallet', 300),
(3175, 21, 10, 3175, 1, 1, 458758962, 'Pallet', 300),
(3176, 21, 10, 3176, 1, 1, 458758962, 'Pallet', 300),
(3177, 21, 10, 3177, 1, 1, 458758962, 'Pallet', 300),
(3178, 21, 10, 3178, 1, 1, 458758962, 'Pallet', 300),
(3179, 21, 10, 3179, 1, 1, 458758962, 'Pallet', 300),
(3180, 21, 10, 3180, 1, 1, 458758962, 'Pallet', 300),
(3181, 21, 10, 3181, 1, 1, 458758962, 'Pallet', 300),
(3182, 21, 10, 3182, 1, 1, 458758962, 'Pallet', 300),
(3183, 21, 10, 3183, 1, 1, 458758962, 'Pallet', 300),
(3184, 21, 10, 3184, 1, 1, 458758962, 'Pallet', 300),
(3185, 21, 10, 3185, 1, 1, 458758962, 'Pallet', 300),
(3186, 21, 10, 3186, 1, 1, 458758962, 'Pallet', 300),
(3187, 21, 10, 3187, 1, 1, 458758962, 'Pallet', 300),
(3188, 21, 10, 3188, 1, 1, 458758962, 'Pallet', 300),
(3189, 21, 10, 3189, 1, 1, 458758962, 'Pallet', 300),
(3190, 21, 10, 3190, 1, 1, 458758962, 'Pallet', 300),
(3191, 21, 10, 3191, 1, 1, 458758962, 'Pallet', 300),
(3192, 21, 10, 3192, 1, 1, 458758962, 'Pallet', 300),
(3193, 21, 10, 3193, 1, 1, 458758962, 'Pallet', 300),
(3194, 21, 10, 3194, 1, 1, 458758962, 'Pallet', 300),
(3195, 21, 10, 3195, 1, 1, 458758962, 'Pallet', 300),
(3196, 21, 10, 3196, 1, 1, 458758962, 'Pallet', 300),
(3197, 21, 10, 3197, 1, 1, 458758962, 'Pallet', 300),
(3198, 21, 10, 3198, 1, 1, 458758962, 'Pallet', 300),
(3199, 21, 10, 3199, 1, 1, 458758962, 'Pallet', 300),
(3200, 21, 10, 3200, 1, 1, 458758962, 'Pallet', 300),
(3201, 21, 10, 3201, 1, 1, 458758962, 'Pallet', 300),
(3202, 21, 10, 3202, 1, 1, 458758962, 'Pallet', 300),
(3203, 21, 10, 3203, 1, 1, 458758962, 'Pallet', 300),
(3204, 21, 10, 3204, 1, 1, 458758962, 'Pallet', 300),
(3205, 21, 10, 3205, 1, 1, 458758962, 'Pallet', 300),
(3206, 21, 10, 3206, 1, 1, 458758962, 'Pallet', 300),
(3207, 21, 10, 3207, 1, 1, 458758962, 'Pallet', 300),
(3208, 21, 10, 3208, 1, 1, 458758962, 'Pallet', 300),
(3209, 21, 10, 3209, 1, 1, 458758962, 'Pallet', 300),
(3210, 21, 10, 3210, 1, 1, 458758962, 'Pallet', 300),
(3211, 21, 10, 3211, 1, 1, 458758962, 'Pallet', 300),
(3212, 21, 10, 3212, 1, 1, 458758962, 'Pallet', 300),
(3213, 21, 10, 3213, 1, 1, 458758962, 'Pallet', 300),
(3214, 21, 10, 3214, 1, 1, 458758962, 'Pallet', 300),
(3215, 21, 10, 3215, 1, 1, 458758962, 'Pallet', 300),
(3216, 21, 10, 3216, 1, 1, 458758962, 'Pallet', 300),
(3217, 21, 10, 3217, 1, 1, 458758962, 'Pallet', 300),
(3218, 21, 10, 3218, 1, 1, 458758962, 'Pallet', 300),
(3219, 21, 10, 3219, 1, 1, 458758962, 'Pallet', 300),
(3220, 21, 10, 3220, 1, 1, 458758962, 'Pallet', 300),
(3221, 21, 10, 3221, 1, 1, 458758962, 'Pallet', 300),
(3222, 21, 10, 3222, 1, 1, 458758962, 'Pallet', 300),
(3223, 21, 10, 3223, 1, 1, 458758962, 'Pallet', 300),
(3224, 21, 10, 3224, 1, 1, 458758962, 'Pallet', 300),
(3225, 21, 10, 3225, 1, 1, 458758962, 'Pallet', 300),
(3226, 21, 10, 3226, 1, 1, 458758962, 'Pallet', 300),
(3227, 21, 10, 3227, 1, 1, 458758962, 'Pallet', 300),
(3228, 21, 10, 3228, 1, 1, 458758962, 'Pallet', 300),
(3229, 21, 10, 3229, 1, 1, 458758962, 'Pallet', 300),
(3230, 21, 10, 3230, 1, 1, 458758962, 'Pallet', 300),
(3231, 21, 10, 3231, 1, 1, 458758962, 'Pallet', 300),
(3232, 21, 10, 3232, 1, 1, 458758962, 'Pallet', 300),
(3233, 21, 10, 3233, 1, 1, 458758962, 'Pallet', 300),
(3234, 21, 10, 3234, 1, 1, 458758962, 'Pallet', 300),
(3235, 21, 10, 3235, 1, 1, 458758962, 'Pallet', 300),
(3236, 21, 10, 3236, 1, 1, 458758962, 'Pallet', 300),
(3237, 21, 10, 3237, 1, 1, 458758962, 'Pallet', 300),
(3238, 21, 10, 3238, 1, 1, 458758962, 'Pallet', 300),
(3239, 21, 10, 3239, 1, 1, 458758962, 'Pallet', 300),
(3240, 21, 10, 3240, 1, 1, 458758962, 'Pallet', 300),
(3241, 21, 10, 3241, 1, 1, 458758962, 'Pallet', 300),
(3242, 21, 10, 3242, 1, 1, 458758962, 'Pallet', 300),
(3243, 21, 10, 3243, 1, 1, 458758962, 'Pallet', 300),
(3244, 21, 10, 3244, 1, 1, 458758962, 'Pallet', 300),
(3245, 21, 10, 3245, 1, 1, 458758962, 'Pallet', 300),
(3246, 21, 10, 3246, 1, 1, 458758962, 'Pallet', 300),
(3247, 21, 10, 3247, 1, 1, 458758962, 'Pallet', 300),
(3248, 21, 10, 3248, 1, 1, 458758962, 'Pallet', 300),
(3249, 21, 10, 3249, 1, 1, 458758962, 'Pallet', 300),
(3250, 21, 10, 3250, 1, 1, 458758962, 'Pallet', 300),
(3251, 21, 10, 3251, 1, 1, 458758962, 'Pallet', 300),
(3252, 21, 10, 3252, 1, 1, 458758962, 'Pallet', 300),
(3253, 21, 10, 3253, 1, 1, 458758962, 'Pallet', 300),
(3254, 21, 10, 3254, 1, 1, 458758962, 'Pallet', 300),
(3255, 21, 10, 3255, 1, 1, 458758962, 'Pallet', 300),
(3256, 21, 10, 3256, 1, 1, 458758962, 'Pallet', 300),
(3257, 21, 10, 3257, 1, 1, 458758962, 'Pallet', 300),
(3258, 21, 10, 3258, 1, 1, 458758962, 'Pallet', 300),
(3259, 21, 10, 3259, 1, 1, 458758962, 'Pallet', 300),
(3260, 21, 10, 3260, 1, 1, 458758962, 'Pallet', 300),
(3261, 21, 10, 3261, 1, 1, 458758962, 'Pallet', 300),
(3262, 21, 10, 3262, 1, 1, 458758962, 'Pallet', 300),
(3263, 21, 10, 3263, 1, 1, 458758962, 'Pallet', 300),
(3264, 21, 10, 3264, 1, 1, 458758962, 'Pallet', 300);

-- --------------------------------------------------------

--
-- Table structure for table `tp_package_pallet_dimensions`
--

CREATE TABLE `tp_package_pallet_dimensions` (
  `id` smallint UNSIGNED NOT NULL,
  `total_dimensions` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `height` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `depth` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `width` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `shape` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `colour` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_active` smallint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tp_package_pallet_dimensions`
--

INSERT INTO `tp_package_pallet_dimensions` (`id`, `total_dimensions`, `height`, `depth`, `width`, `shape`, `colour`, `is_active`) VALUES
(1, '139\' x 110\' x 154\' Feet', '154', '110', '139', 'Rectangle', 'Blue', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tp_package_pallet_images`
--

CREATE TABLE `tp_package_pallet_images` (
  `id` smallint UNSIGNED NOT NULL,
  `image_1` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image_2` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image_3` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image_4` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `video` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `file` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tp_package_pallet_images`
--

INSERT INTO `tp_package_pallet_images` (`id`, `image_1`, `image_2`, `image_3`, `image_4`, `video`, `file`) VALUES
(1, 'download_2.jpg', 'images_2.jpg', 'transportandlogisticsme_2019-01_7fa0483e-cda9-43d7-8915-eae2e2c2561e_Fedex_Logistics.jpg', 'download_GCoHoFl.jpg', 'Video_background_-_Blockchain_Website_1.mp4', 'Invoice_517184137.pdf'),
(2, 'download_MXLKJTV.jpg', 'images_sPb4jDK.jpg', 'images_rbAreyD.jpg', 'download_1.jpg', 'SampleVideo_720x480_5mb_5zwkth2.mp4', 'E1VNJq_UYAMan-N.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tp_package_primary`
--

CREATE TABLE `tp_package_primary` (
  `id` smallint UNSIGNED NOT NULL,
  `product_id` smallint UNSIGNED DEFAULT NULL,
  `lot_id` smallint UNSIGNED DEFAULT NULL,
  `pack_type_id` smallint DEFAULT NULL,
  `package_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `package_sn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Starts with 1 - Later implement',
  `package_image` varchar(2000) DEFAULT NULL,
  `ineer_package_count` varchar(50) DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tp_package_primary`
--

INSERT INTO `tp_package_primary` (`id`, `product_id`, `lot_id`, `pack_type_id`, `package_type`, `package_sn`, `package_image`, `ineer_package_count`, `is_active`) VALUES
(1, 1, 1, 1, 'Item', '2000001', NULL, '100', 1),
(2, 1, 1, 1, 'Item', '2000002', NULL, '100', 1),
(3, 1, 1, 1, 'Item', '2000003', NULL, '100', 1),
(4, 1, 1, 1, 'Item', '2000004', NULL, '100', 1),
(5, 1, 1, 1, 'Item', '2000005', NULL, '100', 1),
(6, 1, 1, 1, 'Item', '2000006', NULL, '100', 1),
(7, 1, 1, 1, 'Item', '2000007', NULL, '100', 1),
(8, 1, 1, 1, 'Item', '2000008', NULL, '100', 1),
(9, 1, 1, 1, 'Item', '2000009', NULL, '100', 1),
(10, 1, 1, 1, 'Item', '2000010', NULL, '100', 1),
(11, 1, 19, 2, 'Item', '9167301', NULL, '50', 1),
(12, 1, 19, 2, 'Item', '9167302', NULL, '50', 1),
(13, 1, 19, 2, 'Item', '9167303', NULL, '50', 1),
(14, 1, 19, 2, 'Item', '9167304', NULL, '50', 1),
(15, 1, 19, 2, 'Item', '9167305', NULL, '50', 1),
(16, 1, 19, 2, 'Item', '9167306', NULL, '50', 1),
(17, 1, 19, 2, 'Item', '9167307', NULL, '50', 1),
(18, 1, 19, 2, 'Item', '9167308', NULL, '50', 1),
(19, 1, 19, 2, 'Item', '9167309', NULL, '50', 1),
(20, 1, 19, 2, 'Item', '9167310', NULL, '50', 1),
(21, 1, 1, 2, 'Item', '9167311', NULL, '50', 1),
(22, 1, 1, 2, 'Item', '9167312', NULL, '50', 1),
(23, 1, 1, 2, 'Item', '9167313', NULL, '50', 1),
(24, 1, 1, 2, 'Item', '9167314', NULL, '50', 1),
(25, 1, 1, 2, 'Item', '9167315', NULL, '50', 1),
(26, 1, 1, 2, 'Item', '9167316', NULL, '50', 1),
(27, 1, 1, 2, 'Item', '9167317', NULL, '50', 1),
(28, 1, 1, 2, 'Item', '9167318', NULL, '50', 1),
(29, 1, 1, 2, 'Item', '9167319', NULL, '50', 1),
(30, 1, 1, 2, 'Item', '9167320', NULL, '50', 1),
(31, 1, 1, 2, 'Item', '9167321', NULL, '50', 1),
(32, 1, 1, 2, 'Item', '9167322', NULL, '50', 1),
(33, 1, 1, 2, 'Item', '9167323', NULL, '50', 1),
(34, 1, 1, 2, 'Item', '9167324', NULL, '50', 1),
(35, 1, 1, 2, 'Item', '9167325', NULL, '50', 1),
(36, 1, 1, 2, 'Item', '9167326', NULL, '50', 1),
(37, 1, 1, 2, 'Item', '9167327', NULL, '50', 1),
(38, 1, 1, 2, 'Item', '9167328', NULL, '50', 1),
(39, 1, 1, 2, 'Item', '9167329', NULL, '50', 1),
(40, 1, 1, 2, 'Item', '9167330', NULL, '50', 1),
(41, 1, 1, 2, 'Item', '9167331', NULL, '50', 1),
(42, 1, 1, 2, 'Item', '9167332', NULL, '50', 1),
(43, 1, 1, 2, 'Item', '9167333', NULL, '50', 1),
(44, 1, 1, 2, 'Item', '9167334', NULL, '50', 1),
(45, 1, 1, 2, 'Item', '9167335', NULL, '50', 1),
(46, 1, 1, 2, 'Item', '9167336', NULL, '50', 1),
(47, 1, 1, 2, 'Item', '9167337', NULL, '50', 1),
(48, 1, 1, 2, 'Item', '9167338', NULL, '50', 1),
(49, 1, 1, 2, 'Item', '9167339', NULL, '50', 1),
(50, 1, 1, 2, 'Item', '9167340', NULL, '50', 1),
(51, 1, 1, 2, 'Item', '9167341', NULL, '50', 1),
(52, 1, 1, 2, 'Item', '9167342', NULL, '50', 1),
(53, 1, 1, 2, 'Item', '9167343', NULL, '50', 1),
(54, 1, 1, 2, 'Item', '9167344', NULL, '50', 1),
(55, 1, 1, 2, 'Item', '9167345', NULL, '50', 1),
(56, 1, 1, 2, 'Item', '9167346', NULL, '50', 1),
(57, 1, 1, 2, 'Item', '9167347', NULL, '50', 1),
(58, 1, 1, 2, 'Item', '9167348', NULL, '50', 1),
(59, 1, 1, 2, 'Item', '9167349', NULL, '50', 1),
(60, 1, 1, 2, 'Item', '9167350', NULL, '50', 1),
(61, 1, 1, 2, 'Item', '6167301', NULL, '50', 1),
(62, 1, 1, 2, 'Item', '6167302', NULL, '50', 1),
(63, 1, 1, 2, 'Item', '6167303', NULL, '50', 1),
(64, 1, 1, 2, 'Item', '6167304', NULL, '50', 1),
(65, 1, 1, 2, 'Item', '6167305', NULL, '50', 1),
(66, 1, 1, 2, 'Item', '6167306', NULL, '50', 1),
(67, 1, 1, 2, 'Item', '6167307', NULL, '50', 1),
(68, 1, 1, 2, 'Item', '6167308', NULL, '50', 1),
(69, 1, 1, 2, 'Item', '6167309', NULL, '50', 1),
(70, 1, 1, 2, 'Item', '6167310', NULL, '50', 1),
(71, 11, 11, 1, 'Item', '6067311', 'null', '10', 1),
(72, 11, 11, 1, 'Item', '6067312', 'null', '10', 1),
(73, 11, 11, 1, 'Item', '6067313', 'null', '10', 1),
(74, 11, 11, 1, 'Item', '6067314', 'null', '10', 1),
(75, 11, 11, 1, 'Item', '6067315', 'null', '10', 1),
(76, 11, 11, 1, 'Item', '6067316', 'null', '10', 1),
(77, 11, 11, 1, 'Item', '6067317', 'null', '10', 1),
(78, 11, 11, 1, 'Item', '6067318', 'null', '10', 1),
(79, 11, 11, 1, 'Item', '6067319', 'null', '10', 1),
(80, 11, 11, 1, 'Item', '6067320', 'null', '10', 1),
(81, 11, 11, 1, 'Item', '6067321', 'null', '10', 1),
(82, 11, 11, 1, 'Item', '6067322', 'null', '10', 1),
(83, 11, 11, 1, 'Item', '6067323', 'null', '10', 1),
(84, 11, 11, 1, 'Item', '6067324', 'null', '10', 1),
(85, 11, 11, 1, 'Item', '6067325', 'null', '10', 1),
(86, 11, 11, 1, 'Item', '6067326', 'null', '10', 1),
(87, 11, 11, 1, 'Item', '6067327', 'null', '10', 1),
(88, 11, 11, 1, 'Item', '6067328', 'null', '10', 1),
(89, 11, 11, 1, 'Item', '6067329', 'null', '10', 1),
(90, 11, 11, 1, 'Item', '6067330', 'null', '10', 1),
(91, 11, 11, 1, 'Item', '6067331', 'null', '10', 1),
(92, 11, 11, 1, 'Item', '6067332', 'null', '10', 1),
(93, 11, 11, 1, 'Item', '6067333', 'null', '10', 1),
(94, 11, 11, 1, 'Item', '6067334', 'null', '10', 1),
(95, 11, 11, 1, 'Item', '6067335', 'null', '10', 1),
(96, 11, 11, 1, 'Item', '6067336', 'null', '10', 1),
(97, 11, 11, 1, 'Item', '6067337', 'null', '10', 1),
(98, 11, 11, 1, 'Item', '6067338', 'null', '10', 1),
(99, 11, 11, 1, 'Item', '6067339', 'null', '10', 1),
(100, 11, 11, 1, 'Item', '6067340', 'null', '10', 1),
(101, 11, 11, 1, 'Item', '6067341', 'null', '10', 1),
(102, 11, 11, 1, 'Item', '6067342', 'null', '10', 1),
(103, 11, 11, 1, 'Item', '6067343', 'null', '10', 1),
(104, 11, 11, 1, 'Item', '6067344', 'null', '10', 1),
(105, 11, 11, 1, 'Item', '6067345', 'null', '10', 1),
(106, 11, 11, 1, 'Item', '6067346', 'null', '10', 1),
(107, 11, 11, 1, 'Item', '6067347', 'null', '10', 1),
(108, 11, 11, 1, 'Item', '6067348', 'null', '10', 1),
(109, 11, 11, 1, 'Item', '6067349', 'null', '10', 1),
(110, 11, 11, 1, 'Item', '6067350', 'null', '10', 1),
(111, 11, 11, 1, 'Item', '6067351', 'null', '10', 1),
(112, 11, 11, 1, 'Item', '6067352', 'null', '10', 1),
(113, 11, 11, 1, 'Item', '6067353', 'null', '10', 1),
(114, 11, 11, 1, 'Item', '6067354', 'null', '10', 1),
(115, 11, 11, 1, 'Item', '6067355', 'null', '10', 1),
(116, 11, 11, 1, 'Item', '6067356', 'null', '10', 1),
(117, 11, 11, 1, 'Item', '6067357', 'null', '10', 1),
(118, 11, 11, 1, 'Item', '6067358', 'null', '10', 1),
(119, 11, 11, 1, 'Item', '6067359', 'null', '10', 1),
(120, 11, 11, 1, 'Item', '6067360', 'null', '10', 1),
(121, 11, 11, 1, 'Item', '6067361', 'null', '10', 1),
(122, 11, 11, 1, 'Item', '6067362', 'null', '10', 1),
(123, 11, 11, 1, 'Item', '6067363', 'null', '10', 1),
(124, 11, 11, 1, 'Item', '6067364', 'null', '10', 1),
(125, 11, 11, 1, 'Item', '6067365', 'null', '10', 1),
(126, 11, 11, 1, 'Item', '6067366', 'null', '10', 1),
(127, 11, 11, 1, 'Item', '6067367', 'null', '10', 1),
(128, 11, 11, 1, 'Item', '6067368', 'null', '10', 1),
(129, 11, 11, 1, 'Item', '6067369', 'null', '10', 1),
(130, 11, 11, 1, 'Item', '6067370', 'null', '10', 1),
(131, 11, 11, 1, 'Item', '6067371', 'null', '10', 1),
(132, 11, 11, 1, 'Item', '6067372', 'null', '10', 1),
(133, 11, 11, 1, 'Item', '6067373', 'null', '10', 1),
(134, 11, 11, 1, 'Item', '6067374', 'null', '10', 1),
(135, 11, 11, 1, 'Item', '6067375', 'null', '10', 1),
(136, 11, 11, 1, 'Item', '6067376', 'null', '10', 1),
(137, 11, 11, 1, 'Item', '6067377', 'null', '10', 1),
(138, 11, 11, 1, 'Item', '6067378', 'null', '10', 1),
(139, 11, 11, 1, 'Item', '6067379', 'null', '10', 1),
(140, 11, 11, 1, 'Item', '6067380', 'null', '10', 1),
(141, 11, 11, 1, 'Item', '6067381', 'null', '10', 1),
(142, 11, 11, 1, 'Item', '6067382', 'null', '10', 1),
(143, 11, 11, 1, 'Item', '6067383', 'null', '10', 1),
(144, 11, 11, 1, 'Item', '6067384', 'null', '10', 1),
(145, 11, 11, 1, 'Item', '6067385', 'null', '10', 1),
(146, 11, 11, 1, 'Item', '6067386', 'null', '10', 1),
(147, 11, 11, 1, 'Item', '6067387', 'null', '10', 1),
(148, 11, 11, 1, 'Item', '6067388', 'null', '10', 1),
(149, 11, 11, 1, 'Item', '6067389', 'null', '10', 1),
(150, 11, 11, 1, 'Item', '6067390', 'null', '10', 1),
(151, 11, 11, 1, 'Item', '6067391', 'null', '10', 1),
(152, 11, 11, 1, 'Item', '6067392', 'null', '10', 1),
(153, 11, 11, 1, 'Item', '6067393', 'null', '10', 1),
(154, 11, 11, 1, 'Item', '6067394', 'null', '10', 1),
(155, 11, 11, 1, 'Item', '6067395', 'null', '10', 1),
(156, 11, 11, 1, 'Item', '6067396', 'null', '10', 1),
(157, 11, 11, 1, 'Item', '6067397', 'null', '10', 1),
(158, 11, 11, 1, 'Item', '6067398', 'null', '10', 1),
(159, 11, 11, 1, 'Item', '6067399', 'null', '10', 1),
(160, 11, 11, 1, 'Item', '6067400', 'null', '10', 1),
(161, 11, 11, 1, 'Item', '6067401', 'null', '10', 1),
(162, 11, 11, 1, 'Item', '6067402', 'null', '10', 1),
(163, 11, 11, 1, 'Item', '6067403', 'null', '10', 1),
(164, 11, 11, 1, 'Item', '6067404', 'null', '10', 1),
(165, 11, 11, 1, 'Item', '6067405', 'null', '10', 1),
(166, 11, 11, 1, 'Item', '6067406', 'null', '10', 1),
(167, 11, 11, 1, 'Item', '6067407', 'null', '10', 1),
(168, 11, 11, 1, 'Item', '6067408', 'null', '10', 1),
(169, 11, 11, 1, 'Item', '6067409', 'null', '10', 1),
(170, 11, 11, 1, 'Item', '6067410', 'null', '10', 1),
(171, 2, 2, 1, 'Unit', '3000001', 'null', '100', 1),
(172, 2, 2, 1, 'Unit', '3000002', 'null', '100', 1),
(173, 2, 2, 1, 'Unit', '3000003', 'null', '100', 1),
(174, 2, 2, 1, 'Unit', '3000004', 'null', '100', 1),
(175, 2, 2, 1, 'Unit', '3000005', 'null', '100', 1),
(176, 2, 2, 1, 'Unit', '3000006', 'null', '100', 1),
(177, 2, 2, 1, 'Unit', '3000007', 'null', '100', 1),
(178, 2, 2, 1, 'Unit', '3000008', 'null', '100', 1),
(179, 2, 2, 1, 'Unit', '3000009', 'null', '100', 1),
(180, 2, 2, 1, 'Unit', '3000010', 'null', '100', 1),
(181, 3, 3, 2, 'Unit', '4000001', 'null', '100', 1),
(182, 3, 3, 2, 'Unit', '4000002', 'null', '100', 1),
(183, 3, 3, 2, 'Unit', '4000003', 'null', '100', 1),
(184, 3, 3, 2, 'Unit', '4000004', 'null', '100', 1),
(185, 3, 3, 2, 'Unit', '4000005', 'null', '100', 1),
(186, 3, 3, 2, 'Unit', '4000006', 'null', '100', 1),
(187, 3, 3, 2, 'Unit', '4000007', 'null', '100', 1),
(188, 3, 3, 2, 'Unit', '4000008', 'null', '100', 1),
(189, 3, 3, 2, 'Unit', '4000009', 'null', '100', 1),
(190, 3, 3, 2, 'Unit', '4000010', 'null', '100', 1),
(191, 6, 6, 1, 'Unit', '5000001', 'null', '100', 1),
(192, 6, 6, 1, 'Unit', '5000002', 'null', '100', 1),
(193, 6, 6, 1, 'Unit', '5000003', 'null', '100', 1),
(194, 6, 6, 1, 'Unit', '5000004', 'null', '100', 1),
(195, 6, 6, 1, 'Unit', '5000005', 'null', '100', 1),
(196, 6, 6, 1, 'Unit', '5000006', 'null', '100', 1),
(197, 6, 6, 1, 'Unit', '5000007', 'null', '100', 1),
(198, 6, 6, 1, 'Unit', '5000008', 'null', '100', 1),
(199, 6, 6, 1, 'Unit', '5000009', 'null', '100', 1),
(200, 6, 6, 1, 'Unit', '5000010', 'null', '100', 1),
(201, 7, 7, 2, 'Unit', '6000001', 'null', '100', 1),
(202, 7, 7, 2, 'Unit', '6000002', 'null', '100', 1),
(203, 7, 7, 2, 'Unit', '6000003', 'null', '100', 1),
(204, 7, 7, 2, 'Unit', '6000004', 'null', '100', 1),
(205, 7, 7, 2, 'Unit', '6000005', 'null', '100', 1),
(206, 7, 7, 2, 'Unit', '6000006', 'null', '100', 1),
(207, 7, 7, 2, 'Unit', '6000007', 'null', '100', 1),
(208, 7, 7, 2, 'Unit', '6000008', 'null', '100', 1),
(209, 7, 7, 2, 'Unit', '6000009', 'null', '100', 1),
(210, 7, 7, 2, 'Unit', '6000010', 'null', '100', 1),
(211, 8, 8, 1, 'Unit', '7000001', 'null', '100', 1),
(212, 8, 8, 1, 'Unit', '7000002', 'null', '100', 1),
(213, 8, 8, 1, 'Unit', '7000003', 'null', '100', 1),
(214, 8, 8, 1, 'Unit', '7000004', 'null', '100', 1),
(215, 8, 8, 1, 'Unit', '7000005', 'null', '100', 1),
(216, 8, 8, 1, 'Unit', '7000006', 'null', '100', 1),
(217, 8, 8, 1, 'Unit', '7000007', 'null', '100', 1),
(218, 8, 8, 1, 'Unit', '7000008', 'null', '100', 1),
(219, 8, 8, 1, 'Unit', '7000009', 'null', '100', 1),
(220, 8, 8, 1, 'Unit', '7000010', 'null', '100', 1),
(221, 9, 9, 1, 'Unit', '8000001', 'null', '100', 1),
(222, 9, 9, 1, 'Unit', '8000002', 'null', '100', 1),
(223, 9, 9, 1, 'Unit', '8000003', 'null', '100', 1),
(224, 9, 9, 1, 'Unit', '8000004', 'null', '100', 1),
(225, 9, 9, 1, 'Unit', '8000005', 'null', '100', 1),
(226, 9, 9, 1, 'Unit', '8000006', 'null', '100', 1),
(227, 9, 9, 1, 'Unit', '8000007', 'null', '100', 1),
(228, 9, 9, 1, 'Unit', '8000008', 'null', '100', 1),
(229, 9, 9, 1, 'Unit', '8000009', 'null', '100', 1),
(230, 9, 9, 1, 'Unit', '8000010', 'null', '100', 1),
(231, 10, 10, 2, 'Unit', '9000001', 'null', '100', 1),
(232, 10, 10, 2, 'Unit', '9000002', 'null', '100', 1),
(233, 10, 10, 2, 'Unit', '9000003', 'null', '100', 1),
(234, 10, 10, 2, 'Unit', '9000004', 'null', '100', 1),
(235, 10, 10, 2, 'Unit', '9000005', 'null', '100', 1),
(236, 10, 10, 2, 'Unit', '9000006', 'null', '100', 1),
(237, 10, 10, 2, 'Unit', '9000007', 'null', '100', 1),
(238, 10, 10, 2, 'Unit', '9000008', 'null', '100', 1),
(239, 10, 10, 2, 'Unit', '9000009', 'null', '100', 1),
(240, 10, 10, 2, 'Unit', '9000010', 'null', '100', 1),
(241, 12, 12, 1, 'Unit', '9600001', 'null', '100', 1),
(242, 12, 12, 1, 'Unit', '9600002', 'null', '100', 1),
(243, 12, 12, 1, 'Unit', '9600003', 'null', '100', 1),
(244, 12, 12, 1, 'Unit', '9600004', 'null', '100', 1),
(245, 12, 12, 1, 'Unit', '9600005', 'null', '100', 1),
(246, 12, 12, 1, 'Unit', '9600006', 'null', '100', 1),
(247, 12, 12, 1, 'Unit', '9600007', 'null', '100', 1),
(248, 12, 12, 1, 'Unit', '9600008', 'null', '100', 1),
(249, 12, 12, 1, 'Unit', '9600009', 'null', '100', 1),
(250, 12, 12, 1, 'Unit', '9600010', 'null', '100', 1),
(251, 13, 13, 1, 'Unit', '9600140', 'null', '100', 1),
(252, 13, 13, 1, 'Unit', '9600141', 'null', '100', 1),
(253, 13, 13, 1, 'Unit', '9600142', 'null', '100', 1),
(254, 13, 13, 1, 'Unit', '9600143', 'null', '100', 1),
(255, 13, 13, 1, 'Unit', '9600144', 'null', '100', 1),
(256, 13, 13, 1, 'Unit', '9600145', 'null', '100', 1),
(257, 13, 13, 1, 'Unit', '9600146', 'null', '100', 1),
(258, 13, 13, 1, 'Unit', '9600147', 'null', '100', 1),
(259, 13, 13, 1, 'Unit', '9600148', 'null', '100', 1),
(260, 13, 13, 1, 'Unit', '9600149', 'null', '100', 1),
(261, 10, 21, 1, 'Item', '2180005', 'NA', '5 ml', 1),
(262, 10, 21, 1, 'Item', '2180006', 'NA', '5 ml', 1),
(263, 10, 21, 1, 'Item', '2180007', 'NA', '5 ml', 1),
(264, 10, 21, 1, 'Item', '2180008', 'NA', '5 ml', 1),
(265, 10, 21, 1, 'Item', '2180009', 'NA', '5 ml', 1),
(266, 10, 21, 1, 'Item', '2180010', 'NA', '5 ml', 1),
(267, 10, 21, 1, 'Item', '2180011', 'NA', '5 ml', 1),
(268, 10, 21, 1, 'Item', '2180012', 'NA', '5 ml', 1),
(269, 10, 21, 1, 'Item', '2180013', 'NA', '5 ml', 1),
(270, 10, 21, 1, 'Item', '2180014', 'NA', '5 ml', 1),
(271, 10, 21, 1, 'Item', '2180015', 'NA', '5 ml', 1),
(272, 10, 21, 1, 'Item', '2180016', 'NA', '5 ml', 1),
(273, 10, 21, 1, 'Item', '2180017', 'NA', '5 ml', 1),
(274, 10, 21, 1, 'Item', '2180018', 'NA', '5 ml', 1),
(275, 10, 21, 1, 'Item', '2180019', 'NA', '5 ml', 1),
(276, 10, 21, 1, 'Item', '2180020', 'NA', '5 ml', 1),
(277, 10, 21, 1, 'Item', '2180021', 'NA', '5 ml', 1),
(278, 10, 21, 1, 'Item', '2180022', 'NA', '5 ml', 1),
(279, 10, 21, 1, 'Item', '2180023', 'NA', '5 ml', 1),
(280, 10, 21, 1, 'Item', '2180024', 'NA', '5 ml', 1),
(281, 10, 21, 1, 'Item', '2180025', 'NA', '5 ml', 1),
(282, 10, 21, 1, 'Item', '2180026', 'NA', '5 ml', 1),
(283, 10, 21, 1, 'Item', '2180027', 'NA', '5 ml', 1),
(284, 10, 21, 1, 'Item', '2180028', 'NA', '5 ml', 1),
(285, 10, 21, 1, 'Item', '2180029', 'NA', '5 ml', 1),
(286, 10, 21, 1, 'Item', '2180030', 'NA', '5 ml', 1),
(287, 10, 21, 1, 'Item', '2180031', 'NA', '5 ml', 1),
(288, 10, 21, 1, 'Item', '2180032', 'NA', '5 ml', 1),
(289, 10, 21, 1, 'Item', '2180033', 'NA', '5 ml', 1),
(290, 10, 21, 1, 'Item', '2180034', 'NA', '5 ml', 1),
(291, 10, 21, 1, 'Item', '2180035', 'NA', '5 ml', 1),
(292, 10, 21, 1, 'Item', '2180036', 'NA', '5 ml', 1),
(293, 10, 21, 1, 'Item', '2180037', 'NA', '5 ml', 1),
(294, 10, 21, 1, 'Item', '2180038', 'NA', '5 ml', 1),
(295, 10, 21, 1, 'Item', '2180039', 'NA', '5 ml', 1),
(296, 10, 21, 1, 'Item', '2180040', 'NA', '5 ml', 1),
(297, 10, 21, 1, 'Item', '2180041', 'NA', '5 ml', 1),
(298, 10, 21, 1, 'Item', '2180042', 'NA', '5 ml', 1),
(299, 10, 21, 1, 'Item', '2180043', 'NA', '5 ml', 1),
(300, 10, 21, 1, 'Item', '2180044', 'NA', '5 ml', 1),
(301, 10, 21, 1, 'Item', '2180045', 'NA', '5 ml', 1),
(302, 10, 21, 1, 'Item', '2180046', 'NA', '5 ml', 1),
(303, 10, 21, 1, 'Item', '2180047', 'NA', '5 ml', 1),
(304, 10, 21, 1, 'Item', '2180048', 'NA', '5 ml', 1),
(305, 10, 21, 1, 'Item', '2180049', 'NA', '5 ml', 1),
(306, 10, 21, 1, 'Item', '2180050', 'NA', '5 ml', 1),
(307, 10, 21, 1, 'Item', '2180051', 'NA', '5 ml', 1),
(308, 10, 21, 1, 'Item', '2180052', 'NA', '5 ml', 1),
(309, 10, 21, 1, 'Item', '2180053', 'NA', '5 ml', 1),
(310, 10, 21, 1, 'Item', '2180054', 'NA', '5 ml', 1),
(311, 10, 21, 1, 'Item', '2180055', 'NA', '5 ml', 1),
(312, 10, 21, 1, 'Item', '2180056', 'NA', '5 ml', 1),
(313, 10, 21, 1, 'Item', '2180057', 'NA', '5 ml', 1),
(314, 10, 21, 1, 'Item', '2180058', 'NA', '5 ml', 1),
(315, 10, 21, 1, 'Item', '2180059', 'NA', '5 ml', 1),
(316, 10, 21, 1, 'Item', '2180060', 'NA', '5 ml', 1),
(317, 10, 21, 1, 'Item', '2180061', 'NA', '5 ml', 1),
(318, 10, 21, 1, 'Item', '2180062', 'NA', '5 ml', 1),
(319, 10, 21, 1, 'Item', '2180063', 'NA', '5 ml', 1),
(320, 10, 21, 1, 'Item', '2180064', 'NA', '5 ml', 1),
(321, 10, 21, 1, 'Item', '2180065', 'NA', '5 ml', 1),
(322, 10, 21, 1, 'Item', '2180066', 'NA', '5 ml', 1),
(323, 10, 21, 1, 'Item', '2180067', 'NA', '5 ml', 1),
(324, 10, 21, 1, 'Item', '2180068', 'NA', '5 ml', 1),
(325, 10, 21, 1, 'Item', '2180069', 'NA', '5 ml', 1),
(326, 10, 21, 1, 'Item', '2180070', 'NA', '5 ml', 1),
(327, 10, 21, 1, 'Item', '2180071', 'NA', '5 ml', 1),
(328, 10, 21, 1, 'Item', '2180072', 'NA', '5 ml', 1),
(329, 10, 21, 1, 'Item', '2180073', 'NA', '5 ml', 1),
(330, 10, 21, 1, 'Item', '2180074', 'NA', '5 ml', 1),
(331, 10, 21, 1, 'Item', '2180075', 'NA', '5 ml', 1),
(332, 10, 21, 1, 'Item', '2180076', 'NA', '5 ml', 1),
(333, 10, 21, 1, 'Item', '2180077', 'NA', '5 ml', 1),
(334, 10, 21, 1, 'Item', '2180078', 'NA', '5 ml', 1),
(335, 10, 21, 1, 'Item', '2180079', 'NA', '5 ml', 1),
(336, 10, 21, 1, 'Item', '2180080', 'NA', '5 ml', 1),
(337, 10, 21, 1, 'Item', '2180081', 'NA', '5 ml', 1),
(338, 10, 21, 1, 'Item', '2180082', 'NA', '5 ml', 1),
(339, 10, 21, 1, 'Item', '2180083', 'NA', '5 ml', 1),
(340, 10, 21, 1, 'Item', '2180084', 'NA', '5 ml', 1),
(341, 10, 21, 1, 'Item', '2180085', 'NA', '5 ml', 1),
(342, 10, 21, 1, 'Item', '2180086', 'NA', '5 ml', 1),
(343, 10, 21, 1, 'Item', '2180087', 'NA', '5 ml', 1),
(344, 10, 21, 1, 'Item', '2180088', 'NA', '5 ml', 1),
(345, 10, 21, 1, 'Item', '2180089', 'NA', '5 ml', 1),
(346, 10, 21, 1, 'Item', '2180090', 'NA', '5 ml', 1),
(347, 10, 21, 1, 'Item', '2180091', 'NA', '5 ml', 1),
(348, 10, 21, 1, 'Item', '2180092', 'NA', '5 ml', 1),
(349, 10, 21, 1, 'Item', '2180093', 'NA', '5 ml', 1),
(350, 10, 21, 1, 'Item', '2180094', 'NA', '5 ml', 1),
(351, 10, 21, 1, 'Item', '2180095', 'NA', '5 ml', 1),
(352, 10, 21, 1, 'Item', '2180096', 'NA', '5 ml', 1),
(353, 10, 21, 1, 'Item', '2180097', 'NA', '5 ml', 1),
(354, 10, 21, 1, 'Item', '2180098', 'NA', '5 ml', 1),
(355, 10, 21, 1, 'Item', '2180099', 'NA', '5 ml', 1),
(356, 10, 21, 1, 'Item', '2180100', 'NA', '5 ml', 1),
(357, 10, 21, 1, 'Item', '2180101', 'NA', '5 ml', 1),
(358, 10, 21, 1, 'Item', '2180102', 'NA', '5 ml', 1),
(359, 10, 21, 1, 'Item', '2180103', 'NA', '5 ml', 1),
(360, 10, 21, 1, 'Item', '2180104', 'NA', '5 ml', 1),
(361, 10, 21, 1, 'Item', '2180105', 'NA', '5 ml', 1),
(362, 10, 21, 1, 'Item', '2180106', 'NA', '5 ml', 1),
(363, 10, 21, 1, 'Item', '2180107', 'NA', '5 ml', 1),
(364, 10, 21, 1, 'Item', '2180108', 'NA', '5 ml', 1),
(365, 10, 21, 1, 'Item', '2180109', 'NA', '5 ml', 1),
(366, 10, 21, 1, 'Item', '2180110', 'NA', '5 ml', 1),
(367, 10, 21, 1, 'Item', '2180111', 'NA', '5 ml', 1),
(368, 10, 21, 1, 'Item', '2180112', 'NA', '5 ml', 1),
(369, 10, 21, 1, 'Item', '2180113', 'NA', '5 ml', 1),
(370, 10, 21, 1, 'Item', '2180114', 'NA', '5 ml', 1),
(371, 10, 21, 1, 'Item', '2180115', 'NA', '5 ml', 1),
(372, 10, 21, 1, 'Item', '2180116', 'NA', '5 ml', 1),
(373, 10, 21, 1, 'Item', '2180117', 'NA', '5 ml', 1),
(374, 10, 21, 1, 'Item', '2180118', 'NA', '5 ml', 1),
(375, 10, 21, 1, 'Item', '2180119', 'NA', '5 ml', 1),
(376, 10, 21, 1, 'Item', '2180120', 'NA', '5 ml', 1),
(377, 10, 21, 1, 'Item', '2180121', 'NA', '5 ml', 1),
(378, 10, 21, 1, 'Item', '2180122', 'NA', '5 ml', 1),
(379, 10, 21, 1, 'Item', '2180123', 'NA', '5 ml', 1),
(380, 10, 21, 1, 'Item', '2180124', 'NA', '5 ml', 1),
(381, 10, 21, 1, 'Item', '2180125', 'NA', '5 ml', 1),
(382, 10, 21, 1, 'Item', '2180126', 'NA', '5 ml', 1),
(383, 10, 21, 1, 'Item', '2180127', 'NA', '5 ml', 1),
(384, 10, 21, 1, 'Item', '2180128', 'NA', '5 ml', 1),
(385, 10, 21, 1, 'Item', '2180129', 'NA', '5 ml', 1),
(386, 10, 21, 1, 'Item', '2180130', 'NA', '5 ml', 1),
(387, 10, 21, 1, 'Item', '2180131', 'NA', '5 ml', 1),
(388, 10, 21, 1, 'Item', '2180132', 'NA', '5 ml', 1),
(389, 10, 21, 1, 'Item', '2180133', 'NA', '5 ml', 1),
(390, 10, 21, 1, 'Item', '2180134', 'NA', '5 ml', 1),
(391, 10, 21, 1, 'Item', '2180135', 'NA', '5 ml', 1),
(392, 10, 21, 1, 'Item', '2180136', 'NA', '5 ml', 1),
(393, 10, 21, 1, 'Item', '2180137', 'NA', '5 ml', 1),
(394, 10, 21, 1, 'Item', '2180138', 'NA', '5 ml', 1),
(395, 10, 21, 1, 'Item', '2180139', 'NA', '5 ml', 1),
(396, 10, 21, 1, 'Item', '2180140', 'NA', '5 ml', 1),
(397, 10, 21, 1, 'Item', '2180141', 'NA', '5 ml', 1),
(398, 10, 21, 1, 'Item', '2180142', 'NA', '5 ml', 1),
(399, 10, 21, 1, 'Item', '2180143', 'NA', '5 ml', 1),
(400, 10, 21, 1, 'Item', '2180144', 'NA', '5 ml', 1),
(401, 10, 21, 1, 'Item', '2180145', 'NA', '5 ml', 1),
(402, 10, 21, 1, 'Item', '2180146', 'NA', '5 ml', 1),
(403, 10, 21, 1, 'Item', '2180147', 'NA', '5 ml', 1),
(404, 10, 21, 1, 'Item', '2180148', 'NA', '5 ml', 1),
(405, 10, 21, 1, 'Item', '2180149', 'NA', '5 ml', 1),
(406, 10, 21, 1, 'Item', '2180150', 'NA', '5 ml', 1),
(407, 10, 21, 1, 'Item', '2180151', 'NA', '5 ml', 1),
(408, 10, 21, 1, 'Item', '2180152', 'NA', '5 ml', 1),
(409, 10, 21, 1, 'Item', '2180153', 'NA', '5 ml', 1),
(410, 10, 21, 1, 'Item', '2180154', 'NA', '5 ml', 1),
(411, 10, 21, 1, 'Item', '2180155', 'NA', '5 ml', 1),
(412, 10, 21, 1, 'Item', '2180156', 'NA', '5 ml', 1),
(413, 10, 21, 1, 'Item', '2180157', 'NA', '5 ml', 1),
(414, 10, 21, 1, 'Item', '2180158', 'NA', '5 ml', 1),
(415, 10, 21, 1, 'Item', '2180159', 'NA', '5 ml', 1),
(416, 10, 21, 1, 'Item', '2180160', 'NA', '5 ml', 1),
(417, 10, 21, 1, 'Item', '2180161', 'NA', '5 ml', 1),
(418, 10, 21, 1, 'Item', '2180162', 'NA', '5 ml', 1),
(419, 10, 21, 1, 'Item', '2180163', 'NA', '5 ml', 1),
(420, 10, 21, 1, 'Item', '2180164', 'NA', '5 ml', 1),
(421, 10, 21, 1, 'Item', '2180165', 'NA', '5 ml', 1),
(422, 10, 21, 1, 'Item', '2180166', 'NA', '5 ml', 1),
(423, 10, 21, 1, 'Item', '2180167', 'NA', '5 ml', 1),
(424, 10, 21, 1, 'Item', '2180168', 'NA', '5 ml', 1),
(425, 10, 21, 1, 'Item', '2180169', 'NA', '5 ml', 1),
(426, 10, 21, 1, 'Item', '2180170', 'NA', '5 ml', 1),
(427, 10, 21, 1, 'Item', '2180171', 'NA', '5 ml', 1),
(428, 10, 21, 1, 'Item', '2180172', 'NA', '5 ml', 1),
(429, 10, 21, 1, 'Item', '2180173', 'NA', '5 ml', 1),
(430, 10, 21, 1, 'Item', '2180174', 'NA', '5 ml', 1),
(431, 10, 21, 1, 'Item', '2180175', 'NA', '5 ml', 1),
(432, 10, 21, 1, 'Item', '2180176', 'NA', '5 ml', 1),
(433, 10, 21, 1, 'Item', '2180177', 'NA', '5 ml', 1),
(434, 10, 21, 1, 'Item', '2180178', 'NA', '5 ml', 1),
(435, 10, 21, 1, 'Item', '2180179', 'NA', '5 ml', 1),
(436, 10, 21, 1, 'Item', '2180180', 'NA', '5 ml', 1),
(437, 10, 21, 1, 'Item', '2180181', 'NA', '5 ml', 1),
(438, 10, 21, 1, 'Item', '2180182', 'NA', '5 ml', 1),
(439, 10, 21, 1, 'Item', '2180183', 'NA', '5 ml', 1),
(440, 10, 21, 1, 'Item', '2180184', 'NA', '5 ml', 1),
(441, 10, 21, 1, 'Item', '2180185', 'NA', '5 ml', 1),
(442, 10, 21, 1, 'Item', '2180186', 'NA', '5 ml', 1),
(443, 10, 21, 1, 'Item', '2180187', 'NA', '5 ml', 1),
(444, 10, 21, 1, 'Item', '2180188', 'NA', '5 ml', 1),
(445, 10, 21, 1, 'Item', '2180189', 'NA', '5 ml', 1),
(446, 10, 21, 1, 'Item', '2180190', 'NA', '5 ml', 1),
(447, 10, 21, 1, 'Item', '2180191', 'NA', '5 ml', 1),
(448, 10, 21, 1, 'Item', '2180192', 'NA', '5 ml', 1),
(449, 10, 21, 1, 'Item', '2180193', 'NA', '5 ml', 1),
(450, 10, 21, 1, 'Item', '2180194', 'NA', '5 ml', 1),
(451, 10, 21, 1, 'Item', '2180195', 'NA', '5 ml', 1),
(452, 10, 21, 1, 'Item', '2180196', 'NA', '5 ml', 1),
(453, 10, 21, 1, 'Item', '2180197', 'NA', '5 ml', 1),
(454, 10, 21, 1, 'Item', '2180198', 'NA', '5 ml', 1),
(455, 10, 21, 1, 'Item', '2180199', 'NA', '5 ml', 1),
(456, 10, 21, 1, 'Item', '2180200', 'NA', '5 ml', 1),
(457, 10, 21, 1, 'Item', '2180201', 'NA', '5 ml', 1),
(458, 10, 21, 1, 'Item', '2180202', 'NA', '5 ml', 1),
(459, 10, 21, 1, 'Item', '2180203', 'NA', '5 ml', 1),
(460, 10, 21, 1, 'Item', '2180204', 'NA', '5 ml', 1),
(461, 10, 21, 1, 'Item', '2180205', 'NA', '5 ml', 1),
(462, 10, 21, 1, 'Item', '2180206', 'NA', '5 ml', 1),
(463, 10, 21, 1, 'Item', '2180207', 'NA', '5 ml', 1),
(464, 10, 21, 1, 'Item', '2180208', 'NA', '5 ml', 1),
(465, 10, 21, 1, 'Item', '2180209', 'NA', '5 ml', 1),
(466, 10, 21, 1, 'Item', '2180210', 'NA', '5 ml', 1),
(467, 10, 21, 1, 'Item', '2180211', 'NA', '5 ml', 1),
(468, 10, 21, 1, 'Item', '2180212', 'NA', '5 ml', 1),
(469, 10, 21, 1, 'Item', '2180213', 'NA', '5 ml', 1),
(470, 10, 21, 1, 'Item', '2180214', 'NA', '5 ml', 1),
(471, 10, 21, 1, 'Item', '2180215', 'NA', '5 ml', 1),
(472, 10, 21, 1, 'Item', '2180216', 'NA', '5 ml', 1),
(473, 10, 21, 1, 'Item', '2180217', 'NA', '5 ml', 1),
(474, 10, 21, 1, 'Item', '2180218', 'NA', '5 ml', 1),
(475, 10, 21, 1, 'Item', '2180219', 'NA', '5 ml', 1),
(476, 10, 21, 1, 'Item', '2180220', 'NA', '5 ml', 1),
(477, 10, 21, 1, 'Item', '2180221', 'NA', '5 ml', 1),
(478, 10, 21, 1, 'Item', '2180222', 'NA', '5 ml', 1),
(479, 10, 21, 1, 'Item', '2180223', 'NA', '5 ml', 1),
(480, 10, 21, 1, 'Item', '2180224', 'NA', '5 ml', 1),
(481, 10, 21, 1, 'Item', '2180225', 'NA', '5 ml', 1),
(482, 10, 21, 1, 'Item', '2180226', 'NA', '5 ml', 1),
(483, 10, 21, 1, 'Item', '2180227', 'NA', '5 ml', 1),
(484, 10, 21, 1, 'Item', '2180228', 'NA', '5 ml', 1),
(485, 10, 21, 1, 'Item', '2180229', 'NA', '5 ml', 1),
(486, 10, 21, 1, 'Item', '2180230', 'NA', '5 ml', 1),
(487, 10, 21, 1, 'Item', '2180231', 'NA', '5 ml', 1),
(488, 10, 21, 1, 'Item', '2180232', 'NA', '5 ml', 1),
(489, 10, 21, 1, 'Item', '2180233', 'NA', '5 ml', 1),
(490, 10, 21, 1, 'Item', '2180234', 'NA', '5 ml', 1),
(491, 10, 21, 1, 'Item', '2180235', 'NA', '5 ml', 1),
(492, 10, 21, 1, 'Item', '2180236', 'NA', '5 ml', 1),
(493, 10, 21, 1, 'Item', '2180237', 'NA', '5 ml', 1),
(494, 10, 21, 1, 'Item', '2180238', 'NA', '5 ml', 1),
(495, 10, 21, 1, 'Item', '2180239', 'NA', '5 ml', 1),
(496, 10, 21, 1, 'Item', '2180240', 'NA', '5 ml', 1),
(497, 10, 21, 1, 'Item', '2180241', 'NA', '5 ml', 1),
(498, 10, 21, 1, 'Item', '2180242', 'NA', '5 ml', 1),
(499, 10, 21, 1, 'Item', '2180243', 'NA', '5 ml', 1),
(500, 10, 21, 1, 'Item', '2180244', 'NA', '5 ml', 1),
(501, 10, 21, 1, 'Item', '2180245', 'NA', '5 ml', 1),
(502, 10, 21, 1, 'Item', '2180246', 'NA', '5 ml', 1),
(503, 10, 21, 1, 'Item', '2180247', 'NA', '5 ml', 1),
(504, 10, 21, 1, 'Item', '2180248', 'NA', '5 ml', 1),
(505, 10, 21, 1, 'Item', '2180249', 'NA', '5 ml', 1),
(506, 10, 21, 1, 'Item', '2180250', 'NA', '5 ml', 1),
(507, 10, 21, 1, 'Item', '2180251', 'NA', '5 ml', 1),
(508, 10, 21, 1, 'Item', '2180252', 'NA', '5 ml', 1),
(509, 10, 21, 1, 'Item', '2180253', 'NA', '5 ml', 1),
(510, 10, 21, 1, 'Item', '2180254', 'NA', '5 ml', 1),
(511, 10, 21, 1, 'Item', '2180255', 'NA', '5 ml', 1),
(512, 10, 21, 1, 'Item', '2180256', 'NA', '5 ml', 1),
(513, 10, 21, 1, 'Item', '2180257', 'NA', '5 ml', 1),
(514, 10, 21, 1, 'Item', '2180258', 'NA', '5 ml', 1),
(515, 10, 21, 1, 'Item', '2180259', 'NA', '5 ml', 1),
(516, 10, 21, 1, 'Item', '2180260', 'NA', '5 ml', 1),
(517, 10, 21, 1, 'Item', '2180261', 'NA', '5 ml', 1),
(518, 10, 21, 1, 'Item', '2180262', 'NA', '5 ml', 1),
(519, 10, 21, 1, 'Item', '2180263', 'NA', '5 ml', 1),
(520, 10, 21, 1, 'Item', '2180264', 'NA', '5 ml', 1),
(521, 10, 21, 1, 'Item', '2180265', 'NA', '5 ml', 1),
(522, 10, 21, 1, 'Item', '2180266', 'NA', '5 ml', 1),
(523, 10, 21, 1, 'Item', '2180267', 'NA', '5 ml', 1),
(524, 10, 21, 1, 'Item', '2180268', 'NA', '5 ml', 1),
(525, 10, 21, 1, 'Item', '2180269', 'NA', '5 ml', 1),
(526, 10, 21, 1, 'Item', '2180270', 'NA', '5 ml', 1),
(527, 10, 21, 1, 'Item', '2180271', 'NA', '5 ml', 1),
(528, 10, 21, 1, 'Item', '2180272', 'NA', '5 ml', 1),
(529, 10, 21, 1, 'Item', '2180273', 'NA', '5 ml', 1),
(530, 10, 21, 1, 'Item', '2180274', 'NA', '5 ml', 1),
(531, 10, 21, 1, 'Item', '2180275', 'NA', '5 ml', 1),
(532, 10, 21, 1, 'Item', '2180276', 'NA', '5 ml', 1),
(533, 10, 21, 1, 'Item', '2180277', 'NA', '5 ml', 1),
(534, 10, 21, 1, 'Item', '2180278', 'NA', '5 ml', 1),
(535, 10, 21, 1, 'Item', '2180279', 'NA', '5 ml', 1),
(536, 10, 21, 1, 'Item', '2180280', 'NA', '5 ml', 1),
(537, 10, 21, 1, 'Item', '2180281', 'NA', '5 ml', 1),
(538, 10, 21, 1, 'Item', '2180282', 'NA', '5 ml', 1),
(539, 10, 21, 1, 'Item', '2180283', 'NA', '5 ml', 1),
(540, 10, 21, 1, 'Item', '2180284', 'NA', '5 ml', 1),
(541, 10, 21, 1, 'Item', '2180285', 'NA', '5 ml', 1),
(542, 10, 21, 1, 'Item', '2180286', 'NA', '5 ml', 1),
(543, 10, 21, 1, 'Item', '2180287', 'NA', '5 ml', 1),
(544, 10, 21, 1, 'Item', '2180288', 'NA', '5 ml', 1),
(545, 10, 21, 1, 'Item', '2180289', 'NA', '5 ml', 1),
(546, 10, 21, 1, 'Item', '2180290', 'NA', '5 ml', 1),
(547, 10, 21, 1, 'Item', '2180291', 'NA', '5 ml', 1),
(548, 10, 21, 1, 'Item', '2180292', 'NA', '5 ml', 1),
(549, 10, 21, 1, 'Item', '2180293', 'NA', '5 ml', 1),
(550, 10, 21, 1, 'Item', '2180294', 'NA', '5 ml', 1),
(551, 10, 21, 1, 'Item', '2180295', 'NA', '5 ml', 1),
(552, 10, 21, 1, 'Item', '2180296', 'NA', '5 ml', 1),
(553, 10, 21, 1, 'Item', '2180297', 'NA', '5 ml', 1),
(554, 10, 21, 1, 'Item', '2180298', 'NA', '5 ml', 1),
(555, 10, 21, 1, 'Item', '2180299', 'NA', '5 ml', 1),
(556, 10, 21, 1, 'Item', '2180300', 'NA', '5 ml', 1),
(557, 10, 21, 1, 'Item', '2180301', 'NA', '5 ml', 1),
(558, 10, 21, 1, 'Item', '2180302', 'NA', '5 ml', 1),
(559, 10, 21, 1, 'Item', '2180303', 'NA', '5 ml', 1),
(560, 10, 21, 1, 'Item', '2180304', 'NA', '5 ml', 1),
(561, 10, 21, 1, 'Item', '2180305', 'NA', '5 ml', 1),
(562, 10, 21, 1, 'Item', '2180306', 'NA', '5 ml', 1),
(563, 10, 21, 1, 'Item', '2180307', 'NA', '5 ml', 1),
(564, 10, 21, 1, 'Item', '2180308', 'NA', '5 ml', 1),
(565, 10, 21, 1, 'Item', '2180309', 'NA', '5 ml', 1),
(566, 10, 21, 1, 'Item', '2180310', 'NA', '5 ml', 1),
(567, 10, 21, 1, 'Item', '2180311', 'NA', '5 ml', 1),
(568, 10, 21, 1, 'Item', '2180312', 'NA', '5 ml', 1),
(569, 10, 21, 1, 'Item', '2180313', 'NA', '5 ml', 1),
(570, 10, 21, 1, 'Item', '2180314', 'NA', '5 ml', 1),
(571, 10, 21, 1, 'Item', '2180315', 'NA', '5 ml', 1),
(572, 10, 21, 1, 'Item', '2180316', 'NA', '5 ml', 1),
(573, 10, 21, 1, 'Item', '2180317', 'NA', '5 ml', 1),
(574, 10, 21, 1, 'Item', '2180318', 'NA', '5 ml', 1),
(575, 10, 21, 1, 'Item', '2180319', 'NA', '5 ml', 1),
(576, 10, 21, 1, 'Item', '2180320', 'NA', '5 ml', 1),
(577, 10, 21, 1, 'Item', '2180321', 'NA', '5 ml', 1),
(578, 10, 21, 1, 'Item', '2180322', 'NA', '5 ml', 1),
(579, 10, 21, 1, 'Item', '2180323', 'NA', '5 ml', 1),
(580, 10, 21, 1, 'Item', '2180324', 'NA', '5 ml', 1),
(581, 10, 21, 1, 'Item', '2180325', 'NA', '5 ml', 1),
(582, 10, 21, 1, 'Item', '2180326', 'NA', '5 ml', 1),
(583, 10, 21, 1, 'Item', '2180327', 'NA', '5 ml', 1),
(584, 10, 21, 1, 'Item', '2180328', 'NA', '5 ml', 1),
(585, 10, 21, 1, 'Item', '2180329', 'NA', '5 ml', 1),
(586, 10, 21, 1, 'Item', '2180330', 'NA', '5 ml', 1),
(587, 10, 21, 1, 'Item', '2180331', 'NA', '5 ml', 1),
(588, 10, 21, 1, 'Item', '2180332', 'NA', '5 ml', 1),
(589, 10, 21, 1, 'Item', '2180333', 'NA', '5 ml', 1),
(590, 10, 21, 1, 'Item', '2180334', 'NA', '5 ml', 1),
(591, 10, 21, 1, 'Item', '2180335', 'NA', '5 ml', 1),
(592, 10, 21, 1, 'Item', '2180336', 'NA', '5 ml', 1),
(593, 10, 21, 1, 'Item', '2180337', 'NA', '5 ml', 1),
(594, 10, 21, 1, 'Item', '2180338', 'NA', '5 ml', 1),
(595, 10, 21, 1, 'Item', '2180339', 'NA', '5 ml', 1),
(596, 10, 21, 1, 'Item', '2180340', 'NA', '5 ml', 1),
(597, 10, 21, 1, 'Item', '2180341', 'NA', '5 ml', 1),
(598, 10, 21, 1, 'Item', '2180342', 'NA', '5 ml', 1),
(599, 10, 21, 1, 'Item', '2180343', 'NA', '5 ml', 1),
(600, 10, 21, 1, 'Item', '2180344', 'NA', '5 ml', 1),
(601, 10, 21, 1, 'Item', '2180345', 'NA', '5 ml', 1),
(602, 10, 21, 1, 'Item', '2180346', 'NA', '5 ml', 1),
(603, 10, 21, 1, 'Item', '2180347', 'NA', '5 ml', 1),
(604, 10, 21, 1, 'Item', '2180348', 'NA', '5 ml', 1),
(605, 10, 21, 1, 'Item', '2180349', 'NA', '5 ml', 1),
(606, 10, 21, 1, 'Item', '2180350', 'NA', '5 ml', 1),
(607, 10, 21, 1, 'Item', '2180351', 'NA', '5 ml', 1),
(608, 10, 21, 1, 'Item', '2180352', 'NA', '5 ml', 1),
(609, 10, 21, 1, 'Item', '2180353', 'NA', '5 ml', 1),
(610, 10, 21, 1, 'Item', '2180354', 'NA', '5 ml', 1),
(611, 10, 21, 1, 'Item', '2180355', 'NA', '5 ml', 1),
(612, 10, 21, 1, 'Item', '2180356', 'NA', '5 ml', 1),
(613, 10, 21, 1, 'Item', '2180357', 'NA', '5 ml', 1),
(614, 10, 21, 1, 'Item', '2180358', 'NA', '5 ml', 1),
(615, 10, 21, 1, 'Item', '2180359', 'NA', '5 ml', 1),
(616, 10, 21, 1, 'Item', '2180360', 'NA', '5 ml', 1),
(617, 10, 21, 1, 'Item', '2180361', 'NA', '5 ml', 1),
(618, 10, 21, 1, 'Item', '2180362', 'NA', '5 ml', 1),
(619, 10, 21, 1, 'Item', '2180363', 'NA', '5 ml', 1),
(620, 10, 21, 1, 'Item', '2180364', 'NA', '5 ml', 1),
(621, 10, 21, 1, 'Item', '2180365', 'NA', '5 ml', 1),
(622, 10, 21, 1, 'Item', '2180366', 'NA', '5 ml', 1),
(623, 10, 21, 1, 'Item', '2180367', 'NA', '5 ml', 1),
(624, 10, 21, 1, 'Item', '2180368', 'NA', '5 ml', 1),
(625, 10, 21, 1, 'Item', '2180369', 'NA', '5 ml', 1),
(626, 10, 21, 1, 'Item', '2180370', 'NA', '5 ml', 1),
(627, 10, 21, 1, 'Item', '2180371', 'NA', '5 ml', 1),
(628, 10, 21, 1, 'Item', '2180372', 'NA', '5 ml', 1),
(629, 10, 21, 1, 'Item', '2180373', 'NA', '5 ml', 1),
(630, 10, 21, 1, 'Item', '2180374', 'NA', '5 ml', 1),
(631, 10, 21, 1, 'Item', '2180375', 'NA', '5 ml', 1),
(632, 10, 21, 1, 'Item', '2180376', 'NA', '5 ml', 1),
(633, 10, 21, 1, 'Item', '2180377', 'NA', '5 ml', 1),
(634, 10, 21, 1, 'Item', '2180378', 'NA', '5 ml', 1),
(635, 10, 21, 1, 'Item', '2180379', 'NA', '5 ml', 1),
(636, 10, 21, 1, 'Item', '2180380', 'NA', '5 ml', 1),
(637, 10, 21, 1, 'Item', '2180381', 'NA', '5 ml', 1),
(638, 10, 21, 1, 'Item', '2180382', 'NA', '5 ml', 1),
(639, 10, 21, 1, 'Item', '2180383', 'NA', '5 ml', 1),
(640, 10, 21, 1, 'Item', '2180384', 'NA', '5 ml', 1),
(641, 10, 21, 1, 'Item', '2180385', 'NA', '5 ml', 1),
(642, 10, 21, 1, 'Item', '2180386', 'NA', '5 ml', 1),
(643, 10, 21, 1, 'Item', '2180387', 'NA', '5 ml', 1),
(644, 10, 21, 1, 'Item', '2180388', 'NA', '5 ml', 1),
(645, 10, 21, 1, 'Item', '2180389', 'NA', '5 ml', 1),
(646, 10, 21, 1, 'Item', '2180390', 'NA', '5 ml', 1),
(647, 10, 21, 1, 'Item', '2180391', 'NA', '5 ml', 1),
(648, 10, 21, 1, 'Item', '2180392', 'NA', '5 ml', 1),
(649, 10, 21, 1, 'Item', '2180393', 'NA', '5 ml', 1),
(650, 10, 21, 1, 'Item', '2180394', 'NA', '5 ml', 1),
(651, 10, 21, 1, 'Item', '2180395', 'NA', '5 ml', 1),
(652, 10, 21, 1, 'Item', '2180396', 'NA', '5 ml', 1),
(653, 10, 21, 1, 'Item', '2180397', 'NA', '5 ml', 1),
(654, 10, 21, 1, 'Item', '2180398', 'NA', '5 ml', 1),
(655, 10, 21, 1, 'Item', '2180399', 'NA', '5 ml', 1),
(656, 10, 21, 1, 'Item', '2180400', 'NA', '5 ml', 1),
(657, 10, 21, 1, 'Item', '2180401', 'NA', '5 ml', 1),
(658, 10, 21, 1, 'Item', '2180402', 'NA', '5 ml', 1),
(659, 10, 21, 1, 'Item', '2180403', 'NA', '5 ml', 1),
(660, 10, 21, 1, 'Item', '2180404', 'NA', '5 ml', 1),
(661, 10, 21, 1, 'Item', '2180405', 'NA', '5 ml', 1),
(662, 10, 21, 1, 'Item', '2180406', 'NA', '5 ml', 1),
(663, 10, 21, 1, 'Item', '2180407', 'NA', '5 ml', 1),
(664, 10, 21, 1, 'Item', '2180408', 'NA', '5 ml', 1),
(665, 10, 21, 1, 'Item', '2180409', 'NA', '5 ml', 1),
(666, 10, 21, 1, 'Item', '2180410', 'NA', '5 ml', 1),
(667, 10, 21, 1, 'Item', '2180411', 'NA', '5 ml', 1),
(668, 10, 21, 1, 'Item', '2180412', 'NA', '5 ml', 1),
(669, 10, 21, 1, 'Item', '2180413', 'NA', '5 ml', 1),
(670, 10, 21, 1, 'Item', '2180414', 'NA', '5 ml', 1),
(671, 10, 21, 1, 'Item', '2180415', 'NA', '5 ml', 1),
(672, 10, 21, 1, 'Item', '2180416', 'NA', '5 ml', 1),
(673, 10, 21, 1, 'Item', '2180417', 'NA', '5 ml', 1),
(674, 10, 21, 1, 'Item', '2180418', 'NA', '5 ml', 1),
(675, 10, 21, 1, 'Item', '2180419', 'NA', '5 ml', 1),
(676, 10, 21, 1, 'Item', '2180420', 'NA', '5 ml', 1),
(677, 10, 21, 1, 'Item', '2180421', 'NA', '5 ml', 1),
(678, 10, 21, 1, 'Item', '2180422', 'NA', '5 ml', 1),
(679, 10, 21, 1, 'Item', '2180423', 'NA', '5 ml', 1),
(680, 10, 21, 1, 'Item', '2180424', 'NA', '5 ml', 1),
(681, 10, 21, 1, 'Item', '2180425', 'NA', '5 ml', 1),
(682, 10, 21, 1, 'Item', '2180426', 'NA', '5 ml', 1),
(683, 10, 21, 1, 'Item', '2180427', 'NA', '5 ml', 1),
(684, 10, 21, 1, 'Item', '2180428', 'NA', '5 ml', 1),
(685, 10, 21, 1, 'Item', '2180429', 'NA', '5 ml', 1),
(686, 10, 21, 1, 'Item', '2180430', 'NA', '5 ml', 1),
(687, 10, 21, 1, 'Item', '2180431', 'NA', '5 ml', 1),
(688, 10, 21, 1, 'Item', '2180432', 'NA', '5 ml', 1),
(689, 10, 21, 1, 'Item', '2180433', 'NA', '5 ml', 1),
(690, 10, 21, 1, 'Item', '2180434', 'NA', '5 ml', 1),
(691, 10, 21, 1, 'Item', '2180435', 'NA', '5 ml', 1),
(692, 10, 21, 1, 'Item', '2180436', 'NA', '5 ml', 1),
(693, 10, 21, 1, 'Item', '2180437', 'NA', '5 ml', 1),
(694, 10, 21, 1, 'Item', '2180438', 'NA', '5 ml', 1),
(695, 10, 21, 1, 'Item', '2180439', 'NA', '5 ml', 1),
(696, 10, 21, 1, 'Item', '2180440', 'NA', '5 ml', 1),
(697, 10, 21, 1, 'Item', '2180441', 'NA', '5 ml', 1),
(698, 10, 21, 1, 'Item', '2180442', 'NA', '5 ml', 1),
(699, 10, 21, 1, 'Item', '2180443', 'NA', '5 ml', 1),
(700, 10, 21, 1, 'Item', '2180444', 'NA', '5 ml', 1),
(701, 10, 21, 1, 'Item', '2180445', 'NA', '5 ml', 1),
(702, 10, 21, 1, 'Item', '2180446', 'NA', '5 ml', 1),
(703, 10, 21, 1, 'Item', '2180447', 'NA', '5 ml', 1),
(704, 10, 21, 1, 'Item', '2180448', 'NA', '5 ml', 1),
(705, 10, 21, 1, 'Item', '2180449', 'NA', '5 ml', 1),
(706, 10, 21, 1, 'Item', '2180450', 'NA', '5 ml', 1),
(707, 10, 21, 1, 'Item', '2180451', 'NA', '5 ml', 1),
(708, 10, 21, 1, 'Item', '2180452', 'NA', '5 ml', 1),
(709, 10, 21, 1, 'Item', '2180453', 'NA', '5 ml', 1),
(710, 10, 21, 1, 'Item', '2180454', 'NA', '5 ml', 1),
(711, 10, 21, 1, 'Item', '2180455', 'NA', '5 ml', 1),
(712, 10, 21, 1, 'Item', '2180456', 'NA', '5 ml', 1),
(713, 10, 21, 1, 'Item', '2180457', 'NA', '5 ml', 1),
(714, 10, 21, 1, 'Item', '2180458', 'NA', '5 ml', 1),
(715, 10, 21, 1, 'Item', '2180459', 'NA', '5 ml', 1),
(716, 10, 21, 1, 'Item', '2180460', 'NA', '5 ml', 1),
(717, 10, 21, 1, 'Item', '2180461', 'NA', '5 ml', 1),
(718, 10, 21, 1, 'Item', '2180462', 'NA', '5 ml', 1),
(719, 10, 21, 1, 'Item', '2180463', 'NA', '5 ml', 1),
(720, 10, 21, 1, 'Item', '2180464', 'NA', '5 ml', 1),
(721, 10, 21, 1, 'Item', '2180465', 'NA', '5 ml', 1),
(722, 10, 21, 1, 'Item', '2180466', 'NA', '5 ml', 1),
(723, 10, 21, 1, 'Item', '2180467', 'NA', '5 ml', 1),
(724, 10, 21, 1, 'Item', '2180468', 'NA', '5 ml', 1),
(725, 10, 21, 1, 'Item', '2180469', 'NA', '5 ml', 1),
(726, 10, 21, 1, 'Item', '2180470', 'NA', '5 ml', 1),
(727, 10, 21, 1, 'Item', '2180471', 'NA', '5 ml', 1),
(728, 10, 21, 1, 'Item', '2180472', 'NA', '5 ml', 1),
(729, 10, 21, 1, 'Item', '2180473', 'NA', '5 ml', 1),
(730, 10, 21, 1, 'Item', '2180474', 'NA', '5 ml', 1),
(731, 10, 21, 1, 'Item', '2180475', 'NA', '5 ml', 1),
(732, 10, 21, 1, 'Item', '2180476', 'NA', '5 ml', 1),
(733, 10, 21, 1, 'Item', '2180477', 'NA', '5 ml', 1),
(734, 10, 21, 1, 'Item', '2180478', 'NA', '5 ml', 1),
(735, 10, 21, 1, 'Item', '2180479', 'NA', '5 ml', 1),
(736, 10, 21, 1, 'Item', '2180480', 'NA', '5 ml', 1),
(737, 10, 21, 1, 'Item', '2180481', 'NA', '5 ml', 1),
(738, 10, 21, 1, 'Item', '2180482', 'NA', '5 ml', 1),
(739, 10, 21, 1, 'Item', '2180483', 'NA', '5 ml', 1),
(740, 10, 21, 1, 'Item', '2180484', 'NA', '5 ml', 1),
(741, 10, 21, 1, 'Item', '2180485', 'NA', '5 ml', 1),
(742, 10, 21, 1, 'Item', '2180486', 'NA', '5 ml', 1),
(743, 10, 21, 1, 'Item', '2180487', 'NA', '5 ml', 1),
(744, 10, 21, 1, 'Item', '2180488', 'NA', '5 ml', 1),
(745, 10, 21, 1, 'Item', '2180489', 'NA', '5 ml', 1),
(746, 10, 21, 1, 'Item', '2180490', 'NA', '5 ml', 1),
(747, 10, 21, 1, 'Item', '2180491', 'NA', '5 ml', 1),
(748, 10, 21, 1, 'Item', '2180492', 'NA', '5 ml', 1),
(749, 10, 21, 1, 'Item', '2180493', 'NA', '5 ml', 1),
(750, 10, 21, 1, 'Item', '2180494', 'NA', '5 ml', 1),
(751, 10, 21, 1, 'Item', '2180495', 'NA', '5 ml', 1),
(752, 10, 21, 1, 'Item', '2180496', 'NA', '5 ml', 1),
(753, 10, 21, 1, 'Item', '2180497', 'NA', '5 ml', 1),
(754, 10, 21, 1, 'Item', '2180498', 'NA', '5 ml', 1),
(755, 10, 21, 1, 'Item', '2180499', 'NA', '5 ml', 1),
(756, 10, 21, 1, 'Item', '2180500', 'NA', '5 ml', 1),
(757, 10, 21, 1, 'Item', '2180501', 'NA', '5 ml', 1),
(758, 10, 21, 1, 'Item', '2180502', 'NA', '5 ml', 1),
(759, 10, 21, 1, 'Item', '2180503', 'NA', '5 ml', 1),
(760, 10, 21, 1, 'Item', '2180504', 'NA', '5 ml', 1),
(761, 10, 21, 1, 'Item', '2180505', 'NA', '5 ml', 1),
(762, 10, 21, 1, 'Item', '2180506', 'NA', '5 ml', 1),
(763, 10, 21, 1, 'Item', '2180507', 'NA', '5 ml', 1),
(764, 10, 21, 1, 'Item', '2180508', 'NA', '5 ml', 1),
(765, 10, 21, 1, 'Item', '2180509', 'NA', '5 ml', 1),
(766, 10, 21, 1, 'Item', '2180510', 'NA', '5 ml', 1),
(767, 10, 21, 1, 'Item', '2180511', 'NA', '5 ml', 1),
(768, 10, 21, 1, 'Item', '2180512', 'NA', '5 ml', 1),
(769, 10, 21, 1, 'Item', '2180513', 'NA', '5 ml', 1),
(770, 10, 21, 1, 'Item', '2180514', 'NA', '5 ml', 1),
(771, 10, 21, 1, 'Item', '2180515', 'NA', '5 ml', 1),
(772, 10, 21, 1, 'Item', '2180516', 'NA', '5 ml', 1),
(773, 10, 21, 1, 'Item', '2180517', 'NA', '5 ml', 1),
(774, 10, 21, 1, 'Item', '2180518', 'NA', '5 ml', 1),
(775, 10, 21, 1, 'Item', '2180519', 'NA', '5 ml', 1),
(776, 10, 21, 1, 'Item', '2180520', 'NA', '5 ml', 1),
(777, 10, 21, 1, 'Item', '2180521', 'NA', '5 ml', 1),
(778, 10, 21, 1, 'Item', '2180522', 'NA', '5 ml', 1),
(779, 10, 21, 1, 'Item', '2180523', 'NA', '5 ml', 1),
(780, 10, 21, 1, 'Item', '2180524', 'NA', '5 ml', 1),
(781, 10, 21, 1, 'Item', '2180525', 'NA', '5 ml', 1),
(782, 10, 21, 1, 'Item', '2180526', 'NA', '5 ml', 1),
(783, 10, 21, 1, 'Item', '2180527', 'NA', '5 ml', 1),
(784, 10, 21, 1, 'Item', '2180528', 'NA', '5 ml', 1),
(785, 10, 21, 1, 'Item', '2180529', 'NA', '5 ml', 1),
(786, 10, 21, 1, 'Item', '2180530', 'NA', '5 ml', 1),
(787, 10, 21, 1, 'Item', '2180531', 'NA', '5 ml', 1),
(788, 10, 21, 1, 'Item', '2180532', 'NA', '5 ml', 1),
(789, 10, 21, 1, 'Item', '2180533', 'NA', '5 ml', 1),
(790, 10, 21, 1, 'Item', '2180534', 'NA', '5 ml', 1),
(791, 10, 21, 1, 'Item', '2180535', 'NA', '5 ml', 1),
(792, 10, 21, 1, 'Item', '2180536', 'NA', '5 ml', 1),
(793, 10, 21, 1, 'Item', '2180537', 'NA', '5 ml', 1),
(794, 10, 21, 1, 'Item', '2180538', 'NA', '5 ml', 1),
(795, 10, 21, 1, 'Item', '2180539', 'NA', '5 ml', 1),
(796, 10, 21, 1, 'Item', '2180540', 'NA', '5 ml', 1),
(797, 10, 21, 1, 'Item', '2180541', 'NA', '5 ml', 1),
(798, 10, 21, 1, 'Item', '2180542', 'NA', '5 ml', 1),
(799, 10, 21, 1, 'Item', '2180543', 'NA', '5 ml', 1),
(800, 10, 21, 1, 'Item', '2180544', 'NA', '5 ml', 1),
(801, 10, 21, 1, 'Item', '2180545', 'NA', '5 ml', 1),
(802, 10, 21, 1, 'Item', '2180546', 'NA', '5 ml', 1),
(803, 10, 21, 1, 'Item', '2180547', 'NA', '5 ml', 1),
(804, 10, 21, 1, 'Item', '2180548', 'NA', '5 ml', 1),
(805, 10, 21, 1, 'Item', '2180549', 'NA', '5 ml', 1),
(806, 10, 21, 1, 'Item', '2180550', 'NA', '5 ml', 1),
(807, 10, 21, 1, 'Item', '2180551', 'NA', '5 ml', 1),
(808, 10, 21, 1, 'Item', '2180552', 'NA', '5 ml', 1),
(809, 10, 21, 1, 'Item', '2180553', 'NA', '5 ml', 1),
(810, 10, 21, 1, 'Item', '2180554', 'NA', '5 ml', 1),
(811, 10, 21, 1, 'Item', '2180555', 'NA', '5 ml', 1),
(812, 10, 21, 1, 'Item', '2180556', 'NA', '5 ml', 1),
(813, 10, 21, 1, 'Item', '2180557', 'NA', '5 ml', 1),
(814, 10, 21, 1, 'Item', '2180558', 'NA', '5 ml', 1),
(815, 10, 21, 1, 'Item', '2180559', 'NA', '5 ml', 1),
(816, 10, 21, 1, 'Item', '2180560', 'NA', '5 ml', 1),
(817, 10, 21, 1, 'Item', '2180561', 'NA', '5 ml', 1),
(818, 10, 21, 1, 'Item', '2180562', 'NA', '5 ml', 1),
(819, 10, 21, 1, 'Item', '2180563', 'NA', '5 ml', 1),
(820, 10, 21, 1, 'Item', '2180564', 'NA', '5 ml', 1),
(821, 10, 21, 1, 'Item', '2180565', 'NA', '5 ml', 1),
(822, 10, 21, 1, 'Item', '2180566', 'NA', '5 ml', 1),
(823, 10, 21, 1, 'Item', '2180567', 'NA', '5 ml', 1),
(824, 10, 21, 1, 'Item', '2180568', 'NA', '5 ml', 1),
(825, 10, 21, 1, 'Item', '2180569', 'NA', '5 ml', 1),
(826, 10, 21, 1, 'Item', '2180570', 'NA', '5 ml', 1),
(827, 10, 21, 1, 'Item', '2180571', 'NA', '5 ml', 1),
(828, 10, 21, 1, 'Item', '2180572', 'NA', '5 ml', 1),
(829, 10, 21, 1, 'Item', '2180573', 'NA', '5 ml', 1),
(830, 10, 21, 1, 'Item', '2180574', 'NA', '5 ml', 1),
(831, 10, 21, 1, 'Item', '2180575', 'NA', '5 ml', 1),
(832, 10, 21, 1, 'Item', '2180576', 'NA', '5 ml', 1),
(833, 10, 21, 1, 'Item', '2180577', 'NA', '5 ml', 1),
(834, 10, 21, 1, 'Item', '2180578', 'NA', '5 ml', 1),
(835, 10, 21, 1, 'Item', '2180579', 'NA', '5 ml', 1),
(836, 10, 21, 1, 'Item', '2180580', 'NA', '5 ml', 1),
(837, 10, 21, 1, 'Item', '2180581', 'NA', '5 ml', 1),
(838, 10, 21, 1, 'Item', '2180582', 'NA', '5 ml', 1),
(839, 10, 21, 1, 'Item', '2180583', 'NA', '5 ml', 1),
(840, 10, 21, 1, 'Item', '2180584', 'NA', '5 ml', 1),
(841, 10, 21, 1, 'Item', '2180585', 'NA', '5 ml', 1),
(842, 10, 21, 1, 'Item', '2180586', 'NA', '5 ml', 1),
(843, 10, 21, 1, 'Item', '2180587', 'NA', '5 ml', 1),
(844, 10, 21, 1, 'Item', '2180588', 'NA', '5 ml', 1),
(845, 10, 21, 1, 'Item', '2180589', 'NA', '5 ml', 1),
(846, 10, 21, 1, 'Item', '2180590', 'NA', '5 ml', 1),
(847, 10, 21, 1, 'Item', '2180591', 'NA', '5 ml', 1),
(848, 10, 21, 1, 'Item', '2180592', 'NA', '5 ml', 1),
(849, 10, 21, 1, 'Item', '2180593', 'NA', '5 ml', 1),
(850, 10, 21, 1, 'Item', '2180594', 'NA', '5 ml', 1),
(851, 10, 21, 1, 'Item', '2180595', 'NA', '5 ml', 1),
(852, 10, 21, 1, 'Item', '2180596', 'NA', '5 ml', 1),
(853, 10, 21, 1, 'Item', '2180597', 'NA', '5 ml', 1),
(854, 10, 21, 1, 'Item', '2180598', 'NA', '5 ml', 1),
(855, 10, 21, 1, 'Item', '2180599', 'NA', '5 ml', 1),
(856, 10, 21, 1, 'Item', '2180600', 'NA', '5 ml', 1),
(857, 10, 21, 1, 'Item', '2180601', 'NA', '5 ml', 1),
(858, 10, 21, 1, 'Item', '2180602', 'NA', '5 ml', 1),
(859, 10, 21, 1, 'Item', '2180603', 'NA', '5 ml', 1),
(860, 10, 21, 1, 'Item', '2180604', 'NA', '5 ml', 1),
(861, 10, 21, 1, 'Item', '2180605', 'NA', '5 ml', 1),
(862, 10, 21, 1, 'Item', '2180606', 'NA', '5 ml', 1),
(863, 10, 21, 1, 'Item', '2180607', 'NA', '5 ml', 1),
(864, 10, 21, 1, 'Item', '2180608', 'NA', '5 ml', 1),
(865, 10, 21, 1, 'Item', '2180609', 'NA', '5 ml', 1),
(866, 10, 21, 1, 'Item', '2180610', 'NA', '5 ml', 1),
(867, 10, 21, 1, 'Item', '2180611', 'NA', '5 ml', 1),
(868, 10, 21, 1, 'Item', '2180612', 'NA', '5 ml', 1),
(869, 10, 21, 1, 'Item', '2180613', 'NA', '5 ml', 1),
(870, 10, 21, 1, 'Item', '2180614', 'NA', '5 ml', 1),
(871, 10, 21, 1, 'Item', '2180615', 'NA', '5 ml', 1),
(872, 10, 21, 1, 'Item', '2180616', 'NA', '5 ml', 1),
(873, 10, 21, 1, 'Item', '2180617', 'NA', '5 ml', 1),
(874, 10, 21, 1, 'Item', '2180618', 'NA', '5 ml', 1),
(875, 10, 21, 1, 'Item', '2180619', 'NA', '5 ml', 1),
(876, 10, 21, 1, 'Item', '2180620', 'NA', '5 ml', 1),
(877, 10, 21, 1, 'Item', '2180621', 'NA', '5 ml', 1),
(878, 10, 21, 1, 'Item', '2180622', 'NA', '5 ml', 1),
(879, 10, 21, 1, 'Item', '2180623', 'NA', '5 ml', 1),
(880, 10, 21, 1, 'Item', '2180624', 'NA', '5 ml', 1),
(881, 10, 21, 1, 'Item', '2180625', 'NA', '5 ml', 1),
(882, 10, 21, 1, 'Item', '2180626', 'NA', '5 ml', 1),
(883, 10, 21, 1, 'Item', '2180627', 'NA', '5 ml', 1),
(884, 10, 21, 1, 'Item', '2180628', 'NA', '5 ml', 1),
(885, 10, 21, 1, 'Item', '2180629', 'NA', '5 ml', 1),
(886, 10, 21, 1, 'Item', '2180630', 'NA', '5 ml', 1),
(887, 10, 21, 1, 'Item', '2180631', 'NA', '5 ml', 1),
(888, 10, 21, 1, 'Item', '2180632', 'NA', '5 ml', 1),
(889, 10, 21, 1, 'Item', '2180633', 'NA', '5 ml', 1),
(890, 10, 21, 1, 'Item', '2180634', 'NA', '5 ml', 1),
(891, 10, 21, 1, 'Item', '2180635', 'NA', '5 ml', 1),
(892, 10, 21, 1, 'Item', '2180636', 'NA', '5 ml', 1),
(893, 10, 21, 1, 'Item', '2180637', 'NA', '5 ml', 1),
(894, 10, 21, 1, 'Item', '2180638', 'NA', '5 ml', 1),
(895, 10, 21, 1, 'Item', '2180639', 'NA', '5 ml', 1),
(896, 10, 21, 1, 'Item', '2180640', 'NA', '5 ml', 1),
(897, 10, 21, 1, 'Item', '2180641', 'NA', '5 ml', 1),
(898, 10, 21, 1, 'Item', '2180642', 'NA', '5 ml', 1),
(899, 10, 21, 1, 'Item', '2180643', 'NA', '5 ml', 1),
(900, 10, 21, 1, 'Item', '2180644', 'NA', '5 ml', 1),
(901, 10, 21, 1, 'Item', '2180645', 'NA', '5 ml', 1),
(902, 10, 21, 1, 'Item', '2180646', 'NA', '5 ml', 1),
(903, 10, 21, 1, 'Item', '2180647', 'NA', '5 ml', 1),
(904, 10, 21, 1, 'Item', '2180648', 'NA', '5 ml', 1),
(905, 10, 21, 1, 'Item', '2180649', 'NA', '5 ml', 1),
(906, 10, 21, 1, 'Item', '2180650', 'NA', '5 ml', 1),
(907, 10, 21, 1, 'Item', '2180651', 'NA', '5 ml', 1),
(908, 10, 21, 1, 'Item', '2180652', 'NA', '5 ml', 1),
(909, 10, 21, 1, 'Item', '2180653', 'NA', '5 ml', 1),
(910, 10, 21, 1, 'Item', '2180654', 'NA', '5 ml', 1),
(911, 10, 21, 1, 'Item', '2180655', 'NA', '5 ml', 1),
(912, 10, 21, 1, 'Item', '2180656', 'NA', '5 ml', 1),
(913, 10, 21, 1, 'Item', '2180657', 'NA', '5 ml', 1),
(914, 10, 21, 1, 'Item', '2180658', 'NA', '5 ml', 1),
(915, 10, 21, 1, 'Item', '2180659', 'NA', '5 ml', 1),
(916, 10, 21, 1, 'Item', '2180660', 'NA', '5 ml', 1),
(917, 10, 21, 1, 'Item', '2180661', 'NA', '5 ml', 1),
(918, 10, 21, 1, 'Item', '2180662', 'NA', '5 ml', 1),
(919, 10, 21, 1, 'Item', '2180663', 'NA', '5 ml', 1),
(920, 10, 21, 1, 'Item', '2180664', 'NA', '5 ml', 1),
(921, 10, 21, 1, 'Item', '2180665', 'NA', '5 ml', 1),
(922, 10, 21, 1, 'Item', '2180666', 'NA', '5 ml', 1),
(923, 10, 21, 1, 'Item', '2180667', 'NA', '5 ml', 1),
(924, 10, 21, 1, 'Item', '2180668', 'NA', '5 ml', 1),
(925, 10, 21, 1, 'Item', '2180669', 'NA', '5 ml', 1),
(926, 10, 21, 1, 'Item', '2180670', 'NA', '5 ml', 1),
(927, 10, 21, 1, 'Item', '2180671', 'NA', '5 ml', 1),
(928, 10, 21, 1, 'Item', '2180672', 'NA', '5 ml', 1),
(929, 10, 21, 1, 'Item', '2180673', 'NA', '5 ml', 1),
(930, 10, 21, 1, 'Item', '2180674', 'NA', '5 ml', 1),
(931, 10, 21, 1, 'Item', '2180675', 'NA', '5 ml', 1),
(932, 10, 21, 1, 'Item', '2180676', 'NA', '5 ml', 1),
(933, 10, 21, 1, 'Item', '2180677', 'NA', '5 ml', 1),
(934, 10, 21, 1, 'Item', '2180678', 'NA', '5 ml', 1),
(935, 10, 21, 1, 'Item', '2180679', 'NA', '5 ml', 1),
(936, 10, 21, 1, 'Item', '2180680', 'NA', '5 ml', 1),
(937, 10, 21, 1, 'Item', '2180681', 'NA', '5 ml', 1),
(938, 10, 21, 1, 'Item', '2180682', 'NA', '5 ml', 1),
(939, 10, 21, 1, 'Item', '2180683', 'NA', '5 ml', 1),
(940, 10, 21, 1, 'Item', '2180684', 'NA', '5 ml', 1),
(941, 10, 21, 1, 'Item', '2180685', 'NA', '5 ml', 1),
(942, 10, 21, 1, 'Item', '2180686', 'NA', '5 ml', 1),
(943, 10, 21, 1, 'Item', '2180687', 'NA', '5 ml', 1),
(944, 10, 21, 1, 'Item', '2180688', 'NA', '5 ml', 1),
(945, 10, 21, 1, 'Item', '2180689', 'NA', '5 ml', 1),
(946, 10, 21, 1, 'Item', '2180690', 'NA', '5 ml', 1),
(947, 10, 21, 1, 'Item', '2180691', 'NA', '5 ml', 1),
(948, 10, 21, 1, 'Item', '2180692', 'NA', '5 ml', 1),
(949, 10, 21, 1, 'Item', '2180693', 'NA', '5 ml', 1),
(950, 10, 21, 1, 'Item', '2180694', 'NA', '5 ml', 1),
(951, 10, 21, 1, 'Item', '2180695', 'NA', '5 ml', 1),
(952, 10, 21, 1, 'Item', '2180696', 'NA', '5 ml', 1),
(953, 10, 21, 1, 'Item', '2180697', 'NA', '5 ml', 1),
(954, 10, 21, 1, 'Item', '2180698', 'NA', '5 ml', 1),
(955, 10, 21, 1, 'Item', '2180699', 'NA', '5 ml', 1),
(956, 10, 21, 1, 'Item', '2180700', 'NA', '5 ml', 1),
(957, 10, 21, 1, 'Item', '2180701', 'NA', '5 ml', 1),
(958, 10, 21, 1, 'Item', '2180702', 'NA', '5 ml', 1),
(959, 10, 21, 1, 'Item', '2180703', 'NA', '5 ml', 1),
(960, 10, 21, 1, 'Item', '2180704', 'NA', '5 ml', 1),
(961, 10, 21, 1, 'Item', '2180705', 'NA', '5 ml', 1),
(962, 10, 21, 1, 'Item', '2180706', 'NA', '5 ml', 1),
(963, 10, 21, 1, 'Item', '2180707', 'NA', '5 ml', 1),
(964, 10, 21, 1, 'Item', '2180708', 'NA', '5 ml', 1),
(965, 10, 21, 1, 'Item', '2180709', 'NA', '5 ml', 1);
INSERT INTO `tp_package_primary` (`id`, `product_id`, `lot_id`, `pack_type_id`, `package_type`, `package_sn`, `package_image`, `ineer_package_count`, `is_active`) VALUES
(966, 10, 21, 1, 'Item', '2180710', 'NA', '5 ml', 1),
(967, 10, 21, 1, 'Item', '2180711', 'NA', '5 ml', 1),
(968, 10, 21, 1, 'Item', '2180712', 'NA', '5 ml', 1),
(969, 10, 21, 1, 'Item', '2180713', 'NA', '5 ml', 1),
(970, 10, 21, 1, 'Item', '2180714', 'NA', '5 ml', 1),
(971, 10, 21, 1, 'Item', '2180715', 'NA', '5 ml', 1),
(972, 10, 21, 1, 'Item', '2180716', 'NA', '5 ml', 1),
(973, 10, 21, 1, 'Item', '2180717', 'NA', '5 ml', 1),
(974, 10, 21, 1, 'Item', '2180718', 'NA', '5 ml', 1),
(975, 10, 21, 1, 'Item', '2180719', 'NA', '5 ml', 1),
(976, 10, 21, 1, 'Item', '2180720', 'NA', '5 ml', 1),
(977, 10, 21, 1, 'Item', '2180721', 'NA', '5 ml', 1),
(978, 10, 21, 1, 'Item', '2180722', 'NA', '5 ml', 1),
(979, 10, 21, 1, 'Item', '2180723', 'NA', '5 ml', 1),
(980, 10, 21, 1, 'Item', '2180724', 'NA', '5 ml', 1),
(981, 10, 21, 1, 'Item', '2180725', 'NA', '5 ml', 1),
(982, 10, 21, 1, 'Item', '2180726', 'NA', '5 ml', 1),
(983, 10, 21, 1, 'Item', '2180727', 'NA', '5 ml', 1),
(984, 10, 21, 1, 'Item', '2180728', 'NA', '5 ml', 1),
(985, 10, 21, 1, 'Item', '2180729', 'NA', '5 ml', 1),
(986, 10, 21, 1, 'Item', '2180730', 'NA', '5 ml', 1),
(987, 10, 21, 1, 'Item', '2180731', 'NA', '5 ml', 1),
(988, 10, 21, 1, 'Item', '2180732', 'NA', '5 ml', 1),
(989, 10, 21, 1, 'Item', '2180733', 'NA', '5 ml', 1),
(990, 10, 21, 1, 'Item', '2180734', 'NA', '5 ml', 1),
(991, 10, 21, 1, 'Item', '2180735', 'NA', '5 ml', 1),
(992, 10, 21, 1, 'Item', '2180736', 'NA', '5 ml', 1),
(993, 10, 21, 1, 'Item', '2180737', 'NA', '5 ml', 1),
(994, 10, 21, 1, 'Item', '2180738', 'NA', '5 ml', 1),
(995, 10, 21, 1, 'Item', '2180739', 'NA', '5 ml', 1),
(996, 10, 21, 1, 'Item', '2180740', 'NA', '5 ml', 1),
(997, 10, 21, 1, 'Item', '2180741', 'NA', '5 ml', 1),
(998, 10, 21, 1, 'Item', '2180742', 'NA', '5 ml', 1),
(999, 10, 21, 1, 'Item', '2180743', 'NA', '5 ml', 1),
(1000, 10, 21, 1, 'Item', '2180744', 'NA', '5 ml', 1),
(1001, 10, 21, 1, 'Item', '2180745', 'NA', '5 ml', 1),
(1002, 10, 21, 1, 'Item', '2180746', 'NA', '5 ml', 1),
(1003, 10, 21, 1, 'Item', '2180747', 'NA', '5 ml', 1),
(1004, 10, 21, 1, 'Item', '2180748', 'NA', '5 ml', 1),
(1005, 10, 21, 1, 'Item', '2180749', 'NA', '5 ml', 1),
(1006, 10, 21, 1, 'Item', '2180750', 'NA', '5 ml', 1),
(1007, 10, 21, 1, 'Item', '2180751', 'NA', '5 ml', 1),
(1008, 10, 21, 1, 'Item', '2180752', 'NA', '5 ml', 1),
(1009, 10, 21, 1, 'Item', '2180753', 'NA', '5 ml', 1),
(1010, 10, 21, 1, 'Item', '2180754', 'NA', '5 ml', 1),
(1011, 10, 21, 1, 'Item', '2180755', 'NA', '5 ml', 1),
(1012, 10, 21, 1, 'Item', '2180756', 'NA', '5 ml', 1),
(1013, 10, 21, 1, 'Item', '2180757', 'NA', '5 ml', 1),
(1014, 10, 21, 1, 'Item', '2180758', 'NA', '5 ml', 1),
(1015, 10, 21, 1, 'Item', '2180759', 'NA', '5 ml', 1),
(1016, 10, 21, 1, 'Item', '2180760', 'NA', '5 ml', 1),
(1017, 10, 21, 1, 'Item', '2180761', 'NA', '5 ml', 1),
(1018, 10, 21, 1, 'Item', '2180762', 'NA', '5 ml', 1),
(1019, 10, 21, 1, 'Item', '2180763', 'NA', '5 ml', 1),
(1020, 10, 21, 1, 'Item', '2180764', 'NA', '5 ml', 1),
(1021, 10, 21, 1, 'Item', '2180765', 'NA', '5 ml', 1),
(1022, 10, 21, 1, 'Item', '2180766', 'NA', '5 ml', 1),
(1023, 10, 21, 1, 'Item', '2180767', 'NA', '5 ml', 1),
(1024, 10, 21, 1, 'Item', '2180768', 'NA', '5 ml', 1),
(1025, 10, 21, 1, 'Item', '2180769', 'NA', '5 ml', 1),
(1026, 10, 21, 1, 'Item', '2180770', 'NA', '5 ml', 1),
(1027, 10, 21, 1, 'Item', '2180771', 'NA', '5 ml', 1),
(1028, 10, 21, 1, 'Item', '2180772', 'NA', '5 ml', 1),
(1029, 10, 21, 1, 'Item', '2180773', 'NA', '5 ml', 1),
(1030, 10, 21, 1, 'Item', '2180774', 'NA', '5 ml', 1),
(1031, 10, 21, 1, 'Item', '2180775', 'NA', '5 ml', 1),
(1032, 10, 21, 1, 'Item', '2180776', 'NA', '5 ml', 1),
(1033, 10, 21, 1, 'Item', '2180777', 'NA', '5 ml', 1),
(1034, 10, 21, 1, 'Item', '2180778', 'NA', '5 ml', 1),
(1035, 10, 21, 1, 'Item', '2180779', 'NA', '5 ml', 1),
(1036, 10, 21, 1, 'Item', '2180780', 'NA', '5 ml', 1),
(1037, 10, 21, 1, 'Item', '2180781', 'NA', '5 ml', 1),
(1038, 10, 21, 1, 'Item', '2180782', 'NA', '5 ml', 1),
(1039, 10, 21, 1, 'Item', '2180783', 'NA', '5 ml', 1),
(1040, 10, 21, 1, 'Item', '2180784', 'NA', '5 ml', 1),
(1041, 10, 21, 1, 'Item', '2180785', 'NA', '5 ml', 1),
(1042, 10, 21, 1, 'Item', '2180786', 'NA', '5 ml', 1),
(1043, 10, 21, 1, 'Item', '2180787', 'NA', '5 ml', 1),
(1044, 10, 21, 1, 'Item', '2180788', 'NA', '5 ml', 1),
(1045, 10, 21, 1, 'Item', '2180789', 'NA', '5 ml', 1),
(1046, 10, 21, 1, 'Item', '2180790', 'NA', '5 ml', 1),
(1047, 10, 21, 1, 'Item', '2180791', 'NA', '5 ml', 1),
(1048, 10, 21, 1, 'Item', '2180792', 'NA', '5 ml', 1),
(1049, 10, 21, 1, 'Item', '2180793', 'NA', '5 ml', 1),
(1050, 10, 21, 1, 'Item', '2180794', 'NA', '5 ml', 1),
(1051, 10, 21, 1, 'Item', '2180795', 'NA', '5 ml', 1),
(1052, 10, 21, 1, 'Item', '2180796', 'NA', '5 ml', 1),
(1053, 10, 21, 1, 'Item', '2180797', 'NA', '5 ml', 1),
(1054, 10, 21, 1, 'Item', '2180798', 'NA', '5 ml', 1),
(1055, 10, 21, 1, 'Item', '2180799', 'NA', '5 ml', 1),
(1056, 10, 21, 1, 'Item', '2180800', 'NA', '5 ml', 1),
(1057, 10, 21, 1, 'Item', '2180801', 'NA', '5 ml', 1),
(1058, 10, 21, 1, 'Item', '2180802', 'NA', '5 ml', 1),
(1059, 10, 21, 1, 'Item', '2180803', 'NA', '5 ml', 1),
(1060, 10, 21, 1, 'Item', '2180804', 'NA', '5 ml', 1),
(1061, 10, 21, 1, 'Item', '2180805', 'NA', '5 ml', 1),
(1062, 10, 21, 1, 'Item', '2180806', 'NA', '5 ml', 1),
(1063, 10, 21, 1, 'Item', '2180807', 'NA', '5 ml', 1),
(1064, 10, 21, 1, 'Item', '2180808', 'NA', '5 ml', 1),
(1065, 10, 21, 1, 'Item', '2180809', 'NA', '5 ml', 1),
(1066, 10, 21, 1, 'Item', '2180810', 'NA', '5 ml', 1),
(1067, 10, 21, 1, 'Item', '2180811', 'NA', '5 ml', 1),
(1068, 10, 21, 1, 'Item', '2180812', 'NA', '5 ml', 1),
(1069, 10, 21, 1, 'Item', '2180813', 'NA', '5 ml', 1),
(1070, 10, 21, 1, 'Item', '2180814', 'NA', '5 ml', 1),
(1071, 10, 21, 1, 'Item', '2180815', 'NA', '5 ml', 1),
(1072, 10, 21, 1, 'Item', '2180816', 'NA', '5 ml', 1),
(1073, 10, 21, 1, 'Item', '2180817', 'NA', '5 ml', 1),
(1074, 10, 21, 1, 'Item', '2180818', 'NA', '5 ml', 1),
(1075, 10, 21, 1, 'Item', '2180819', 'NA', '5 ml', 1),
(1076, 10, 21, 1, 'Item', '2180820', 'NA', '5 ml', 1),
(1077, 10, 21, 1, 'Item', '2180821', 'NA', '5 ml', 1),
(1078, 10, 21, 1, 'Item', '2180822', 'NA', '5 ml', 1),
(1079, 10, 21, 1, 'Item', '2180823', 'NA', '5 ml', 1),
(1080, 10, 21, 1, 'Item', '2180824', 'NA', '5 ml', 1),
(1081, 10, 21, 1, 'Item', '2180825', 'NA', '5 ml', 1),
(1082, 10, 21, 1, 'Item', '2180826', 'NA', '5 ml', 1),
(1083, 10, 21, 1, 'Item', '2180827', 'NA', '5 ml', 1),
(1084, 10, 21, 1, 'Item', '2180828', 'NA', '5 ml', 1),
(1085, 10, 21, 1, 'Item', '2180829', 'NA', '5 ml', 1),
(1086, 10, 21, 1, 'Item', '2180830', 'NA', '5 ml', 1),
(1087, 10, 21, 1, 'Item', '2180831', 'NA', '5 ml', 1),
(1088, 10, 21, 1, 'Item', '2180832', 'NA', '5 ml', 1),
(1089, 10, 21, 1, 'Item', '2180833', 'NA', '5 ml', 1),
(1090, 10, 21, 1, 'Item', '2180834', 'NA', '5 ml', 1),
(1091, 10, 21, 1, 'Item', '2180835', 'NA', '5 ml', 1),
(1092, 10, 21, 1, 'Item', '2180836', 'NA', '5 ml', 1),
(1093, 10, 21, 1, 'Item', '2180837', 'NA', '5 ml', 1),
(1094, 10, 21, 1, 'Item', '2180838', 'NA', '5 ml', 1),
(1095, 10, 21, 1, 'Item', '2180839', 'NA', '5 ml', 1),
(1096, 10, 21, 1, 'Item', '2180840', 'NA', '5 ml', 1),
(1097, 10, 21, 1, 'Item', '2180841', 'NA', '5 ml', 1),
(1098, 10, 21, 1, 'Item', '2180842', 'NA', '5 ml', 1),
(1099, 10, 21, 1, 'Item', '2180843', 'NA', '5 ml', 1),
(1100, 10, 21, 1, 'Item', '2180844', 'NA', '5 ml', 1),
(1101, 10, 21, 1, 'Item', '2180845', 'NA', '5 ml', 1),
(1102, 10, 21, 1, 'Item', '2180846', 'NA', '5 ml', 1),
(1103, 10, 21, 1, 'Item', '2180847', 'NA', '5 ml', 1),
(1104, 10, 21, 1, 'Item', '2180848', 'NA', '5 ml', 1),
(1105, 10, 21, 1, 'Item', '2180849', 'NA', '5 ml', 1),
(1106, 10, 21, 1, 'Item', '2180850', 'NA', '5 ml', 1),
(1107, 10, 21, 1, 'Item', '2180851', 'NA', '5 ml', 1),
(1108, 10, 21, 1, 'Item', '2180852', 'NA', '5 ml', 1),
(1109, 10, 21, 1, 'Item', '2180853', 'NA', '5 ml', 1),
(1110, 10, 21, 1, 'Item', '2180854', 'NA', '5 ml', 1),
(1111, 10, 21, 1, 'Item', '2180855', 'NA', '5 ml', 1),
(1112, 10, 21, 1, 'Item', '2180856', 'NA', '5 ml', 1),
(1113, 10, 21, 1, 'Item', '2180857', 'NA', '5 ml', 1),
(1114, 10, 21, 1, 'Item', '2180858', 'NA', '5 ml', 1),
(1115, 10, 21, 1, 'Item', '2180859', 'NA', '5 ml', 1),
(1116, 10, 21, 1, 'Item', '2180860', 'NA', '5 ml', 1),
(1117, 10, 21, 1, 'Item', '2180861', 'NA', '5 ml', 1),
(1118, 10, 21, 1, 'Item', '2180862', 'NA', '5 ml', 1),
(1119, 10, 21, 1, 'Item', '2180863', 'NA', '5 ml', 1),
(1120, 10, 21, 1, 'Item', '2180864', 'NA', '5 ml', 1),
(1121, 10, 21, 1, 'Item', '2180865', 'NA', '5 ml', 1),
(1122, 10, 21, 1, 'Item', '2180866', 'NA', '5 ml', 1),
(1123, 10, 21, 1, 'Item', '2180867', 'NA', '5 ml', 1),
(1124, 10, 21, 1, 'Item', '2180868', 'NA', '5 ml', 1),
(1125, 10, 21, 1, 'Item', '2180869', 'NA', '5 ml', 1),
(1126, 10, 21, 1, 'Item', '2180870', 'NA', '5 ml', 1),
(1127, 10, 21, 1, 'Item', '2180871', 'NA', '5 ml', 1),
(1128, 10, 21, 1, 'Item', '2180872', 'NA', '5 ml', 1),
(1129, 10, 21, 1, 'Item', '2180873', 'NA', '5 ml', 1),
(1130, 10, 21, 1, 'Item', '2180874', 'NA', '5 ml', 1),
(1131, 10, 21, 1, 'Item', '2180875', 'NA', '5 ml', 1),
(1132, 10, 21, 1, 'Item', '2180876', 'NA', '5 ml', 1),
(1133, 10, 21, 1, 'Item', '2180877', 'NA', '5 ml', 1),
(1134, 10, 21, 1, 'Item', '2180878', 'NA', '5 ml', 1),
(1135, 10, 21, 1, 'Item', '2180879', 'NA', '5 ml', 1),
(1136, 10, 21, 1, 'Item', '2180880', 'NA', '5 ml', 1),
(1137, 10, 21, 1, 'Item', '2180881', 'NA', '5 ml', 1),
(1138, 10, 21, 1, 'Item', '2180882', 'NA', '5 ml', 1),
(1139, 10, 21, 1, 'Item', '2180883', 'NA', '5 ml', 1),
(1140, 10, 21, 1, 'Item', '2180884', 'NA', '5 ml', 1),
(1141, 10, 21, 1, 'Item', '2180885', 'NA', '5 ml', 1),
(1142, 10, 21, 1, 'Item', '2180886', 'NA', '5 ml', 1),
(1143, 10, 21, 1, 'Item', '2180887', 'NA', '5 ml', 1),
(1144, 10, 21, 1, 'Item', '2180888', 'NA', '5 ml', 1),
(1145, 10, 21, 1, 'Item', '2180889', 'NA', '5 ml', 1),
(1146, 10, 21, 1, 'Item', '2180890', 'NA', '5 ml', 1),
(1147, 10, 21, 1, 'Item', '2180891', 'NA', '5 ml', 1),
(1148, 10, 21, 1, 'Item', '2180892', 'NA', '5 ml', 1),
(1149, 10, 21, 1, 'Item', '2180893', 'NA', '5 ml', 1),
(1150, 10, 21, 1, 'Item', '2180894', 'NA', '5 ml', 1),
(1151, 10, 21, 1, 'Item', '2180895', 'NA', '5 ml', 1),
(1152, 10, 21, 1, 'Item', '2180896', 'NA', '5 ml', 1),
(1153, 10, 21, 1, 'Item', '2180897', 'NA', '5 ml', 1),
(1154, 10, 21, 1, 'Item', '2180898', 'NA', '5 ml', 1),
(1155, 10, 21, 1, 'Item', '2180899', 'NA', '5 ml', 1),
(1156, 10, 21, 1, 'Item', '2180900', 'NA', '5 ml', 1),
(1157, 10, 21, 1, 'Item', '2180901', 'NA', '5 ml', 1),
(1158, 10, 21, 1, 'Item', '2180902', 'NA', '5 ml', 1),
(1159, 10, 21, 1, 'Item', '2180903', 'NA', '5 ml', 1),
(1160, 10, 21, 1, 'Item', '2180904', 'NA', '5 ml', 1),
(1161, 10, 21, 1, 'Item', '2180905', 'NA', '5 ml', 1),
(1162, 10, 21, 1, 'Item', '2180906', 'NA', '5 ml', 1),
(1163, 10, 21, 1, 'Item', '2180907', 'NA', '5 ml', 1),
(1164, 10, 21, 1, 'Item', '2180908', 'NA', '5 ml', 1),
(1165, 10, 21, 1, 'Item', '2180909', 'NA', '5 ml', 1),
(1166, 10, 21, 1, 'Item', '2180910', 'NA', '5 ml', 1),
(1167, 10, 21, 1, 'Item', '2180911', 'NA', '5 ml', 1),
(1168, 10, 21, 1, 'Item', '2180912', 'NA', '5 ml', 1),
(1169, 10, 21, 1, 'Item', '2180913', 'NA', '5 ml', 1),
(1170, 10, 21, 1, 'Item', '2180914', 'NA', '5 ml', 1),
(1171, 10, 21, 1, 'Item', '2180915', 'NA', '5 ml', 1),
(1172, 10, 21, 1, 'Item', '2180916', 'NA', '5 ml', 1),
(1173, 10, 21, 1, 'Item', '2180917', 'NA', '5 ml', 1),
(1174, 10, 21, 1, 'Item', '2180918', 'NA', '5 ml', 1),
(1175, 10, 21, 1, 'Item', '2180919', 'NA', '5 ml', 1),
(1176, 10, 21, 1, 'Item', '2180920', 'NA', '5 ml', 1),
(1177, 10, 21, 1, 'Item', '2180921', 'NA', '5 ml', 1),
(1178, 10, 21, 1, 'Item', '2180922', 'NA', '5 ml', 1),
(1179, 10, 21, 1, 'Item', '2180923', 'NA', '5 ml', 1),
(1180, 10, 21, 1, 'Item', '2180924', 'NA', '5 ml', 1),
(1181, 10, 21, 1, 'Item', '2180925', 'NA', '5 ml', 1),
(1182, 10, 21, 1, 'Item', '2180926', 'NA', '5 ml', 1),
(1183, 10, 21, 1, 'Item', '2180927', 'NA', '5 ml', 1),
(1184, 10, 21, 1, 'Item', '2180928', 'NA', '5 ml', 1),
(1185, 10, 21, 1, 'Item', '2180929', 'NA', '5 ml', 1),
(1186, 10, 21, 1, 'Item', '2180930', 'NA', '5 ml', 1),
(1187, 10, 21, 1, 'Item', '2180931', 'NA', '5 ml', 1),
(1188, 10, 21, 1, 'Item', '2180932', 'NA', '5 ml', 1),
(1189, 10, 21, 1, 'Item', '2180933', 'NA', '5 ml', 1),
(1190, 10, 21, 1, 'Item', '2180934', 'NA', '5 ml', 1),
(1191, 10, 21, 1, 'Item', '2180935', 'NA', '5 ml', 1),
(1192, 10, 21, 1, 'Item', '2180936', 'NA', '5 ml', 1),
(1193, 10, 21, 1, 'Item', '2180937', 'NA', '5 ml', 1),
(1194, 10, 21, 1, 'Item', '2180938', 'NA', '5 ml', 1),
(1195, 10, 21, 1, 'Item', '2180939', 'NA', '5 ml', 1),
(1196, 10, 21, 1, 'Item', '2180940', 'NA', '5 ml', 1),
(1197, 10, 21, 1, 'Item', '2180941', 'NA', '5 ml', 1),
(1198, 10, 21, 1, 'Item', '2180942', 'NA', '5 ml', 1),
(1199, 10, 21, 1, 'Item', '2180943', 'NA', '5 ml', 1),
(1200, 10, 21, 1, 'Item', '2180944', 'NA', '5 ml', 1),
(1201, 10, 21, 1, 'Item', '2180945', 'NA', '5 ml', 1),
(1202, 10, 21, 1, 'Item', '2180946', 'NA', '5 ml', 1),
(1203, 10, 21, 1, 'Item', '2180947', 'NA', '5 ml', 1),
(1204, 10, 21, 1, 'Item', '2180948', 'NA', '5 ml', 1),
(1205, 10, 21, 1, 'Item', '2180949', 'NA', '5 ml', 1),
(1206, 10, 21, 1, 'Item', '2180950', 'NA', '5 ml', 1),
(1207, 10, 21, 1, 'Item', '2180951', 'NA', '5 ml', 1),
(1208, 10, 21, 1, 'Item', '2180952', 'NA', '5 ml', 1),
(1209, 10, 21, 1, 'Item', '2180953', 'NA', '5 ml', 1),
(1210, 10, 21, 1, 'Item', '2180954', 'NA', '5 ml', 1),
(1211, 10, 21, 1, 'Item', '2180955', 'NA', '5 ml', 1),
(1212, 10, 21, 1, 'Item', '2180956', 'NA', '5 ml', 1),
(1213, 10, 21, 1, 'Item', '2180957', 'NA', '5 ml', 1),
(1214, 10, 21, 1, 'Item', '2180958', 'NA', '5 ml', 1),
(1215, 10, 21, 1, 'Item', '2180959', 'NA', '5 ml', 1),
(1216, 10, 21, 1, 'Item', '2180960', 'NA', '5 ml', 1),
(1217, 10, 21, 1, 'Item', '2180961', 'NA', '5 ml', 1),
(1218, 10, 21, 1, 'Item', '2180962', 'NA', '5 ml', 1),
(1219, 10, 21, 1, 'Item', '2180963', 'NA', '5 ml', 1),
(1220, 10, 21, 1, 'Item', '2180964', 'NA', '5 ml', 1),
(1221, 10, 21, 1, 'Item', '2180965', 'NA', '5 ml', 1),
(1222, 10, 21, 1, 'Item', '2180966', 'NA', '5 ml', 1),
(1223, 10, 21, 1, 'Item', '2180967', 'NA', '5 ml', 1),
(1224, 10, 21, 1, 'Item', '2180968', 'NA', '5 ml', 1),
(1225, 10, 21, 1, 'Item', '2180969', 'NA', '5 ml', 1),
(1226, 10, 21, 1, 'Item', '2180970', 'NA', '5 ml', 1),
(1227, 10, 21, 1, 'Item', '2180971', 'NA', '5 ml', 1),
(1228, 10, 21, 1, 'Item', '2180972', 'NA', '5 ml', 1),
(1229, 10, 21, 1, 'Item', '2180973', 'NA', '5 ml', 1),
(1230, 10, 21, 1, 'Item', '2180974', 'NA', '5 ml', 1),
(1231, 10, 21, 1, 'Item', '2180975', 'NA', '5 ml', 1),
(1232, 10, 21, 1, 'Item', '2180976', 'NA', '5 ml', 1),
(1233, 10, 21, 1, 'Item', '2180977', 'NA', '5 ml', 1),
(1234, 10, 21, 1, 'Item', '2180978', 'NA', '5 ml', 1),
(1235, 10, 21, 1, 'Item', '2180979', 'NA', '5 ml', 1),
(1236, 10, 21, 1, 'Item', '2180980', 'NA', '5 ml', 1),
(1237, 10, 21, 1, 'Item', '2180981', 'NA', '5 ml', 1),
(1238, 10, 21, 1, 'Item', '2180982', 'NA', '5 ml', 1),
(1239, 10, 21, 1, 'Item', '2180983', 'NA', '5 ml', 1),
(1240, 10, 21, 1, 'Item', '2180984', 'NA', '5 ml', 1),
(1241, 10, 21, 1, 'Item', '2180985', 'NA', '5 ml', 1),
(1242, 10, 21, 1, 'Item', '2180986', 'NA', '5 ml', 1),
(1243, 10, 21, 1, 'Item', '2180987', 'NA', '5 ml', 1),
(1244, 10, 21, 1, 'Item', '2180988', 'NA', '5 ml', 1),
(1245, 10, 21, 1, 'Item', '2180989', 'NA', '5 ml', 1),
(1246, 10, 21, 1, 'Item', '2180990', 'NA', '5 ml', 1),
(1247, 10, 21, 1, 'Item', '2180991', 'NA', '5 ml', 1),
(1248, 10, 21, 1, 'Item', '2180992', 'NA', '5 ml', 1),
(1249, 10, 21, 1, 'Item', '2180993', 'NA', '5 ml', 1),
(1250, 10, 21, 1, 'Item', '2180994', 'NA', '5 ml', 1),
(1251, 10, 21, 1, 'Item', '2180995', 'NA', '5 ml', 1),
(1252, 10, 21, 1, 'Item', '2180996', 'NA', '5 ml', 1),
(1253, 10, 21, 1, 'Item', '2180997', 'NA', '5 ml', 1),
(1254, 10, 21, 1, 'Item', '2180998', 'NA', '5 ml', 1),
(1255, 10, 21, 1, 'Item', '2180999', 'NA', '5 ml', 1),
(1256, 10, 21, 1, 'Item', '2181000', 'NA', '5 ml', 1),
(1257, 10, 21, 1, 'Item', '2181001', 'NA', '5 ml', 1),
(1258, 10, 21, 1, 'Item', '2181002', 'NA', '5 ml', 1),
(1259, 10, 21, 1, 'Item', '2181003', 'NA', '5 ml', 1),
(1260, 10, 21, 1, 'Item', '2181004', 'NA', '5 ml', 1),
(1261, 10, 21, 1, 'Item', '2181005', 'NA', '5 ml', 1),
(1262, 10, 21, 1, 'Item', '2181006', 'NA', '5 ml', 1),
(1263, 10, 21, 1, 'Item', '2181007', 'NA', '5 ml', 1),
(1264, 10, 21, 1, 'Item', '2181008', 'NA', '5 ml', 1),
(1265, 10, 21, 1, 'Item', '2181009', 'NA', '5 ml', 1),
(1266, 10, 21, 1, 'Item', '2181010', 'NA', '5 ml', 1),
(1267, 10, 21, 1, 'Item', '2181011', 'NA', '5 ml', 1),
(1268, 10, 21, 1, 'Item', '2181012', 'NA', '5 ml', 1),
(1269, 10, 21, 1, 'Item', '2181013', 'NA', '5 ml', 1),
(1270, 10, 21, 1, 'Item', '2181014', 'NA', '5 ml', 1),
(1271, 10, 21, 1, 'Item', '2181015', 'NA', '5 ml', 1),
(1272, 10, 21, 1, 'Item', '2181016', 'NA', '5 ml', 1),
(1273, 10, 21, 1, 'Item', '2181017', 'NA', '5 ml', 1),
(1274, 10, 21, 1, 'Item', '2181018', 'NA', '5 ml', 1),
(1275, 10, 21, 1, 'Item', '2181019', 'NA', '5 ml', 1),
(1276, 10, 21, 1, 'Item', '2181020', 'NA', '5 ml', 1),
(1277, 10, 21, 1, 'Item', '2181021', 'NA', '5 ml', 1),
(1278, 10, 21, 1, 'Item', '2181022', 'NA', '5 ml', 1),
(1279, 10, 21, 1, 'Item', '2181023', 'NA', '5 ml', 1),
(1280, 10, 21, 1, 'Item', '2181024', 'NA', '5 ml', 1),
(1281, 10, 21, 1, 'Item', '2181025', 'NA', '5 ml', 1),
(1282, 10, 21, 1, 'Item', '2181026', 'NA', '5 ml', 1),
(1283, 10, 21, 1, 'Item', '2181027', 'NA', '5 ml', 1),
(1284, 10, 21, 1, 'Item', '2181028', 'NA', '5 ml', 1),
(1285, 10, 21, 1, 'Item', '2181029', 'NA', '5 ml', 1),
(1286, 10, 21, 1, 'Item', '2181030', 'NA', '5 ml', 1),
(1287, 10, 21, 1, 'Item', '2181031', 'NA', '5 ml', 1),
(1288, 10, 21, 1, 'Item', '2181032', 'NA', '5 ml', 1),
(1289, 10, 21, 1, 'Item', '2181033', 'NA', '5 ml', 1),
(1290, 10, 21, 1, 'Item', '2181034', 'NA', '5 ml', 1),
(1291, 10, 21, 1, 'Item', '2181035', 'NA', '5 ml', 1),
(1292, 10, 21, 1, 'Item', '2181036', 'NA', '5 ml', 1),
(1293, 10, 21, 1, 'Item', '2181037', 'NA', '5 ml', 1),
(1294, 10, 21, 1, 'Item', '2181038', 'NA', '5 ml', 1),
(1295, 10, 21, 1, 'Item', '2181039', 'NA', '5 ml', 1),
(1296, 10, 21, 1, 'Item', '2181040', 'NA', '5 ml', 1),
(1297, 10, 21, 1, 'Item', '2181041', 'NA', '5 ml', 1),
(1298, 10, 21, 1, 'Item', '2181042', 'NA', '5 ml', 1),
(1299, 10, 21, 1, 'Item', '2181043', 'NA', '5 ml', 1),
(1300, 10, 21, 1, 'Item', '2181044', 'NA', '5 ml', 1),
(1301, 10, 21, 1, 'Item', '2181045', 'NA', '5 ml', 1),
(1302, 10, 21, 1, 'Item', '2181046', 'NA', '5 ml', 1),
(1303, 10, 21, 1, 'Item', '2181047', 'NA', '5 ml', 1),
(1304, 10, 21, 1, 'Item', '2181048', 'NA', '5 ml', 1),
(1305, 10, 21, 1, 'Item', '2181049', 'NA', '5 ml', 1),
(1306, 10, 21, 1, 'Item', '2181050', 'NA', '5 ml', 1),
(1307, 10, 21, 1, 'Item', '2181051', 'NA', '5 ml', 1),
(1308, 10, 21, 1, 'Item', '2181052', 'NA', '5 ml', 1),
(1309, 10, 21, 1, 'Item', '2181053', 'NA', '5 ml', 1),
(1310, 10, 21, 1, 'Item', '2181054', 'NA', '5 ml', 1),
(1311, 10, 21, 1, 'Item', '2181055', 'NA', '5 ml', 1),
(1312, 10, 21, 1, 'Item', '2181056', 'NA', '5 ml', 1),
(1313, 10, 21, 1, 'Item', '2181057', 'NA', '5 ml', 1),
(1314, 10, 21, 1, 'Item', '2181058', 'NA', '5 ml', 1),
(1315, 10, 21, 1, 'Item', '2181059', 'NA', '5 ml', 1),
(1316, 10, 21, 1, 'Item', '2181060', 'NA', '5 ml', 1),
(1317, 10, 21, 1, 'Item', '2181061', 'NA', '5 ml', 1),
(1318, 10, 21, 1, 'Item', '2181062', 'NA', '5 ml', 1),
(1319, 10, 21, 1, 'Item', '2181063', 'NA', '5 ml', 1),
(1320, 10, 21, 1, 'Item', '2181064', 'NA', '5 ml', 1),
(1321, 10, 21, 1, 'Item', '2181065', 'NA', '5 ml', 1),
(1322, 10, 21, 1, 'Item', '2181066', 'NA', '5 ml', 1),
(1323, 10, 21, 1, 'Item', '2181067', 'NA', '5 ml', 1),
(1324, 10, 21, 1, 'Item', '2181068', 'NA', '5 ml', 1),
(1325, 10, 21, 1, 'Item', '2181069', 'NA', '5 ml', 1),
(1326, 10, 21, 1, 'Item', '2181070', 'NA', '5 ml', 1),
(1327, 10, 21, 1, 'Item', '2181071', 'NA', '5 ml', 1),
(1328, 10, 21, 1, 'Item', '2181072', 'NA', '5 ml', 1),
(1329, 10, 21, 1, 'Item', '2181073', 'NA', '5 ml', 1),
(1330, 10, 21, 1, 'Item', '2181074', 'NA', '5 ml', 1),
(1331, 10, 21, 1, 'Item', '2181075', 'NA', '5 ml', 1),
(1332, 10, 21, 1, 'Item', '2181076', 'NA', '5 ml', 1),
(1333, 10, 21, 1, 'Item', '2181077', 'NA', '5 ml', 1),
(1334, 10, 21, 1, 'Item', '2181078', 'NA', '5 ml', 1),
(1335, 10, 21, 1, 'Item', '2181079', 'NA', '5 ml', 1),
(1336, 10, 21, 1, 'Item', '2181080', 'NA', '5 ml', 1),
(1337, 10, 21, 1, 'Item', '2181081', 'NA', '5 ml', 1),
(1338, 10, 21, 1, 'Item', '2181082', 'NA', '5 ml', 1),
(1339, 10, 21, 1, 'Item', '2181083', 'NA', '5 ml', 1),
(1340, 10, 21, 1, 'Item', '2181084', 'NA', '5 ml', 1),
(1341, 10, 21, 1, 'Item', '2181085', 'NA', '5 ml', 1),
(1342, 10, 21, 1, 'Item', '2181086', 'NA', '5 ml', 1),
(1343, 10, 21, 1, 'Item', '2181087', 'NA', '5 ml', 1),
(1344, 10, 21, 1, 'Item', '2181088', 'NA', '5 ml', 1),
(1345, 10, 21, 1, 'Item', '2181089', 'NA', '5 ml', 1),
(1346, 10, 21, 1, 'Item', '2181090', 'NA', '5 ml', 1),
(1347, 10, 21, 1, 'Item', '2181091', 'NA', '5 ml', 1),
(1348, 10, 21, 1, 'Item', '2181092', 'NA', '5 ml', 1),
(1349, 10, 21, 1, 'Item', '2181093', 'NA', '5 ml', 1),
(1350, 10, 21, 1, 'Item', '2181094', 'NA', '5 ml', 1),
(1351, 10, 21, 1, 'Item', '2181095', 'NA', '5 ml', 1),
(1352, 10, 21, 1, 'Item', '2181096', 'NA', '5 ml', 1),
(1353, 10, 21, 1, 'Item', '2181097', 'NA', '5 ml', 1),
(1354, 10, 21, 1, 'Item', '2181098', 'NA', '5 ml', 1),
(1355, 10, 21, 1, 'Item', '2181099', 'NA', '5 ml', 1),
(1356, 10, 21, 1, 'Item', '2181100', 'NA', '5 ml', 1),
(1357, 10, 21, 1, 'Item', '2181101', 'NA', '5 ml', 1),
(1358, 10, 21, 1, 'Item', '2181102', 'NA', '5 ml', 1),
(1359, 10, 21, 1, 'Item', '2181103', 'NA', '5 ml', 1),
(1360, 10, 21, 1, 'Item', '2181104', 'NA', '5 ml', 1),
(1361, 10, 21, 1, 'Item', '2181105', 'NA', '5 ml', 1),
(1362, 10, 21, 1, 'Item', '2181106', 'NA', '5 ml', 1),
(1363, 10, 21, 1, 'Item', '2181107', 'NA', '5 ml', 1),
(1364, 10, 21, 1, 'Item', '2181108', 'NA', '5 ml', 1),
(1365, 10, 21, 1, 'Item', '2181109', 'NA', '5 ml', 1),
(1366, 10, 21, 1, 'Item', '2181110', 'NA', '5 ml', 1),
(1367, 10, 21, 1, 'Item', '2181111', 'NA', '5 ml', 1),
(1368, 10, 21, 1, 'Item', '2181112', 'NA', '5 ml', 1),
(1369, 10, 21, 1, 'Item', '2181113', 'NA', '5 ml', 1),
(1370, 10, 21, 1, 'Item', '2181114', 'NA', '5 ml', 1),
(1371, 10, 21, 1, 'Item', '2181115', 'NA', '5 ml', 1),
(1372, 10, 21, 1, 'Item', '2181116', 'NA', '5 ml', 1),
(1373, 10, 21, 1, 'Item', '2181117', 'NA', '5 ml', 1),
(1374, 10, 21, 1, 'Item', '2181118', 'NA', '5 ml', 1),
(1375, 10, 21, 1, 'Item', '2181119', 'NA', '5 ml', 1),
(1376, 10, 21, 1, 'Item', '2181120', 'NA', '5 ml', 1),
(1377, 10, 21, 1, 'Item', '2181121', 'NA', '5 ml', 1),
(1378, 10, 21, 1, 'Item', '2181122', 'NA', '5 ml', 1),
(1379, 10, 21, 1, 'Item', '2181123', 'NA', '5 ml', 1),
(1380, 10, 21, 1, 'Item', '2181124', 'NA', '5 ml', 1),
(1381, 10, 21, 1, 'Item', '2181125', 'NA', '5 ml', 1),
(1382, 10, 21, 1, 'Item', '2181126', 'NA', '5 ml', 1),
(1383, 10, 21, 1, 'Item', '2181127', 'NA', '5 ml', 1),
(1384, 10, 21, 1, 'Item', '2181128', 'NA', '5 ml', 1),
(1385, 10, 21, 1, 'Item', '2181129', 'NA', '5 ml', 1),
(1386, 10, 21, 1, 'Item', '2181130', 'NA', '5 ml', 1),
(1387, 10, 21, 1, 'Item', '2181131', 'NA', '5 ml', 1),
(1388, 10, 21, 1, 'Item', '2181132', 'NA', '5 ml', 1),
(1389, 10, 21, 1, 'Item', '2181133', 'NA', '5 ml', 1),
(1390, 10, 21, 1, 'Item', '2181134', 'NA', '5 ml', 1),
(1391, 10, 21, 1, 'Item', '2181135', 'NA', '5 ml', 1),
(1392, 10, 21, 1, 'Item', '2181136', 'NA', '5 ml', 1),
(1393, 10, 21, 1, 'Item', '2181137', 'NA', '5 ml', 1),
(1394, 10, 21, 1, 'Item', '2181138', 'NA', '5 ml', 1),
(1395, 10, 21, 1, 'Item', '2181139', 'NA', '5 ml', 1),
(1396, 10, 21, 1, 'Item', '2181140', 'NA', '5 ml', 1),
(1397, 10, 21, 1, 'Item', '2181141', 'NA', '5 ml', 1),
(1398, 10, 21, 1, 'Item', '2181142', 'NA', '5 ml', 1),
(1399, 10, 21, 1, 'Item', '2181143', 'NA', '5 ml', 1),
(1400, 10, 21, 1, 'Item', '2181144', 'NA', '5 ml', 1),
(1401, 10, 21, 1, 'Item', '2181145', 'NA', '5 ml', 1),
(1402, 10, 21, 1, 'Item', '2181146', 'NA', '5 ml', 1),
(1403, 10, 21, 1, 'Item', '2181147', 'NA', '5 ml', 1),
(1404, 10, 21, 1, 'Item', '2181148', 'NA', '5 ml', 1),
(1405, 10, 21, 1, 'Item', '2181149', 'NA', '5 ml', 1),
(1406, 10, 21, 1, 'Item', '2181150', 'NA', '5 ml', 1),
(1407, 10, 21, 1, 'Item', '2181151', 'NA', '5 ml', 1),
(1408, 10, 21, 1, 'Item', '2181152', 'NA', '5 ml', 1),
(1409, 10, 21, 1, 'Item', '2181153', 'NA', '5 ml', 1),
(1410, 10, 21, 1, 'Item', '2181154', 'NA', '5 ml', 1),
(1411, 10, 21, 1, 'Item', '2181155', 'NA', '5 ml', 1),
(1412, 10, 21, 1, 'Item', '2181156', 'NA', '5 ml', 1),
(1413, 10, 21, 1, 'Item', '2181157', 'NA', '5 ml', 1),
(1414, 10, 21, 1, 'Item', '2181158', 'NA', '5 ml', 1),
(1415, 10, 21, 1, 'Item', '2181159', 'NA', '5 ml', 1),
(1416, 10, 21, 1, 'Item', '2181160', 'NA', '5 ml', 1),
(1417, 10, 21, 1, 'Item', '2181161', 'NA', '5 ml', 1),
(1418, 10, 21, 1, 'Item', '2181162', 'NA', '5 ml', 1),
(1419, 10, 21, 1, 'Item', '2181163', 'NA', '5 ml', 1),
(1420, 10, 21, 1, 'Item', '2181164', 'NA', '5 ml', 1),
(1421, 10, 21, 1, 'Item', '2181165', 'NA', '5 ml', 1),
(1422, 10, 21, 1, 'Item', '2181166', 'NA', '5 ml', 1),
(1423, 10, 21, 1, 'Item', '2181167', 'NA', '5 ml', 1),
(1424, 10, 21, 1, 'Item', '2181168', 'NA', '5 ml', 1),
(1425, 10, 21, 1, 'Item', '2181169', 'NA', '5 ml', 1),
(1426, 10, 21, 1, 'Item', '2181170', 'NA', '5 ml', 1),
(1427, 10, 21, 1, 'Item', '2181171', 'NA', '5 ml', 1),
(1428, 10, 21, 1, 'Item', '2181172', 'NA', '5 ml', 1),
(1429, 10, 21, 1, 'Item', '2181173', 'NA', '5 ml', 1),
(1430, 10, 21, 1, 'Item', '2181174', 'NA', '5 ml', 1),
(1431, 10, 21, 1, 'Item', '2181175', 'NA', '5 ml', 1),
(1432, 10, 21, 1, 'Item', '2181176', 'NA', '5 ml', 1),
(1433, 10, 21, 1, 'Item', '2181177', 'NA', '5 ml', 1),
(1434, 10, 21, 1, 'Item', '2181178', 'NA', '5 ml', 1),
(1435, 10, 21, 1, 'Item', '2181179', 'NA', '5 ml', 1),
(1436, 10, 21, 1, 'Item', '2181180', 'NA', '5 ml', 1),
(1437, 10, 21, 1, 'Item', '2181181', 'NA', '5 ml', 1),
(1438, 10, 21, 1, 'Item', '2181182', 'NA', '5 ml', 1),
(1439, 10, 21, 1, 'Item', '2181183', 'NA', '5 ml', 1),
(1440, 10, 21, 1, 'Item', '2181184', 'NA', '5 ml', 1),
(1441, 10, 21, 1, 'Item', '2181185', 'NA', '5 ml', 1),
(1442, 10, 21, 1, 'Item', '2181186', 'NA', '5 ml', 1),
(1443, 10, 21, 1, 'Item', '2181187', 'NA', '5 ml', 1),
(1444, 10, 21, 1, 'Item', '2181188', 'NA', '5 ml', 1),
(1445, 10, 21, 1, 'Item', '2181189', 'NA', '5 ml', 1),
(1446, 10, 21, 1, 'Item', '2181190', 'NA', '5 ml', 1),
(1447, 10, 21, 1, 'Item', '2181191', 'NA', '5 ml', 1),
(1448, 10, 21, 1, 'Item', '2181192', 'NA', '5 ml', 1),
(1449, 10, 21, 1, 'Item', '2181193', 'NA', '5 ml', 1),
(1450, 10, 21, 1, 'Item', '2181194', 'NA', '5 ml', 1),
(1451, 10, 21, 1, 'Item', '2181195', 'NA', '5 ml', 1),
(1452, 10, 21, 1, 'Item', '2181196', 'NA', '5 ml', 1),
(1453, 10, 21, 1, 'Item', '2181197', 'NA', '5 ml', 1),
(1454, 10, 21, 1, 'Item', '2181198', 'NA', '5 ml', 1),
(1455, 10, 21, 1, 'Item', '2181199', 'NA', '5 ml', 1),
(1456, 10, 21, 1, 'Item', '2181200', 'NA', '5 ml', 1),
(1457, 10, 21, 1, 'Item', '2181201', 'NA', '5 ml', 1),
(1458, 10, 21, 1, 'Item', '2181202', 'NA', '5 ml', 1),
(1459, 10, 21, 1, 'Item', '2181203', 'NA', '5 ml', 1),
(1460, 10, 21, 1, 'Item', '2181204', 'NA', '5 ml', 1),
(1461, 10, 21, 1, 'Item', '2181205', 'NA', '5 ml', 1),
(1462, 10, 21, 1, 'Item', '2181206', 'NA', '5 ml', 1),
(1463, 10, 21, 1, 'Item', '2181207', 'NA', '5 ml', 1),
(1464, 10, 21, 1, 'Item', '2181208', 'NA', '5 ml', 1),
(1465, 10, 21, 1, 'Item', '2181209', 'NA', '5 ml', 1),
(1466, 10, 21, 1, 'Item', '2181210', 'NA', '5 ml', 1),
(1467, 10, 21, 1, 'Item', '2181211', 'NA', '5 ml', 1),
(1468, 10, 21, 1, 'Item', '2181212', 'NA', '5 ml', 1),
(1469, 10, 21, 1, 'Item', '2181213', 'NA', '5 ml', 1),
(1470, 10, 21, 1, 'Item', '2181214', 'NA', '5 ml', 1),
(1471, 10, 21, 1, 'Item', '2181215', 'NA', '5 ml', 1),
(1472, 10, 21, 1, 'Item', '2181216', 'NA', '5 ml', 1),
(1473, 10, 21, 1, 'Item', '2181217', 'NA', '5 ml', 1),
(1474, 10, 21, 1, 'Item', '2181218', 'NA', '5 ml', 1),
(1475, 10, 21, 1, 'Item', '2181219', 'NA', '5 ml', 1),
(1476, 10, 21, 1, 'Item', '2181220', 'NA', '5 ml', 1),
(1477, 10, 21, 1, 'Item', '2181221', 'NA', '5 ml', 1),
(1478, 10, 21, 1, 'Item', '2181222', 'NA', '5 ml', 1),
(1479, 10, 21, 1, 'Item', '2181223', 'NA', '5 ml', 1),
(1480, 10, 21, 1, 'Item', '2181224', 'NA', '5 ml', 1),
(1481, 10, 21, 1, 'Item', '2181225', 'NA', '5 ml', 1),
(1482, 10, 21, 1, 'Item', '2181226', 'NA', '5 ml', 1),
(1483, 10, 21, 1, 'Item', '2181227', 'NA', '5 ml', 1),
(1484, 10, 21, 1, 'Item', '2181228', 'NA', '5 ml', 1),
(1485, 10, 21, 1, 'Item', '2181229', 'NA', '5 ml', 1),
(1486, 10, 21, 1, 'Item', '2181230', 'NA', '5 ml', 1),
(1487, 10, 21, 1, 'Item', '2181231', 'NA', '5 ml', 1),
(1488, 10, 21, 1, 'Item', '2181232', 'NA', '5 ml', 1),
(1489, 10, 21, 1, 'Item', '2181233', 'NA', '5 ml', 1),
(1490, 10, 21, 1, 'Item', '2181234', 'NA', '5 ml', 1),
(1491, 10, 21, 1, 'Item', '2181235', 'NA', '5 ml', 1),
(1492, 10, 21, 1, 'Item', '2181236', 'NA', '5 ml', 1),
(1493, 10, 21, 1, 'Item', '2181237', 'NA', '5 ml', 1),
(1494, 10, 21, 1, 'Item', '2181238', 'NA', '5 ml', 1),
(1495, 10, 21, 1, 'Item', '2181239', 'NA', '5 ml', 1),
(1496, 10, 21, 1, 'Item', '2181240', 'NA', '5 ml', 1),
(1497, 10, 21, 1, 'Item', '2181241', 'NA', '5 ml', 1),
(1498, 10, 21, 1, 'Item', '2181242', 'NA', '5 ml', 1),
(1499, 10, 21, 1, 'Item', '2181243', 'NA', '5 ml', 1),
(1500, 10, 21, 1, 'Item', '2181244', 'NA', '5 ml', 1),
(1501, 10, 21, 1, 'Item', '2181245', 'NA', '5 ml', 1),
(1502, 10, 21, 1, 'Item', '2181246', 'NA', '5 ml', 1),
(1503, 10, 21, 1, 'Item', '2181247', 'NA', '5 ml', 1),
(1504, 10, 21, 1, 'Item', '2181248', 'NA', '5 ml', 1),
(1505, 10, 21, 1, 'Item', '2181249', 'NA', '5 ml', 1),
(1506, 10, 21, 1, 'Item', '2181250', 'NA', '5 ml', 1),
(1507, 10, 21, 1, 'Item', '2181251', 'NA', '5 ml', 1),
(1508, 10, 21, 1, 'Item', '2181252', 'NA', '5 ml', 1),
(1509, 10, 21, 1, 'Item', '2181253', 'NA', '5 ml', 1),
(1510, 10, 21, 1, 'Item', '2181254', 'NA', '5 ml', 1),
(1511, 10, 21, 1, 'Item', '2181255', 'NA', '5 ml', 1),
(1512, 10, 21, 1, 'Item', '2181256', 'NA', '5 ml', 1),
(1513, 10, 21, 1, 'Item', '2181257', 'NA', '5 ml', 1),
(1514, 10, 21, 1, 'Item', '2181258', 'NA', '5 ml', 1),
(1515, 10, 21, 1, 'Item', '2181259', 'NA', '5 ml', 1),
(1516, 10, 21, 1, 'Item', '2181260', 'NA', '5 ml', 1),
(1517, 10, 21, 1, 'Item', '2181261', 'NA', '5 ml', 1),
(1518, 10, 21, 1, 'Item', '2181262', 'NA', '5 ml', 1),
(1519, 10, 21, 1, 'Item', '2181263', 'NA', '5 ml', 1),
(1520, 10, 21, 1, 'Item', '2181264', 'NA', '5 ml', 1),
(1521, 10, 21, 1, 'Item', '2181265', 'NA', '5 ml', 1),
(1522, 10, 21, 1, 'Item', '2181266', 'NA', '5 ml', 1),
(1523, 10, 21, 1, 'Item', '2181267', 'NA', '5 ml', 1),
(1524, 10, 21, 1, 'Item', '2181268', 'NA', '5 ml', 1),
(1525, 10, 21, 1, 'Item', '2181269', 'NA', '5 ml', 1),
(1526, 10, 21, 1, 'Item', '2181270', 'NA', '5 ml', 1),
(1527, 10, 21, 1, 'Item', '2181271', 'NA', '5 ml', 1),
(1528, 10, 21, 1, 'Item', '2181272', 'NA', '5 ml', 1),
(1529, 10, 21, 1, 'Item', '2181273', 'NA', '5 ml', 1),
(1530, 10, 21, 1, 'Item', '2181274', 'NA', '5 ml', 1),
(1531, 10, 21, 1, 'Item', '2181275', 'NA', '5 ml', 1),
(1532, 10, 21, 1, 'Item', '2181276', 'NA', '5 ml', 1),
(1533, 10, 21, 1, 'Item', '2181277', 'NA', '5 ml', 1),
(1534, 10, 21, 1, 'Item', '2181278', 'NA', '5 ml', 1),
(1535, 10, 21, 1, 'Item', '2181279', 'NA', '5 ml', 1),
(1536, 10, 21, 1, 'Item', '2181280', 'NA', '5 ml', 1),
(1537, 10, 21, 1, 'Item', '2181281', 'NA', '5 ml', 1),
(1538, 10, 21, 1, 'Item', '2181282', 'NA', '5 ml', 1),
(1539, 10, 21, 1, 'Item', '2181283', 'NA', '5 ml', 1),
(1540, 10, 21, 1, 'Item', '2181284', 'NA', '5 ml', 1),
(1541, 10, 21, 1, 'Item', '2181285', 'NA', '5 ml', 1),
(1542, 10, 21, 1, 'Item', '2181286', 'NA', '5 ml', 1),
(1543, 10, 21, 1, 'Item', '2181287', 'NA', '5 ml', 1),
(1544, 10, 21, 1, 'Item', '2181288', 'NA', '5 ml', 1),
(1545, 10, 21, 1, 'Item', '2181289', 'NA', '5 ml', 1),
(1546, 10, 21, 1, 'Item', '2181290', 'NA', '5 ml', 1),
(1547, 10, 21, 1, 'Item', '2181291', 'NA', '5 ml', 1),
(1548, 10, 21, 1, 'Item', '2181292', 'NA', '5 ml', 1),
(1549, 10, 21, 1, 'Item', '2181293', 'NA', '5 ml', 1),
(1550, 10, 21, 1, 'Item', '2181294', 'NA', '5 ml', 1),
(1551, 10, 21, 1, 'Item', '2181295', 'NA', '5 ml', 1),
(1552, 10, 21, 1, 'Item', '2181296', 'NA', '5 ml', 1),
(1553, 10, 21, 1, 'Item', '2181297', 'NA', '5 ml', 1),
(1554, 10, 21, 1, 'Item', '2181298', 'NA', '5 ml', 1),
(1555, 10, 21, 1, 'Item', '2181299', 'NA', '5 ml', 1),
(1556, 10, 21, 1, 'Item', '2181300', 'NA', '5 ml', 1),
(1557, 10, 21, 1, 'Item', '2181301', 'NA', '5 ml', 1),
(1558, 10, 21, 1, 'Item', '2181302', 'NA', '5 ml', 1),
(1559, 10, 21, 1, 'Item', '2181303', 'NA', '5 ml', 1),
(1560, 10, 21, 1, 'Item', '2181304', 'NA', '5 ml', 1),
(1561, 10, 21, 1, 'Item', '2181305', 'NA', '5 ml', 1),
(1562, 10, 21, 1, 'Item', '2181306', 'NA', '5 ml', 1),
(1563, 10, 21, 1, 'Item', '2181307', 'NA', '5 ml', 1),
(1564, 10, 21, 1, 'Item', '2181308', 'NA', '5 ml', 1),
(1565, 10, 21, 1, 'Item', '2181309', 'NA', '5 ml', 1),
(1566, 10, 21, 1, 'Item', '2181310', 'NA', '5 ml', 1),
(1567, 10, 21, 1, 'Item', '2181311', 'NA', '5 ml', 1),
(1568, 10, 21, 1, 'Item', '2181312', 'NA', '5 ml', 1),
(1569, 10, 21, 1, 'Item', '2181313', 'NA', '5 ml', 1),
(1570, 10, 21, 1, 'Item', '2181314', 'NA', '5 ml', 1),
(1571, 10, 21, 1, 'Item', '2181315', 'NA', '5 ml', 1),
(1572, 10, 21, 1, 'Item', '2181316', 'NA', '5 ml', 1),
(1573, 10, 21, 1, 'Item', '2181317', 'NA', '5 ml', 1),
(1574, 10, 21, 1, 'Item', '2181318', 'NA', '5 ml', 1),
(1575, 10, 21, 1, 'Item', '2181319', 'NA', '5 ml', 1),
(1576, 10, 21, 1, 'Item', '2181320', 'NA', '5 ml', 1),
(1577, 10, 21, 1, 'Item', '2181321', 'NA', '5 ml', 1),
(1578, 10, 21, 1, 'Item', '2181322', 'NA', '5 ml', 1),
(1579, 10, 21, 1, 'Item', '2181323', 'NA', '5 ml', 1),
(1580, 10, 21, 1, 'Item', '2181324', 'NA', '5 ml', 1),
(1581, 10, 21, 1, 'Item', '2181325', 'NA', '5 ml', 1),
(1582, 10, 21, 1, 'Item', '2181326', 'NA', '5 ml', 1),
(1583, 10, 21, 1, 'Item', '2181327', 'NA', '5 ml', 1),
(1584, 10, 21, 1, 'Item', '2181328', 'NA', '5 ml', 1),
(1585, 10, 21, 1, 'Item', '2181329', 'NA', '5 ml', 1),
(1586, 10, 21, 1, 'Item', '2181330', 'NA', '5 ml', 1),
(1587, 10, 21, 1, 'Item', '2181331', 'NA', '5 ml', 1),
(1588, 10, 21, 1, 'Item', '2181332', 'NA', '5 ml', 1),
(1589, 10, 21, 1, 'Item', '2181333', 'NA', '5 ml', 1),
(1590, 10, 21, 1, 'Item', '2181334', 'NA', '5 ml', 1),
(1591, 10, 21, 1, 'Item', '2181335', 'NA', '5 ml', 1),
(1592, 10, 21, 1, 'Item', '2181336', 'NA', '5 ml', 1),
(1593, 10, 21, 1, 'Item', '2181337', 'NA', '5 ml', 1),
(1594, 10, 21, 1, 'Item', '2181338', 'NA', '5 ml', 1),
(1595, 10, 21, 1, 'Item', '2181339', 'NA', '5 ml', 1),
(1596, 10, 21, 1, 'Item', '2181340', 'NA', '5 ml', 1),
(1597, 10, 21, 1, 'Item', '2181341', 'NA', '5 ml', 1),
(1598, 10, 21, 1, 'Item', '2181342', 'NA', '5 ml', 1),
(1599, 10, 21, 1, 'Item', '2181343', 'NA', '5 ml', 1),
(1600, 10, 21, 1, 'Item', '2181344', 'NA', '5 ml', 1),
(1601, 10, 21, 1, 'Item', '2181345', 'NA', '5 ml', 1),
(1602, 10, 21, 1, 'Item', '2181346', 'NA', '5 ml', 1),
(1603, 10, 21, 1, 'Item', '2181347', 'NA', '5 ml', 1),
(1604, 10, 21, 1, 'Item', '2181348', 'NA', '5 ml', 1),
(1605, 10, 21, 1, 'Item', '2181349', 'NA', '5 ml', 1),
(1606, 10, 21, 1, 'Item', '2181350', 'NA', '5 ml', 1),
(1607, 10, 21, 1, 'Item', '2181351', 'NA', '5 ml', 1),
(1608, 10, 21, 1, 'Item', '2181352', 'NA', '5 ml', 1),
(1609, 10, 21, 1, 'Item', '2181353', 'NA', '5 ml', 1),
(1610, 10, 21, 1, 'Item', '2181354', 'NA', '5 ml', 1),
(1611, 10, 21, 1, 'Item', '2181355', 'NA', '5 ml', 1),
(1612, 10, 21, 1, 'Item', '2181356', 'NA', '5 ml', 1),
(1613, 10, 21, 1, 'Item', '2181357', 'NA', '5 ml', 1),
(1614, 10, 21, 1, 'Item', '2181358', 'NA', '5 ml', 1),
(1615, 10, 21, 1, 'Item', '2181359', 'NA', '5 ml', 1),
(1616, 10, 21, 1, 'Item', '2181360', 'NA', '5 ml', 1),
(1617, 10, 21, 1, 'Item', '2181361', 'NA', '5 ml', 1),
(1618, 10, 21, 1, 'Item', '2181362', 'NA', '5 ml', 1),
(1619, 10, 21, 1, 'Item', '2181363', 'NA', '5 ml', 1),
(1620, 10, 21, 1, 'Item', '2181364', 'NA', '5 ml', 1),
(1621, 10, 21, 1, 'Item', '2181365', 'NA', '5 ml', 1),
(1622, 10, 21, 1, 'Item', '2181366', 'NA', '5 ml', 1),
(1623, 10, 21, 1, 'Item', '2181367', 'NA', '5 ml', 1),
(1624, 10, 21, 1, 'Item', '2181368', 'NA', '5 ml', 1),
(1625, 10, 21, 1, 'Item', '2181369', 'NA', '5 ml', 1),
(1626, 10, 21, 1, 'Item', '2181370', 'NA', '5 ml', 1),
(1627, 10, 21, 1, 'Item', '2181371', 'NA', '5 ml', 1),
(1628, 10, 21, 1, 'Item', '2181372', 'NA', '5 ml', 1),
(1629, 10, 21, 1, 'Item', '2181373', 'NA', '5 ml', 1),
(1630, 10, 21, 1, 'Item', '2181374', 'NA', '5 ml', 1),
(1631, 10, 21, 1, 'Item', '2181375', 'NA', '5 ml', 1),
(1632, 10, 21, 1, 'Item', '2181376', 'NA', '5 ml', 1),
(1633, 10, 21, 1, 'Item', '2181377', 'NA', '5 ml', 1),
(1634, 10, 21, 1, 'Item', '2181378', 'NA', '5 ml', 1),
(1635, 10, 21, 1, 'Item', '2181379', 'NA', '5 ml', 1),
(1636, 10, 21, 1, 'Item', '2181380', 'NA', '5 ml', 1),
(1637, 10, 21, 1, 'Item', '2181381', 'NA', '5 ml', 1),
(1638, 10, 21, 1, 'Item', '2181382', 'NA', '5 ml', 1),
(1639, 10, 21, 1, 'Item', '2181383', 'NA', '5 ml', 1),
(1640, 10, 21, 1, 'Item', '2181384', 'NA', '5 ml', 1),
(1641, 10, 21, 1, 'Item', '2181385', 'NA', '5 ml', 1),
(1642, 10, 21, 1, 'Item', '2181386', 'NA', '5 ml', 1),
(1643, 10, 21, 1, 'Item', '2181387', 'NA', '5 ml', 1),
(1644, 10, 21, 1, 'Item', '2181388', 'NA', '5 ml', 1),
(1645, 10, 21, 1, 'Item', '2181389', 'NA', '5 ml', 1),
(1646, 10, 21, 1, 'Item', '2181390', 'NA', '5 ml', 1),
(1647, 10, 21, 1, 'Item', '2181391', 'NA', '5 ml', 1),
(1648, 10, 21, 1, 'Item', '2181392', 'NA', '5 ml', 1),
(1649, 10, 21, 1, 'Item', '2181393', 'NA', '5 ml', 1),
(1650, 10, 21, 1, 'Item', '2181394', 'NA', '5 ml', 1),
(1651, 10, 21, 1, 'Item', '2181395', 'NA', '5 ml', 1),
(1652, 10, 21, 1, 'Item', '2181396', 'NA', '5 ml', 1),
(1653, 10, 21, 1, 'Item', '2181397', 'NA', '5 ml', 1),
(1654, 10, 21, 1, 'Item', '2181398', 'NA', '5 ml', 1),
(1655, 10, 21, 1, 'Item', '2181399', 'NA', '5 ml', 1),
(1656, 10, 21, 1, 'Item', '2181400', 'NA', '5 ml', 1),
(1657, 10, 21, 1, 'Item', '2181401', 'NA', '5 ml', 1),
(1658, 10, 21, 1, 'Item', '2181402', 'NA', '5 ml', 1),
(1659, 10, 21, 1, 'Item', '2181403', 'NA', '5 ml', 1),
(1660, 10, 21, 1, 'Item', '2181404', 'NA', '5 ml', 1),
(1661, 10, 21, 1, 'Item', '2181405', 'NA', '5 ml', 1),
(1662, 10, 21, 1, 'Item', '2181406', 'NA', '5 ml', 1),
(1663, 10, 21, 1, 'Item', '2181407', 'NA', '5 ml', 1),
(1664, 10, 21, 1, 'Item', '2181408', 'NA', '5 ml', 1),
(1665, 10, 21, 1, 'Item', '2181409', 'NA', '5 ml', 1),
(1666, 10, 21, 1, 'Item', '2181410', 'NA', '5 ml', 1),
(1667, 10, 21, 1, 'Item', '2181411', 'NA', '5 ml', 1),
(1668, 10, 21, 1, 'Item', '2181412', 'NA', '5 ml', 1),
(1669, 10, 21, 1, 'Item', '2181413', 'NA', '5 ml', 1),
(1670, 10, 21, 1, 'Item', '2181414', 'NA', '5 ml', 1),
(1671, 10, 21, 1, 'Item', '2181415', 'NA', '5 ml', 1),
(1672, 10, 21, 1, 'Item', '2181416', 'NA', '5 ml', 1),
(1673, 10, 21, 1, 'Item', '2181417', 'NA', '5 ml', 1),
(1674, 10, 21, 1, 'Item', '2181418', 'NA', '5 ml', 1),
(1675, 10, 21, 1, 'Item', '2181419', 'NA', '5 ml', 1),
(1676, 10, 21, 1, 'Item', '2181420', 'NA', '5 ml', 1),
(1677, 10, 21, 1, 'Item', '2181421', 'NA', '5 ml', 1),
(1678, 10, 21, 1, 'Item', '2181422', 'NA', '5 ml', 1),
(1679, 10, 21, 1, 'Item', '2181423', 'NA', '5 ml', 1),
(1680, 10, 21, 1, 'Item', '2181424', 'NA', '5 ml', 1),
(1681, 10, 21, 1, 'Item', '2181425', 'NA', '5 ml', 1),
(1682, 10, 21, 1, 'Item', '2181426', 'NA', '5 ml', 1),
(1683, 10, 21, 1, 'Item', '2181427', 'NA', '5 ml', 1),
(1684, 10, 21, 1, 'Item', '2181428', 'NA', '5 ml', 1),
(1685, 10, 21, 1, 'Item', '2181429', 'NA', '5 ml', 1),
(1686, 10, 21, 1, 'Item', '2181430', 'NA', '5 ml', 1),
(1687, 10, 21, 1, 'Item', '2181431', 'NA', '5 ml', 1),
(1688, 10, 21, 1, 'Item', '2181432', 'NA', '5 ml', 1),
(1689, 10, 21, 1, 'Item', '2181433', 'NA', '5 ml', 1),
(1690, 10, 21, 1, 'Item', '2181434', 'NA', '5 ml', 1),
(1691, 10, 21, 1, 'Item', '2181435', 'NA', '5 ml', 1),
(1692, 10, 21, 1, 'Item', '2181436', 'NA', '5 ml', 1),
(1693, 10, 21, 1, 'Item', '2181437', 'NA', '5 ml', 1),
(1694, 10, 21, 1, 'Item', '2181438', 'NA', '5 ml', 1),
(1695, 10, 21, 1, 'Item', '2181439', 'NA', '5 ml', 1),
(1696, 10, 21, 1, 'Item', '2181440', 'NA', '5 ml', 1),
(1697, 10, 21, 1, 'Item', '2181441', 'NA', '5 ml', 1),
(1698, 10, 21, 1, 'Item', '2181442', 'NA', '5 ml', 1),
(1699, 10, 21, 1, 'Item', '2181443', 'NA', '5 ml', 1),
(1700, 10, 21, 1, 'Item', '2181444', 'NA', '5 ml', 1),
(1701, 10, 21, 1, 'Item', '2181445', 'NA', '5 ml', 1),
(1702, 10, 21, 1, 'Item', '2181446', 'NA', '5 ml', 1),
(1703, 10, 21, 1, 'Item', '2181447', 'NA', '5 ml', 1),
(1704, 10, 21, 1, 'Item', '2181448', 'NA', '5 ml', 1),
(1705, 10, 21, 1, 'Item', '2181449', 'NA', '5 ml', 1),
(1706, 10, 21, 1, 'Item', '2181450', 'NA', '5 ml', 1),
(1707, 10, 21, 1, 'Item', '2181451', 'NA', '5 ml', 1),
(1708, 10, 21, 1, 'Item', '2181452', 'NA', '5 ml', 1),
(1709, 10, 21, 1, 'Item', '2181453', 'NA', '5 ml', 1),
(1710, 10, 21, 1, 'Item', '2181454', 'NA', '5 ml', 1),
(1711, 10, 21, 1, 'Item', '2181455', 'NA', '5 ml', 1),
(1712, 10, 21, 1, 'Item', '2181456', 'NA', '5 ml', 1),
(1713, 10, 21, 1, 'Item', '2181457', 'NA', '5 ml', 1),
(1714, 10, 21, 1, 'Item', '2181458', 'NA', '5 ml', 1),
(1715, 10, 21, 1, 'Item', '2181459', 'NA', '5 ml', 1),
(1716, 10, 21, 1, 'Item', '2181460', 'NA', '5 ml', 1),
(1717, 10, 21, 1, 'Item', '2181461', 'NA', '5 ml', 1),
(1718, 10, 21, 1, 'Item', '2181462', 'NA', '5 ml', 1),
(1719, 10, 21, 1, 'Item', '2181463', 'NA', '5 ml', 1),
(1720, 10, 21, 1, 'Item', '2181464', 'NA', '5 ml', 1),
(1721, 10, 21, 1, 'Item', '2181465', 'NA', '5 ml', 1),
(1722, 10, 21, 1, 'Item', '2181466', 'NA', '5 ml', 1),
(1723, 10, 21, 1, 'Item', '2181467', 'NA', '5 ml', 1),
(1724, 10, 21, 1, 'Item', '2181468', 'NA', '5 ml', 1),
(1725, 10, 21, 1, 'Item', '2181469', 'NA', '5 ml', 1),
(1726, 10, 21, 1, 'Item', '2181470', 'NA', '5 ml', 1),
(1727, 10, 21, 1, 'Item', '2181471', 'NA', '5 ml', 1),
(1728, 10, 21, 1, 'Item', '2181472', 'NA', '5 ml', 1),
(1729, 10, 21, 1, 'Item', '2181473', 'NA', '5 ml', 1),
(1730, 10, 21, 1, 'Item', '2181474', 'NA', '5 ml', 1),
(1731, 10, 21, 1, 'Item', '2181475', 'NA', '5 ml', 1),
(1732, 10, 21, 1, 'Item', '2181476', 'NA', '5 ml', 1),
(1733, 10, 21, 1, 'Item', '2181477', 'NA', '5 ml', 1),
(1734, 10, 21, 1, 'Item', '2181478', 'NA', '5 ml', 1),
(1735, 10, 21, 1, 'Item', '2181479', 'NA', '5 ml', 1),
(1736, 10, 21, 1, 'Item', '2181480', 'NA', '5 ml', 1),
(1737, 10, 21, 1, 'Item', '2181481', 'NA', '5 ml', 1),
(1738, 10, 21, 1, 'Item', '2181482', 'NA', '5 ml', 1),
(1739, 10, 21, 1, 'Item', '2181483', 'NA', '5 ml', 1),
(1740, 10, 21, 1, 'Item', '2181484', 'NA', '5 ml', 1),
(1741, 10, 21, 1, 'Item', '2181485', 'NA', '5 ml', 1),
(1742, 10, 21, 1, 'Item', '2181486', 'NA', '5 ml', 1),
(1743, 10, 21, 1, 'Item', '2181487', 'NA', '5 ml', 1),
(1744, 10, 21, 1, 'Item', '2181488', 'NA', '5 ml', 1),
(1745, 10, 21, 1, 'Item', '2181489', 'NA', '5 ml', 1),
(1746, 10, 21, 1, 'Item', '2181490', 'NA', '5 ml', 1),
(1747, 10, 21, 1, 'Item', '2181491', 'NA', '5 ml', 1),
(1748, 10, 21, 1, 'Item', '2181492', 'NA', '5 ml', 1),
(1749, 10, 21, 1, 'Item', '2181493', 'NA', '5 ml', 1),
(1750, 10, 21, 1, 'Item', '2181494', 'NA', '5 ml', 1),
(1751, 10, 21, 1, 'Item', '2181495', 'NA', '5 ml', 1),
(1752, 10, 21, 1, 'Item', '2181496', 'NA', '5 ml', 1),
(1753, 10, 21, 1, 'Item', '2181497', 'NA', '5 ml', 1),
(1754, 10, 21, 1, 'Item', '2181498', 'NA', '5 ml', 1),
(1755, 10, 21, 1, 'Item', '2181499', 'NA', '5 ml', 1),
(1756, 10, 21, 1, 'Item', '2181500', 'NA', '5 ml', 1),
(1757, 10, 21, 1, 'Item', '2181501', 'NA', '5 ml', 1),
(1758, 10, 21, 1, 'Item', '2181502', 'NA', '5 ml', 1),
(1759, 10, 21, 1, 'Item', '2181503', 'NA', '5 ml', 1),
(1760, 10, 21, 1, 'Item', '2181504', 'NA', '5 ml', 1),
(1761, 10, 21, 1, 'Item', '2181505', 'NA', '5 ml', 1),
(1762, 10, 21, 1, 'Item', '2181506', 'NA', '5 ml', 1),
(1763, 10, 21, 1, 'Item', '2181507', 'NA', '5 ml', 1),
(1764, 10, 21, 1, 'Item', '2181508', 'NA', '5 ml', 1),
(1765, 10, 21, 1, 'Item', '2181509', 'NA', '5 ml', 1),
(1766, 10, 21, 1, 'Item', '2181510', 'NA', '5 ml', 1),
(1767, 10, 21, 1, 'Item', '2181511', 'NA', '5 ml', 1),
(1768, 10, 21, 1, 'Item', '2181512', 'NA', '5 ml', 1),
(1769, 10, 21, 1, 'Item', '2181513', 'NA', '5 ml', 1),
(1770, 10, 21, 1, 'Item', '2181514', 'NA', '5 ml', 1),
(1771, 10, 21, 1, 'Item', '2181515', 'NA', '5 ml', 1),
(1772, 10, 21, 1, 'Item', '2181516', 'NA', '5 ml', 1),
(1773, 10, 21, 1, 'Item', '2181517', 'NA', '5 ml', 1),
(1774, 10, 21, 1, 'Item', '2181518', 'NA', '5 ml', 1),
(1775, 10, 21, 1, 'Item', '2181519', 'NA', '5 ml', 1),
(1776, 10, 21, 1, 'Item', '2181520', 'NA', '5 ml', 1),
(1777, 10, 21, 1, 'Item', '2181521', 'NA', '5 ml', 1),
(1778, 10, 21, 1, 'Item', '2181522', 'NA', '5 ml', 1),
(1779, 10, 21, 1, 'Item', '2181523', 'NA', '5 ml', 1),
(1780, 10, 21, 1, 'Item', '2181524', 'NA', '5 ml', 1),
(1781, 10, 21, 1, 'Item', '2181525', 'NA', '5 ml', 1),
(1782, 10, 21, 1, 'Item', '2181526', 'NA', '5 ml', 1),
(1783, 10, 21, 1, 'Item', '2181527', 'NA', '5 ml', 1),
(1784, 10, 21, 1, 'Item', '2181528', 'NA', '5 ml', 1),
(1785, 10, 21, 1, 'Item', '2181529', 'NA', '5 ml', 1),
(1786, 10, 21, 1, 'Item', '2181530', 'NA', '5 ml', 1),
(1787, 10, 21, 1, 'Item', '2181531', 'NA', '5 ml', 1),
(1788, 10, 21, 1, 'Item', '2181532', 'NA', '5 ml', 1),
(1789, 10, 21, 1, 'Item', '2181533', 'NA', '5 ml', 1),
(1790, 10, 21, 1, 'Item', '2181534', 'NA', '5 ml', 1),
(1791, 10, 21, 1, 'Item', '2181535', 'NA', '5 ml', 1),
(1792, 10, 21, 1, 'Item', '2181536', 'NA', '5 ml', 1),
(1793, 10, 21, 1, 'Item', '2181537', 'NA', '5 ml', 1),
(1794, 10, 21, 1, 'Item', '2181538', 'NA', '5 ml', 1),
(1795, 10, 21, 1, 'Item', '2181539', 'NA', '5 ml', 1),
(1796, 10, 21, 1, 'Item', '2181540', 'NA', '5 ml', 1),
(1797, 10, 21, 1, 'Item', '2181541', 'NA', '5 ml', 1),
(1798, 10, 21, 1, 'Item', '2181542', 'NA', '5 ml', 1),
(1799, 10, 21, 1, 'Item', '2181543', 'NA', '5 ml', 1),
(1800, 10, 21, 1, 'Item', '2181544', 'NA', '5 ml', 1),
(1801, 10, 21, 1, 'Item', '2181545', 'NA', '5 ml', 1),
(1802, 10, 21, 1, 'Item', '2181546', 'NA', '5 ml', 1),
(1803, 10, 21, 1, 'Item', '2181547', 'NA', '5 ml', 1),
(1804, 10, 21, 1, 'Item', '2181548', 'NA', '5 ml', 1),
(1805, 10, 21, 1, 'Item', '2181549', 'NA', '5 ml', 1),
(1806, 10, 21, 1, 'Item', '2181550', 'NA', '5 ml', 1),
(1807, 10, 21, 1, 'Item', '2181551', 'NA', '5 ml', 1),
(1808, 10, 21, 1, 'Item', '2181552', 'NA', '5 ml', 1),
(1809, 10, 21, 1, 'Item', '2181553', 'NA', '5 ml', 1),
(1810, 10, 21, 1, 'Item', '2181554', 'NA', '5 ml', 1),
(1811, 10, 21, 1, 'Item', '2181555', 'NA', '5 ml', 1),
(1812, 10, 21, 1, 'Item', '2181556', 'NA', '5 ml', 1),
(1813, 10, 21, 1, 'Item', '2181557', 'NA', '5 ml', 1),
(1814, 10, 21, 1, 'Item', '2181558', 'NA', '5 ml', 1),
(1815, 10, 21, 1, 'Item', '2181559', 'NA', '5 ml', 1),
(1816, 10, 21, 1, 'Item', '2181560', 'NA', '5 ml', 1),
(1817, 10, 21, 1, 'Item', '2181561', 'NA', '5 ml', 1),
(1818, 10, 21, 1, 'Item', '2181562', 'NA', '5 ml', 1),
(1819, 10, 21, 1, 'Item', '2181563', 'NA', '5 ml', 1),
(1820, 10, 21, 1, 'Item', '2181564', 'NA', '5 ml', 1),
(1821, 10, 21, 1, 'Item', '2181565', 'NA', '5 ml', 1),
(1822, 10, 21, 1, 'Item', '2181566', 'NA', '5 ml', 1),
(1823, 10, 21, 1, 'Item', '2181567', 'NA', '5 ml', 1),
(1824, 10, 21, 1, 'Item', '2181568', 'NA', '5 ml', 1),
(1825, 10, 21, 1, 'Item', '2181569', 'NA', '5 ml', 1),
(1826, 10, 21, 1, 'Item', '2181570', 'NA', '5 ml', 1),
(1827, 10, 21, 1, 'Item', '2181571', 'NA', '5 ml', 1),
(1828, 10, 21, 1, 'Item', '2181572', 'NA', '5 ml', 1),
(1829, 10, 21, 1, 'Item', '2181573', 'NA', '5 ml', 1),
(1830, 10, 21, 1, 'Item', '2181574', 'NA', '5 ml', 1),
(1831, 10, 21, 1, 'Item', '2181575', 'NA', '5 ml', 1),
(1832, 10, 21, 1, 'Item', '2181576', 'NA', '5 ml', 1),
(1833, 10, 21, 1, 'Item', '2181577', 'NA', '5 ml', 1),
(1834, 10, 21, 1, 'Item', '2181578', 'NA', '5 ml', 1),
(1835, 10, 21, 1, 'Item', '2181579', 'NA', '5 ml', 1),
(1836, 10, 21, 1, 'Item', '2181580', 'NA', '5 ml', 1),
(1837, 10, 21, 1, 'Item', '2181581', 'NA', '5 ml', 1),
(1838, 10, 21, 1, 'Item', '2181582', 'NA', '5 ml', 1),
(1839, 10, 21, 1, 'Item', '2181583', 'NA', '5 ml', 1),
(1840, 10, 21, 1, 'Item', '2181584', 'NA', '5 ml', 1),
(1841, 10, 21, 1, 'Item', '2181585', 'NA', '5 ml', 1),
(1842, 10, 21, 1, 'Item', '2181586', 'NA', '5 ml', 1),
(1843, 10, 21, 1, 'Item', '2181587', 'NA', '5 ml', 1),
(1844, 10, 21, 1, 'Item', '2181588', 'NA', '5 ml', 1),
(1845, 10, 21, 1, 'Item', '2181589', 'NA', '5 ml', 1),
(1846, 10, 21, 1, 'Item', '2181590', 'NA', '5 ml', 1),
(1847, 10, 21, 1, 'Item', '2181591', 'NA', '5 ml', 1),
(1848, 10, 21, 1, 'Item', '2181592', 'NA', '5 ml', 1),
(1849, 10, 21, 1, 'Item', '2181593', 'NA', '5 ml', 1),
(1850, 10, 21, 1, 'Item', '2181594', 'NA', '5 ml', 1),
(1851, 10, 21, 1, 'Item', '2181595', 'NA', '5 ml', 1),
(1852, 10, 21, 1, 'Item', '2181596', 'NA', '5 ml', 1),
(1853, 10, 21, 1, 'Item', '2181597', 'NA', '5 ml', 1),
(1854, 10, 21, 1, 'Item', '2181598', 'NA', '5 ml', 1),
(1855, 10, 21, 1, 'Item', '2181599', 'NA', '5 ml', 1),
(1856, 10, 21, 1, 'Item', '2181600', 'NA', '5 ml', 1),
(1857, 10, 21, 1, 'Item', '2181601', 'NA', '5 ml', 1),
(1858, 10, 21, 1, 'Item', '2181602', 'NA', '5 ml', 1),
(1859, 10, 21, 1, 'Item', '2181603', 'NA', '5 ml', 1),
(1860, 10, 21, 1, 'Item', '2181604', 'NA', '5 ml', 1),
(1861, 10, 21, 1, 'Item', '2181605', 'NA', '5 ml', 1),
(1862, 10, 21, 1, 'Item', '2181606', 'NA', '5 ml', 1),
(1863, 10, 21, 1, 'Item', '2181607', 'NA', '5 ml', 1),
(1864, 10, 21, 1, 'Item', '2181608', 'NA', '5 ml', 1),
(1865, 10, 21, 1, 'Item', '2181609', 'NA', '5 ml', 1),
(1866, 10, 21, 1, 'Item', '2181610', 'NA', '5 ml', 1),
(1867, 10, 21, 1, 'Item', '2181611', 'NA', '5 ml', 1),
(1868, 10, 21, 1, 'Item', '2181612', 'NA', '5 ml', 1),
(1869, 10, 21, 1, 'Item', '2181613', 'NA', '5 ml', 1),
(1870, 10, 21, 1, 'Item', '2181614', 'NA', '5 ml', 1),
(1871, 10, 21, 1, 'Item', '2181615', 'NA', '5 ml', 1),
(1872, 10, 21, 1, 'Item', '2181616', 'NA', '5 ml', 1),
(1873, 10, 21, 1, 'Item', '2181617', 'NA', '5 ml', 1),
(1874, 10, 21, 1, 'Item', '2181618', 'NA', '5 ml', 1),
(1875, 10, 21, 1, 'Item', '2181619', 'NA', '5 ml', 1),
(1876, 10, 21, 1, 'Item', '2181620', 'NA', '5 ml', 1),
(1877, 10, 21, 1, 'Item', '2181621', 'NA', '5 ml', 1),
(1878, 10, 21, 1, 'Item', '2181622', 'NA', '5 ml', 1),
(1879, 10, 21, 1, 'Item', '2181623', 'NA', '5 ml', 1),
(1880, 10, 21, 1, 'Item', '2181624', 'NA', '5 ml', 1),
(1881, 10, 21, 1, 'Item', '2181625', 'NA', '5 ml', 1),
(1882, 10, 21, 1, 'Item', '2181626', 'NA', '5 ml', 1),
(1883, 10, 21, 1, 'Item', '2181627', 'NA', '5 ml', 1),
(1884, 10, 21, 1, 'Item', '2181628', 'NA', '5 ml', 1),
(1885, 10, 21, 1, 'Item', '2181629', 'NA', '5 ml', 1),
(1886, 10, 21, 1, 'Item', '2181630', 'NA', '5 ml', 1),
(1887, 10, 21, 1, 'Item', '2181631', 'NA', '5 ml', 1),
(1888, 10, 21, 1, 'Item', '2181632', 'NA', '5 ml', 1),
(1889, 10, 21, 1, 'Item', '2181633', 'NA', '5 ml', 1),
(1890, 10, 21, 1, 'Item', '2181634', 'NA', '5 ml', 1),
(1891, 10, 21, 1, 'Item', '2181635', 'NA', '5 ml', 1),
(1892, 10, 21, 1, 'Item', '2181636', 'NA', '5 ml', 1),
(1893, 10, 21, 1, 'Item', '2181637', 'NA', '5 ml', 1),
(1894, 10, 21, 1, 'Item', '2181638', 'NA', '5 ml', 1),
(1895, 10, 21, 1, 'Item', '2181639', 'NA', '5 ml', 1),
(1896, 10, 21, 1, 'Item', '2181640', 'NA', '5 ml', 1),
(1897, 10, 21, 1, 'Item', '2181641', 'NA', '5 ml', 1),
(1898, 10, 21, 1, 'Item', '2181642', 'NA', '5 ml', 1),
(1899, 10, 21, 1, 'Item', '2181643', 'NA', '5 ml', 1),
(1900, 10, 21, 1, 'Item', '2181644', 'NA', '5 ml', 1),
(1901, 10, 21, 1, 'Item', '2181645', 'NA', '5 ml', 1),
(1902, 10, 21, 1, 'Item', '2181646', 'NA', '5 ml', 1),
(1903, 10, 21, 1, 'Item', '2181647', 'NA', '5 ml', 1),
(1904, 10, 21, 1, 'Item', '2181648', 'NA', '5 ml', 1),
(1905, 10, 21, 1, 'Item', '2181649', 'NA', '5 ml', 1);
INSERT INTO `tp_package_primary` (`id`, `product_id`, `lot_id`, `pack_type_id`, `package_type`, `package_sn`, `package_image`, `ineer_package_count`, `is_active`) VALUES
(1906, 10, 21, 1, 'Item', '2181650', 'NA', '5 ml', 1),
(1907, 10, 21, 1, 'Item', '2181651', 'NA', '5 ml', 1),
(1908, 10, 21, 1, 'Item', '2181652', 'NA', '5 ml', 1),
(1909, 10, 21, 1, 'Item', '2181653', 'NA', '5 ml', 1),
(1910, 10, 21, 1, 'Item', '2181654', 'NA', '5 ml', 1),
(1911, 10, 21, 1, 'Item', '2181655', 'NA', '5 ml', 1),
(1912, 10, 21, 1, 'Item', '2181656', 'NA', '5 ml', 1),
(1913, 10, 21, 1, 'Item', '2181657', 'NA', '5 ml', 1),
(1914, 10, 21, 1, 'Item', '2181658', 'NA', '5 ml', 1),
(1915, 10, 21, 1, 'Item', '2181659', 'NA', '5 ml', 1),
(1916, 10, 21, 1, 'Item', '2181660', 'NA', '5 ml', 1),
(1917, 10, 21, 1, 'Item', '2181661', 'NA', '5 ml', 1),
(1918, 10, 21, 1, 'Item', '2181662', 'NA', '5 ml', 1),
(1919, 10, 21, 1, 'Item', '2181663', 'NA', '5 ml', 1),
(1920, 10, 21, 1, 'Item', '2181664', 'NA', '5 ml', 1),
(1921, 10, 21, 1, 'Item', '2181665', 'NA', '5 ml', 1),
(1922, 10, 21, 1, 'Item', '2181666', 'NA', '5 ml', 1),
(1923, 10, 21, 1, 'Item', '2181667', 'NA', '5 ml', 1),
(1924, 10, 21, 1, 'Item', '2181668', 'NA', '5 ml', 1),
(1925, 10, 21, 1, 'Item', '2181669', 'NA', '5 ml', 1),
(1926, 10, 21, 1, 'Item', '2181670', 'NA', '5 ml', 1),
(1927, 10, 21, 1, 'Item', '2181671', 'NA', '5 ml', 1),
(1928, 10, 21, 1, 'Item', '2181672', 'NA', '5 ml', 1),
(1929, 10, 21, 1, 'Item', '2181673', 'NA', '5 ml', 1),
(1930, 10, 21, 1, 'Item', '2181674', 'NA', '5 ml', 1),
(1931, 10, 21, 1, 'Item', '2181675', 'NA', '5 ml', 1),
(1932, 10, 21, 1, 'Item', '2181676', 'NA', '5 ml', 1),
(1933, 10, 21, 1, 'Item', '2181677', 'NA', '5 ml', 1),
(1934, 10, 21, 1, 'Item', '2181678', 'NA', '5 ml', 1),
(1935, 10, 21, 1, 'Item', '2181679', 'NA', '5 ml', 1),
(1936, 10, 21, 1, 'Item', '2181680', 'NA', '5 ml', 1),
(1937, 10, 21, 1, 'Item', '2181681', 'NA', '5 ml', 1),
(1938, 10, 21, 1, 'Item', '2181682', 'NA', '5 ml', 1),
(1939, 10, 21, 1, 'Item', '2181683', 'NA', '5 ml', 1),
(1940, 10, 21, 1, 'Item', '2181684', 'NA', '5 ml', 1),
(1941, 10, 21, 1, 'Item', '2181685', 'NA', '5 ml', 1),
(1942, 10, 21, 1, 'Item', '2181686', 'NA', '5 ml', 1),
(1943, 10, 21, 1, 'Item', '2181687', 'NA', '5 ml', 1),
(1944, 10, 21, 1, 'Item', '2181688', 'NA', '5 ml', 1),
(1945, 10, 21, 1, 'Item', '2181689', 'NA', '5 ml', 1),
(1946, 10, 21, 1, 'Item', '2181690', 'NA', '5 ml', 1),
(1947, 10, 21, 1, 'Item', '2181691', 'NA', '5 ml', 1),
(1948, 10, 21, 1, 'Item', '2181692', 'NA', '5 ml', 1),
(1949, 10, 21, 1, 'Item', '2181693', 'NA', '5 ml', 1),
(1950, 10, 21, 1, 'Item', '2181694', 'NA', '5 ml', 1),
(1951, 10, 21, 1, 'Item', '2181695', 'NA', '5 ml', 1),
(1952, 10, 21, 1, 'Item', '2181696', 'NA', '5 ml', 1),
(1953, 10, 21, 1, 'Item', '2181697', 'NA', '5 ml', 1),
(1954, 10, 21, 1, 'Item', '2181698', 'NA', '5 ml', 1),
(1955, 10, 21, 1, 'Item', '2181699', 'NA', '5 ml', 1),
(1956, 10, 21, 1, 'Item', '2181700', 'NA', '5 ml', 1),
(1957, 10, 21, 1, 'Item', '2181701', 'NA', '5 ml', 1),
(1958, 10, 21, 1, 'Item', '2181702', 'NA', '5 ml', 1),
(1959, 10, 21, 1, 'Item', '2181703', 'NA', '5 ml', 1),
(1960, 10, 21, 1, 'Item', '2181704', 'NA', '5 ml', 1),
(1961, 10, 21, 1, 'Item', '2181705', 'NA', '5 ml', 1),
(1962, 10, 21, 1, 'Item', '2181706', 'NA', '5 ml', 1),
(1963, 10, 21, 1, 'Item', '2181707', 'NA', '5 ml', 1),
(1964, 10, 21, 1, 'Item', '2181708', 'NA', '5 ml', 1),
(1965, 10, 21, 1, 'Item', '2181709', 'NA', '5 ml', 1),
(1966, 10, 21, 1, 'Item', '2181710', 'NA', '5 ml', 1),
(1967, 10, 21, 1, 'Item', '2181711', 'NA', '5 ml', 1),
(1968, 10, 21, 1, 'Item', '2181712', 'NA', '5 ml', 1),
(1969, 10, 21, 1, 'Item', '2181713', 'NA', '5 ml', 1),
(1970, 10, 21, 1, 'Item', '2181714', 'NA', '5 ml', 1),
(1971, 10, 21, 1, 'Item', '2181715', 'NA', '5 ml', 1),
(1972, 10, 21, 1, 'Item', '2181716', 'NA', '5 ml', 1),
(1973, 10, 21, 1, 'Item', '2181717', 'NA', '5 ml', 1),
(1974, 10, 21, 1, 'Item', '2181718', 'NA', '5 ml', 1),
(1975, 10, 21, 1, 'Item', '2181719', 'NA', '5 ml', 1),
(1976, 10, 21, 1, 'Item', '2181720', 'NA', '5 ml', 1),
(1977, 10, 21, 1, 'Item', '2181721', 'NA', '5 ml', 1),
(1978, 10, 21, 1, 'Item', '2181722', 'NA', '5 ml', 1),
(1979, 10, 21, 1, 'Item', '2181723', 'NA', '5 ml', 1),
(1980, 10, 21, 1, 'Item', '2181724', 'NA', '5 ml', 1),
(1981, 10, 21, 1, 'Item', '2181725', 'NA', '5 ml', 1),
(1982, 10, 21, 1, 'Item', '2181726', 'NA', '5 ml', 1),
(1983, 10, 21, 1, 'Item', '2181727', 'NA', '5 ml', 1),
(1984, 10, 21, 1, 'Item', '2181728', 'NA', '5 ml', 1),
(1985, 10, 21, 1, 'Item', '2181729', 'NA', '5 ml', 1),
(1986, 10, 21, 1, 'Item', '2181730', 'NA', '5 ml', 1),
(1987, 10, 21, 1, 'Item', '2181731', 'NA', '5 ml', 1),
(1988, 10, 21, 1, 'Item', '2181732', 'NA', '5 ml', 1),
(1989, 10, 21, 1, 'Item', '2181733', 'NA', '5 ml', 1),
(1990, 10, 21, 1, 'Item', '2181734', 'NA', '5 ml', 1),
(1991, 10, 21, 1, 'Item', '2181735', 'NA', '5 ml', 1),
(1992, 10, 21, 1, 'Item', '2181736', 'NA', '5 ml', 1),
(1993, 10, 21, 1, 'Item', '2181737', 'NA', '5 ml', 1),
(1994, 10, 21, 1, 'Item', '2181738', 'NA', '5 ml', 1),
(1995, 10, 21, 1, 'Item', '2181739', 'NA', '5 ml', 1),
(1996, 10, 21, 1, 'Item', '2181740', 'NA', '5 ml', 1),
(1997, 10, 21, 1, 'Item', '2181741', 'NA', '5 ml', 1),
(1998, 10, 21, 1, 'Item', '2181742', 'NA', '5 ml', 1),
(1999, 10, 21, 1, 'Item', '2181743', 'NA', '5 ml', 1),
(2000, 10, 21, 1, 'Item', '2181744', 'NA', '5 ml', 1),
(2001, 10, 21, 1, 'Item', '2181745', 'NA', '5 ml', 1),
(2002, 10, 21, 1, 'Item', '2181746', 'NA', '5 ml', 1),
(2003, 10, 21, 1, 'Item', '2181747', 'NA', '5 ml', 1),
(2004, 10, 21, 1, 'Item', '2181748', 'NA', '5 ml', 1),
(2005, 10, 21, 1, 'Item', '2181749', 'NA', '5 ml', 1),
(2006, 10, 21, 1, 'Item', '2181750', 'NA', '5 ml', 1),
(2007, 10, 21, 1, 'Item', '2181751', 'NA', '5 ml', 1),
(2008, 10, 21, 1, 'Item', '2181752', 'NA', '5 ml', 1),
(2009, 10, 21, 1, 'Item', '2181753', 'NA', '5 ml', 1),
(2010, 10, 21, 1, 'Item', '2181754', 'NA', '5 ml', 1),
(2011, 10, 21, 1, 'Item', '2181755', 'NA', '5 ml', 1),
(2012, 10, 21, 1, 'Item', '2181756', 'NA', '5 ml', 1),
(2013, 10, 21, 1, 'Item', '2181757', 'NA', '5 ml', 1),
(2014, 10, 21, 1, 'Item', '2181758', 'NA', '5 ml', 1),
(2015, 10, 21, 1, 'Item', '2181759', 'NA', '5 ml', 1),
(2016, 10, 21, 1, 'Item', '2181760', 'NA', '5 ml', 1),
(2017, 10, 21, 1, 'Item', '2181761', 'NA', '5 ml', 1),
(2018, 10, 21, 1, 'Item', '2181762', 'NA', '5 ml', 1),
(2019, 10, 21, 1, 'Item', '2181763', 'NA', '5 ml', 1),
(2020, 10, 21, 1, 'Item', '2181764', 'NA', '5 ml', 1),
(2021, 10, 21, 1, 'Item', '2181765', 'NA', '5 ml', 1),
(2022, 10, 21, 1, 'Item', '2181766', 'NA', '5 ml', 1),
(2023, 10, 21, 1, 'Item', '2181767', 'NA', '5 ml', 1),
(2024, 10, 21, 1, 'Item', '2181768', 'NA', '5 ml', 1),
(2025, 10, 21, 1, 'Item', '2181769', 'NA', '5 ml', 1),
(2026, 10, 21, 1, 'Item', '2181770', 'NA', '5 ml', 1),
(2027, 10, 21, 1, 'Item', '2181771', 'NA', '5 ml', 1),
(2028, 10, 21, 1, 'Item', '2181772', 'NA', '5 ml', 1),
(2029, 10, 21, 1, 'Item', '2181773', 'NA', '5 ml', 1),
(2030, 10, 21, 1, 'Item', '2181774', 'NA', '5 ml', 1),
(2031, 10, 21, 1, 'Item', '2181775', 'NA', '5 ml', 1),
(2032, 10, 21, 1, 'Item', '2181776', 'NA', '5 ml', 1),
(2033, 10, 21, 1, 'Item', '2181777', 'NA', '5 ml', 1),
(2034, 10, 21, 1, 'Item', '2181778', 'NA', '5 ml', 1),
(2035, 10, 21, 1, 'Item', '2181779', 'NA', '5 ml', 1),
(2036, 10, 21, 1, 'Item', '2181780', 'NA', '5 ml', 1),
(2037, 10, 21, 1, 'Item', '2181781', 'NA', '5 ml', 1),
(2038, 10, 21, 1, 'Item', '2181782', 'NA', '5 ml', 1),
(2039, 10, 21, 1, 'Item', '2181783', 'NA', '5 ml', 1),
(2040, 10, 21, 1, 'Item', '2181784', 'NA', '5 ml', 1),
(2041, 10, 21, 1, 'Item', '2181785', 'NA', '5 ml', 1),
(2042, 10, 21, 1, 'Item', '2181786', 'NA', '5 ml', 1),
(2043, 10, 21, 1, 'Item', '2181787', 'NA', '5 ml', 1),
(2044, 10, 21, 1, 'Item', '2181788', 'NA', '5 ml', 1),
(2045, 10, 21, 1, 'Item', '2181789', 'NA', '5 ml', 1),
(2046, 10, 21, 1, 'Item', '2181790', 'NA', '5 ml', 1),
(2047, 10, 21, 1, 'Item', '2181791', 'NA', '5 ml', 1),
(2048, 10, 21, 1, 'Item', '2181792', 'NA', '5 ml', 1),
(2049, 10, 21, 1, 'Item', '2181793', 'NA', '5 ml', 1),
(2050, 10, 21, 1, 'Item', '2181794', 'NA', '5 ml', 1),
(2051, 10, 21, 1, 'Item', '2181795', 'NA', '5 ml', 1),
(2052, 10, 21, 1, 'Item', '2181796', 'NA', '5 ml', 1),
(2053, 10, 21, 1, 'Item', '2181797', 'NA', '5 ml', 1),
(2054, 10, 21, 1, 'Item', '2181798', 'NA', '5 ml', 1),
(2055, 10, 21, 1, 'Item', '2181799', 'NA', '5 ml', 1),
(2056, 10, 21, 1, 'Item', '2181800', 'NA', '5 ml', 1),
(2057, 10, 21, 1, 'Item', '2181801', 'NA', '5 ml', 1),
(2058, 10, 21, 1, 'Item', '2181802', 'NA', '5 ml', 1),
(2059, 10, 21, 1, 'Item', '2181803', 'NA', '5 ml', 1),
(2060, 10, 21, 1, 'Item', '2181804', 'NA', '5 ml', 1),
(2061, 10, 21, 1, 'Item', '2181805', 'NA', '5 ml', 1),
(2062, 10, 21, 1, 'Item', '2181806', 'NA', '5 ml', 1),
(2063, 10, 21, 1, 'Item', '2181807', 'NA', '5 ml', 1),
(2064, 10, 21, 1, 'Item', '2181808', 'NA', '5 ml', 1),
(2065, 10, 21, 1, 'Item', '2181809', 'NA', '5 ml', 1),
(2066, 10, 21, 1, 'Item', '2181810', 'NA', '5 ml', 1),
(2067, 10, 21, 1, 'Item', '2181811', 'NA', '5 ml', 1),
(2068, 10, 21, 1, 'Item', '2181812', 'NA', '5 ml', 1),
(2069, 10, 21, 1, 'Item', '2181813', 'NA', '5 ml', 1),
(2070, 10, 21, 1, 'Item', '2181814', 'NA', '5 ml', 1),
(2071, 10, 21, 1, 'Item', '2181815', 'NA', '5 ml', 1),
(2072, 10, 21, 1, 'Item', '2181816', 'NA', '5 ml', 1),
(2073, 10, 21, 1, 'Item', '2181817', 'NA', '5 ml', 1),
(2074, 10, 21, 1, 'Item', '2181818', 'NA', '5 ml', 1),
(2075, 10, 21, 1, 'Item', '2181819', 'NA', '5 ml', 1),
(2076, 10, 21, 1, 'Item', '2181820', 'NA', '5 ml', 1),
(2077, 10, 21, 1, 'Item', '2181821', 'NA', '5 ml', 1),
(2078, 10, 21, 1, 'Item', '2181822', 'NA', '5 ml', 1),
(2079, 10, 21, 1, 'Item', '2181823', 'NA', '5 ml', 1),
(2080, 10, 21, 1, 'Item', '2181824', 'NA', '5 ml', 1),
(2081, 10, 21, 1, 'Item', '2181825', 'NA', '5 ml', 1),
(2082, 10, 21, 1, 'Item', '2181826', 'NA', '5 ml', 1),
(2083, 10, 21, 1, 'Item', '2181827', 'NA', '5 ml', 1),
(2084, 10, 21, 1, 'Item', '2181828', 'NA', '5 ml', 1),
(2085, 10, 21, 1, 'Item', '2181829', 'NA', '5 ml', 1),
(2086, 10, 21, 1, 'Item', '2181830', 'NA', '5 ml', 1),
(2087, 10, 21, 1, 'Item', '2181831', 'NA', '5 ml', 1),
(2088, 10, 21, 1, 'Item', '2181832', 'NA', '5 ml', 1),
(2089, 10, 21, 1, 'Item', '2181833', 'NA', '5 ml', 1),
(2090, 10, 21, 1, 'Item', '2181834', 'NA', '5 ml', 1),
(2091, 10, 21, 1, 'Item', '2181835', 'NA', '5 ml', 1),
(2092, 10, 21, 1, 'Item', '2181836', 'NA', '5 ml', 1),
(2093, 10, 21, 1, 'Item', '2181837', 'NA', '5 ml', 1),
(2094, 10, 21, 1, 'Item', '2181838', 'NA', '5 ml', 1),
(2095, 10, 21, 1, 'Item', '2181839', 'NA', '5 ml', 1),
(2096, 10, 21, 1, 'Item', '2181840', 'NA', '5 ml', 1),
(2097, 10, 21, 1, 'Item', '2181841', 'NA', '5 ml', 1),
(2098, 10, 21, 1, 'Item', '2181842', 'NA', '5 ml', 1),
(2099, 10, 21, 1, 'Item', '2181843', 'NA', '5 ml', 1),
(2100, 10, 21, 1, 'Item', '2181844', 'NA', '5 ml', 1),
(2101, 10, 21, 1, 'Item', '2181845', 'NA', '5 ml', 1),
(2102, 10, 21, 1, 'Item', '2181846', 'NA', '5 ml', 1),
(2103, 10, 21, 1, 'Item', '2181847', 'NA', '5 ml', 1),
(2104, 10, 21, 1, 'Item', '2181848', 'NA', '5 ml', 1),
(2105, 10, 21, 1, 'Item', '2181849', 'NA', '5 ml', 1),
(2106, 10, 21, 1, 'Item', '2181850', 'NA', '5 ml', 1),
(2107, 10, 21, 1, 'Item', '2181851', 'NA', '5 ml', 1),
(2108, 10, 21, 1, 'Item', '2181852', 'NA', '5 ml', 1),
(2109, 10, 21, 1, 'Item', '2181853', 'NA', '5 ml', 1),
(2110, 10, 21, 1, 'Item', '2181854', 'NA', '5 ml', 1),
(2111, 10, 21, 1, 'Item', '2181855', 'NA', '5 ml', 1),
(2112, 10, 21, 1, 'Item', '2181856', 'NA', '5 ml', 1),
(2113, 10, 21, 1, 'Item', '2181857', 'NA', '5 ml', 1),
(2114, 10, 21, 1, 'Item', '2181858', 'NA', '5 ml', 1),
(2115, 10, 21, 1, 'Item', '2181859', 'NA', '5 ml', 1),
(2116, 10, 21, 1, 'Item', '2181860', 'NA', '5 ml', 1),
(2117, 10, 21, 1, 'Item', '2181861', 'NA', '5 ml', 1),
(2118, 10, 21, 1, 'Item', '2181862', 'NA', '5 ml', 1),
(2119, 10, 21, 1, 'Item', '2181863', 'NA', '5 ml', 1),
(2120, 10, 21, 1, 'Item', '2181864', 'NA', '5 ml', 1),
(2121, 10, 21, 1, 'Item', '2181865', 'NA', '5 ml', 1),
(2122, 10, 21, 1, 'Item', '2181866', 'NA', '5 ml', 1),
(2123, 10, 21, 1, 'Item', '2181867', 'NA', '5 ml', 1),
(2124, 10, 21, 1, 'Item', '2181868', 'NA', '5 ml', 1),
(2125, 10, 21, 1, 'Item', '2181869', 'NA', '5 ml', 1),
(2126, 10, 21, 1, 'Item', '2181870', 'NA', '5 ml', 1),
(2127, 10, 21, 1, 'Item', '2181871', 'NA', '5 ml', 1),
(2128, 10, 21, 1, 'Item', '2181872', 'NA', '5 ml', 1),
(2129, 10, 21, 1, 'Item', '2181873', 'NA', '5 ml', 1),
(2130, 10, 21, 1, 'Item', '2181874', 'NA', '5 ml', 1),
(2131, 10, 21, 1, 'Item', '2181875', 'NA', '5 ml', 1),
(2132, 10, 21, 1, 'Item', '2181876', 'NA', '5 ml', 1),
(2133, 10, 21, 1, 'Item', '2181877', 'NA', '5 ml', 1),
(2134, 10, 21, 1, 'Item', '2181878', 'NA', '5 ml', 1),
(2135, 10, 21, 1, 'Item', '2181879', 'NA', '5 ml', 1),
(2136, 10, 21, 1, 'Item', '2181880', 'NA', '5 ml', 1),
(2137, 10, 21, 1, 'Item', '2181881', 'NA', '5 ml', 1),
(2138, 10, 21, 1, 'Item', '2181882', 'NA', '5 ml', 1),
(2139, 10, 21, 1, 'Item', '2181883', 'NA', '5 ml', 1),
(2140, 10, 21, 1, 'Item', '2181884', 'NA', '5 ml', 1),
(2141, 10, 21, 1, 'Item', '2181885', 'NA', '5 ml', 1),
(2142, 10, 21, 1, 'Item', '2181886', 'NA', '5 ml', 1),
(2143, 10, 21, 1, 'Item', '2181887', 'NA', '5 ml', 1),
(2144, 10, 21, 1, 'Item', '2181888', 'NA', '5 ml', 1),
(2145, 10, 21, 1, 'Item', '2181889', 'NA', '5 ml', 1),
(2146, 10, 21, 1, 'Item', '2181890', 'NA', '5 ml', 1),
(2147, 10, 21, 1, 'Item', '2181891', 'NA', '5 ml', 1),
(2148, 10, 21, 1, 'Item', '2181892', 'NA', '5 ml', 1),
(2149, 10, 21, 1, 'Item', '2181893', 'NA', '5 ml', 1),
(2150, 10, 21, 1, 'Item', '2181894', 'NA', '5 ml', 1),
(2151, 10, 21, 1, 'Item', '2181895', 'NA', '5 ml', 1),
(2152, 10, 21, 1, 'Item', '2181896', 'NA', '5 ml', 1),
(2153, 10, 21, 1, 'Item', '2181897', 'NA', '5 ml', 1),
(2154, 10, 21, 1, 'Item', '2181898', 'NA', '5 ml', 1),
(2155, 10, 21, 1, 'Item', '2181899', 'NA', '5 ml', 1),
(2156, 10, 21, 1, 'Item', '2181900', 'NA', '5 ml', 1),
(2157, 10, 21, 1, 'Item', '2181901', 'NA', '5 ml', 1),
(2158, 10, 21, 1, 'Item', '2181902', 'NA', '5 ml', 1),
(2159, 10, 21, 1, 'Item', '2181903', 'NA', '5 ml', 1),
(2160, 10, 21, 1, 'Item', '2181904', 'NA', '5 ml', 1),
(2161, 10, 21, 1, 'Item', '2181905', 'NA', '5 ml', 1),
(2162, 10, 21, 1, 'Item', '2181906', 'NA', '5 ml', 1),
(2163, 10, 21, 1, 'Item', '2181907', 'NA', '5 ml', 1),
(2164, 10, 21, 1, 'Item', '2181908', 'NA', '5 ml', 1),
(2165, 10, 21, 1, 'Item', '2181909', 'NA', '5 ml', 1),
(2166, 10, 21, 1, 'Item', '2181910', 'NA', '5 ml', 1),
(2167, 10, 21, 1, 'Item', '2181911', 'NA', '5 ml', 1),
(2168, 10, 21, 1, 'Item', '2181912', 'NA', '5 ml', 1),
(2169, 10, 21, 1, 'Item', '2181913', 'NA', '5 ml', 1),
(2170, 10, 21, 1, 'Item', '2181914', 'NA', '5 ml', 1),
(2171, 10, 21, 1, 'Item', '2181915', 'NA', '5 ml', 1),
(2172, 10, 21, 1, 'Item', '2181916', 'NA', '5 ml', 1),
(2173, 10, 21, 1, 'Item', '2181917', 'NA', '5 ml', 1),
(2174, 10, 21, 1, 'Item', '2181918', 'NA', '5 ml', 1),
(2175, 10, 21, 1, 'Item', '2181919', 'NA', '5 ml', 1),
(2176, 10, 21, 1, 'Item', '2181920', 'NA', '5 ml', 1),
(2177, 10, 21, 1, 'Item', '2181921', 'NA', '5 ml', 1),
(2178, 10, 21, 1, 'Item', '2181922', 'NA', '5 ml', 1),
(2179, 10, 21, 1, 'Item', '2181923', 'NA', '5 ml', 1),
(2180, 10, 21, 1, 'Item', '2181924', 'NA', '5 ml', 1),
(2181, 10, 21, 1, 'Item', '2181925', 'NA', '5 ml', 1),
(2182, 10, 21, 1, 'Item', '2181926', 'NA', '5 ml', 1),
(2183, 10, 21, 1, 'Item', '2181927', 'NA', '5 ml', 1),
(2184, 10, 21, 1, 'Item', '2181928', 'NA', '5 ml', 1),
(2185, 10, 21, 1, 'Item', '2181929', 'NA', '5 ml', 1),
(2186, 10, 21, 1, 'Item', '2181930', 'NA', '5 ml', 1),
(2187, 10, 21, 1, 'Item', '2181931', 'NA', '5 ml', 1),
(2188, 10, 21, 1, 'Item', '2181932', 'NA', '5 ml', 1),
(2189, 10, 21, 1, 'Item', '2181933', 'NA', '5 ml', 1),
(2190, 10, 21, 1, 'Item', '2181934', 'NA', '5 ml', 1),
(2191, 10, 21, 1, 'Item', '2181935', 'NA', '5 ml', 1),
(2192, 10, 21, 1, 'Item', '2181936', 'NA', '5 ml', 1),
(2193, 10, 21, 1, 'Item', '2181937', 'NA', '5 ml', 1),
(2194, 10, 21, 1, 'Item', '2181938', 'NA', '5 ml', 1),
(2195, 10, 21, 1, 'Item', '2181939', 'NA', '5 ml', 1),
(2196, 10, 21, 1, 'Item', '2181940', 'NA', '5 ml', 1),
(2197, 10, 21, 1, 'Item', '2181941', 'NA', '5 ml', 1),
(2198, 10, 21, 1, 'Item', '2181942', 'NA', '5 ml', 1),
(2199, 10, 21, 1, 'Item', '2181943', 'NA', '5 ml', 1),
(2200, 10, 21, 1, 'Item', '2181944', 'NA', '5 ml', 1),
(2201, 10, 21, 1, 'Item', '2181945', 'NA', '5 ml', 1),
(2202, 10, 21, 1, 'Item', '2181946', 'NA', '5 ml', 1),
(2203, 10, 21, 1, 'Item', '2181947', 'NA', '5 ml', 1),
(2204, 10, 21, 1, 'Item', '2181948', 'NA', '5 ml', 1),
(2205, 10, 21, 1, 'Item', '2181949', 'NA', '5 ml', 1),
(2206, 10, 21, 1, 'Item', '2181950', 'NA', '5 ml', 1),
(2207, 10, 21, 1, 'Item', '2181951', 'NA', '5 ml', 1),
(2208, 10, 21, 1, 'Item', '2181952', 'NA', '5 ml', 1),
(2209, 10, 21, 1, 'Item', '2181953', 'NA', '5 ml', 1),
(2210, 10, 21, 1, 'Item', '2181954', 'NA', '5 ml', 1),
(2211, 10, 21, 1, 'Item', '2181955', 'NA', '5 ml', 1),
(2212, 10, 21, 1, 'Item', '2181956', 'NA', '5 ml', 1),
(2213, 10, 21, 1, 'Item', '2181957', 'NA', '5 ml', 1),
(2214, 10, 21, 1, 'Item', '2181958', 'NA', '5 ml', 1),
(2215, 10, 21, 1, 'Item', '2181959', 'NA', '5 ml', 1),
(2216, 10, 21, 1, 'Item', '2181960', 'NA', '5 ml', 1),
(2217, 10, 21, 1, 'Item', '2181961', 'NA', '5 ml', 1),
(2218, 10, 21, 1, 'Item', '2181962', 'NA', '5 ml', 1),
(2219, 10, 21, 1, 'Item', '2181963', 'NA', '5 ml', 1),
(2220, 10, 21, 1, 'Item', '2181964', 'NA', '5 ml', 1),
(2221, 10, 21, 1, 'Item', '2181965', 'NA', '5 ml', 1),
(2222, 10, 21, 1, 'Item', '2181966', 'NA', '5 ml', 1),
(2223, 10, 21, 1, 'Item', '2181967', 'NA', '5 ml', 1),
(2224, 10, 21, 1, 'Item', '2181968', 'NA', '5 ml', 1),
(2225, 10, 21, 1, 'Item', '2181969', 'NA', '5 ml', 1),
(2226, 10, 21, 1, 'Item', '2181970', 'NA', '5 ml', 1),
(2227, 10, 21, 1, 'Item', '2181971', 'NA', '5 ml', 1),
(2228, 10, 21, 1, 'Item', '2181972', 'NA', '5 ml', 1),
(2229, 10, 21, 1, 'Item', '2181973', 'NA', '5 ml', 1),
(2230, 10, 21, 1, 'Item', '2181974', 'NA', '5 ml', 1),
(2231, 10, 21, 1, 'Item', '2181975', 'NA', '5 ml', 1),
(2232, 10, 21, 1, 'Item', '2181976', 'NA', '5 ml', 1),
(2233, 10, 21, 1, 'Item', '2181977', 'NA', '5 ml', 1),
(2234, 10, 21, 1, 'Item', '2181978', 'NA', '5 ml', 1),
(2235, 10, 21, 1, 'Item', '2181979', 'NA', '5 ml', 1),
(2236, 10, 21, 1, 'Item', '2181980', 'NA', '5 ml', 1),
(2237, 10, 21, 1, 'Item', '2181981', 'NA', '5 ml', 1),
(2238, 10, 21, 1, 'Item', '2181982', 'NA', '5 ml', 1),
(2239, 10, 21, 1, 'Item', '2181983', 'NA', '5 ml', 1),
(2240, 10, 21, 1, 'Item', '2181984', 'NA', '5 ml', 1),
(2241, 10, 21, 1, 'Item', '2181985', 'NA', '5 ml', 1),
(2242, 10, 21, 1, 'Item', '2181986', 'NA', '5 ml', 1),
(2243, 10, 21, 1, 'Item', '2181987', 'NA', '5 ml', 1),
(2244, 10, 21, 1, 'Item', '2181988', 'NA', '5 ml', 1),
(2245, 10, 21, 1, 'Item', '2181989', 'NA', '5 ml', 1),
(2246, 10, 21, 1, 'Item', '2181990', 'NA', '5 ml', 1),
(2247, 10, 21, 1, 'Item', '2181991', 'NA', '5 ml', 1),
(2248, 10, 21, 1, 'Item', '2181992', 'NA', '5 ml', 1),
(2249, 10, 21, 1, 'Item', '2181993', 'NA', '5 ml', 1),
(2250, 10, 21, 1, 'Item', '2181994', 'NA', '5 ml', 1),
(2251, 10, 21, 1, 'Item', '2181995', 'NA', '5 ml', 1),
(2252, 10, 21, 1, 'Item', '2181996', 'NA', '5 ml', 1),
(2253, 10, 21, 1, 'Item', '2181997', 'NA', '5 ml', 1),
(2254, 10, 21, 1, 'Item', '2181998', 'NA', '5 ml', 1),
(2255, 10, 21, 1, 'Item', '2181999', 'NA', '5 ml', 1),
(2256, 10, 21, 1, 'Item', '2182000', 'NA', '5 ml', 1),
(2257, 10, 21, 1, 'Item', '2182001', 'NA', '5 ml', 1),
(2258, 10, 21, 1, 'Item', '2182002', 'NA', '5 ml', 1),
(2259, 10, 21, 1, 'Item', '2182003', 'NA', '5 ml', 1),
(2260, 10, 21, 1, 'Item', '2182004', 'NA', '5 ml', 1),
(2261, 10, 21, 1, 'Item', '2182005', 'NA', '5 ml', 1),
(2262, 10, 21, 1, 'Item', '2182006', 'NA', '5 ml', 1),
(2263, 10, 21, 1, 'Item', '2182007', 'NA', '5 ml', 1),
(2264, 10, 21, 1, 'Item', '2182008', 'NA', '5 ml', 1),
(2265, 10, 21, 1, 'Item', '2182009', 'NA', '5 ml', 1),
(2266, 10, 21, 1, 'Item', '2182010', 'NA', '5 ml', 1),
(2267, 10, 21, 1, 'Item', '2182011', 'NA', '5 ml', 1),
(2268, 10, 21, 1, 'Item', '2182012', 'NA', '5 ml', 1),
(2269, 10, 21, 1, 'Item', '2182013', 'NA', '5 ml', 1),
(2270, 10, 21, 1, 'Item', '2182014', 'NA', '5 ml', 1),
(2271, 10, 21, 1, 'Item', '2182015', 'NA', '5 ml', 1),
(2272, 10, 21, 1, 'Item', '2182016', 'NA', '5 ml', 1),
(2273, 10, 21, 1, 'Item', '2182017', 'NA', '5 ml', 1),
(2274, 10, 21, 1, 'Item', '2182018', 'NA', '5 ml', 1),
(2275, 10, 21, 1, 'Item', '2182019', 'NA', '5 ml', 1),
(2276, 10, 21, 1, 'Item', '2182020', 'NA', '5 ml', 1),
(2277, 10, 21, 1, 'Item', '2182021', 'NA', '5 ml', 1),
(2278, 10, 21, 1, 'Item', '2182022', 'NA', '5 ml', 1),
(2279, 10, 21, 1, 'Item', '2182023', 'NA', '5 ml', 1),
(2280, 10, 21, 1, 'Item', '2182024', 'NA', '5 ml', 1),
(2281, 10, 21, 1, 'Item', '2182025', 'NA', '5 ml', 1),
(2282, 10, 21, 1, 'Item', '2182026', 'NA', '5 ml', 1),
(2283, 10, 21, 1, 'Item', '2182027', 'NA', '5 ml', 1),
(2284, 10, 21, 1, 'Item', '2182028', 'NA', '5 ml', 1),
(2285, 10, 21, 1, 'Item', '2182029', 'NA', '5 ml', 1),
(2286, 10, 21, 1, 'Item', '2182030', 'NA', '5 ml', 1),
(2287, 10, 21, 1, 'Item', '2182031', 'NA', '5 ml', 1),
(2288, 10, 21, 1, 'Item', '2182032', 'NA', '5 ml', 1),
(2289, 10, 21, 1, 'Item', '2182033', 'NA', '5 ml', 1),
(2290, 10, 21, 1, 'Item', '2182034', 'NA', '5 ml', 1),
(2291, 10, 21, 1, 'Item', '2182035', 'NA', '5 ml', 1),
(2292, 10, 21, 1, 'Item', '2182036', 'NA', '5 ml', 1),
(2293, 10, 21, 1, 'Item', '2182037', 'NA', '5 ml', 1),
(2294, 10, 21, 1, 'Item', '2182038', 'NA', '5 ml', 1),
(2295, 10, 21, 1, 'Item', '2182039', 'NA', '5 ml', 1),
(2296, 10, 21, 1, 'Item', '2182040', 'NA', '5 ml', 1),
(2297, 10, 21, 1, 'Item', '2182041', 'NA', '5 ml', 1),
(2298, 10, 21, 1, 'Item', '2182042', 'NA', '5 ml', 1),
(2299, 10, 21, 1, 'Item', '2182043', 'NA', '5 ml', 1),
(2300, 10, 21, 1, 'Item', '2182044', 'NA', '5 ml', 1),
(2301, 10, 21, 1, 'Item', '2182045', 'NA', '5 ml', 1),
(2302, 10, 21, 1, 'Item', '2182046', 'NA', '5 ml', 1),
(2303, 10, 21, 1, 'Item', '2182047', 'NA', '5 ml', 1),
(2304, 10, 21, 1, 'Item', '2182048', 'NA', '5 ml', 1),
(2305, 10, 21, 1, 'Item', '2182049', 'NA', '5 ml', 1),
(2306, 10, 21, 1, 'Item', '2182050', 'NA', '5 ml', 1),
(2307, 10, 21, 1, 'Item', '2182051', 'NA', '5 ml', 1),
(2308, 10, 21, 1, 'Item', '2182052', 'NA', '5 ml', 1),
(2309, 10, 21, 1, 'Item', '2182053', 'NA', '5 ml', 1),
(2310, 10, 21, 1, 'Item', '2182054', 'NA', '5 ml', 1),
(2311, 10, 21, 1, 'Item', '2182055', 'NA', '5 ml', 1),
(2312, 10, 21, 1, 'Item', '2182056', 'NA', '5 ml', 1),
(2313, 10, 21, 1, 'Item', '2182057', 'NA', '5 ml', 1),
(2314, 10, 21, 1, 'Item', '2182058', 'NA', '5 ml', 1),
(2315, 10, 21, 1, 'Item', '2182059', 'NA', '5 ml', 1),
(2316, 10, 21, 1, 'Item', '2182060', 'NA', '5 ml', 1),
(2317, 10, 21, 1, 'Item', '2182061', 'NA', '5 ml', 1),
(2318, 10, 21, 1, 'Item', '2182062', 'NA', '5 ml', 1),
(2319, 10, 21, 1, 'Item', '2182063', 'NA', '5 ml', 1),
(2320, 10, 21, 1, 'Item', '2182064', 'NA', '5 ml', 1),
(2321, 10, 21, 1, 'Item', '2182065', 'NA', '5 ml', 1),
(2322, 10, 21, 1, 'Item', '2182066', 'NA', '5 ml', 1),
(2323, 10, 21, 1, 'Item', '2182067', 'NA', '5 ml', 1),
(2324, 10, 21, 1, 'Item', '2182068', 'NA', '5 ml', 1),
(2325, 10, 21, 1, 'Item', '2182069', 'NA', '5 ml', 1),
(2326, 10, 21, 1, 'Item', '2182070', 'NA', '5 ml', 1),
(2327, 10, 21, 1, 'Item', '2182071', 'NA', '5 ml', 1),
(2328, 10, 21, 1, 'Item', '2182072', 'NA', '5 ml', 1),
(2329, 10, 21, 1, 'Item', '2182073', 'NA', '5 ml', 1),
(2330, 10, 21, 1, 'Item', '2182074', 'NA', '5 ml', 1),
(2331, 10, 21, 1, 'Item', '2182075', 'NA', '5 ml', 1),
(2332, 10, 21, 1, 'Item', '2182076', 'NA', '5 ml', 1),
(2333, 10, 21, 1, 'Item', '2182077', 'NA', '5 ml', 1),
(2334, 10, 21, 1, 'Item', '2182078', 'NA', '5 ml', 1),
(2335, 10, 21, 1, 'Item', '2182079', 'NA', '5 ml', 1),
(2336, 10, 21, 1, 'Item', '2182080', 'NA', '5 ml', 1),
(2337, 10, 21, 1, 'Item', '2182081', 'NA', '5 ml', 1),
(2338, 10, 21, 1, 'Item', '2182082', 'NA', '5 ml', 1),
(2339, 10, 21, 1, 'Item', '2182083', 'NA', '5 ml', 1),
(2340, 10, 21, 1, 'Item', '2182084', 'NA', '5 ml', 1),
(2341, 10, 21, 1, 'Item', '2182085', 'NA', '5 ml', 1),
(2342, 10, 21, 1, 'Item', '2182086', 'NA', '5 ml', 1),
(2343, 10, 21, 1, 'Item', '2182087', 'NA', '5 ml', 1),
(2344, 10, 21, 1, 'Item', '2182088', 'NA', '5 ml', 1),
(2345, 10, 21, 1, 'Item', '2182089', 'NA', '5 ml', 1),
(2346, 10, 21, 1, 'Item', '2182090', 'NA', '5 ml', 1),
(2347, 10, 21, 1, 'Item', '2182091', 'NA', '5 ml', 1),
(2348, 10, 21, 1, 'Item', '2182092', 'NA', '5 ml', 1),
(2349, 10, 21, 1, 'Item', '2182093', 'NA', '5 ml', 1),
(2350, 10, 21, 1, 'Item', '2182094', 'NA', '5 ml', 1),
(2351, 10, 21, 1, 'Item', '2182095', 'NA', '5 ml', 1),
(2352, 10, 21, 1, 'Item', '2182096', 'NA', '5 ml', 1),
(2353, 10, 21, 1, 'Item', '2182097', 'NA', '5 ml', 1),
(2354, 10, 21, 1, 'Item', '2182098', 'NA', '5 ml', 1),
(2355, 10, 21, 1, 'Item', '2182099', 'NA', '5 ml', 1),
(2356, 10, 21, 1, 'Item', '2182100', 'NA', '5 ml', 1),
(2357, 10, 21, 1, 'Item', '2182101', 'NA', '5 ml', 1),
(2358, 10, 21, 1, 'Item', '2182102', 'NA', '5 ml', 1),
(2359, 10, 21, 1, 'Item', '2182103', 'NA', '5 ml', 1),
(2360, 10, 21, 1, 'Item', '2182104', 'NA', '5 ml', 1),
(2361, 10, 21, 1, 'Item', '2182105', 'NA', '5 ml', 1),
(2362, 10, 21, 1, 'Item', '2182106', 'NA', '5 ml', 1),
(2363, 10, 21, 1, 'Item', '2182107', 'NA', '5 ml', 1),
(2364, 10, 21, 1, 'Item', '2182108', 'NA', '5 ml', 1),
(2365, 10, 21, 1, 'Item', '2182109', 'NA', '5 ml', 1),
(2366, 10, 21, 1, 'Item', '2182110', 'NA', '5 ml', 1),
(2367, 10, 21, 1, 'Item', '2182111', 'NA', '5 ml', 1),
(2368, 10, 21, 1, 'Item', '2182112', 'NA', '5 ml', 1),
(2369, 10, 21, 1, 'Item', '2182113', 'NA', '5 ml', 1),
(2370, 10, 21, 1, 'Item', '2182114', 'NA', '5 ml', 1),
(2371, 10, 21, 1, 'Item', '2182115', 'NA', '5 ml', 1),
(2372, 10, 21, 1, 'Item', '2182116', 'NA', '5 ml', 1),
(2373, 10, 21, 1, 'Item', '2182117', 'NA', '5 ml', 1),
(2374, 10, 21, 1, 'Item', '2182118', 'NA', '5 ml', 1),
(2375, 10, 21, 1, 'Item', '2182119', 'NA', '5 ml', 1),
(2376, 10, 21, 1, 'Item', '2182120', 'NA', '5 ml', 1),
(2377, 10, 21, 1, 'Item', '2182121', 'NA', '5 ml', 1),
(2378, 10, 21, 1, 'Item', '2182122', 'NA', '5 ml', 1),
(2379, 10, 21, 1, 'Item', '2182123', 'NA', '5 ml', 1),
(2380, 10, 21, 1, 'Item', '2182124', 'NA', '5 ml', 1),
(2381, 10, 21, 1, 'Item', '2182125', 'NA', '5 ml', 1),
(2382, 10, 21, 1, 'Item', '2182126', 'NA', '5 ml', 1),
(2383, 10, 21, 1, 'Item', '2182127', 'NA', '5 ml', 1),
(2384, 10, 21, 1, 'Item', '2182128', 'NA', '5 ml', 1),
(2385, 10, 21, 1, 'Item', '2182129', 'NA', '5 ml', 1),
(2386, 10, 21, 1, 'Item', '2182130', 'NA', '5 ml', 1),
(2387, 10, 21, 1, 'Item', '2182131', 'NA', '5 ml', 1),
(2388, 10, 21, 1, 'Item', '2182132', 'NA', '5 ml', 1),
(2389, 10, 21, 1, 'Item', '2182133', 'NA', '5 ml', 1),
(2390, 10, 21, 1, 'Item', '2182134', 'NA', '5 ml', 1),
(2391, 10, 21, 1, 'Item', '2182135', 'NA', '5 ml', 1),
(2392, 10, 21, 1, 'Item', '2182136', 'NA', '5 ml', 1),
(2393, 10, 21, 1, 'Item', '2182137', 'NA', '5 ml', 1),
(2394, 10, 21, 1, 'Item', '2182138', 'NA', '5 ml', 1),
(2395, 10, 21, 1, 'Item', '2182139', 'NA', '5 ml', 1),
(2396, 10, 21, 1, 'Item', '2182140', 'NA', '5 ml', 1),
(2397, 10, 21, 1, 'Item', '2182141', 'NA', '5 ml', 1),
(2398, 10, 21, 1, 'Item', '2182142', 'NA', '5 ml', 1),
(2399, 10, 21, 1, 'Item', '2182143', 'NA', '5 ml', 1),
(2400, 10, 21, 1, 'Item', '2182144', 'NA', '5 ml', 1),
(2401, 10, 21, 1, 'Item', '2182145', 'NA', '5 ml', 1),
(2402, 10, 21, 1, 'Item', '2182146', 'NA', '5 ml', 1),
(2403, 10, 21, 1, 'Item', '2182147', 'NA', '5 ml', 1),
(2404, 10, 21, 1, 'Item', '2182148', 'NA', '5 ml', 1),
(2405, 10, 21, 1, 'Item', '2182149', 'NA', '5 ml', 1),
(2406, 10, 21, 1, 'Item', '2182150', 'NA', '5 ml', 1),
(2407, 10, 21, 1, 'Item', '2182151', 'NA', '5 ml', 1),
(2408, 10, 21, 1, 'Item', '2182152', 'NA', '5 ml', 1),
(2409, 10, 21, 1, 'Item', '2182153', 'NA', '5 ml', 1),
(2410, 10, 21, 1, 'Item', '2182154', 'NA', '5 ml', 1),
(2411, 10, 21, 1, 'Item', '2182155', 'NA', '5 ml', 1),
(2412, 10, 21, 1, 'Item', '2182156', 'NA', '5 ml', 1),
(2413, 10, 21, 1, 'Item', '2182157', 'NA', '5 ml', 1),
(2414, 10, 21, 1, 'Item', '2182158', 'NA', '5 ml', 1),
(2415, 10, 21, 1, 'Item', '2182159', 'NA', '5 ml', 1),
(2416, 10, 21, 1, 'Item', '2182160', 'NA', '5 ml', 1),
(2417, 10, 21, 1, 'Item', '2182161', 'NA', '5 ml', 1),
(2418, 10, 21, 1, 'Item', '2182162', 'NA', '5 ml', 1),
(2419, 10, 21, 1, 'Item', '2182163', 'NA', '5 ml', 1),
(2420, 10, 21, 1, 'Item', '2182164', 'NA', '5 ml', 1),
(2421, 10, 21, 1, 'Item', '2182165', 'NA', '5 ml', 1),
(2422, 10, 21, 1, 'Item', '2182166', 'NA', '5 ml', 1),
(2423, 10, 21, 1, 'Item', '2182167', 'NA', '5 ml', 1),
(2424, 10, 21, 1, 'Item', '2182168', 'NA', '5 ml', 1),
(2425, 10, 21, 1, 'Item', '2182169', 'NA', '5 ml', 1),
(2426, 10, 21, 1, 'Item', '2182170', 'NA', '5 ml', 1),
(2427, 10, 21, 1, 'Item', '2182171', 'NA', '5 ml', 1),
(2428, 10, 21, 1, 'Item', '2182172', 'NA', '5 ml', 1),
(2429, 10, 21, 1, 'Item', '2182173', 'NA', '5 ml', 1),
(2430, 10, 21, 1, 'Item', '2182174', 'NA', '5 ml', 1),
(2431, 10, 21, 1, 'Item', '2182175', 'NA', '5 ml', 1),
(2432, 10, 21, 1, 'Item', '2182176', 'NA', '5 ml', 1),
(2433, 10, 21, 1, 'Item', '2182177', 'NA', '5 ml', 1),
(2434, 10, 21, 1, 'Item', '2182178', 'NA', '5 ml', 1),
(2435, 10, 21, 1, 'Item', '2182179', 'NA', '5 ml', 1),
(2436, 10, 21, 1, 'Item', '2182180', 'NA', '5 ml', 1),
(2437, 10, 21, 1, 'Item', '2182181', 'NA', '5 ml', 1),
(2438, 10, 21, 1, 'Item', '2182182', 'NA', '5 ml', 1),
(2439, 10, 21, 1, 'Item', '2182183', 'NA', '5 ml', 1),
(2440, 10, 21, 1, 'Item', '2182184', 'NA', '5 ml', 1),
(2441, 10, 21, 1, 'Item', '2182185', 'NA', '5 ml', 1),
(2442, 10, 21, 1, 'Item', '2182186', 'NA', '5 ml', 1),
(2443, 10, 21, 1, 'Item', '2182187', 'NA', '5 ml', 1),
(2444, 10, 21, 1, 'Item', '2182188', 'NA', '5 ml', 1),
(2445, 10, 21, 1, 'Item', '2182189', 'NA', '5 ml', 1),
(2446, 10, 21, 1, 'Item', '2182190', 'NA', '5 ml', 1),
(2447, 10, 21, 1, 'Item', '2182191', 'NA', '5 ml', 1),
(2448, 10, 21, 1, 'Item', '2182192', 'NA', '5 ml', 1),
(2449, 10, 21, 1, 'Item', '2182193', 'NA', '5 ml', 1),
(2450, 10, 21, 1, 'Item', '2182194', 'NA', '5 ml', 1),
(2451, 10, 21, 1, 'Item', '2182195', 'NA', '5 ml', 1),
(2452, 10, 21, 1, 'Item', '2182196', 'NA', '5 ml', 1),
(2453, 10, 21, 1, 'Item', '2182197', 'NA', '5 ml', 1),
(2454, 10, 21, 1, 'Item', '2182198', 'NA', '5 ml', 1),
(2455, 10, 21, 1, 'Item', '2182199', 'NA', '5 ml', 1),
(2456, 10, 21, 1, 'Item', '2182200', 'NA', '5 ml', 1),
(2457, 10, 21, 1, 'Item', '2182201', 'NA', '5 ml', 1),
(2458, 10, 21, 1, 'Item', '2182202', 'NA', '5 ml', 1),
(2459, 10, 21, 1, 'Item', '2182203', 'NA', '5 ml', 1),
(2460, 10, 21, 1, 'Item', '2182204', 'NA', '5 ml', 1),
(2461, 10, 21, 1, 'Item', '2182205', 'NA', '5 ml', 1),
(2462, 10, 21, 1, 'Item', '2182206', 'NA', '5 ml', 1),
(2463, 10, 21, 1, 'Item', '2182207', 'NA', '5 ml', 1),
(2464, 10, 21, 1, 'Item', '2182208', 'NA', '5 ml', 1),
(2465, 10, 21, 1, 'Item', '2182209', 'NA', '5 ml', 1),
(2466, 10, 21, 1, 'Item', '2182210', 'NA', '5 ml', 1),
(2467, 10, 21, 1, 'Item', '2182211', 'NA', '5 ml', 1),
(2468, 10, 21, 1, 'Item', '2182212', 'NA', '5 ml', 1),
(2469, 10, 21, 1, 'Item', '2182213', 'NA', '5 ml', 1),
(2470, 10, 21, 1, 'Item', '2182214', 'NA', '5 ml', 1),
(2471, 10, 21, 1, 'Item', '2182215', 'NA', '5 ml', 1),
(2472, 10, 21, 1, 'Item', '2182216', 'NA', '5 ml', 1),
(2473, 10, 21, 1, 'Item', '2182217', 'NA', '5 ml', 1),
(2474, 10, 21, 1, 'Item', '2182218', 'NA', '5 ml', 1),
(2475, 10, 21, 1, 'Item', '2182219', 'NA', '5 ml', 1),
(2476, 10, 21, 1, 'Item', '2182220', 'NA', '5 ml', 1),
(2477, 10, 21, 1, 'Item', '2182221', 'NA', '5 ml', 1),
(2478, 10, 21, 1, 'Item', '2182222', 'NA', '5 ml', 1),
(2479, 10, 21, 1, 'Item', '2182223', 'NA', '5 ml', 1),
(2480, 10, 21, 1, 'Item', '2182224', 'NA', '5 ml', 1),
(2481, 10, 21, 1, 'Item', '2182225', 'NA', '5 ml', 1),
(2482, 10, 21, 1, 'Item', '2182226', 'NA', '5 ml', 1),
(2483, 10, 21, 1, 'Item', '2182227', 'NA', '5 ml', 1),
(2484, 10, 21, 1, 'Item', '2182228', 'NA', '5 ml', 1),
(2485, 10, 21, 1, 'Item', '2182229', 'NA', '5 ml', 1),
(2486, 10, 21, 1, 'Item', '2182230', 'NA', '5 ml', 1),
(2487, 10, 21, 1, 'Item', '2182231', 'NA', '5 ml', 1),
(2488, 10, 21, 1, 'Item', '2182232', 'NA', '5 ml', 1),
(2489, 10, 21, 1, 'Item', '2182233', 'NA', '5 ml', 1),
(2490, 10, 21, 1, 'Item', '2182234', 'NA', '5 ml', 1),
(2491, 10, 21, 1, 'Item', '2182235', 'NA', '5 ml', 1),
(2492, 10, 21, 1, 'Item', '2182236', 'NA', '5 ml', 1),
(2493, 10, 21, 1, 'Item', '2182237', 'NA', '5 ml', 1),
(2494, 10, 21, 1, 'Item', '2182238', 'NA', '5 ml', 1),
(2495, 10, 21, 1, 'Item', '2182239', 'NA', '5 ml', 1),
(2496, 10, 21, 1, 'Item', '2182240', 'NA', '5 ml', 1),
(2497, 10, 21, 1, 'Item', '2182241', 'NA', '5 ml', 1),
(2498, 10, 21, 1, 'Item', '2182242', 'NA', '5 ml', 1),
(2499, 10, 21, 1, 'Item', '2182243', 'NA', '5 ml', 1),
(2500, 10, 21, 1, 'Item', '2182244', 'NA', '5 ml', 1),
(2501, 10, 21, 1, 'Item', '2182245', 'NA', '5 ml', 1),
(2502, 10, 21, 1, 'Item', '2182246', 'NA', '5 ml', 1),
(2503, 10, 21, 1, 'Item', '2182247', 'NA', '5 ml', 1),
(2504, 10, 21, 1, 'Item', '2182248', 'NA', '5 ml', 1),
(2505, 10, 21, 1, 'Item', '2182249', 'NA', '5 ml', 1),
(2506, 10, 21, 1, 'Item', '2182250', 'NA', '5 ml', 1),
(2507, 10, 21, 1, 'Item', '2182251', 'NA', '5 ml', 1),
(2508, 10, 21, 1, 'Item', '2182252', 'NA', '5 ml', 1),
(2509, 10, 21, 1, 'Item', '2182253', 'NA', '5 ml', 1),
(2510, 10, 21, 1, 'Item', '2182254', 'NA', '5 ml', 1),
(2511, 10, 21, 1, 'Item', '2182255', 'NA', '5 ml', 1),
(2512, 10, 21, 1, 'Item', '2182256', 'NA', '5 ml', 1),
(2513, 10, 21, 1, 'Item', '2182257', 'NA', '5 ml', 1),
(2514, 10, 21, 1, 'Item', '2182258', 'NA', '5 ml', 1),
(2515, 10, 21, 1, 'Item', '2182259', 'NA', '5 ml', 1),
(2516, 10, 21, 1, 'Item', '2182260', 'NA', '5 ml', 1),
(2517, 10, 21, 1, 'Item', '2182261', 'NA', '5 ml', 1),
(2518, 10, 21, 1, 'Item', '2182262', 'NA', '5 ml', 1),
(2519, 10, 21, 1, 'Item', '2182263', 'NA', '5 ml', 1),
(2520, 10, 21, 1, 'Item', '2182264', 'NA', '5 ml', 1),
(2521, 10, 21, 1, 'Item', '2182265', 'NA', '5 ml', 1),
(2522, 10, 21, 1, 'Item', '2182266', 'NA', '5 ml', 1),
(2523, 10, 21, 1, 'Item', '2182267', 'NA', '5 ml', 1),
(2524, 10, 21, 1, 'Item', '2182268', 'NA', '5 ml', 1),
(2525, 10, 21, 1, 'Item', '2182269', 'NA', '5 ml', 1),
(2526, 10, 21, 1, 'Item', '2182270', 'NA', '5 ml', 1),
(2527, 10, 21, 1, 'Item', '2182271', 'NA', '5 ml', 1),
(2528, 10, 21, 1, 'Item', '2182272', 'NA', '5 ml', 1),
(2529, 10, 21, 1, 'Item', '2182273', 'NA', '5 ml', 1),
(2530, 10, 21, 1, 'Item', '2182274', 'NA', '5 ml', 1),
(2531, 10, 21, 1, 'Item', '2182275', 'NA', '5 ml', 1),
(2532, 10, 21, 1, 'Item', '2182276', 'NA', '5 ml', 1),
(2533, 10, 21, 1, 'Item', '2182277', 'NA', '5 ml', 1),
(2534, 10, 21, 1, 'Item', '2182278', 'NA', '5 ml', 1),
(2535, 10, 21, 1, 'Item', '2182279', 'NA', '5 ml', 1),
(2536, 10, 21, 1, 'Item', '2182280', 'NA', '5 ml', 1),
(2537, 10, 21, 1, 'Item', '2182281', 'NA', '5 ml', 1),
(2538, 10, 21, 1, 'Item', '2182282', 'NA', '5 ml', 1),
(2539, 10, 21, 1, 'Item', '2182283', 'NA', '5 ml', 1),
(2540, 10, 21, 1, 'Item', '2182284', 'NA', '5 ml', 1),
(2541, 10, 21, 1, 'Item', '2182285', 'NA', '5 ml', 1),
(2542, 10, 21, 1, 'Item', '2182286', 'NA', '5 ml', 1),
(2543, 10, 21, 1, 'Item', '2182287', 'NA', '5 ml', 1),
(2544, 10, 21, 1, 'Item', '2182288', 'NA', '5 ml', 1),
(2545, 10, 21, 1, 'Item', '2182289', 'NA', '5 ml', 1),
(2546, 10, 21, 1, 'Item', '2182290', 'NA', '5 ml', 1),
(2547, 10, 21, 1, 'Item', '2182291', 'NA', '5 ml', 1),
(2548, 10, 21, 1, 'Item', '2182292', 'NA', '5 ml', 1),
(2549, 10, 21, 1, 'Item', '2182293', 'NA', '5 ml', 1),
(2550, 10, 21, 1, 'Item', '2182294', 'NA', '5 ml', 1),
(2551, 10, 21, 1, 'Item', '2182295', 'NA', '5 ml', 1),
(2552, 10, 21, 1, 'Item', '2182296', 'NA', '5 ml', 1),
(2553, 10, 21, 1, 'Item', '2182297', 'NA', '5 ml', 1),
(2554, 10, 21, 1, 'Item', '2182298', 'NA', '5 ml', 1),
(2555, 10, 21, 1, 'Item', '2182299', 'NA', '5 ml', 1),
(2556, 10, 21, 1, 'Item', '2182300', 'NA', '5 ml', 1),
(2557, 10, 21, 1, 'Item', '2182301', 'NA', '5 ml', 1),
(2558, 10, 21, 1, 'Item', '2182302', 'NA', '5 ml', 1),
(2559, 10, 21, 1, 'Item', '2182303', 'NA', '5 ml', 1),
(2560, 10, 21, 1, 'Item', '2182304', 'NA', '5 ml', 1),
(2561, 10, 21, 1, 'Item', '2182305', 'NA', '5 ml', 1),
(2562, 10, 21, 1, 'Item', '2182306', 'NA', '5 ml', 1),
(2563, 10, 21, 1, 'Item', '2182307', 'NA', '5 ml', 1),
(2564, 10, 21, 1, 'Item', '2182308', 'NA', '5 ml', 1),
(2565, 10, 21, 1, 'Item', '2182309', 'NA', '5 ml', 1),
(2566, 10, 21, 1, 'Item', '2182310', 'NA', '5 ml', 1),
(2567, 10, 21, 1, 'Item', '2182311', 'NA', '5 ml', 1),
(2568, 10, 21, 1, 'Item', '2182312', 'NA', '5 ml', 1),
(2569, 10, 21, 1, 'Item', '2182313', 'NA', '5 ml', 1),
(2570, 10, 21, 1, 'Item', '2182314', 'NA', '5 ml', 1),
(2571, 10, 21, 1, 'Item', '2182315', 'NA', '5 ml', 1),
(2572, 10, 21, 1, 'Item', '2182316', 'NA', '5 ml', 1),
(2573, 10, 21, 1, 'Item', '2182317', 'NA', '5 ml', 1),
(2574, 10, 21, 1, 'Item', '2182318', 'NA', '5 ml', 1),
(2575, 10, 21, 1, 'Item', '2182319', 'NA', '5 ml', 1),
(2576, 10, 21, 1, 'Item', '2182320', 'NA', '5 ml', 1),
(2577, 10, 21, 1, 'Item', '2182321', 'NA', '5 ml', 1),
(2578, 10, 21, 1, 'Item', '2182322', 'NA', '5 ml', 1),
(2579, 10, 21, 1, 'Item', '2182323', 'NA', '5 ml', 1),
(2580, 10, 21, 1, 'Item', '2182324', 'NA', '5 ml', 1),
(2581, 10, 21, 1, 'Item', '2182325', 'NA', '5 ml', 1),
(2582, 10, 21, 1, 'Item', '2182326', 'NA', '5 ml', 1),
(2583, 10, 21, 1, 'Item', '2182327', 'NA', '5 ml', 1),
(2584, 10, 21, 1, 'Item', '2182328', 'NA', '5 ml', 1),
(2585, 10, 21, 1, 'Item', '2182329', 'NA', '5 ml', 1),
(2586, 10, 21, 1, 'Item', '2182330', 'NA', '5 ml', 1),
(2587, 10, 21, 1, 'Item', '2182331', 'NA', '5 ml', 1),
(2588, 10, 21, 1, 'Item', '2182332', 'NA', '5 ml', 1),
(2589, 10, 21, 1, 'Item', '2182333', 'NA', '5 ml', 1),
(2590, 10, 21, 1, 'Item', '2182334', 'NA', '5 ml', 1),
(2591, 10, 21, 1, 'Item', '2182335', 'NA', '5 ml', 1),
(2592, 10, 21, 1, 'Item', '2182336', 'NA', '5 ml', 1),
(2593, 10, 21, 1, 'Item', '2182337', 'NA', '5 ml', 1),
(2594, 10, 21, 1, 'Item', '2182338', 'NA', '5 ml', 1),
(2595, 10, 21, 1, 'Item', '2182339', 'NA', '5 ml', 1),
(2596, 10, 21, 1, 'Item', '2182340', 'NA', '5 ml', 1),
(2597, 10, 21, 1, 'Item', '2182341', 'NA', '5 ml', 1),
(2598, 10, 21, 1, 'Item', '2182342', 'NA', '5 ml', 1),
(2599, 10, 21, 1, 'Item', '2182343', 'NA', '5 ml', 1),
(2600, 10, 21, 1, 'Item', '2182344', 'NA', '5 ml', 1),
(2601, 10, 21, 1, 'Item', '2182345', 'NA', '5 ml', 1),
(2602, 10, 21, 1, 'Item', '2182346', 'NA', '5 ml', 1),
(2603, 10, 21, 1, 'Item', '2182347', 'NA', '5 ml', 1),
(2604, 10, 21, 1, 'Item', '2182348', 'NA', '5 ml', 1),
(2605, 10, 21, 1, 'Item', '2182349', 'NA', '5 ml', 1),
(2606, 10, 21, 1, 'Item', '2182350', 'NA', '5 ml', 1),
(2607, 10, 21, 1, 'Item', '2182351', 'NA', '5 ml', 1),
(2608, 10, 21, 1, 'Item', '2182352', 'NA', '5 ml', 1),
(2609, 10, 21, 1, 'Item', '2182353', 'NA', '5 ml', 1),
(2610, 10, 21, 1, 'Item', '2182354', 'NA', '5 ml', 1),
(2611, 10, 21, 1, 'Item', '2182355', 'NA', '5 ml', 1),
(2612, 10, 21, 1, 'Item', '2182356', 'NA', '5 ml', 1),
(2613, 10, 21, 1, 'Item', '2182357', 'NA', '5 ml', 1),
(2614, 10, 21, 1, 'Item', '2182358', 'NA', '5 ml', 1),
(2615, 10, 21, 1, 'Item', '2182359', 'NA', '5 ml', 1),
(2616, 10, 21, 1, 'Item', '2182360', 'NA', '5 ml', 1),
(2617, 10, 21, 1, 'Item', '2182361', 'NA', '5 ml', 1),
(2618, 10, 21, 1, 'Item', '2182362', 'NA', '5 ml', 1),
(2619, 10, 21, 1, 'Item', '2182363', 'NA', '5 ml', 1),
(2620, 10, 21, 1, 'Item', '2182364', 'NA', '5 ml', 1),
(2621, 10, 21, 1, 'Item', '2182365', 'NA', '5 ml', 1),
(2622, 10, 21, 1, 'Item', '2182366', 'NA', '5 ml', 1),
(2623, 10, 21, 1, 'Item', '2182367', 'NA', '5 ml', 1),
(2624, 10, 21, 1, 'Item', '2182368', 'NA', '5 ml', 1),
(2625, 10, 21, 1, 'Item', '2182369', 'NA', '5 ml', 1),
(2626, 10, 21, 1, 'Item', '2182370', 'NA', '5 ml', 1),
(2627, 10, 21, 1, 'Item', '2182371', 'NA', '5 ml', 1),
(2628, 10, 21, 1, 'Item', '2182372', 'NA', '5 ml', 1),
(2629, 10, 21, 1, 'Item', '2182373', 'NA', '5 ml', 1),
(2630, 10, 21, 1, 'Item', '2182374', 'NA', '5 ml', 1),
(2631, 10, 21, 1, 'Item', '2182375', 'NA', '5 ml', 1),
(2632, 10, 21, 1, 'Item', '2182376', 'NA', '5 ml', 1),
(2633, 10, 21, 1, 'Item', '2182377', 'NA', '5 ml', 1),
(2634, 10, 21, 1, 'Item', '2182378', 'NA', '5 ml', 1),
(2635, 10, 21, 1, 'Item', '2182379', 'NA', '5 ml', 1),
(2636, 10, 21, 1, 'Item', '2182380', 'NA', '5 ml', 1),
(2637, 10, 21, 1, 'Item', '2182381', 'NA', '5 ml', 1),
(2638, 10, 21, 1, 'Item', '2182382', 'NA', '5 ml', 1),
(2639, 10, 21, 1, 'Item', '2182383', 'NA', '5 ml', 1),
(2640, 10, 21, 1, 'Item', '2182384', 'NA', '5 ml', 1),
(2641, 10, 21, 1, 'Item', '2182385', 'NA', '5 ml', 1),
(2642, 10, 21, 1, 'Item', '2182386', 'NA', '5 ml', 1),
(2643, 10, 21, 1, 'Item', '2182387', 'NA', '5 ml', 1),
(2644, 10, 21, 1, 'Item', '2182388', 'NA', '5 ml', 1),
(2645, 10, 21, 1, 'Item', '2182389', 'NA', '5 ml', 1),
(2646, 10, 21, 1, 'Item', '2182390', 'NA', '5 ml', 1),
(2647, 10, 21, 1, 'Item', '2182391', 'NA', '5 ml', 1),
(2648, 10, 21, 1, 'Item', '2182392', 'NA', '5 ml', 1),
(2649, 10, 21, 1, 'Item', '2182393', 'NA', '5 ml', 1),
(2650, 10, 21, 1, 'Item', '2182394', 'NA', '5 ml', 1),
(2651, 10, 21, 1, 'Item', '2182395', 'NA', '5 ml', 1),
(2652, 10, 21, 1, 'Item', '2182396', 'NA', '5 ml', 1),
(2653, 10, 21, 1, 'Item', '2182397', 'NA', '5 ml', 1),
(2654, 10, 21, 1, 'Item', '2182398', 'NA', '5 ml', 1),
(2655, 10, 21, 1, 'Item', '2182399', 'NA', '5 ml', 1),
(2656, 10, 21, 1, 'Item', '2182400', 'NA', '5 ml', 1),
(2657, 10, 21, 1, 'Item', '2182401', 'NA', '5 ml', 1),
(2658, 10, 21, 1, 'Item', '2182402', 'NA', '5 ml', 1),
(2659, 10, 21, 1, 'Item', '2182403', 'NA', '5 ml', 1),
(2660, 10, 21, 1, 'Item', '2182404', 'NA', '5 ml', 1),
(2661, 10, 21, 1, 'Item', '2182405', 'NA', '5 ml', 1),
(2662, 10, 21, 1, 'Item', '2182406', 'NA', '5 ml', 1),
(2663, 10, 21, 1, 'Item', '2182407', 'NA', '5 ml', 1),
(2664, 10, 21, 1, 'Item', '2182408', 'NA', '5 ml', 1),
(2665, 10, 21, 1, 'Item', '2182409', 'NA', '5 ml', 1),
(2666, 10, 21, 1, 'Item', '2182410', 'NA', '5 ml', 1),
(2667, 10, 21, 1, 'Item', '2182411', 'NA', '5 ml', 1),
(2668, 10, 21, 1, 'Item', '2182412', 'NA', '5 ml', 1),
(2669, 10, 21, 1, 'Item', '2182413', 'NA', '5 ml', 1),
(2670, 10, 21, 1, 'Item', '2182414', 'NA', '5 ml', 1),
(2671, 10, 21, 1, 'Item', '2182415', 'NA', '5 ml', 1),
(2672, 10, 21, 1, 'Item', '2182416', 'NA', '5 ml', 1),
(2673, 10, 21, 1, 'Item', '2182417', 'NA', '5 ml', 1),
(2674, 10, 21, 1, 'Item', '2182418', 'NA', '5 ml', 1),
(2675, 10, 21, 1, 'Item', '2182419', 'NA', '5 ml', 1),
(2676, 10, 21, 1, 'Item', '2182420', 'NA', '5 ml', 1),
(2677, 10, 21, 1, 'Item', '2182421', 'NA', '5 ml', 1),
(2678, 10, 21, 1, 'Item', '2182422', 'NA', '5 ml', 1),
(2679, 10, 21, 1, 'Item', '2182423', 'NA', '5 ml', 1),
(2680, 10, 21, 1, 'Item', '2182424', 'NA', '5 ml', 1),
(2681, 10, 21, 1, 'Item', '2182425', 'NA', '5 ml', 1),
(2682, 10, 21, 1, 'Item', '2182426', 'NA', '5 ml', 1),
(2683, 10, 21, 1, 'Item', '2182427', 'NA', '5 ml', 1),
(2684, 10, 21, 1, 'Item', '2182428', 'NA', '5 ml', 1),
(2685, 10, 21, 1, 'Item', '2182429', 'NA', '5 ml', 1),
(2686, 10, 21, 1, 'Item', '2182430', 'NA', '5 ml', 1),
(2687, 10, 21, 1, 'Item', '2182431', 'NA', '5 ml', 1),
(2688, 10, 21, 1, 'Item', '2182432', 'NA', '5 ml', 1),
(2689, 10, 21, 1, 'Item', '2182433', 'NA', '5 ml', 1),
(2690, 10, 21, 1, 'Item', '2182434', 'NA', '5 ml', 1),
(2691, 10, 21, 1, 'Item', '2182435', 'NA', '5 ml', 1),
(2692, 10, 21, 1, 'Item', '2182436', 'NA', '5 ml', 1),
(2693, 10, 21, 1, 'Item', '2182437', 'NA', '5 ml', 1),
(2694, 10, 21, 1, 'Item', '2182438', 'NA', '5 ml', 1),
(2695, 10, 21, 1, 'Item', '2182439', 'NA', '5 ml', 1),
(2696, 10, 21, 1, 'Item', '2182440', 'NA', '5 ml', 1),
(2697, 10, 21, 1, 'Item', '2182441', 'NA', '5 ml', 1),
(2698, 10, 21, 1, 'Item', '2182442', 'NA', '5 ml', 1),
(2699, 10, 21, 1, 'Item', '2182443', 'NA', '5 ml', 1),
(2700, 10, 21, 1, 'Item', '2182444', 'NA', '5 ml', 1),
(2701, 10, 21, 1, 'Item', '2182445', 'NA', '5 ml', 1),
(2702, 10, 21, 1, 'Item', '2182446', 'NA', '5 ml', 1),
(2703, 10, 21, 1, 'Item', '2182447', 'NA', '5 ml', 1),
(2704, 10, 21, 1, 'Item', '2182448', 'NA', '5 ml', 1),
(2705, 10, 21, 1, 'Item', '2182449', 'NA', '5 ml', 1),
(2706, 10, 21, 1, 'Item', '2182450', 'NA', '5 ml', 1),
(2707, 10, 21, 1, 'Item', '2182451', 'NA', '5 ml', 1),
(2708, 10, 21, 1, 'Item', '2182452', 'NA', '5 ml', 1),
(2709, 10, 21, 1, 'Item', '2182453', 'NA', '5 ml', 1),
(2710, 10, 21, 1, 'Item', '2182454', 'NA', '5 ml', 1),
(2711, 10, 21, 1, 'Item', '2182455', 'NA', '5 ml', 1),
(2712, 10, 21, 1, 'Item', '2182456', 'NA', '5 ml', 1),
(2713, 10, 21, 1, 'Item', '2182457', 'NA', '5 ml', 1),
(2714, 10, 21, 1, 'Item', '2182458', 'NA', '5 ml', 1),
(2715, 10, 21, 1, 'Item', '2182459', 'NA', '5 ml', 1),
(2716, 10, 21, 1, 'Item', '2182460', 'NA', '5 ml', 1),
(2717, 10, 21, 1, 'Item', '2182461', 'NA', '5 ml', 1),
(2718, 10, 21, 1, 'Item', '2182462', 'NA', '5 ml', 1),
(2719, 10, 21, 1, 'Item', '2182463', 'NA', '5 ml', 1),
(2720, 10, 21, 1, 'Item', '2182464', 'NA', '5 ml', 1),
(2721, 10, 21, 1, 'Item', '2182465', 'NA', '5 ml', 1),
(2722, 10, 21, 1, 'Item', '2182466', 'NA', '5 ml', 1),
(2723, 10, 21, 1, 'Item', '2182467', 'NA', '5 ml', 1),
(2724, 10, 21, 1, 'Item', '2182468', 'NA', '5 ml', 1),
(2725, 10, 21, 1, 'Item', '2182469', 'NA', '5 ml', 1),
(2726, 10, 21, 1, 'Item', '2182470', 'NA', '5 ml', 1),
(2727, 10, 21, 1, 'Item', '2182471', 'NA', '5 ml', 1),
(2728, 10, 21, 1, 'Item', '2182472', 'NA', '5 ml', 1),
(2729, 10, 21, 1, 'Item', '2182473', 'NA', '5 ml', 1),
(2730, 10, 21, 1, 'Item', '2182474', 'NA', '5 ml', 1),
(2731, 10, 21, 1, 'Item', '2182475', 'NA', '5 ml', 1),
(2732, 10, 21, 1, 'Item', '2182476', 'NA', '5 ml', 1),
(2733, 10, 21, 1, 'Item', '2182477', 'NA', '5 ml', 1),
(2734, 10, 21, 1, 'Item', '2182478', 'NA', '5 ml', 1),
(2735, 10, 21, 1, 'Item', '2182479', 'NA', '5 ml', 1),
(2736, 10, 21, 1, 'Item', '2182480', 'NA', '5 ml', 1),
(2737, 10, 21, 1, 'Item', '2182481', 'NA', '5 ml', 1),
(2738, 10, 21, 1, 'Item', '2182482', 'NA', '5 ml', 1),
(2739, 10, 21, 1, 'Item', '2182483', 'NA', '5 ml', 1),
(2740, 10, 21, 1, 'Item', '2182484', 'NA', '5 ml', 1),
(2741, 10, 21, 1, 'Item', '2182485', 'NA', '5 ml', 1),
(2742, 10, 21, 1, 'Item', '2182486', 'NA', '5 ml', 1),
(2743, 10, 21, 1, 'Item', '2182487', 'NA', '5 ml', 1),
(2744, 10, 21, 1, 'Item', '2182488', 'NA', '5 ml', 1),
(2745, 10, 21, 1, 'Item', '2182489', 'NA', '5 ml', 1),
(2746, 10, 21, 1, 'Item', '2182490', 'NA', '5 ml', 1),
(2747, 10, 21, 1, 'Item', '2182491', 'NA', '5 ml', 1),
(2748, 10, 21, 1, 'Item', '2182492', 'NA', '5 ml', 1),
(2749, 10, 21, 1, 'Item', '2182493', 'NA', '5 ml', 1),
(2750, 10, 21, 1, 'Item', '2182494', 'NA', '5 ml', 1),
(2751, 10, 21, 1, 'Item', '2182495', 'NA', '5 ml', 1),
(2752, 10, 21, 1, 'Item', '2182496', 'NA', '5 ml', 1),
(2753, 10, 21, 1, 'Item', '2182497', 'NA', '5 ml', 1),
(2754, 10, 21, 1, 'Item', '2182498', 'NA', '5 ml', 1),
(2755, 10, 21, 1, 'Item', '2182499', 'NA', '5 ml', 1),
(2756, 10, 21, 1, 'Item', '2182500', 'NA', '5 ml', 1),
(2757, 10, 21, 1, 'Item', '2182501', 'NA', '5 ml', 1),
(2758, 10, 21, 1, 'Item', '2182502', 'NA', '5 ml', 1),
(2759, 10, 21, 1, 'Item', '2182503', 'NA', '5 ml', 1),
(2760, 10, 21, 1, 'Item', '2182504', 'NA', '5 ml', 1),
(2761, 10, 21, 1, 'Item', '2182505', 'NA', '5 ml', 1),
(2762, 10, 21, 1, 'Item', '2182506', 'NA', '5 ml', 1),
(2763, 10, 21, 1, 'Item', '2182507', 'NA', '5 ml', 1),
(2764, 10, 21, 1, 'Item', '2182508', 'NA', '5 ml', 1),
(2765, 10, 21, 1, 'Item', '2182509', 'NA', '5 ml', 1),
(2766, 10, 21, 1, 'Item', '2182510', 'NA', '5 ml', 1),
(2767, 10, 21, 1, 'Item', '2182511', 'NA', '5 ml', 1),
(2768, 10, 21, 1, 'Item', '2182512', 'NA', '5 ml', 1),
(2769, 10, 21, 1, 'Item', '2182513', 'NA', '5 ml', 1),
(2770, 10, 21, 1, 'Item', '2182514', 'NA', '5 ml', 1),
(2771, 10, 21, 1, 'Item', '2182515', 'NA', '5 ml', 1),
(2772, 10, 21, 1, 'Item', '2182516', 'NA', '5 ml', 1),
(2773, 10, 21, 1, 'Item', '2182517', 'NA', '5 ml', 1),
(2774, 10, 21, 1, 'Item', '2182518', 'NA', '5 ml', 1),
(2775, 10, 21, 1, 'Item', '2182519', 'NA', '5 ml', 1),
(2776, 10, 21, 1, 'Item', '2182520', 'NA', '5 ml', 1),
(2777, 10, 21, 1, 'Item', '2182521', 'NA', '5 ml', 1),
(2778, 10, 21, 1, 'Item', '2182522', 'NA', '5 ml', 1),
(2779, 10, 21, 1, 'Item', '2182523', 'NA', '5 ml', 1),
(2780, 10, 21, 1, 'Item', '2182524', 'NA', '5 ml', 1),
(2781, 10, 21, 1, 'Item', '2182525', 'NA', '5 ml', 1),
(2782, 10, 21, 1, 'Item', '2182526', 'NA', '5 ml', 1),
(2783, 10, 21, 1, 'Item', '2182527', 'NA', '5 ml', 1),
(2784, 10, 21, 1, 'Item', '2182528', 'NA', '5 ml', 1),
(2785, 10, 21, 1, 'Item', '2182529', 'NA', '5 ml', 1),
(2786, 10, 21, 1, 'Item', '2182530', 'NA', '5 ml', 1),
(2787, 10, 21, 1, 'Item', '2182531', 'NA', '5 ml', 1),
(2788, 10, 21, 1, 'Item', '2182532', 'NA', '5 ml', 1),
(2789, 10, 21, 1, 'Item', '2182533', 'NA', '5 ml', 1),
(2790, 10, 21, 1, 'Item', '2182534', 'NA', '5 ml', 1),
(2791, 10, 21, 1, 'Item', '2182535', 'NA', '5 ml', 1),
(2792, 10, 21, 1, 'Item', '2182536', 'NA', '5 ml', 1),
(2793, 10, 21, 1, 'Item', '2182537', 'NA', '5 ml', 1),
(2794, 10, 21, 1, 'Item', '2182538', 'NA', '5 ml', 1),
(2795, 10, 21, 1, 'Item', '2182539', 'NA', '5 ml', 1),
(2796, 10, 21, 1, 'Item', '2182540', 'NA', '5 ml', 1),
(2797, 10, 21, 1, 'Item', '2182541', 'NA', '5 ml', 1),
(2798, 10, 21, 1, 'Item', '2182542', 'NA', '5 ml', 1),
(2799, 10, 21, 1, 'Item', '2182543', 'NA', '5 ml', 1),
(2800, 10, 21, 1, 'Item', '2182544', 'NA', '5 ml', 1),
(2801, 10, 21, 1, 'Item', '2182545', 'NA', '5 ml', 1),
(2802, 10, 21, 1, 'Item', '2182546', 'NA', '5 ml', 1),
(2803, 10, 21, 1, 'Item', '2182547', 'NA', '5 ml', 1),
(2804, 10, 21, 1, 'Item', '2182548', 'NA', '5 ml', 1),
(2805, 10, 21, 1, 'Item', '2182549', 'NA', '5 ml', 1),
(2806, 10, 21, 1, 'Item', '2182550', 'NA', '5 ml', 1),
(2807, 10, 21, 1, 'Item', '2182551', 'NA', '5 ml', 1),
(2808, 10, 21, 1, 'Item', '2182552', 'NA', '5 ml', 1),
(2809, 10, 21, 1, 'Item', '2182553', 'NA', '5 ml', 1),
(2810, 10, 21, 1, 'Item', '2182554', 'NA', '5 ml', 1),
(2811, 10, 21, 1, 'Item', '2182555', 'NA', '5 ml', 1),
(2812, 10, 21, 1, 'Item', '2182556', 'NA', '5 ml', 1),
(2813, 10, 21, 1, 'Item', '2182557', 'NA', '5 ml', 1),
(2814, 10, 21, 1, 'Item', '2182558', 'NA', '5 ml', 1),
(2815, 10, 21, 1, 'Item', '2182559', 'NA', '5 ml', 1),
(2816, 10, 21, 1, 'Item', '2182560', 'NA', '5 ml', 1),
(2817, 10, 21, 1, 'Item', '2182561', 'NA', '5 ml', 1),
(2818, 10, 21, 1, 'Item', '2182562', 'NA', '5 ml', 1),
(2819, 10, 21, 1, 'Item', '2182563', 'NA', '5 ml', 1),
(2820, 10, 21, 1, 'Item', '2182564', 'NA', '5 ml', 1),
(2821, 10, 21, 1, 'Item', '2182565', 'NA', '5 ml', 1),
(2822, 10, 21, 1, 'Item', '2182566', 'NA', '5 ml', 1),
(2823, 10, 21, 1, 'Item', '2182567', 'NA', '5 ml', 1),
(2824, 10, 21, 1, 'Item', '2182568', 'NA', '5 ml', 1),
(2825, 10, 21, 1, 'Item', '2182569', 'NA', '5 ml', 1),
(2826, 10, 21, 1, 'Item', '2182570', 'NA', '5 ml', 1),
(2827, 10, 21, 1, 'Item', '2182571', 'NA', '5 ml', 1),
(2828, 10, 21, 1, 'Item', '2182572', 'NA', '5 ml', 1),
(2829, 10, 21, 1, 'Item', '2182573', 'NA', '5 ml', 1),
(2830, 10, 21, 1, 'Item', '2182574', 'NA', '5 ml', 1),
(2831, 10, 21, 1, 'Item', '2182575', 'NA', '5 ml', 1),
(2832, 10, 21, 1, 'Item', '2182576', 'NA', '5 ml', 1),
(2833, 10, 21, 1, 'Item', '2182577', 'NA', '5 ml', 1),
(2834, 10, 21, 1, 'Item', '2182578', 'NA', '5 ml', 1),
(2835, 10, 21, 1, 'Item', '2182579', 'NA', '5 ml', 1),
(2836, 10, 21, 1, 'Item', '2182580', 'NA', '5 ml', 1),
(2837, 10, 21, 1, 'Item', '2182581', 'NA', '5 ml', 1),
(2838, 10, 21, 1, 'Item', '2182582', 'NA', '5 ml', 1),
(2839, 10, 21, 1, 'Item', '2182583', 'NA', '5 ml', 1),
(2840, 10, 21, 1, 'Item', '2182584', 'NA', '5 ml', 1),
(2841, 10, 21, 1, 'Item', '2182585', 'NA', '5 ml', 1),
(2842, 10, 21, 1, 'Item', '2182586', 'NA', '5 ml', 1),
(2843, 10, 21, 1, 'Item', '2182587', 'NA', '5 ml', 1),
(2844, 10, 21, 1, 'Item', '2182588', 'NA', '5 ml', 1),
(2845, 10, 21, 1, 'Item', '2182589', 'NA', '5 ml', 1);
INSERT INTO `tp_package_primary` (`id`, `product_id`, `lot_id`, `pack_type_id`, `package_type`, `package_sn`, `package_image`, `ineer_package_count`, `is_active`) VALUES
(2846, 10, 21, 1, 'Item', '2182590', 'NA', '5 ml', 1),
(2847, 10, 21, 1, 'Item', '2182591', 'NA', '5 ml', 1),
(2848, 10, 21, 1, 'Item', '2182592', 'NA', '5 ml', 1),
(2849, 10, 21, 1, 'Item', '2182593', 'NA', '5 ml', 1),
(2850, 10, 21, 1, 'Item', '2182594', 'NA', '5 ml', 1),
(2851, 10, 21, 1, 'Item', '2182595', 'NA', '5 ml', 1),
(2852, 10, 21, 1, 'Item', '2182596', 'NA', '5 ml', 1),
(2853, 10, 21, 1, 'Item', '2182597', 'NA', '5 ml', 1),
(2854, 10, 21, 1, 'Item', '2182598', 'NA', '5 ml', 1),
(2855, 10, 21, 1, 'Item', '2182599', 'NA', '5 ml', 1),
(2856, 10, 21, 1, 'Item', '2182600', 'NA', '5 ml', 1),
(2857, 10, 21, 1, 'Item', '2182601', 'NA', '5 ml', 1),
(2858, 10, 21, 1, 'Item', '2182602', 'NA', '5 ml', 1),
(2859, 10, 21, 1, 'Item', '2182603', 'NA', '5 ml', 1),
(2860, 10, 21, 1, 'Item', '2182604', 'NA', '5 ml', 1),
(2861, 10, 21, 1, 'Item', '2182605', 'NA', '5 ml', 1),
(2862, 10, 21, 1, 'Item', '2182606', 'NA', '5 ml', 1),
(2863, 10, 21, 1, 'Item', '2182607', 'NA', '5 ml', 1),
(2864, 10, 21, 1, 'Item', '2182608', 'NA', '5 ml', 1),
(2865, 10, 21, 1, 'Item', '2182609', 'NA', '5 ml', 1),
(2866, 10, 21, 1, 'Item', '2182610', 'NA', '5 ml', 1),
(2867, 10, 21, 1, 'Item', '2182611', 'NA', '5 ml', 1),
(2868, 10, 21, 1, 'Item', '2182612', 'NA', '5 ml', 1),
(2869, 10, 21, 1, 'Item', '2182613', 'NA', '5 ml', 1),
(2870, 10, 21, 1, 'Item', '2182614', 'NA', '5 ml', 1),
(2871, 10, 21, 1, 'Item', '2182615', 'NA', '5 ml', 1),
(2872, 10, 21, 1, 'Item', '2182616', 'NA', '5 ml', 1),
(2873, 10, 21, 1, 'Item', '2182617', 'NA', '5 ml', 1),
(2874, 10, 21, 1, 'Item', '2182618', 'NA', '5 ml', 1),
(2875, 10, 21, 1, 'Item', '2182619', 'NA', '5 ml', 1),
(2876, 10, 21, 1, 'Item', '2182620', 'NA', '5 ml', 1),
(2877, 10, 21, 1, 'Item', '2182621', 'NA', '5 ml', 1),
(2878, 10, 21, 1, 'Item', '2182622', 'NA', '5 ml', 1),
(2879, 10, 21, 1, 'Item', '2182623', 'NA', '5 ml', 1),
(2880, 10, 21, 1, 'Item', '2182624', 'NA', '5 ml', 1),
(2881, 10, 21, 1, 'Item', '2182625', 'NA', '5 ml', 1),
(2882, 10, 21, 1, 'Item', '2182626', 'NA', '5 ml', 1),
(2883, 10, 21, 1, 'Item', '2182627', 'NA', '5 ml', 1),
(2884, 10, 21, 1, 'Item', '2182628', 'NA', '5 ml', 1),
(2885, 10, 21, 1, 'Item', '2182629', 'NA', '5 ml', 1),
(2886, 10, 21, 1, 'Item', '2182630', 'NA', '5 ml', 1),
(2887, 10, 21, 1, 'Item', '2182631', 'NA', '5 ml', 1),
(2888, 10, 21, 1, 'Item', '2182632', 'NA', '5 ml', 1),
(2889, 10, 21, 1, 'Item', '2182633', 'NA', '5 ml', 1),
(2890, 10, 21, 1, 'Item', '2182634', 'NA', '5 ml', 1),
(2891, 10, 21, 1, 'Item', '2182635', 'NA', '5 ml', 1),
(2892, 10, 21, 1, 'Item', '2182636', 'NA', '5 ml', 1),
(2893, 10, 21, 1, 'Item', '2182637', 'NA', '5 ml', 1),
(2894, 10, 21, 1, 'Item', '2182638', 'NA', '5 ml', 1),
(2895, 10, 21, 1, 'Item', '2182639', 'NA', '5 ml', 1),
(2896, 10, 21, 1, 'Item', '2182640', 'NA', '5 ml', 1),
(2897, 10, 21, 1, 'Item', '2182641', 'NA', '5 ml', 1),
(2898, 10, 21, 1, 'Item', '2182642', 'NA', '5 ml', 1),
(2899, 10, 21, 1, 'Item', '2182643', 'NA', '5 ml', 1),
(2900, 10, 21, 1, 'Item', '2182644', 'NA', '5 ml', 1),
(2901, 10, 21, 1, 'Item', '2182645', 'NA', '5 ml', 1),
(2902, 10, 21, 1, 'Item', '2182646', 'NA', '5 ml', 1),
(2903, 10, 21, 1, 'Item', '2182647', 'NA', '5 ml', 1),
(2904, 10, 21, 1, 'Item', '2182648', 'NA', '5 ml', 1),
(2905, 10, 21, 1, 'Item', '2182649', 'NA', '5 ml', 1),
(2906, 10, 21, 1, 'Item', '2182650', 'NA', '5 ml', 1),
(2907, 10, 21, 1, 'Item', '2182651', 'NA', '5 ml', 1),
(2908, 10, 21, 1, 'Item', '2182652', 'NA', '5 ml', 1),
(2909, 10, 21, 1, 'Item', '2182653', 'NA', '5 ml', 1),
(2910, 10, 21, 1, 'Item', '2182654', 'NA', '5 ml', 1),
(2911, 10, 21, 1, 'Item', '2182655', 'NA', '5 ml', 1),
(2912, 10, 21, 1, 'Item', '2182656', 'NA', '5 ml', 1),
(2913, 10, 21, 1, 'Item', '2182657', 'NA', '5 ml', 1),
(2914, 10, 21, 1, 'Item', '2182658', 'NA', '5 ml', 1),
(2915, 10, 21, 1, 'Item', '2182659', 'NA', '5 ml', 1),
(2916, 10, 21, 1, 'Item', '2182660', 'NA', '5 ml', 1),
(2917, 10, 21, 1, 'Item', '2182661', 'NA', '5 ml', 1),
(2918, 10, 21, 1, 'Item', '2182662', 'NA', '5 ml', 1),
(2919, 10, 21, 1, 'Item', '2182663', 'NA', '5 ml', 1),
(2920, 10, 21, 1, 'Item', '2182664', 'NA', '5 ml', 1),
(2921, 10, 21, 1, 'Item', '2182665', 'NA', '5 ml', 1),
(2922, 10, 21, 1, 'Item', '2182666', 'NA', '5 ml', 1),
(2923, 10, 21, 1, 'Item', '2182667', 'NA', '5 ml', 1),
(2924, 10, 21, 1, 'Item', '2182668', 'NA', '5 ml', 1),
(2925, 10, 21, 1, 'Item', '2182669', 'NA', '5 ml', 1),
(2926, 10, 21, 1, 'Item', '2182670', 'NA', '5 ml', 1),
(2927, 10, 21, 1, 'Item', '2182671', 'NA', '5 ml', 1),
(2928, 10, 21, 1, 'Item', '2182672', 'NA', '5 ml', 1),
(2929, 10, 21, 1, 'Item', '2182673', 'NA', '5 ml', 1),
(2930, 10, 21, 1, 'Item', '2182674', 'NA', '5 ml', 1),
(2931, 10, 21, 1, 'Item', '2182675', 'NA', '5 ml', 1),
(2932, 10, 21, 1, 'Item', '2182676', 'NA', '5 ml', 1),
(2933, 10, 21, 1, 'Item', '2182677', 'NA', '5 ml', 1),
(2934, 10, 21, 1, 'Item', '2182678', 'NA', '5 ml', 1),
(2935, 10, 21, 1, 'Item', '2182679', 'NA', '5 ml', 1),
(2936, 10, 21, 1, 'Item', '2182680', 'NA', '5 ml', 1),
(2937, 10, 21, 1, 'Item', '2182681', 'NA', '5 ml', 1),
(2938, 10, 21, 1, 'Item', '2182682', 'NA', '5 ml', 1),
(2939, 10, 21, 1, 'Item', '2182683', 'NA', '5 ml', 1),
(2940, 10, 21, 1, 'Item', '2182684', 'NA', '5 ml', 1),
(2941, 10, 21, 1, 'Item', '2182685', 'NA', '5 ml', 1),
(2942, 10, 21, 1, 'Item', '2182686', 'NA', '5 ml', 1),
(2943, 10, 21, 1, 'Item', '2182687', 'NA', '5 ml', 1),
(2944, 10, 21, 1, 'Item', '2182688', 'NA', '5 ml', 1),
(2945, 10, 21, 1, 'Item', '2182689', 'NA', '5 ml', 1),
(2946, 10, 21, 1, 'Item', '2182690', 'NA', '5 ml', 1),
(2947, 10, 21, 1, 'Item', '2182691', 'NA', '5 ml', 1),
(2948, 10, 21, 1, 'Item', '2182692', 'NA', '5 ml', 1),
(2949, 10, 21, 1, 'Item', '2182693', 'NA', '5 ml', 1),
(2950, 10, 21, 1, 'Item', '2182694', 'NA', '5 ml', 1),
(2951, 10, 21, 1, 'Item', '2182695', 'NA', '5 ml', 1),
(2952, 10, 21, 1, 'Item', '2182696', 'NA', '5 ml', 1),
(2953, 10, 21, 1, 'Item', '2182697', 'NA', '5 ml', 1),
(2954, 10, 21, 1, 'Item', '2182698', 'NA', '5 ml', 1),
(2955, 10, 21, 1, 'Item', '2182699', 'NA', '5 ml', 1),
(2956, 10, 21, 1, 'Item', '2182700', 'NA', '5 ml', 1),
(2957, 10, 21, 1, 'Item', '2182701', 'NA', '5 ml', 1),
(2958, 10, 21, 1, 'Item', '2182702', 'NA', '5 ml', 1),
(2959, 10, 21, 1, 'Item', '2182703', 'NA', '5 ml', 1),
(2960, 10, 21, 1, 'Item', '2182704', 'NA', '5 ml', 1),
(2961, 10, 21, 1, 'Item', '2182705', 'NA', '5 ml', 1),
(2962, 10, 21, 1, 'Item', '2182706', 'NA', '5 ml', 1),
(2963, 10, 21, 1, 'Item', '2182707', 'NA', '5 ml', 1),
(2964, 10, 21, 1, 'Item', '2182708', 'NA', '5 ml', 1),
(2965, 10, 21, 1, 'Item', '2182709', 'NA', '5 ml', 1),
(2966, 10, 21, 1, 'Item', '2182710', 'NA', '5 ml', 1),
(2967, 10, 21, 1, 'Item', '2182711', 'NA', '5 ml', 1),
(2968, 10, 21, 1, 'Item', '2182712', 'NA', '5 ml', 1),
(2969, 10, 21, 1, 'Item', '2182713', 'NA', '5 ml', 1),
(2970, 10, 21, 1, 'Item', '2182714', 'NA', '5 ml', 1),
(2971, 10, 21, 1, 'Item', '2182715', 'NA', '5 ml', 1),
(2972, 10, 21, 1, 'Item', '2182716', 'NA', '5 ml', 1),
(2973, 10, 21, 1, 'Item', '2182717', 'NA', '5 ml', 1),
(2974, 10, 21, 1, 'Item', '2182718', 'NA', '5 ml', 1),
(2975, 10, 21, 1, 'Item', '2182719', 'NA', '5 ml', 1),
(2976, 10, 21, 1, 'Item', '2182720', 'NA', '5 ml', 1),
(2977, 10, 21, 1, 'Item', '2182721', 'NA', '5 ml', 1),
(2978, 10, 21, 1, 'Item', '2182722', 'NA', '5 ml', 1),
(2979, 10, 21, 1, 'Item', '2182723', 'NA', '5 ml', 1),
(2980, 10, 21, 1, 'Item', '2182724', 'NA', '5 ml', 1),
(2981, 10, 21, 1, 'Item', '2182725', 'NA', '5 ml', 1),
(2982, 10, 21, 1, 'Item', '2182726', 'NA', '5 ml', 1),
(2983, 10, 21, 1, 'Item', '2182727', 'NA', '5 ml', 1),
(2984, 10, 21, 1, 'Item', '2182728', 'NA', '5 ml', 1),
(2985, 10, 21, 1, 'Item', '2182729', 'NA', '5 ml', 1),
(2986, 10, 21, 1, 'Item', '2182730', 'NA', '5 ml', 1),
(2987, 10, 21, 1, 'Item', '2182731', 'NA', '5 ml', 1),
(2988, 10, 21, 1, 'Item', '2182732', 'NA', '5 ml', 1),
(2989, 10, 21, 1, 'Item', '2182733', 'NA', '5 ml', 1),
(2990, 10, 21, 1, 'Item', '2182734', 'NA', '5 ml', 1),
(2991, 10, 21, 1, 'Item', '2182735', 'NA', '5 ml', 1),
(2992, 10, 21, 1, 'Item', '2182736', 'NA', '5 ml', 1),
(2993, 10, 21, 1, 'Item', '2182737', 'NA', '5 ml', 1),
(2994, 10, 21, 1, 'Item', '2182738', 'NA', '5 ml', 1),
(2995, 10, 21, 1, 'Item', '2182739', 'NA', '5 ml', 1),
(2996, 10, 21, 1, 'Item', '2182740', 'NA', '5 ml', 1),
(2997, 10, 21, 1, 'Item', '2182741', 'NA', '5 ml', 1),
(2998, 10, 21, 1, 'Item', '2182742', 'NA', '5 ml', 1),
(2999, 10, 21, 1, 'Item', '2182743', 'NA', '5 ml', 1),
(3000, 10, 21, 1, 'Item', '2182744', 'NA', '5 ml', 1),
(3001, 10, 21, 1, 'Item', '2182745', 'NA', '5 ml', 1),
(3002, 10, 21, 1, 'Item', '2182746', 'NA', '5 ml', 1),
(3003, 10, 21, 1, 'Item', '2182747', 'NA', '5 ml', 1),
(3004, 10, 21, 1, 'Item', '2182748', 'NA', '5 ml', 1),
(3005, 10, 21, 1, 'Item', '2182749', 'NA', '5 ml', 1),
(3006, 10, 21, 1, 'Item', '2182750', 'NA', '5 ml', 1),
(3007, 10, 21, 1, 'Item', '2182751', 'NA', '5 ml', 1),
(3008, 10, 21, 1, 'Item', '2182752', 'NA', '5 ml', 1),
(3009, 10, 21, 1, 'Item', '2182753', 'NA', '5 ml', 1),
(3010, 10, 21, 1, 'Item', '2182754', 'NA', '5 ml', 1),
(3011, 10, 21, 1, 'Item', '2182755', 'NA', '5 ml', 1),
(3012, 10, 21, 1, 'Item', '2182756', 'NA', '5 ml', 1),
(3013, 10, 21, 1, 'Item', '2182757', 'NA', '5 ml', 1),
(3014, 10, 21, 1, 'Item', '2182758', 'NA', '5 ml', 1),
(3015, 10, 21, 1, 'Item', '2182759', 'NA', '5 ml', 1),
(3016, 10, 21, 1, 'Item', '2182760', 'NA', '5 ml', 1),
(3017, 10, 21, 1, 'Item', '2182761', 'NA', '5 ml', 1),
(3018, 10, 21, 1, 'Item', '2182762', 'NA', '5 ml', 1),
(3019, 10, 21, 1, 'Item', '2182763', 'NA', '5 ml', 1),
(3020, 10, 21, 1, 'Item', '2182764', 'NA', '5 ml', 1),
(3021, 10, 21, 1, 'Item', '2182765', 'NA', '5 ml', 1),
(3022, 10, 21, 1, 'Item', '2182766', 'NA', '5 ml', 1),
(3023, 10, 21, 1, 'Item', '2182767', 'NA', '5 ml', 1),
(3024, 10, 21, 1, 'Item', '2182768', 'NA', '5 ml', 1),
(3025, 10, 21, 1, 'Item', '2182769', 'NA', '5 ml', 1),
(3026, 10, 21, 1, 'Item', '2182770', 'NA', '5 ml', 1),
(3027, 10, 21, 1, 'Item', '2182771', 'NA', '5 ml', 1),
(3028, 10, 21, 1, 'Item', '2182772', 'NA', '5 ml', 1),
(3029, 10, 21, 1, 'Item', '2182773', 'NA', '5 ml', 1),
(3030, 10, 21, 1, 'Item', '2182774', 'NA', '5 ml', 1),
(3031, 10, 21, 1, 'Item', '2182775', 'NA', '5 ml', 1),
(3032, 10, 21, 1, 'Item', '2182776', 'NA', '5 ml', 1),
(3033, 10, 21, 1, 'Item', '2182777', 'NA', '5 ml', 1),
(3034, 10, 21, 1, 'Item', '2182778', 'NA', '5 ml', 1),
(3035, 10, 21, 1, 'Item', '2182779', 'NA', '5 ml', 1),
(3036, 10, 21, 1, 'Item', '2182780', 'NA', '5 ml', 1),
(3037, 10, 21, 1, 'Item', '2182781', 'NA', '5 ml', 1),
(3038, 10, 21, 1, 'Item', '2182782', 'NA', '5 ml', 1),
(3039, 10, 21, 1, 'Item', '2182783', 'NA', '5 ml', 1),
(3040, 10, 21, 1, 'Item', '2182784', 'NA', '5 ml', 1),
(3041, 10, 21, 1, 'Item', '2182785', 'NA', '5 ml', 1),
(3042, 10, 21, 1, 'Item', '2182786', 'NA', '5 ml', 1),
(3043, 10, 21, 1, 'Item', '2182787', 'NA', '5 ml', 1),
(3044, 10, 21, 1, 'Item', '2182788', 'NA', '5 ml', 1),
(3045, 10, 21, 1, 'Item', '2182789', 'NA', '5 ml', 1),
(3046, 10, 21, 1, 'Item', '2182790', 'NA', '5 ml', 1),
(3047, 10, 21, 1, 'Item', '2182791', 'NA', '5 ml', 1),
(3048, 10, 21, 1, 'Item', '2182792', 'NA', '5 ml', 1),
(3049, 10, 21, 1, 'Item', '2182793', 'NA', '5 ml', 1),
(3050, 10, 21, 1, 'Item', '2182794', 'NA', '5 ml', 1),
(3051, 10, 21, 1, 'Item', '2182795', 'NA', '5 ml', 1),
(3052, 10, 21, 1, 'Item', '2182796', 'NA', '5 ml', 1),
(3053, 10, 21, 1, 'Item', '2182797', 'NA', '5 ml', 1),
(3054, 10, 21, 1, 'Item', '2182798', 'NA', '5 ml', 1),
(3055, 10, 21, 1, 'Item', '2182799', 'NA', '5 ml', 1),
(3056, 10, 21, 1, 'Item', '2182800', 'NA', '5 ml', 1),
(3057, 10, 21, 1, 'Item', '2182801', 'NA', '5 ml', 1),
(3058, 10, 21, 1, 'Item', '2182802', 'NA', '5 ml', 1),
(3059, 10, 21, 1, 'Item', '2182803', 'NA', '5 ml', 1),
(3060, 10, 21, 1, 'Item', '2182804', 'NA', '5 ml', 1),
(3061, 10, 21, 1, 'Item', '2182805', 'NA', '5 ml', 1),
(3062, 10, 21, 1, 'Item', '2182806', 'NA', '5 ml', 1),
(3063, 10, 21, 1, 'Item', '2182807', 'NA', '5 ml', 1),
(3064, 10, 21, 1, 'Item', '2182808', 'NA', '5 ml', 1),
(3065, 10, 21, 1, 'Item', '2182809', 'NA', '5 ml', 1),
(3066, 10, 21, 1, 'Item', '2182810', 'NA', '5 ml', 1),
(3067, 10, 21, 1, 'Item', '2182811', 'NA', '5 ml', 1),
(3068, 10, 21, 1, 'Item', '2182812', 'NA', '5 ml', 1),
(3069, 10, 21, 1, 'Item', '2182813', 'NA', '5 ml', 1),
(3070, 10, 21, 1, 'Item', '2182814', 'NA', '5 ml', 1),
(3071, 10, 21, 1, 'Item', '2182815', 'NA', '5 ml', 1),
(3072, 10, 21, 1, 'Item', '2182816', 'NA', '5 ml', 1),
(3073, 10, 21, 1, 'Item', '2182817', 'NA', '5 ml', 1),
(3074, 10, 21, 1, 'Item', '2182818', 'NA', '5 ml', 1),
(3075, 10, 21, 1, 'Item', '2182819', 'NA', '5 ml', 1),
(3076, 10, 21, 1, 'Item', '2182820', 'NA', '5 ml', 1),
(3077, 10, 21, 1, 'Item', '2182821', 'NA', '5 ml', 1),
(3078, 10, 21, 1, 'Item', '2182822', 'NA', '5 ml', 1),
(3079, 10, 21, 1, 'Item', '2182823', 'NA', '5 ml', 1),
(3080, 10, 21, 1, 'Item', '2182824', 'NA', '5 ml', 1),
(3081, 10, 21, 1, 'Item', '2182825', 'NA', '5 ml', 1),
(3082, 10, 21, 1, 'Item', '2182826', 'NA', '5 ml', 1),
(3083, 10, 21, 1, 'Item', '2182827', 'NA', '5 ml', 1),
(3084, 10, 21, 1, 'Item', '2182828', 'NA', '5 ml', 1),
(3085, 10, 21, 1, 'Item', '2182829', 'NA', '5 ml', 1),
(3086, 10, 21, 1, 'Item', '2182830', 'NA', '5 ml', 1),
(3087, 10, 21, 1, 'Item', '2182831', 'NA', '5 ml', 1),
(3088, 10, 21, 1, 'Item', '2182832', 'NA', '5 ml', 1),
(3089, 10, 21, 1, 'Item', '2182833', 'NA', '5 ml', 1),
(3090, 10, 21, 1, 'Item', '2182834', 'NA', '5 ml', 1),
(3091, 10, 21, 1, 'Item', '2182835', 'NA', '5 ml', 1),
(3092, 10, 21, 1, 'Item', '2182836', 'NA', '5 ml', 1),
(3093, 10, 21, 1, 'Item', '2182837', 'NA', '5 ml', 1),
(3094, 10, 21, 1, 'Item', '2182838', 'NA', '5 ml', 1),
(3095, 10, 21, 1, 'Item', '2182839', 'NA', '5 ml', 1),
(3096, 10, 21, 1, 'Item', '2182840', 'NA', '5 ml', 1),
(3097, 10, 21, 1, 'Item', '2182841', 'NA', '5 ml', 1),
(3098, 10, 21, 1, 'Item', '2182842', 'NA', '5 ml', 1),
(3099, 10, 21, 1, 'Item', '2182843', 'NA', '5 ml', 1),
(3100, 10, 21, 1, 'Item', '2182844', 'NA', '5 ml', 1),
(3101, 10, 21, 1, 'Item', '2182845', 'NA', '5 ml', 1),
(3102, 10, 21, 1, 'Item', '2182846', 'NA', '5 ml', 1),
(3103, 10, 21, 1, 'Item', '2182847', 'NA', '5 ml', 1),
(3104, 10, 21, 1, 'Item', '2182848', 'NA', '5 ml', 1),
(3105, 10, 21, 1, 'Item', '2182849', 'NA', '5 ml', 1),
(3106, 10, 21, 1, 'Item', '2182850', 'NA', '5 ml', 1),
(3107, 10, 21, 1, 'Item', '2182851', 'NA', '5 ml', 1),
(3108, 10, 21, 1, 'Item', '2182852', 'NA', '5 ml', 1),
(3109, 10, 21, 1, 'Item', '2182853', 'NA', '5 ml', 1),
(3110, 10, 21, 1, 'Item', '2182854', 'NA', '5 ml', 1),
(3111, 10, 21, 1, 'Item', '2182855', 'NA', '5 ml', 1),
(3112, 10, 21, 1, 'Item', '2182856', 'NA', '5 ml', 1),
(3113, 10, 21, 1, 'Item', '2182857', 'NA', '5 ml', 1),
(3114, 10, 21, 1, 'Item', '2182858', 'NA', '5 ml', 1),
(3115, 10, 21, 1, 'Item', '2182859', 'NA', '5 ml', 1),
(3116, 10, 21, 1, 'Item', '2182860', 'NA', '5 ml', 1),
(3117, 10, 21, 1, 'Item', '2182861', 'NA', '5 ml', 1),
(3118, 10, 21, 1, 'Item', '2182862', 'NA', '5 ml', 1),
(3119, 10, 21, 1, 'Item', '2182863', 'NA', '5 ml', 1),
(3120, 10, 21, 1, 'Item', '2182864', 'NA', '5 ml', 1),
(3121, 10, 21, 1, 'Item', '2182865', 'NA', '5 ml', 1),
(3122, 10, 21, 1, 'Item', '2182866', 'NA', '5 ml', 1),
(3123, 10, 21, 1, 'Item', '2182867', 'NA', '5 ml', 1),
(3124, 10, 21, 1, 'Item', '2182868', 'NA', '5 ml', 1),
(3125, 10, 21, 1, 'Item', '2182869', 'NA', '5 ml', 1),
(3126, 10, 21, 1, 'Item', '2182870', 'NA', '5 ml', 1),
(3127, 10, 21, 1, 'Item', '2182871', 'NA', '5 ml', 1),
(3128, 10, 21, 1, 'Item', '2182872', 'NA', '5 ml', 1),
(3129, 10, 21, 1, 'Item', '2182873', 'NA', '5 ml', 1),
(3130, 10, 21, 1, 'Item', '2182874', 'NA', '5 ml', 1),
(3131, 10, 21, 1, 'Item', '2182875', 'NA', '5 ml', 1),
(3132, 10, 21, 1, 'Item', '2182876', 'NA', '5 ml', 1),
(3133, 10, 21, 1, 'Item', '2182877', 'NA', '5 ml', 1),
(3134, 10, 21, 1, 'Item', '2182878', 'NA', '5 ml', 1),
(3135, 10, 21, 1, 'Item', '2182879', 'NA', '5 ml', 1),
(3136, 10, 21, 1, 'Item', '2182880', 'NA', '5 ml', 1),
(3137, 10, 21, 1, 'Item', '2182881', 'NA', '5 ml', 1),
(3138, 10, 21, 1, 'Item', '2182882', 'NA', '5 ml', 1),
(3139, 10, 21, 1, 'Item', '2182883', 'NA', '5 ml', 1),
(3140, 10, 21, 1, 'Item', '2182884', 'NA', '5 ml', 1),
(3141, 10, 21, 1, 'Item', '2182885', 'NA', '5 ml', 1),
(3142, 10, 21, 1, 'Item', '2182886', 'NA', '5 ml', 1),
(3143, 10, 21, 1, 'Item', '2182887', 'NA', '5 ml', 1),
(3144, 10, 21, 1, 'Item', '2182888', 'NA', '5 ml', 1),
(3145, 10, 21, 1, 'Item', '2182889', 'NA', '5 ml', 1),
(3146, 10, 21, 1, 'Item', '2182890', 'NA', '5 ml', 1),
(3147, 10, 21, 1, 'Item', '2182891', 'NA', '5 ml', 1),
(3148, 10, 21, 1, 'Item', '2182892', 'NA', '5 ml', 1),
(3149, 10, 21, 1, 'Item', '2182893', 'NA', '5 ml', 1),
(3150, 10, 21, 1, 'Item', '2182894', 'NA', '5 ml', 1),
(3151, 10, 21, 1, 'Item', '2182895', 'NA', '5 ml', 1),
(3152, 10, 21, 1, 'Item', '2182896', 'NA', '5 ml', 1),
(3153, 10, 21, 1, 'Item', '2182897', 'NA', '5 ml', 1),
(3154, 10, 21, 1, 'Item', '2182898', 'NA', '5 ml', 1),
(3155, 10, 21, 1, 'Item', '2182899', 'NA', '5 ml', 1),
(3156, 10, 21, 1, 'Item', '2182900', 'NA', '5 ml', 1),
(3157, 10, 21, 1, 'Item', '2182901', 'NA', '5 ml', 1),
(3158, 10, 21, 1, 'Item', '2182902', 'NA', '5 ml', 1),
(3159, 10, 21, 1, 'Item', '2182903', 'NA', '5 ml', 1),
(3160, 10, 21, 1, 'Item', '2182904', 'NA', '5 ml', 1),
(3161, 10, 21, 1, 'Item', '2182905', 'NA', '5 ml', 1),
(3162, 10, 21, 1, 'Item', '2182906', 'NA', '5 ml', 1),
(3163, 10, 21, 1, 'Item', '2182907', 'NA', '5 ml', 1),
(3164, 10, 21, 1, 'Item', '2182908', 'NA', '5 ml', 1),
(3165, 10, 21, 1, 'Item', '2182909', 'NA', '5 ml', 1),
(3166, 10, 21, 1, 'Item', '2182910', 'NA', '5 ml', 1),
(3167, 10, 21, 1, 'Item', '2182911', 'NA', '5 ml', 1),
(3168, 10, 21, 1, 'Item', '2182912', 'NA', '5 ml', 1),
(3169, 10, 21, 1, 'Item', '2182913', 'NA', '5 ml', 1),
(3170, 10, 21, 1, 'Item', '2182914', 'NA', '5 ml', 1),
(3171, 10, 21, 1, 'Item', '2182915', 'NA', '5 ml', 1),
(3172, 10, 21, 1, 'Item', '2182916', 'NA', '5 ml', 1),
(3173, 10, 21, 1, 'Item', '2182917', 'NA', '5 ml', 1),
(3174, 10, 21, 1, 'Item', '2182918', 'NA', '5 ml', 1),
(3175, 10, 21, 1, 'Item', '2182919', 'NA', '5 ml', 1),
(3176, 10, 21, 1, 'Item', '2182920', 'NA', '5 ml', 1),
(3177, 10, 21, 1, 'Item', '2182921', 'NA', '5 ml', 1),
(3178, 10, 21, 1, 'Item', '2182922', 'NA', '5 ml', 1),
(3179, 10, 21, 1, 'Item', '2182923', 'NA', '5 ml', 1),
(3180, 10, 21, 1, 'Item', '2182924', 'NA', '5 ml', 1),
(3181, 10, 21, 1, 'Item', '2182925', 'NA', '5 ml', 1),
(3182, 10, 21, 1, 'Item', '2182926', 'NA', '5 ml', 1),
(3183, 10, 21, 1, 'Item', '2182927', 'NA', '5 ml', 1),
(3184, 10, 21, 1, 'Item', '2182928', 'NA', '5 ml', 1),
(3185, 10, 21, 1, 'Item', '2182929', 'NA', '5 ml', 1),
(3186, 10, 21, 1, 'Item', '2182930', 'NA', '5 ml', 1),
(3187, 10, 21, 1, 'Item', '2182931', 'NA', '5 ml', 1),
(3188, 10, 21, 1, 'Item', '2182932', 'NA', '5 ml', 1),
(3189, 10, 21, 1, 'Item', '2182933', 'NA', '5 ml', 1),
(3190, 10, 21, 1, 'Item', '2182934', 'NA', '5 ml', 1),
(3191, 10, 21, 1, 'Item', '2182935', 'NA', '5 ml', 1),
(3192, 10, 21, 1, 'Item', '2182936', 'NA', '5 ml', 1),
(3193, 10, 21, 1, 'Item', '2182937', 'NA', '5 ml', 1),
(3194, 10, 21, 1, 'Item', '2182938', 'NA', '5 ml', 1),
(3195, 10, 21, 1, 'Item', '2182939', 'NA', '5 ml', 1),
(3196, 10, 21, 1, 'Item', '2182940', 'NA', '5 ml', 1),
(3197, 10, 21, 1, 'Item', '2182941', 'NA', '5 ml', 1),
(3198, 10, 21, 1, 'Item', '2182942', 'NA', '5 ml', 1),
(3199, 10, 21, 1, 'Item', '2182943', 'NA', '5 ml', 1),
(3200, 10, 21, 1, 'Item', '2182944', 'NA', '5 ml', 1),
(3201, 10, 21, 1, 'Item', '2182945', 'NA', '5 ml', 1),
(3202, 10, 21, 1, 'Item', '2182946', 'NA', '5 ml', 1),
(3203, 10, 21, 1, 'Item', '2182947', 'NA', '5 ml', 1),
(3204, 10, 21, 1, 'Item', '2182948', 'NA', '5 ml', 1),
(3205, 10, 21, 1, 'Item', '2182949', 'NA', '5 ml', 1),
(3206, 10, 21, 1, 'Item', '2182950', 'NA', '5 ml', 1),
(3207, 10, 21, 1, 'Item', '2182951', 'NA', '5 ml', 1),
(3208, 10, 21, 1, 'Item', '2182952', 'NA', '5 ml', 1),
(3209, 10, 21, 1, 'Item', '2182953', 'NA', '5 ml', 1),
(3210, 10, 21, 1, 'Item', '2182954', 'NA', '5 ml', 1),
(3211, 10, 21, 1, 'Item', '2182955', 'NA', '5 ml', 1),
(3212, 10, 21, 1, 'Item', '2182956', 'NA', '5 ml', 1),
(3213, 10, 21, 1, 'Item', '2182957', 'NA', '5 ml', 1),
(3214, 10, 21, 1, 'Item', '2182958', 'NA', '5 ml', 1),
(3215, 10, 21, 1, 'Item', '2182959', 'NA', '5 ml', 1),
(3216, 10, 21, 1, 'Item', '2182960', 'NA', '5 ml', 1),
(3217, 10, 21, 1, 'Item', '2182961', 'NA', '5 ml', 1),
(3218, 10, 21, 1, 'Item', '2182962', 'NA', '5 ml', 1),
(3219, 10, 21, 1, 'Item', '2182963', 'NA', '5 ml', 1),
(3220, 10, 21, 1, 'Item', '2182964', 'NA', '5 ml', 1),
(3221, 10, 21, 1, 'Item', '2182965', 'NA', '5 ml', 1),
(3222, 10, 21, 1, 'Item', '2182966', 'NA', '5 ml', 1),
(3223, 10, 21, 1, 'Item', '2182967', 'NA', '5 ml', 1),
(3224, 10, 21, 1, 'Item', '2182968', 'NA', '5 ml', 1),
(3225, 10, 21, 1, 'Item', '2182969', 'NA', '5 ml', 1),
(3226, 10, 21, 1, 'Item', '2182970', 'NA', '5 ml', 1),
(3227, 10, 21, 1, 'Item', '2182971', 'NA', '5 ml', 1),
(3228, 10, 21, 1, 'Item', '2182972', 'NA', '5 ml', 1),
(3229, 10, 21, 1, 'Item', '2182973', 'NA', '5 ml', 1),
(3230, 10, 21, 1, 'Item', '2182974', 'NA', '5 ml', 1),
(3231, 10, 21, 1, 'Item', '2182975', 'NA', '5 ml', 1),
(3232, 10, 21, 1, 'Item', '2182976', 'NA', '5 ml', 1),
(3233, 10, 21, 1, 'Item', '2182977', 'NA', '5 ml', 1),
(3234, 10, 21, 1, 'Item', '2182978', 'NA', '5 ml', 1),
(3235, 10, 21, 1, 'Item', '2182979', 'NA', '5 ml', 1),
(3236, 10, 21, 1, 'Item', '2182980', 'NA', '5 ml', 1),
(3237, 10, 21, 1, 'Item', '2182981', 'NA', '5 ml', 1),
(3238, 10, 21, 1, 'Item', '2182982', 'NA', '5 ml', 1),
(3239, 10, 21, 1, 'Item', '2182983', 'NA', '5 ml', 1),
(3240, 10, 21, 1, 'Item', '2182984', 'NA', '5 ml', 1),
(3241, 10, 21, 1, 'Item', '2182985', 'NA', '5 ml', 1),
(3242, 10, 21, 1, 'Item', '2182986', 'NA', '5 ml', 1),
(3243, 10, 21, 1, 'Item', '2182987', 'NA', '5 ml', 1),
(3244, 10, 21, 1, 'Item', '2182988', 'NA', '5 ml', 1),
(3245, 10, 21, 1, 'Item', '2182989', 'NA', '5 ml', 1),
(3246, 10, 21, 1, 'Item', '2182990', 'NA', '5 ml', 1),
(3247, 10, 21, 1, 'Item', '2182991', 'NA', '5 ml', 1),
(3248, 10, 21, 1, 'Item', '2182992', 'NA', '5 ml', 1),
(3249, 10, 21, 1, 'Item', '2182993', 'NA', '5 ml', 1),
(3250, 10, 21, 1, 'Item', '2182994', 'NA', '5 ml', 1),
(3251, 10, 21, 1, 'Item', '2182995', 'NA', '5 ml', 1),
(3252, 10, 21, 1, 'Item', '2182996', 'NA', '5 ml', 1),
(3253, 10, 21, 1, 'Item', '2182997', 'NA', '5 ml', 1),
(3254, 10, 21, 1, 'Item', '2182998', 'NA', '5 ml', 1),
(3255, 10, 21, 1, 'Item', '2182999', 'NA', '5 ml', 1),
(3256, 10, 21, 1, 'Item', '2183000', 'NA', '5 ml', 1),
(3257, 10, 21, 1, 'Item', '2183001', 'NA', '5 ml', 1),
(3258, 10, 21, 1, 'Item', '2183002', 'NA', '5 ml', 1),
(3259, 10, 21, 1, 'Item', '2183003', 'NA', '5 ml', 1),
(3260, 10, 21, 1, 'Item', '2183004', 'NA', '5 ml', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tp_package_unit`
--

CREATE TABLE `tp_package_unit` (
  `id` smallint UNSIGNED NOT NULL,
  `package_sn` int UNSIGNED DEFAULT NULL COMMENT 'Starts with 1 - Later implement',
  `lot_id` smallint DEFAULT NULL,
  `product_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pack_type_id` smallint DEFAULT NULL,
  `package_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `package_level` smallint UNSIGNED NOT NULL DEFAULT '3',
  `parent_package_case_id` smallint DEFAULT NULL,
  `product_gtin` varchar(14) DEFAULT NULL COMMENT 'Starts with Zero',
  `inner_package_count` smallint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tp_pallet`
--

CREATE TABLE `tp_pallet` (
  `id` int NOT NULL,
  `pallet_serial_no` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `no_of_cases` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sscc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tp_product_dispatch`
--

CREATE TABLE `tp_product_dispatch` (
  `id` smallint UNSIGNED NOT NULL COMMENT 'ID Dispatch Id',
  `product_id` smallint UNSIGNED DEFAULT NULL,
  `pallet_id` smallint UNSIGNED DEFAULT NULL,
  `case_id` smallint UNSIGNED DEFAULT NULL,
  `primary_pack_id` smallint UNSIGNED DEFAULT NULL,
  `lot_id` smallint UNSIGNED NOT NULL DEFAULT '1',
  `iot_tracking_id` smallint DEFAULT NULL COMMENT 'FK - IOT API Fire',
  `from_owner_id` smallint DEFAULT NULL,
  `to_owner_id` smallint DEFAULT NULL,
  `lsp_provider_id` smallint DEFAULT NULL,
  `from_address_id` smallint DEFAULT NULL,
  `to_address_id` smallint DEFAULT NULL,
  `lsp_address_id` smallint DEFAULT NULL,
  `location_id` smallint UNSIGNED DEFAULT NULL,
  `owner_id` smallint UNSIGNED NOT NULL,
  `from_user_id` int DEFAULT NULL,
  `to_user_id` int DEFAULT NULL,
  `lsp_user_id` int DEFAULT NULL,
  `sscc_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'SSCC 16 digit',
  `GRAI` varchar(50) DEFAULT NULL,
  `GIAI` varchar(50) DEFAULT NULL,
  `consigner` varchar(50) DEFAULT NULL COMMENT 'Owner-Seller',
  `lsp_provider` varchar(100) DEFAULT NULL COMMENT 'LSP_Custodian',
  `consignee` varchar(50) DEFAULT NULL COMMENT 'Owner-Buyer',
  `sender_location` varchar(100) DEFAULT NULL COMMENT 'SENDER-CITY',
  `sender_loc_gln` varchar(15) DEFAULT NULL COMMENT 'JOin - Location name',
  `dispatch_location` varchar(100) DEFAULT NULL COMMENT 'BUYER-CITY',
  `dispatch_loc_gln` varchar(15) DEFAULT NULL,
  `container_dimensions` varchar(50) DEFAULT NULL,
  `package_dimentions` varchar(100) DEFAULT NULL,
  `package_net_weight` varchar(50) DEFAULT NULL,
  `package_gross_weight` varchar(50) DEFAULT NULL,
  `purchase_order` varchar(20) DEFAULT NULL,
  `order_qty` varchar(20) NOT NULL,
  `sale_order` varchar(20) DEFAULT NULL,
  `package_type` varchar(20) DEFAULT 'PALLET',
  `package_inside_units` int UNSIGNED DEFAULT NULL COMMENT 'Cases',
  `package_inside_salable_units` varchar(20) DEFAULT NULL COMMENT 'Salable',
  `delivary_date` varchar(50) DEFAULT 'NA',
  `invoice_no` varchar(11) NOT NULL DEFAULT 'NA',
  `packaging_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_status` varchar(30) DEFAULT NULL COMMENT 'OrderPlaced,SO, SHIPP, HANDOOF, LSP, RECEIVED',
  `recall` varchar(50) NOT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tp_product_dispatch`
--

INSERT INTO `tp_product_dispatch` (`id`, `product_id`, `pallet_id`, `case_id`, `primary_pack_id`, `lot_id`, `iot_tracking_id`, `from_owner_id`, `to_owner_id`, `lsp_provider_id`, `from_address_id`, `to_address_id`, `lsp_address_id`, `location_id`, `owner_id`, `from_user_id`, `to_user_id`, `lsp_user_id`, `sscc_no`, `GRAI`, `GIAI`, `consigner`, `lsp_provider`, `consignee`, `sender_location`, `sender_loc_gln`, `dispatch_location`, `dispatch_loc_gln`, `container_dimensions`, `package_dimentions`, `package_net_weight`, `package_gross_weight`, `purchase_order`, `order_qty`, `sale_order`, `package_type`, `package_inside_units`, `package_inside_salable_units`, `delivary_date`, `invoice_no`, `packaging_time`, `order_status`, `recall`, `is_active`) VALUES
(1, 1, 1, 1, 1, 1, 1, 1, 20, 21, 1, 19, 20, 1, 1, NULL, NULL, NULL, '0089060925896540510', '56985623', '41256985', 'Taj Pharmaceuticals Pvt Ltd', 'DHL Logistics', 'Firstline Pharma Distibutors', 'Reg.off: Unit 214, 2nd Floor,BAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Ravalco House, Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PO56325401', '10 Units', 'PO56325401', 'Pallet', 5, '10', '2021-10-02T06:28:22Z', '45879632589', '2021-09-02 06:28:22', 'Delivered', 'NA', 1),
(2, 1, 2, 2, 2, 1, 1, 1, 20, 21, 1, 19, 20, 1, 1, NULL, NULL, NULL, '0089060925896540510', '56985623', '41256985', 'Taj Pharmaceuticals Pvt Ltd', 'DHL Logistics', 'Firstline Pharma Distibutors', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Ravalco House, Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PO56325401', '10 Units', 'PO56325401', 'Pallet', 5, '10', '2021-10-02T06:28:22Z', '45879632589', '2021-09-02 06:28:22', 'Delivered', 'NA', 1),
(3, 1, 3, 3, 3, 1, 1, 1, 20, 21, 1, 19, 20, 1, 1, NULL, NULL, NULL, '0089060925896540510', '56985623', '41256985', 'Taj Pharmaceuticals Pvt Ltd', 'DHL Logistics', 'Firstline Pharma Distibutors', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Ravalco House, Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PO56325401', '10 Units', 'PO56325401', 'Pallet', 5, '10', '2021-10-02T06:28:22Z', '45879632589', '2021-09-02 06:28:22', 'Delivered', 'NA', 1),
(4, 1, 4, 4, 4, 1, 1, 1, 20, 21, 1, 19, 20, 1, 1, NULL, NULL, NULL, '0089060925896540510', '56985623', '41256985', 'Taj Pharmaceuticals Pvt Ltd', 'DHL Logistics', 'Firstline Pharma Distibutors', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Ravalco House, Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PO56325401', '10 Units', 'PO56325401', 'Pallet', 5, '10', '2021-10-02T06:28:22Z', '45879632589', '2021-09-02 06:28:22', 'Delivered', 'NA', 1),
(5, 1, 5, 5, 5, 1, 1, 1, 20, 21, 1, 19, 20, 1, 1, NULL, NULL, NULL, '0089060925896540510', '56985623', '41256985', 'Taj Pharmaceuticals Pvt Ltd', 'DHL Logistics', 'Firstline Pharma Distibutors', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Ravalco House, Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PO56325401', '10 Units', 'PO56325401', 'Pallet', 5, '10', '2021-10-02T06:28:22Z', '45879632589', '2021-09-02 06:28:22', 'Delivered', 'NA', 1),
(6, 1, 6, 6, 6, 1, 1, 1, 20, 21, 1, 19, 20, 1, 1, NULL, NULL, NULL, '0089060925896540510', '56985623', '41256985', 'Taj Pharmaceuticals Pvt Ltd', 'DHL Logistics', 'Firstline Pharma Distibutors', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Ravalco House, Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PO56325401', '10 Units', 'PO56325401', 'Pallet', 5, '10', '2021-10-02T06:28:22Z', '45879632589', '2021-09-02 06:28:22', 'Delivered', 'NA', 1),
(7, 1, 7, 7, 7, 1, 1, 1, 20, 21, 1, 19, 20, 1, 1, NULL, NULL, NULL, '0089060925896540510', '56985623', '41256985', 'Taj Pharmaceuticals Pvt Ltd', 'DHL Logistics', 'Firstline Pharma Distibutors', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Ravalco House, Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PO56325401', '10 Units', 'PO56325401', 'Pallet', 5, '10', '2021-10-02T06:28:22Z', '45879632589', '2021-09-02 06:28:22', 'Delivered', 'NA', 1),
(8, 1, 8, 8, 8, 1, 1, 1, 20, 21, 1, 19, 20, 1, 1, NULL, NULL, NULL, '0089060925896540510', '56985623', '41256985', 'Taj Pharmaceuticals Pvt Ltd', 'DHL Logistics', 'Firstline Pharma Distibutors', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Ravalco House, Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PO56325401', '10 Units', 'PO56325401', 'Pallet', 5, '10', '2021-10-02T06:28:22Z', '45879632589', '2021-09-02 06:28:22', 'Delivered', 'NA', 1),
(9, 1, 9, 9, 9, 1, 1, 1, 20, 21, 1, 19, 20, 1, 1, NULL, NULL, NULL, '0089060925896540510', '56985623', '41256985', 'Taj Pharmaceuticals Pvt Ltd', 'DHL Logistics', 'Firstline Pharma Distibutors', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Ravalco House, Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PO56325401', '10 Units', 'PO56325401', 'Pallet', 5, '10', '2021-10-02T06:28:22Z', '45879632589', '2021-09-02 06:28:22', 'Delivered', 'NA', 1),
(10, 1, 10, 10, 10, 1, 1, 1, 20, 21, 1, 19, 20, 1, 1, NULL, NULL, NULL, '0089060925896540510', '56985623', '41256985', 'Taj Pharmaceuticals Pvt Ltd', 'DHL Logistics', 'Firstline Pharma Distibutors', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Ravalco House, Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PO56325401', '10 Units', 'PO56325401', 'Pallet', 5, '10', '2021-10-02T06:28:22Z', '45879632589', '2021-09-02 06:28:22', 'Delivered', 'NA', 1),
(11, 1, 11, 11, 11, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(12, 1, 12, 12, 12, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(13, 1, 13, 13, 13, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(14, 1, 14, 14, 14, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(15, 1, 15, 15, 15, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(16, 1, 16, 16, 16, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(17, 1, 17, 17, 17, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(18, 1, 18, 18, 18, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(19, 1, 19, 19, 19, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(20, 1, 20, 20, 20, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(21, 1, 21, 21, 21, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(22, 1, 22, 22, 22, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(23, 1, 23, 23, 23, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(24, 1, 24, 24, 24, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(25, 1, 25, 25, 25, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(26, 1, 26, 26, 26, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(27, 1, 27, 27, 27, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(28, 1, 28, 28, 28, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(29, 1, 29, 29, 29, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(30, 1, 30, 30, 30, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(31, 1, 31, 31, 31, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(32, 1, 32, 32, 32, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(33, 1, 33, 33, 33, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(34, 1, 34, 34, 34, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(35, 1, 35, 35, 35, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(36, 1, 36, 36, 36, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(37, 1, 37, 37, 37, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(38, 1, 38, 38, 38, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(39, 1, 39, 39, 39, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(40, 1, 40, 40, 40, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(41, 1, 41, 41, 41, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(42, 1, 42, 42, 42, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(43, 1, 43, 43, 43, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(44, 1, 44, 44, 44, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(45, 1, 45, 45, 45, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(46, 1, 46, 46, 46, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(47, 1, 47, 47, 47, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(48, 1, 48, 48, 48, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(49, 1, 49, 49, 49, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(50, 1, 50, 50, 50, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(51, 1, 51, 51, 51, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(52, 1, 52, 52, 52, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(53, 1, 53, 53, 53, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(54, 1, 54, 54, 54, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(55, 1, 55, 55, 55, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(56, 1, 56, 56, 56, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(57, 1, 57, 57, 57, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(58, 1, 58, 58, 58, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(59, 1, 59, 59, 59, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(60, 1, 60, 60, 60, 19, 1, 2, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(61, 1, 61, 61, 61, 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(62, 1, 62, 62, 62, 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(63, 1, 63, 63, 63, 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(64, 1, 64, 64, 64, 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(65, 1, 65, 65, 65, 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(66, 1, 66, 66, 66, 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(67, 1, 67, 67, 67, 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(68, 1, 68, 68, 68, 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(69, 1, 69, 69, 69, 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(70, 1, 70, 70, 70, 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, NULL, NULL, NULL, '394411015399922000', '45671234', '9504000220L1-108-IND', 'Taj Pharmaceuticals Pvt Ltd', 'FeDex Logistics', 'Altana Pharma Ltd', 'Reg.off: Unit 214, 2nd Floor,\nBAKE HOUSE No. 16/22,Mumbai,Maharastra,400001', '890609662253', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '4400425006235', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '450 Kgs', 'PODFRT_09231', '3000', 'PODFRT_09231', 'Pallet', 6, '60', '2021-10-02T06:28:22Z', '4587963', '2021-09-18 08:43:00', 'Intransist', 'NA', 1),
(71, 1, 71, 71, 1, 1, 1, 20, 22, 23, 19, 22, 21, 84, 88, NULL, NULL, NULL, '0089060925896530210', '56985623', '41256985', 'Firstline Pharma Distibutors', 'FeDex Logistics', 'Appolo Pharma', 'Ravalco House, Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632389654', 'VST Colony, Hyderabad, Telangana 500082', '630609662225', '', '', '550 Kgs', '500 Kgs', 'PODGE3', '400', '45896PO5', 'Pallet', 2, '4', 'NA', '45236985', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(72, 1, 71, 72, 2, 1, 1, 20, 22, 23, 19, 22, 21, 84, 88, NULL, NULL, NULL, '0089060925896530210', '56985623', '41256985', 'Firstline Pharma Distibutors', 'FeDex Logistics', 'Appolo Pharma', 'Ravalco House, Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632389654', 'VST Colony, Hyderabad, Telangana 500082', '630609662225', '', '', '550 Kgs', '500 Kgs', 'PODGE3', '400', '45896PO5', 'Pallet', 2, '4', 'NA', '45236985', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(73, 1, 71, 73, 3, 1, 1, 20, 22, 23, 19, 22, 21, 84, 88, NULL, NULL, NULL, '0089060925896530210', '56985623', '41256985', 'Firstline Pharma Distibutors', 'FeDex Logistics', 'Appolo Pharma', 'Ravalco House, Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632389654', 'VST Colony, Hyderabad, Telangana 500082', '630609662225', '', '', '550 Kgs', '500 Kgs', 'PODGE3', '400', '45896PO5', 'Pallet', 2, '4', 'NA', '45236985', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(74, 1, 71, 74, 4, 1, 1, 20, 22, 23, 19, 22, 21, 84, 88, NULL, NULL, NULL, '0089060925896530210', '56985623', '41256985', 'Firstline Pharma Distibutors', 'FeDex Logistics', 'Appolo Pharma', 'Ravalco House, Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632389654', 'VST Colony, Hyderabad, Telangana 500082', '630609662225', '', '', '550 Kgs', '500 Kgs', 'PODGE3', '400', '45896PO5', 'Pallet', 2, '4', 'NA', '45236985', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(75, 11, 75, 75, 71, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(76, 11, 76, 76, 72, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(77, 11, 77, 77, 73, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(78, 11, 78, 78, 74, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(79, 11, 79, 79, 75, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(80, 11, 80, 80, 76, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(81, 11, 81, 81, 77, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(82, 11, 82, 82, 78, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(83, 11, 83, 83, 79, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(84, 11, 84, 84, 80, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(85, 11, 85, 85, 81, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1);
INSERT INTO `tp_product_dispatch` (`id`, `product_id`, `pallet_id`, `case_id`, `primary_pack_id`, `lot_id`, `iot_tracking_id`, `from_owner_id`, `to_owner_id`, `lsp_provider_id`, `from_address_id`, `to_address_id`, `lsp_address_id`, `location_id`, `owner_id`, `from_user_id`, `to_user_id`, `lsp_user_id`, `sscc_no`, `GRAI`, `GIAI`, `consigner`, `lsp_provider`, `consignee`, `sender_location`, `sender_loc_gln`, `dispatch_location`, `dispatch_loc_gln`, `container_dimensions`, `package_dimentions`, `package_net_weight`, `package_gross_weight`, `purchase_order`, `order_qty`, `sale_order`, `package_type`, `package_inside_units`, `package_inside_salable_units`, `delivary_date`, `invoice_no`, `packaging_time`, `order_status`, `recall`, `is_active`) VALUES
(86, 11, 86, 86, 82, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(87, 11, 87, 87, 83, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(88, 11, 88, 88, 84, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(89, 11, 89, 89, 85, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(90, 11, 90, 90, 86, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(91, 11, 91, 91, 87, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(92, 11, 92, 92, 88, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(93, 11, 93, 93, 89, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(94, 11, 94, 94, 90, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(95, 11, 95, 95, 91, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(96, 11, 96, 96, 92, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(97, 11, 97, 97, 93, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(98, 11, 98, 98, 94, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(99, 11, 99, 99, 95, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(100, 11, 100, 100, 96, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(101, 11, 101, 101, 97, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(102, 11, 102, 102, 98, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(103, 11, 103, 103, 99, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(104, 11, 104, 104, 100, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(105, 11, 105, 105, 101, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(106, 11, 106, 106, 102, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(107, 11, 107, 107, 103, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(108, 11, 108, 108, 104, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(109, 11, 109, 109, 105, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(110, 11, 110, 110, 106, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(111, 11, 111, 111, 107, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(112, 11, 112, 112, 108, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(113, 11, 113, 113, 109, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(114, 11, 114, 114, 110, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(115, 11, 115, 115, 111, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(116, 11, 116, 116, 112, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(117, 11, 117, 117, 113, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(118, 11, 118, 118, 114, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(119, 11, 119, 119, 115, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(120, 11, 120, 120, 116, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(121, 11, 121, 121, 117, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(122, 11, 122, 122, 118, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(123, 11, 123, 123, 119, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(124, 11, 124, 124, 120, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(125, 11, 125, 125, 121, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(126, 11, 126, 126, 122, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(127, 11, 127, 127, 123, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(128, 11, 128, 128, 124, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(129, 11, 129, 129, 125, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(130, 11, 130, 130, 126, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(131, 11, 131, 131, 127, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(132, 11, 132, 132, 128, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(133, 11, 133, 133, 129, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(134, 11, 134, 134, 130, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(135, 11, 135, 135, 131, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(136, 11, 136, 136, 132, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(137, 11, 137, 137, 133, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(138, 11, 138, 138, 134, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(139, 11, 139, 139, 135, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(140, 11, 140, 140, 136, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(141, 11, 141, 141, 137, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(142, 11, 142, 142, 138, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(143, 11, 143, 143, 139, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(144, 11, 144, 144, 140, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(145, 11, 145, 145, 141, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(146, 11, 146, 146, 142, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(147, 11, 147, 147, 143, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(148, 11, 148, 148, 144, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(149, 11, 149, 149, 145, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(150, 11, 150, 150, 146, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(151, 11, 151, 151, 147, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(152, 11, 152, 152, 148, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(153, 11, 153, 153, 149, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(154, 11, 154, 154, 150, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(155, 11, 155, 155, 151, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(156, 11, 156, 156, 152, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(157, 11, 157, 157, 153, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(158, 11, 158, 158, 154, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(159, 11, 159, 159, 155, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(160, 11, 160, 160, 156, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(161, 11, 161, 161, 157, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(162, 11, 162, 162, 158, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(163, 11, 163, 163, 159, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(164, 11, 164, 164, 160, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(165, 11, 165, 165, 161, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(166, 11, 166, 166, 162, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(167, 11, 167, 167, 163, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(168, 11, 168, 168, 164, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(169, 11, 169, 169, 165, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(170, 11, 170, 170, 166, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(171, 11, 171, 171, 167, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(172, 11, 172, 172, 168, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(173, 11, 173, 173, 169, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(174, 11, 174, 174, 170, 11, 1, 11, 20, 23, 11, 19, 21, 85, 1, NULL, NULL, NULL, '0089060925896540500', '45821470', '25896314', 'Janssen Products LP', 'FeDex Logistics', 'Firstline Pharma Distributors', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '359676000006', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632589654', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '500 Kgs', '600 Kgs', 'POQE4510', '100 Units', 'POQE4510', 'Pallet', 10, '100', '2021-10-02T06:28:22Z', '45872514', '2021-09-02 06:28:00', 'Intransist', 'NA', 1),
(175, 2, 175, 175, 171, 2, 1, 2, 27, 23, 2, 23, 21, 87, 1, NULL, NULL, NULL, '0059062955896530100', '4587963', '5874521', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POQWE458', '100', 'POQWE458', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '258964785', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(176, 2, 176, 176, 172, 2, 1, 2, 27, 23, 2, 23, 21, 87, 1, NULL, NULL, NULL, '0059062955896530100', '4587963', '5874521', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POQWE458', '100', 'POQWE458', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '258964785', '2021-10-08 13:31:00', 'Intransist', 'NA', 1);
INSERT INTO `tp_product_dispatch` (`id`, `product_id`, `pallet_id`, `case_id`, `primary_pack_id`, `lot_id`, `iot_tracking_id`, `from_owner_id`, `to_owner_id`, `lsp_provider_id`, `from_address_id`, `to_address_id`, `lsp_address_id`, `location_id`, `owner_id`, `from_user_id`, `to_user_id`, `lsp_user_id`, `sscc_no`, `GRAI`, `GIAI`, `consigner`, `lsp_provider`, `consignee`, `sender_location`, `sender_loc_gln`, `dispatch_location`, `dispatch_loc_gln`, `container_dimensions`, `package_dimentions`, `package_net_weight`, `package_gross_weight`, `purchase_order`, `order_qty`, `sale_order`, `package_type`, `package_inside_units`, `package_inside_salable_units`, `delivary_date`, `invoice_no`, `packaging_time`, `order_status`, `recall`, `is_active`) VALUES
(177, 2, 177, 177, 173, 2, 1, 2, 27, 23, 2, 23, 21, 87, 1, NULL, NULL, NULL, '0059062955896530100', '4587963', '5874521', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POQWE458', '100', 'POQWE458', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '258964785', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(178, 2, 178, 178, 174, 2, 1, 2, 27, 23, 2, 23, 21, 87, 1, NULL, NULL, NULL, '0059062955896530100', '4587963', '5874521', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POQWE458', '100', 'POQWE458', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '258964785', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(179, 2, 179, 179, 175, 2, 1, 2, 27, 23, 2, 23, 21, 87, 1, NULL, NULL, NULL, '0059062955896530100', '4587963', '5874521', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POQWE458', '100', 'POQWE458', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '258964785', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(180, 2, 180, 180, 176, 2, 1, 2, 27, 23, 2, 23, 21, 87, 1, NULL, NULL, NULL, '0059062955896530100', '4587963', '5874521', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POQWE458', '100', 'POQWE458', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '258964785', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(181, 2, 181, 181, 177, 2, 1, 2, 27, 23, 2, 23, 21, 87, 1, NULL, NULL, NULL, '0059062955896530100', '4587963', '5874521', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POQWE458', '100', 'POQWE458', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '258964785', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(182, 2, 182, 182, 178, 2, 1, 2, 27, 23, 2, 23, 21, 87, 1, NULL, NULL, NULL, '0059062955896530100', '4587963', '5874521', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POQWE458', '100', 'POQWE458', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '258964785', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(183, 2, 183, 183, 179, 2, 1, 2, 27, 23, 2, 23, 21, 87, 1, NULL, NULL, NULL, '0059062955896530100', '4587963', '5874521', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POQWE458', '100', 'POQWE458', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '258964785', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(184, 2, 184, 184, 180, 2, 1, 2, 27, 23, 2, 23, 21, 87, 1, NULL, NULL, NULL, '0059062955896530100', '4587963', '5874521', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POQWE458', '100', 'POQWE458', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '258964785', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(185, 3, 185, 185, 181, 3, 1, 3, 28, 23, 3, 24, 21, 86, 1, NULL, NULL, NULL, '0049062955896570300', '4587964', '5874522', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POOWE558', '100', 'POOWE558', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '258964705', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(186, 3, 186, 186, 182, 3, 1, 3, 28, 23, 3, 24, 21, 86, 1, NULL, NULL, NULL, '0049062955896570300', '4587964', '5874522', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POOWE558', '100', 'POOWE558', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '258964705', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(187, 3, 187, 187, 183, 3, 1, 3, 28, 23, 3, 24, 21, 86, 1, NULL, NULL, NULL, '0049062955896570300', '4587964', '5874522', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POOWE558', '100', 'POOWE558', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '258964705', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(188, 3, 188, 188, 184, 3, 1, 3, 28, 23, 3, 24, 21, 86, 1, NULL, NULL, NULL, '0049062955896570300', '4587964', '5874522', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POOWE558', '100', 'POOWE558', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '258964705', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(189, 3, 189, 189, 185, 3, 1, 3, 28, 23, 3, 24, 21, 86, 1, NULL, NULL, NULL, '0049062955896570300', '4587964', '5874522', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POOWE558', '100', 'POOWE558', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '258964705', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(190, 3, 190, 190, 186, 3, 1, 3, 28, 23, 3, 24, 21, 86, 1, NULL, NULL, NULL, '0049062955896570300', '4587964', '5874522', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POOWE558', '100', 'POOWE558', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '258964705', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(191, 3, 191, 191, 187, 3, 1, 3, 28, 23, 3, 24, 21, 86, 1, NULL, NULL, NULL, '0049062955896570300', '4587964', '5874522', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POOWE558', '100', 'POOWE558', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '258964705', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(192, 3, 192, 192, 188, 3, 1, 3, 28, 23, 3, 24, 21, 86, 1, NULL, NULL, NULL, '0049062955896570300', '4587964', '5874522', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POOWE558', '100', 'POOWE558', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '258964705', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(193, 3, 193, 193, 189, 3, 1, 3, 28, 23, 3, 24, 21, 86, 1, NULL, NULL, NULL, '0049062955896570300', '4587964', '5874522', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POOWE558', '100', 'POOWE558', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '258964705', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(194, 3, 194, 194, 190, 3, 1, 3, 28, 23, 3, 24, 21, 86, 1, NULL, NULL, NULL, '0049062955896570300', '4587964', '5874522', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POOWE558', '100', 'POOWE558', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '258964705', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(195, 6, 195, 195, 191, 6, 1, 6, 29, 23, 6, 25, 21, 88, 1, NULL, NULL, NULL, '0069062955896570600', '4587965', '5874523', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POSWE508', '100', 'POSWE508', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '258964701', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(196, 6, 196, 196, 192, 6, 1, 6, 29, 23, 6, 25, 21, 88, 1, NULL, NULL, NULL, '0069062955896570600', '4587965', '5874523', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POSWE508', '100', 'POSWE508', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '258964701', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(197, 6, 197, 197, 193, 6, 1, 6, 29, 23, 6, 25, 21, 88, 1, NULL, NULL, NULL, '0069062955896570600', '4587965', '5874523', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POSWE508', '100', 'POSWE508', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '258964701', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(198, 6, 198, 198, 194, 6, 1, 6, 29, 23, 6, 25, 21, 88, 1, NULL, NULL, NULL, '0069062955896570600', '4587965', '5874523', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POSWE508', '100', 'POSWE508', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '258964701', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(199, 6, 199, 199, 195, 6, 1, 6, 29, 23, 6, 25, 21, 88, 1, NULL, NULL, NULL, '0069062955896570600', '4587965', '5874523', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POSWE508', '100', 'POSWE508', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '258964701', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(200, 6, 200, 200, 196, 6, 1, 6, 29, 23, 6, 25, 21, 88, 1, NULL, NULL, NULL, '0069062955896570600', '4587965', '5874523', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POSWE508', '100', 'POSWE508', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '258964701', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(201, 6, 201, 201, 197, 6, 1, 6, 29, 23, 6, 25, 21, 88, 1, NULL, NULL, NULL, '0069062955896570600', '4587965', '5874523', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POSWE508', '100', 'POSWE508', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '258964701', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(202, 6, 202, 202, 198, 6, 1, 6, 29, 23, 6, 25, 21, 88, 1, NULL, NULL, NULL, '0069062955896570600', '4587965', '5874523', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POSWE508', '100', 'POSWE508', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '258964701', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(203, 6, 203, 203, 199, 6, 1, 6, 29, 23, 6, 25, 21, 88, 1, NULL, NULL, NULL, '0069062955896570600', '4587965', '5874523', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POSWE508', '100', 'POSWE508', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '258964701', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(204, 6, 204, 204, 200, 6, 1, 6, 29, 23, 6, 25, 21, 88, 1, NULL, NULL, NULL, '0069062955896570600', '4587965', '5874523', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POSWE508', '100', 'POSWE508', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '258964701', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(205, 7, 205, 205, 201, 7, 1, 7, 27, 21, 7, 23, 20, 89, 1, NULL, NULL, NULL, '0079062955896570700', '4587966', '5874524', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POSWE998', '100', 'POSWE998', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '258064701', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(206, 7, 206, 206, 202, 7, 1, 7, 27, 21, 7, 23, 20, 89, 1, NULL, NULL, NULL, '0079062955896570700', '4587966', '5874524', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POSWE998', '100', 'POSWE998', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '258064701', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(207, 7, 207, 207, 203, 7, 1, 7, 27, 21, 7, 23, 20, 89, 1, NULL, NULL, NULL, '0079062955896570700', '4587966', '5874524', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POSWE998', '100', 'POSWE998', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '258064701', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(208, 7, 208, 208, 204, 7, 1, 7, 27, 21, 7, 23, 20, 89, 1, NULL, NULL, NULL, '0079062955896570700', '4587966', '5874524', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POSWE998', '100', 'POSWE998', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '258064701', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(209, 7, 209, 209, 205, 7, 1, 7, 27, 21, 7, 23, 20, 89, 1, NULL, NULL, NULL, '0079062955896570700', '4587966', '5874524', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POSWE998', '100', 'POSWE998', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '258064701', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(210, 7, 210, 210, 206, 7, 1, 7, 27, 21, 7, 23, 20, 89, 1, NULL, NULL, NULL, '0079062955896570700', '4587966', '5874524', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POSWE998', '100', 'POSWE998', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '258064701', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(211, 7, 211, 211, 207, 7, 1, 7, 27, 21, 7, 23, 20, 89, 1, NULL, NULL, NULL, '0079062955896570700', '4587966', '5874524', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POSWE998', '100', 'POSWE998', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '258064701', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(212, 7, 212, 212, 208, 7, 1, 7, 27, 21, 7, 23, 20, 89, 1, NULL, NULL, NULL, '0079062955896570700', '4587966', '5874524', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POSWE998', '100', 'POSWE998', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '258064701', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(213, 7, 213, 213, 209, 7, 1, 7, 27, 21, 7, 23, 20, 89, 1, NULL, NULL, NULL, '0079062955896570700', '4587966', '5874524', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POSWE998', '100', 'POSWE998', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '258064701', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(214, 7, 214, 214, 210, 7, 1, 7, 27, 21, 7, 23, 20, 89, 1, NULL, NULL, NULL, '0079062955896570700', '4587966', '5874524', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POSWE998', '100', 'POSWE998', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '258064701', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(215, 8, 215, 215, 211, 8, 1, 8, 28, 21, 8, 24, 20, 90, 1, NULL, NULL, NULL, '0089062955896070800', '4587967', '5874525', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POSQE098', '100', 'POSQE098', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064701', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(216, 8, 216, 216, 212, 8, 1, 8, 28, 21, 8, 24, 20, 90, 1, NULL, NULL, NULL, '0089062955896070800', '4587967', '5874525', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POSQE098', '100', 'POSQE098', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064701', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(217, 8, 217, 217, 213, 8, 1, 8, 28, 21, 8, 24, 20, 90, 1, NULL, NULL, NULL, '0089062955896070800', '4587967', '5874525', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POSQE098', '100', 'POSQE098', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064701', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(218, 8, 218, 218, 214, 8, 1, 8, 28, 21, 8, 24, 20, 90, 1, NULL, NULL, NULL, '0089062955896070800', '4587967', '5874525', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POSQE098', '100', 'POSQE098', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064701', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(219, 8, 219, 219, 215, 8, 1, 8, 28, 21, 8, 24, 20, 90, 1, NULL, NULL, NULL, '0089062955896070800', '4587967', '5874525', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POSQE098', '100', 'POSQE098', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064701', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(220, 8, 220, 220, 216, 8, 1, 8, 28, 21, 8, 24, 20, 90, 1, NULL, NULL, NULL, '0089062955896070800', '4587967', '5874525', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POSQE098', '100', 'POSQE098', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064701', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(221, 8, 221, 221, 217, 8, 1, 8, 28, 21, 8, 24, 20, 90, 1, NULL, NULL, NULL, '0089062955896070800', '4587967', '5874525', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POSQE098', '100', 'POSQE098', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064701', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(222, 8, 222, 222, 218, 8, 1, 8, 28, 21, 8, 24, 20, 90, 1, NULL, NULL, NULL, '0089062955896070800', '4587967', '5874525', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POSQE098', '100', 'POSQE098', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064701', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(223, 8, 223, 223, 219, 8, 1, 8, 28, 21, 8, 24, 20, 90, 1, NULL, NULL, NULL, '0089062955896070800', '4587967', '5874525', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POSQE098', '100', 'POSQE098', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064701', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(224, 8, 224, 224, 220, 8, 1, 8, 28, 21, 8, 24, 20, 90, 1, NULL, NULL, NULL, '0089062955896070800', '4587967', '5874525', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POSQE098', '100', 'POSQE098', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064701', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(225, 9, 225, 225, 221, 9, 1, 9, 29, 23, 9, 25, 21, 91, 1, NULL, NULL, NULL, '0089060055896070800', '4587968', '5874526', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POSRE638', '100', 'POSRE638', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064101', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(226, 9, 226, 226, 222, 9, 1, 9, 29, 23, 9, 25, 21, 91, 1, NULL, NULL, NULL, '0089060055896070800', '4587968', '5874526', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POSRE638', '100', 'POSRE638', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064101', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(227, 9, 227, 227, 223, 9, 1, 9, 29, 23, 9, 25, 21, 91, 1, NULL, NULL, NULL, '0089060055896070800', '4587968', '5874526', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POSRE638', '100', 'POSRE638', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064101', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(228, 9, 228, 228, 224, 9, 1, 9, 29, 23, 9, 25, 21, 91, 1, NULL, NULL, NULL, '0089060055896070800', '4587968', '5874526', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POSRE638', '100', 'POSRE638', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064101', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(229, 9, 229, 229, 225, 9, 1, 9, 29, 23, 9, 25, 21, 91, 1, NULL, NULL, NULL, '0089060055896070800', '4587968', '5874526', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POSRE638', '100', 'POSRE638', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064101', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(230, 9, 230, 230, 226, 9, 1, 9, 29, 23, 9, 25, 21, 91, 1, NULL, NULL, NULL, '0089060055896070800', '4587968', '5874526', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POSRE638', '100', 'POSRE638', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064101', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(231, 9, 231, 231, 227, 9, 1, 9, 29, 23, 9, 25, 21, 91, 1, NULL, NULL, NULL, '0089060055896070800', '4587968', '5874526', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POSRE638', '100', 'POSRE638', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064101', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(232, 9, 232, 232, 228, 9, 1, 9, 29, 23, 9, 25, 21, 91, 1, NULL, NULL, NULL, '0089060055896070800', '4587968', '5874526', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POSRE638', '100', 'POSRE638', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064101', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(233, 9, 233, 233, 229, 9, 1, 9, 29, 23, 9, 25, 21, 91, 1, NULL, NULL, NULL, '0089060055896070800', '4587968', '5874526', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POSRE638', '100', 'POSRE638', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064101', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(234, 9, 234, 234, 230, 9, 1, 9, 29, 23, 9, 25, 21, 91, 1, NULL, NULL, NULL, '0089060055896070800', '4587968', '5874526', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POSRE638', '100', 'POSRE638', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064101', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(235, 10, 235, 235, 231, 10, 1, 10, 27, 23, 10, 23, 21, 92, 1, NULL, NULL, NULL, '0089060011896470800', '4587969', '5874527', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POCRE608', '100', 'POCRE608', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064199', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(236, 10, 236, 236, 232, 10, 1, 10, 27, 23, 10, 23, 21, 92, 1, NULL, NULL, NULL, '0089060011896470800', '4587969', '5874527', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POCRE608', '100', 'POCRE608', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064199', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(237, 10, 237, 237, 233, 10, 1, 10, 27, 23, 10, 23, 21, 92, 1, NULL, NULL, NULL, '0089060011896470800', '4587969', '5874527', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POCRE608', '100', 'POCRE608', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064199', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(238, 10, 238, 238, 234, 10, 1, 10, 27, 23, 10, 23, 21, 92, 1, NULL, NULL, NULL, '0089060011896470800', '4587969', '5874527', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POCRE608', '100', 'POCRE608', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064199', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(239, 10, 239, 239, 235, 10, 1, 10, 27, 23, 10, 23, 21, 92, 1, NULL, NULL, NULL, '0089060011896470800', '4587969', '5874527', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POCRE608', '100', 'POCRE608', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064199', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(240, 10, 240, 240, 236, 10, 1, 10, 27, 23, 10, 23, 21, 92, 1, NULL, NULL, NULL, '0089060011896470800', '4587969', '5874527', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POCRE608', '100', 'POCRE608', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064199', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(241, 10, 241, 241, 237, 10, 1, 10, 27, 23, 10, 23, 21, 92, 1, NULL, NULL, NULL, '0089060011896470800', '4587969', '5874527', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POCRE608', '100', 'POCRE608', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064199', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(242, 10, 242, 242, 238, 10, 1, 10, 27, 23, 10, 23, 21, 92, 1, NULL, NULL, NULL, '0089060011896470800', '4587969', '5874527', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POCRE608', '100', 'POCRE608', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064199', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(243, 10, 243, 243, 239, 10, 1, 10, 27, 23, 10, 23, 21, 92, 1, NULL, NULL, NULL, '0089060011896470800', '4587969', '5874527', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POCRE608', '100', 'POCRE608', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064199', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(244, 10, 244, 244, 240, 10, 1, 10, 27, 23, 10, 23, 21, 92, 1, NULL, NULL, NULL, '0089060011896470800', '4587969', '5874527', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POCRE608', '100', 'POCRE608', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064199', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(245, 12, 245, 245, 241, 12, 1, 12, 28, 23, 12, 24, 21, 93, 1, NULL, NULL, NULL, '0089060011111470800', '4587970', '5874571', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POCRE948', '100', 'POCRE948', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064178', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(246, 12, 246, 246, 242, 12, 1, 12, 28, 23, 12, 24, 21, 93, 1, NULL, NULL, NULL, '0089060011111470800', '4587970', '5874571', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POCRE948', '100', 'POCRE948', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064178', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(247, 12, 247, 247, 243, 12, 1, 12, 28, 23, 12, 24, 21, 93, 1, NULL, NULL, NULL, '0089060011111470800', '4587970', '5874571', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POCRE948', '100', 'POCRE948', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064178', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(248, 12, 248, 248, 244, 12, 1, 12, 28, 23, 12, 24, 21, 93, 1, NULL, NULL, NULL, '0089060011111470800', '4587970', '5874571', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POCRE948', '100', 'POCRE948', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064178', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(249, 12, 249, 249, 245, 12, 1, 12, 28, 23, 12, 24, 21, 93, 1, NULL, NULL, NULL, '0089060011111470800', '4587970', '5874571', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POCRE948', '100', 'POCRE948', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064178', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(250, 12, 250, 250, 246, 12, 1, 12, 28, 23, 12, 24, 21, 93, 1, NULL, NULL, NULL, '0089060011111470800', '4587970', '5874571', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POCRE948', '100', 'POCRE948', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064178', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(251, 12, 251, 251, 247, 12, 1, 12, 28, 23, 12, 24, 21, 93, 1, NULL, NULL, NULL, '0089060011111470800', '4587970', '5874571', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POCRE948', '100', 'POCRE948', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064178', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(252, 12, 252, 252, 248, 12, 1, 12, 28, 23, 12, 24, 21, 93, 1, NULL, NULL, NULL, '0089060011111470800', '4587970', '5874571', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POCRE948', '100', 'POCRE948', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064178', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(253, 12, 253, 253, 249, 12, 1, 12, 28, 23, 12, 24, 21, 93, 1, NULL, NULL, NULL, '0089060011111470800', '4587970', '5874571', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POCRE948', '100', 'POCRE948', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064178', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(254, 12, 254, 254, 250, 12, 1, 12, 28, 23, 12, 24, 21, 93, 1, NULL, NULL, NULL, '0089060011111470800', '4587970', '5874571', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POCRE948', '100', 'POCRE948', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064178', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(255, 13, 255, 255, 251, 13, 1, 13, 29, 23, 13, 25, 21, 94, 1, NULL, NULL, NULL, '0089060011100000800', '4587971', '5874572', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POCRE008', '100', 'POCRE008', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064888', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(256, 13, 256, 256, 252, 13, 1, 13, 29, 23, 13, 25, 21, 94, 1, NULL, NULL, NULL, '0089060011100000800', '4587971', '5874572', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POCRE008', '100', 'POCRE008', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064888', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(257, 13, 257, 257, 253, 13, 1, 13, 29, 23, 13, 25, 21, 94, 1, NULL, NULL, NULL, '0089060011100000800', '4587971', '5874572', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POCRE008', '100', 'POCRE008', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064888', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(258, 13, 258, 258, 254, 13, 1, 13, 29, 23, 13, 25, 21, 94, 1, NULL, NULL, NULL, '0089060011100000800', '4587971', '5874572', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POCRE008', '100', 'POCRE008', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064888', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(259, 13, 259, 259, 255, 13, 1, 13, 29, 23, 13, 25, 21, 94, 1, NULL, NULL, NULL, '0089060011100000800', '4587971', '5874572', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POCRE008', '100', 'POCRE008', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064888', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(260, 13, 260, 260, 256, 13, 1, 13, 29, 23, 13, 25, 21, 94, 1, NULL, NULL, NULL, '0089060011100000800', '4587971', '5874572', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POCRE008', '100', 'POCRE008', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064888', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(261, 13, 261, 261, 257, 13, 1, 13, 29, 23, 13, 25, 21, 94, 1, NULL, NULL, NULL, '0089060011100000800', '4587971', '5874572', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POCRE008', '100', 'POCRE008', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064888', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(262, 13, 262, 262, 258, 13, 1, 13, 29, 23, 13, 25, 21, 94, 1, NULL, NULL, NULL, '0089060011100000800', '4587971', '5874572', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POCRE008', '100', 'POCRE008', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064888', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(263, 13, 263, 263, 259, 13, 1, 13, 29, 23, 13, 25, 21, 94, 1, NULL, NULL, NULL, '0089060011100000800', '4587971', '5874572', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POCRE008', '100', 'POCRE008', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064888', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(264, 13, 264, 264, 260, 13, 1, 13, 29, 23, 13, 25, 21, 94, 1, NULL, NULL, NULL, '0089060011100000800', '4587971', '5874572', 'NA', 'NA', 'NA', 'NA', '555', 'NA', '555', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '450 Kgs', '500 Kgs', 'POCRE008', '100', 'POCRE008', 'Pallet', 5, '100', '2021-10-02T06:28:22Z', '218064888', '2021-10-08 13:31:00', 'Intransist', 'NA', 1),
(265, 10, 265, 265, 261, 21, 1, 10, 29, 23, 10, 25, 21, 95, 88, NULL, NULL, NULL, '8856987458963258741', 'SADE345', '456987KJ', 'Pfizer Inc', 'FeDex Logistics', 'Medgas Ltd', '100 US-206,Gladstone,USA-07934', '863772000001', 'Featherbed Lane, Shrewsbury, SY1 4YQ, UK', '2632229669854', '139\' x 110\' x 154\' Feet', '100\' x 70\' x 104\' Feet', '3000 Kgs', '3500 Kgs', 'POLK4582', '3000 Items', 'POLK4582', 'Pallet', 300, '3000', '2021-10-02T06:28:22Z', '45874521', '2021-09-02 06:28:00', 'NA', 'NA', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tp_product_dispatch_disp_to_retailer`
--

CREATE TABLE `tp_product_dispatch_disp_to_retailer` (
  `id` smallint UNSIGNED NOT NULL COMMENT 'ID Dispatch Id',
  `product_catelogue_id` smallint UNSIGNED NOT NULL,
  `location_id` smallint UNSIGNED DEFAULT NULL,
  `owner_id` smallint UNSIGNED NOT NULL,
  `sscc_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'SSCC 16 digit',
  `GRAI` varchar(50) DEFAULT NULL,
  `GIAI` varchar(50) DEFAULT NULL,
  `consigner` varchar(50) DEFAULT NULL COMMENT 'Owner-Seller',
  `lsp_provider` varchar(100) DEFAULT NULL COMMENT 'LSP_Custodian',
  `consignee` varchar(50) DEFAULT NULL COMMENT 'Owner-Buyer',
  `sender_location` varchar(100) DEFAULT NULL COMMENT 'SENDER-CITY',
  `sender_loc_gln` varchar(15) DEFAULT NULL COMMENT 'JOin - Location name',
  `dispatch_location` varchar(100) DEFAULT NULL COMMENT 'BUYER-CITY',
  `dispatch_loc_gln` varchar(15) DEFAULT NULL,
  `container_dimensions` varchar(50) DEFAULT NULL,
  `package_dimentions` varchar(100) DEFAULT NULL,
  `package_net_weight` varchar(50) DEFAULT NULL,
  `package_gross_weight` varchar(50) DEFAULT NULL,
  `purchase_order` varchar(20) DEFAULT NULL,
  `order_qty` varchar(20) NOT NULL,
  `sale_order` varchar(20) DEFAULT NULL,
  `package_type` varchar(20) DEFAULT 'PALLET',
  `package_inside_units` int UNSIGNED DEFAULT NULL COMMENT 'Cases',
  `package_inside_salable_units` varchar(20) DEFAULT NULL COMMENT 'Salable',
  `delivary_date` varchar(50) DEFAULT 'NA',
  `invoice_no` varchar(11) NOT NULL DEFAULT 'NA',
  `packaging_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_status` varchar(30) DEFAULT NULL COMMENT 'OrderPlaced,SO, SHIPP, HANDOOF, LSP, RECEIVED',
  `recall` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tp_product_dispatch_disp_to_retailer`
--

INSERT INTO `tp_product_dispatch_disp_to_retailer` (`id`, `product_catelogue_id`, `location_id`, `owner_id`, `sscc_no`, `GRAI`, `GIAI`, `consigner`, `lsp_provider`, `consignee`, `sender_location`, `sender_loc_gln`, `dispatch_location`, `dispatch_loc_gln`, `container_dimensions`, `package_dimentions`, `package_net_weight`, `package_gross_weight`, `purchase_order`, `order_qty`, `sale_order`, `package_type`, `package_inside_units`, `package_inside_salable_units`, `delivary_date`, `invoice_no`, `packaging_time`, `order_status`, `recall`) VALUES
(1, 1, 84, 88, '0089060925896530210', '56985623', '41256985', 'Firstline Pharma Distibutors', 'Orange Logistics', 'Appolo Pharma', 'Ravalco House, Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632389654', 'VST Colony, Hyderabad, Telangana 500082', '630609662225', '', '', '550 Kgs', '500 Kgs', 'PODGE3', '500 qty', '45896PO5', 'Pallet', 3, '5', 'NA', '45236985', '2021-10-05 13:05:00', 'Delivered', 'NA'),
(2, 2, 83, 87, '0089060925896530210', '56985623', '41256985', 'Firstline Pharma Distibutors', 'Orange Logistics', 'Appolo Pharma', 'Ravalco House, Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632389654', 'VST Colony, Hyderabad, Telangana 500082', '630609662225', '', '', '550 Kgs', '500 Kgs', 'PODGE3', '500 qty', '45896PO5', 'Pallet', 3, '5', 'NA', '45236985', '2021-10-05 13:05:00', 'Delivered', 'NA'),
(3, 3, 83, 87, '0089060925896530210', '56985623', '41256985', 'Firstline Pharma Distibutors', 'Orange Logistics', 'Appolo Pharma', 'Ravalco House, Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632389654', 'VST Colony, Hyderabad, Telangana 500082', '630609662225', '', '', '550 Kgs', '500 Kgs', 'PODGE3', '500 qty', '45896PO5', 'Pallet', 3, '5', 'NA', '45236985', '2021-10-05 13:05:00', 'Delivered', 'NA'),
(4, 4, 83, 87, '0089060925896530210', '56985623', '41256985', 'Firstline Pharma Distibutors', 'Orange Logistics', 'Appolo Pharma', 'Ravalco House, Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632389654', 'VST Colony, Hyderabad, Telangana 500082', '630609662225', '', '', '550 Kgs', '500 Kgs', 'PODGE3', '500 qty', '45896PO5', 'Pallet', 3, '5', 'NA', '45236985', '2021-10-05 13:05:00', 'Delivered', 'NA'),
(5, 5, 83, 87, '0089060925896530210', '56985623', '41256985', 'Firstline Pharma Distibutors', 'Orange Logistics', 'Appolo Pharma', 'Ravalco House, Cleveland Way, Hemel Hempstead HP2 7DL,UK', '6985632389654', 'VST Colony, Hyderabad, Telangana 500082', '630609662225', '', '', '550 Kgs', '500 Kgs', 'PODGE3', '500 qty', '45896PO5', 'Pallet', 3, '5', 'NA', '45236985', '2021-10-05 13:05:00', 'Delivered', 'NA');

-- --------------------------------------------------------

--
-- Table structure for table `tp_product_item`
--

CREATE TABLE `tp_product_item` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` smallint UNSIGNED DEFAULT NULL COMMENT 'FK',
  `lot_id` smallint UNSIGNED DEFAULT NULL COMMENT 'FK, covers po, prod_id',
  `item_serial_no` int UNSIGNED NOT NULL,
  `created_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'When',
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tp_product_items`
--

CREATE TABLE `tp_product_items` (
  `id` bigint UNSIGNED NOT NULL,
  `lot_id` smallint UNSIGNED DEFAULT NULL COMMENT 'FK, covers po, prod_id',
  `item_serial_no` int UNSIGNED NOT NULL,
  `created_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'When',
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tp_product_items`
--

INSERT INTO `tp_product_items` (`id`, `lot_id`, `item_serial_no`, `is_active`) VALUES
(83201, 1, 5167389, 1),
(83202, 1, 5167390, 1),
(83203, 1, 5167391, 1),
(83204, 2, 20800, 1),
(83205, 2, 21200, 1),
(83206, 3, 21201, 1),
(83207, 4, 21202, 1),
(83208, 4, 21203, 1),
(83209, 5, 21204, 1),
(83210, 5, 21205, 1),
(83211, 6, 21206, 1),
(83212, 6, 21207, 1),
(83213, 7, 21208, 1),
(83214, 7, 21209, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tp_product_lot`
--

CREATE TABLE `tp_product_lot` (
  `id` smallint UNSIGNED NOT NULL,
  `product_id` smallint UNSIGNED NOT NULL,
  `lot_id` smallint UNSIGNED DEFAULT NULL,
  `batch_no` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'BACG452',
  `lot_sn_start` int NOT NULL DEFAULT '1200001',
  `lot_sn_end` int NOT NULL DEFAULT '1201001',
  `product_package_id` smallint NOT NULL,
  `mfg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expiry_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total_qty` int NOT NULL DEFAULT '1000',
  `is_active` smallint NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tp_product_lot`
--

INSERT INTO `tp_product_lot` (`id`, `product_id`, `lot_id`, `batch_no`, `lot_sn_start`, `lot_sn_end`, `product_package_id`, `mfg_date`, `expiry_date`, `total_qty`, `is_active`) VALUES
(1, 1, 1, 'BACG452', 1200001, 1201001, 1, '2021-09-23 16:36:01', '2024-09-23 16:36:01', 1000, 1),
(2, 2, 2, 'HU74562', 1200001, 1201001, 2, '2021-09-23 16:36:03', '2024-09-23 16:36:03', 1000, 1),
(3, 3, 3, 'ACGQ452', 1200001, 1201001, 3, '2021-09-23 16:36:05', '2024-09-23 16:36:05', 1000, 1),
(6, 6, 6, 'KACG402', 1200001, 1201001, 6, '2021-09-23 16:36:11', '2024-09-23 16:36:11', 1000, 1),
(7, 7, 7, 'HGCG452', 1200001, 1201001, 7, '2021-09-23 16:36:13', '2024-09-23 16:36:13', 1000, 1),
(8, 8, 8, 'SDCG452', 1200001, 1201001, 8, '2021-09-23 16:36:15', '2024-09-23 16:36:15', 1000, 1),
(9, 9, 9, 'XCCG452', 1200001, 1201001, 9, '2021-09-23 16:36:17', '2024-09-23 16:36:17', 1000, 1),
(10, 10, 10, 'BACG452', 1200001, 1201001, 10, '2021-09-23 16:36:19', '2024-09-23 16:36:19', 1000, 1),
(11, 11, 11, '4587692', 1200001, 1201001, 11, '2021-09-23 16:36:21', '2024-09-23 16:36:21', 1000, 1),
(12, 12, 12, 'BACG452', 1200001, 1201001, 12, '2021-09-23 16:36:22', '2024-09-23 16:36:22', 1000, 1),
(13, 13, 13, 'BACG452', 1200001, 1201001, 13, '2021-09-23 16:36:23', '2024-09-23 16:36:23', 1000, 1),
(14, 14, 14, 'BACG452', 1200001, 1201001, 14, '2021-09-23 16:36:24', '2024-09-23 16:36:24', 1000, 1),
(15, 15, 15, 'BACG452', 1200001, 1201001, 15, '2021-09-23 16:36:26', '2024-09-23 16:36:26', 1000, 1),
(16, 16, 16, 'BACG452', 1200001, 1201001, 16, '2021-09-23 16:36:28', '2024-09-23 16:36:28', 1000, 1),
(17, 17, 17, 'BACG452', 1200001, 1201001, 17, '2021-09-23 16:36:29', '2024-09-23 16:36:29', 1000, 1),
(18, 18, 18, 'BACG452', 1200001, 1201001, 18, '2021-09-23 16:36:31', '2024-09-23 16:36:31', 1000, 1),
(19, 1, 1, '2589632', 100025, 101035, 1, '2021-09-24 21:26:00', '2023-10-24 21:26:00', 1000, 1),
(21, 10, 19, 'BNT169282', 120001, 130001, 19, '2021-11-29 14:42:00', '2025-10-29 14:42:00', 15000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tp_product_package`
--

CREATE TABLE `tp_product_package` (
  `id` smallint UNSIGNED NOT NULL,
  `product_gtin_id` smallint UNSIGNED DEFAULT NULL,
  `lot_id` smallint UNSIGNED NOT NULL,
  `pack_type_id` smallint DEFAULT NULL COMMENT 'FK to Package Type Id',
  `inner_package_qty` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tp_product_package`
--

INSERT INTO `tp_product_package` (`id`, `product_gtin_id`, `lot_id`, `pack_type_id`, `inner_package_qty`) VALUES
(1, 1, 1, 1, 100),
(2, 2, 2, 2, 10),
(3, 3, 3, 1, 10),
(6, 6, 6, 1, 10),
(7, 7, 7, 2, 10),
(8, 8, 8, 1, 10),
(9, 9, 9, 1, 10),
(10, 10, 10, 1, 10),
(11, 11, 11, 2, 10),
(12, 12, 12, 1, 10),
(13, 13, 13, 2, 10),
(14, 14, 14, 2, 10),
(15, 15, 15, 2, 10),
(16, 16, 17, 2, 10),
(17, 17, 17, 2, 10),
(18, 18, 18, 2, 10),
(19, 10, 21, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `tp_product_package_type`
--

CREATE TABLE `tp_product_package_type` (
  `id` smallint NOT NULL,
  `ndc_package_code` varchar(100) DEFAULT NULL,
  `package_desc` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tp_product_package_type`
--

INSERT INTO `tp_product_package_type` (`id`, `ndc_package_code`, `package_desc`) VALUES
(1, 'Bottle', 'Drugs will be stored on bottles'),
(2, 'Strip', 'Store Drugs on Strip');

-- --------------------------------------------------------

--
-- Table structure for table `tp_profile_access`
--

CREATE TABLE `tp_profile_access` (
  `id` smallint NOT NULL,
  `json_profile_access` varchar(4000) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tp_sales_shipment`
--

CREATE TABLE `tp_sales_shipment` (
  `id` smallint NOT NULL COMMENT 'product from a business to a customer that fulfills a sales order',
  `carrier_id` int DEFAULT NULL COMMENT 'FK-LSP',
  `origin_id` int DEFAULT NULL COMMENT 'FK-Locations',
  `destination_id` int DEFAULT NULL COMMENT 'FK-Locations',
  `sale_order_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tp_sale_order_line`
--

CREATE TABLE `tp_sale_order_line` (
  `id` smallint NOT NULL COMMENT 'Line orders in SO (Muitiple products order)',
  `sale_order_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tp_transactions`
--

CREATE TABLE `tp_transactions` (
  `id` smallint NOT NULL,
  `gs1_transaction_code` varchar(5) DEFAULT NULL,
  `transaction` varchar(200) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tp_transaction_events`
--

CREATE TABLE `tp_transaction_events` (
  `id` smallint UNSIGNED NOT NULL,
  `product_dispatch_id` smallint UNSIGNED NOT NULL,
  `tran_event_type_id` smallint UNSIGNED DEFAULT NULL,
  `from_owner_id` smallint DEFAULT NULL,
  `to_owner_id` smallint DEFAULT NULL,
  `current_owner_id` smallint DEFAULT NULL,
  `current_owner_address_id` smallint DEFAULT NULL,
  `transaction_timestamp` timestamp NULL DEFAULT NULL,
  `is_active` smallint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tp_transaction_events`
--

INSERT INTO `tp_transaction_events` (`id`, `product_dispatch_id`, `tran_event_type_id`, `from_owner_id`, `to_owner_id`, `current_owner_id`, `current_owner_address_id`, `transaction_timestamp`, `is_active`) VALUES
(1, 1, 1, 1, 21, 1, 1, '2021-09-09 22:25:00', 1),
(2, 2, 1, 1, 21, 1, 1, '2021-09-09 22:25:00', 1),
(3, 3, 1, 1, 21, 1, 1, '2021-09-09 22:25:00', 1),
(4, 4, 1, 1, 21, 1, 1, '2021-09-09 22:25:00', 1),
(5, 5, 1, 1, 21, 1, 1, '2021-09-09 22:25:00', 1),
(6, 6, 1, 1, 21, 1, 1, '2021-09-09 22:25:00', 1),
(7, 7, 1, 1, 21, 1, 1, '2021-09-09 22:25:00', 1),
(8, 8, 1, 1, 21, 1, 1, '2021-09-09 22:25:00', 1),
(9, 9, 1, 1, 21, 1, 1, '2021-09-09 22:25:00', 1),
(10, 10, 1, 1, 21, 1, 1, '2021-09-09 22:25:00', 1),
(11, 10, 2, 1, 21, 21, 20, '2021-09-10 22:25:00', 1),
(12, 9, 2, 1, 21, 21, 20, '2021-09-10 22:25:00', 1),
(13, 8, 2, 1, 21, 21, 20, '2021-09-10 22:25:00', 1),
(14, 7, 2, 1, 21, 21, 20, '2021-09-10 22:25:00', 1),
(15, 6, 2, 1, 21, 21, 20, '2021-09-10 22:25:00', 1),
(16, 5, 2, 1, 21, 21, 20, '2021-09-10 22:25:00', 1),
(17, 4, 2, 1, 21, 21, 20, '2021-09-10 22:25:00', 1),
(18, 3, 2, 1, 21, 21, 20, '2021-09-10 22:25:00', 1),
(19, 2, 2, 1, 21, 21, 20, '2021-09-10 22:25:00', 1),
(20, 1, 2, 1, 21, 21, 20, '2021-09-10 22:25:00', 1),
(21, 1, 3, 21, 20, 20, 19, '2021-09-13 22:25:00', 1),
(22, 2, 3, 21, 20, 20, 19, '2021-09-13 22:25:00', 1),
(23, 3, 3, 21, 20, 20, 19, '2021-09-13 22:25:00', 1),
(24, 4, 3, 21, 20, 20, 19, '2021-09-13 22:25:00', 1),
(25, 5, 3, 21, 20, 20, 19, '2021-09-13 22:25:00', 1),
(26, 6, 3, 21, 20, 20, 19, '2021-09-13 22:25:00', 1),
(27, 7, 3, 21, 20, 20, 19, '2021-09-13 22:25:00', 1),
(28, 8, 3, 21, 20, 20, 19, '2021-09-13 22:25:00', 1),
(29, 9, 3, 21, 20, 20, 19, '2021-09-13 22:25:00', 1),
(30, 10, 3, 21, 20, 20, 19, '2021-09-13 22:25:00', 1),
(31, 71, 1, 20, 23, 20, 19, '2021-10-09 13:37:00', 1),
(32, 71, 2, 20, 23, 23, 20, '2021-10-10 13:37:00', 1),
(33, 71, 3, 23, 22, 22, 22, '2021-10-11 13:37:00', 1),
(34, 72, 1, 20, 23, 20, 19, '2021-10-09 13:37:00', 1),
(35, 72, 2, 20, 23, 23, 20, '2021-10-10 13:37:00', 1),
(36, 72, 3, 23, 22, 22, 21, '2021-10-11 13:37:00', 1),
(37, 73, 1, 20, 23, 20, 19, '2021-10-09 13:37:00', 1),
(38, 73, 2, 20, 23, 23, 20, '2021-10-10 13:37:00', 1),
(39, 73, 3, 23, 22, 22, 21, '2021-10-11 13:37:00', 1),
(40, 74, 1, 20, 23, 20, 19, '2021-10-09 13:37:00', 1),
(41, 74, 2, 20, 23, 23, 20, '2021-10-10 13:37:00', 1),
(42, 74, 3, 23, 22, 22, 21, '2021-10-11 13:37:00', 1),
(43, 75, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(44, 76, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(45, 77, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(46, 78, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(47, 79, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(48, 80, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(49, 81, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(50, 82, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(51, 83, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(52, 84, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(53, 85, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(54, 86, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(55, 87, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(56, 88, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(57, 89, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(58, 90, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(59, 91, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(60, 92, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(61, 93, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(62, 94, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(63, 95, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(64, 96, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(65, 97, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(66, 98, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(67, 99, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(68, 100, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(69, 101, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(70, 102, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(71, 103, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(72, 104, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(73, 105, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(74, 106, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(75, 107, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(76, 108, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(77, 109, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(78, 110, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(79, 111, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(80, 112, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(81, 113, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(82, 114, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(83, 115, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(84, 116, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(85, 117, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(86, 118, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(87, 119, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(88, 120, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(89, 121, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(90, 122, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(91, 123, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(92, 124, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(93, 125, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(94, 126, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(95, 127, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(96, 128, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(97, 129, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(98, 130, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(99, 131, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(100, 132, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(101, 133, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(102, 134, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(103, 135, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(104, 136, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(105, 137, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(106, 138, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(107, 139, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(108, 140, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(109, 141, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(110, 142, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(111, 143, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(112, 144, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(113, 145, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(114, 146, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(115, 147, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(116, 148, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(117, 149, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(118, 150, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(119, 151, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(120, 152, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(121, 153, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(122, 154, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(123, 155, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(124, 156, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(125, 157, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(126, 158, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(127, 159, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(128, 160, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(129, 161, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(130, 162, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(131, 163, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(132, 164, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(133, 165, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(134, 166, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(135, 167, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(136, 168, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(137, 169, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(138, 170, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(139, 171, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(140, 172, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(141, 173, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(142, 174, 1, 11, 23, 11, 11, '2021-09-09 22:25:00', 1),
(143, 75, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(144, 76, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(145, 77, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(146, 78, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(147, 79, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(148, 80, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(149, 81, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(150, 82, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(151, 83, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(152, 84, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(153, 85, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(154, 86, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(155, 87, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(156, 88, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(157, 89, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(158, 90, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(159, 91, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(160, 92, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(161, 93, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(162, 94, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(163, 95, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(164, 96, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(165, 97, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(166, 98, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(167, 99, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(168, 100, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(169, 101, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(170, 102, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(171, 103, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(172, 104, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(173, 105, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(174, 106, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(175, 107, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(176, 108, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(177, 109, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(178, 110, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(179, 111, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(180, 112, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(181, 113, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(182, 114, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(183, 115, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(184, 116, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(185, 117, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(186, 118, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(187, 119, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(188, 120, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(189, 121, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(190, 122, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(191, 123, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(192, 124, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(193, 125, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(194, 126, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(195, 127, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(196, 128, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(197, 129, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(198, 130, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(199, 131, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(200, 132, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(201, 133, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(202, 134, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(203, 135, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(204, 136, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(205, 137, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(206, 138, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(207, 139, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(208, 140, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(209, 141, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(210, 142, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(211, 143, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(212, 144, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(213, 145, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(214, 146, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(215, 147, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(216, 148, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(217, 149, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(218, 150, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(219, 151, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(220, 152, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(221, 153, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(222, 154, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(223, 155, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(224, 156, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(225, 157, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(226, 158, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(227, 159, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(228, 160, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(229, 161, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(230, 162, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(231, 163, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(232, 164, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(233, 165, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(234, 166, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(235, 167, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(236, 168, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(237, 169, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(238, 170, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(239, 171, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(240, 172, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(241, 173, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(242, 174, 2, 11, 23, 23, 21, '2021-09-13 22:25:00', 1),
(243, 175, 1, 2, 23, 2, 2, '2021-11-04 22:25:00', 1),
(244, 176, 1, 2, 23, 2, 2, '2021-11-04 22:25:00', 1),
(245, 177, 1, 2, 23, 2, 2, '2021-11-04 22:25:00', 1),
(246, 178, 1, 2, 23, 2, 2, '2021-11-04 22:25:00', 1),
(247, 179, 1, 2, 23, 2, 2, '2021-11-04 22:25:00', 1),
(248, 180, 1, 2, 23, 2, 2, '2021-11-04 22:25:00', 1),
(249, 181, 1, 2, 23, 2, 2, '2021-11-04 22:25:00', 1),
(250, 182, 1, 2, 23, 2, 2, '2021-11-04 22:25:00', 1),
(251, 183, 1, 2, 23, 2, 2, '2021-11-04 22:25:00', 1),
(252, 184, 1, 2, 23, 2, 2, '2021-11-04 22:25:00', 1),
(253, 185, 1, 3, 23, 3, 3, '2021-11-04 22:25:00', 1),
(254, 186, 1, 3, 23, 3, 3, '2021-11-04 22:25:00', 1),
(255, 187, 1, 3, 23, 3, 3, '2021-11-04 22:25:00', 1),
(256, 188, 1, 3, 23, 3, 3, '2021-11-04 22:25:00', 1),
(257, 189, 1, 3, 23, 3, 3, '2021-11-04 22:25:00', 1),
(258, 190, 1, 3, 23, 3, 3, '2021-11-04 22:25:00', 1),
(259, 191, 1, 3, 23, 3, 3, '2021-11-04 22:25:00', 1),
(260, 192, 1, 3, 23, 3, 3, '2021-11-04 22:25:00', 1),
(261, 193, 1, 3, 23, 3, 3, '2021-11-04 22:25:00', 1),
(262, 194, 1, 3, 23, 3, 3, '2021-11-04 22:25:00', 1),
(263, 195, 1, 6, 23, 6, 6, '2021-11-04 22:25:00', 1),
(264, 196, 1, 6, 23, 6, 6, '2021-11-04 22:25:00', 1),
(265, 197, 1, 6, 23, 6, 6, '2021-11-04 22:25:00', 1),
(266, 198, 1, 6, 23, 6, 6, '2021-11-04 22:25:00', 1),
(267, 199, 1, 6, 23, 6, 6, '2021-11-04 22:25:00', 1),
(268, 200, 1, 6, 23, 6, 6, '2021-11-04 22:25:00', 1),
(269, 201, 1, 6, 23, 6, 6, '2021-11-04 22:25:00', 1),
(270, 202, 1, 6, 23, 6, 6, '2021-11-04 22:25:00', 1),
(271, 203, 1, 6, 23, 6, 6, '2021-11-04 22:25:00', 1),
(272, 204, 1, 6, 23, 6, 6, '2021-11-04 22:25:00', 1),
(273, 205, 1, 7, 21, 7, 7, '2021-11-04 22:25:00', 1),
(274, 206, 1, 7, 21, 7, 7, '2021-11-04 22:25:00', 1),
(275, 207, 1, 7, 21, 7, 7, '2021-11-04 22:25:00', 1),
(276, 208, 1, 7, 21, 7, 7, '2021-11-04 22:25:00', 1),
(277, 209, 1, 7, 21, 7, 7, '2021-11-04 22:25:00', 1),
(278, 210, 1, 7, 21, 7, 7, '2021-11-04 22:25:00', 1),
(279, 211, 1, 7, 21, 7, 7, '2021-11-04 22:25:00', 1),
(280, 212, 1, 7, 21, 7, 7, '2021-11-04 22:25:00', 1),
(281, 213, 1, 7, 21, 7, 7, '2021-11-04 22:25:00', 1),
(282, 214, 1, 7, 21, 7, 7, '2021-11-04 22:25:00', 1),
(283, 215, 1, 8, 21, 8, 8, '2021-11-04 22:25:00', 1),
(284, 216, 1, 8, 21, 8, 8, '2021-11-04 22:25:00', 1),
(285, 217, 1, 8, 21, 8, 8, '2021-11-04 22:25:00', 1),
(286, 218, 1, 8, 21, 8, 8, '2021-11-04 22:25:00', 1),
(287, 219, 1, 8, 21, 8, 8, '2021-11-04 22:25:00', 1),
(288, 220, 1, 8, 21, 8, 8, '2021-11-04 22:25:00', 1),
(289, 221, 1, 8, 21, 8, 8, '2021-11-04 22:25:00', 1),
(290, 222, 1, 8, 21, 8, 8, '2021-11-04 22:25:00', 1),
(291, 223, 1, 8, 21, 8, 8, '2021-11-04 22:25:00', 1),
(292, 224, 1, 8, 21, 8, 8, '2021-11-04 22:25:00', 1),
(293, 225, 1, 9, 23, 9, 9, '2021-11-04 22:25:00', 1),
(294, 226, 1, 9, 23, 9, 9, '2021-11-04 22:25:00', 1),
(295, 227, 1, 9, 23, 9, 9, '2021-11-04 22:25:00', 1),
(296, 228, 1, 9, 23, 9, 9, '2021-11-04 22:25:00', 1),
(297, 229, 1, 9, 23, 9, 9, '2021-11-04 22:25:00', 1),
(298, 230, 1, 9, 23, 9, 9, '2021-11-04 22:25:00', 1),
(299, 231, 1, 9, 23, 9, 9, '2021-11-04 22:25:00', 1),
(300, 232, 1, 9, 23, 9, 9, '2021-11-04 22:25:00', 1),
(301, 233, 1, 9, 23, 9, 9, '2021-11-04 22:25:00', 1),
(302, 234, 1, 9, 23, 9, 9, '2021-11-04 22:25:00', 1),
(303, 235, 1, 10, 23, 10, 10, '2021-11-04 22:25:00', 1),
(304, 236, 1, 10, 23, 10, 10, '2021-11-04 22:25:00', 1),
(305, 237, 1, 10, 23, 10, 10, '2021-11-04 22:25:00', 1),
(306, 238, 1, 10, 23, 10, 10, '2021-11-04 22:25:00', 1),
(307, 239, 1, 10, 23, 10, 10, '2021-11-04 22:25:00', 1),
(308, 240, 1, 10, 23, 10, 10, '2021-11-04 22:25:00', 1),
(309, 241, 1, 10, 23, 10, 10, '2021-11-04 22:25:00', 1),
(310, 242, 1, 10, 23, 10, 10, '2021-11-04 22:25:00', 1),
(311, 243, 1, 10, 23, 10, 10, '2021-11-04 22:25:00', 1),
(312, 244, 1, 10, 23, 10, 10, '2021-11-04 22:25:00', 1),
(313, 245, 1, 12, 23, 12, 12, '2021-11-04 22:25:00', 1),
(314, 246, 1, 12, 23, 12, 12, '2021-11-04 22:25:00', 1),
(315, 247, 1, 12, 23, 12, 12, '2021-11-04 22:25:00', 1),
(316, 248, 1, 12, 23, 12, 12, '2021-11-04 22:25:00', 1),
(317, 249, 1, 12, 23, 12, 12, '2021-11-04 22:25:00', 1),
(318, 250, 1, 12, 23, 12, 12, '2021-11-04 22:25:00', 1),
(319, 251, 1, 12, 23, 12, 12, '2021-11-04 22:25:00', 1),
(320, 252, 1, 12, 23, 12, 12, '2021-11-04 22:25:00', 1),
(321, 253, 1, 12, 23, 12, 12, '2021-11-04 22:25:00', 1),
(322, 254, 1, 12, 23, 12, 12, '2021-11-04 22:25:00', 1),
(323, 255, 1, 13, 23, 13, 13, '2021-11-04 22:25:00', 1),
(324, 256, 1, 13, 23, 13, 13, '2021-11-04 22:25:00', 1),
(325, 257, 1, 13, 23, 13, 13, '2021-11-04 22:25:00', 1),
(326, 258, 1, 13, 23, 13, 13, '2021-11-04 22:25:00', 1),
(327, 259, 1, 13, 23, 13, 13, '2021-11-04 22:25:00', 1),
(328, 260, 1, 13, 23, 13, 13, '2021-11-04 22:25:00', 1),
(329, 261, 1, 13, 23, 13, 13, '2021-11-04 22:25:00', 1),
(330, 262, 1, 13, 23, 13, 13, '2021-11-04 22:25:00', 1),
(331, 263, 1, 13, 23, 13, 13, '2021-11-04 22:25:00', 1),
(332, 264, 1, 13, 23, 13, 13, '2021-11-04 22:25:00', 1),
(333, 175, 2, 2, 23, 23, 21, '2021-11-05 22:25:00', 1),
(334, 176, 2, 2, 23, 23, 21, '2021-11-05 22:25:00', 1),
(335, 177, 2, 2, 23, 23, 21, '2021-11-05 22:25:00', 1),
(336, 178, 2, 2, 23, 23, 21, '2021-11-05 22:25:00', 1),
(337, 179, 2, 2, 23, 23, 21, '2021-11-05 22:25:00', 1),
(338, 180, 2, 2, 23, 23, 21, '2021-11-05 22:25:00', 1),
(339, 181, 2, 2, 23, 23, 21, '2021-11-05 22:25:00', 1),
(340, 182, 2, 2, 23, 23, 21, '2021-11-05 22:25:00', 1),
(341, 183, 2, 2, 23, 23, 21, '2021-11-05 22:25:00', 1),
(342, 184, 2, 2, 23, 23, 21, '2021-11-05 22:25:00', 1),
(343, 185, 2, 3, 23, 23, 21, '2021-11-05 22:25:00', 1),
(344, 186, 2, 3, 23, 23, 21, '2021-11-05 22:25:00', 1),
(345, 187, 2, 3, 23, 23, 21, '2021-11-05 22:25:00', 1),
(346, 188, 2, 3, 23, 23, 21, '2021-11-05 22:25:00', 1),
(347, 189, 2, 3, 23, 23, 21, '2021-11-05 22:25:00', 1),
(348, 190, 2, 3, 23, 23, 21, '2021-11-05 22:25:00', 1),
(349, 191, 2, 3, 23, 23, 21, '2021-11-05 22:25:00', 1),
(350, 192, 2, 3, 23, 23, 21, '2021-11-05 22:25:00', 1),
(351, 193, 2, 3, 23, 23, 21, '2021-11-05 22:25:00', 1),
(352, 194, 2, 3, 23, 23, 21, '2021-11-05 22:25:00', 1),
(353, 195, 2, 6, 23, 23, 21, '2021-11-05 22:25:00', 1),
(354, 196, 2, 6, 23, 23, 21, '2021-11-05 22:25:00', 1),
(355, 197, 2, 6, 23, 23, 21, '2021-11-05 22:25:00', 1),
(356, 198, 2, 6, 23, 23, 21, '2021-11-05 22:25:00', 1),
(357, 199, 2, 6, 23, 23, 21, '2021-11-05 22:25:00', 1),
(358, 200, 2, 6, 23, 23, 21, '2021-11-05 22:25:00', 1),
(359, 201, 2, 6, 23, 23, 21, '2021-11-05 22:25:00', 1),
(360, 202, 2, 6, 23, 23, 21, '2021-11-05 22:25:00', 1),
(361, 203, 2, 6, 23, 23, 21, '2021-11-05 22:25:00', 1),
(362, 204, 2, 6, 23, 23, 21, '2021-11-05 22:25:00', 1),
(363, 205, 2, 7, 21, 21, 20, '2021-11-05 22:25:00', 1),
(364, 206, 2, 7, 21, 21, 20, '2021-11-05 22:25:00', 1),
(365, 207, 2, 7, 21, 21, 20, '2021-11-05 22:25:00', 1),
(366, 208, 2, 7, 21, 21, 20, '2021-11-05 22:25:00', 1),
(367, 209, 2, 7, 21, 21, 20, '2021-11-05 22:25:00', 1),
(368, 210, 2, 7, 21, 21, 20, '2021-11-05 22:25:00', 1),
(369, 211, 2, 7, 21, 21, 20, '2021-11-05 22:25:00', 1),
(370, 212, 2, 7, 21, 21, 20, '2021-11-05 22:25:00', 1),
(371, 213, 2, 7, 21, 21, 20, '2021-11-05 22:25:00', 1),
(372, 214, 2, 7, 21, 21, 20, '2021-11-05 22:25:00', 1),
(373, 215, 2, 8, 21, 21, 20, '2021-11-05 22:25:00', 1),
(374, 216, 2, 8, 21, 21, 20, '2021-11-05 22:25:00', 1),
(375, 217, 2, 8, 21, 21, 20, '2021-11-05 22:25:00', 1),
(376, 218, 2, 8, 21, 21, 20, '2021-11-05 22:25:00', 1),
(377, 219, 2, 8, 21, 21, 20, '2021-11-05 22:25:00', 1),
(378, 220, 2, 8, 21, 21, 20, '2021-11-05 22:25:00', 1),
(379, 221, 2, 8, 21, 21, 20, '2021-11-05 22:25:00', 1),
(380, 222, 2, 8, 21, 21, 20, '2021-11-05 22:25:00', 1),
(381, 223, 2, 8, 21, 21, 20, '2021-11-05 22:25:00', 1),
(382, 224, 2, 8, 21, 21, 20, '2021-11-05 22:25:00', 1),
(383, 225, 2, 9, 23, 23, 21, '2021-11-05 22:25:00', 1),
(384, 226, 2, 9, 23, 23, 21, '2021-11-05 22:25:00', 1),
(385, 227, 2, 9, 23, 23, 21, '2021-11-05 22:25:00', 1),
(386, 228, 2, 9, 23, 23, 21, '2021-11-05 22:25:00', 1),
(387, 229, 2, 9, 23, 23, 21, '2021-11-05 22:25:00', 1),
(388, 230, 2, 9, 23, 23, 21, '2021-11-05 22:25:00', 1),
(389, 231, 2, 9, 23, 23, 21, '2021-11-05 22:25:00', 1),
(390, 232, 2, 9, 23, 23, 21, '2021-11-05 22:25:00', 1),
(391, 233, 2, 9, 23, 23, 21, '2021-11-05 22:25:00', 1),
(392, 234, 2, 9, 23, 23, 21, '2021-11-05 22:25:00', 1),
(393, 235, 2, 10, 23, 23, 21, '2021-11-05 22:25:00', 1),
(394, 236, 2, 10, 23, 23, 21, '2021-11-05 22:25:00', 1),
(395, 237, 2, 10, 23, 23, 21, '2021-11-05 22:25:00', 1),
(396, 238, 2, 10, 23, 23, 21, '2021-11-05 22:25:00', 1),
(397, 239, 2, 10, 23, 23, 21, '2021-11-05 22:25:00', 1),
(398, 240, 2, 10, 23, 23, 21, '2021-11-05 22:25:00', 1),
(399, 241, 2, 10, 23, 23, 21, '2021-11-05 22:25:00', 1),
(400, 242, 2, 10, 23, 23, 21, '2021-11-05 22:25:00', 1),
(401, 243, 2, 10, 23, 23, 21, '2021-11-05 22:25:00', 1),
(402, 244, 2, 10, 23, 23, 21, '2021-11-05 22:25:00', 1),
(403, 245, 2, 12, 23, 23, 21, '2021-11-05 22:25:00', 1),
(404, 246, 2, 12, 23, 23, 21, '2021-11-05 22:25:00', 1),
(405, 247, 2, 12, 23, 23, 21, '2021-11-05 22:25:00', 1),
(406, 248, 2, 12, 23, 23, 21, '2021-11-05 22:25:00', 1),
(407, 249, 2, 12, 23, 23, 21, '2021-11-05 22:25:00', 1),
(408, 250, 2, 12, 23, 23, 21, '2021-11-05 22:25:00', 1),
(409, 251, 2, 12, 23, 23, 21, '2021-11-05 22:25:00', 1),
(410, 252, 2, 12, 23, 23, 21, '2021-11-05 22:25:00', 1),
(411, 253, 2, 12, 23, 23, 21, '2021-11-05 22:25:00', 1),
(412, 254, 2, 12, 23, 23, 21, '2021-11-05 22:25:00', 1),
(413, 255, 2, 13, 23, 23, 21, '2021-11-05 22:25:00', 1),
(414, 256, 2, 13, 23, 23, 21, '2021-11-05 22:25:00', 1),
(415, 257, 2, 13, 23, 23, 21, '2021-11-05 22:25:00', 1),
(416, 258, 2, 13, 23, 23, 21, '2021-11-05 22:25:00', 1),
(417, 259, 2, 13, 23, 23, 21, '2021-11-05 22:25:00', 1),
(418, 260, 2, 13, 23, 23, 21, '2021-11-05 22:25:00', 1),
(419, 261, 2, 13, 23, 23, 21, '2021-11-05 22:25:00', 1),
(420, 262, 2, 13, 23, 23, 21, '2021-11-05 22:25:00', 1),
(421, 263, 2, 13, 23, 23, 21, '2021-11-05 22:25:00', 1),
(422, 264, 2, 13, 23, 23, 21, '2021-11-05 22:25:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tp_transaction_events_test`
--

CREATE TABLE `tp_transaction_events_test` (
  `id` smallint UNSIGNED NOT NULL,
  `product_dispatch_id` smallint UNSIGNED NOT NULL,
  `tran_event_type_id` smallint UNSIGNED DEFAULT NULL,
  `from_owner_id` smallint DEFAULT NULL,
  `to_owner_id` smallint DEFAULT NULL,
  `current_owner_id` smallint DEFAULT NULL,
  `current_owner_address_id` smallint DEFAULT NULL,
  `capture` varchar(2000) DEFAULT NULL,
  `transaction_timestamp` timestamp NULL DEFAULT NULL,
  `is_active` smallint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tp_transaction_events_test`
--

INSERT INTO `tp_transaction_events_test` (`id`, `product_dispatch_id`, `tran_event_type_id`, `from_owner_id`, `to_owner_id`, `current_owner_id`, `current_owner_address_id`, `capture`, `transaction_timestamp`, `is_active`) VALUES
(423, 1, 1, 1, 21, 1, 1, NULL, '2021-11-24 15:36:00', 1),
(424, 1, 2, 1, 21, 21, 1, NULL, '2021-11-24 16:21:00', 1),
(425, 1, 3, 21, 20, 20, 19, NULL, '2021-11-24 19:58:00', 1),
(426, 71, 1, 20, 23, 20, 19, NULL, '2021-11-24 20:03:00', 1),
(427, 71, 2, 20, 23, 23, 21, NULL, '2021-11-25 08:44:00', 1),
(428, 255, 1, 13, 23, 13, 13, NULL, '2021-11-29 19:46:00', 1),
(429, 255, 2, 13, 23, 23, 21, NULL, '2021-11-29 19:48:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tp_transaction_location`
--

CREATE TABLE `tp_transaction_location` (
  `id` smallint UNSIGNED NOT NULL,
  `trading_company_id` smallint UNSIGNED DEFAULT NULL,
  `trading_company` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `transaction_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Transaction',
  `purchase_order_numner` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `partner_company_id` smallint DEFAULT NULL,
  `controlled_conditions_id` smallint DEFAULT NULL,
  `current_location` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `start_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `latitude` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `longitude` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `entry_point_lat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '24.55',
  `entry_point_long` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '54.22',
  `exit_point_lat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '18.25',
  `exit_point_long` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '32.56',
  `temperature` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `humidity` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `country` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `continent` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `destination` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `from_gln` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `to_gln` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `trans_timestmap` timestamp NULL DEFAULT NULL,
  `recorded_time` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tp_transaction_location`
--

INSERT INTO `tp_transaction_location` (`id`, `trading_company_id`, `trading_company`, `transaction_type`, `purchase_order_numner`, `partner_company_id`, `controlled_conditions_id`, `current_location`, `start_time`, `end_time`, `latitude`, `longitude`, `entry_point_lat`, `entry_point_long`, `exit_point_lat`, `exit_point_long`, `temperature`, `humidity`, `country`, `continent`, `address`, `destination`, `from_gln`, `to_gln`, `trans_timestmap`, `recorded_time`, `is_active`) VALUES
(1, 2, 'GSK Pharmaceuticals', 'Delivered', 'PO44354315', 1, NULL, 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '2021-08-08 15:20:00', '2021-10-07 19:18:00', '51.9865', '-0.1180', '24.55', '54.22', '18.25', '32.56', '12', '10', 'United Kingdom', 'Europe', '980 Great West Road, London , UK', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '890609662253', '6985632589654', '2021-08-10 19:20:00', '2021-10-16 19:30:00', 1),
(2, 2, 'Aspar Pharmaceuticals', 'Intransist', 'PO55247895', 1, NULL, 'Aberdeen One Logistics Park,UK', '2021-08-08 15:20:00', '2021-08-10 19:18:00', '21.7679', '78.8718', '24.55', '54.22', '18.25', '32.56', '12', '10', 'United Kingdom', 'Europe', 'Aberdeen One Logistics Park,UK', 'Flag 8 Salisbury Square, London, EC4Y 8BB', '6601101532025', '5505015320074', '2021-08-10 19:20:00', '2021-10-16 19:30:00', 1),
(3, 3, 'Bayer Company', 'Delivered', 'PO23657458', 0, NULL, 'Jubilee Hills,Hyderabad', '2021-08-08 15:20:00', '2021-08-10 19:18:00', '21.36', '54.02', '24.55', '54.22', '18.25', '32.56', '12', '10', 'India', 'Asia', 'Jubilee Hills,Hyderabad', 'Apollo Hospital Campus, Jubilee Hills, Hyderabad - 500033', '9901101132036', '4501101532042', '2021-08-10 19:20:00', '2021-10-16 19:30:00', 1),
(4, 1, 'Boots', 'delivred', '', 0, NULL, '', '2021-08-08 15:20:00', '2021-08-10 19:18:00', '', '', '24.55', '54.22', '18.25', '32.56', '', '', '', '', '', '', '', '', '2021-08-10 19:20:00', '2021-10-16 19:30:00', 0),
(20, NULL, 'GSK', 'In-stock', 'PO44354315', NULL, NULL, 'Hardenpend, England', '2021-08-25 16:00:00', '2021-08-26 18:30:00', '21.7679° N', '78.8718° E', '24.55', '54.22', '18.25', '32.56', '10°c', '12°', 'United Kingdom', 'Europe', 'Top Street Way, Eldon Square, Hardenpend, England', 'Glasglow, scotland', '29014244', '29014244', '2021-08-25 15:09:00', '2021-10-16 16:00:00', 1),
(50, NULL, 'Novartis', 'Advanced shipping Notice', 'PO44354142', NULL, NULL, 'chelmsford', '2021-09-03 20:14:00', '2021-09-04 01:14:00', '21.7679° N', '78.8718° E', '24.55', '54.22', '18.25', '32.56', '10° c', '12°', 'United Kingdom', 'Europe', 'Bishoprise, chelmsford', '62 North Road, westham', '9501101532007', '4571101532007', '2021-09-03 20:00:00', '2021-10-16 20:03:00', 1),
(51, NULL, 'DPD', 'Intransist', 'PO44354142', NULL, NULL, 'Rainham', '2021-09-03 20:14:00', '2021-09-04 20:14:00', '21.7679° N', '78.8718° E', '24.55', '54.22', '18.25', '32.56', '10° c', '12°', 'United Kingdom', 'Europe', 'Rainham', 'Superdrug, Westham', '9501101532007', '4571101532007', '2021-09-03 20:00:00', '2021-10-16 20:10:00', 1),
(52, NULL, 'Superdrug', 'delivred', 'PO44354142', NULL, NULL, 'Rainham', '0001-01-01 00:00:00', '2021-09-04 20:14:00', '21.7679° N', '78.8718° E', '24.55', '54.22', '18.25', '32.56', '10° c', '12°', 'United Kingdom', 'Europe', 'Rainham', 'Superdrug, Westham', '9501101532007', '4571101532007', '2021-09-03 20:00:00', '2021-10-16 21:10:00', 0),
(53, NULL, 'Sigma Pharmaceuticals plc', 'Advanced shipping Notice', 'PO44352233', NULL, NULL, 'Dartford', '2021-09-09 07:00:00', '2021-09-09 07:15:00', '21.8579° N', '88.8218° E', '24.55', '54.22', '18.25', '32.56', '12° c', '15°', 'United kingdom', 'Europe', 'Dartford', 'W H Smith, Purfleet', '9501101778010', '4571101885223', '2021-09-09 06:30:00', '2021-10-16 07:30:00', 1),
(54, NULL, 'Hermes', 'InTransit', 'PO44352233', NULL, NULL, 'Grays', '2021-09-09 07:10:00', '2021-09-09 07:20:00', '22.8579° N', '89.8218° E', '24.55', '54.22', '18.25', '32.56', '12° c', '15°', 'United kingdom', 'Europe', 'Grays Station', 'W H Smith, Purfleet', '9501101778010', '4571101885223', '2021-09-09 06:30:00', '2021-10-16 07:35:00', 1),
(55, NULL, 'W H Smith', 'Delivered', 'PO44352233', NULL, NULL, 'Purfleet', '2021-09-09 07:10:00', '2021-10-09 09:00:00', '23.8579° N', '90.8218° E', '24.55', '54.22', '18.25', '32.56', '12° c', '15°', 'United kingdom', 'Europe', 'Rainham', 'W H Smith, Purfleet', '9501101778010', '4571101885223', '2021-09-09 06:30:00', '2021-10-16 09:15:00', 0),
(56, NULL, 'WH SMITH', 'Advanced shipping Notice', 'PO4435567', NULL, NULL, 'jiska', '2021-09-11 10:40:00', '2021-09-11 11:00:00', '21.7679° N', '78.8718° E', '24.55', '54.22', '18.25', '32.56', '10° c', '12°', 'United Kingdom', 'Europe', 'Rainham', 'Tesco, Brighton', '9501101598001', '1201101592010', '2021-09-11 10:08:00', '2021-10-16 10:56:00', 1),
(57, NULL, 'Hermes', 'Intransist', 'PO4435567', NULL, NULL, 'jiska', '2021-09-11 10:40:00', '2021-09-11 11:00:00', '21.7686° N', '78.8723° E', '24.55', '54.22', '18.25', '32.56', '11° c', '09°', 'United Kingdom', 'Europe', 'Hermes , Soho', 'Tesco, Brighton', '9501101598201', '1201101592011', '2021-09-11 10:08:00', '2021-10-16 11:00:00', 1),
(58, NULL, 'Tesco', 'Delivered', 'PO4435567', NULL, NULL, 'jiska', '2021-09-12 10:40:00', '2021-09-12 11:00:00', '21.8686° N', '78.7623° E', '24.55', '54.22', '18.25', '32.56', '11° c', '09°', 'United Kingdom', 'Europe', 'Tesco, Brighton', 'Tesco, Brighton', '1201101592011', '', '2021-09-12 08:08:00', '2021-10-16 11:01:00', 0),
(59, NULL, 'WH SMITH', 'Advanced shipping Notice', 'PO44354314', NULL, NULL, 'Purfleet', '2021-08-11 10:30:00', '2021-08-12 20:21:00', '27.4377° N', '78.8723° E', '24.55', '54.22', '18.25', '32.56', '10° c', '12°', 'United Kingdom', 'Europe', 'Rainham', 'Isle of Dogs', '32589632571144', '10589632570234', '2021-08-11 10:08:00', '2021-10-16 10:10:00', 1),
(60, NULL, 'Hermes', 'Intransist', 'PO44354314', NULL, NULL, 'Canary warf', '2021-08-11 10:30:00', '2021-08-12 20:21:00', '27.4377° N', '78.8723° E', '24.55', '54.22', '18.25', '32.56', '10° c', '12°', 'United Kingdom', 'Europe', 'O2,Canary warf', 'Isle of Dogs', '32589632572244', '10589632575634', '2021-08-11 10:08:00', '2021-10-16 10:19:00', 1),
(61, NULL, 'ASDA', 'Delivered', 'PO44354314', NULL, NULL, 'Isle of Dogs', '2021-08-11 10:30:00', '2021-08-12 20:21:00', '27.4377° N', '78.8723° E', '24.55', '54.22', '18.25', '32.56', '10° c', '12°', 'United Kingdom', 'Europe', 'Isle of Dog, London', 'Isle of Dogs', '10589632575634', '', '2021-08-12 10:08:00', '2021-10-16 10:19:00', 0),
(62, NULL, 'DR Reddy\'s', 'Advanced Shipping Notice', 'PODFRT_09231', NULL, NULL, 'Moscow,Russia', '2021-09-18 09:23:00', '2021-09-22 08:23:00', '55.644466', '37.395744', '24.55', '54.22', '18.25', '32.56', '24 °C', '40% Humidity', 'Russia', 'Europe', 'Moscow,Russia', 'Dr. Reddy\'s Laboratories Ltd. 8-2-337, Road No. 3, Banjara Hills, Hyderabad Telangana 500034, INDIA', '9500425000235', '4400425006235', '2021-09-18 08:23:00', '2021-10-16 08:23:00', 1),
(63, NULL, 'Dr Reddys Laboratries Ltd', 'Intransist', 'PODFRT_09211', NULL, NULL, 'Dr. Reddy\'s Laboratories Ltd. 8-2-337, Road No. 3, Banjara Hills, Hyderabad Telangana 500034, INDIA', '2021-09-18 11:02:00', '2021-09-21 11:02:00', '54.2365', '26.2587', '24.55', '54.22', '18.25', '32.56', '24 °C', '40% Humidity', 'India', 'Asia', 'Hyd Telangana 500034, INDIA', 'Apollo Pharmacy Shop No 13 Main Market Rk Puram Sec 3 Delhi 22 - 110022', '9500425000235', '9500425000360', '2021-09-18 11:02:00', '2021-10-16 11:03:00', 1),
(64, 2, 'Taj Pharmaceuticals Ltd', 'Intransist', 'PO44354315', 1, NULL, '904,9TH FLOOR, CRESESNT, Mumbai,Maharashtra,400059', '2021-08-08 15:20:00', '2021-08-10 19:18:00', '21.7679', '78.8718', '24.55', '54.22', '18.25', '32.56', '12', '10', 'India', 'Asia', '904,9TH FLOOR, CRESESNT, Mumbai,Maharashtra,400059', 'Choyoda,Tokoyo,Japan', '8906096620196', '4571101532007', '2021-08-10 19:20:00', '2021-10-16 19:30:00', 1),
(65, 2, 'AbbVie Srl Ltd', 'Intransist', 'PO44354316', 1, NULL, 'Strada Regionale Pontina Km 52,Aprilia,Italy,04011', '2021-08-08 15:20:00', '2021-08-10 19:18:00', '16.7679', '44.8718', '24.55', '54.22', '18.25', '32.56', '12', '10', 'United Kingdom', 'Europe', 'Strada Regionale Pontina Km 52,Aprilia,Italy,04011', '1300 Morris Drive', '8054083010038', '4571101532008', '2021-08-10 19:20:00', '2021-10-16 19:30:00', 1),
(66, 3, 'ORGANON FARMACEUTICA LTD', 'Intransist', 'PO44354317', 1, NULL, 'Dr Chucri Zaidan, Sao Paulo,Brazil-04583110', '2021-08-08 15:20:00', '2021-08-10 19:18:00', '12.7679', '25.8718', '24.55', '54.22', '18.25', '32.56', '12', '10', 'Brazil', 'Asia', 'Dr Chucri Zaidan, Sao Paulo,Brazil-04583110', '2915 WESTON ROAD, WESTON, Florida, USA.', '7897337713818', '4571101532009', '2021-08-10 19:20:00', '2021-10-16 19:30:00', 1),
(67, 3, 'BMS Pharmaceuticals Ltd', 'Intransist', 'PO44354318', 1, NULL, 'Bristol Myers Squibb House,Uxbridge,UK - UB8 1DH', '2021-08-08 15:20:00', '2021-08-10 19:18:00', '13.7679', '26.8718', '24.55', '54.22', '18.25', '32.56', '12', '10', 'United Kingdom', 'Europe', 'Bristol Myers Squibb House,Uxbridge,UK - UB8 1DH', '000 Cardinal Place', '5012712004233', '4571101532010', '2021-08-10 19:20:00', '2021-10-16 19:30:00', 1),
(68, 4, 'Celgene International S', 'Intransist', 'PO44354319', 1, NULL, 'Route de Perreux 1,Boudry,Switzerland-2017', '2021-08-08 15:20:00', '2021-08-10 19:18:00', '14.7679', '27.8718', '24.55', '54.22', '18.25', '32.56', '12', '10', 'Switzerland', 'Northa America', 'Route de Perreux 1,Boudry,Switzerland-2017', 'Infantry Road, Bangalore - 560001', '7640133680873', '4571101532011', '2021-08-10 19:20:00', '2021-10-16 19:30:00', 1),
(69, 4, 'Celgene International S', 'Intransist', 'PO44354320', 1, NULL, 'Route de Perreux 1,Boudry,Switzerland-2017', '2021-08-08 15:20:00', '2021-08-10 19:18:00', '15.7679', '28.8718', '24.55', '54.22', '18.25', '32.56', '12', '10', 'Switzerland', 'Northa America', 'Route de Perreux 1,Boudry,Switzerland-2017', 'Infantry Road, Bangalore - 560001', '7640133680274', '4571101532012', '2021-08-10 19:20:00', '2021-10-16 19:30:00', 1),
(70, 5, 'Janssen-Cilag AG', 'Intransist', 'PO44354321', 1, NULL, 'Gubelstrasse 34,Zug,Switzerland - 6300', '2021-08-08 15:20:00', '2021-08-10 19:18:00', '16.7679', '29.8718', '24.55', '54.22', '18.25', '32.56', '12', '10', 'Switzerland', 'Northa America', 'Gubelstrasse 34,Zug,Switzerland - 6300', 'CuraScript SD,255 Technology Park,USA-FL 32746', '7680651730025', '4571101532013', '2021-08-10 19:20:00', '2021-10-16 19:30:00', 1),
(71, 5, 'Sanofi-Aventis (Suisse) SA', 'Intransist', 'PO44354322', 1, NULL, 'Route de Montfleury 3,Vernier,Switzerland', '2021-08-08 15:20:00', '2021-08-10 19:18:00', '17.7679', '30.8718', '24.55', '54.22', '18.25', '32.56', '12', '10', 'Switzerland', 'Northa America', 'Route de Montfleury 3,Vernier,Switzerland', '129 Deansgate, Manchester,UK-M3 3WR', '7680666490013', '4571101532014', '2021-08-10 19:20:00', '2021-10-16 19:30:00', 1),
(72, 6, 'BMS Pharmaceuticals Ltd', 'Intransist', 'PO44354323', 1, NULL, 'Bristol Myers Squibb House,Uxbridge,UK - UB8 1DH', '2021-08-08 15:20:00', '2021-08-10 19:18:00', '18.7679', '31.8718', '24.55', '54.22', '18.25', '32.56', '12', '10', 'United Kingdom', 'Europe', 'Bristol Myers Squibb House,Uxbridge,UK - UB8 1DH', '3063 Fiat Avenue Springfield,USA-IL 62703', '5012712004394', '4571101532015', '2021-08-10 19:20:00', '2021-10-16 19:30:00', 1),
(73, 6, 'Pfizer Inc', 'Intransist', 'PO44354324', 1, NULL, '100 US-206,Gladstone,USA-07934', '2021-08-08 15:20:00', '2021-08-10 19:18:00', '19.7679', '32.8718', '24.55', '54.22', '18.25', '32.56', '12', '10', 'USA', 'Northa America', '100 US-206,Gladstone,USA-07934', 'S Langworthy Rd, Salford,UK- M50 2GL', '1030409204902', '4571101532016', '2021-08-10 19:20:00', '2021-10-16 19:30:00', 1),
(74, 7, 'Janssen Products LP', 'Intransist', 'PO44354325', 1, NULL, '425 HOES LN,PISCATAWAY,USA - 08854-4103', '2021-08-08 15:20:00', '2021-08-10 19:18:00', '20.7679', '33.8718', '24.55', '54.22', '18.25', '32.56', '12', '10', 'USA', 'Northa America', '425 HOES LN,PISCATAWAY,USA - 08854-4103', '6555 State Hwy 161, Irving, Texas, 75039', '359676552017', '4571101532017', '2021-08-10 19:20:00', '2021-10-16 19:30:00', 1),
(75, 7, 'Moderna US, Inc', 'Intransist', 'PO44354326', 1, NULL, '200 Technology Sq,Cambridge,USA-02139', '2021-08-08 15:20:00', '2021-08-10 19:18:00', '21.7679', '34.8718', '24.55', '54.22', '18.25', '32.56', '12', '10', 'USA', 'Northa America', '200 Technology Sq,Cambridge,USA-02139', '2-7-15, YAESU, Chuo, Tokyo, Japan', '380777273990', '4571101532018', '2021-08-10 19:20:00', '2021-10-16 19:30:00', 1),
(76, 8, 'AstraZeneca', 'Intransist', 'PO44354327', 1, NULL, 'Oxford,USA', '2021-08-08 15:20:00', '2021-08-10 19:18:00', '22.7679', '35.8718', '24.55', '54.22', '18.25', '32.56', '12', '10', 'USA', 'Northa America', 'Oxford,USA', '410 Kay Ln, Shreveport,USA, LA 71115', '380777273990', '4571101532019', '2021-08-10 19:20:00', '2021-10-16 19:30:00', 1),
(77, 8, 'Janssen Pharmaceutical Inc', 'Intransist', 'PO44354328', 1, NULL, '1125 BEAR TAVERN RD,TITUSVILLE,USA-08560-1499', '2021-08-08 15:20:00', '2021-08-10 19:18:00', '23.7679', '36.8718', '24.55', '54.22', '18.25', '32.56', '12', '10', 'USA', 'Northa America', '1125 BEAR TAVERN RD,TITUSVILLE,USA-08560-1499', '816 Ellis Rd, Durham,USA, NC 27703', '350458650600', '4571101532020', '2021-08-10 19:20:00', '2021-10-16 19:30:00', 1),
(78, 9, 'Lake Erie Medical DBA Quality ', 'Intransist', 'PO44354329', 1, NULL, '6920 HALL ST,Holland - 43528-9485', '2021-08-08 15:20:00', '2021-08-10 19:18:00', '24.7679', '37.8718', '24.55', '54.22', '18.25', '32.56', '12', '10', 'Holland', 'North western Europe', '6920 HALL ST,Holland - 43528-9485', '9417 Brodie Lane Austin, TX 78748 United States', '355700746605', '4571101532021', '2021-08-10 19:20:00', '2021-10-16 19:30:00', 1),
(79, 9, 'Elvia Care Pvt Ltd', 'Intransist', 'PO44354330', 1, NULL, 'SCO 53, Tau Devilal Huda Sub Centre,Haryana - 135001', '2021-08-08 15:20:00', '2021-08-10 19:18:00', '25.7679', '38.8718', '24.55', '54.22', '18.25', '32.56', '12', '10', 'India', 'Asia', 'SCO 53, Tau Devilal Huda Sub Centre,Haryana - 1350', 'Taicang Road Shanghai, 200020 China', '8907601007204', '4571101532022', '2021-08-10 19:20:00', '2021-10-16 19:30:00', 1),
(80, 10, 'Concept Biosciences Pvt Ltd', 'Intransist', 'PO44354331', 1, NULL, '1 AJC Bose Road, 3rd Floor,Kolkata-700020', '2021-08-08 15:20:00', '2021-08-10 19:18:00', '26.7679', '39.8718', '24.55', '54.22', '18.25', '32.56', '12', '10', 'India', 'Asia', '1 AJC Bose Road, 3rd Floor,Kolkata-700020', 'Haidian District, Beijing, China Postal Code: 100088', '8906085154268', '4571101532023', '2021-08-10 19:20:00', '2021-10-16 19:30:00', 1),
(81, 10, 'Ved Lifesavers Pvt Ltd', 'Intransist', 'PO44354332', 1, NULL, 'A3, SIE, Rampur,Uttarakhand - 248197', '2021-08-08 15:20:00', '2021-08-10 19:18:00', '27.7679', '40.8718', '24.55', '54.22', '18.25', '32.56', '12', '10', 'India', 'Asia', 'A3, SIE, Rampur,Uttarakhand - 248197', '741 2nd Street Portsmouth, OH 45662 United States', '8906119220884', '4571101532024', '2021-08-10 19:20:00', '2021-10-16 19:30:00', 1),
(82, 11, 'Ved Lifesavers Pvt Ltd', 'Intransist', 'PO44354333', 1, NULL, 'A3, SIE, Rampur,Uttarakhand - 248197', '2021-08-08 15:20:00', '2021-08-10 19:18:00', '28.7679', '41.8718', '24.55', '54.22', '18.25', '32.56', '12', '10', 'India', 'Asia', 'A3, SIE, Rampur,Uttarakhand - 248197', 'Higashi-ku. Nagoya, 461-8701 Japan', '8906119220104', '4571101532025', '2021-08-10 19:20:00', '2021-10-16 19:30:00', 1),
(83, 12, 'Ved Lifesavers Pvt Ltd', 'Intransist', 'PO44354334', 1, NULL, 'A3, SIE, Rampur,Uttarakhand - 248197', '2021-08-08 15:20:00', '2021-08-10 19:18:00', '29.7679', '42.8718', '24.55', '54.22', '18.25', '32.56', '12', '10', 'India', 'Asia', 'A3, SIE, Rampur,Uttarakhand - 248197', 'Churchyard London, EC4M 8BU United Kingdom', '8906119220811', '4571101532026', '2021-08-10 19:20:00', '2021-10-16 19:30:00', 1),
(84, NULL, '', '', 'PODGE3', NULL, NULL, 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', '2021-10-04 15:31:00', '2021-10-06 15:31:00', '51.7622116', '-0.4422371', '19.076090', '72.877426', '51.524', '-0.646', '10', '12', 'India', 'Asia', 'VST Colony, Hyderabad, Telangana 500082', 'VST Colony, Hyderabad, Telangana 500082', '6985632389654', '630609662225', '2021-10-06 15:32:00', '2021-10-16 15:32:00', 1),
(85, NULL, '', '', '', NULL, NULL, 'Unorganized North Cochrane District, Canada', '2021-11-01 13:28:00', '2021-11-04 13:28:00', '49.9408968', '-79.9699756', '40.5408968', '-74.4699756', '51.509865', '-0.118092', '10º C', '50', 'USA', 'North America', '425 HOES LN,PISCATAWAY,USA - 08854-4103', 'Ravalco House, Cleveland Way, Hemel Hempstead HP2 7DL,UK', '', '', '2021-11-01 13:28:00', '2021-11-01 13:28:00', 1),
(86, NULL, '', '', '', NULL, NULL, 'Strada Regionale Pontina Km 52,Aprilia', '2021-11-05 16:49:00', '2021-11-19 16:49:00', '41.3390962', '13.012052', '-23.6196909', '-46.6980276', '52.1938656', '0.9905727', '10', '50', 'UK', 'Europe', 'Strada Regionale Pontina Km 52,Aprilia,Italy,04011', 'Violet Hill House, Violet Hill Road, Stow Market, IP14 1NL, UK', '', '', '2021-11-05 16:50:00', '2021-11-05 16:50:00', 1),
(87, NULL, '', '', '', NULL, NULL, 'Aprilia,Italy,04011', '2021-11-05 17:05:00', '2024-09-23 17:05:00', '48.6670068', '-0.3947776', '41.5525788', '12.7044265', '51.6670068', '-0.3947776', '10', '40', 'Italy', 'Europe', 'Strada Regionale Pontina Km 52,Aprilia,Italy,04011', 'Unit 1 Colonial Way, Watford, WD24 4YR, Uk', '', '', '2021-11-05 17:08:00', '2021-11-05 17:08:00', 1),
(88, NULL, '', '', '', NULL, NULL, '75417 Muchlaker, Germany', '2021-11-05 17:31:00', '2021-11-05 17:30:00', '48.9425359', '8.8273059', '46.9425359', '6.8273059', '52.7364272', '-2.7223277', '8', '30', 'UK', 'Europe', 'Unit 15 Sundorne Trade Park,  UK', 'Unit 15 Sundorne Trade Park, Featherbed Lane, Shrewsbury, SY1 4YQ, UK', '', '', '2021-11-05 17:30:00', '2021-11-05 17:30:00', 1),
(89, NULL, '', '', '', NULL, NULL, 'Gubelstrasse 34,Zug,Switzerland - 6300', '2021-11-05 17:37:00', '2025-11-12 17:37:00', '49.1752372', '9.9130538', '47.1752372', '8.5130538', '51.6670068', '-0.3947776', '15', '30', 'Switzerland', 'Europe', 'Gubelstrasse 34,Zug,Switzerland - 6300', '', '', '', '2021-11-05 17:37:00', '2021-11-05 17:37:00', 1),
(90, NULL, '', '', '', NULL, NULL, '5XVR+G6W Rinteln, Germany', '2021-11-05 17:45:00', '2021-11-08 17:45:00', '52.1938656', '8.9905727', '46.2168744', '6.0828042', '52.1938656', '0.9905727', '15', '30', 'UK', 'Europe', 'Violet Hill House, UK', 'Violet Hill House, Violet Hill Road, Stow Market, IP14 1NL, UK', '', '', '2021-11-05 17:48:00', '2021-11-05 17:48:00', 1),
(91, NULL, '', '', '', NULL, NULL, 'Squibb House,Uxbridge,UK - UB8 1DH', '2021-11-05 17:55:00', '2021-11-23 17:55:00', '51.7364272', '-2.7223277', '51.5557403', '-0.4799918', '52.7364272', '-2.7223277', '10', '30', 'UK', 'Europe', 'Shrewsbury, SY1 4YQ, UK', 'Monmouth,Uxbridge,UK - UB8 1DH', '', '', '2021-11-05 17:54:00', '2021-11-05 17:54:00', 1),
(92, NULL, '', '', '', NULL, NULL, '', '2021-11-05 18:01:00', '2021-11-08 18:01:00', '38.7084604', '-72.6637889', '40.7084604', '-74.6637889', '51.6670068', '-0.3947776', '10', '30', 'UK', 'Europe', 'Unit 1 Colonial Way, Watford, WD24 4YR, Uk', 'Unit 1 Colonial Way, Watford, WD24 4YR, Uk', '', '', '2021-11-05 18:00:00', '2021-11-05 18:00:00', 1),
(93, NULL, '', '', '', NULL, NULL, '200 Technology Sq,Cambridge,USA-02139', '2021-11-05 18:03:00', '2021-11-08 18:03:00', '42.3633316', '-71.090694', '42.3633316', '-71.090694', '52.1938656', '0.9905727', '5', '20', 'USA', 'North America', '200 Technology Sq,Cambridge,USA-02139', 'Violet Hill House, Violet Hill Road, Stow Market, IP14 1NL, UK', '', '', '2021-11-05 18:06:00', '2021-11-08 18:06:00', 1),
(94, NULL, '', '', '', NULL, NULL, '200 Technology Sq,Cambridge,USA-02139', '2021-11-05 18:10:00', '2021-11-10 18:10:00', '45.3633316', '-76.090694', '42.3633316', '-71.090694', '52.7364272', '-2.7223277', '10', '30', 'USA', 'North America', '200 Technology Sq,Cambridge,USA-02139', 'Unit 15 Sundorne Trade Park, Featherbed Lane, Shrewsbury, SY1 4YQ, UK', '', '', '2021-11-05 18:08:00', '2021-11-05 18:08:00', 1),
(95, 1, 'Pfizer Company', 'Ready for Shipment', '4587455', 1, NULL, '100 US-206,Gladstone,USA-07934', '2021-11-29 18:24:00', '2021-12-07 18:24:00', '55.23', '23.56', '55.23', '23.56', '52.7364272', '-2.7223277', '10ºC', '55%', 'USA', 'Noth America', '100 US-206,Gladstone,USA-07934', 'Unit 15 Sundorne Trade Park, Featherbed Lane, Shrewsbury, SY1 4YQ, UK', '863772000001', '2632229669854', '2021-11-29 18:28:00', '2021-11-29 18:23:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tp_transaction_owner`
--

CREATE TABLE `tp_transaction_owner` (
  `id` smallint UNSIGNED NOT NULL,
  `trading_company_id` tinyint DEFAULT NULL COMMENT 'FK',
  `trading_company` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `transaction_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Hardcoded for now, later Ref MT',
  `driver_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `purchase_order_numner` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `partner_company_id` smallint DEFAULT NULL,
  `asset_owner_now` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `organization` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `department` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `operator_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `current_owner_contact` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `current_owner_address` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `asset_owner_next` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `trans_timestmap` timestamp NULL DEFAULT NULL,
  `transaction_timestamp_one` datetime DEFAULT NULL,
  `recorded_time` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tp_transaction_owner`
--

INSERT INTO `tp_transaction_owner` (`id`, `trading_company_id`, `trading_company`, `transaction_type`, `driver_name`, `purchase_order_numner`, `partner_company_id`, `asset_owner_now`, `organization`, `department`, `operator_name`, `current_owner_contact`, `current_owner_address`, `asset_owner_next`, `trans_timestmap`, `transaction_timestamp_one`, `recorded_time`, `is_active`) VALUES
(1, 2, 'GSK Pharmaceuticals', 'Delivered', 'Rashool Shaik', 'PO44354315', 1, 'Firstline Pharma Distibutors', 'Distributors', 'Packing', 'Pheebe', '9096525683', 'Cleveland Way, Hemel Hempstead HP2 7DL,UK', 'NA', '2021-09-28 21:02:02', '2021-09-14 02:36:00', '2021-08-11 21:12:12', 1),
(2, 2, 'Aspar Pharmaceuticals', 'Intransit', 'Peterson', 'PO55247895', 2, 'Fedex Logistics', 'Logistics', 'Dispatch', 'Rachel', '9566617558', 'Aberdeen One', 'Altana Pharma Ltd', '2021-08-11 21:02:02', NULL, '2021-08-11 21:12:12', 1),
(3, 1, 'Bayer Company', 'Delivered', 'Krishna', 'PO23657458', 2, 'Appolo Pharma Ltd', 'Retailer', 'Pharmacy', 'Gunther', '7416880323', 'Jubilee Hills,Hyderabad', 'None', '2021-08-11 21:02:02', NULL, '2021-08-11 21:12:12', 0),
(12, NULL, 'GSK', 'in-stock', '', 'PO44354315', NULL, 'packing, GSK', 'GSK', 'Packing', 'Rachel', '07422818523', 'Top Street Way,  Harpenden, England', 'Dispatch GSK', '2021-08-26 15:00:00', NULL, '2021-08-26 16:00:00', 1),
(52, NULL, 'Novartis', 'Advanced shipping Notice', 'Jo Root', 'PO44354142', NULL, 'Novartis Dispatch', 'Manufacturer', 'Dispatch', 'Jimmy', '09732453135', 'chelmsford', 'DPD', '2021-09-03 20:08:00', NULL, '2021-09-03 21:08:00', 1),
(53, NULL, 'DPD', 'Intransist', 'Moryatry', 'PO44354142', NULL, 'DPD transport', 'logistic', 'transportantion', 'Holmes', '09876643342', 'Rainham', 'Superdrug', '2021-09-03 20:00:00', NULL, '2021-09-03 20:03:00', 1),
(54, NULL, 'Superdrug', 'Delivred', 'Moryatry', 'PO44354142', NULL, 'superdrug Inventory', 'Retailer', 'Inventory', 'Rachel', '09876643334', 'westham', '', '2021-09-04 20:14:00', NULL, '2021-09-04 21:10:00', 0),
(55, NULL, 'Sigma Pharmaceuticals plc', 'Advanced shipping Notice', 'Malan', 'PO44352233', NULL, 'Sigma Pharmaceuticals plc Warehouse dispatch', 'Manufacturer', 'Dispatch', 'Sam', '07918593181', 'Dartford', 'Hermes', '2021-09-09 06:30:00', NULL, '2021-09-09 07:00:00', 1),
(56, NULL, 'Hermes', 'InTransit', 'ollie', 'PO44352233', NULL, 'Hermes Transport', 'Logistics', 'Transport', 'Burns', '07918593789', 'Grays', 'W H Smith', '2021-09-09 06:30:00', NULL, '2021-09-09 07:15:00', 1),
(57, NULL, 'W H Smith', 'Delivered', 'Pollard', 'PO44352233', NULL, 'W H Smith Inventory', 'Distributor', 'Inventory', 'Saka', '07918591458', 'Purfleet', '', '2021-09-09 06:30:00', NULL, '2021-10-09 08:00:00', 0),
(58, NULL, 'WH SMITH', 'Intransist', 'David', 'PO4435567', NULL, 'Hermes pharma ltd', 'Distributor', 'Inventory', 'Stokes', '7421748539', 'Picadilli', 'Hermes', '2021-09-11 10:08:00', NULL, '2021-09-11 10:56:00', 1),
(59, NULL, 'Hermes', 'Intransist', 'David', 'PO4435567', NULL, 'Hermes pharma ltd', 'Logistics', 'Transport', 'Tailor', '7421748539', 'Picadilli', 'Tesco', '2021-09-11 20:08:00', NULL, '2021-09-11 20:56:00', 1),
(60, NULL, 'Tesco', 'Intransist', 'David', 'PO4435567', NULL, 'Hermes pharma ltd', 'Retailer', 'Inventory', 'Sancho', '7421748539', 'Picadilli', '', '2021-09-12 07:08:00', NULL, '2021-09-12 08:56:00', 0),
(61, NULL, 'WH SMITH', 'Advanced shipping Notice', 'David', 'PO44354314', NULL, 'WH Smith', 'Distributor', 'Dispatch', 'Stokes', '9883456522', 'Purfleet', 'Hermes', '2021-09-11 10:08:00', NULL, '2021-09-11 10:10:00', 1),
(62, NULL, 'Hermes', 'Intransit', 'David', 'PO44354314', NULL, 'Hermes Transport', 'Logistics', 'Transport', 'Sancho', '9883456523', 'Canary warf', 'ASDA', '2021-09-11 20:08:00', NULL, '2021-09-11 20:45:00', 1),
(63, NULL, 'ASDA', 'Delivered', '', 'PO44354314', NULL, 'ASDA', 'Retailer', 'Inventory Manager', 'Tokyo', '9883456524', 'isle of Dogs, London', '', '2021-09-12 20:45:00', NULL, '2021-09-12 20:45:00', 0),
(64, NULL, 'Gamaleya NRC', 'Advanced Shipping Notice', 'Roman Abramovich', 'PODFRT_09231', NULL, 'Shaping global transport & logistics', 'Logistics', 'Transport', 'Alexander Ovechkin', '+7 965 277 3414', '904,9TH FLOOR, CRESESNT, Mumbai,Maharashtra,400059', 'Dr. Reddy\'s Laboratories Ltd', '2021-09-18 08:29:00', NULL, '2021-09-18 08:29:00', 1),
(65, NULL, 'Gamaleya NRC', 'Advanced Shipping Notice', 'Roman Abramovich', 'PODFRT_09231', NULL, 'Shaping global transport & logistics', 'Logistics', 'Transport', 'Alexander Ovechkin', '+7 965 277 3414', '18 Gamaleya Street Moscow, Russia 123098', 'Dr. Reddy\'s Laboratories Ltd', '2021-09-18 08:29:00', NULL, '2021-09-18 08:29:00', 1),
(66, NULL, 'Gamaleya NRC', 'Advanced Shipping Notice', 'Roman Abramovich', 'PODFRT_09231', NULL, 'Shaping global transport & logistics', 'Logistics', 'Transport', 'Alexander Ovechkin', '+7 965 277 3414', '18 Gamaleya Street Moscow, Russia 123098', 'Dr. Reddy\'s Laboratories Ltd', '2021-09-18 08:29:00', NULL, '2021-09-18 08:29:00', 1),
(67, NULL, 'Distributor', 'Intrnasist', 'Rehman', 'PODFRT_09211', NULL, 'FedEX Logistics', 'Logistics', 'Transport', 'Mohan Krishna', '+919866617886', 'Apollo Pharmacy Shop No 13 Main Market Rk Puram Sec 3 Delhi 22 - 110022', 'Appolo Pharmcy', '2021-09-18 10:57:00', NULL, '2021-09-18 10:57:00', 1),
(68, 2, 'Taj Pharmaceuticals Ltd', 'Intransist', 'Rashool Shaik', 'PO44354315', 2, 'UPS Supply Chain Solutions', 'Logistics', 'Transport', 'Pheebe', '8007425727', '12380 Morris Rd, Alpharetta, GA 30005,USA', 'Alfresa Holdings', '2021-08-11 21:02:02', NULL, '2021-08-11 21:12:12', 1),
(69, 2, 'AbbVie Srl Ltd', 'Intransist', 'Peterson', 'PO44354316', 2, 'Fedex Logistics', 'Logistics', 'Transport', 'Rachel', '9136936151', 'Unit 9,', 'AmerisourceBergen', '2021-08-11 21:02:02', NULL, '2021-08-11 21:12:12', 1),
(70, 2, 'ORGANON FARMACEUTICA LTD', 'Intransist', 'Krishna', 'PO44354317', 2, 'DHL Supply Chain', 'Logistics', 'Transport', 'Gunther', '8004436379', 'Vikhroli West, Mumbai, Maharashtra,India 400083', 'Anda Inc.', '2021-08-11 21:02:02', NULL, '2021-08-11 21:12:12', 1),
(71, 2, 'BMS Pharmaceuticals Ltd', 'Intransist', 'Prasad', 'PO44354318', 2, 'J.B. Hunt Transport Services', 'Logistics', 'Transport', 'Ram Mohan', '9136936151', 'Lowell,', 'Cardinal Health', '2021-08-11 21:02:02', NULL, '2021-08-11 21:12:12', 1),
(72, 2, 'Celgene International S', 'Intransist', 'John', 'PO44354319', 2, 'DB Schenker Logistics', 'Logistics', 'Transport', 'Fareed', '8007425877', '12380 Morris Rd, Alpharetta, GA 30005,USA', 'CR Pharmaceutical', '2021-08-11 21:02:02', NULL, '2021-08-11 21:12:12', 1),
(73, 2, 'Celgene International S', 'Intransist', 'Rehman', 'PO44354320', 2, 'Nippon Express', 'Logistics', 'Transport', 'Karimulla', '4402439326', 'Unit 9,', 'CuraScript Special', '2021-08-11 21:02:02', NULL, '2021-08-11 21:12:12', 1),
(74, 2, 'Janssen-Cilag AG', 'Intransist', 'Jeswanth', 'PO44354321', 2, 'C.H. Robinson Worldwide', 'Logistics', 'Transport', 'Sai Kiran', '8882532748', 'Vikhroli West, Mumbai, Maharashtra,India 400083', 'Fortissa Limited', '2021-08-11 21:02:02', NULL, '2021-08-11 21:12:12', 1),
(75, 2, 'Sanofi-Aventis (Suisse) SA', 'Intransist', 'Kevin', 'PO44354322', 2, 'DSV Logistics', 'Logistics', 'Transport', 'Charles', '8005002224', 'Lowell,', 'H.D. Smith', '2021-08-11 21:02:02', NULL, '2021-08-11 21:12:12', 1),
(76, 2, 'BMS Pharmaceuticals Ltd', 'Intransist', 'Ram Mohan', 'PO44354323', 2, 'XPO Logistics', 'Logistics', 'Transport', 'Anderson', '8007425727', '12380 Morris Rd, Alpharetta, GA 30005,USA', 'Mawdsley-Brooks & Co. Ltd.', '2021-08-11 21:02:02', NULL, '2021-08-11 21:12:12', 1),
(77, 2, 'Pfizer Inc', 'Intransist', 'Fareed', 'PO44354324', 2, 'Expeditors International', 'Logistics', 'Transport', 'Rehman', '9136936151', 'Unit 9,', 'McKesson', '2021-08-11 21:02:02', NULL, '2021-08-11 21:12:12', 1),
(78, 2, 'Janssen Products LP', 'Intransist', 'Karimulla', 'PO44354325', 2, 'Dascher Logistics', 'Logistics', 'Transport', 'Jeswanth', '8004436379', 'Vikhroli West, Mumbai, Maharashtra,India 400083', 'MEDIPAL HOLDINGS', '2021-08-11 21:02:02', NULL, '2021-08-11 21:12:12', 1),
(79, 2, 'Moderna US, Inc', 'Intransist', 'Sai Kiran', 'PO44354326', 2, 'Ceva Logistics', 'Logistics', 'Transport', 'Kevin', '9136936151', 'Lowell,', 'Morris & Dickson Co. LLC', '2021-08-11 21:02:02', NULL, '2021-08-11 21:12:12', 1),
(80, 2, 'AstraZeneca', 'Intransist', 'Charles', 'PO44354327', 2, 'Sinotrans', 'Logistics', 'Transport', 'Ram Mohan', '8007425877', '12380 Morris Rd, Alpharetta, GA 30005,USA', 'North Carolina Mutual Wholesale Drug', '2021-08-11 21:02:02', NULL, '2021-08-11 21:12:12', 1),
(81, 2, 'Janssen Pharmaceutical Inc', 'Intransist', 'Anderson', 'PO44354328', 2, 'Panalpina Logistics', 'Logistics', 'Transport', 'Fareed', '4402439326', 'Unit 9,', 'Prodigy Health', '2021-08-11 21:02:02', NULL, '2021-08-11 21:12:12', 1),
(82, 2, 'Lake Erie Medical ', 'Intransist', 'Ram Mohan', 'PO44354329', 2, 'SNCF Geodis', 'Logistics', 'Transport', 'Karimulla', '8882532748', 'Vikhroli West, Mumbai, Maharashtra,India 400083', 'Shanghai Pharmaceutical Holdings.', '2021-08-11 21:02:02', NULL, '2021-08-11 21:12:12', 1),
(83, 2, 'Elvia Care Pvt Ltd', 'Intransist', 'Fareed', 'PO44354330', 2, 'Kintetsu Wrold Express', 'Logistics', 'Transport', 'Rashool Shaik', '8005002224', 'Lowell,', 'SINOPHARM', '2021-08-11 21:02:02', NULL, '2021-08-11 21:12:12', 1),
(84, 2, 'Concept Biosciences Pvt Ltd', 'Intransist', 'Karimulla', 'PO44354331', 2, 'NYK Group', 'Logistics', 'Transport', 'Peterson', '8007425727', '12380 Morris Rd, Alpharetta, GA 30005,USA', 'Smith Drug Company', '2021-08-11 21:02:02', NULL, '2021-08-11 21:12:12', 1),
(85, 2, 'Ved Lifesavers Pvt Ltd', 'Intransist', 'Sai Kiran', 'PO44354332', 2, 'Agility Logistics', 'Logistics', 'Transport', 'Krishna', '9136936151', 'Unit 9,', 'SUZUKEN', '2021-08-11 21:02:02', NULL, '2021-08-11 21:12:12', 1),
(86, 2, 'Ved Lifesavers Pvt Ltd', 'Intransist', 'Charles', 'PO44354333', 2, 'Hub Group', 'Logistics', 'Transport', 'Prasad', '8004436379', 'Vikhroli West, Mumbai, Maharashtra,India 400083', 'The', '2021-08-11 21:02:02', NULL, '2021-08-11 21:12:12', 1),
(87, 2, 'Ved Lifesavers Pvt Ltd', 'Intransist', 'Anderson', 'PO44354334', 2, 'Rhenus Logistics', 'Logistics', 'Transport', 'John', '9136936151', 'Lowell,', 'SINOPHARM', '2021-08-11 21:02:02', NULL, '2021-08-11 21:12:12', 1),
(88, NULL, '', 'Delivered', 'Shaffi', 'PODGE3', NULL, 'Appolo Pharma', 'Retailer', 'Seller', 'Krishna', '9866617886', 'VST Colony, Hyderabad, Telangana 500082', 'NA', '2021-10-06 15:36:00', '2021-10-05 15:36:00', '2021-10-02 15:36:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tp_users`
--

CREATE TABLE `tp_users` (
  `id` smallint NOT NULL COMMENT 'User Basic Profile',
  `user_id` varchar(30) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `user_title` varchar(10) DEFAULT NULL,
  `account_owner_id` smallint DEFAULT NULL COMMENT 'Company Account',
  `user_type_id` smallint DEFAULT NULL COMMENT 'FK User Type-Admin, User',
  `user_profile_pic` varchar(2000) DEFAULT NULL COMMENT 'S3 bucket URL',
  `profile_id` smallint DEFAULT NULL COMMENT 'User Address - optional',
  `access_profile_id` smallint DEFAULT NULL COMMENT 'All JOSON all menu, submenus',
  `last_access_time` timestamp NULL DEFAULT NULL COMMENT 'Last Access',
  `last_modified_time` timestamp NULL DEFAULT NULL COMMENT 'Profile modifications',
  `md5password` varchar(100) DEFAULT NULL,
  `contact_telehone` varchar(12) DEFAULT NULL,
  `email_address` varchar(100) DEFAULT NULL,
  `company_id` smallint DEFAULT NULL COMMENT 'FK General Company info',
  `sso_id` smallint DEFAULT NULL COMMENT 'Single Sign on ID Validated',
  `dept_name` varchar(100) DEFAULT NULL COMMENT 'Optional',
  `division` varchar(100) DEFAULT NULL COMMENT 'Optional',
  `contact_id` smallint DEFAULT NULL COMMENT 'FK_Contact',
  `company_category_id` smallint DEFAULT NULL COMMENT 'MFG, WH, DIS, RTL, PHARMA',
  `locale` varchar(30) DEFAULT NULL,
  `time_zone` varchar(100) DEFAULT NULL,
  `is_user_locked` tinyint(1) DEFAULT '0' COMMENT 'Default No',
  `is_active` tinyint(1) DEFAULT '1' COMMENT 'Default Yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `tp_user_login_history`
--

CREATE TABLE `tp_user_login_history` (
  `id` smallint NOT NULL,
  `user_id` smallint DEFAULT NULL COMMENT 'FK with tp_users',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `source_ip` varchar(20) DEFAULT NULL,
  `login_attempts` smallint DEFAULT NULL COMMENT ' No of attempts allowed - user profile',
  `logout_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `login_urls` varchar(4000) DEFAULT NULL COMMENT 'concatenate URLs',
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Stand-in structure for view `trace_gtin_unit_serial_number`
-- (See below for the actual view)
--
CREATE TABLE `trace_gtin_unit_serial_number` (
`id` smallint unsigned
,`location_id` smallint unsigned
,`owner_id` smallint unsigned
,`gtin` varchar(200)
,`product_name` varchar(100)
,`brand_name` varchar(50)
,`package_sn` varchar(50)
,`product_dispactch_id` smallint unsigned
,`transaction_location` smallint unsigned
,`transaction_owner` smallint unsigned
,`vw_trace_disb_to_retailer` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `trace_mfg_to_dis`
-- (See below for the actual view)
--
CREATE TABLE `trace_mfg_to_dis` (
`id` smallint unsigned
,`sscc_no` varchar(50)
,`product_dispatch_id` smallint unsigned
,`location_id` smallint unsigned
,`product_id` smallint unsigned
,`lot_id` smallint unsigned
,`owner_id` smallint unsigned
,`gtin` varchar(200)
,`product_name` varchar(100)
,`brand_name` varchar(50)
,`strength` varchar(50)
,`package_sn` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `ui_scms_delivery_fields`
--

CREATE TABLE `ui_scms_delivery_fields` (
  `id` smallint NOT NULL,
  `owner_id` smallint DEFAULT NULL,
  `field_name` varchar(200) DEFAULT NULL,
  `field_description` varchar(1000) DEFAULT NULL,
  `field_notes` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organisation` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postalcode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `organisation`, `address`, `city`, `state`, `country`, `postalcode`) VALUES
(1, 'roy', 'pbkdf2:sha256:150000$k1Ud5dzh$d0347f416e89ea486b33c988c9be65730329b2dd6d712f73c9920103a006a82e', 'roy@gmail.com', 'Manufacturer', 'Mumbai', 'Mumbai', 'Maharastra', 'India', '521229');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_all_pack_dispatch_info`
-- (See below for the actual view)
--
CREATE TABLE `vw_all_pack_dispatch_info` (
`id` smallint unsigned
,`sscc_no` varchar(50)
,`from_owner` varchar(200)
,`to_owner` varchar(200)
,`custodion` varchar(200)
,`event_type` varchar(50)
,`tran_event_type_id` smallint unsigned
,`transaction_timestamp` timestamp
,`package_sn` varchar(50)
,`package_pallet_sn` int
,`case_sn` int
,`from_owner_id` smallint
,`to_owner_id` smallint
,`current_owner_id` smallint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_all_pack_info`
-- (See below for the actual view)
--
CREATE TABLE `vw_all_pack_info` (
`id` smallint unsigned
,`package_sn` varchar(50)
,`case_id` smallint unsigned
,`case_sn` int
,`pallet_id` smallint unsigned
,`package_pallet_sn` int
,`dispatch_id` smallint unsigned
,`sscc_no` varchar(50)
,`gtin` varchar(200)
,`entry_point_gln` varchar(40)
,`gtin_id` smallint unsigned
,`item_check` tinyint
,`lot_id` smallint unsigned
,`batch_no` varchar(25)
,`product_name` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_all_pack_transaction`
-- (See below for the actual view)
--
CREATE TABLE `vw_all_pack_transaction` (
`id` smallint unsigned
,`sscc_no` varchar(50)
,`tran_event_type_id` smallint unsigned
,`transaction_timestamp` timestamp
,`package_sn` varchar(50)
,`package_pallet_sn` int
,`case_sn` int
,`event_type` varchar(50)
,`from_owner_id` smallint
,`to_owner_id` smallint
,`current_owner_id` smallint
,`current_owner_address_id` smallint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_case_count`
-- (See below for the actual view)
--
CREATE TABLE `vw_case_count` (
`id` smallint unsigned
,`package_pallet_sn` int
,`inner_count` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_dit_retailer_dispatch`
-- (See below for the actual view)
--
CREATE TABLE `vw_dit_retailer_dispatch` (
`id` smallint unsigned
,`sscc_no` varchar(50)
,`consigner` varchar(50)
,`consignee` varchar(50)
,`sender_location` varchar(100)
,`sender_loc_gln` varchar(15)
,`dispatch_location` varchar(100)
,`dispatch_loc_gln` varchar(15)
,`lsp_provider` varchar(100)
,`purchase_order` varchar(20)
,`package_type` varchar(20)
,`order_status` varchar(30)
,`owner_id` smallint unsigned
,`location_id` smallint unsigned
,`product_dispactch_id` smallint unsigned
,`product_id` smallint unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_item_check`
-- (See below for the actual view)
--
CREATE TABLE `vw_item_check` (
`id` smallint unsigned
,`COUNT(tp_package_primary.is_active)` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_item_count`
-- (See below for the actual view)
--
CREATE TABLE `vw_item_count` (
`id` smallint unsigned
,`COUNT(tp_package_primary.id)` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_item_list`
-- (See below for the actual view)
--
CREATE TABLE `vw_item_list` (
`id` smallint unsigned
,`package_sn` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_item_owner_history`
-- (See below for the actual view)
--
CREATE TABLE `vw_item_owner_history` (
`id` smallint unsigned
,`package_sn` varchar(50)
,`sscc_no` varchar(50)
,`owner_one` varchar(200)
,`timestamp_one` timestamp
,`tran_event_type_id` smallint unsigned
,`owner2_id` smallint unsigned
,`confrim_snpackage_sn_1` varchar(50)
,`confrim_sscc_2` varchar(50)
,`owner_two` varchar(200)
,`timestamp_two` timestamp
,`confrim_event2_id` smallint unsigned
,`owner3_id` smallint unsigned
,`confrim_snpackage_sn_3` varchar(50)
,`confrim_sscc_3` varchar(50)
,`owner_three` varchar(200)
,`timestamp_three` timestamp
,`confrim_event3_id` smallint unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_item_transactions`
-- (See below for the actual view)
--
CREATE TABLE `vw_item_transactions` (
`id` smallint unsigned
,`product_dispatch_id` smallint unsigned
,`sscc_no` varchar(50)
,`is_active` tinyint
,`tran_event_type_id` smallint unsigned
,`transaction_timestamp` timestamp
,`package_sn` varchar(50)
,`package_pallet_sn` int
,`case_sn` int
,`event_type` varchar(50)
,`item_status` varchar(50)
,`from_owner_id` smallint
,`to_owner_id` smallint
,`current_owner_id` smallint
,`current_owner_address_id` smallint
,`name_sender` varchar(200)
,`from_gln` varchar(40)
,`name_reciver` varchar(200)
,`to_gln` varchar(40)
,`consigner_address` varchar(200)
,`consignee_address` varchar(200)
,`lsp_name` varchar(200)
,`current_owner_name` varchar(200)
,`current_owner_gln` varchar(40)
,`current_owner_address` varchar(200)
,`exit_lat` varchar(50)
,`exit_long` varchar(50)
,`current_lat` varchar(15)
,`current_long` varchar(15)
,`product_gtin` varchar(200)
,`gtin_id` smallint unsigned
,`item_check` tinyint
,`lot_id` smallint unsigned
,`batch_no` varchar(25)
,`entry_point_owner` varchar(200)
,`entry_point_owner_location` varchar(200)
,`entry_lat` varchar(50)
,`entry_long` varchar(50)
,`exit_point_owner_location` varchar(200)
,`exit_point_owner` varchar(200)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_item_transactions_trace`
-- (See below for the actual view)
--
CREATE TABLE `vw_item_transactions_trace` (
`id` smallint unsigned
,`product_dispatch_id` smallint unsigned
,`sscc_no` varchar(50)
,`is_active` tinyint
,`tran_event_type_id` smallint unsigned
,`transaction_timestamp` timestamp
,`package_sn` varchar(50)
,`package_pallet_sn` int
,`case_sn` int
,`event_type` varchar(50)
,`item_status` varchar(50)
,`from_owner_id` smallint
,`to_owner_id` smallint
,`current_owner_id` smallint
,`current_owner_address_id` smallint
,`name_sender` varchar(200)
,`from_gln` varchar(40)
,`name_reciver` varchar(200)
,`to_gln` varchar(40)
,`sender_address` varchar(200)
,`reciver_address` varchar(200)
,`lsp_name` varchar(200)
,`current_owner_name` varchar(200)
,`current_owner_gln` varchar(40)
,`current_owner_address` varchar(200)
,`exit_lat` varchar(50)
,`exit_long` varchar(50)
,`current_lat` varchar(15)
,`current_long` varchar(15)
,`product_gtin` varchar(200)
,`gtin_id` smallint unsigned
,`item_check` tinyint
,`lot_id` smallint unsigned
,`batch_no` varchar(25)
,`entry_point_owner` varchar(200)
,`entry_point_owner_location` varchar(200)
,`entry_lat` varchar(50)
,`entry_long` varchar(50)
,`exit_point_owner_location` varchar(200)
,`exit_point_owner` varchar(200)
,`product_name` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_location_summary`
-- (See below for the actual view)
--
CREATE TABLE `vw_location_summary` (
`id` smallint unsigned
,`sscc_no` varchar(50)
,`tran_event_type_id` smallint unsigned
,`tranc_date_time` timestamp
,`package_sn` varchar(50)
,`package_pallet_sn` int
,`case_sn` int
,`event_type` varchar(50)
,`from_owner_id` smallint
,`to_owner_id` smallint
,`current_owner_id` smallint
,`current_owner_address_id` smallint
,`consigner` varchar(200)
,`consigner_gln` varchar(40)
,`consignee` varchar(200)
,`consignee_gln` varchar(40)
,`consigner_address` varchar(200)
,`consignee_address` varchar(200)
,`lsp_name` varchar(200)
,`current_owner` varchar(200)
,`company_gln` varchar(40)
,`street_address1` varchar(200)
,`entry_lat` varchar(50)
,`entry_long` varchar(50)
,`exit_latitude` varchar(50)
,`exit_long` varchar(50)
,`current_lat` varchar(15)
,`current_long` varchar(15)
,`current_location` varchar(250)
,`temperature` varchar(50)
,`humidity` varchar(50)
,`entry_point_gln` varchar(40)
,`exit_point_gln` varchar(19)
,`gtin` varchar(200)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_lot_check`
-- (See below for the actual view)
--
CREATE TABLE `vw_lot_check` (
`id` smallint unsigned
,`lot_count` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_lot_count`
-- (See below for the actual view)
--
CREATE TABLE `vw_lot_count` (
`id` smallint unsigned
,`COUNT(tp_product_lot.id)` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_lot_list`
-- (See below for the actual view)
--
CREATE TABLE `vw_lot_list` (
`id` smallint unsigned
,`batch_no` varchar(25)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_mfg_to_dist_order_transaction`
-- (See below for the actual view)
--
CREATE TABLE `vw_mfg_to_dist_order_transaction` (
`id` smallint unsigned
,`product_id` smallint unsigned
,`sscc_no` varchar(50)
,`consigner` varchar(50)
,`consignee` varchar(50)
,`sender_location` varchar(100)
,`sender_loc_gln` varchar(15)
,`dispatch_location` varchar(100)
,`dispatch_loc_gln` varchar(15)
,`lsp_provider` varchar(100)
,`purchase_order` varchar(20)
,`order_status` varchar(30)
,`package_type` varchar(9)
,`package_pallet_sn` int
,`dimensions_id` smallint unsigned
,`pallet_images_id` smallint unsigned
,`owner_id` smallint unsigned
,`location_id` smallint unsigned
,`product_name` varchar(100)
,`gtin` varchar(200)
,`brand_name` varchar(50)
,`labler_name` varchar(100)
,`strength` varchar(50)
,`product_discription` varchar(100)
,`patient_instruction` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_org1_sscc_list`
-- (See below for the actual view)
--
CREATE TABLE `vw_org1_sscc_list` (
`id` smallint unsigned
,`product_id` smallint unsigned
,`pallet_id` smallint unsigned
,`case_id` smallint unsigned
,`primary_pack_id` smallint unsigned
,`lot_id` smallint unsigned
,`iot_tracking_id` smallint
,`from_owner_id` smallint
,`to_owner_id` smallint
,`lsp_provider_id` smallint
,`location_id` smallint unsigned
,`owner_id` smallint unsigned
,`sscc_no` varchar(50)
,`GRAI` varchar(50)
,`GIAI` varchar(50)
,`consigner` varchar(50)
,`lsp_provider` varchar(100)
,`consignee` varchar(50)
,`sender_location` varchar(100)
,`sender_loc_gln` varchar(15)
,`dispatch_location` varchar(100)
,`dispatch_loc_gln` varchar(15)
,`container_dimensions` varchar(50)
,`package_dimentions` varchar(100)
,`package_net_weight` varchar(50)
,`package_gross_weight` varchar(50)
,`purchase_order` varchar(20)
,`order_qty` varchar(20)
,`sale_order` varchar(20)
,`package_type` varchar(20)
,`package_inside_units` int unsigned
,`package_inside_salable_units` varchar(20)
,`delivary_date` varchar(50)
,`invoice_no` varchar(11)
,`packaging_time` datetime
,`order_status` varchar(30)
,`recall` varchar(50)
,`company_id` smallint
,`category_id` smallint unsigned
,`organization_category` varchar(30)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_org3_sscc_list`
-- (See below for the actual view)
--
CREATE TABLE `vw_org3_sscc_list` (
`id` smallint unsigned
,`product_id` smallint unsigned
,`pallet_id` smallint unsigned
,`case_id` smallint unsigned
,`primary_pack_id` smallint unsigned
,`lot_id` smallint unsigned
,`iot_tracking_id` smallint
,`from_owner_id` smallint
,`to_owner_id` smallint
,`lsp_provider_id` smallint
,`location_id` smallint unsigned
,`owner_id` smallint unsigned
,`sscc_no` varchar(50)
,`GRAI` varchar(50)
,`GIAI` varchar(50)
,`consigner` varchar(50)
,`lsp_provider` varchar(100)
,`consignee` varchar(50)
,`sender_location` varchar(100)
,`sender_loc_gln` varchar(15)
,`dispatch_location` varchar(100)
,`dispatch_loc_gln` varchar(15)
,`container_dimensions` varchar(50)
,`package_dimentions` varchar(100)
,`package_net_weight` varchar(50)
,`package_gross_weight` varchar(50)
,`purchase_order` varchar(20)
,`order_qty` varchar(20)
,`sale_order` varchar(20)
,`package_type` varchar(20)
,`package_inside_units` int unsigned
,`package_inside_salable_units` varchar(20)
,`delivary_date` varchar(50)
,`invoice_no` varchar(11)
,`packaging_time` datetime
,`order_status` varchar(30)
,`recall` varchar(50)
,`company_id` smallint
,`category_id` smallint unsigned
,`organization_category` varchar(30)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_owner1_history`
-- (See below for the actual view)
--
CREATE TABLE `vw_owner1_history` (
`id` smallint unsigned
,`package_sn` varchar(50)
,`sscc_no` varchar(50)
,`owner_one` varchar(200)
,`timestamp_one` timestamp
,`tran_event_type_id` smallint unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_owner2_history`
-- (See below for the actual view)
--
CREATE TABLE `vw_owner2_history` (
`id` smallint unsigned
,`package_sn` varchar(50)
,`sscc_no` varchar(50)
,`owner_two` varchar(200)
,`timestamp_two` timestamp
,`tran_event_type_id` smallint unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_owner3_history`
-- (See below for the actual view)
--
CREATE TABLE `vw_owner3_history` (
`id` smallint unsigned
,`package_sn` varchar(50)
,`sscc_no` varchar(50)
,`owner_three` varchar(200)
,`timestamp_three` timestamp
,`tran_event_type_id` smallint unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_package`
-- (See below for the actual view)
--
CREATE TABLE `vw_package` (
`id` smallint unsigned
,`sscc_no` varchar(50)
,`product_gtin_id` smallint unsigned
,`gtin` varchar(200)
,`lot_id` smallint unsigned
,`batch_no` varchar(25)
,`package_inside_units` int unsigned
,`package_pallet_sn` int
,`height` varchar(50)
,`depth` varchar(50)
,`width` varchar(50)
,`total_dimensions` varchar(50)
,`shape` varchar(55)
,`colour` varchar(55)
,`package_type` varchar(20)
,`is_active` tinyint
,`inner_serail_count` bigint
,`inner_serail_list` text
,`package_gross_weight` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_package_count`
-- (See below for the actual view)
--
CREATE TABLE `vw_package_count` (
`id` smallint unsigned
,`COUNT(vw_package.id)` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_package_transaction`
-- (See below for the actual view)
--
CREATE TABLE `vw_package_transaction` (
`id` smallint unsigned
,`sscc_no` varchar(50)
,`grai` varchar(50)
,`giai` varchar(50)
,`purchase_order` varchar(20)
,`from_owner_id` smallint
,`to_owner_id` smallint
,`current_owner_id` smallint
,`from_address_id` smallint
,`to_address_id` smallint
,`current_location_id` smallint unsigned
,`transaction_timestamp` timestamp
,`transaction_status_id` smallint unsigned
,`transaction_type` varchar(50)
,`dimensions_id` smallint unsigned
,`pallet_images_id` smallint unsigned
,`is_active` tinyint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_package_transaction_owner`
-- (See below for the actual view)
--
CREATE TABLE `vw_package_transaction_owner` (
`id` smallint unsigned
,`sscc_no` varchar(50)
,`current_owner_id` smallint
,`current_owner_name` varchar(200)
,`event_type` varchar(50)
,`transaction_timestamp` timestamp
,`is_active` tinyint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_package_transaction_ref`
-- (See below for the actual view)
--
CREATE TABLE `vw_package_transaction_ref` (
`id` smallint unsigned
,`sscc_no` varchar(50)
,`GRAI` varchar(50)
,`GIAI` varchar(50)
,`purchase_order` varchar(20)
,`package_net_weight` varchar(50)
,`package_gross_weight` varchar(50)
,`is_active` tinyint
,`tran_event_type_id` smallint unsigned
,`tranc_date_time` timestamp
,`package_sn` varchar(50)
,`package_pallet_sn` int
,`case_sn` int
,`event_type` varchar(50)
,`from_owner_id` smallint
,`to_owner_id` smallint
,`current_owner_id` smallint
,`current_owner_address_id` smallint
,`consigner` varchar(200)
,`consigner_gln` varchar(40)
,`consignee` varchar(200)
,`consignee_gln` varchar(40)
,`consigner_address` varchar(200)
,`consignee_address` varchar(200)
,`lsp_name` varchar(200)
,`current_owner` varchar(200)
,`street_address1` varchar(200)
,`entry_lat` varchar(50)
,`entry_long` varchar(50)
,`exit_lat` varchar(50)
,`exit_long` varchar(50)
,`current_lat` varchar(15)
,`current_long` varchar(15)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_package_transaction_summary`
-- (See below for the actual view)
--
CREATE TABLE `vw_package_transaction_summary` (
`id` smallint unsigned
,`sscc_no` varchar(50)
,`GRAI` varchar(50)
,`GIAI` varchar(50)
,`purchase_order` varchar(20)
,`package_net_weight` varchar(50)
,`package_gross_weight` varchar(50)
,`is_active` tinyint
,`tran_event_type_id` smallint unsigned
,`tranc_date_time` timestamp
,`package_sn` varchar(50)
,`package_pallet_sn` int
,`case_sn` int
,`event_type` varchar(50)
,`from_owner_id` smallint
,`to_owner_id` smallint
,`current_owner_id` smallint
,`current_owner_address_id` smallint
,`consigner` varchar(200)
,`consigner_gln` varchar(40)
,`consignee` varchar(200)
,`consignee_gln` varchar(40)
,`consigner_address` varchar(200)
,`consignee_address` varchar(200)
,`lsp_name` varchar(200)
,`current_owner` varchar(200)
,`street_address1` varchar(200)
,`entry_lat` varchar(50)
,`entry_long` varchar(50)
,`exit_lat` varchar(50)
,`exit_long` varchar(50)
,`current_lat` varchar(15)
,`current_long` varchar(15)
,`inner_count` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_pack_item_transaction`
-- (See below for the actual view)
--
CREATE TABLE `vw_pack_item_transaction` (
`id` smallint unsigned
,`sscc_no` varchar(50)
,`tran_event_type_id` smallint unsigned
,`transaction_timestamp` timestamp
,`package_sn` varchar(50)
,`confrim_sscc_no` varchar(50)
,`dispatch_id` smallint unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_pack_previous`
-- (See below for the actual view)
--
CREATE TABLE `vw_pack_previous` (
`id` smallint unsigned
,`sscc_no` varchar(50)
,`previous_owner_id` smallint
,`previous_owner` varchar(200)
,`company_gln` varchar(40)
,`event_type` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_pack_previous_owner`
-- (See below for the actual view)
--
CREATE TABLE `vw_pack_previous_owner` (
`id` smallint unsigned
,`sscc_no` varchar(50)
,`previous_owner_id` smallint
,`previous_owner` varchar(200)
,`company_gln` varchar(40)
,`event_type` varchar(50)
,`event_type_id` smallint unsigned
,`transaction_timestamp` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_pack_tran`
-- (See below for the actual view)
--
CREATE TABLE `vw_pack_tran` (
`sscc_no` varchar(50)
,`transaction_type` varchar(50)
,`transaction_timestamp` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_pallet_images`
-- (See below for the actual view)
--
CREATE TABLE `vw_pallet_images` (
`id` smallint unsigned
,`sscc_no` varchar(50)
,`package_pallet_sn` int
,`images_id` smallint unsigned
,`dispatch_id` smallint unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_pallet_images_ref`
-- (See below for the actual view)
--
CREATE TABLE `vw_pallet_images_ref` (
`id` smallint unsigned
,`sscc_no` varchar(50)
,`GRAI` varchar(50)
,`GIAI` varchar(50)
,`purchase_order` varchar(20)
,`package_net_weight` varchar(50)
,`package_gross_weight` varchar(50)
,`is_active` tinyint
,`tran_event_type_id` smallint unsigned
,`tranc_date_time` timestamp
,`package_sn` varchar(50)
,`package_pallet_sn` int
,`case_sn` int
,`event_type` varchar(50)
,`from_owner_id` smallint
,`to_owner_id` smallint
,`current_owner_id` smallint
,`current_owner_address_id` smallint
,`consigner` varchar(200)
,`consigner_gln` varchar(40)
,`consignee` varchar(200)
,`consignee_gln` varchar(40)
,`consigner_address` varchar(200)
,`consignee_address` varchar(200)
,`lsp_name` varchar(200)
,`current_owner` varchar(200)
,`street_address1` varchar(200)
,`entry_lat` varchar(50)
,`entry_long` varchar(50)
,`exit_lat` varchar(50)
,`exit_long` varchar(50)
,`current_lat` varchar(15)
,`current_long` varchar(15)
,`pallet_id` smallint unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_product_check`
-- (See below for the actual view)
--
CREATE TABLE `vw_product_check` (
`id` smallint unsigned
,`product_check` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_product_count`
-- (See below for the actual view)
--
CREATE TABLE `vw_product_count` (
`id` smallint unsigned
,`product_count` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_tp_order_catalouge`
-- (See below for the actual view)
--
CREATE TABLE `vw_tp_order_catalouge` (
`product_dispactch_id` smallint unsigned
,`purchase_order` varchar(20)
,`primary_pack_id` smallint unsigned
,`package_sn` varchar(50)
,`gtin` varchar(200)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_trace_disb_to_retailer`
-- (See below for the actual view)
--
CREATE TABLE `vw_trace_disb_to_retailer` (
`product_dispactch_id` smallint unsigned
,`package_sn` varchar(50)
,`gtin` varchar(200)
,`dispatch_disp_to_retailer_id` smallint unsigned
,`sscc_no` varchar(50)
,`location_id` smallint unsigned
,`owner_id` smallint unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_trading_parties_info`
-- (See below for the actual view)
--
CREATE TABLE `vw_trading_parties_info` (
`id` smallint unsigned
,`sscc_no` varchar(50)
,`consigner_id` smallint
,`consignee_id` smallint
,`custodion_id` smallint
,`consigner_address_id` smallint
,`consignee_address_id` smallint
,`custodion_address_id` smallint
,`consigner_name` varchar(200)
,`consigner_gln` varchar(40)
,`consignee_name` varchar(200)
,`consignee_gln` varchar(40)
,`custodion_name` varchar(200)
,`custodion_gln` varchar(40)
,`consigner_address` varchar(200)
,`consignee_address` varchar(200)
,`custodion_address` varchar(200)
,`consigner_category_id` smallint unsigned
,`consigner_category` varchar(30)
,`consignee_category_id` smallint unsigned
,`consignee_category` varchar(30)
,`custodion_category_id` smallint unsigned
,`custodion_category` varchar(30)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_trading_parties_list_ref`
-- (See below for the actual view)
--
CREATE TABLE `vw_trading_parties_list_ref` (
`id` smallint unsigned
,`sscc_no` varchar(50)
,`GRAI` varchar(50)
,`GIAI` varchar(50)
,`purchase_order` varchar(20)
,`package_net_weight` varchar(50)
,`package_gross_weight` varchar(50)
,`is_active` tinyint
,`tran_event_type_id` smallint unsigned
,`tranc_date_time` timestamp
,`package_sn` varchar(50)
,`package_pallet_sn` int
,`case_sn` int
,`event_type` varchar(50)
,`from_owner_id` smallint
,`to_owner_id` smallint
,`current_owner_id` smallint
,`current_owner_address_id` smallint
,`consigner` varchar(200)
,`consigner_gln` varchar(40)
,`consignee` varchar(200)
,`consignee_gln` varchar(40)
,`consigner_address` varchar(200)
,`consignee_address` varchar(200)
,`lsp_name` varchar(200)
,`current_owner` varchar(200)
,`street_address1` varchar(200)
,`entry_lat` varchar(50)
,`entry_long` varchar(50)
,`exit_lat` varchar(50)
,`exit_long` varchar(50)
,`current_lat` varchar(15)
,`current_long` varchar(15)
,`consigner_id` smallint
,`consignee_id` smallint
,`custodion_id` smallint
,`consigner_address_id` smallint
,`consignee_address_id` smallint
,`custodion_address_id` smallint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_transaction_events`
-- (See below for the actual view)
--
CREATE TABLE `vw_transaction_events` (
`id` smallint unsigned
,`product_dispatch_id` smallint unsigned
,`sscc_no` varchar(50)
,`tran_event_type_id` smallint unsigned
,`transaction_timestamp` timestamp
,`package_sn` varchar(50)
,`package_pallet_sn` int
,`case_sn` int
,`event_type` varchar(50)
,`from_owner_id` smallint
,`to_owner_id` smallint
,`current_owner_id` smallint
,`current_owner_address_id` smallint
,`name_sender` varchar(200)
,`from_gln` varchar(40)
,`name_reciver` varchar(200)
,`to_gln` varchar(40)
,`current_owner_name` varchar(200)
,`current_owner_gln` varchar(40)
,`is_active` smallint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_transaction_events_test`
-- (See below for the actual view)
--
CREATE TABLE `vw_transaction_events_test` (
`id` smallint unsigned
,`product_dispatch_id` smallint unsigned
,`tran_event_type_id` smallint unsigned
,`from_owner_id` smallint
,`to_owner_id` smallint
,`current_owner_id` smallint
,`current_owner_address_id` smallint
,`transaction_timestamp` timestamp
,`is_active` smallint
,`name_sender` varchar(200)
,`from_gln` varchar(40)
,`name_reciver` varchar(200)
,`to_gln` varchar(40)
,`current_owner_name` varchar(200)
,`current_owner_gln` varchar(40)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_tran_timestamp_list`
-- (See below for the actual view)
--
CREATE TABLE `vw_tran_timestamp_list` (
);

-- --------------------------------------------------------

--
-- Structure for view `dit_retailer_dispatch`
--
DROP TABLE IF EXISTS `dit_retailer_dispatch`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `dit_retailer_dispatch`  AS  select `tp_product_dispatch_disp_to_retailer`.`id` AS `id`,`tp_product_dispatch_disp_to_retailer`.`sscc_no` AS `sscc_no`,`tp_product_dispatch_disp_to_retailer`.`consigner` AS `consigner`,`tp_product_dispatch_disp_to_retailer`.`consignee` AS `consignee`,`tp_product_dispatch_disp_to_retailer`.`sender_location` AS `sender_location`,`tp_product_dispatch_disp_to_retailer`.`sender_loc_gln` AS `sender_loc_gln`,`tp_product_dispatch_disp_to_retailer`.`dispatch_location` AS `dispatch_location`,`tp_product_dispatch_disp_to_retailer`.`dispatch_loc_gln` AS `dispatch_loc_gln`,`tp_product_dispatch_disp_to_retailer`.`lsp_provider` AS `lsp_provider`,`tp_product_dispatch_disp_to_retailer`.`purchase_order` AS `purchase_order`,`tp_product_dispatch_disp_to_retailer`.`order_status` AS `order_status`,`tp_product_dispatch_disp_to_retailer`.`owner_id` AS `owner_id`,`tp_product_dispatch_disp_to_retailer`.`location_id` AS `location_id`,`tp_disb_whol_order_catalogue`.`product_dispactch_id` AS `product_dispactch_id` from (`tp_product_dispatch_disp_to_retailer` join `tp_disb_whol_order_catalogue`) where (`tp_disb_whol_order_catalogue`.`id` = `tp_product_dispatch_disp_to_retailer`.`product_catelogue_id`) group by `tp_product_dispatch_disp_to_retailer`.`sscc_no` ;

-- --------------------------------------------------------

--
-- Structure for view `gtin_lot_details`
--
DROP TABLE IF EXISTS `gtin_lot_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `gtin_lot_details`  AS  select `tp_product_lot`.`id` AS `id`,`mt_product_gtin`.`gtin` AS `gtin`,`mt_product_gtin`.`product_name` AS `product_name`,`mt_product_gtin`.`brand_name` AS `brand_name`,`tp_product_lot`.`batch_no` AS `batch_no`,`tp_product_lot`.`mfg_date` AS `mfg_date`,`tp_product_lot`.`expiry_date` AS `expiry_date`,`tp_product_lot`.`total_qty` AS `total_qty` from (`mt_product_gtin` join `tp_product_lot`) where (`mt_product_gtin`.`id` = `tp_product_lot`.`product_id`) ;

-- --------------------------------------------------------

--
-- Structure for view `gtin_lot_item_list`
--
DROP TABLE IF EXISTS `gtin_lot_item_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `gtin_lot_item_list`  AS  select `tp_product_lot`.`id` AS `id`,`tp_product_lot`.`batch_no` AS `batch_no`,`tp_product_lot`.`mfg_date` AS `mfg_date`,`tp_product_lot`.`expiry_date` AS `expiry_date`,`tp_product_lot`.`total_qty` AS `lot_qty`,`mt_product_gtin`.`gtin` AS `gtin`,`mt_product_gtin`.`id` AS `product_id`,`mt_product_gtin`.`product_name` AS `product_name`,`mt_product_gtin`.`brand_name` AS `brand_name`,`mt_company`.`id` AS `company_id`,`mt_company`.`company_name` AS `company_name`,`mt_company`.`company_gln` AS `company_gln`,`mt_address`.`id` AS `company_address_id`,group_concat(distinct `tp_package_primary`.`package_sn` separator ',') AS `item_list` from ((((`mt_product_gtin` join `tp_product_lot`) join `mt_company`) join `mt_address`) join `tp_package_primary`) where ((`mt_product_gtin`.`id` = `tp_product_lot`.`product_id`) and (`tp_product_lot`.`id` = `tp_package_primary`.`lot_id`) and (`mt_company`.`id` = `mt_product_gtin`.`company_id`) and (`mt_address`.`id` = `mt_product_gtin`.`address_id`)) group by `tp_product_lot`.`batch_no` ;

-- --------------------------------------------------------

--
-- Structure for view `gtin_lot_item_pack_type_summary`
--
DROP TABLE IF EXISTS `gtin_lot_item_pack_type_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `gtin_lot_item_pack_type_summary`  AS  select `tp_package_primary`.`id` AS `id`,`tp_product_lot`.`id` AS `lot_id`,`mt_product_gtin`.`id` AS `product_id`,`mt_product_gtin`.`gtin` AS `gtin`,`mt_product_gtin`.`product_name` AS `product_name`,`mt_product_gtin`.`brand_name` AS `brand_name`,`tp_product_lot`.`batch_no` AS `batch_no`,`tp_product_lot`.`mfg_date` AS `mfg_date`,`tp_product_lot`.`expiry_date` AS `expiry_date`,`tp_product_lot`.`total_qty` AS `lot_total_qty`,`tp_package_primary`.`package_sn` AS `package_sn`,`tp_package_primary`.`is_active` AS `is_active`,`tp_package_primary`.`package_image` AS `package_image`,`tp_package_primary`.`ineer_package_count` AS `item_inner_count`,`tp_product_package`.`pack_type_id` AS `pack_type_id`,`tp_product_package_type`.`ndc_package_code` AS `item_pack_type`,`mt_company`.`company_name` AS `company_name`,`mt_address`.`street_address1` AS `mfg_address`,`mt_company`.`company_gln` AS `company_gln` from ((`mt_company` join `mt_address`) join ((((`mt_product_gtin` join `tp_product_lot`) join `tp_package_primary`) join `tp_product_package`) join `tp_product_package_type`)) where ((`mt_product_gtin`.`id` = `tp_product_lot`.`product_id`) and (`tp_product_lot`.`id` = `tp_package_primary`.`lot_id`) and (`tp_product_package`.`id` = `tp_package_primary`.`pack_type_id`) and (`tp_product_package_type`.`id` = `tp_product_package`.`pack_type_id`) and (`mt_company`.`id` = `mt_product_gtin`.`company_id`) and (`mt_address`.`id` = `mt_product_gtin`.`address_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `gtin_lot_summary`
--
DROP TABLE IF EXISTS `gtin_lot_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `gtin_lot_summary`  AS  select `tp_product_lot`.`id` AS `id`,`tp_product_lot`.`batch_no` AS `batch_no`,`tp_product_lot`.`mfg_date` AS `mfg_date`,`tp_product_lot`.`expiry_date` AS `expiry_date`,`tp_product_lot`.`total_qty` AS `lot_qty`,`tp_product_lot`.`is_active` AS `is_active`,`mt_product_gtin`.`gtin` AS `gtin`,`mt_product_gtin`.`id` AS `product_id`,`mt_product_gtin`.`product_name` AS `product_name`,`mt_product_gtin`.`brand_name` AS `brand_name`,`mt_company`.`id` AS `company_id`,`mt_company`.`company_name` AS `company_name`,`mt_company`.`company_gln` AS `company_gln`,`mt_address`.`id` AS `company_address_id`,`mt_address`.`street_address1` AS `mfg_address` from (((`mt_product_gtin` join `tp_product_lot`) join `mt_company`) join `mt_address`) where ((`mt_product_gtin`.`id` = `tp_product_lot`.`product_id`) and (`mt_company`.`id` = `mt_product_gtin`.`company_id`) and (`mt_address`.`id` = `mt_product_gtin`.`address_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `gtin_sscc_serial_number`
--
DROP TABLE IF EXISTS `gtin_sscc_serial_number`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `gtin_sscc_serial_number`  AS  select `mt_product_gtin`.`gtin` AS `gtin`,`mt_product_gtin`.`product_name` AS `product_name`,`tp_product_lot`.`batch_no` AS `batch_serial_no`,`tp_product_dispatch`.`sscc_no` AS `sscc_no` from ((`mt_product_gtin` join `tp_product_dispatch`) join `tp_product_lot`) where ((`mt_product_gtin`.`id` = `tp_product_dispatch`.`product_id`) and (`tp_product_lot`.`id` = `tp_product_dispatch`.`lot_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `gtin_summary`
--
DROP TABLE IF EXISTS `gtin_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `gtin_summary`  AS  select `mt_product_gtin`.`id` AS `id`,`mt_product_gtin`.`gtin` AS `gtin`,`mt_product_gtin`.`product_name` AS `product_name`,`mt_product_gtin`.`brand_name` AS `brand_name`,`mt_product_gtin`.`labler_name` AS `labler_name`,`mt_product_gtin`.`strength` AS `strength`,`mt_product_gtin`.`product_form` AS `product_form`,`mt_product_gtin`.`product_discription` AS `product_discription`,`mt_product_gtin`.`patient_instruction` AS `product_instruction`,`mt_product_gtin`.`product_image_url` AS `product_image_url`,`mt_product_gtin`.`product_ndc` AS `product_ndc`,`mt_company`.`id` AS `company_id`,`mt_company`.`company_name` AS `company_name`,`mt_company`.`company_gln` AS `company_gln`,`mt_company`.`gs1_company_prefix` AS `company_code`,`mt_organization_category`.`organization_category` AS `organization_category`,`mt_product_package_type`.`ndc_package_code` AS `packing_type`,`mt_product_package_type`.`container_size` AS `container_size`,`mt_product_package_type`.`container_qty` AS `container_qty`,`mt_product_package`.`pack_type_id` AS `pack_type_id`,`mt_product_gtin`.`is_active` AS `is_active` from ((((`mt_product_gtin` join `mt_company`) join `mt_organization_category`) join `mt_product_package_type`) join `mt_product_package`) where ((`mt_company`.`id` = `mt_product_gtin`.`company_id`) and (`mt_organization_category`.`id` = `mt_company`.`company_category_id`) and (`mt_product_gtin`.`id` = `mt_product_package`.`product_gtin_id`) and (`mt_product_package_type`.`id` = `mt_product_package`.`pack_type_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `gtin_unit_serial_number`
--
DROP TABLE IF EXISTS `gtin_unit_serial_number`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `gtin_unit_serial_number`  AS  select `mt_product_gtin`.`gtin` AS `gtin`,`mt_product_gtin`.`product_name` AS `product_name`,`tp_product_lot`.`batch_no` AS `batch_serial_no`,`tp_package_primary`.`package_sn` AS `package_sn`,`tp_package_primary`.`ineer_package_count` AS `ineer_package_count` from ((`mt_product_gtin` join `tp_package_primary`) join `tp_product_lot`) where ((`mt_product_gtin`.`id` = `tp_package_primary`.`product_id`) and (`tp_product_lot`.`id` = `tp_package_primary`.`lot_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `location_summary`
--
DROP TABLE IF EXISTS `location_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `location_summary`  AS  select `tp_transaction_events_test`.`id` AS `id`,`tp_product_dispatch`.`sscc_no` AS `sscc_no`,`vw_all_pack_info`.`package_sn` AS `package_sn`,`vw_all_pack_info`.`package_pallet_sn` AS `package_pallet_sn`,`vw_all_pack_info`.`case_sn` AS `case_sn`,`mt_event_transaction_type`.`event_type` AS `event_type`,`tp_transaction_events_test`.`from_owner_id` AS `from_owner_id`,`tp_transaction_events_test`.`to_owner_id` AS `to_owner_id`,`tp_transaction_events_test`.`current_owner_id` AS `current_owner_id`,`tp_transaction_events_test`.`current_owner_address_id` AS `current_owner_address_id`,`from_owner`.`company_name` AS `consigner`,`from_owner`.`company_gln` AS `consigner_gln`,`to_owner`.`company_name` AS `consignee`,`to_owner`.`company_gln` AS `consignee_gln`,`consigner_address`.`street_address1` AS `consigner_address`,`consignee_address`.`street_address1` AS `consignee_address`,`lsp_name`.`company_name` AS `lsp_name`,`current_owner`.`company_name` AS `current_owner`,`current_owner`.`company_gln` AS `current_company_gln`,`current_owner_address`.`street_address1` AS `street_address1`,`consigner_address`.`latitude` AS `entry_lat`,`consigner_address`.`longitude` AS `entry_long`,`consignee_address`.`latitude` AS `exit_latitude`,`consignee_address`.`longitude` AS `exit_long`,`tp_transaction_location`.`latitude` AS `current_lat`,`tp_transaction_location`.`longitude` AS `current_long`,`tp_transaction_location`.`current_location` AS `current_location`,`vw_all_pack_info`.`entry_point_gln` AS `entry_point_gln`,`tp_transaction_location`.`to_gln` AS `exit_point_gln`,`tp_transaction_location`.`recorded_time` AS `geo_last_rec_timestamp`,`tp_transaction_events_test`.`tran_event_type_id` AS `event_id`,`tp_transaction_events_test`.`transaction_timestamp` AS `tranc_date_time` from ((((((((`tp_transaction_location` join `mt_company` `from_owner`) join `mt_company` `to_owner`) join `mt_company` `lsp_name`) join `mt_address` `consigner_address`) join `mt_address` `consignee_address`) join `mt_company` `current_owner`) join `mt_address` `current_owner_address`) join (((`vw_all_pack_info` join `tp_transaction_events_test`) join `tp_product_dispatch`) join `mt_event_transaction_type`)) where ((`tp_product_dispatch`.`id` = `tp_transaction_events_test`.`product_dispatch_id`) and (`mt_event_transaction_type`.`id` = `tp_transaction_events_test`.`tran_event_type_id`) and (`from_owner`.`id` = `tp_product_dispatch`.`from_owner_id`) and (`to_owner`.`id` = `tp_product_dispatch`.`to_owner_id`) and (`lsp_name`.`id` = `tp_product_dispatch`.`lsp_provider_id`) and (`consigner_address`.`id` = `tp_product_dispatch`.`from_address_id`) and (`consignee_address`.`id` = `tp_product_dispatch`.`to_address_id`) and (`current_owner`.`id` = `tp_transaction_events_test`.`current_owner_id`) and (`current_owner_address`.`id` = `tp_transaction_events_test`.`current_owner_address_id`) and (`tp_transaction_location`.`id` = `tp_product_dispatch`.`location_id`) and (`tp_product_dispatch`.`sscc_no` = `vw_all_pack_info`.`sscc_no`)) ;

-- --------------------------------------------------------

--
-- Structure for view `loc_sum`
--
DROP TABLE IF EXISTS `loc_sum`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `loc_sum`  AS  select `ms`.`id` AS `id`,`ms`.`product_id` AS `product_id`,`ms`.`pallet_id` AS `pallet_id`,`ms`.`case_id` AS `case_id`,`ms`.`primary_pack_id` AS `primary_pack_id`,`ms`.`lot_id` AS `lot_id`,`ms`.`iot_tracking_id` AS `iot_tracking_id`,`ms`.`from_owner_id` AS `from_owner_id`,`ms`.`to_owner_id` AS `to_owner_id`,`ms`.`lsp_provider_id` AS `lsp_provider_id`,`ms`.`from_address_id` AS `from_address_id`,`ms`.`to_address_id` AS `to_address_id`,`ms`.`lsp_address_id` AS `lsp_address_id`,`ms`.`location_id` AS `location_id`,`ms`.`owner_id` AS `owner_id`,`ms`.`sscc_no` AS `sscc_no`,`ms`.`GRAI` AS `GRAI`,`ms`.`GIAI` AS `GIAI`,`ms`.`consigner` AS `consigner`,`ms`.`lsp_provider` AS `lsp_provider`,`ms`.`consignee` AS `consignee`,`ms`.`sender_location` AS `sender_location`,`ms`.`sender_loc_gln` AS `sender_loc_gln`,`ms`.`dispatch_location` AS `dispatch_location`,`ms`.`dispatch_loc_gln` AS `dispatch_loc_gln`,`ms`.`container_dimensions` AS `container_dimensions`,`ms`.`package_dimentions` AS `package_dimentions`,`ms`.`package_net_weight` AS `package_net_weight`,`ms`.`package_gross_weight` AS `package_gross_weight`,`ms`.`purchase_order` AS `purchase_order`,`ms`.`order_qty` AS `order_qty`,`ms`.`sale_order` AS `sale_order`,`ms`.`package_type` AS `package_type`,`ms`.`package_inside_units` AS `package_inside_units`,`ms`.`package_inside_salable_units` AS `package_inside_salable_units`,`ms`.`delivary_date` AS `delivary_date`,`ms`.`invoice_no` AS `invoice_no`,`ms`.`packaging_time` AS `packaging_time`,`ms`.`order_status` AS `order_status`,`ms`.`recall` AS `recall`,`from_address`.`latitude` AS `entry_lat`,`from_address`.`longitude` AS `entry_long`,`to_address`.`latitude` AS `exit_latitude`,`to_address`.`longitude` AS `exit_long` from ((`tp_product_dispatch` `ms` left join `mt_address` `from_address` on((`ms`.`from_address_id` = `from_address`.`id`))) left join `mt_address` `to_address` on((`ms`.`to_address_id` = `to_address`.`id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `org1_sscc_list`
--
DROP TABLE IF EXISTS `org1_sscc_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `org1_sscc_list`  AS  select `tp_product_dispatch`.`id` AS `id`,`tp_product_dispatch`.`product_id` AS `product_id`,`tp_product_dispatch`.`pallet_id` AS `pallet_id`,`tp_product_dispatch`.`case_id` AS `case_id`,`tp_product_dispatch`.`primary_pack_id` AS `primary_pack_id`,`tp_product_dispatch`.`lot_id` AS `lot_id`,`tp_product_dispatch`.`iot_tracking_id` AS `iot_tracking_id`,`tp_product_dispatch`.`from_owner_id` AS `from_owner_id`,`tp_product_dispatch`.`to_owner_id` AS `to_owner_id`,`tp_product_dispatch`.`lsp_provider_id` AS `lsp_provider_id`,`tp_product_dispatch`.`location_id` AS `location_id`,`tp_product_dispatch`.`owner_id` AS `owner_id`,`tp_product_dispatch`.`sscc_no` AS `sscc_no`,`tp_product_dispatch`.`GRAI` AS `GRAI`,`tp_product_dispatch`.`GIAI` AS `GIAI`,`tp_product_dispatch`.`consigner` AS `consigner`,`tp_product_dispatch`.`lsp_provider` AS `lsp_provider`,`tp_product_dispatch`.`consignee` AS `consignee`,`tp_product_dispatch`.`sender_location` AS `sender_location`,`tp_product_dispatch`.`sender_loc_gln` AS `sender_loc_gln`,`tp_product_dispatch`.`dispatch_location` AS `dispatch_location`,`tp_product_dispatch`.`dispatch_loc_gln` AS `dispatch_loc_gln`,`tp_product_dispatch`.`container_dimensions` AS `container_dimensions`,`tp_product_dispatch`.`package_dimentions` AS `package_dimentions`,`tp_product_dispatch`.`package_net_weight` AS `package_net_weight`,`tp_product_dispatch`.`package_gross_weight` AS `package_gross_weight`,`tp_product_dispatch`.`purchase_order` AS `purchase_order`,`tp_product_dispatch`.`order_qty` AS `order_qty`,`tp_product_dispatch`.`sale_order` AS `sale_order`,`tp_product_dispatch`.`package_type` AS `package_type`,`tp_product_dispatch`.`package_inside_units` AS `package_inside_units`,`tp_product_dispatch`.`package_inside_salable_units` AS `package_inside_salable_units`,`tp_product_dispatch`.`delivary_date` AS `delivary_date`,`tp_product_dispatch`.`invoice_no` AS `invoice_no`,`tp_product_dispatch`.`packaging_time` AS `packaging_time`,`tp_product_dispatch`.`order_status` AS `order_status`,`tp_product_dispatch`.`recall` AS `recall`,`mt_company`.`id` AS `company_id`,`mt_organization_category`.`id` AS `category_id`,`mt_organization_category`.`organization_category` AS `organization_category` from ((`tp_product_dispatch` join `mt_company`) join `mt_organization_category`) where ((`mt_company`.`id` = `tp_product_dispatch`.`from_owner_id`) and (`mt_organization_category`.`id` = `mt_company`.`company_category_id`) and (`mt_organization_category`.`id` = 1)) group by `tp_product_dispatch`.`sscc_no` ;

-- --------------------------------------------------------

--
-- Structure for view `sscc_pallet_sn_case_serail_numbers`
--
DROP TABLE IF EXISTS `sscc_pallet_sn_case_serail_numbers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `sscc_pallet_sn_case_serail_numbers`  AS  select `tp_product_dispatch`.`id` AS `id`,`tp_product_dispatch`.`sscc_no` AS `sscc_no`,`mt_product_gtin`.`product_name` AS `product_name`,`tp_product_lot`.`batch_no` AS `batch_no`,`tp_package_pallet`.`package_pallet_sn` AS `package_pallet_sn`,group_concat(distinct `tp_package_case`.`package_sn` separator ',') AS `case_numbers` from ((((`tp_package_case` join `mt_product_gtin`) join `tp_product_lot`) join `tp_package_pallet`) join `tp_product_dispatch`) where ((`mt_product_gtin`.`id` = `tp_product_dispatch`.`product_id`) and (`tp_product_lot`.`id` = `tp_product_dispatch`.`lot_id`) and (`tp_package_pallet`.`id` = `tp_product_dispatch`.`pallet_id`) and (`tp_package_case`.`id` = `tp_product_dispatch`.`case_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `trace_gtin_unit_serial_number`
--
DROP TABLE IF EXISTS `trace_gtin_unit_serial_number`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `trace_gtin_unit_serial_number`  AS  select `trace_mfg_to_dis`.`id` AS `id`,`trace_mfg_to_dis`.`location_id` AS `location_id`,`trace_mfg_to_dis`.`owner_id` AS `owner_id`,`trace_mfg_to_dis`.`gtin` AS `gtin`,`trace_mfg_to_dis`.`product_name` AS `product_name`,`trace_mfg_to_dis`.`brand_name` AS `brand_name`,`trace_mfg_to_dis`.`package_sn` AS `package_sn`,`vw_trace_disb_to_retailer`.`product_dispactch_id` AS `product_dispactch_id`,`vw_trace_disb_to_retailer`.`location_id` AS `transaction_location`,`vw_trace_disb_to_retailer`.`owner_id` AS `transaction_owner`,`vw_trace_disb_to_retailer`.`package_sn` AS `vw_trace_disb_to_retailer` from (`trace_mfg_to_dis` left join `vw_trace_disb_to_retailer` on((`trace_mfg_to_dis`.`id` = `vw_trace_disb_to_retailer`.`product_dispactch_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `trace_mfg_to_dis`
--
DROP TABLE IF EXISTS `trace_mfg_to_dis`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `trace_mfg_to_dis`  AS  select `tp_product_dispatch`.`id` AS `id`,`tp_product_dispatch`.`sscc_no` AS `sscc_no`,`tp_product_dispatch`.`id` AS `product_dispatch_id`,`tp_product_dispatch`.`location_id` AS `location_id`,`mt_product_gtin`.`id` AS `product_id`,`tp_product_lot`.`id` AS `lot_id`,`tp_product_dispatch`.`owner_id` AS `owner_id`,`mt_product_gtin`.`gtin` AS `gtin`,`mt_product_gtin`.`product_name` AS `product_name`,`mt_product_gtin`.`brand_name` AS `brand_name`,`mt_product_gtin`.`strength` AS `strength`,`tp_package_primary`.`package_sn` AS `package_sn` from (((`mt_product_gtin` join `tp_package_primary`) join `tp_product_dispatch`) join `tp_product_lot`) where ((`mt_product_gtin`.`id` = `tp_product_dispatch`.`product_id`) and (`tp_package_primary`.`id` = `tp_product_dispatch`.`primary_pack_id`) and (`tp_product_lot`.`id` = `tp_product_dispatch`.`lot_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_all_pack_dispatch_info`
--
DROP TABLE IF EXISTS `vw_all_pack_dispatch_info`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `vw_all_pack_dispatch_info`  AS  select `tp_transaction_events_test`.`id` AS `id`,`tp_product_dispatch`.`sscc_no` AS `sscc_no`,`mt_company`.`company_name` AS `from_owner`,`to_owner`.`company_name` AS `to_owner`,`custodion`.`company_name` AS `custodion`,`mt_event_transaction_type`.`event_type` AS `event_type`,`tp_transaction_events_test`.`tran_event_type_id` AS `tran_event_type_id`,`tp_transaction_events_test`.`transaction_timestamp` AS `transaction_timestamp`,`vw_all_pack_info`.`package_sn` AS `package_sn`,`vw_all_pack_info`.`package_pallet_sn` AS `package_pallet_sn`,`vw_all_pack_info`.`case_sn` AS `case_sn`,`tp_transaction_events_test`.`from_owner_id` AS `from_owner_id`,`tp_transaction_events_test`.`to_owner_id` AS `to_owner_id`,`tp_transaction_events_test`.`current_owner_id` AS `current_owner_id` from ((((((`mt_company` join `mt_company` `to_owner`) join `mt_company` `custodion`) join `vw_all_pack_info`) join `tp_transaction_events_test`) join `tp_product_dispatch`) join `mt_event_transaction_type`) where ((`tp_product_dispatch`.`id` = `tp_transaction_events_test`.`product_dispatch_id`) and (`mt_event_transaction_type`.`id` = `tp_transaction_events_test`.`tran_event_type_id`) and (`mt_company`.`id` = `tp_product_dispatch`.`from_owner_id`) and (`to_owner`.`id` = `tp_product_dispatch`.`to_owner_id`) and (`custodion`.`id` = `tp_product_dispatch`.`lsp_provider_id`) and (`tp_product_dispatch`.`sscc_no` = `vw_all_pack_info`.`sscc_no`)) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_all_pack_info`
--
DROP TABLE IF EXISTS `vw_all_pack_info`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `vw_all_pack_info`  AS  select `tp_package_primary`.`id` AS `id`,`tp_package_primary`.`package_sn` AS `package_sn`,`tp_package_case`.`id` AS `case_id`,`tp_package_case`.`package_sn` AS `case_sn`,`tp_package_pallet`.`id` AS `pallet_id`,`tp_package_pallet`.`package_pallet_sn` AS `package_pallet_sn`,`tp_product_dispatch`.`id` AS `dispatch_id`,`tp_product_dispatch`.`sscc_no` AS `sscc_no`,`mt_product_gtin`.`gtin` AS `gtin`,`mt_company`.`company_gln` AS `entry_point_gln`,`mt_product_gtin`.`id` AS `gtin_id`,`tp_package_primary`.`is_active` AS `item_check`,`tp_product_lot`.`id` AS `lot_id`,`tp_product_lot`.`batch_no` AS `batch_no`,`mt_product_gtin`.`product_name` AS `product_name` from (`tp_product_lot` join ((`mt_company` join `mt_product_gtin`) join (((`tp_package_primary` join `tp_package_case`) join `tp_package_pallet`) join `tp_product_dispatch`))) where ((`mt_company`.`id` = `mt_product_gtin`.`company_id`) and (`mt_product_gtin`.`id` = `tp_package_primary`.`product_id`) and (`tp_product_lot`.`id` = `tp_package_primary`.`lot_id`) and (`tp_package_primary`.`id` = `tp_package_case`.`primary_package_id`) and (`tp_package_case`.`id` = `tp_package_pallet`.`case_id`) and (`tp_package_pallet`.`id` = `tp_product_dispatch`.`id`)) order by `tp_package_case`.`id` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_all_pack_transaction`
--
DROP TABLE IF EXISTS `vw_all_pack_transaction`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `vw_all_pack_transaction`  AS  select `tp_transaction_events_test`.`id` AS `id`,`tp_product_dispatch`.`sscc_no` AS `sscc_no`,`tp_transaction_events_test`.`tran_event_type_id` AS `tran_event_type_id`,`tp_transaction_events_test`.`transaction_timestamp` AS `transaction_timestamp`,`vw_all_pack_info`.`package_sn` AS `package_sn`,`vw_all_pack_info`.`package_pallet_sn` AS `package_pallet_sn`,`vw_all_pack_info`.`case_sn` AS `case_sn`,`mt_event_transaction_type`.`event_type` AS `event_type`,`tp_transaction_events_test`.`from_owner_id` AS `from_owner_id`,`tp_transaction_events_test`.`to_owner_id` AS `to_owner_id`,`tp_transaction_events_test`.`current_owner_id` AS `current_owner_id`,`tp_transaction_events_test`.`current_owner_address_id` AS `current_owner_address_id` from (((`vw_all_pack_info` join `tp_transaction_events_test`) join `tp_product_dispatch`) join `mt_event_transaction_type`) where ((`tp_product_dispatch`.`id` = `tp_transaction_events_test`.`product_dispatch_id`) and (`mt_event_transaction_type`.`id` = `tp_transaction_events_test`.`tran_event_type_id`) and (`tp_product_dispatch`.`sscc_no` = `vw_all_pack_info`.`sscc_no`)) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_case_count`
--
DROP TABLE IF EXISTS `vw_case_count`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `vw_case_count`  AS  select `tp_package_pallet`.`id` AS `id`,`tp_package_pallet`.`package_pallet_sn` AS `package_pallet_sn`,count(distinct `tp_package_case`.`package_sn`) AS `inner_count` from (`tp_package_pallet` join `tp_package_case`) where (`tp_package_case`.`id` = `tp_package_pallet`.`case_id`) group by `tp_package_pallet`.`package_pallet_sn` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_dit_retailer_dispatch`
--
DROP TABLE IF EXISTS `vw_dit_retailer_dispatch`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `vw_dit_retailer_dispatch`  AS  select `tp_product_dispatch_disp_to_retailer`.`id` AS `id`,`tp_product_dispatch_disp_to_retailer`.`sscc_no` AS `sscc_no`,`tp_product_dispatch_disp_to_retailer`.`consigner` AS `consigner`,`tp_product_dispatch_disp_to_retailer`.`consignee` AS `consignee`,`tp_product_dispatch_disp_to_retailer`.`sender_location` AS `sender_location`,`tp_product_dispatch_disp_to_retailer`.`sender_loc_gln` AS `sender_loc_gln`,`tp_product_dispatch_disp_to_retailer`.`dispatch_location` AS `dispatch_location`,`tp_product_dispatch_disp_to_retailer`.`dispatch_loc_gln` AS `dispatch_loc_gln`,`tp_product_dispatch_disp_to_retailer`.`lsp_provider` AS `lsp_provider`,`tp_product_dispatch_disp_to_retailer`.`purchase_order` AS `purchase_order`,`tp_product_dispatch_disp_to_retailer`.`package_type` AS `package_type`,`tp_product_dispatch_disp_to_retailer`.`order_status` AS `order_status`,`tp_product_dispatch_disp_to_retailer`.`owner_id` AS `owner_id`,`tp_product_dispatch_disp_to_retailer`.`location_id` AS `location_id`,`tp_disb_whol_order_catalogue`.`product_dispactch_id` AS `product_dispactch_id`,`mt_product_gtin`.`id` AS `product_id` from (((`tp_product_dispatch_disp_to_retailer` join `tp_disb_whol_order_catalogue`) join `mt_product_gtin`) join `tp_package_pallet`) where (`tp_disb_whol_order_catalogue`.`id` = `tp_product_dispatch_disp_to_retailer`.`product_catelogue_id`) group by `tp_product_dispatch_disp_to_retailer`.`sscc_no` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_item_check`
--
DROP TABLE IF EXISTS `vw_item_check`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `vw_item_check`  AS  select `tp_package_primary`.`id` AS `id`,count(`tp_package_primary`.`is_active`) AS `COUNT(tp_package_primary.is_active)` from `tp_package_primary` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_item_count`
--
DROP TABLE IF EXISTS `vw_item_count`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `vw_item_count`  AS  select `tp_package_primary`.`id` AS `id`,count(`tp_package_primary`.`id`) AS `COUNT(tp_package_primary.id)` from `tp_package_primary` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_item_list`
--
DROP TABLE IF EXISTS `vw_item_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `vw_item_list`  AS  select `tp_package_primary`.`id` AS `id`,`tp_package_primary`.`package_sn` AS `package_sn` from `tp_package_primary` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_item_owner_history`
--
DROP TABLE IF EXISTS `vw_item_owner_history`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `vw_item_owner_history`  AS  select `vw_owner1_history`.`id` AS `id`,`vw_owner1_history`.`package_sn` AS `package_sn`,`vw_owner1_history`.`sscc_no` AS `sscc_no`,`vw_owner1_history`.`owner_one` AS `owner_one`,`vw_owner1_history`.`timestamp_one` AS `timestamp_one`,`vw_owner1_history`.`tran_event_type_id` AS `tran_event_type_id`,`vw_owner2_history`.`id` AS `owner2_id`,`vw_owner2_history`.`package_sn` AS `confrim_snpackage_sn_1`,`vw_owner2_history`.`sscc_no` AS `confrim_sscc_2`,`vw_owner2_history`.`owner_two` AS `owner_two`,`vw_owner2_history`.`timestamp_two` AS `timestamp_two`,`vw_owner2_history`.`tran_event_type_id` AS `confrim_event2_id`,`vw_owner3_history`.`id` AS `owner3_id`,`vw_owner3_history`.`package_sn` AS `confrim_snpackage_sn_3`,`vw_owner3_history`.`sscc_no` AS `confrim_sscc_3`,`vw_owner3_history`.`owner_three` AS `owner_three`,`vw_owner3_history`.`timestamp_three` AS `timestamp_three`,`vw_owner3_history`.`tran_event_type_id` AS `confrim_event3_id` from ((`vw_owner1_history` join `vw_owner3_history`) join `vw_owner2_history`) where ((`vw_owner3_history`.`package_sn` = `vw_owner1_history`.`package_sn`) and (`vw_owner2_history`.`package_sn` = `vw_owner1_history`.`package_sn`)) group by `vw_owner1_history`.`id` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_item_transactions`
--
DROP TABLE IF EXISTS `vw_item_transactions`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `vw_item_transactions`  AS  select `tp_transaction_events_test`.`id` AS `id`,`tp_product_dispatch`.`id` AS `product_dispatch_id`,`tp_product_dispatch`.`sscc_no` AS `sscc_no`,`tp_product_dispatch`.`is_active` AS `is_active`,`tp_transaction_events_test`.`tran_event_type_id` AS `tran_event_type_id`,`tp_transaction_events_test`.`transaction_timestamp` AS `transaction_timestamp`,`vw_all_pack_info`.`package_sn` AS `package_sn`,`vw_all_pack_info`.`package_pallet_sn` AS `package_pallet_sn`,`vw_all_pack_info`.`case_sn` AS `case_sn`,`mt_event_transaction_type`.`event_type` AS `event_type`,`mt_event_transaction_type`.`event_type` AS `item_status`,`tp_transaction_events_test`.`from_owner_id` AS `from_owner_id`,`tp_transaction_events_test`.`to_owner_id` AS `to_owner_id`,`tp_transaction_events_test`.`current_owner_id` AS `current_owner_id`,`tp_transaction_events_test`.`current_owner_address_id` AS `current_owner_address_id`,`from_owner`.`company_name` AS `name_sender`,`from_owner`.`company_gln` AS `from_gln`,`to_owner`.`company_name` AS `name_reciver`,`to_owner`.`company_gln` AS `to_gln`,`consigner_address`.`street_address1` AS `consigner_address`,`consignee_address`.`street_address1` AS `consignee_address`,`lsp_name`.`company_name` AS `lsp_name`,`current_owner`.`company_name` AS `current_owner_name`,`current_owner`.`company_gln` AS `current_owner_gln`,`current_owner_address`.`street_address1` AS `current_owner_address`,`consignee_address`.`latitude` AS `exit_lat`,`consignee_address`.`longitude` AS `exit_long`,`tp_transaction_location`.`latitude` AS `current_lat`,`tp_transaction_location`.`longitude` AS `current_long`,`vw_all_pack_info`.`gtin` AS `product_gtin`,`vw_all_pack_info`.`gtin_id` AS `gtin_id`,`vw_all_pack_info`.`item_check` AS `item_check`,`vw_all_pack_info`.`lot_id` AS `lot_id`,`vw_all_pack_info`.`batch_no` AS `batch_no`,`mt_company`.`company_name` AS `entry_point_owner`,`mt_address`.`street_address1` AS `entry_point_owner_location`,`mt_address`.`latitude` AS `entry_lat`,`mt_address`.`longitude` AS `entry_long`,`consignee_address`.`street_address1` AS `exit_point_owner_location`,`to_owner`.`company_name` AS `exit_point_owner` from ((`mt_company` join `mt_address`) join ((((((((`tp_transaction_location` join `mt_company` `from_owner`) join `mt_company` `to_owner`) join `mt_company` `lsp_name`) join `mt_address` `consigner_address`) join `mt_address` `consignee_address`) join `mt_company` `current_owner`) join `mt_address` `current_owner_address`) join (((`vw_all_pack_info` join `tp_transaction_events_test`) join `tp_product_dispatch`) join `mt_event_transaction_type`))) where ((`tp_product_dispatch`.`id` = `tp_transaction_events_test`.`product_dispatch_id`) and (`mt_event_transaction_type`.`id` = `tp_transaction_events_test`.`tran_event_type_id`) and (`from_owner`.`id` = `tp_product_dispatch`.`from_owner_id`) and (`to_owner`.`id` = `tp_product_dispatch`.`to_owner_id`) and (`lsp_name`.`id` = `tp_product_dispatch`.`lsp_provider_id`) and (`consigner_address`.`id` = `tp_product_dispatch`.`from_address_id`) and (`consignee_address`.`id` = `tp_product_dispatch`.`to_address_id`) and (`current_owner`.`id` = `tp_transaction_events_test`.`current_owner_id`) and (`current_owner_address`.`id` = `tp_transaction_events_test`.`current_owner_address_id`) and (`mt_company`.`id` = `vw_all_pack_info`.`gtin_id`) and (`mt_address`.`id` = `vw_all_pack_info`.`gtin_id`) and (`tp_transaction_location`.`id` = `tp_product_dispatch`.`location_id`) and (`tp_product_dispatch`.`sscc_no` = `vw_all_pack_info`.`sscc_no`)) order by `tp_transaction_events_test`.`id` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_item_transactions_trace`
--
DROP TABLE IF EXISTS `vw_item_transactions_trace`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `vw_item_transactions_trace`  AS  select `tp_transaction_events_test`.`id` AS `id`,`tp_product_dispatch`.`id` AS `product_dispatch_id`,`tp_product_dispatch`.`sscc_no` AS `sscc_no`,`tp_product_dispatch`.`is_active` AS `is_active`,`tp_transaction_events_test`.`tran_event_type_id` AS `tran_event_type_id`,`tp_transaction_events_test`.`transaction_timestamp` AS `transaction_timestamp`,`vw_all_pack_info`.`package_sn` AS `package_sn`,`vw_all_pack_info`.`package_pallet_sn` AS `package_pallet_sn`,`vw_all_pack_info`.`case_sn` AS `case_sn`,`mt_event_transaction_type`.`event_type` AS `event_type`,`mt_event_transaction_type`.`event_type` AS `item_status`,`tp_transaction_events_test`.`from_owner_id` AS `from_owner_id`,`tp_transaction_events_test`.`to_owner_id` AS `to_owner_id`,`tp_transaction_events_test`.`current_owner_id` AS `current_owner_id`,`tp_transaction_events_test`.`current_owner_address_id` AS `current_owner_address_id`,`from_owner`.`company_name` AS `name_sender`,`from_owner`.`company_gln` AS `from_gln`,`to_owner`.`company_name` AS `name_reciver`,`to_owner`.`company_gln` AS `to_gln`,`consigner_address`.`street_address1` AS `sender_address`,`consignee_address`.`street_address1` AS `reciver_address`,`lsp_name`.`company_name` AS `lsp_name`,`current_owner`.`company_name` AS `current_owner_name`,`current_owner`.`company_gln` AS `current_owner_gln`,`current_owner_address`.`street_address1` AS `current_owner_address`,`consignee_address`.`latitude` AS `exit_lat`,`consignee_address`.`longitude` AS `exit_long`,`tp_transaction_location`.`latitude` AS `current_lat`,`tp_transaction_location`.`longitude` AS `current_long`,`vw_all_pack_info`.`gtin` AS `product_gtin`,`vw_all_pack_info`.`gtin_id` AS `gtin_id`,`vw_all_pack_info`.`item_check` AS `item_check`,`vw_all_pack_info`.`lot_id` AS `lot_id`,`vw_all_pack_info`.`batch_no` AS `batch_no`,`mt_company`.`company_name` AS `entry_point_owner`,`mt_address`.`street_address1` AS `entry_point_owner_location`,`mt_address`.`latitude` AS `entry_lat`,`mt_address`.`longitude` AS `entry_long`,`consignee_address`.`street_address1` AS `exit_point_owner_location`,`to_owner`.`company_name` AS `exit_point_owner`,`vw_all_pack_info`.`product_name` AS `product_name` from ((`mt_company` join `mt_address`) join ((((((((`tp_transaction_location` join `mt_company` `from_owner`) join `mt_company` `to_owner`) join `mt_company` `lsp_name`) join `mt_address` `consigner_address`) join `mt_address` `consignee_address`) join `mt_company` `current_owner`) join `mt_address` `current_owner_address`) join (((`vw_all_pack_info` join `tp_transaction_events_test`) join `tp_product_dispatch`) join `mt_event_transaction_type`))) where ((`tp_product_dispatch`.`id` = `tp_transaction_events_test`.`product_dispatch_id`) and (`mt_event_transaction_type`.`id` = `tp_transaction_events_test`.`tran_event_type_id`) and (`from_owner`.`id` = `tp_product_dispatch`.`from_owner_id`) and (`to_owner`.`id` = `tp_product_dispatch`.`to_owner_id`) and (`lsp_name`.`id` = `tp_product_dispatch`.`lsp_provider_id`) and (`consigner_address`.`id` = `tp_product_dispatch`.`from_address_id`) and (`consignee_address`.`id` = `tp_product_dispatch`.`to_address_id`) and (`current_owner`.`id` = `tp_transaction_events_test`.`current_owner_id`) and (`current_owner_address`.`id` = `tp_transaction_events_test`.`current_owner_address_id`) and (`mt_company`.`id` = `vw_all_pack_info`.`gtin_id`) and (`mt_address`.`id` = `vw_all_pack_info`.`gtin_id`) and (`tp_transaction_location`.`id` = `tp_product_dispatch`.`location_id`) and (`tp_product_dispatch`.`sscc_no` = `vw_all_pack_info`.`sscc_no`)) order by `tp_transaction_events_test`.`id` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_location_summary`
--
DROP TABLE IF EXISTS `vw_location_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `vw_location_summary`  AS  select `tp_transaction_events_test`.`id` AS `id`,`tp_product_dispatch`.`sscc_no` AS `sscc_no`,`tp_transaction_events_test`.`tran_event_type_id` AS `tran_event_type_id`,`tp_transaction_events_test`.`transaction_timestamp` AS `tranc_date_time`,`vw_all_pack_info`.`package_sn` AS `package_sn`,`vw_all_pack_info`.`package_pallet_sn` AS `package_pallet_sn`,`vw_all_pack_info`.`case_sn` AS `case_sn`,`mt_event_transaction_type`.`event_type` AS `event_type`,`tp_transaction_events_test`.`from_owner_id` AS `from_owner_id`,`tp_transaction_events_test`.`to_owner_id` AS `to_owner_id`,`tp_transaction_events_test`.`current_owner_id` AS `current_owner_id`,`tp_transaction_events_test`.`current_owner_address_id` AS `current_owner_address_id`,`from_owner`.`company_name` AS `consigner`,`from_owner`.`company_gln` AS `consigner_gln`,`to_owner`.`company_name` AS `consignee`,`to_owner`.`company_gln` AS `consignee_gln`,`consigner_address`.`street_address1` AS `consigner_address`,`consignee_address`.`street_address1` AS `consignee_address`,`lsp_name`.`company_name` AS `lsp_name`,`current_owner`.`company_name` AS `current_owner`,`current_owner`.`company_gln` AS `company_gln`,`current_owner_address`.`street_address1` AS `street_address1`,`consigner_address`.`latitude` AS `entry_lat`,`consigner_address`.`longitude` AS `entry_long`,`consignee_address`.`latitude` AS `exit_latitude`,`consignee_address`.`longitude` AS `exit_long`,`tp_transaction_location`.`latitude` AS `current_lat`,`tp_transaction_location`.`longitude` AS `current_long`,`tp_transaction_location`.`current_location` AS `current_location`,`tp_transaction_location`.`temperature` AS `temperature`,`tp_transaction_location`.`humidity` AS `humidity`,`vw_all_pack_info`.`entry_point_gln` AS `entry_point_gln`,`tp_transaction_location`.`to_gln` AS `exit_point_gln`,`vw_all_pack_info`.`gtin` AS `gtin` from ((((((((`tp_transaction_location` join `mt_company` `from_owner`) join `mt_company` `to_owner`) join `mt_company` `lsp_name`) join `mt_address` `consigner_address`) join `mt_address` `consignee_address`) join `mt_company` `current_owner`) join `mt_address` `current_owner_address`) join (((`vw_all_pack_info` join `tp_transaction_events_test`) join `tp_product_dispatch`) join `mt_event_transaction_type`)) where ((`tp_product_dispatch`.`id` = `tp_transaction_events_test`.`product_dispatch_id`) and (`mt_event_transaction_type`.`id` = `tp_transaction_events_test`.`tran_event_type_id`) and (`from_owner`.`id` = `tp_product_dispatch`.`from_owner_id`) and (`to_owner`.`id` = `tp_product_dispatch`.`to_owner_id`) and (`lsp_name`.`id` = `tp_product_dispatch`.`lsp_provider_id`) and (`consigner_address`.`id` = `tp_product_dispatch`.`from_address_id`) and (`consignee_address`.`id` = `tp_product_dispatch`.`to_address_id`) and (`current_owner`.`id` = `tp_transaction_events_test`.`current_owner_id`) and (`current_owner_address`.`id` = `tp_transaction_events_test`.`current_owner_address_id`) and (`tp_transaction_location`.`id` = `tp_product_dispatch`.`location_id`) and (`tp_product_dispatch`.`sscc_no` = `vw_all_pack_info`.`sscc_no`)) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_lot_check`
--
DROP TABLE IF EXISTS `vw_lot_check`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `vw_lot_check`  AS  select `tp_product_lot`.`id` AS `id`,count(`tp_product_lot`.`is_active`) AS `lot_count` from `tp_product_lot` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_lot_count`
--
DROP TABLE IF EXISTS `vw_lot_count`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `vw_lot_count`  AS  select `tp_product_lot`.`id` AS `id`,count(`tp_product_lot`.`id`) AS `COUNT(tp_product_lot.id)` from `tp_product_lot` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_lot_list`
--
DROP TABLE IF EXISTS `vw_lot_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `vw_lot_list`  AS  select `tp_product_lot`.`id` AS `id`,`tp_product_lot`.`batch_no` AS `batch_no` from `tp_product_lot` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_mfg_to_dist_order_transaction`
--
DROP TABLE IF EXISTS `vw_mfg_to_dist_order_transaction`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `vw_mfg_to_dist_order_transaction`  AS  select `tp_product_dispatch`.`id` AS `id`,`tp_product_dispatch`.`product_id` AS `product_id`,`tp_product_dispatch`.`sscc_no` AS `sscc_no`,`tp_product_dispatch`.`consigner` AS `consigner`,`tp_product_dispatch`.`consignee` AS `consignee`,`tp_product_dispatch`.`sender_location` AS `sender_location`,`tp_product_dispatch`.`sender_loc_gln` AS `sender_loc_gln`,`tp_product_dispatch`.`dispatch_location` AS `dispatch_location`,`tp_product_dispatch`.`dispatch_loc_gln` AS `dispatch_loc_gln`,`tp_product_dispatch`.`lsp_provider` AS `lsp_provider`,`tp_product_dispatch`.`purchase_order` AS `purchase_order`,`tp_product_dispatch`.`order_status` AS `order_status`,`tp_package_pallet`.`package_type` AS `package_type`,`tp_package_pallet`.`package_pallet_sn` AS `package_pallet_sn`,`tp_package_pallet`.`dimensions_id` AS `dimensions_id`,`tp_package_pallet`.`pallet_images_id` AS `pallet_images_id`,`tp_product_dispatch`.`owner_id` AS `owner_id`,`tp_product_dispatch`.`location_id` AS `location_id`,`mt_product_gtin`.`product_name` AS `product_name`,`mt_product_gtin`.`gtin` AS `gtin`,`mt_product_gtin`.`brand_name` AS `brand_name`,`mt_product_gtin`.`labler_name` AS `labler_name`,`mt_product_gtin`.`strength` AS `strength`,`mt_product_gtin`.`product_discription` AS `product_discription`,`mt_product_gtin`.`patient_instruction` AS `patient_instruction` from ((((`tp_product_dispatch` join `tp_package_pallet`) join `tp_transaction_owner`) join `tp_transaction_location`) join `mt_product_gtin`) where ((`tp_package_pallet`.`id` = `tp_product_dispatch`.`pallet_id`) and (`tp_transaction_owner`.`id` = `tp_product_dispatch`.`owner_id`) and (`tp_transaction_location`.`id` = `tp_product_dispatch`.`owner_id`) and (`mt_product_gtin`.`id` = `tp_product_dispatch`.`product_id`)) group by `tp_product_dispatch`.`sscc_no` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_org1_sscc_list`
--
DROP TABLE IF EXISTS `vw_org1_sscc_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `vw_org1_sscc_list`  AS  select `tp_product_dispatch`.`id` AS `id`,`tp_product_dispatch`.`product_id` AS `product_id`,`tp_product_dispatch`.`pallet_id` AS `pallet_id`,`tp_product_dispatch`.`case_id` AS `case_id`,`tp_product_dispatch`.`primary_pack_id` AS `primary_pack_id`,`tp_product_dispatch`.`lot_id` AS `lot_id`,`tp_product_dispatch`.`iot_tracking_id` AS `iot_tracking_id`,`tp_product_dispatch`.`from_owner_id` AS `from_owner_id`,`tp_product_dispatch`.`to_owner_id` AS `to_owner_id`,`tp_product_dispatch`.`lsp_provider_id` AS `lsp_provider_id`,`tp_product_dispatch`.`location_id` AS `location_id`,`tp_product_dispatch`.`owner_id` AS `owner_id`,`tp_product_dispatch`.`sscc_no` AS `sscc_no`,`tp_product_dispatch`.`GRAI` AS `GRAI`,`tp_product_dispatch`.`GIAI` AS `GIAI`,`tp_product_dispatch`.`consigner` AS `consigner`,`tp_product_dispatch`.`lsp_provider` AS `lsp_provider`,`tp_product_dispatch`.`consignee` AS `consignee`,`tp_product_dispatch`.`sender_location` AS `sender_location`,`tp_product_dispatch`.`sender_loc_gln` AS `sender_loc_gln`,`tp_product_dispatch`.`dispatch_location` AS `dispatch_location`,`tp_product_dispatch`.`dispatch_loc_gln` AS `dispatch_loc_gln`,`tp_product_dispatch`.`container_dimensions` AS `container_dimensions`,`tp_product_dispatch`.`package_dimentions` AS `package_dimentions`,`tp_product_dispatch`.`package_net_weight` AS `package_net_weight`,`tp_product_dispatch`.`package_gross_weight` AS `package_gross_weight`,`tp_product_dispatch`.`purchase_order` AS `purchase_order`,`tp_product_dispatch`.`order_qty` AS `order_qty`,`tp_product_dispatch`.`sale_order` AS `sale_order`,`tp_product_dispatch`.`package_type` AS `package_type`,`tp_product_dispatch`.`package_inside_units` AS `package_inside_units`,`tp_product_dispatch`.`package_inside_salable_units` AS `package_inside_salable_units`,`tp_product_dispatch`.`delivary_date` AS `delivary_date`,`tp_product_dispatch`.`invoice_no` AS `invoice_no`,`tp_product_dispatch`.`packaging_time` AS `packaging_time`,`tp_product_dispatch`.`order_status` AS `order_status`,`tp_product_dispatch`.`recall` AS `recall`,`mt_company`.`id` AS `company_id`,`mt_organization_category`.`id` AS `category_id`,`mt_organization_category`.`organization_category` AS `organization_category` from ((`tp_product_dispatch` join `mt_company`) join `mt_organization_category`) where ((`mt_company`.`id` = `tp_product_dispatch`.`from_owner_id`) and (`mt_organization_category`.`id` = `mt_company`.`company_category_id`) and (`mt_organization_category`.`id` = 1)) group by `tp_product_dispatch`.`sscc_no` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_org3_sscc_list`
--
DROP TABLE IF EXISTS `vw_org3_sscc_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `vw_org3_sscc_list`  AS  select `tp_product_dispatch`.`id` AS `id`,`tp_product_dispatch`.`product_id` AS `product_id`,`tp_product_dispatch`.`pallet_id` AS `pallet_id`,`tp_product_dispatch`.`case_id` AS `case_id`,`tp_product_dispatch`.`primary_pack_id` AS `primary_pack_id`,`tp_product_dispatch`.`lot_id` AS `lot_id`,`tp_product_dispatch`.`iot_tracking_id` AS `iot_tracking_id`,`tp_product_dispatch`.`from_owner_id` AS `from_owner_id`,`tp_product_dispatch`.`to_owner_id` AS `to_owner_id`,`tp_product_dispatch`.`lsp_provider_id` AS `lsp_provider_id`,`tp_product_dispatch`.`location_id` AS `location_id`,`tp_product_dispatch`.`owner_id` AS `owner_id`,`tp_product_dispatch`.`sscc_no` AS `sscc_no`,`tp_product_dispatch`.`GRAI` AS `GRAI`,`tp_product_dispatch`.`GIAI` AS `GIAI`,`tp_product_dispatch`.`consigner` AS `consigner`,`tp_product_dispatch`.`lsp_provider` AS `lsp_provider`,`tp_product_dispatch`.`consignee` AS `consignee`,`tp_product_dispatch`.`sender_location` AS `sender_location`,`tp_product_dispatch`.`sender_loc_gln` AS `sender_loc_gln`,`tp_product_dispatch`.`dispatch_location` AS `dispatch_location`,`tp_product_dispatch`.`dispatch_loc_gln` AS `dispatch_loc_gln`,`tp_product_dispatch`.`container_dimensions` AS `container_dimensions`,`tp_product_dispatch`.`package_dimentions` AS `package_dimentions`,`tp_product_dispatch`.`package_net_weight` AS `package_net_weight`,`tp_product_dispatch`.`package_gross_weight` AS `package_gross_weight`,`tp_product_dispatch`.`purchase_order` AS `purchase_order`,`tp_product_dispatch`.`order_qty` AS `order_qty`,`tp_product_dispatch`.`sale_order` AS `sale_order`,`tp_product_dispatch`.`package_type` AS `package_type`,`tp_product_dispatch`.`package_inside_units` AS `package_inside_units`,`tp_product_dispatch`.`package_inside_salable_units` AS `package_inside_salable_units`,`tp_product_dispatch`.`delivary_date` AS `delivary_date`,`tp_product_dispatch`.`invoice_no` AS `invoice_no`,`tp_product_dispatch`.`packaging_time` AS `packaging_time`,`tp_product_dispatch`.`order_status` AS `order_status`,`tp_product_dispatch`.`recall` AS `recall`,`mt_company`.`id` AS `company_id`,`mt_organization_category`.`id` AS `category_id`,`mt_organization_category`.`organization_category` AS `organization_category` from ((`tp_product_dispatch` join `mt_company`) join `mt_organization_category`) where ((`mt_company`.`id` = `tp_product_dispatch`.`from_owner_id`) and (`mt_organization_category`.`id` = `mt_company`.`company_category_id`) and (`mt_organization_category`.`id` = 3)) group by `tp_product_dispatch`.`sscc_no` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_owner1_history`
--
DROP TABLE IF EXISTS `vw_owner1_history`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `vw_owner1_history`  AS  select `vw_item_transactions`.`id` AS `id`,`vw_item_transactions`.`package_sn` AS `package_sn`,`vw_item_transactions`.`sscc_no` AS `sscc_no`,`vw_item_transactions`.`current_owner_name` AS `owner_one`,`vw_item_transactions`.`transaction_timestamp` AS `timestamp_one`,`vw_item_transactions`.`tran_event_type_id` AS `tran_event_type_id` from `vw_item_transactions` where (`vw_item_transactions`.`tran_event_type_id` = 1) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_owner2_history`
--
DROP TABLE IF EXISTS `vw_owner2_history`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `vw_owner2_history`  AS  select `vw_item_transactions`.`id` AS `id`,`vw_item_transactions`.`package_sn` AS `package_sn`,`vw_item_transactions`.`sscc_no` AS `sscc_no`,`vw_item_transactions`.`current_owner_name` AS `owner_two`,`vw_item_transactions`.`transaction_timestamp` AS `timestamp_two`,`vw_item_transactions`.`tran_event_type_id` AS `tran_event_type_id` from `vw_item_transactions` where (`vw_item_transactions`.`tran_event_type_id` = 2) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_owner3_history`
--
DROP TABLE IF EXISTS `vw_owner3_history`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `vw_owner3_history`  AS  select `vw_item_transactions`.`id` AS `id`,`vw_item_transactions`.`package_sn` AS `package_sn`,`vw_item_transactions`.`sscc_no` AS `sscc_no`,`vw_item_transactions`.`current_owner_name` AS `owner_three`,`vw_item_transactions`.`transaction_timestamp` AS `timestamp_three`,`vw_item_transactions`.`tran_event_type_id` AS `tran_event_type_id` from `vw_item_transactions` where (`vw_item_transactions`.`tran_event_type_id` = 3) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_package`
--
DROP TABLE IF EXISTS `vw_package`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `vw_package`  AS  select `tp_product_dispatch`.`id` AS `id`,`tp_product_dispatch`.`sscc_no` AS `sscc_no`,`mt_product_gtin`.`id` AS `product_gtin_id`,`mt_product_gtin`.`gtin` AS `gtin`,`tp_product_lot`.`id` AS `lot_id`,`tp_product_lot`.`batch_no` AS `batch_no`,`tp_product_dispatch`.`package_inside_units` AS `package_inside_units`,`tp_package_pallet`.`package_pallet_sn` AS `package_pallet_sn`,`tp_package_pallet_dimensions`.`height` AS `height`,`tp_package_pallet_dimensions`.`depth` AS `depth`,`tp_package_pallet_dimensions`.`width` AS `width`,`tp_package_pallet_dimensions`.`total_dimensions` AS `total_dimensions`,`tp_package_pallet_dimensions`.`shape` AS `shape`,`tp_package_pallet_dimensions`.`colour` AS `colour`,`tp_product_dispatch`.`package_type` AS `package_type`,`tp_product_dispatch`.`is_active` AS `is_active`,count(distinct `tp_package_case`.`package_sn`) AS `inner_serail_count`,group_concat(distinct `tp_package_case`.`package_sn` separator ',') AS `inner_serail_list`,`tp_product_dispatch`.`package_gross_weight` AS `package_gross_weight` from (((((`mt_product_gtin` join `tp_product_lot`) join `tp_product_dispatch`) join `tp_package_pallet`) join `tp_package_pallet_dimensions`) join `tp_package_case`) where ((`mt_product_gtin`.`id` = `tp_product_dispatch`.`product_id`) and (`tp_product_lot`.`id` = `tp_product_dispatch`.`lot_id`) and (`tp_package_pallet`.`id` = `tp_product_dispatch`.`pallet_id`) and (`tp_package_case`.`id` = `tp_product_dispatch`.`case_id`)) group by `tp_product_dispatch`.`sscc_no` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_package_count`
--
DROP TABLE IF EXISTS `vw_package_count`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `vw_package_count`  AS  select `vw_package`.`id` AS `id`,count(`vw_package`.`id`) AS `COUNT(vw_package.id)` from `vw_package` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_package_transaction`
--
DROP TABLE IF EXISTS `vw_package_transaction`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `vw_package_transaction`  AS  select `tp_product_dispatch`.`id` AS `id`,`tp_product_dispatch`.`sscc_no` AS `sscc_no`,`tp_product_dispatch`.`GRAI` AS `grai`,`tp_product_dispatch`.`GIAI` AS `giai`,`tp_product_dispatch`.`purchase_order` AS `purchase_order`,`vw_transaction_events`.`from_owner_id` AS `from_owner_id`,`vw_transaction_events`.`to_owner_id` AS `to_owner_id`,`vw_transaction_events`.`current_owner_id` AS `current_owner_id`,`tp_product_dispatch`.`from_address_id` AS `from_address_id`,`tp_product_dispatch`.`to_address_id` AS `to_address_id`,`tp_product_dispatch`.`location_id` AS `current_location_id`,`vw_transaction_events`.`transaction_timestamp` AS `transaction_timestamp`,`vw_transaction_events`.`tran_event_type_id` AS `transaction_status_id`,`mt_event_transaction_type`.`event_type` AS `transaction_type`,`tp_package_pallet`.`dimensions_id` AS `dimensions_id`,`tp_package_pallet`.`pallet_images_id` AS `pallet_images_id`,`tp_product_dispatch`.`is_active` AS `is_active` from (`mt_event_transaction_type` join (((`vw_transaction_events` join `tp_package_primary`) join `tp_product_dispatch`) join `tp_package_pallet`)) where ((`tp_package_primary`.`id` = `tp_product_dispatch`.`primary_pack_id`) and (`tp_product_dispatch`.`id` = `vw_transaction_events`.`product_dispatch_id`) and (`tp_package_pallet`.`id` = `tp_product_dispatch`.`pallet_id`) and (`mt_event_transaction_type`.`id` = `vw_transaction_events`.`tran_event_type_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_package_transaction_owner`
--
DROP TABLE IF EXISTS `vw_package_transaction_owner`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `vw_package_transaction_owner`  AS  select `tp_transaction_events`.`id` AS `id`,`tp_product_dispatch`.`sscc_no` AS `sscc_no`,`tp_transaction_events`.`current_owner_id` AS `current_owner_id`,`mt_company`.`company_name` AS `current_owner_name`,`mt_event_transaction_type`.`event_type` AS `event_type`,`tp_transaction_events`.`transaction_timestamp` AS `transaction_timestamp`,`tp_product_dispatch`.`is_active` AS `is_active` from (((`tp_transaction_events` join `tp_product_dispatch`) join `mt_event_transaction_type`) join `mt_company`) where ((`mt_company`.`id` = `tp_transaction_events`.`current_owner_id`) and (`tp_product_dispatch`.`id` = `tp_transaction_events`.`product_dispatch_id`) and (`mt_event_transaction_type`.`id` = `tp_transaction_events`.`tran_event_type_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_package_transaction_ref`
--
DROP TABLE IF EXISTS `vw_package_transaction_ref`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `vw_package_transaction_ref`  AS  select `tp_transaction_events_test`.`id` AS `id`,`tp_product_dispatch`.`sscc_no` AS `sscc_no`,`tp_product_dispatch`.`GRAI` AS `GRAI`,`tp_product_dispatch`.`GIAI` AS `GIAI`,`tp_product_dispatch`.`purchase_order` AS `purchase_order`,`tp_product_dispatch`.`package_net_weight` AS `package_net_weight`,`tp_product_dispatch`.`package_gross_weight` AS `package_gross_weight`,`tp_product_dispatch`.`is_active` AS `is_active`,`tp_transaction_events_test`.`tran_event_type_id` AS `tran_event_type_id`,max(`tp_transaction_events_test`.`transaction_timestamp`) AS `tranc_date_time`,`vw_all_pack_info`.`package_sn` AS `package_sn`,`vw_all_pack_info`.`package_pallet_sn` AS `package_pallet_sn`,`vw_all_pack_info`.`case_sn` AS `case_sn`,max(`mt_event_transaction_type`.`event_type`) AS `event_type`,`tp_transaction_events_test`.`from_owner_id` AS `from_owner_id`,`tp_transaction_events_test`.`to_owner_id` AS `to_owner_id`,`tp_transaction_events_test`.`current_owner_id` AS `current_owner_id`,`tp_transaction_events_test`.`current_owner_address_id` AS `current_owner_address_id`,`from_owner`.`company_name` AS `consigner`,`from_owner`.`company_gln` AS `consigner_gln`,`to_owner`.`company_name` AS `consignee`,`to_owner`.`company_gln` AS `consignee_gln`,`consigner_address`.`street_address1` AS `consigner_address`,`consignee_address`.`street_address1` AS `consignee_address`,`lsp_name`.`company_name` AS `lsp_name`,`current_owner`.`company_name` AS `current_owner`,`current_owner_address`.`street_address1` AS `street_address1`,`consigner_address`.`latitude` AS `entry_lat`,`consigner_address`.`longitude` AS `entry_long`,`consignee_address`.`latitude` AS `exit_lat`,`consignee_address`.`longitude` AS `exit_long`,`tp_transaction_location`.`latitude` AS `current_lat`,`tp_transaction_location`.`longitude` AS `current_long` from ((((((((`tp_transaction_location` join `mt_company` `from_owner`) join `mt_company` `to_owner`) join `mt_company` `lsp_name`) join `mt_address` `consigner_address`) join `mt_address` `consignee_address`) join `mt_company` `current_owner`) join `mt_address` `current_owner_address`) join (((`vw_all_pack_info` join `tp_transaction_events_test`) join `tp_product_dispatch`) join `mt_event_transaction_type`)) where ((`tp_product_dispatch`.`id` = `tp_transaction_events_test`.`product_dispatch_id`) and (`mt_event_transaction_type`.`id` = `tp_transaction_events_test`.`tran_event_type_id`) and (`from_owner`.`id` = `tp_product_dispatch`.`from_owner_id`) and (`to_owner`.`id` = `tp_product_dispatch`.`to_owner_id`) and (`lsp_name`.`id` = `tp_product_dispatch`.`lsp_provider_id`) and (`consigner_address`.`id` = `tp_product_dispatch`.`from_address_id`) and (`consignee_address`.`id` = `tp_product_dispatch`.`to_address_id`) and (`current_owner`.`id` = `tp_transaction_events_test`.`current_owner_id`) and (`current_owner_address`.`id` = `tp_transaction_events_test`.`current_owner_address_id`) and (`tp_transaction_location`.`id` = `tp_product_dispatch`.`location_id`) and (`tp_product_dispatch`.`sscc_no` = `vw_all_pack_info`.`sscc_no`)) group by `tp_transaction_events_test`.`transaction_timestamp`,`tp_product_dispatch`.`sscc_no` order by `tp_transaction_events_test`.`id` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_package_transaction_summary`
--
DROP TABLE IF EXISTS `vw_package_transaction_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `vw_package_transaction_summary`  AS  select `vw_package_transaction_ref`.`id` AS `id`,`vw_package_transaction_ref`.`sscc_no` AS `sscc_no`,`vw_package_transaction_ref`.`GRAI` AS `GRAI`,`vw_package_transaction_ref`.`GIAI` AS `GIAI`,`vw_package_transaction_ref`.`purchase_order` AS `purchase_order`,`vw_package_transaction_ref`.`package_net_weight` AS `package_net_weight`,`vw_package_transaction_ref`.`package_gross_weight` AS `package_gross_weight`,`vw_package_transaction_ref`.`is_active` AS `is_active`,`vw_package_transaction_ref`.`tran_event_type_id` AS `tran_event_type_id`,`vw_package_transaction_ref`.`tranc_date_time` AS `tranc_date_time`,`vw_package_transaction_ref`.`package_sn` AS `package_sn`,`vw_package_transaction_ref`.`package_pallet_sn` AS `package_pallet_sn`,`vw_package_transaction_ref`.`case_sn` AS `case_sn`,`vw_package_transaction_ref`.`event_type` AS `event_type`,`vw_package_transaction_ref`.`from_owner_id` AS `from_owner_id`,`vw_package_transaction_ref`.`to_owner_id` AS `to_owner_id`,`vw_package_transaction_ref`.`current_owner_id` AS `current_owner_id`,`vw_package_transaction_ref`.`current_owner_address_id` AS `current_owner_address_id`,`vw_package_transaction_ref`.`consigner` AS `consigner`,`vw_package_transaction_ref`.`consigner_gln` AS `consigner_gln`,`vw_package_transaction_ref`.`consignee` AS `consignee`,`vw_package_transaction_ref`.`consignee_gln` AS `consignee_gln`,`vw_package_transaction_ref`.`consigner_address` AS `consigner_address`,`vw_package_transaction_ref`.`consignee_address` AS `consignee_address`,`vw_package_transaction_ref`.`lsp_name` AS `lsp_name`,`vw_package_transaction_ref`.`current_owner` AS `current_owner`,`vw_package_transaction_ref`.`street_address1` AS `street_address1`,`vw_package_transaction_ref`.`entry_lat` AS `entry_lat`,`vw_package_transaction_ref`.`entry_long` AS `entry_long`,`vw_package_transaction_ref`.`exit_lat` AS `exit_lat`,`vw_package_transaction_ref`.`exit_long` AS `exit_long`,`vw_package_transaction_ref`.`current_lat` AS `current_lat`,`vw_package_transaction_ref`.`current_long` AS `current_long`,`vw_case_count`.`inner_count` AS `inner_count` from (`vw_package_transaction_ref` join `vw_case_count`) where (`vw_package_transaction_ref`.`package_pallet_sn` = `vw_case_count`.`package_pallet_sn`) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_pack_item_transaction`
--
DROP TABLE IF EXISTS `vw_pack_item_transaction`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `vw_pack_item_transaction`  AS  select `tp_transaction_events_test`.`id` AS `id`,`tp_product_dispatch`.`sscc_no` AS `sscc_no`,`tp_transaction_events_test`.`tran_event_type_id` AS `tran_event_type_id`,`tp_transaction_events_test`.`transaction_timestamp` AS `transaction_timestamp`,`vw_all_pack_info`.`package_sn` AS `package_sn`,`vw_all_pack_info`.`sscc_no` AS `confrim_sscc_no`,`vw_all_pack_info`.`dispatch_id` AS `dispatch_id` from ((`vw_all_pack_info` join `tp_transaction_events_test`) join `tp_product_dispatch`) where ((`tp_product_dispatch`.`id` = `tp_transaction_events_test`.`product_dispatch_id`) and (`tp_product_dispatch`.`sscc_no` = `vw_all_pack_info`.`sscc_no`)) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_pack_previous`
--
DROP TABLE IF EXISTS `vw_pack_previous`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `vw_pack_previous`  AS  select `tp_transaction_events`.`id` AS `id`,`tp_product_dispatch`.`sscc_no` AS `sscc_no`,`tp_transaction_events`.`from_owner_id` AS `previous_owner_id`,`mt_company`.`company_name` AS `previous_owner`,`mt_company`.`company_gln` AS `company_gln`,`mt_event_transaction_type`.`event_type` AS `event_type` from (((`tp_product_dispatch` join `mt_event_transaction_type`) join `tp_transaction_events`) join `mt_company`) where ((`mt_company`.`id` = `tp_transaction_events`.`from_owner_id`) and (`mt_event_transaction_type`.`id` = `tp_transaction_events`.`tran_event_type_id`) and (`tp_product_dispatch`.`id` = `tp_transaction_events`.`product_dispatch_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_pack_previous_owner`
--
DROP TABLE IF EXISTS `vw_pack_previous_owner`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `vw_pack_previous_owner`  AS  select `tp_transaction_events`.`id` AS `id`,`tp_product_dispatch`.`sscc_no` AS `sscc_no`,`tp_transaction_events`.`from_owner_id` AS `previous_owner_id`,`mt_company`.`company_name` AS `previous_owner`,`mt_company`.`company_gln` AS `company_gln`,`mt_event_transaction_type`.`event_type` AS `event_type`,`mt_event_transaction_type`.`id` AS `event_type_id`,`tp_transaction_events`.`transaction_timestamp` AS `transaction_timestamp` from (((`tp_product_dispatch` join `mt_event_transaction_type`) join `tp_transaction_events`) join `mt_company`) where ((`mt_company`.`id` = `tp_transaction_events`.`from_owner_id`) and (`mt_event_transaction_type`.`id` = `tp_transaction_events`.`tran_event_type_id`) and (`tp_product_dispatch`.`id` = `tp_transaction_events`.`product_dispatch_id`) and (`mt_event_transaction_type`.`id` <> 1)) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_pack_tran`
--
DROP TABLE IF EXISTS `vw_pack_tran`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `vw_pack_tran`  AS  select distinct `vw_package_transaction`.`sscc_no` AS `sscc_no`,`vw_package_transaction`.`transaction_type` AS `transaction_type`,`vw_package_transaction`.`transaction_timestamp` AS `transaction_timestamp` from `vw_package_transaction` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_pallet_images`
--
DROP TABLE IF EXISTS `vw_pallet_images`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `vw_pallet_images`  AS  select `vw_pallet_images_ref`.`id` AS `id`,`vw_pallet_images_ref`.`sscc_no` AS `sscc_no`,`vw_pallet_images_ref`.`package_pallet_sn` AS `package_pallet_sn`,`tp_package_pallet_images`.`id` AS `images_id`,`tp_package_pallet`.`id` AS `dispatch_id` from ((`vw_pallet_images_ref` join `tp_package_pallet`) join `tp_package_pallet_images`) where ((`tp_package_pallet_images`.`id` = `tp_package_pallet`.`pallet_images_id`) and (`tp_package_pallet`.`id` = `vw_pallet_images_ref`.`pallet_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_pallet_images_ref`
--
DROP TABLE IF EXISTS `vw_pallet_images_ref`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `vw_pallet_images_ref`  AS  select `tp_transaction_events_test`.`id` AS `id`,`tp_product_dispatch`.`sscc_no` AS `sscc_no`,`tp_product_dispatch`.`GRAI` AS `GRAI`,`tp_product_dispatch`.`GIAI` AS `GIAI`,`tp_product_dispatch`.`purchase_order` AS `purchase_order`,`tp_product_dispatch`.`package_net_weight` AS `package_net_weight`,`tp_product_dispatch`.`package_gross_weight` AS `package_gross_weight`,`tp_product_dispatch`.`is_active` AS `is_active`,`tp_transaction_events_test`.`tran_event_type_id` AS `tran_event_type_id`,max(`tp_transaction_events_test`.`transaction_timestamp`) AS `tranc_date_time`,`vw_all_pack_info`.`package_sn` AS `package_sn`,`vw_all_pack_info`.`package_pallet_sn` AS `package_pallet_sn`,`vw_all_pack_info`.`case_sn` AS `case_sn`,max(`mt_event_transaction_type`.`event_type`) AS `event_type`,`tp_transaction_events_test`.`from_owner_id` AS `from_owner_id`,`tp_transaction_events_test`.`to_owner_id` AS `to_owner_id`,`tp_transaction_events_test`.`current_owner_id` AS `current_owner_id`,`tp_transaction_events_test`.`current_owner_address_id` AS `current_owner_address_id`,`from_owner`.`company_name` AS `consigner`,`from_owner`.`company_gln` AS `consigner_gln`,`to_owner`.`company_name` AS `consignee`,`to_owner`.`company_gln` AS `consignee_gln`,`consigner_address`.`street_address1` AS `consigner_address`,`consignee_address`.`street_address1` AS `consignee_address`,`lsp_name`.`company_name` AS `lsp_name`,`current_owner`.`company_name` AS `current_owner`,`current_owner_address`.`street_address1` AS `street_address1`,`consigner_address`.`latitude` AS `entry_lat`,`consigner_address`.`longitude` AS `entry_long`,`consignee_address`.`latitude` AS `exit_lat`,`consignee_address`.`longitude` AS `exit_long`,`tp_transaction_location`.`latitude` AS `current_lat`,`tp_transaction_location`.`longitude` AS `current_long`,`vw_all_pack_info`.`pallet_id` AS `pallet_id` from ((((((((`tp_transaction_location` join `mt_company` `from_owner`) join `mt_company` `to_owner`) join `mt_company` `lsp_name`) join `mt_address` `consigner_address`) join `mt_address` `consignee_address`) join `mt_company` `current_owner`) join `mt_address` `current_owner_address`) join (((`vw_all_pack_info` join `tp_transaction_events_test`) join `tp_product_dispatch`) join `mt_event_transaction_type`)) where ((`tp_product_dispatch`.`id` = `tp_transaction_events_test`.`product_dispatch_id`) and (`mt_event_transaction_type`.`id` = `tp_transaction_events_test`.`tran_event_type_id`) and (`from_owner`.`id` = `tp_product_dispatch`.`from_owner_id`) and (`to_owner`.`id` = `tp_product_dispatch`.`to_owner_id`) and (`lsp_name`.`id` = `tp_product_dispatch`.`lsp_provider_id`) and (`consigner_address`.`id` = `tp_product_dispatch`.`from_address_id`) and (`consignee_address`.`id` = `tp_product_dispatch`.`to_address_id`) and (`current_owner`.`id` = `tp_transaction_events_test`.`current_owner_id`) and (`current_owner_address`.`id` = `tp_transaction_events_test`.`current_owner_address_id`) and (`tp_transaction_location`.`id` = `tp_product_dispatch`.`location_id`) and (`tp_product_dispatch`.`sscc_no` = `vw_all_pack_info`.`sscc_no`)) group by `tp_transaction_events_test`.`transaction_timestamp`,`tp_product_dispatch`.`sscc_no` order by `tp_transaction_events_test`.`id` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_product_check`
--
DROP TABLE IF EXISTS `vw_product_check`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `vw_product_check`  AS  select `mt_product_gtin`.`id` AS `id`,count(`mt_product_gtin`.`is_active`) AS `product_check` from `mt_product_gtin` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_product_count`
--
DROP TABLE IF EXISTS `vw_product_count`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `vw_product_count`  AS  select `mt_product_gtin`.`id` AS `id`,count(`mt_product_gtin`.`gtin`) AS `product_count` from `mt_product_gtin` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_tp_order_catalouge`
--
DROP TABLE IF EXISTS `vw_tp_order_catalouge`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `vw_tp_order_catalouge`  AS  select `tp_disb_whol_order_catalogue`.`product_dispactch_id` AS `product_dispactch_id`,`tp_product_dispatch`.`purchase_order` AS `purchase_order`,`tp_product_dispatch`.`primary_pack_id` AS `primary_pack_id`,`tp_package_primary`.`package_sn` AS `package_sn`,`mt_product_gtin`.`gtin` AS `gtin` from (((`tp_disb_whol_order_catalogue` join `tp_product_dispatch`) join `tp_package_primary`) join `mt_product_gtin`) where ((`tp_product_dispatch`.`id` = `tp_disb_whol_order_catalogue`.`product_dispactch_id`) and (`tp_package_primary`.`id` = `tp_product_dispatch`.`primary_pack_id`) and (`mt_product_gtin`.`id` = `tp_product_dispatch`.`product_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_trace_disb_to_retailer`
--
DROP TABLE IF EXISTS `vw_trace_disb_to_retailer`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `vw_trace_disb_to_retailer`  AS  select `vw_tp_order_catalouge`.`product_dispactch_id` AS `product_dispactch_id`,`vw_tp_order_catalouge`.`package_sn` AS `package_sn`,`vw_tp_order_catalouge`.`gtin` AS `gtin`,`tp_product_dispatch_disp_to_retailer`.`id` AS `dispatch_disp_to_retailer_id`,`tp_product_dispatch_disp_to_retailer`.`sscc_no` AS `sscc_no`,`tp_product_dispatch_disp_to_retailer`.`location_id` AS `location_id`,`tp_product_dispatch_disp_to_retailer`.`owner_id` AS `owner_id` from (`vw_tp_order_catalouge` join `tp_product_dispatch_disp_to_retailer`) where (`vw_tp_order_catalouge`.`product_dispactch_id` = `tp_product_dispatch_disp_to_retailer`.`product_catelogue_id`) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_trading_parties_info`
--
DROP TABLE IF EXISTS `vw_trading_parties_info`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `vw_trading_parties_info`  AS  select `vw_trading_parties_list_ref`.`id` AS `id`,`vw_trading_parties_list_ref`.`sscc_no` AS `sscc_no`,`vw_trading_parties_list_ref`.`consigner_id` AS `consigner_id`,`vw_trading_parties_list_ref`.`consignee_id` AS `consignee_id`,`vw_trading_parties_list_ref`.`custodion_id` AS `custodion_id`,`vw_trading_parties_list_ref`.`consigner_address_id` AS `consigner_address_id`,`vw_trading_parties_list_ref`.`consignee_address_id` AS `consignee_address_id`,`vw_trading_parties_list_ref`.`custodion_address_id` AS `custodion_address_id`,`consigner`.`company_name` AS `consigner_name`,`consigner`.`company_gln` AS `consigner_gln`,`consignee`.`company_name` AS `consignee_name`,`consignee`.`company_gln` AS `consignee_gln`,`custodion`.`company_name` AS `custodion_name`,`custodion`.`company_gln` AS `custodion_gln`,`consigner_address`.`street_address1` AS `consigner_address`,`consignee_address`.`street_address1` AS `consignee_address`,`custodion_address`.`street_address1` AS `custodion_address`,`consigner_category`.`id` AS `consigner_category_id`,`consigner_category`.`organization_category` AS `consigner_category`,`consignee_category`.`id` AS `consignee_category_id`,`consignee_category`.`organization_category` AS `consignee_category`,`custodion_category`.`id` AS `custodion_category_id`,`custodion_category`.`organization_category` AS `custodion_category` from (((`mt_organization_category` `consigner_category` join `mt_organization_category` `consignee_category`) join `mt_organization_category` `custodion_category`) join ((((((`vw_trading_parties_list_ref` join `mt_company` `consigner`) join `mt_company` `consignee`) join `mt_company` `custodion`) join `mt_address` `consigner_address`) join `mt_address` `consignee_address`) join `mt_address` `custodion_address`)) where ((`consigner`.`id` = `vw_trading_parties_list_ref`.`consigner_id`) and (`consignee`.`id` = `vw_trading_parties_list_ref`.`consignee_id`) and (`custodion`.`id` = `vw_trading_parties_list_ref`.`custodion_id`) and (`consigner_address`.`id` = `vw_trading_parties_list_ref`.`consigner_address_id`) and (`consigner_category`.`id` = `consigner`.`company_category_id`) and (`consignee_category`.`id` = `consignee`.`company_category_id`) and (`custodion_category`.`id` = `custodion`.`company_category_id`) and (`consignee_address`.`id` = `vw_trading_parties_list_ref`.`consignee_address_id`) and (`custodion_address`.`id` = `vw_trading_parties_list_ref`.`custodion_address_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_trading_parties_list_ref`
--
DROP TABLE IF EXISTS `vw_trading_parties_list_ref`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `vw_trading_parties_list_ref`  AS  select `tp_transaction_events_test`.`id` AS `id`,`tp_product_dispatch`.`sscc_no` AS `sscc_no`,`tp_product_dispatch`.`GRAI` AS `GRAI`,`tp_product_dispatch`.`GIAI` AS `GIAI`,`tp_product_dispatch`.`purchase_order` AS `purchase_order`,`tp_product_dispatch`.`package_net_weight` AS `package_net_weight`,`tp_product_dispatch`.`package_gross_weight` AS `package_gross_weight`,`tp_product_dispatch`.`is_active` AS `is_active`,`tp_transaction_events_test`.`tran_event_type_id` AS `tran_event_type_id`,max(`tp_transaction_events_test`.`transaction_timestamp`) AS `tranc_date_time`,`vw_all_pack_info`.`package_sn` AS `package_sn`,`vw_all_pack_info`.`package_pallet_sn` AS `package_pallet_sn`,`vw_all_pack_info`.`case_sn` AS `case_sn`,max(`mt_event_transaction_type`.`event_type`) AS `event_type`,`tp_transaction_events_test`.`from_owner_id` AS `from_owner_id`,`tp_transaction_events_test`.`to_owner_id` AS `to_owner_id`,`tp_transaction_events_test`.`current_owner_id` AS `current_owner_id`,`tp_transaction_events_test`.`current_owner_address_id` AS `current_owner_address_id`,`from_owner`.`company_name` AS `consigner`,`from_owner`.`company_gln` AS `consigner_gln`,`to_owner`.`company_name` AS `consignee`,`to_owner`.`company_gln` AS `consignee_gln`,`consigner_address`.`street_address1` AS `consigner_address`,`consignee_address`.`street_address1` AS `consignee_address`,`lsp_name`.`company_name` AS `lsp_name`,`current_owner`.`company_name` AS `current_owner`,`current_owner_address`.`street_address1` AS `street_address1`,`consigner_address`.`latitude` AS `entry_lat`,`consigner_address`.`longitude` AS `entry_long`,`consignee_address`.`latitude` AS `exit_lat`,`consignee_address`.`longitude` AS `exit_long`,`tp_transaction_location`.`latitude` AS `current_lat`,`tp_transaction_location`.`longitude` AS `current_long`,`tp_product_dispatch`.`from_owner_id` AS `consigner_id`,`tp_product_dispatch`.`to_owner_id` AS `consignee_id`,`tp_product_dispatch`.`lsp_provider_id` AS `custodion_id`,`tp_product_dispatch`.`from_address_id` AS `consigner_address_id`,`tp_product_dispatch`.`to_address_id` AS `consignee_address_id`,`tp_product_dispatch`.`lsp_address_id` AS `custodion_address_id` from ((((((((`tp_transaction_location` join `mt_company` `from_owner`) join `mt_company` `to_owner`) join `mt_company` `lsp_name`) join `mt_address` `consigner_address`) join `mt_address` `consignee_address`) join `mt_company` `current_owner`) join `mt_address` `current_owner_address`) join (((`vw_all_pack_info` join `tp_transaction_events_test`) join `tp_product_dispatch`) join `mt_event_transaction_type`)) where ((`tp_product_dispatch`.`id` = `tp_transaction_events_test`.`product_dispatch_id`) and (`mt_event_transaction_type`.`id` = `tp_transaction_events_test`.`tran_event_type_id`) and (`from_owner`.`id` = `tp_product_dispatch`.`from_owner_id`) and (`to_owner`.`id` = `tp_product_dispatch`.`to_owner_id`) and (`lsp_name`.`id` = `tp_product_dispatch`.`lsp_provider_id`) and (`consigner_address`.`id` = `tp_product_dispatch`.`from_address_id`) and (`consignee_address`.`id` = `tp_product_dispatch`.`to_address_id`) and (`current_owner`.`id` = `tp_transaction_events_test`.`current_owner_id`) and (`current_owner_address`.`id` = `tp_transaction_events_test`.`current_owner_address_id`) and (`tp_transaction_location`.`id` = `tp_product_dispatch`.`location_id`) and (`tp_product_dispatch`.`sscc_no` = `vw_all_pack_info`.`sscc_no`)) group by `tp_transaction_events_test`.`transaction_timestamp`,`tp_product_dispatch`.`sscc_no` order by `tp_transaction_events_test`.`id` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_transaction_events`
--
DROP TABLE IF EXISTS `vw_transaction_events`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `vw_transaction_events`  AS  select `tp_transaction_events_test`.`id` AS `id`,`tp_product_dispatch`.`id` AS `product_dispatch_id`,`tp_product_dispatch`.`sscc_no` AS `sscc_no`,`tp_transaction_events_test`.`tran_event_type_id` AS `tran_event_type_id`,`tp_transaction_events_test`.`transaction_timestamp` AS `transaction_timestamp`,`vw_all_pack_info`.`package_sn` AS `package_sn`,`vw_all_pack_info`.`package_pallet_sn` AS `package_pallet_sn`,`vw_all_pack_info`.`case_sn` AS `case_sn`,`mt_event_transaction_type`.`event_type` AS `event_type`,`tp_transaction_events_test`.`from_owner_id` AS `from_owner_id`,`tp_transaction_events_test`.`to_owner_id` AS `to_owner_id`,`tp_transaction_events_test`.`current_owner_id` AS `current_owner_id`,`tp_transaction_events_test`.`current_owner_address_id` AS `current_owner_address_id`,`name_sender`.`company_name` AS `name_sender`,`name_sender`.`company_gln` AS `from_gln`,`name_receiver`.`company_name` AS `name_reciver`,`name_receiver`.`company_gln` AS `to_gln`,`current_owner`.`company_name` AS `current_owner_name`,`current_owner`.`company_gln` AS `current_owner_gln`,`tp_transaction_events_test`.`is_active` AS `is_active` from ((((((`vw_all_pack_info` join `tp_transaction_events_test`) join `tp_product_dispatch`) join `mt_event_transaction_type`) join `mt_company` `name_sender`) join `mt_company` `name_receiver`) join `mt_company` `current_owner`) where ((`tp_product_dispatch`.`id` = `tp_transaction_events_test`.`product_dispatch_id`) and (`mt_event_transaction_type`.`id` = `tp_transaction_events_test`.`tran_event_type_id`) and (`name_sender`.`id` = `tp_transaction_events_test`.`from_owner_id`) and (`name_receiver`.`id` = `tp_transaction_events_test`.`to_owner_id`) and (`current_owner`.`id` = `tp_transaction_events_test`.`current_owner_id`) and (`tp_product_dispatch`.`sscc_no` = `vw_all_pack_info`.`sscc_no`)) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_transaction_events_test`
--
DROP TABLE IF EXISTS `vw_transaction_events_test`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `vw_transaction_events_test`  AS  select `ms`.`id` AS `id`,`ms`.`product_dispatch_id` AS `product_dispatch_id`,`ms`.`tran_event_type_id` AS `tran_event_type_id`,`ms`.`from_owner_id` AS `from_owner_id`,`ms`.`to_owner_id` AS `to_owner_id`,`ms`.`current_owner_id` AS `current_owner_id`,`ms`.`current_owner_address_id` AS `current_owner_address_id`,`ms`.`transaction_timestamp` AS `transaction_timestamp`,`ms`.`is_active` AS `is_active`,`from_owner`.`company_name` AS `name_sender`,`from_owner`.`company_gln` AS `from_gln`,`to_owner`.`company_name` AS `name_reciver`,`to_owner`.`company_gln` AS `to_gln`,`current_owner`.`company_name` AS `current_owner_name`,`current_owner`.`company_gln` AS `current_owner_gln` from (((`tp_transaction_events_test` `ms` left join `mt_company` `from_owner` on((`ms`.`from_owner_id` = `from_owner`.`id`))) left join `mt_company` `to_owner` on((`ms`.`to_owner_id` = `to_owner`.`id`))) left join `mt_company` `current_owner` on((`ms`.`current_owner_id` = `current_owner`.`id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_tran_timestamp_list`
--
DROP TABLE IF EXISTS `vw_tran_timestamp_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`phpmyadmin`@`%` SQL SECURITY DEFINER VIEW `vw_tran_timestamp_list`  AS  select `tp_package_primary`.`id` AS `id`,`vw_item_transactions`.`package_sn` AS `package_sn`,`vw_item_transactions`.`product_gtin` AS `product_gtin`,`vw_item_transactions`.`batch_no` AS `batch_no`,`vw_item_transactions`.`from_owner_id` AS `from_owner_id`,`vw_item_transactions`.`to_owner_id` AS `to_owner_id`,`vw_item_transactions`.`current_owner_id` AS `current_owner_id`,`tp_transaction_events`.`tran_event_type_id` AS `event_id`,group_concat(distinct `mt_event_transaction_type`.`event_type` separator ',') AS `transaction_type`,group_concat(distinct `vw_item_transactions`.`current_owner_name` separator ',') AS `owners_history`,group_concat(distinct `vw_item_transactions`.`transaction_timestamp` separator ',') AS `tran_timestamp_history` from ((`tp_transaction_events` join `mt_event_transaction_type`) join (`vw_item_transactions` join `tp_package_primary`)) where ((`tp_package_primary`.`id` = `vw_item_transactions`.`primary_pack_id`) and (`mt_event_transaction_type`.`id` = `tp_transaction_events`.`tran_event_type_id`)) group by `vw_item_transactions`.`package_sn` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `api_json_trading_party_registration`
--
ALTER TABLE `api_json_trading_party_registration`
  ADD PRIMARY KEY (`id`),
  ADD KEY `party_role_id` (`party_role_id`),
  ADD KEY `party_address_id` (`party_address_id`);

--
-- Indexes for table `api_user`
--
ALTER TABLE `api_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uid` (`uid`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `api_user_user_type_id_94dca385_fk_mt_user_types_id` (`user_type_id`),
  ADD KEY `add_user_id` (`add_user_id`),
  ADD KEY `company_id` (`profile_access_id`),
  ADD KEY `organization_id` (`organization_id`);

--
-- Indexes for table `api_user_groups`
--
ALTER TABLE `api_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `api_user_groups_user_id_group_id_9c7ddfb5_uniq` (`user_id`,`group_id`),
  ADD KEY `api_user_groups_group_id_3af85785_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `api_user_user_permissions`
--
ALTER TABLE `api_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `api_user_user_permissions_user_id_permission_id_a06dd704_uniq` (`user_id`,`permission_id`),
  ADD KEY `api_user_user_permis_permission_id_305b7fea_fk_auth_perm` (`permission_id`);

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
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_api_user_id` (`user_id`);

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
-- Indexes for table `gs1_application_identifiers`
--
ALTER TABLE `gs1_application_identifiers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gs1_business_process`
--
ALTER TABLE `gs1_business_process`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gs1_company_gln_extensions`
--
ALTER TABLE `gs1_company_gln_extensions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gln_location_type` (`gln_loc_extension_type_id`),
  ADD KEY `gln_extension_contact_id` (`gln_contact_id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `gs1_company_parent_gln`
--
ALTER TABLE `gs1_company_parent_gln`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `parent_gln_contact_id` (`parent_gln_contact_id`),
  ADD KEY `gln_location_type` (`gln_location_type`);

--
-- Indexes for table `gs1_country_code`
--
ALTER TABLE `gs1_country_code`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uk_country_code` (`gs1_code`);

--
-- Indexes for table `gs1_gln_contact`
--
ALTER TABLE `gs1_gln_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gs1_gln_location_types`
--
ALTER TABLE `gs1_gln_location_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gs1_gln_make`
--
ALTER TABLE `gs1_gln_make`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gs1_gpc_bricks`
--
ALTER TABLE `gs1_gpc_bricks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gs1_gtin_indicator`
--
ALTER TABLE `gs1_gtin_indicator`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_indicator` (`indicator`);

--
-- Indexes for table `gs1_identification_keys`
--
ALTER TABLE `gs1_identification_keys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gs1_product_services_segments`
--
ALTER TABLE `gs1_product_services_segments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gs1_trading_party_info`
--
ALTER TABLE `gs1_trading_party_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_key_license_gln` (`key_licensee_gln`),
  ADD KEY `fk_company_code` (`key_licensee_gln`),
  ADD KEY `fk_address_id` (`party_address_id`),
  ADD KEY `tp_company_id` (`tp_company_id`),
  ADD KEY `parent_gln_id` (`parent_gln_id`),
  ADD KEY `country_code_id` (`country_code_id`);

--
-- Indexes for table `lkp_address_type`
--
ALTER TABLE `lkp_address_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lkp_allowance_charge_type`
--
ALTER TABLE `lkp_allowance_charge_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lkp_bar_code_type`
--
ALTER TABLE `lkp_bar_code_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lkp_contact_type_code`
--
ALTER TABLE `lkp_contact_type_code`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lkp_container_type`
--
ALTER TABLE `lkp_container_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lkp_countries`
--
ALTER TABLE `lkp_countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lkp_country_codes`
--
ALTER TABLE `lkp_country_codes`
  ADD KEY `idx_country_code` (`country_code`);

--
-- Indexes for table `lkp_event_types`
--
ALTER TABLE `lkp_event_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lkp_location_groups`
--
ALTER TABLE `lkp_location_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lkp_location_type`
--
ALTER TABLE `lkp_location_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lkp_pallet_type`
--
ALTER TABLE `lkp_pallet_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lkp_party_capability_code`
--
ALTER TABLE `lkp_party_capability_code`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lkp_party_topic_code`
--
ALTER TABLE `lkp_party_topic_code`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lkp_product_code_standards`
--
ALTER TABLE `lkp_product_code_standards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lkp_response_status_code`
--
ALTER TABLE `lkp_response_status_code`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lkp_serial_types`
--
ALTER TABLE `lkp_serial_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lkp_tax_category_code`
--
ALTER TABLE `lkp_tax_category_code`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lkp_temperature_unit_code`
--
ALTER TABLE `lkp_temperature_unit_code`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `lkp_timezone`
--
ALTER TABLE `lkp_timezone`
  ADD KEY `idx_zone_id` (`zone_id`),
  ADD KEY `idx_time_start` (`time_start`);

--
-- Indexes for table `lkp_time_unit_code`
--
ALTER TABLE `lkp_time_unit_code`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `lkp_transaction_codes`
--
ALTER TABLE `lkp_transaction_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lkp_transport_mode`
--
ALTER TABLE `lkp_transport_mode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lkp_weekend_day`
--
ALTER TABLE `lkp_weekend_day`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lkp_zone`
--
ALTER TABLE `lkp_zone`
  ADD PRIMARY KEY (`zone_id`),
  ADD KEY `idx_country_code` (`country_code`),
  ADD KEY `idx_zone_name` (`zone_name`);

--
-- Indexes for table `mt_access_level`
--
ALTER TABLE `mt_access_level`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UQ_Access_Level` (`access_level`);

--
-- Indexes for table `mt_access_policies`
--
ALTER TABLE `mt_access_policies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `access_role_id` (`access_role_id`);

--
-- Indexes for table `mt_address`
--
ALTER TABLE `mt_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gln_extension_id` (`gln_extension_id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `mt_company`
--
ALTER TABLE `mt_company`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gs1_company_prefix_ibfk1` (`gs1_company_prefix`),
  ADD UNIQUE KEY `company_gln_ibfk1` (`company_gln`),
  ADD KEY `company_category_id` (`company_category_id`),
  ADD KEY `company_contact_id` (`company_contact_id`);

--
-- Indexes for table `mt_company_contact`
--
ALTER TABLE `mt_company_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mt_container`
--
ALTER TABLE `mt_container`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mt_container_dimensions`
--
ALTER TABLE `mt_container_dimensions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mt_controlled_conditions`
--
ALTER TABLE `mt_controlled_conditions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mt_document_type`
--
ALTER TABLE `mt_document_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mt_dosage_form`
--
ALTER TABLE `mt_dosage_form`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mt_event_transaction_type`
--
ALTER TABLE `mt_event_transaction_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mt_label_print_format`
--
ALTER TABLE `mt_label_print_format`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mt_license_types`
--
ALTER TABLE `mt_license_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mt_net_content_unit`
--
ALTER TABLE `mt_net_content_unit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mt_organization_category`
--
ALTER TABLE `mt_organization_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mt_owner`
--
ALTER TABLE `mt_owner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mt_packaging_dimensions`
--
ALTER TABLE `mt_packaging_dimensions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mt_permissions`
--
ALTER TABLE `mt_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mt_product_category`
--
ALTER TABLE `mt_product_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mt_product_gtin`
--
ALTER TABLE `mt_product_gtin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `address_id` (`address_id`);

--
-- Indexes for table `mt_product_hierarchies`
--
ALTER TABLE `mt_product_hierarchies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mt_product_lot`
--
ALTER TABLE `mt_product_lot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mt_product_ndc_old`
--
ALTER TABLE `mt_product_ndc_old`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mt_product_package`
--
ALTER TABLE `mt_product_package`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_gtin_id` (`product_gtin_id`),
  ADD KEY `lot_id` (`lot_id`),
  ADD KEY `pack_type_id` (`pack_type_id`);

--
-- Indexes for table `mt_product_package_type`
--
ALTER TABLE `mt_product_package_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mt_trans_events_status`
--
ALTER TABLE `mt_trans_events_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testUserAuthencation`
--
ALTER TABLE `testUserAuthencation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tp_controlled_conditions`
--
ALTER TABLE `tp_controlled_conditions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tp_disb_whol_order_catalogue`
--
ALTER TABLE `tp_disb_whol_order_catalogue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_dispactch_id` (`product_dispactch_id`);

--
-- Indexes for table `tp_dispatch_package`
--
ALTER TABLE `tp_dispatch_package`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tp_orders`
--
ALTER TABLE `tp_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tp_package_case`
--
ALTER TABLE `tp_package_case`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `lot_id` (`lot_id`),
  ADD KEY `primary_package_id` (`primary_package_id`);

--
-- Indexes for table `tp_package_pallet`
--
ALTER TABLE `tp_package_pallet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lot_id` (`lot_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `case_id` (`case_id`),
  ADD KEY `pallet_images_id` (`pallet_images_id`),
  ADD KEY `dimensions_id` (`dimensions_id`);

--
-- Indexes for table `tp_package_pallet_dimensions`
--
ALTER TABLE `tp_package_pallet_dimensions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tp_package_pallet_images`
--
ALTER TABLE `tp_package_pallet_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tp_package_primary`
--
ALTER TABLE `tp_package_primary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `lot_id` (`lot_id`),
  ADD KEY `pack_type_id` (`pack_type_id`);

--
-- Indexes for table `tp_package_unit`
--
ALTER TABLE `tp_package_unit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tp_product_dispatch`
--
ALTER TABLE `tp_product_dispatch`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `pallet_id` (`pallet_id`),
  ADD KEY `case_id` (`case_id`),
  ADD KEY `primary_pack_id` (`primary_pack_id`),
  ADD KEY `owner_id` (`owner_id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `from_owner_id` (`from_owner_id`),
  ADD KEY `to_owner_id` (`to_owner_id`),
  ADD KEY `lsp_provider_id` (`lsp_provider_id`),
  ADD KEY `from_address` (`from_address_id`),
  ADD KEY `to_address_id` (`to_address_id`),
  ADD KEY `lsp_address_id` (`lsp_address_id`),
  ADD KEY `from_user_id` (`from_user_id`),
  ADD KEY `to_user_id` (`to_user_id`),
  ADD KEY `lsp_user_id` (`lsp_user_id`);

--
-- Indexes for table `tp_product_dispatch_disp_to_retailer`
--
ALTER TABLE `tp_product_dispatch_disp_to_retailer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_catelogue_id` (`product_catelogue_id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `owner_id` (`owner_id`);

--
-- Indexes for table `tp_product_lot`
--
ALTER TABLE `tp_product_lot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `lot_id` (`lot_id`);

--
-- Indexes for table `tp_product_package`
--
ALTER TABLE `tp_product_package`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_gtin_id` (`product_gtin_id`),
  ADD KEY `lot_id` (`lot_id`),
  ADD KEY `pack_type_id` (`pack_type_id`);

--
-- Indexes for table `tp_product_package_type`
--
ALTER TABLE `tp_product_package_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tp_transaction_events`
--
ALTER TABLE `tp_transaction_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tran_event_type_id` (`tran_event_type_id`),
  ADD KEY `product_dispatch_id` (`product_dispatch_id`),
  ADD KEY `from_owner_id` (`from_owner_id`),
  ADD KEY `to_owner_id` (`to_owner_id`),
  ADD KEY `current_owner_id` (`current_owner_id`),
  ADD KEY `current_owner_address_id` (`current_owner_address_id`);

--
-- Indexes for table `tp_transaction_events_test`
--
ALTER TABLE `tp_transaction_events_test`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tp_transaction_events_test_ibfk_1` (`tran_event_type_id`),
  ADD KEY `tp_transaction_events_test_ibfk_2` (`product_dispatch_id`),
  ADD KEY `tp_transaction_events_test_ibfk_3` (`from_owner_id`),
  ADD KEY `tp_transaction_events_test_ibfk_4` (`to_owner_id`),
  ADD KEY `tp_transaction_events_test_ibfk_5` (`current_owner_id`),
  ADD KEY `tp_transaction_events_test_ibfk_6` (`current_owner_address_id`);

--
-- Indexes for table `tp_transaction_location`
--
ALTER TABLE `tp_transaction_location`
  ADD PRIMARY KEY (`id`),
  ADD KEY `controlled_conditions_id` (`controlled_conditions_id`);

--
-- Indexes for table `tp_transaction_owner`
--
ALTER TABLE `tp_transaction_owner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `api_json_trading_party_registration`
--
ALTER TABLE `api_json_trading_party_registration`
  MODIFY `id` smallint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `api_user`
--
ALTER TABLE `api_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `api_user_groups`
--
ALTER TABLE `api_user_groups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `api_user_user_permissions`
--
ALTER TABLE `api_user_user_permissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gs1_application_identifiers`
--
ALTER TABLE `gs1_application_identifiers`
  MODIFY `id` smallint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gs1_business_process`
--
ALTER TABLE `gs1_business_process`
  MODIFY `id` smallint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gs1_company_gln_extensions`
--
ALTER TABLE `gs1_company_gln_extensions`
  MODIFY `id` smallint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `gs1_company_parent_gln`
--
ALTER TABLE `gs1_company_parent_gln`
  MODIFY `id` smallint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gs1_gln_contact`
--
ALTER TABLE `gs1_gln_contact`
  MODIFY `id` smallint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gs1_gln_location_types`
--
ALTER TABLE `gs1_gln_location_types`
  MODIFY `id` smallint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lkp_location_type`
--
ALTER TABLE `lkp_location_type`
  MODIFY `id` smallint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mt_address`
--
ALTER TABLE `mt_address`
  MODIFY `id` smallint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `mt_company`
--
ALTER TABLE `mt_company`
  MODIFY `id` smallint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `mt_company_contact`
--
ALTER TABLE `mt_company_contact`
  MODIFY `id` smallint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mt_container`
--
ALTER TABLE `mt_container`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mt_container_dimensions`
--
ALTER TABLE `mt_container_dimensions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mt_controlled_conditions`
--
ALTER TABLE `mt_controlled_conditions`
  MODIFY `id` smallint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mt_document_type`
--
ALTER TABLE `mt_document_type`
  MODIFY `id` smallint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mt_dosage_form`
--
ALTER TABLE `mt_dosage_form`
  MODIFY `id` smallint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mt_event_transaction_type`
--
ALTER TABLE `mt_event_transaction_type`
  MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `mt_label_print_format`
--
ALTER TABLE `mt_label_print_format`
  MODIFY `id` smallint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mt_license_types`
--
ALTER TABLE `mt_license_types`
  MODIFY `id` smallint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mt_net_content_unit`
--
ALTER TABLE `mt_net_content_unit`
  MODIFY `id` smallint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mt_organization_category`
--
ALTER TABLE `mt_organization_category`
  MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `mt_packaging_dimensions`
--
ALTER TABLE `mt_packaging_dimensions`
  MODIFY `id` smallint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mt_permissions`
--
ALTER TABLE `mt_permissions`
  MODIFY `id` smallint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mt_product_category`
--
ALTER TABLE `mt_product_category`
  MODIFY `id` smallint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mt_product_gtin`
--
ALTER TABLE `mt_product_gtin`
  MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `mt_product_hierarchies`
--
ALTER TABLE `mt_product_hierarchies`
  MODIFY `id` smallint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mt_product_lot`
--
ALTER TABLE `mt_product_lot`
  MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `mt_product_package`
--
ALTER TABLE `mt_product_package`
  MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `mt_product_package_type`
--
ALTER TABLE `mt_product_package_type`
  MODIFY `id` smallint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mt_trans_events_status`
--
ALTER TABLE `mt_trans_events_status`
  MODIFY `id` smallint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `testUserAuthencation`
--
ALTER TABLE `testUserAuthencation`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tp_controlled_conditions`
--
ALTER TABLE `tp_controlled_conditions`
  MODIFY `id` smallint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tp_disb_whol_order_catalogue`
--
ALTER TABLE `tp_disb_whol_order_catalogue`
  MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tp_dispatch_package`
--
ALTER TABLE `tp_dispatch_package`
  MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tp_orders`
--
ALTER TABLE `tp_orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tp_package_case`
--
ALTER TABLE `tp_package_case`
  MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Referred by Pallet', AUTO_INCREMENT=3265;

--
-- AUTO_INCREMENT for table `tp_package_pallet`
--
ALTER TABLE `tp_package_pallet`
  MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'PK', AUTO_INCREMENT=3265;

--
-- AUTO_INCREMENT for table `tp_package_pallet_dimensions`
--
ALTER TABLE `tp_package_pallet_dimensions`
  MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tp_package_pallet_images`
--
ALTER TABLE `tp_package_pallet_images`
  MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tp_package_primary`
--
ALTER TABLE `tp_package_primary`
  MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3261;

--
-- AUTO_INCREMENT for table `tp_package_unit`
--
ALTER TABLE `tp_package_unit`
  MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tp_product_dispatch`
--
ALTER TABLE `tp_product_dispatch`
  MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID Dispatch Id', AUTO_INCREMENT=266;

--
-- AUTO_INCREMENT for table `tp_product_dispatch_disp_to_retailer`
--
ALTER TABLE `tp_product_dispatch_disp_to_retailer`
  MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID Dispatch Id', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tp_product_lot`
--
ALTER TABLE `tp_product_lot`
  MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tp_product_package`
--
ALTER TABLE `tp_product_package`
  MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tp_product_package_type`
--
ALTER TABLE `tp_product_package_type`
  MODIFY `id` smallint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tp_transaction_events`
--
ALTER TABLE `tp_transaction_events`
  MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=423;

--
-- AUTO_INCREMENT for table `tp_transaction_events_test`
--
ALTER TABLE `tp_transaction_events_test`
  MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=430;

--
-- AUTO_INCREMENT for table `tp_transaction_location`
--
ALTER TABLE `tp_transaction_location`
  MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `tp_transaction_owner`
--
ALTER TABLE `tp_transaction_owner`
  MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `api_user`
--
ALTER TABLE `api_user`
  ADD CONSTRAINT `api_user_ibfk_1` FOREIGN KEY (`add_user_id`) REFERENCES `api_user` (`id`),
  ADD CONSTRAINT `api_user_ibfk_2` FOREIGN KEY (`organization_id`) REFERENCES `mt_organization_category` (`id`);

--
-- Constraints for table `gs1_company_gln_extensions`
--
ALTER TABLE `gs1_company_gln_extensions`
  ADD CONSTRAINT `gs1_company_gln_extensions_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `mt_company` (`id`),
  ADD CONSTRAINT `gs1_company_gln_extensions_ibfk_2` FOREIGN KEY (`gln_contact_id`) REFERENCES `gs1_gln_contact` (`id`),
  ADD CONSTRAINT `gs1_company_gln_extensions_ibfk_3` FOREIGN KEY (`gln_loc_extension_type_id`) REFERENCES `gs1_gln_location_types` (`id`);

--
-- Constraints for table `mt_address`
--
ALTER TABLE `mt_address`
  ADD CONSTRAINT `mt_address_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `mt_company` (`id`),
  ADD CONSTRAINT `mt_address_ibfk_2` FOREIGN KEY (`gln_extension_id`) REFERENCES `gs1_company_gln_extensions` (`id`);

--
-- Constraints for table `mt_company`
--
ALTER TABLE `mt_company`
  ADD CONSTRAINT `mt_company_ibfk_1` FOREIGN KEY (`company_category_id`) REFERENCES `mt_organization_category` (`id`),
  ADD CONSTRAINT `mt_company_ibfk_2` FOREIGN KEY (`company_contact_id`) REFERENCES `mt_company_contact` (`id`);

--
-- Constraints for table `mt_product_gtin`
--
ALTER TABLE `mt_product_gtin`
  ADD CONSTRAINT `mt_product_gtin_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `mt_company` (`id`),
  ADD CONSTRAINT `mt_product_gtin_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `mt_address` (`id`);

--
-- Constraints for table `mt_product_package`
--
ALTER TABLE `mt_product_package`
  ADD CONSTRAINT `mt_product_package_ibfk_1` FOREIGN KEY (`product_gtin_id`) REFERENCES `mt_product_gtin` (`id`),
  ADD CONSTRAINT `mt_product_package_ibfk_2` FOREIGN KEY (`lot_id`) REFERENCES `mt_product_lot` (`id`),
  ADD CONSTRAINT `mt_product_package_ibfk_3` FOREIGN KEY (`pack_type_id`) REFERENCES `mt_product_package_type` (`id`);

--
-- Constraints for table `tp_disb_whol_order_catalogue`
--
ALTER TABLE `tp_disb_whol_order_catalogue`
  ADD CONSTRAINT `tp_disb_whol_order_catalogue_ibfk_1` FOREIGN KEY (`product_dispactch_id`) REFERENCES `tp_product_dispatch` (`id`);

--
-- Constraints for table `tp_package_case`
--
ALTER TABLE `tp_package_case`
  ADD CONSTRAINT `tp_package_case_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `mt_product_gtin` (`id`),
  ADD CONSTRAINT `tp_package_case_ibfk_2` FOREIGN KEY (`lot_id`) REFERENCES `tp_product_lot` (`id`),
  ADD CONSTRAINT `tp_package_case_ibfk_3` FOREIGN KEY (`primary_package_id`) REFERENCES `tp_package_primary` (`id`);

--
-- Constraints for table `tp_package_pallet`
--
ALTER TABLE `tp_package_pallet`
  ADD CONSTRAINT `tp_package_pallet_ibfk_1` FOREIGN KEY (`lot_id`) REFERENCES `tp_product_lot` (`id`),
  ADD CONSTRAINT `tp_package_pallet_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `mt_product_gtin` (`id`),
  ADD CONSTRAINT `tp_package_pallet_ibfk_3` FOREIGN KEY (`case_id`) REFERENCES `tp_package_case` (`id`),
  ADD CONSTRAINT `tp_package_pallet_ibfk_4` FOREIGN KEY (`dimensions_id`) REFERENCES `tp_package_pallet_dimensions` (`id`),
  ADD CONSTRAINT `tp_package_pallet_ibfk_5` FOREIGN KEY (`pallet_images_id`) REFERENCES `tp_package_pallet_images` (`id`),
  ADD CONSTRAINT `tp_package_pallet_ibfk_6` FOREIGN KEY (`dimensions_id`) REFERENCES `tp_package_pallet_dimensions` (`id`);

--
-- Constraints for table `tp_package_primary`
--
ALTER TABLE `tp_package_primary`
  ADD CONSTRAINT `tp_package_primary_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `mt_product_gtin` (`id`),
  ADD CONSTRAINT `tp_package_primary_ibfk_2` FOREIGN KEY (`lot_id`) REFERENCES `tp_product_lot` (`id`),
  ADD CONSTRAINT `tp_package_primary_ibfk_3` FOREIGN KEY (`pack_type_id`) REFERENCES `tp_product_package_type` (`id`);

--
-- Constraints for table `tp_product_dispatch`
--
ALTER TABLE `tp_product_dispatch`
  ADD CONSTRAINT `tp_product_dispatch_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `mt_product_gtin` (`id`),
  ADD CONSTRAINT `tp_product_dispatch_ibfk_10` FOREIGN KEY (`lsp_provider_id`) REFERENCES `mt_company` (`id`),
  ADD CONSTRAINT `tp_product_dispatch_ibfk_11` FOREIGN KEY (`from_address_id`) REFERENCES `mt_address` (`id`),
  ADD CONSTRAINT `tp_product_dispatch_ibfk_12` FOREIGN KEY (`to_address_id`) REFERENCES `mt_address` (`id`),
  ADD CONSTRAINT `tp_product_dispatch_ibfk_13` FOREIGN KEY (`lsp_address_id`) REFERENCES `mt_address` (`id`),
  ADD CONSTRAINT `tp_product_dispatch_ibfk_14` FOREIGN KEY (`from_user_id`) REFERENCES `api_user` (`id`),
  ADD CONSTRAINT `tp_product_dispatch_ibfk_15` FOREIGN KEY (`to_user_id`) REFERENCES `api_user` (`id`),
  ADD CONSTRAINT `tp_product_dispatch_ibfk_16` FOREIGN KEY (`lsp_user_id`) REFERENCES `api_user` (`id`),
  ADD CONSTRAINT `tp_product_dispatch_ibfk_2` FOREIGN KEY (`pallet_id`) REFERENCES `tp_package_pallet` (`id`),
  ADD CONSTRAINT `tp_product_dispatch_ibfk_3` FOREIGN KEY (`case_id`) REFERENCES `tp_package_case` (`id`),
  ADD CONSTRAINT `tp_product_dispatch_ibfk_4` FOREIGN KEY (`case_id`) REFERENCES `tp_package_case` (`id`),
  ADD CONSTRAINT `tp_product_dispatch_ibfk_5` FOREIGN KEY (`primary_pack_id`) REFERENCES `tp_package_primary` (`id`),
  ADD CONSTRAINT `tp_product_dispatch_ibfk_6` FOREIGN KEY (`owner_id`) REFERENCES `tp_transaction_owner` (`id`),
  ADD CONSTRAINT `tp_product_dispatch_ibfk_7` FOREIGN KEY (`location_id`) REFERENCES `tp_transaction_location` (`id`),
  ADD CONSTRAINT `tp_product_dispatch_ibfk_8` FOREIGN KEY (`from_owner_id`) REFERENCES `mt_company` (`id`),
  ADD CONSTRAINT `tp_product_dispatch_ibfk_9` FOREIGN KEY (`to_owner_id`) REFERENCES `mt_company` (`id`);

--
-- Constraints for table `tp_product_dispatch_disp_to_retailer`
--
ALTER TABLE `tp_product_dispatch_disp_to_retailer`
  ADD CONSTRAINT `tp_product_dispatch_disp_to_retailer_ibfk_1` FOREIGN KEY (`product_catelogue_id`) REFERENCES `tp_disb_whol_order_catalogue` (`id`),
  ADD CONSTRAINT `tp_product_dispatch_disp_to_retailer_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `tp_transaction_location` (`id`),
  ADD CONSTRAINT `tp_product_dispatch_disp_to_retailer_ibfk_3` FOREIGN KEY (`owner_id`) REFERENCES `tp_transaction_owner` (`id`);

--
-- Constraints for table `tp_product_lot`
--
ALTER TABLE `tp_product_lot`
  ADD CONSTRAINT `tp_product_lot_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `mt_product_gtin` (`id`),
  ADD CONSTRAINT `tp_product_lot_ibfk_2` FOREIGN KEY (`lot_id`) REFERENCES `mt_product_lot` (`id`);

--
-- Constraints for table `tp_product_package`
--
ALTER TABLE `tp_product_package`
  ADD CONSTRAINT `tp_product_package_ibfk_1` FOREIGN KEY (`product_gtin_id`) REFERENCES `mt_product_gtin` (`id`),
  ADD CONSTRAINT `tp_product_package_ibfk_2` FOREIGN KEY (`lot_id`) REFERENCES `tp_product_lot` (`id`),
  ADD CONSTRAINT `tp_product_package_ibfk_3` FOREIGN KEY (`pack_type_id`) REFERENCES `tp_product_package_type` (`id`);

--
-- Constraints for table `tp_transaction_events`
--
ALTER TABLE `tp_transaction_events`
  ADD CONSTRAINT `tp_transaction_events_ibfk_1` FOREIGN KEY (`tran_event_type_id`) REFERENCES `mt_event_transaction_type` (`id`),
  ADD CONSTRAINT `tp_transaction_events_ibfk_2` FOREIGN KEY (`product_dispatch_id`) REFERENCES `tp_product_dispatch` (`id`),
  ADD CONSTRAINT `tp_transaction_events_ibfk_3` FOREIGN KEY (`from_owner_id`) REFERENCES `mt_company` (`id`),
  ADD CONSTRAINT `tp_transaction_events_ibfk_4` FOREIGN KEY (`to_owner_id`) REFERENCES `mt_company` (`id`),
  ADD CONSTRAINT `tp_transaction_events_ibfk_5` FOREIGN KEY (`current_owner_id`) REFERENCES `mt_company` (`id`),
  ADD CONSTRAINT `tp_transaction_events_ibfk_6` FOREIGN KEY (`current_owner_address_id`) REFERENCES `mt_address` (`id`);

--
-- Constraints for table `tp_transaction_events_test`
--
ALTER TABLE `tp_transaction_events_test`
  ADD CONSTRAINT `tp_transaction_events_test_ibfk_1` FOREIGN KEY (`tran_event_type_id`) REFERENCES `mt_event_transaction_type` (`id`),
  ADD CONSTRAINT `tp_transaction_events_test_ibfk_2` FOREIGN KEY (`product_dispatch_id`) REFERENCES `tp_product_dispatch` (`id`),
  ADD CONSTRAINT `tp_transaction_events_test_ibfk_3` FOREIGN KEY (`from_owner_id`) REFERENCES `mt_company` (`id`),
  ADD CONSTRAINT `tp_transaction_events_test_ibfk_4` FOREIGN KEY (`to_owner_id`) REFERENCES `mt_company` (`id`),
  ADD CONSTRAINT `tp_transaction_events_test_ibfk_5` FOREIGN KEY (`current_owner_id`) REFERENCES `mt_company` (`id`),
  ADD CONSTRAINT `tp_transaction_events_test_ibfk_6` FOREIGN KEY (`current_owner_address_id`) REFERENCES `mt_address` (`id`);

--
-- Constraints for table `tp_transaction_location`
--
ALTER TABLE `tp_transaction_location`
  ADD CONSTRAINT `tp_transaction_location_ibfk_1` FOREIGN KEY (`controlled_conditions_id`) REFERENCES `tp_controlled_conditions` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
