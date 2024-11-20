-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 09, 2024 at 06:50 AM
-- Server version: 8.0.39-cll-lve
-- PHP Version: 8.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopeziya_oncab`
--

-- --------------------------------------------------------

--
-- Table structure for table `additional_fees`
--

CREATE TABLE `additional_fees` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `additional_fees`
--

INSERT INTO `additional_fees` (`id`, `title`, `status`, `created_at`, `updated_at`) VALUES
(1, 'fuel', 1, '2024-07-10 14:34:06', '2024-07-10 14:34:06');

-- --------------------------------------------------------

--
-- Table structure for table `app_settings`
--

CREATE TABLE `app_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `site_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_logo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_favicon` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `site_copyright` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language_option` json DEFAULT NULL,
  `contact_email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `help_support_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notification_settings` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `app_settings`
--

INSERT INTO `app_settings` (`id`, `site_name`, `site_email`, `site_logo`, `site_favicon`, `site_description`, `site_copyright`, `facebook_url`, `instagram_url`, `twitter_url`, `linkedin_url`, `language_option`, `contact_email`, `contact_number`, `help_support_url`, `notification_settings`, `created_at`, `updated_at`) VALUES
(1, 'OnCab', NULL, '/tmp/phpwVbc8m', '/tmp/phpF1p8II', NULL, NULL, 'https://www.facebook.com/profile.php?id=61562324425545', 'https://www.instagram.com/oncabpk/', NULL, 'https://www.linkedin.com/company/103949121/admin/dashboard/', '[\"en\"]', 'Support@oncabglobal.com', '+922133517981', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `id` bigint UNSIGNED NOT NULL,
  `driver_id` bigint UNSIGNED DEFAULT NULL,
  `rider_id` bigint UNSIGNED DEFAULT NULL,
  `complaint_by` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'rider, driver',
  `subject` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ride_request_id` bigint UNSIGNED DEFAULT NULL,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'pending' COMMENT 'pending, investigation, resolved',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `complaint_comments`
--

CREATE TABLE `complaint_comments` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `complaint_id` bigint UNSIGNED DEFAULT NULL,
  `added_by` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'all,first_ride,region_wise,service_wise',
  `usage_limit_per_rider` bigint UNSIGNED DEFAULT NULL,
  `discount_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'fixed,percentage',
  `discount` double DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `minimum_amount` double DEFAULT NULL,
  `maximum_discount` double DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint DEFAULT NULL,
  `region_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `service_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'driver' COMMENT 'driver',
  `is_required` tinyint DEFAULT NULL,
  `has_expiry_date` tinyint DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `name`, `type`, `is_required`, `has_expiry_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 'PICTURE', 'driver', 1, 0, 1, '2024-07-10 12:51:56', '2024-07-23 23:05:38'),
(3, 'CNIC FRONT', 'driver', 1, 0, 1, '2024-07-11 22:34:25', '2024-07-23 23:04:23'),
(4, 'CNIC BACK', 'driver', 1, 0, 1, '2024-07-19 16:14:24', '2024-07-23 23:04:45'),
(5, 'DRIVING LICENSE', 'driver', 1, 0, 1, '2024-07-19 16:15:00', '2024-07-23 23:05:17'),
(7, 'REGISTRATION DOCUMENT', 'driver', 1, 0, 1, '2024-07-19 16:16:38', '2024-07-23 23:06:42');

-- --------------------------------------------------------

--
-- Table structure for table `driver_documents`
--

CREATE TABLE `driver_documents` (
  `id` bigint UNSIGNED NOT NULL,
  `document_id` bigint UNSIGNED DEFAULT NULL,
  `driver_id` bigint UNSIGNED DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `is_verified` tinyint DEFAULT '0' COMMENT '0-pending,1-approved,2-rejected',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `driver_documents`
--

INSERT INTO `driver_documents` (`id`, `document_id`, `driver_id`, `expire_date`, `is_verified`, `created_at`, `updated_at`) VALUES
(17, 1, 21, '2024-07-11', 1, '2024-07-12 00:26:45', '2024-07-12 00:31:07'),
(20, 3, 21, '2024-07-11', 1, '2024-07-12 00:32:37', '2024-07-12 00:32:58'),
(28, 3, 29, '2024-07-13', 1, '2024-07-13 17:34:03', '2024-07-13 17:36:45'),
(29, 1, 29, '2024-07-13', 1, '2024-07-13 17:34:36', '2024-07-13 17:36:04'),
(37, 7, 44, NULL, 1, '2024-07-23 17:09:54', '2024-07-23 17:12:57'),
(39, 5, 44, NULL, 1, '2024-07-23 17:10:31', '2024-07-23 17:12:30'),
(40, 4, 44, NULL, 1, '2024-07-23 17:10:45', '2024-07-23 17:12:19'),
(41, 3, 44, '2024-07-25', 1, '2024-07-23 17:11:02', '2024-07-23 17:11:28'),
(42, 1, 44, '2024-07-24', 1, '2024-07-23 17:11:23', '2024-07-23 17:11:48'),
(44, 7, 45, NULL, 1, '2024-07-23 19:20:35', '2024-07-23 19:25:25'),
(46, 5, 45, NULL, 1, '2024-07-23 19:21:09', '2024-07-23 19:24:56'),
(47, 4, 45, NULL, 1, '2024-07-23 19:21:29', '2024-07-23 19:24:37'),
(50, 7, 49, NULL, 1, '2024-07-23 19:22:19', '2024-07-23 19:27:54'),
(51, 3, 45, '2024-07-23', 1, '2024-07-23 19:22:21', '2024-07-23 19:24:11'),
(52, 1, 45, '2024-07-23', 1, '2024-07-23 19:22:39', '2024-07-23 19:23:47'),
(54, 5, 49, NULL, 1, '2024-07-23 19:23:01', '2024-07-23 19:25:58'),
(55, 4, 49, NULL, 1, '2024-07-23 19:23:15', '2024-07-23 19:25:11'),
(56, 3, 49, '2024-07-23', 1, '2024-07-23 19:23:28', '2024-07-23 19:24:21'),
(57, 1, 49, '2024-07-23', 1, '2024-07-23 19:23:41', '2024-07-23 19:23:58'),
(79, 7, 53, NULL, 1, '2024-07-23 19:49:40', '2024-07-23 19:52:40'),
(81, 5, 53, NULL, 1, '2024-07-23 19:49:49', '2024-07-23 19:52:26'),
(82, 4, 53, NULL, 1, '2024-07-23 19:49:57', '2024-07-23 19:52:09'),
(84, 3, 53, '2024-07-23', 1, '2024-07-23 19:50:09', '2024-07-23 19:51:47'),
(86, 1, 53, '2024-07-23', 1, '2024-07-23 19:50:17', '2024-07-23 19:50:41'),
(89, 7, 55, NULL, 1, '2024-07-23 20:12:07', '2024-07-23 20:16:42'),
(90, 5, 55, NULL, 1, '2024-07-23 20:12:35', '2024-07-23 20:16:15'),
(91, 4, 55, NULL, 1, '2024-07-23 20:12:54', '2024-07-23 20:16:02'),
(92, 1, 55, '2024-07-26', 1, '2024-07-23 20:13:49', '2024-07-23 20:15:47'),
(93, 3, 55, '2024-07-31', 1, '2024-07-23 20:16:12', '2024-07-23 20:16:28'),
(94, 1, 57, NULL, 0, '2024-07-24 14:38:33', '2024-07-24 14:38:33'),
(95, 7, 57, NULL, 0, '2024-07-24 14:39:03', '2024-07-24 14:39:03'),
(96, 5, 57, NULL, 0, '2024-07-24 14:39:27', '2024-07-24 14:39:27'),
(97, 4, 57, NULL, 0, '2024-07-24 14:39:58', '2024-07-24 14:39:58'),
(98, 3, 57, NULL, 0, '2024-07-24 14:40:10', '2024-07-24 14:40:10'),
(101, 3, 58, NULL, 0, '2024-07-24 14:42:49', '2024-07-24 14:42:49'),
(102, 4, 58, NULL, 0, '2024-07-24 14:43:06', '2024-07-24 14:43:06'),
(103, 1, 58, NULL, 0, '2024-07-24 14:43:15', '2024-07-24 14:43:15'),
(104, 5, 58, NULL, 0, '2024-07-24 14:43:41', '2024-07-24 14:43:41'),
(105, 7, 58, NULL, 0, '2024-07-24 14:44:21', '2024-07-24 14:44:21'),
(106, 7, 59, NULL, 0, '2024-07-24 14:53:55', '2024-07-24 14:53:55'),
(108, 7, 60, NULL, 0, '2024-07-24 14:54:29', '2024-07-24 14:54:29'),
(109, 5, 59, NULL, 0, '2024-07-24 14:54:30', '2024-07-24 14:54:30'),
(110, 5, 60, NULL, 0, '2024-07-24 14:54:46', '2024-07-24 14:54:46'),
(111, 4, 60, NULL, 0, '2024-07-24 14:55:03', '2024-07-24 14:55:03'),
(112, 3, 60, NULL, 0, '2024-07-24 14:55:13', '2024-07-24 14:55:13'),
(113, 1, 60, NULL, 0, '2024-07-24 14:55:22', '2024-07-24 14:55:22'),
(114, 4, 59, NULL, 0, '2024-07-24 14:55:45', '2024-07-24 14:55:45'),
(115, 3, 59, NULL, 0, '2024-07-24 14:55:55', '2024-07-24 14:55:55'),
(116, 1, 59, NULL, 0, '2024-07-24 14:56:26', '2024-07-24 14:56:26'),
(123, 7, 61, NULL, 0, '2024-07-24 15:10:47', '2024-07-24 15:10:47'),
(124, 4, 61, NULL, 0, '2024-07-24 15:11:18', '2024-07-24 15:11:18'),
(125, 5, 61, NULL, 0, '2024-07-24 15:11:23', '2024-07-24 15:11:23'),
(126, 3, 61, NULL, 0, '2024-07-24 15:11:25', '2024-07-24 15:11:25'),
(127, 1, 61, NULL, 0, '2024-07-24 15:11:33', '2024-07-24 15:11:33'),
(128, 7, 62, NULL, 0, '2024-07-24 15:33:15', '2024-07-24 15:33:15'),
(129, 5, 62, NULL, 0, '2024-07-24 15:33:33', '2024-07-24 15:33:33'),
(130, 4, 62, NULL, 0, '2024-07-24 15:33:45', '2024-07-24 15:33:45'),
(131, 3, 62, NULL, 0, '2024-07-24 15:34:12', '2024-07-24 15:34:12'),
(132, 1, 62, NULL, 0, '2024-07-24 15:34:27', '2024-07-24 15:34:27'),
(135, 7, 65, NULL, 0, '2024-07-24 16:46:27', '2024-07-24 16:46:27'),
(136, 5, 65, NULL, 0, '2024-07-24 16:46:47', '2024-07-24 16:46:47'),
(137, 4, 65, NULL, 0, '2024-07-24 16:47:06', '2024-07-24 16:47:06'),
(138, 3, 65, NULL, 0, '2024-07-24 16:47:14', '2024-07-24 16:47:14'),
(139, 1, 65, NULL, 0, '2024-07-24 16:47:38', '2024-07-24 16:47:38'),
(141, 7, 67, NULL, 0, '2024-07-24 17:52:58', '2024-07-24 17:52:58'),
(142, 4, 67, NULL, 0, '2024-07-24 17:53:13', '2024-07-24 17:53:13'),
(143, 3, 67, NULL, 0, '2024-07-24 17:53:23', '2024-07-24 17:53:23'),
(144, 5, 67, NULL, 0, '2024-07-24 17:53:34', '2024-07-24 17:53:34'),
(145, 1, 67, NULL, 0, '2024-07-24 17:54:04', '2024-07-24 17:54:04'),
(147, 7, 69, NULL, 0, '2024-07-24 18:34:27', '2024-07-24 18:34:27'),
(148, 5, 69, NULL, 0, '2024-07-24 18:34:41', '2024-07-24 18:34:41'),
(149, 4, 69, NULL, 0, '2024-07-24 18:34:50', '2024-07-24 18:34:50'),
(150, 3, 69, NULL, 0, '2024-07-24 18:35:00', '2024-07-24 18:35:00'),
(152, 1, 69, NULL, 0, '2024-07-24 18:35:25', '2024-07-24 18:35:25'),
(153, 5, 70, NULL, 0, '2024-07-24 18:42:30', '2024-07-24 18:42:30'),
(154, 4, 70, NULL, 0, '2024-07-24 18:42:44', '2024-07-24 18:42:44'),
(155, 3, 70, NULL, 0, '2024-07-24 18:42:58', '2024-07-24 18:42:58'),
(156, 1, 70, NULL, 0, '2024-07-24 18:43:11', '2024-07-24 18:43:11'),
(157, 7, 70, NULL, 0, '2024-07-24 18:43:33', '2024-07-24 18:43:33'),
(162, 4, 68, NULL, 0, '2024-07-25 00:08:43', '2024-07-25 00:08:43'),
(163, 3, 68, NULL, 0, '2024-07-25 00:09:53', '2024-07-25 00:09:53'),
(165, 5, 71, NULL, 0, '2024-07-25 03:38:59', '2024-07-25 03:38:59'),
(166, 1, 71, NULL, 0, '2024-07-25 03:40:16', '2024-07-25 03:40:16'),
(167, 5, 68, NULL, 0, '2024-07-25 12:06:36', '2024-07-25 12:06:36'),
(168, 1, 68, NULL, 0, '2024-07-25 12:08:44', '2024-07-25 12:08:44'),
(169, 7, 68, NULL, 0, '2024-07-25 12:10:11', '2024-07-25 12:10:11'),
(171, 7, 71, NULL, 0, '2024-07-25 12:36:55', '2024-07-25 12:36:55'),
(172, 4, 71, NULL, 0, '2024-07-25 12:44:20', '2024-07-25 12:44:20'),
(173, 3, 71, NULL, 0, '2024-07-25 12:44:35', '2024-07-25 12:44:35'),
(175, 7, 63, NULL, 0, '2024-07-25 12:50:12', '2024-07-25 12:50:12'),
(176, 5, 63, NULL, 0, '2024-07-25 12:50:22', '2024-07-25 12:50:22'),
(177, 4, 63, NULL, 0, '2024-07-25 12:50:37', '2024-07-25 12:50:37'),
(178, 3, 63, NULL, 0, '2024-07-25 12:51:08', '2024-07-25 12:51:08'),
(179, 1, 63, NULL, 0, '2024-07-25 12:53:18', '2024-07-25 12:53:18'),
(181, 7, 72, NULL, 0, '2024-07-25 13:08:57', '2024-07-25 13:08:57'),
(182, 5, 72, NULL, 0, '2024-07-25 13:09:27', '2024-07-25 13:09:27'),
(183, 4, 72, NULL, 0, '2024-07-25 13:09:43', '2024-07-25 13:09:43'),
(184, 3, 72, NULL, 0, '2024-07-25 13:09:56', '2024-07-25 13:09:56'),
(185, 1, 72, NULL, 0, '2024-07-25 13:10:15', '2024-07-25 13:10:15'),
(187, 7, 73, NULL, 0, '2024-07-25 14:03:12', '2024-07-25 14:03:12'),
(188, 5, 73, NULL, 0, '2024-07-25 14:03:33', '2024-07-25 14:03:33'),
(189, 4, 73, NULL, 0, '2024-07-25 14:03:45', '2024-07-25 14:03:45'),
(190, 3, 73, NULL, 0, '2024-07-25 14:03:58', '2024-07-25 14:03:58'),
(191, 1, 73, NULL, 0, '2024-07-25 14:04:12', '2024-07-25 14:04:12'),
(193, 7, 74, NULL, 0, '2024-07-25 16:50:55', '2024-07-25 16:50:55'),
(194, 5, 74, NULL, 0, '2024-07-25 16:51:09', '2024-07-25 16:51:09'),
(195, 4, 74, NULL, 0, '2024-07-25 16:51:30', '2024-07-25 16:51:30'),
(196, 3, 74, NULL, 0, '2024-07-25 16:51:46', '2024-07-25 16:51:46'),
(197, 1, 74, NULL, 0, '2024-07-25 16:51:59', '2024-07-25 16:51:59'),
(199, 7, 75, NULL, 0, '2024-07-25 17:02:21', '2024-07-25 17:02:21'),
(200, 7, 75, NULL, 0, '2024-07-25 17:02:28', '2024-07-25 17:02:28'),
(201, 5, 75, NULL, 0, '2024-07-25 17:02:45', '2024-07-25 17:02:45'),
(202, 5, 75, NULL, 0, '2024-07-25 17:02:51', '2024-07-25 17:02:51'),
(203, 4, 75, NULL, 0, '2024-07-25 17:03:08', '2024-07-25 17:03:08'),
(204, 3, 75, NULL, 0, '2024-07-25 17:03:21', '2024-07-25 17:03:21'),
(205, 1, 75, NULL, 0, '2024-07-25 17:03:30', '2024-07-25 17:03:30'),
(207, 7, 76, NULL, 0, '2024-07-25 17:26:45', '2024-07-25 17:26:45'),
(210, 5, 76, NULL, 0, '2024-07-25 17:28:13', '2024-07-25 17:28:13'),
(211, 4, 76, NULL, 0, '2024-07-25 17:28:47', '2024-07-25 17:28:47'),
(212, 3, 76, NULL, 0, '2024-07-25 17:29:07', '2024-07-25 17:29:07'),
(213, 1, 76, NULL, 0, '2024-07-25 17:29:27', '2024-07-25 17:29:27'),
(217, 7, 78, NULL, 0, '2024-07-25 18:10:15', '2024-07-25 18:10:15'),
(218, 4, 78, NULL, 0, '2024-07-25 18:10:39', '2024-07-25 18:10:39'),
(219, 3, 78, NULL, 0, '2024-07-25 18:10:47', '2024-07-25 18:10:47'),
(220, 7, 79, NULL, 0, '2024-07-25 18:10:50', '2024-07-25 18:10:50'),
(221, 1, 78, NULL, 0, '2024-07-25 18:11:03', '2024-07-25 18:11:03'),
(222, 5, 79, NULL, 0, '2024-07-25 18:11:19', '2024-07-25 18:11:19'),
(223, 4, 79, NULL, 0, '2024-07-25 18:11:42', '2024-07-25 18:11:42'),
(224, 3, 79, NULL, 0, '2024-07-25 18:12:06', '2024-07-25 18:12:06'),
(225, 1, 79, NULL, 0, '2024-07-25 18:12:46', '2024-07-25 18:12:46'),
(226, 5, 78, NULL, 0, '2024-07-25 18:13:31', '2024-07-25 18:13:31'),
(228, 7, 80, NULL, 0, '2024-07-25 18:58:44', '2024-07-25 18:58:44'),
(229, 5, 80, NULL, 0, '2024-07-25 18:59:02', '2024-07-25 18:59:02'),
(230, 4, 80, NULL, 0, '2024-07-25 18:59:23', '2024-07-25 18:59:23'),
(231, 3, 80, NULL, 0, '2024-07-25 18:59:35', '2024-07-25 18:59:35'),
(232, 1, 80, NULL, 0, '2024-07-25 18:59:46', '2024-07-25 18:59:46'),
(234, 7, 81, NULL, 0, '2024-07-26 14:53:42', '2024-07-26 14:53:42'),
(235, 5, 81, NULL, 0, '2024-07-26 14:54:00', '2024-07-26 14:54:00'),
(236, 4, 81, NULL, 0, '2024-07-26 14:54:16', '2024-07-26 14:54:16'),
(237, 3, 81, NULL, 0, '2024-07-26 14:54:33', '2024-07-26 14:54:33'),
(238, 1, 81, NULL, 0, '2024-07-26 14:54:41', '2024-07-26 14:54:41'),
(240, 7, 82, NULL, 0, '2024-07-26 15:11:27', '2024-07-26 15:11:27'),
(241, 5, 82, NULL, 0, '2024-07-26 15:11:53', '2024-07-26 15:11:53'),
(242, 4, 82, NULL, 0, '2024-07-26 15:12:10', '2024-07-26 15:12:10'),
(243, 3, 82, NULL, 0, '2024-07-26 15:12:23', '2024-07-26 15:12:23'),
(244, 1, 82, NULL, 0, '2024-07-26 15:13:08', '2024-07-26 15:13:08'),
(245, 7, 83, NULL, 0, '2024-07-26 20:13:41', '2024-07-26 20:13:41'),
(246, 5, 83, NULL, 0, '2024-07-26 20:13:51', '2024-07-26 20:13:51'),
(247, 4, 83, NULL, 0, '2024-07-26 20:13:59', '2024-07-26 20:13:59'),
(248, 3, 83, NULL, 0, '2024-07-26 20:14:07', '2024-07-26 20:14:07'),
(249, 1, 83, NULL, 0, '2024-07-26 20:14:12', '2024-07-26 20:14:12'),
(252, 7, 84, NULL, 0, '2024-07-27 16:38:56', '2024-07-27 16:38:56'),
(253, 5, 84, NULL, 0, '2024-07-27 16:39:20', '2024-07-27 16:39:20'),
(254, 4, 84, NULL, 0, '2024-07-27 16:39:31', '2024-07-27 16:39:31'),
(255, 3, 84, NULL, 0, '2024-07-27 16:39:44', '2024-07-27 16:39:44'),
(256, 1, 84, NULL, 0, '2024-07-27 16:40:01', '2024-07-27 16:40:01'),
(258, 7, 85, NULL, 0, '2024-07-27 16:44:48', '2024-07-27 16:44:48'),
(259, 5, 85, NULL, 0, '2024-07-27 16:45:21', '2024-07-27 16:45:21'),
(260, 4, 85, NULL, 0, '2024-07-27 16:45:33', '2024-07-27 16:45:33'),
(261, 3, 85, NULL, 0, '2024-07-27 16:45:44', '2024-07-27 16:45:44'),
(262, 1, 85, NULL, 0, '2024-07-27 16:45:56', '2024-07-27 16:45:56'),
(264, 7, 86, NULL, 0, '2024-07-27 17:13:42', '2024-07-27 17:13:42'),
(265, 5, 86, NULL, 0, '2024-07-27 17:13:58', '2024-07-27 17:13:58'),
(266, 4, 86, NULL, 0, '2024-07-27 17:14:10', '2024-07-27 17:14:10'),
(267, 3, 86, NULL, 0, '2024-07-27 17:14:19', '2024-07-27 17:14:19'),
(268, 1, 86, NULL, 0, '2024-07-27 17:14:36', '2024-07-27 17:14:36'),
(269, 7, 87, NULL, 0, '2024-07-27 17:59:09', '2024-07-27 17:59:09'),
(270, 4, 87, NULL, 0, '2024-07-27 18:01:53', '2024-07-27 18:01:53'),
(272, 3, 87, NULL, 0, '2024-07-27 18:06:12', '2024-07-27 18:06:12'),
(273, 5, 87, NULL, 0, '2024-07-27 18:06:51', '2024-07-27 18:06:51'),
(274, 1, 87, NULL, 0, '2024-07-27 18:07:44', '2024-07-27 18:07:44'),
(287, 7, 89, NULL, 0, '2024-07-29 16:28:52', '2024-07-29 16:28:52'),
(288, 3, 89, NULL, 0, '2024-07-29 16:32:55', '2024-07-29 16:32:55'),
(289, 4, 89, NULL, 0, '2024-07-29 16:32:55', '2024-07-29 16:32:55'),
(290, 1, 89, NULL, 0, '2024-07-29 16:33:11', '2024-07-29 16:33:11'),
(291, 5, 89, NULL, 0, '2024-07-29 16:48:18', '2024-07-29 16:48:18'),
(293, 7, 92, NULL, 0, '2024-07-29 17:36:22', '2024-07-29 17:36:22'),
(294, 5, 92, NULL, 0, '2024-07-29 17:38:08', '2024-07-29 17:38:08'),
(295, 4, 92, NULL, 0, '2024-07-29 17:38:25', '2024-07-29 17:38:25'),
(296, 3, 92, NULL, 0, '2024-07-29 17:38:38', '2024-07-29 17:38:38'),
(297, 1, 92, NULL, 0, '2024-07-29 17:39:08', '2024-07-29 17:39:08'),
(299, 7, 93, NULL, 0, '2024-07-31 15:26:25', '2024-07-31 15:26:25'),
(300, 5, 93, NULL, 0, '2024-07-31 15:26:36', '2024-07-31 15:26:36'),
(301, 4, 93, NULL, 0, '2024-07-31 15:26:45', '2024-07-31 15:26:45'),
(302, 3, 93, NULL, 0, '2024-07-31 15:26:54', '2024-07-31 15:26:54'),
(303, 1, 93, NULL, 0, '2024-07-31 15:27:06', '2024-07-31 15:27:06'),
(305, 7, 94, NULL, 0, '2024-07-31 17:36:26', '2024-07-31 17:36:26'),
(306, 5, 94, NULL, 0, '2024-07-31 17:36:39', '2024-07-31 17:36:39'),
(307, 4, 94, NULL, 0, '2024-07-31 17:36:52', '2024-07-31 17:36:52'),
(308, 3, 94, NULL, 0, '2024-07-31 17:37:09', '2024-07-31 17:37:09'),
(309, 1, 94, NULL, 0, '2024-07-31 17:37:59', '2024-07-31 17:37:59'),
(310, 7, 96, NULL, 0, '2024-08-01 22:20:41', '2024-08-01 22:20:41'),
(311, 5, 96, NULL, 0, '2024-08-01 22:20:52', '2024-08-01 22:20:52'),
(313, 4, 96, NULL, 0, '2024-08-01 22:21:17', '2024-08-01 22:21:17'),
(314, 3, 96, NULL, 0, '2024-08-01 22:21:27', '2024-08-01 22:21:27'),
(315, 1, 96, NULL, 0, '2024-08-01 22:21:43', '2024-08-01 22:21:43'),
(317, 7, 97, NULL, 0, '2024-08-02 14:03:07', '2024-08-02 14:03:07'),
(318, 5, 97, NULL, 0, '2024-08-02 14:03:18', '2024-08-02 14:03:18'),
(319, 4, 97, NULL, 0, '2024-08-02 14:03:27', '2024-08-02 14:03:27'),
(320, 3, 97, NULL, 0, '2024-08-02 14:03:37', '2024-08-02 14:03:37'),
(321, 1, 97, NULL, 0, '2024-08-02 14:03:50', '2024-08-02 14:03:50');

-- --------------------------------------------------------

--
-- Table structure for table `driver_services`
--

CREATE TABLE `driver_services` (
  `id` bigint UNSIGNED NOT NULL,
  `driver_id` bigint UNSIGNED DEFAULT NULL,
  `service_id` bigint UNSIGNED DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint UNSIGNED NOT NULL,
  `manipulations` json NOT NULL,
  `custom_properties` json NOT NULL,
  `generated_conversions` json NOT NULL,
  `responsive_images` json NOT NULL,
  `order_column` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(3, 'App\\Models\\User', 3, 'c6a475bc-5408-4157-83ae-6cf77a1e8a70', 'profile_image', '1000065894', '1000065894.jpg', 'image/jpeg', 'public', 'public', 34200, '[]', '[]', '[]', '[]', 3, '2024-07-09 00:44:45', '2024-07-09 00:44:45'),
(6, 'App\\Models\\DriverDocument', 2, '87ffc971-44ca-49ec-a75b-f945b8fbfb33', 'driver_document', '1000126860', '1000126860.jpg', 'image/jpeg', 'public', 'public', 963499, '[]', '[]', '[]', '[]', 6, '2024-07-10 13:20:37', '2024-07-10 13:20:37'),
(7, 'App\\Models\\User', 1, '9eccd5aa-a95d-4083-af75-bb8110554ee4', 'profile_image', 'OnCab Logo-01', 'OnCab-Logo-01.jpg', 'image/jpeg', 'public', 'public', 109902, '[]', '[]', '[]', '[]', 7, '2024-07-10 21:42:03', '2024-07-10 21:42:03'),
(10, 'App\\Models\\DriverDocument', 1, '74a5346a-6658-436a-9128-cad19f93f657', 'driver_document', 'logojpeg', 'logojpeg.jpeg', 'image/jpeg', 'public', 'public', 65016, '[]', '[]', '[]', '[]', 9, '2024-07-11 22:35:01', '2024-07-11 22:35:01'),
(11, 'App\\Models\\DriverDocument', 3, '20ca877f-0969-4e7e-952b-347e9dad30b5', 'driver_document', 'IMG-20240711-WA0041', 'IMG-20240711-WA0041.jpg', 'image/jpeg', 'public', 'public', 163523, '[]', '[]', '[]', '[]', 10, '2024-07-11 22:41:38', '2024-07-11 22:41:38'),
(17, 'App\\Models\\DriverDocument', 17, '9b573e22-0ad6-496e-9849-565dd2c19693', 'driver_document', '1000066439', '1000066439.jpg', 'image/jpeg', 'public', 'public', 69718, '[]', '[]', '[]', '[]', 12, '2024-07-12 00:26:45', '2024-07-12 00:26:45'),
(18, 'App\\Models\\DriverDocument', 20, '0f231e8e-6669-4036-b1bf-9a9ff910a143', 'driver_document', '1000066439', '1000066439.jpg', 'image/jpeg', 'public', 'public', 69718, '[]', '[]', '[]', '[]', 13, '2024-07-12 00:32:37', '2024-07-12 00:32:37'),
(19, 'App\\Models\\DriverDocument', 21, '10021d27-8e2e-4427-b231-f43d09946fa5', 'driver_document', 'IMG-20240712-WA0003', 'IMG-20240712-WA0003.jpg', 'image/jpeg', 'public', 'public', 45668, '[]', '[]', '[]', '[]', 14, '2024-07-12 14:44:53', '2024-07-12 14:44:53'),
(23, 'App\\Models\\DriverDocument', 26, 'f99521fd-06c2-4061-ae90-dde43957c363', 'driver_document', 'Screenshot_20240712-184458_Instagram', 'Screenshot_20240712-184458_Instagram.jpg', 'image/jpeg', 'public', 'public', 542638, '[]', '[]', '[]', '[]', 18, '2024-07-12 23:25:44', '2024-07-12 23:25:44'),
(24, 'App\\Models\\DriverDocument', 27, 'b921f931-1dfa-41f4-a027-0802772e17bf', 'driver_document', 'Screenshot_20240712-184458_Instagram', 'Screenshot_20240712-184458_Instagram.jpg', 'image/jpeg', 'public', 'public', 542638, '[]', '[]', '[]', '[]', 19, '2024-07-12 23:26:49', '2024-07-12 23:26:49'),
(27, 'App\\Models\\DriverDocument', 29, 'f567927c-fc45-4575-add8-514af346cf80', 'driver_document', 'logojpeg', 'logojpeg.jpeg', 'image/jpeg', 'public', 'public', 65016, '[]', '[]', '[]', '[]', 21, '2024-07-13 17:36:04', '2024-07-13 17:36:04'),
(28, 'App\\Models\\DriverDocument', 28, 'deea022c-21ce-4162-9896-aff67005b97e', 'driver_document', 'Ride', 'Ride.jpg', 'image/jpeg', 'public', 'public', 151353, '[]', '[]', '[]', '[]', 22, '2024-07-13 17:36:45', '2024-07-13 17:36:45'),
(31, 'App\\Models\\User', 2, 'c5648ab6-8081-45c0-b12f-4f7b2a0ede3a', 'profile_image', '1000127610', '1000127610.jpg', 'image/jpeg', 'public', 'public', 45235, '[]', '[]', '[]', '[]', 23, '2024-07-14 22:34:58', '2024-07-14 22:34:58'),
(33, 'App\\Models\\User', 29, '97dc27f1-332a-4296-8f01-b202edaccdac', 'profile_image', 'Ride', 'Ride.jpg', 'image/jpeg', 'public', 'public', 151353, '[]', '[]', '[]', '[]', 24, '2024-07-15 01:40:59', '2024-07-15 01:40:59'),
(37, 'App\\Models\\DriverDocument', 32, '5109bfda-1126-434f-bf37-6d1e48ba8d98', 'driver_document', 'IMG_7353', 'IMG_7353.jpeg', 'image/jpeg', 'public', 'public', 94084, '[]', '[]', '[]', '[]', 27, '2024-07-15 02:23:40', '2024-07-15 02:23:40'),
(38, 'App\\Models\\DriverDocument', 33, 'c2d9615b-5b97-4202-bd9d-8c205a076f17', 'driver_document', 'IMG_7353', 'IMG_7353.jpeg', 'image/jpeg', 'public', 'public', 94084, '[]', '[]', '[]', '[]', 28, '2024-07-15 02:24:07', '2024-07-15 02:24:07'),
(40, 'App\\Models\\AppSetting', 1, '20e44645-c816-4089-b8f6-39a866f36330', 'site_logo', 'OnCab Logo-01 (1)', 'OnCab-Logo-01-(1).jpg', 'image/jpeg', 'public', 'public', 39230, '[]', '[]', '[]', '[]', 30, '2024-07-18 20:25:41', '2024-07-18 20:25:41'),
(41, 'App\\Models\\AppSetting', 1, '80c5cb76-472b-4480-b2f7-5722a40de118', 'site_dark_logo', 'OnCab Logo B&W-01', 'OnCab-Logo-B&W-01.png', 'image/png', 'public', 'public', 90951, '[]', '[]', '[]', '[]', 31, '2024-07-18 20:25:41', '2024-07-18 20:25:41'),
(42, 'App\\Models\\AppSetting', 1, '9535f00e-6dff-4d0a-b4c7-f3e58161458a', 'site_favicon', 'OnCab Logo B&W-01', 'OnCab-Logo-B&W-01.png', 'image/png', 'public', 'public', 90951, '[]', '[]', '[]', '[]', 32, '2024-07-18 20:49:46', '2024-07-18 20:49:46'),
(43, 'App\\Models\\Service', 1, '1633925d-1727-4644-905c-d3ba75115e48', 'service_image', 'Ride AC-01', 'Ride-AC-01.jpg', 'image/jpeg', 'public', 'public', 151353, '[]', '[]', '[]', '[]', 33, '2024-07-19 16:25:36', '2024-07-19 16:25:36'),
(44, 'App\\Models\\Service', 2, 'e483b912-cbdc-47ab-b6f7-c3e974c204eb', 'service_image', 'Ride-01', 'Ride-01.jpg', 'image/jpeg', 'public', 'public', 110891, '[]', '[]', '[]', '[]', 34, '2024-07-19 16:26:12', '2024-07-19 16:26:12'),
(45, 'App\\Models\\Service', 3, 'e12793ea-af41-4666-bff9-98ee808fc0ed', 'service_image', 'Motorbike-01', 'Motorbike-01.jpg', 'image/jpeg', 'public', 'public', 157248, '[]', '[]', '[]', '[]', 35, '2024-07-19 16:26:39', '2024-07-19 16:26:39'),
(46, 'App\\Models\\Service', 4, 'd6da14a8-e208-49f4-9ada-9e442a0c04ac', 'service_image', 'Mini-01', 'Mini-01.jpg', 'image/jpeg', 'public', 'public', 138628, '[]', '[]', '[]', '[]', 36, '2024-07-19 16:26:58', '2024-07-19 16:26:58'),
(47, 'App\\Models\\Service', 5, 'e1c62ff8-c29f-4190-b215-7f9fabb77810', 'service_image', 'Rickshaw-01', 'Rickshaw-01.jpg', 'image/jpeg', 'public', 'public', 166437, '[]', '[]', '[]', '[]', 37, '2024-07-19 16:27:15', '2024-07-19 16:27:15'),
(48, 'App\\Models\\Service', 6, 'c2799f1c-ffc7-4aad-bf71-b16a5d0cd4d4', 'service_image', 'Courier-01', 'Courier-01.jpg', 'image/jpeg', 'public', 'public', 98834, '[]', '[]', '[]', '[]', 38, '2024-07-19 16:27:29', '2024-07-19 16:27:29'),
(51, 'App\\Models\\DriverDocument', 35, 'eeaf9ed9-8a37-46be-b9f4-8eedf9786eb9', 'driver_document', '1000230940', '1000230940.jpg', 'image/jpeg', 'public', 'public', 91512, '[]', '[]', '[]', '[]', 39, '2024-07-23 17:08:44', '2024-07-23 17:08:44'),
(52, 'App\\Models\\DriverDocument', 36, '03b50a41-f70b-4606-a2a2-2a4ea48e712b', 'driver_document', '1000230797', '1000230797.jpg', 'image/jpeg', 'public', 'public', 36014, '[]', '[]', '[]', '[]', 40, '2024-07-23 17:09:41', '2024-07-23 17:09:41'),
(53, 'App\\Models\\DriverDocument', 37, '59e32cc1-f25d-42e0-aa2d-77343abd293a', 'driver_document', '1000230783', '1000230783.jpg', 'image/jpeg', 'public', 'public', 74770, '[]', '[]', '[]', '[]', 41, '2024-07-23 17:09:54', '2024-07-23 17:09:54'),
(54, 'App\\Models\\DriverDocument', 38, '99435ef7-ca21-4d2c-bad7-195ea757cc0b', 'driver_document', '1000230774', '1000230774.jpg', 'image/jpeg', 'public', 'public', 149935, '[]', '[]', '[]', '[]', 42, '2024-07-23 17:10:11', '2024-07-23 17:10:11'),
(55, 'App\\Models\\DriverDocument', 39, '281ea3bd-d35a-4213-8e2d-6ee26ae003d4', 'driver_document', '1000230744', '1000230744.jpg', 'image/jpeg', 'public', 'public', 39434, '[]', '[]', '[]', '[]', 43, '2024-07-23 17:10:31', '2024-07-23 17:10:31'),
(56, 'App\\Models\\DriverDocument', 40, '08c48512-8c5e-44c8-9eaf-d904ccdf86c2', 'driver_document', '1000230737', '1000230737.jpg', 'image/jpeg', 'public', 'public', 61108, '[]', '[]', '[]', '[]', 44, '2024-07-23 17:10:45', '2024-07-23 17:10:45'),
(57, 'App\\Models\\DriverDocument', 41, '2b837f74-f1c1-4ec3-94fb-391b57087120', 'driver_document', '1000230519', '1000230519.jpg', 'image/jpeg', 'public', 'public', 5265, '[]', '[]', '[]', '[]', 45, '2024-07-23 17:11:02', '2024-07-23 17:11:02'),
(58, 'App\\Models\\DriverDocument', 42, 'b15bddd4-fb0a-407b-b055-74bb39301740', 'driver_document', '1000230475', '1000230475.jpg', 'image/jpeg', 'public', 'public', 21835, '[]', '[]', '[]', '[]', 46, '2024-07-23 17:11:23', '2024-07-23 17:11:23'),
(61, 'App\\Models\\DriverDocument', 57, '173806c8-d5d6-473d-88f8-0f6c56e0fbda', 'driver_document', '6b7882c3-c538-471f-bdae-a0236de46b584362665075375217688', '6b7882c3-c538-471f-bdae-a0236de46b584362665075375217688.jpg', 'image/jpeg', 'public', 'public', 1986180, '[]', '[]', '[]', '[]', 49, '2024-07-23 19:23:42', '2024-07-23 19:23:42'),
(62, 'App\\Models\\DriverDocument', 48, '1d951a46-0547-4ceb-ab3a-d188af09215e', 'driver_document', '1000267654', '1000267654.jpg', 'image/jpeg', 'public', 'public', 1785266, '[]', '[]', '[]', '[]', 50, '2024-07-23 19:23:51', '2024-07-23 19:23:51'),
(63, 'App\\Models\\DriverDocument', 49, '70490c5b-0c8a-4c03-b365-89538a70219a', 'driver_document', '1000267650', '1000267650.jpg', 'image/jpeg', 'public', 'public', 762078, '[]', '[]', '[]', '[]', 51, '2024-07-23 19:24:10', '2024-07-23 19:24:10'),
(65, 'App\\Models\\DriverDocument', 59, '9db1b082-c2e1-48b9-8fe4-7940a9c1a28a', 'driver_document', '1000267650', '1000267650.jpg', 'image/jpeg', 'public', 'public', 762078, '[]', '[]', '[]', '[]', 53, '2024-07-23 19:25:00', '2024-07-23 19:25:00'),
(66, 'App\\Models\\DriverDocument', 60, '54ec6ed8-bbf1-4a39-8c2a-77a9297e0456', 'driver_document', '1000267649', '1000267649.jpg', 'image/jpeg', 'public', 'public', 815532, '[]', '[]', '[]', '[]', 54, '2024-07-23 19:25:15', '2024-07-23 19:25:15'),
(68, 'App\\Models\\DriverDocument', 71, '6b4391c7-21b7-4807-9e81-ff8243a65642', 'driver_document', '1000266050', '1000266050.jpg', 'image/jpeg', 'public', 'public', 21933, '[]', '[]', '[]', '[]', 55, '2024-07-23 19:30:17', '2024-07-23 19:30:17'),
(69, 'App\\Models\\DriverDocument', 77, '7b83b313-0176-4094-a1e1-0c3031eddf67', 'driver_document', '1000267698', '1000267698.jpg', 'image/jpeg', 'public', 'public', 1494326, '[]', '[]', '[]', '[]', 56, '2024-07-23 19:49:22', '2024-07-23 19:49:22'),
(70, 'App\\Models\\DriverDocument', 78, '2765af4e-410b-4c38-b5d5-4e9457b2fbbb', 'driver_document', '1000267654', '1000267654.jpg', 'image/jpeg', 'public', 'public', 1785266, '[]', '[]', '[]', '[]', 57, '2024-07-23 19:49:35', '2024-07-23 19:49:35'),
(71, 'App\\Models\\DriverDocument', 80, 'de17f5a4-a177-4682-aee9-59bcb634b3ad', 'driver_document', '1000267650', '1000267650.jpg', 'image/jpeg', 'public', 'public', 762078, '[]', '[]', '[]', '[]', 58, '2024-07-23 19:49:46', '2024-07-23 19:49:46'),
(72, 'App\\Models\\DriverDocument', 83, '7d383ad7-6adf-4cf5-bff7-82f479065050', 'driver_document', '1000267649', '1000267649.jpg', 'image/jpeg', 'public', 'public', 815532, '[]', '[]', '[]', '[]', 59, '2024-07-23 19:50:03', '2024-07-23 19:50:03'),
(74, 'App\\Models\\DriverDocument', 76, '9b21cfe0-02b0-4768-943b-e2cb130fda4c', 'driver_document', '1000266050', '1000266050.jpg', 'image/jpeg', 'public', 'public', 21933, '[]', '[]', '[]', '[]', 61, '2024-07-23 19:51:18', '2024-07-23 19:51:18'),
(75, 'App\\Models\\User', 44, '42b810be-9976-42be-9880-b0e24d1bf558', 'profile_image', '1000159371', '1000159371.jpg', 'image/jpeg', 'public', 'public', 745474, '[]', '[]', '[]', '[]', 62, '2024-07-23 20:08:56', '2024-07-23 20:08:56'),
(76, 'App\\Models\\DriverDocument', 91, '45ff9672-5a30-4c09-a88b-5eaf0f7fa33c', 'driver_document', '5595dfb6-abf7-4acd-9508-daa49ad021513025776127002251389', '5595dfb6-abf7-4acd-9508-daa49ad021513025776127002251389.jpg', 'image/jpeg', 'public', 'public', 1895682, '[]', '[]', '[]', '[]', 63, '2024-07-23 20:12:54', '2024-07-23 20:12:54'),
(77, 'App\\Models\\DriverDocument', 100, '9c4abb54-f675-4a69-b141-fc04c25f9335', 'driver_document', '478da247-a843-4ab2-b377-bccd8b50aa5a3012042855891293779', '478da247-a843-4ab2-b377-bccd8b50aa5a3012042855891293779.jpg', 'image/jpeg', 'public', 'public', 1569375, '[]', '[]', '[]', '[]', 64, '2024-07-24 14:41:59', '2024-07-24 14:41:59'),
(78, 'App\\Models\\DriverDocument', 114, '6364ddf9-4a07-4d00-ad54-30ad26ff332e', 'driver_document', 'IMG-20240724-WA0006', 'IMG-20240724-WA0006.jpg', 'image/jpeg', 'public', 'public', 147825, '[]', '[]', '[]', '[]', 65, '2024-07-24 14:55:45', '2024-07-24 14:55:45'),
(79, 'App\\Models\\DriverDocument', 115, '851e654f-ed8c-4358-984d-bc5c62fc9dec', 'driver_document', 'IMG-20240724-WA0007', 'IMG-20240724-WA0007.jpg', 'image/jpeg', 'public', 'public', 147977, '[]', '[]', '[]', '[]', 66, '2024-07-24 14:55:55', '2024-07-24 14:55:55'),
(81, 'App\\Models\\DriverDocument', 140, 'b2f39f3d-0361-4b7d-96bd-5e50e71a96fc', 'driver_document', 'cd24da38-8201-4bcd-87cd-9410a7b4f5877818106825247076314', 'cd24da38-8201-4bcd-87cd-9410a7b4f5877818106825247076314.jpg', 'image/jpeg', 'public', 'public', 2052092, '[]', '[]', '[]', '[]', 68, '2024-07-24 16:47:50', '2024-07-24 16:47:50'),
(87, 'App\\Models\\DriverDocument', 162, '4e46e2ab-7cdb-4114-b189-5508c8df1c31', 'driver_document', 'IMG-20240724-WA0023', 'IMG-20240724-WA0023.jpg', 'image/jpeg', 'public', 'public', 68472, '[]', '[]', '[]', '[]', 69, '2024-07-25 00:08:43', '2024-07-25 00:08:43'),
(88, 'App\\Models\\DriverDocument', 163, '507c6fb0-d8c7-4784-a5cb-4a667fccddf4', 'driver_document', 'IMG-20240724-WA0022', 'IMG-20240724-WA0022.jpg', 'image/jpeg', 'public', 'public', 66702, '[]', '[]', '[]', '[]', 70, '2024-07-25 00:09:53', '2024-07-25 00:09:53'),
(90, 'App\\Models\\DriverDocument', 165, 'f9f85f5a-043f-4925-b2ab-5270c79a8d7f', 'driver_document', '1000269992', '1000269992.jpg', 'image/jpeg', 'public', 'public', 66144, '[]', '[]', '[]', '[]', 72, '2024-07-25 03:38:59', '2024-07-25 03:38:59'),
(91, 'App\\Models\\DriverDocument', 167, '7d2e1942-5f2a-429c-a4df-c7ad39df8ef2', 'driver_document', 'IMG-20240724-WA0022', 'IMG-20240724-WA0022.jpg', 'image/jpeg', 'public', 'public', 66702, '[]', '[]', '[]', '[]', 73, '2024-07-25 12:06:36', '2024-07-25 12:06:36'),
(92, 'App\\Models\\DriverDocument', 168, '85e76a23-4941-46a5-9e7e-5443e6b2d7ee', 'driver_document', 'IMG-20240724-WA0027', 'IMG-20240724-WA0027.jpg', 'image/jpeg', 'public', 'public', 104443, '[]', '[]', '[]', '[]', 74, '2024-07-25 12:08:44', '2024-07-25 12:08:44'),
(93, 'App\\Models\\DriverDocument', 169, 'b37326a2-a81b-49b1-8256-80aa7a61f6b1', 'driver_document', 'IMG-20240724-WA0024', 'IMG-20240724-WA0024.jpg', 'image/jpeg', 'public', 'public', 72008, '[]', '[]', '[]', '[]', 75, '2024-07-25 12:10:11', '2024-07-25 12:10:11'),
(94, 'App\\Models\\DriverDocument', 171, '2837438c-24d6-4762-b017-ca3199fd7098', 'driver_document', '1000270303', '1000270303.jpg', 'image/jpeg', 'public', 'public', 147652, '[]', '[]', '[]', '[]', 76, '2024-07-25 12:36:55', '2024-07-25 12:36:55'),
(95, 'App\\Models\\DriverDocument', 164, '3703443f-0908-438a-809a-305fd6d240d8', 'driver_document', 'c36a977e-4cc6-4e66-9583-c9863b84c3e22292220800133795073', 'c36a977e-4cc6-4e66-9583-c9863b84c3e22292220800133795073.jpg', 'image/jpeg', 'public', 'public', 1752639, '[]', '[]', '[]', '[]', 77, '2024-07-25 12:37:54', '2024-07-25 12:37:54'),
(96, 'App\\Models\\DriverDocument', 172, '747f6928-1b5b-466d-b36c-bb22f81e002c', 'driver_document', '1000270364', '1000270364.jpg', 'image/jpeg', 'public', 'public', 121108, '[]', '[]', '[]', '[]', 78, '2024-07-25 12:44:20', '2024-07-25 12:44:20'),
(97, 'App\\Models\\DriverDocument', 173, 'eacceeec-8128-4848-8bee-ae2be27350b2', 'driver_document', '1000270360', '1000270360.jpg', 'image/jpeg', 'public', 'public', 119155, '[]', '[]', '[]', '[]', 79, '2024-07-25 12:44:35', '2024-07-25 12:44:35'),
(98, 'App\\Models\\DriverDocument', 166, '0155dc78-70c3-4add-9222-c3e866455071', 'driver_document', '1000270327', '1000270327.jpg', 'image/jpeg', 'public', 'public', 201278, '[]', '[]', '[]', '[]', 80, '2024-07-25 12:44:51', '2024-07-25 12:44:51'),
(99, 'App\\Models\\DriverDocument', 174, '7131b837-3759-404d-8c8a-d26a3103578d', 'driver_document', 'aa0d841f-7252-4a9a-9620-9a08083beaea1922698071737725063', 'aa0d841f-7252-4a9a-9620-9a08083beaea1922698071737725063.jpg', 'image/jpeg', 'public', 'public', 1706151, '[]', '[]', '[]', '[]', 81, '2024-07-25 12:47:45', '2024-07-25 12:47:45'),
(100, 'App\\Models\\DriverDocument', 175, '630a5ef3-4a0d-4bf4-ba59-057fd1677ed1', 'driver_document', '1000270374', '1000270374.jpg', 'image/jpeg', 'public', 'public', 989698, '[]', '[]', '[]', '[]', 82, '2024-07-25 12:50:12', '2024-07-25 12:50:12'),
(101, 'App\\Models\\DriverDocument', 176, '50dde437-11d9-4bfb-99d7-255207fc6981', 'driver_document', '1000270378', '1000270378.jpg', 'image/jpeg', 'public', 'public', 153617, '[]', '[]', '[]', '[]', 83, '2024-07-25 12:50:22', '2024-07-25 12:50:22'),
(102, 'App\\Models\\DriverDocument', 177, '4149662a-7d90-4794-ba2d-ddd13324b7d4', 'driver_document', '1000270373', '1000270373.jpg', 'image/jpeg', 'public', 'public', 73072, '[]', '[]', '[]', '[]', 84, '2024-07-25 12:50:37', '2024-07-25 12:50:37'),
(103, 'App\\Models\\DriverDocument', 178, '1d00ec32-4bc9-4a78-a133-a29e69d79a31', 'driver_document', '1000270372', '1000270372.jpg', 'image/jpeg', 'public', 'public', 70990, '[]', '[]', '[]', '[]', 85, '2024-07-25 12:51:08', '2024-07-25 12:51:08'),
(104, 'App\\Models\\DriverDocument', 179, 'e693456f-3875-4180-9c8d-2c5b87e9b600', 'driver_document', '1000270381', '1000270381.jpg', 'image/jpeg', 'public', 'public', 4835, '[]', '[]', '[]', '[]', 86, '2024-07-25 12:53:18', '2024-07-25 12:53:18'),
(105, 'App\\Models\\DriverDocument', 180, 'ac8db51c-a9dc-4f08-b161-73d7f72ca09d', 'driver_document', 'fd6c65f4-1544-439e-8c59-74a54d39be36800660416643453089', 'fd6c65f4-1544-439e-8c59-74a54d39be36800660416643453089.jpg', 'image/jpeg', 'public', 'public', 1642621, '[]', '[]', '[]', '[]', 87, '2024-07-25 13:08:24', '2024-07-25 13:08:24'),
(106, 'App\\Models\\DriverDocument', 181, 'aa9b2012-da09-4c72-bf99-c17c2a6c474a', 'driver_document', '1000270409', '1000270409.jpg', 'image/jpeg', 'public', 'public', 110878, '[]', '[]', '[]', '[]', 88, '2024-07-25 13:08:57', '2024-07-25 13:08:57'),
(107, 'App\\Models\\DriverDocument', 182, 'a3444698-5f73-4cc2-a63f-96018efcc1de', 'driver_document', '1000270386', '1000270386.jpg', 'image/jpeg', 'public', 'public', 205862, '[]', '[]', '[]', '[]', 89, '2024-07-25 13:09:27', '2024-07-25 13:09:27'),
(108, 'App\\Models\\DriverDocument', 183, '25102999-872a-4600-8bfd-016502c3ffc8', 'driver_document', '1000270396', '1000270396.jpg', 'image/jpeg', 'public', 'public', 117422, '[]', '[]', '[]', '[]', 90, '2024-07-25 13:09:43', '2024-07-25 13:09:43'),
(109, 'App\\Models\\DriverDocument', 184, 'bb0d8631-3c2f-41c0-89a6-6105c650d189', 'driver_document', '1000270393', '1000270393.jpg', 'image/jpeg', 'public', 'public', 145485, '[]', '[]', '[]', '[]', 91, '2024-07-25 13:09:56', '2024-07-25 13:09:56'),
(110, 'App\\Models\\DriverDocument', 185, '82d01770-fd2a-4ae3-b0a5-6f535cd52b67', 'driver_document', '1000270405', '1000270405.jpg', 'image/jpeg', 'public', 'public', 97162, '[]', '[]', '[]', '[]', 92, '2024-07-25 13:10:15', '2024-07-25 13:10:15'),
(111, 'App\\Models\\DriverDocument', 186, 'a1a384d6-ad28-48b0-a737-1554b60c4b42', 'driver_document', 'a4afcfc6-b688-4f28-86f6-bd1c4ea11b4c6539923451920396527', 'a4afcfc6-b688-4f28-86f6-bd1c4ea11b4c6539923451920396527.jpg', 'image/jpeg', 'public', 'public', 1727677, '[]', '[]', '[]', '[]', 93, '2024-07-25 14:02:52', '2024-07-25 14:02:52'),
(112, 'App\\Models\\DriverDocument', 187, '8f98e68e-31fa-4eb6-a28b-af46ba912c44', 'driver_document', '1000270563', '1000270563.jpg', 'image/jpeg', 'public', 'public', 59681, '[]', '[]', '[]', '[]', 94, '2024-07-25 14:03:12', '2024-07-25 14:03:12'),
(113, 'App\\Models\\DriverDocument', 188, '55e0a163-890d-4241-83b7-6ab16f1f407f', 'driver_document', '1000270592', '1000270592.jpg', 'image/jpeg', 'public', 'public', 57128, '[]', '[]', '[]', '[]', 95, '2024-07-25 14:03:33', '2024-07-25 14:03:33'),
(114, 'App\\Models\\DriverDocument', 189, '9c12f019-799e-48bb-83a3-8e47cdee0db9', 'driver_document', '1000270594', '1000270594.jpg', 'image/jpeg', 'public', 'public', 49734, '[]', '[]', '[]', '[]', 96, '2024-07-25 14:03:45', '2024-07-25 14:03:45'),
(115, 'App\\Models\\DriverDocument', 190, 'b765af4b-e9d3-4e0b-8c86-99234807e890', 'driver_document', '1000270593', '1000270593.jpg', 'image/jpeg', 'public', 'public', 49273, '[]', '[]', '[]', '[]', 97, '2024-07-25 14:03:58', '2024-07-25 14:03:58'),
(116, 'App\\Models\\DriverDocument', 191, '1ce120f6-ce69-4bc6-b848-748156fcb794', 'driver_document', '1000270596', '1000270596.jpg', 'image/jpeg', 'public', 'public', 51926, '[]', '[]', '[]', '[]', 98, '2024-07-25 14:04:12', '2024-07-25 14:04:12'),
(117, 'App\\Models\\DriverDocument', 192, 'e91b4e77-64ed-460d-87a5-3653c0439023', 'driver_document', 'fd60926c-4316-4de3-b2a6-45f8a52016047955456363135031621', 'fd60926c-4316-4de3-b2a6-45f8a52016047955456363135031621.jpg', 'image/jpeg', 'public', 'public', 1635221, '[]', '[]', '[]', '[]', 99, '2024-07-25 16:50:14', '2024-07-25 16:50:14'),
(118, 'App\\Models\\DriverDocument', 193, '2790b5d9-2cf8-4918-9adc-74fe7fa33f20', 'driver_document', '1000270849', '1000270849.jpg', 'image/jpeg', 'public', 'public', 55604, '[]', '[]', '[]', '[]', 100, '2024-07-25 16:50:55', '2024-07-25 16:50:55'),
(119, 'App\\Models\\DriverDocument', 194, '9b25e919-1e69-4d21-aabf-98448642e9b9', 'driver_document', '1000270843', '1000270843.jpg', 'image/jpeg', 'public', 'public', 53665, '[]', '[]', '[]', '[]', 101, '2024-07-25 16:51:09', '2024-07-25 16:51:09'),
(120, 'App\\Models\\DriverDocument', 195, '29d80d6d-3e16-416c-b56c-aa8bc2e5c09f', 'driver_document', '1000270841', '1000270841.jpg', 'image/jpeg', 'public', 'public', 39744, '[]', '[]', '[]', '[]', 102, '2024-07-25 16:51:30', '2024-07-25 16:51:30'),
(121, 'App\\Models\\DriverDocument', 196, '795b5d1f-eb83-4daa-ac88-0db67b8c8565', 'driver_document', '1000270837', '1000270837.jpg', 'image/jpeg', 'public', 'public', 46810, '[]', '[]', '[]', '[]', 103, '2024-07-25 16:51:46', '2024-07-25 16:51:46'),
(122, 'App\\Models\\DriverDocument', 197, '59100a34-ced5-4595-a1c3-c996fceb183b', 'driver_document', '1000270852', '1000270852.jpg', 'image/jpeg', 'public', 'public', 47591, '[]', '[]', '[]', '[]', 104, '2024-07-25 16:51:59', '2024-07-25 16:51:59'),
(123, 'App\\Models\\DriverDocument', 199, '7823b4a3-5022-453f-a7e9-da6a1df9c72d', 'driver_document', 'IMG-20240725-WA0133', 'IMG-20240725-WA0133.jpg', 'image/jpeg', 'public', 'public', 82915, '[]', '[]', '[]', '[]', 105, '2024-07-25 17:02:21', '2024-07-25 17:02:21'),
(124, 'App\\Models\\DriverDocument', 200, 'd404f676-e71d-46cb-be50-94dc7db08e7e', 'driver_document', 'IMG-20240725-WA0134', 'IMG-20240725-WA0134.jpg', 'image/jpeg', 'public', 'public', 96817, '[]', '[]', '[]', '[]', 106, '2024-07-25 17:02:28', '2024-07-25 17:02:28'),
(125, 'App\\Models\\DriverDocument', 201, '48eb2e76-7ed9-46c8-b4c4-e1bcd74b158c', 'driver_document', 'IMG-20240725-WA0136', 'IMG-20240725-WA0136.jpg', 'image/jpeg', 'public', 'public', 75068, '[]', '[]', '[]', '[]', 107, '2024-07-25 17:02:45', '2024-07-25 17:02:45'),
(126, 'App\\Models\\DriverDocument', 202, '74e95034-3844-4ef6-baaa-553bf6d25859', 'driver_document', 'IMG-20240725-WA0135', 'IMG-20240725-WA0135.jpg', 'image/jpeg', 'public', 'public', 69492, '[]', '[]', '[]', '[]', 108, '2024-07-25 17:02:51', '2024-07-25 17:02:51'),
(127, 'App\\Models\\DriverDocument', 203, '1229478b-ac95-48f9-b522-6989a1e99bfd', 'driver_document', 'IMG-20240725-WA0138', 'IMG-20240725-WA0138.jpg', 'image/jpeg', 'public', 'public', 114236, '[]', '[]', '[]', '[]', 109, '2024-07-25 17:03:08', '2024-07-25 17:03:08'),
(128, 'App\\Models\\DriverDocument', 204, '14f89bb9-6862-4a3a-8d43-c3b4544e5423', 'driver_document', 'IMG-20240725-WA0137', 'IMG-20240725-WA0137.jpg', 'image/jpeg', 'public', 'public', 169272, '[]', '[]', '[]', '[]', 110, '2024-07-25 17:03:21', '2024-07-25 17:03:21'),
(129, 'App\\Models\\DriverDocument', 205, '28255b4d-22da-4b84-9cc3-2ec2fafc16d9', 'driver_document', 'IMG-20240725-WA0139', 'IMG-20240725-WA0139.jpg', 'image/jpeg', 'public', 'public', 109127, '[]', '[]', '[]', '[]', 111, '2024-07-25 17:03:30', '2024-07-25 17:03:30'),
(131, 'App\\Models\\DriverDocument', 207, '65089f16-7f54-4f10-b2c6-19c8b99bb881', 'driver_document', 'IMG-20240725-WA0108', 'IMG-20240725-WA0108.jpg', 'image/jpeg', 'public', 'public', 98707, '[]', '[]', '[]', '[]', 112, '2024-07-25 17:26:45', '2024-07-25 17:26:45'),
(134, 'App\\Models\\DriverDocument', 210, '1b4b32f5-c3ca-42e9-be5e-6f01e4513420', 'driver_document', 'IMG-20240725-WA0106', 'IMG-20240725-WA0106.jpg', 'image/jpeg', 'public', 'public', 58730, '[]', '[]', '[]', '[]', 113, '2024-07-25 17:28:13', '2024-07-25 17:28:13'),
(135, 'App\\Models\\DriverDocument', 211, 'fe5ef5aa-e829-43c5-b71c-8a833eea03b5', 'driver_document', 'IMG-20240725-WA0105', 'IMG-20240725-WA0105.jpg', 'image/jpeg', 'public', 'public', 76389, '[]', '[]', '[]', '[]', 114, '2024-07-25 17:28:47', '2024-07-25 17:28:47'),
(136, 'App\\Models\\DriverDocument', 212, '68eea2cf-b094-4d27-a05b-672cc15f13a3', 'driver_document', 'IMG-20240725-WA0104', 'IMG-20240725-WA0104.jpg', 'image/jpeg', 'public', 'public', 68847, '[]', '[]', '[]', '[]', 115, '2024-07-25 17:29:07', '2024-07-25 17:29:07'),
(137, 'App\\Models\\DriverDocument', 213, 'f205d8f9-e52f-49e7-8dc3-ff25d21a5abe', 'driver_document', 'IMG-20240725-WA0115', 'IMG-20240725-WA0115.jpg', 'image/jpeg', 'public', 'public', 40791, '[]', '[]', '[]', '[]', 116, '2024-07-25 17:29:27', '2024-07-25 17:29:27'),
(138, 'App\\Models\\DriverDocument', 216, '474e2ada-fcf9-4427-87b4-4b5d1a76bba5', 'driver_document', 'b58228ca-8e80-429e-8c89-f736362f1ce94942153444391907231', 'b58228ca-8e80-429e-8c89-f736362f1ce94942153444391907231.jpg', 'image/jpeg', 'public', 'public', 1719504, '[]', '[]', '[]', '[]', 117, '2024-07-25 18:09:57', '2024-07-25 18:09:57'),
(139, 'App\\Models\\DriverDocument', 217, 'df9c718f-0826-4b4d-913e-5efd786f336f', 'driver_document', '1000271000', '1000271000.jpg', 'image/jpeg', 'public', 'public', 127539, '[]', '[]', '[]', '[]', 118, '2024-07-25 18:10:15', '2024-07-25 18:10:15'),
(140, 'App\\Models\\DriverDocument', 218, '905b1370-66fb-4ade-a017-db6e08a2a37d', 'driver_document', '1000270986', '1000270986.jpg', 'image/jpeg', 'public', 'public', 71842, '[]', '[]', '[]', '[]', 119, '2024-07-25 18:10:39', '2024-07-25 18:10:39'),
(141, 'App\\Models\\DriverDocument', 219, 'dd33f0fd-68f1-42f2-b098-045d1c2155a1', 'driver_document', '1000270984', '1000270984.jpg', 'image/jpeg', 'public', 'public', 64178, '[]', '[]', '[]', '[]', 120, '2024-07-25 18:10:47', '2024-07-25 18:10:47'),
(142, 'App\\Models\\DriverDocument', 220, '0904e9bb-e29d-4411-8971-f0bf4575b048', 'driver_document', 'IMG-20240723-WA0013', 'IMG-20240723-WA0013.jpg', 'image/jpeg', 'public', 'public', 195561, '[]', '[]', '[]', '[]', 121, '2024-07-25 18:10:50', '2024-07-25 18:10:50'),
(143, 'App\\Models\\DriverDocument', 221, 'e810d390-b3d8-4696-a536-2c951c0c8bd3', 'driver_document', '1000271011', '1000271011.jpg', 'image/jpeg', 'public', 'public', 129994, '[]', '[]', '[]', '[]', 122, '2024-07-25 18:11:04', '2024-07-25 18:11:04'),
(144, 'App\\Models\\DriverDocument', 222, 'cfb1f5fa-613b-4cba-a785-dde3a879b797', 'driver_document', 'IMG-20240723-WA0012', 'IMG-20240723-WA0012.jpg', 'image/jpeg', 'public', 'public', 148767, '[]', '[]', '[]', '[]', 123, '2024-07-25 18:11:19', '2024-07-25 18:11:19'),
(145, 'App\\Models\\DriverDocument', 223, '41c35b61-0f79-4c0c-9d79-612a9581ff9e', 'driver_document', 'NIC BACK MUZAMMIL KHATAK', 'NIC-BACK-MUZAMMIL-KHATAK.jpg', 'image/jpeg', 'public', 'public', 153904, '[]', '[]', '[]', '[]', 124, '2024-07-25 18:11:42', '2024-07-25 18:11:42'),
(146, 'App\\Models\\DriverDocument', 224, '49f61243-1f9c-4364-932c-f8718d6766fb', 'driver_document', 'NIC FRONT MUZAMMIL KHATAK', 'NIC-FRONT-MUZAMMIL-KHATAK.jpg', 'image/jpeg', 'public', 'public', 145183, '[]', '[]', '[]', '[]', 125, '2024-07-25 18:12:06', '2024-07-25 18:12:06'),
(147, 'App\\Models\\DriverDocument', 225, '71dc2047-9ecb-499c-abeb-0b250a2186f5', 'driver_document', 'NIC FRONT MUZAMMIL KHATAK', 'NIC-FRONT-MUZAMMIL-KHATAK.jpg', 'image/jpeg', 'public', 'public', 145183, '[]', '[]', '[]', '[]', 126, '2024-07-25 18:12:46', '2024-07-25 18:12:46'),
(148, 'App\\Models\\DriverDocument', 226, '3d34fbf4-9311-4824-bf3e-50262a7d3fbd', 'driver_document', '1000271033', '1000271033.jpg', 'image/jpeg', 'public', 'public', 66077, '[]', '[]', '[]', '[]', 127, '2024-07-25 18:13:31', '2024-07-25 18:13:31'),
(149, 'App\\Models\\DriverDocument', 227, '3f4b2823-e0b8-4133-b4e6-f6b8ffb5631f', 'driver_document', '00901c94-a147-459d-87a0-8752d38cbcdc5587522848152629407', '00901c94-a147-459d-87a0-8752d38cbcdc5587522848152629407.jpg', 'image/jpeg', 'public', 'public', 1739651, '[]', '[]', '[]', '[]', 128, '2024-07-25 18:58:25', '2024-07-25 18:58:25'),
(150, 'App\\Models\\DriverDocument', 228, '6b1b4c75-eff6-4e98-bf16-bd2e96e25738', 'driver_document', '1000271148', '1000271148.jpg', 'image/jpeg', 'public', 'public', 83893, '[]', '[]', '[]', '[]', 129, '2024-07-25 18:58:44', '2024-07-25 18:58:44'),
(151, 'App\\Models\\DriverDocument', 229, '6a9384d3-9993-4c87-a69d-debdc28b9592', 'driver_document', '1000271144', '1000271144.jpg', 'image/jpeg', 'public', 'public', 90724, '[]', '[]', '[]', '[]', 130, '2024-07-25 18:59:02', '2024-07-25 18:59:02'),
(152, 'App\\Models\\DriverDocument', 230, '9daf6ceb-3bb0-4df4-bedc-02d7d022286e', 'driver_document', '1000271119', '1000271119.jpg', 'image/jpeg', 'public', 'public', 69702, '[]', '[]', '[]', '[]', 131, '2024-07-25 18:59:23', '2024-07-25 18:59:23'),
(153, 'App\\Models\\DriverDocument', 231, '88ca1d5c-f487-452c-bfba-fb4efe8c85d1', 'driver_document', '1000271115', '1000271115.jpg', 'image/jpeg', 'public', 'public', 82302, '[]', '[]', '[]', '[]', 132, '2024-07-25 18:59:35', '2024-07-25 18:59:35'),
(154, 'App\\Models\\DriverDocument', 232, 'fdc75c9f-fb7d-46e0-bf9a-6bd6a5099b46', 'driver_document', '1000271164', '1000271164.jpg', 'image/jpeg', 'public', 'public', 86439, '[]', '[]', '[]', '[]', 133, '2024-07-25 18:59:46', '2024-07-25 18:59:46'),
(155, 'App\\Models\\DriverDocument', 234, '38a3a88f-5493-41ca-8117-451c5b5c7326', 'driver_document', 'IMG-20240725-WA0188', 'IMG-20240725-WA0188.jpg', 'image/jpeg', 'public', 'public', 112143, '[]', '[]', '[]', '[]', 134, '2024-07-26 14:53:42', '2024-07-26 14:53:42'),
(156, 'App\\Models\\DriverDocument', 235, '9cfd8df8-990d-4a04-9ad3-518f0132d3be', 'driver_document', 'IMG-20240725-WA0189', 'IMG-20240725-WA0189.jpg', 'image/jpeg', 'public', 'public', 94207, '[]', '[]', '[]', '[]', 135, '2024-07-26 14:54:00', '2024-07-26 14:54:00'),
(157, 'App\\Models\\DriverDocument', 236, 'ae4ae368-0b7f-4262-99ee-3927960a6094', 'driver_document', 'IMG-20240725-WA0190', 'IMG-20240725-WA0190.jpg', 'image/jpeg', 'public', 'public', 98519, '[]', '[]', '[]', '[]', 136, '2024-07-26 14:54:16', '2024-07-26 14:54:16'),
(158, 'App\\Models\\DriverDocument', 237, '628deb14-1af5-4b9a-a4a2-a7cfcd8a0e88', 'driver_document', 'IMG-20240725-WA0191', 'IMG-20240725-WA0191.jpg', 'image/jpeg', 'public', 'public', 104534, '[]', '[]', '[]', '[]', 137, '2024-07-26 14:54:33', '2024-07-26 14:54:33'),
(159, 'App\\Models\\DriverDocument', 238, '38578b1a-2f31-4db7-bd4d-c6d9ba1cb2a8', 'driver_document', 'IMG-20240725-WA0192', 'IMG-20240725-WA0192.jpg', 'image/jpeg', 'public', 'public', 77517, '[]', '[]', '[]', '[]', 138, '2024-07-26 14:54:41', '2024-07-26 14:54:41'),
(160, 'App\\Models\\DriverDocument', 240, '83f6068e-a7e6-40bd-ab77-b5d6a441c856', 'driver_document', 'IMG-20240725-WA0174', 'IMG-20240725-WA0174.jpg', 'image/jpeg', 'public', 'public', 60814, '[]', '[]', '[]', '[]', 139, '2024-07-26 15:11:27', '2024-07-26 15:11:27'),
(161, 'App\\Models\\DriverDocument', 241, '47993e1a-f7c9-4c17-ab46-93a883a00d2d', 'driver_document', 'IMG-20240725-WA0171', 'IMG-20240725-WA0171.jpg', 'image/jpeg', 'public', 'public', 59894, '[]', '[]', '[]', '[]', 140, '2024-07-26 15:11:53', '2024-07-26 15:11:53'),
(162, 'App\\Models\\DriverDocument', 242, '1a1d6e3f-cc0a-4050-9026-4263c5485e83', 'driver_document', 'IMG-20240725-WA0172', 'IMG-20240725-WA0172.jpg', 'image/jpeg', 'public', 'public', 65038, '[]', '[]', '[]', '[]', 141, '2024-07-26 15:12:10', '2024-07-26 15:12:10'),
(163, 'App\\Models\\DriverDocument', 243, '20324d6e-816b-4f10-9032-64ab71d42f3e', 'driver_document', 'IMG-20240725-WA0170', 'IMG-20240725-WA0170.jpg', 'image/jpeg', 'public', 'public', 69683, '[]', '[]', '[]', '[]', 142, '2024-07-26 15:12:23', '2024-07-26 15:12:23'),
(164, 'App\\Models\\DriverDocument', 244, '914532df-a38c-4ff9-9a68-90bd236740a0', 'driver_document', 'IMG-20240725-WA0170', 'IMG-20240725-WA0170.jpg', 'image/jpeg', 'public', 'public', 69683, '[]', '[]', '[]', '[]', 143, '2024-07-26 15:13:08', '2024-07-26 15:13:08'),
(165, 'App\\Models\\DriverDocument', 245, '5e64088f-b7ac-4367-90ce-4acc868f170d', 'driver_document', 'IMG-20240726-WA0039', 'IMG-20240726-WA0039.jpg', 'image/jpeg', 'public', 'public', 101400, '[]', '[]', '[]', '[]', 144, '2024-07-26 20:13:41', '2024-07-26 20:13:41'),
(166, 'App\\Models\\DriverDocument', 246, 'b7bd3b0e-14ef-45f8-9a90-00a6d52352ec', 'driver_document', 'IMG-20240726-WA0037', 'IMG-20240726-WA0037.jpg', 'image/jpeg', 'public', 'public', 96763, '[]', '[]', '[]', '[]', 145, '2024-07-26 20:13:51', '2024-07-26 20:13:51'),
(167, 'App\\Models\\DriverDocument', 247, '08cbe060-7354-4034-8491-bb705f2253a7', 'driver_document', 'IMG-20240726-WA0038', 'IMG-20240726-WA0038.jpg', 'image/jpeg', 'public', 'public', 83089, '[]', '[]', '[]', '[]', 146, '2024-07-26 20:13:59', '2024-07-26 20:13:59'),
(168, 'App\\Models\\DriverDocument', 248, 'ee1b9625-737d-458a-b12c-7505b717365a', 'driver_document', 'IMG-20240726-WA0037', 'IMG-20240726-WA0037.jpg', 'image/jpeg', 'public', 'public', 96763, '[]', '[]', '[]', '[]', 147, '2024-07-26 20:14:07', '2024-07-26 20:14:07'),
(169, 'App\\Models\\DriverDocument', 249, '19f1c939-8019-44f0-bb67-92f627514352', 'driver_document', 'IMG-20240726-WA0040', 'IMG-20240726-WA0040.jpg', 'image/jpeg', 'public', 'public', 92554, '[]', '[]', '[]', '[]', 148, '2024-07-26 20:14:12', '2024-07-26 20:14:12'),
(170, 'App\\Models\\DriverDocument', 252, 'e0eb8f7c-ab79-47cf-badf-be63d2183f55', 'driver_document', 'IMG-20240726-WA0057', 'IMG-20240726-WA0057.jpg', 'image/jpeg', 'public', 'public', 90172, '[]', '[]', '[]', '[]', 149, '2024-07-27 16:38:56', '2024-07-27 16:38:56'),
(171, 'App\\Models\\DriverDocument', 253, '9c7e6827-443a-4e2f-bb0f-8b21778692f8', 'driver_document', 'IMG-20240726-WA0053', 'IMG-20240726-WA0053.jpg', 'image/jpeg', 'public', 'public', 127501, '[]', '[]', '[]', '[]', 150, '2024-07-27 16:39:21', '2024-07-27 16:39:21'),
(172, 'App\\Models\\DriverDocument', 254, 'a8eab256-6b43-47f7-b2d0-eb991a85d7c7', 'driver_document', 'IMG-20240726-WA0054', 'IMG-20240726-WA0054.jpg', 'image/jpeg', 'public', 'public', 125223, '[]', '[]', '[]', '[]', 151, '2024-07-27 16:39:31', '2024-07-27 16:39:31'),
(173, 'App\\Models\\DriverDocument', 255, 'e32e517d-c144-41f1-b15e-3697e8306774', 'driver_document', 'IMG-20240726-WA0053', 'IMG-20240726-WA0053.jpg', 'image/jpeg', 'public', 'public', 127501, '[]', '[]', '[]', '[]', 152, '2024-07-27 16:39:44', '2024-07-27 16:39:44'),
(174, 'App\\Models\\DriverDocument', 256, 'e42042d0-f31f-4139-bd22-c486ad9fced9', 'driver_document', 'IMG-20240727-WA0008', 'IMG-20240727-WA0008.jpg', 'image/jpeg', 'public', 'public', 99989, '[]', '[]', '[]', '[]', 153, '2024-07-27 16:40:01', '2024-07-27 16:40:01'),
(175, 'App\\Models\\DriverDocument', 258, 'b6872641-0be0-48d9-ab90-ddb533a2bd52', 'driver_document', 'IMG-20240726-WA0057', 'IMG-20240726-WA0057.jpg', 'image/jpeg', 'public', 'public', 90172, '[]', '[]', '[]', '[]', 154, '2024-07-27 16:44:48', '2024-07-27 16:44:48'),
(176, 'App\\Models\\DriverDocument', 259, '0c97fae2-855f-4de2-be4c-6cf7116a8d35', 'driver_document', 'IMG-20240726-WA0055', 'IMG-20240726-WA0055.jpg', 'image/jpeg', 'public', 'public', 123421, '[]', '[]', '[]', '[]', 155, '2024-07-27 16:45:21', '2024-07-27 16:45:21'),
(177, 'App\\Models\\DriverDocument', 260, 'fd8d1cac-2f81-4115-95b0-a021c76081dc', 'driver_document', 'IMG-20240726-WA0056', 'IMG-20240726-WA0056.jpg', 'image/jpeg', 'public', 'public', 103649, '[]', '[]', '[]', '[]', 156, '2024-07-27 16:45:33', '2024-07-27 16:45:33'),
(178, 'App\\Models\\DriverDocument', 261, '318c5c0d-5c9c-4fbb-bdca-1683fcd5222a', 'driver_document', 'IMG-20240726-WA0055', 'IMG-20240726-WA0055.jpg', 'image/jpeg', 'public', 'public', 123421, '[]', '[]', '[]', '[]', 157, '2024-07-27 16:45:44', '2024-07-27 16:45:44'),
(179, 'App\\Models\\DriverDocument', 262, 'b04935ee-8683-4d6b-a103-1679021f3b9d', 'driver_document', 'IMG-20240726-WA0059', 'IMG-20240726-WA0059.jpg', 'image/jpeg', 'public', 'public', 62770, '[]', '[]', '[]', '[]', 158, '2024-07-27 16:45:56', '2024-07-27 16:45:56'),
(180, 'App\\Models\\DriverDocument', 263, '5b823fca-58b2-466b-81bb-7f1502f5ed5f', 'driver_document', '8854f53b-8161-499b-a476-22b703f1124374381505975239078', '8854f53b-8161-499b-a476-22b703f1124374381505975239078.jpg', 'image/jpeg', 'public', 'public', 1683891, '[]', '[]', '[]', '[]', 159, '2024-07-27 17:13:32', '2024-07-27 17:13:32'),
(181, 'App\\Models\\DriverDocument', 264, '31fea813-1cec-4e29-a624-14bbc803b900', 'driver_document', '1000274075', '1000274075.jpg', 'image/jpeg', 'public', 'public', 174314, '[]', '[]', '[]', '[]', 160, '2024-07-27 17:13:42', '2024-07-27 17:13:42'),
(182, 'App\\Models\\DriverDocument', 265, '2578c70d-b2c2-4d84-b9f1-a63d24229df7', 'driver_document', '1000274107', '1000274107.jpg', 'image/jpeg', 'public', 'public', 142420, '[]', '[]', '[]', '[]', 161, '2024-07-27 17:13:58', '2024-07-27 17:13:58'),
(183, 'App\\Models\\DriverDocument', 266, 'cba64a8b-a7cc-4e36-b291-df55ae840d9a', 'driver_document', '1000274038', '1000274038.jpg', 'image/jpeg', 'public', 'public', 81725, '[]', '[]', '[]', '[]', 162, '2024-07-27 17:14:10', '2024-07-27 17:14:10'),
(184, 'App\\Models\\DriverDocument', 267, '3d700103-778d-49c0-8cd6-7b50aa601549', 'driver_document', '1000274040', '1000274040.jpg', 'image/jpeg', 'public', 'public', 114819, '[]', '[]', '[]', '[]', 163, '2024-07-27 17:14:19', '2024-07-27 17:14:19'),
(185, 'App\\Models\\DriverDocument', 268, 'ecaeba6f-70d6-42f0-bd99-9e470987dc0f', 'driver_document', '1000274042', '1000274042.jpg', 'image/jpeg', 'public', 'public', 38525, '[]', '[]', '[]', '[]', 164, '2024-07-27 17:14:36', '2024-07-27 17:14:36'),
(196, 'App\\Models\\DriverDocument', 285, 'aac86105-7f36-4d9d-afd2-18cf8ab62ee4', 'driver_document', '1000276774', '1000276774.jpg', 'image/jpeg', 'public', 'public', 1711519, '[]', '[]', '[]', '[]', 165, '2024-07-29 16:28:45', '2024-07-29 16:28:45'),
(198, 'App\\Models\\DriverDocument', 287, 'a4606171-113b-4386-ba6a-5bbb687f9eac', 'driver_document', '1000276747', '1000276747.jpg', 'image/jpeg', 'public', 'public', 132085, '[]', '[]', '[]', '[]', 167, '2024-07-29 16:28:52', '2024-07-29 16:28:52'),
(199, 'App\\Models\\DriverDocument', 288, '381fedf3-daa1-4cc7-a49b-9171ad883bd9', 'driver_document', '1000276750', '1000276750.jpg', 'image/jpeg', 'public', 'public', 127983, '[]', '[]', '[]', '[]', 168, '2024-07-29 16:32:55', '2024-07-29 16:32:55'),
(200, 'App\\Models\\DriverDocument', 289, '5f914dbd-965d-4844-b1aa-e4cb056750d5', 'driver_document', '1000276753', '1000276753.jpg', 'image/jpeg', 'public', 'public', 108296, '[]', '[]', '[]', '[]', 169, '2024-07-29 16:32:55', '2024-07-29 16:32:55'),
(201, 'App\\Models\\DriverDocument', 290, '0dd6b01a-71d3-4250-aff7-605cf05bdaa1', 'driver_document', '1000276730', '1000276730.jpg', 'image/jpeg', 'public', 'public', 63960, '[]', '[]', '[]', '[]', 170, '2024-07-29 16:33:11', '2024-07-29 16:33:11'),
(202, 'App\\Models\\DriverDocument', 291, 'fb518b17-91e7-42dc-a31f-516510a33f9c', 'driver_document', '1000276733', '1000276733.jpg', 'image/jpeg', 'public', 'public', 174457, '[]', '[]', '[]', '[]', 171, '2024-07-29 16:48:18', '2024-07-29 16:48:18'),
(203, 'App\\Models\\DriverDocument', 293, '86708f0e-b9be-4348-8ba9-f04d5b4aef00', 'driver_document', 'IMG-20240729-WA0006', 'IMG-20240729-WA0006.jpg', 'image/jpeg', 'public', 'public', 85850, '[]', '[]', '[]', '[]', 172, '2024-07-29 17:36:22', '2024-07-29 17:36:22'),
(204, 'App\\Models\\DriverDocument', 294, 'd4d6c5a1-8911-45ec-8a30-f0d9c4f33fb8', 'driver_document', 'IMG-20240726-WA0020', 'IMG-20240726-WA0020.jpg', 'image/jpeg', 'public', 'public', 82898, '[]', '[]', '[]', '[]', 173, '2024-07-29 17:38:09', '2024-07-29 17:38:09'),
(205, 'App\\Models\\DriverDocument', 295, 'f62ca572-b8ee-41bd-af3c-16691f8dbc57', 'driver_document', 'IMG-20240726-WA0021', 'IMG-20240726-WA0021.jpg', 'image/jpeg', 'public', 'public', 82595, '[]', '[]', '[]', '[]', 174, '2024-07-29 17:38:25', '2024-07-29 17:38:25'),
(206, 'App\\Models\\DriverDocument', 296, '1b51e861-05a7-4f20-ae56-2dbb967e4147', 'driver_document', 'IMG-20240726-WA0020', 'IMG-20240726-WA0020.jpg', 'image/jpeg', 'public', 'public', 82898, '[]', '[]', '[]', '[]', 175, '2024-07-29 17:38:38', '2024-07-29 17:38:38'),
(207, 'App\\Models\\DriverDocument', 297, '4e2cdf02-366c-484d-9f1e-339e254e036a', 'driver_document', 'IMG-20240726-WA0028', 'IMG-20240726-WA0028.jpg', 'image/jpeg', 'public', 'public', 174484, '[]', '[]', '[]', '[]', 176, '2024-07-29 17:39:08', '2024-07-29 17:39:08'),
(208, 'App\\Models\\DriverDocument', 299, '3e56eb37-28fb-44d6-9a51-e7102e93c9ba', 'driver_document', 'IMG-20240731-WA0009', 'IMG-20240731-WA0009.jpg', 'image/jpeg', 'public', 'public', 65407, '[]', '[]', '[]', '[]', 177, '2024-07-31 15:26:25', '2024-07-31 15:26:25'),
(209, 'App\\Models\\DriverDocument', 300, 'bd0a3b84-31ac-473b-87a9-db670b2761d4', 'driver_document', 'IMG-20240731-WA0006', 'IMG-20240731-WA0006.jpg', 'image/jpeg', 'public', 'public', 25799, '[]', '[]', '[]', '[]', 178, '2024-07-31 15:26:36', '2024-07-31 15:26:36'),
(210, 'App\\Models\\DriverDocument', 301, '16f5f014-61d4-4e7f-b4fd-54739ddf57a7', 'driver_document', 'IMG-20240731-WA0008', 'IMG-20240731-WA0008.jpg', 'image/jpeg', 'public', 'public', 37998, '[]', '[]', '[]', '[]', 179, '2024-07-31 15:26:45', '2024-07-31 15:26:45'),
(211, 'App\\Models\\DriverDocument', 302, 'aef7ef0c-1869-4a6c-92dc-3cc9a701de9a', 'driver_document', 'IMG-20240731-WA0011', 'IMG-20240731-WA0011.jpg', 'image/jpeg', 'public', 'public', 52139, '[]', '[]', '[]', '[]', 180, '2024-07-31 15:26:54', '2024-07-31 15:26:54'),
(212, 'App\\Models\\DriverDocument', 303, 'cc0dce06-06b1-46ae-990d-8179808ab968', 'driver_document', 'IMG-20240731-WA0005', 'IMG-20240731-WA0005.jpg', 'image/jpeg', 'public', 'public', 75750, '[]', '[]', '[]', '[]', 181, '2024-07-31 15:27:06', '2024-07-31 15:27:06'),
(213, 'App\\Models\\DriverDocument', 304, '94afd606-6ff5-4fe0-b1c1-b89d16ac62c7', 'driver_document', '932e8be9-3fe4-4e63-985c-7e25612e7a352077514992730106557', '932e8be9-3fe4-4e63-985c-7e25612e7a352077514992730106557.jpg', 'image/jpeg', 'public', 'public', 1761900, '[]', '[]', '[]', '[]', 182, '2024-07-31 17:36:10', '2024-07-31 17:36:10'),
(214, 'App\\Models\\DriverDocument', 305, '942a033c-ef51-443d-baae-89760935ce70', 'driver_document', '1000280164', '1000280164.jpg', 'image/jpeg', 'public', 'public', 61777, '[]', '[]', '[]', '[]', 183, '2024-07-31 17:36:26', '2024-07-31 17:36:26'),
(215, 'App\\Models\\DriverDocument', 306, '8cbcde25-0041-4684-99f7-bc75411c8d95', 'driver_document', '1000280147', '1000280147.jpg', 'image/jpeg', 'public', 'public', 116311, '[]', '[]', '[]', '[]', 184, '2024-07-31 17:36:39', '2024-07-31 17:36:39'),
(216, 'App\\Models\\DriverDocument', 307, 'd3bcb3fb-0bd9-49c8-b541-515f242c12aa', 'driver_document', '1000280130', '1000280130.jpg', 'image/jpeg', 'public', 'public', 197333, '[]', '[]', '[]', '[]', 185, '2024-07-31 17:36:52', '2024-07-31 17:36:52'),
(217, 'App\\Models\\DriverDocument', 308, '95b57429-347c-49f2-982e-7f03139ad171', 'driver_document', '1000280124', '1000280124.jpg', 'image/jpeg', 'public', 'public', 156982, '[]', '[]', '[]', '[]', 186, '2024-07-31 17:37:09', '2024-07-31 17:37:09'),
(218, 'App\\Models\\DriverDocument', 309, 'af0e3c00-45b0-415e-8ef3-25fb5de0d6e1', 'driver_document', '1000280178', '1000280178.jpg', 'image/jpeg', 'public', 'public', 96791, '[]', '[]', '[]', '[]', 187, '2024-07-31 17:37:59', '2024-07-31 17:37:59'),
(219, 'App\\Models\\DriverDocument', 310, '2f4d2ed6-1086-4a44-a577-aee75090a276', 'driver_document', '1000282919', '1000282919.jpg', 'image/jpeg', 'public', 'public', 117193, '[]', '[]', '[]', '[]', 188, '2024-08-01 22:20:41', '2024-08-01 22:20:41'),
(220, 'App\\Models\\DriverDocument', 311, '7ce828e3-408a-41d9-a0ce-bdc3d9514eb7', 'driver_document', '1000282926', '1000282926.jpg', 'image/jpeg', 'public', 'public', 47366, '[]', '[]', '[]', '[]', 189, '2024-08-01 22:20:52', '2024-08-01 22:20:52'),
(221, 'App\\Models\\DriverDocument', 312, '91087e38-9297-4300-807c-964899b33c26', 'driver_document', '1000267654', '1000267654.jpg', 'image/jpeg', 'public', 'public', 1785266, '[]', '[]', '[]', '[]', 190, '2024-08-01 22:20:59', '2024-08-01 22:20:59'),
(222, 'App\\Models\\DriverDocument', 313, 'bae1d018-07f4-48bc-85dc-aedb6b75ed66', 'driver_document', '1000282921', '1000282921.jpg', 'image/jpeg', 'public', 'public', 219460, '[]', '[]', '[]', '[]', 191, '2024-08-01 22:21:17', '2024-08-01 22:21:17'),
(223, 'App\\Models\\DriverDocument', 314, '10b8b810-d9dd-4d6e-b5b5-b943ccf6a410', 'driver_document', '1000282922', '1000282922.jpg', 'image/jpeg', 'public', 'public', 212413, '[]', '[]', '[]', '[]', 192, '2024-08-01 22:21:27', '2024-08-01 22:21:27'),
(224, 'App\\Models\\DriverDocument', 315, 'a77f8288-74db-48e7-ab07-04962583e9df', 'driver_document', '1000282925', '1000282925.jpg', 'image/jpeg', 'public', 'public', 82692, '[]', '[]', '[]', '[]', 193, '2024-08-01 22:21:43', '2024-08-01 22:21:43'),
(225, 'App\\Models\\DriverDocument', 316, 'ddadffb0-a1e3-47b8-804d-a12d7f4dea0c', 'driver_document', '3b95c320-4f68-4eed-8d7d-51124509a4485201543042542942850', '3b95c320-4f68-4eed-8d7d-51124509a4485201543042542942850.jpg', 'image/jpeg', 'public', 'public', 1798223, '[]', '[]', '[]', '[]', 194, '2024-08-02 13:55:00', '2024-08-02 13:55:00'),
(226, 'App\\Models\\DriverDocument', 317, 'afd78b97-7af2-4078-8476-64721d831703', 'driver_document', '1000284934', '1000284934.png', 'image/png', 'public', 'public', 1281459, '[]', '[]', '[]', '[]', 195, '2024-08-02 14:03:07', '2024-08-02 14:03:07'),
(227, 'App\\Models\\DriverDocument', 318, '8f0de343-1b4e-43d2-a4a7-b12905991ff6', 'driver_document', '1000284906', '1000284906.jpg', 'image/jpeg', 'public', 'public', 85301, '[]', '[]', '[]', '[]', 196, '2024-08-02 14:03:18', '2024-08-02 14:03:18'),
(228, 'App\\Models\\DriverDocument', 319, '0b228e34-adc9-48d2-9b5f-9f6aeb68cef7', 'driver_document', '1000284902', '1000284902.jpg', 'image/jpeg', 'public', 'public', 123936, '[]', '[]', '[]', '[]', 197, '2024-08-02 14:03:27', '2024-08-02 14:03:27'),
(229, 'App\\Models\\DriverDocument', 320, '44bf87e3-8542-475a-bf57-7aa5d24f66f1', 'driver_document', '1000284894', '1000284894.jpg', 'image/jpeg', 'public', 'public', 116203, '[]', '[]', '[]', '[]', 198, '2024-08-02 14:03:37', '2024-08-02 14:03:37'),
(230, 'App\\Models\\DriverDocument', 321, 'eaeff387-3249-47e8-a7c4-6a9e0bcc6d90', 'driver_document', '1000284931', '1000284931.jpg', 'image/jpeg', 'public', 'public', 5785, '[]', '[]', '[]', '[]', 199, '2024-08-02 14:03:50', '2024-08-02 14:03:50');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_04_28_130817_create_user_details_table', 1),
(6, '2022_04_29_063151_create_regions_table', 1),
(7, '2022_04_29_063230_create_services_table', 1),
(8, '2022_04_29_064239_create_ride_requests_table', 1),
(9, '2022_04_29_064325_create_driver_services_table', 1),
(10, '2022_04_29_064758_create_complaints_table', 1),
(11, '2022_04_29_064809_create_reviews_table', 1),
(12, '2022_05_02_061025_create_ride_request_histories_table', 1),
(13, '2022_05_02_102753_create_payment_gateways_table', 1),
(14, '2022_05_02_102825_create_payments_table', 1),
(15, '2022_05_02_120722_create_permission_tables', 1),
(16, '2022_05_04_100102_create_media_table', 1),
(17, '2022_05_18_095512_create_coupons_table', 1),
(18, '2022_05_18_095624_create_wallets_table', 1),
(19, '2022_05_18_096432_create_wallet_histories_table', 1),
(20, '2022_05_23_084042_create_notifications_table', 1),
(21, '2022_05_23_094130_create_settings_table', 1),
(22, '2022_05_23_104508_create_app_settings_table', 1),
(23, '2022_06_09_074731_create_additional_fees_table', 1),
(24, '2022_06_13_125956_create_documents_table', 1),
(25, '2022_06_13_130010_create_driver_documents_table', 1),
(26, '2022_08_05_071122_create_sos_table', 1),
(27, '2022_08_05_113139_create_ride_request_ratings_table', 1),
(28, '2022_08_08_052703_create_withdraw_requests_table', 1),
(29, '2022_08_08_090613_create_user_bank_accounts_table', 1),
(30, '2022_12_10_091040_alter_services_table', 1),
(31, '2022_12_12_082101_alter_users_table', 1),
(32, '2022_12_20_100326_create_complaint_comments_table', 1),
(33, '2023_01_13_071123_add_last_location_update_at_in_users_table', 1),
(34, '2023_01_13_071835_alter_ride_requests_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(2, 'App\\Models\\User', 3),
(2, 'App\\Models\\User', 11),
(2, 'App\\Models\\User', 12),
(2, 'App\\Models\\User', 13),
(3, 'App\\Models\\User', 21),
(2, 'App\\Models\\User', 23),
(3, 'App\\Models\\User', 29),
(3, 'App\\Models\\User', 44),
(3, 'App\\Models\\User', 45),
(3, 'App\\Models\\User', 49),
(3, 'App\\Models\\User', 53),
(3, 'App\\Models\\User', 55),
(3, 'App\\Models\\User', 56),
(3, 'App\\Models\\User', 57),
(3, 'App\\Models\\User', 58),
(3, 'App\\Models\\User', 59),
(3, 'App\\Models\\User', 60),
(3, 'App\\Models\\User', 61),
(3, 'App\\Models\\User', 62),
(3, 'App\\Models\\User', 63),
(3, 'App\\Models\\User', 64),
(3, 'App\\Models\\User', 65),
(3, 'App\\Models\\User', 66),
(3, 'App\\Models\\User', 67),
(3, 'App\\Models\\User', 68),
(3, 'App\\Models\\User', 69),
(3, 'App\\Models\\User', 70),
(3, 'App\\Models\\User', 71),
(3, 'App\\Models\\User', 72),
(3, 'App\\Models\\User', 73),
(3, 'App\\Models\\User', 74),
(3, 'App\\Models\\User', 75),
(3, 'App\\Models\\User', 76),
(3, 'App\\Models\\User', 77),
(3, 'App\\Models\\User', 78),
(3, 'App\\Models\\User', 79),
(3, 'App\\Models\\User', 80),
(3, 'App\\Models\\User', 81),
(3, 'App\\Models\\User', 82),
(3, 'App\\Models\\User', 83),
(3, 'App\\Models\\User', 84),
(3, 'App\\Models\\User', 85),
(3, 'App\\Models\\User', 86),
(3, 'App\\Models\\User', 87),
(2, 'App\\Models\\User', 88),
(3, 'App\\Models\\User', 89),
(2, 'App\\Models\\User', 90),
(2, 'App\\Models\\User', 91),
(3, 'App\\Models\\User', 92),
(3, 'App\\Models\\User', 93),
(3, 'App\\Models\\User', 94),
(2, 'App\\Models\\User', 95),
(3, 'App\\Models\\User', 96),
(3, 'App\\Models\\User', 97);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('01be270a-9a88-4e50-a784-74bb3229e7d8', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":88,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-28 23:16:17', '2024-07-28 00:50:15', '2024-07-28 23:16:17'),
('02cd86a1-3761-4fe5-9b0a-14005c7b51ad', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":45,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-27 20:17:27', '2024-07-17 15:27:58', '2024-07-27 20:17:27'),
('03b59130-0519-494f-b016-1fcfd1918f8a', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":84,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-28 23:16:17', '2024-07-28 00:30:11', '2024-07-28 23:16:17'),
('03cf0dbd-b84e-4c7f-a713-36a073a5eafa', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 29, '{\"id\":131,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', NULL, '2024-07-30 12:31:28', '2024-07-30 12:31:28'),
('0600e5a2-b73c-45a9-8195-0ac1652dab09', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":114,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-30 01:42:36', '2024-07-29 20:31:05', '2024-07-30 01:42:36'),
('06f3c87c-9bd9-487d-b186-3e50d9f30a26', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":42,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-27 20:17:27', '2024-07-15 04:51:26', '2024-07-27 20:17:27'),
('08713ffa-3346-47a7-b158-cd9ee2918825', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":8,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-27 20:17:27', '2024-07-11 22:13:16', '2024-07-27 20:17:27'),
('0c123b1e-e356-41c5-8fc2-880c34d2298b', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":67,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-27 22:11:07', '2024-07-27 20:59:06', '2024-07-27 22:11:07'),
('0c2e773b-bc9e-49ec-a131-5fba53dfb4fb', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":66,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-27 22:11:07', '2024-07-27 20:42:28', '2024-07-27 22:11:07'),
('0c6406f8-7818-4b1b-8043-d5e863187dec', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 29, '{\"id\":130,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The ride is canceled.\"}', NULL, '2024-07-30 12:16:18', '2024-07-30 12:16:18'),
('0e208838-f6a4-403e-bf5f-bb2e149b74ca', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":90,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-28 23:16:17', '2024-07-28 00:56:03', '2024-07-28 23:16:17'),
('0e4bc0ea-3460-477a-8738-3afba35304f5', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":5,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-27 20:17:27', '2024-07-11 00:08:47', '2024-07-27 20:17:27'),
('0e9f68e4-76de-4601-a504-c725c72ed08d', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":134,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-31 15:49:17', '2024-07-30 21:21:09', '2024-07-31 15:49:17'),
('104346e0-3153-46e6-8881-35ef50fc3f44', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":134,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-31 15:49:17', '2024-07-30 21:21:09', '2024-07-31 15:49:17'),
('18417e71-29a8-4161-a23b-643dccf2d444', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":123,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-30 01:42:36', '2024-07-29 22:41:35', '2024-07-30 01:42:36'),
('1945729d-23c2-4aab-aacf-10b1ed7af99e', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":86,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-28 23:16:17', '2024-07-28 00:48:08', '2024-07-28 23:16:17'),
('1cbe8c89-f5b2-4fe7-8cae-f565d7bbd357', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":97,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-28 23:16:17', '2024-07-28 05:59:06', '2024-07-28 23:16:17'),
('1dc0b1db-07f2-4a5f-9c4e-e422c459d722', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":98,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-28 23:16:17', '2024-07-28 06:05:37', '2024-07-28 23:16:17'),
('1f772584-e3a9-4830-8ea7-b7d3ff60c77c', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":100,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The ride is canceled.\"}', '2024-07-28 23:16:17', '2024-07-28 06:48:00', '2024-07-28 23:16:17'),
('25ecad44-111c-45dc-8c02-d6e76fd48efe', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":68,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-27 22:11:07', '2024-07-27 21:03:45', '2024-07-27 22:11:07'),
('2b470213-81f9-412a-a5af-287214f036f2', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":86,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-28 23:16:17', '2024-07-28 00:48:14', '2024-07-28 23:16:17'),
('3af81ade-e2b4-440b-8a78-4ad722e4121d', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":130,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The ride is canceled.\"}', '2024-07-31 15:49:17', '2024-07-30 12:16:18', '2024-07-31 15:49:17'),
('3b2a02cc-2876-472c-8573-a66de28a53ea', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":134,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-31 15:49:17', '2024-07-30 21:21:09', '2024-07-31 15:49:17'),
('3eb36b46-b793-4c6d-ad8c-c31e235bb069', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":67,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-27 22:11:07', '2024-07-27 20:59:07', '2024-07-27 22:11:07'),
('4120b884-05d0-4c3c-a301-cfaeb6135525', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 29, '{\"id\":124,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', NULL, '2024-07-29 23:05:45', '2024-07-29 23:05:45'),
('4d959f62-ce5b-4210-8ec1-878b5875f598', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":61,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-27 20:11:53', '2024-07-25 21:08:55', '2024-07-27 20:11:53'),
('50d2baa4-83cd-4dc4-89c6-366c28e53954', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":5,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-27 20:17:27', '2024-07-11 00:08:45', '2024-07-27 20:17:27'),
('51371d0b-5a65-4613-9725-0f41ad005aaf', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":5,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-27 20:17:27', '2024-07-11 00:08:44', '2024-07-27 20:17:27'),
('519f6655-7e5d-4f49-b8db-d2d047a5c77e', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":148,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The ride is canceled.\"}', '2024-07-31 15:49:17', '2024-07-31 01:20:00', '2024-07-31 15:49:17'),
('531289ec-d8bc-4deb-8c31-1f420fb3f577', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":99,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-28 23:16:17', '2024-07-28 06:25:19', '2024-07-28 23:16:17'),
('5439b3d2-f1bb-4746-8a4e-59e30ffacb5d', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":113,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-30 01:42:36', '2024-07-29 20:26:16', '2024-07-30 01:42:36'),
('556ac648-6574-4276-9988-ba0182c8857c', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":70,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-27 22:11:07', '2024-07-27 21:23:01', '2024-07-27 22:11:07'),
('57ff7fe9-4ee3-4595-aa89-1c01888ecef6', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":128,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-30 01:42:25', '2024-07-30 01:32:38', '2024-07-30 01:42:25'),
('591fe10c-0c91-44e1-a199-6f37138f8abd', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":131,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-30 14:34:34', '2024-07-30 12:31:28', '2024-07-30 14:34:34'),
('5d7ec91b-785b-497f-b7a9-bfb580edbaf0', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":84,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-28 23:16:18', '2024-07-28 00:30:08', '2024-07-28 23:16:18'),
('5e8f4313-8bf2-4530-b589-4161df902545', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 29, '{\"id\":149,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The ride is canceled.\"}', NULL, '2024-07-31 22:04:20', '2024-07-31 22:04:20'),
('6318e912-984c-4aac-9dfc-89c422293ffa', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":72,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-27 22:11:07', '2024-07-27 21:42:55', '2024-07-27 22:11:07'),
('64f4c657-f89f-4874-af37-426cd935c8c0', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":6,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-27 20:17:27', '2024-07-11 00:11:31', '2024-07-27 20:17:27'),
('69f76e2e-173c-4a07-be6d-6599468157c8', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":7,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-11 12:10:27', '2024-07-11 00:14:25', '2024-07-11 12:10:27'),
('6c64f1c4-7531-4d00-9384-877dc0a58b7b', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":9,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The ride is canceled.\"}', '2024-07-27 20:17:27', '2024-07-11 22:22:34', '2024-07-27 20:17:27'),
('6f132e73-0fa4-48d2-9754-05c1bf80b2af', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 29, '{\"id\":123,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', NULL, '2024-07-29 22:41:35', '2024-07-29 22:41:35'),
('7172dc27-3c9f-468f-94b7-b9fa56405db8', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 29, '{\"id\":148,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The ride is canceled.\"}', NULL, '2024-07-31 01:20:00', '2024-07-31 01:20:00'),
('72aed9bb-bfcb-4acb-aa95-f4e55686965a', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":44,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-27 20:17:27', '2024-07-17 15:07:51', '2024-07-27 20:17:27'),
('730d356e-a578-4474-a74c-6ffe8604f271', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 29, '{\"id\":149,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', NULL, '2024-07-31 22:04:16', '2024-07-31 22:04:16'),
('75f9c3f7-fae4-41b9-8fb7-177f01aaeeaa', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":4,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-27 20:17:27', '2024-07-11 00:06:41', '2024-07-27 20:17:27'),
('77eb499e-653f-4152-9ded-d98ce198d433', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":43,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-27 20:17:27', '2024-07-15 23:01:14', '2024-07-27 20:17:27'),
('7844435d-209f-43fb-9557-f8123056c19f', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 29, '{\"id\":130,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', NULL, '2024-07-30 12:26:30', '2024-07-30 12:26:30'),
('7d6fa614-b7a8-4990-a87f-0e6c25e4e858', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":70,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-27 22:11:07', '2024-07-27 21:23:06', '2024-07-27 22:11:07'),
('7e216441-59cd-4b9d-b8b6-dc6461727f3f', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":5,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-27 20:17:27', '2024-07-11 00:08:47', '2024-07-27 20:17:27'),
('83853fc7-c20b-4b22-a3ae-7e339bcef6f7', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":134,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-31 15:49:17', '2024-07-30 21:21:10', '2024-07-31 15:49:17'),
('8a2ecc5e-340b-4a1b-9d7e-5600392cba23', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":66,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-27 22:11:07', '2024-07-27 20:42:31', '2024-07-27 22:11:07'),
('8a82fdfa-b119-405e-abba-fac82a542d1e', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":40,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-27 20:17:27', '2024-07-15 02:21:24', '2024-07-27 20:17:27'),
('8e254783-b56b-46e0-8f10-9f22a426769f', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":61,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-27 20:11:53', '2024-07-25 21:08:54', '2024-07-27 20:11:53'),
('8e39ea9a-e8af-448b-b34d-77b8f55fe52f', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":124,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-30 01:21:44', '2024-07-29 23:05:45', '2024-07-30 01:21:44'),
('8e4dea4d-fb93-4142-bc28-5f49e3624cb1', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":113,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-30 01:42:36', '2024-07-29 20:26:18', '2024-07-30 01:42:36'),
('93a2a91d-d7c8-4ebd-98ec-61bc4fa2ac47', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":41,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-27 20:17:27', '2024-07-15 22:34:32', '2024-07-27 20:17:27'),
('93ef076b-d7f6-4ce6-832b-48e87508f913', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":71,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-27 22:11:07', '2024-07-27 21:32:16', '2024-07-27 22:11:07'),
('96b06db5-afb8-4929-9b16-9723b33ddee3', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":40,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-27 20:17:27', '2024-07-15 02:21:12', '2024-07-27 20:17:27'),
('99e80cda-ee7d-4bf3-8aff-6b90be6873f8', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":89,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-28 23:16:17', '2024-07-28 00:55:18', '2024-07-28 23:16:17'),
('9a095f0c-31cf-40d1-a1c2-ad30af0bdf61', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":89,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-28 23:16:17', '2024-07-28 00:55:21', '2024-07-28 23:16:17'),
('9ba6badc-cebd-407d-86b8-c047289a657d', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":5,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-27 20:17:27', '2024-07-11 00:08:47', '2024-07-27 20:17:27'),
('9ca95230-fb95-4f66-8fa5-f944d7a48fba', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":58,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The ride is canceled.\"}', '2024-07-27 20:17:27', '2024-07-22 19:59:23', '2024-07-27 20:17:27'),
('9e403711-e93e-4bdb-8e2f-a87c54a85f0d', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":5,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-27 20:17:27', '2024-07-11 00:08:46', '2024-07-27 20:17:27'),
('a012b5c2-61b4-412f-8576-6c3c4106c286', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":5,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-27 20:17:27', '2024-07-11 00:08:47', '2024-07-27 20:17:27'),
('a1c9d4e1-662a-4b4a-943c-f5470c1f635f', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":149,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', NULL, '2024-07-31 22:04:16', '2024-07-31 22:04:16'),
('a1eee204-f06d-4c60-9e9a-ea2e920a37b8', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":85,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-28 23:16:17', '2024-07-28 00:33:42', '2024-07-28 23:16:17'),
('a7d0dc73-8e3b-4858-a4f4-05640f108671', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":115,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The ride is canceled.\"}', '2024-07-30 01:42:36', '2024-07-29 20:34:21', '2024-07-30 01:42:36'),
('ac86b381-9548-4cc7-be4b-edb6dbe862d7', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":5,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-27 20:17:27', '2024-07-11 00:08:47', '2024-07-27 20:17:27'),
('b2291fb8-e626-4770-b407-a11cb0c61f83', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":7,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-11 12:10:27', '2024-07-11 00:14:24', '2024-07-11 12:10:27'),
('b3947147-bce7-49ae-9703-f71f12cfb374', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":87,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-28 23:16:17', '2024-07-28 00:49:07', '2024-07-28 23:16:17'),
('c724d789-66c3-470d-8958-71c69c739319', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":5,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-27 20:17:27', '2024-07-11 00:08:46', '2024-07-27 20:17:27'),
('c97229a3-9e55-4c12-be2e-14e56857396b', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":72,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-27 22:11:07', '2024-07-27 21:42:50', '2024-07-27 22:11:07'),
('cc51a036-0366-4123-aefd-b5870a785699', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":130,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-31 15:49:17', '2024-07-30 12:26:30', '2024-07-31 15:49:17'),
('e092fc07-9e17-4e4f-8f6a-a6ffa02cd257', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":6,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-27 20:17:27', '2024-07-11 00:11:33', '2024-07-27 20:17:27'),
('e2fedbe4-a5cc-405a-a961-701a64844ade', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":149,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The ride is canceled.\"}', NULL, '2024-07-31 22:04:20', '2024-07-31 22:04:20'),
('e5dac42d-808c-4372-bae2-a64de10e8e0b', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":59,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The ride is canceled.\"}', '2024-07-27 20:17:27', '2024-07-22 20:06:27', '2024-07-27 20:17:27'),
('fd5d82cf-777f-44b2-81a7-fa268ecf3226', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":8,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-27 20:17:27', '2024-07-11 22:13:18', '2024-07-27 20:17:27'),
('fe638fb6-21ea-4e93-ae22-f974bbfe05f6', 'App\\Notifications\\RideNotification', 'App\\Models\\User', 1, '{\"id\":114,\"type\":\"canceled\",\"subject\":\"Canceled\",\"message\":\"The rider canceled the request.\"}', '2024-07-30 01:42:36', '2024-07-29 20:31:06', '2024-07-30 01:42:36');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('mohammad.shaheryar1997@gmail.com', '$2y$10$xju5Iesc/Kubv1D2yGgv.ujHqLKgOX8guRnPxE4uSnitwp/4eBFo6', '2024-07-12 11:07:29');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint UNSIGNED NOT NULL,
  `rider_id` bigint UNSIGNED NOT NULL,
  `ride_request_id` bigint UNSIGNED NOT NULL,
  `datetime` datetime DEFAULT NULL,
  `total_amount` double DEFAULT '0',
  `admin_commission` double DEFAULT '0',
  `received_by` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `driver_fee` double DEFAULT '0',
  `driver_tips` double DEFAULT '0',
  `driver_commission` double DEFAULT '0',
  `fleet_commission` double DEFAULT '0',
  `payment_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'cash',
  `txn_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'pending, paid, failed',
  `transaction_detail` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint DEFAULT '1' COMMENT '0- InActive, 1- Active',
  `is_test` tinyint DEFAULT '1' COMMENT '0-  No, 1- Yes',
  `test_value` json DEFAULT NULL,
  `live_value` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'role', 'web', NULL, '2024-06-23 09:38:43', NULL),
(2, 'role add', 'web', 1, '2024-06-23 09:38:43', NULL),
(3, 'role list', 'web', 1, '2024-06-23 09:38:43', NULL),
(4, 'permission', 'web', NULL, '2024-06-23 09:38:43', NULL),
(5, 'permission add', 'web', 4, '2024-06-23 09:38:43', NULL),
(6, 'permission list', 'web', 4, '2024-06-23 09:38:43', NULL),
(7, 'region', 'web', NULL, '2024-06-23 09:38:43', NULL),
(8, 'region list', 'web', 7, '2024-06-23 09:38:43', NULL),
(9, 'region add', 'web', 7, '2024-06-23 09:38:43', NULL),
(10, 'region edit', 'web', 7, '2024-06-23 09:38:43', NULL),
(11, 'region delete', 'web', 7, '2024-06-23 09:38:43', NULL),
(12, 'service', 'web', NULL, '2024-06-23 09:38:43', NULL),
(13, 'service list', 'web', 12, '2024-06-23 09:38:43', NULL),
(14, 'service add', 'web', 12, '2024-06-23 09:38:43', NULL),
(15, 'service edit', 'web', 12, '2024-06-23 09:38:43', NULL),
(16, 'service delete', 'web', 12, '2024-06-23 09:38:43', NULL),
(17, 'driver', 'web', NULL, '2024-06-23 09:38:43', NULL),
(18, 'driver list', 'web', 17, '2024-06-23 09:38:43', NULL),
(19, 'driver add', 'web', 17, '2024-06-23 09:38:43', NULL),
(20, 'driver edit', 'web', 17, '2024-06-23 09:38:43', NULL),
(21, 'driver delete', 'web', 17, '2024-06-23 09:38:43', NULL),
(22, 'rider', 'web', NULL, '2024-06-23 09:38:43', NULL),
(23, 'rider list', 'web', 22, '2024-06-23 09:38:43', NULL),
(24, 'rider add', 'web', 22, '2024-06-23 09:38:43', NULL),
(25, 'rider edit', 'web', 22, '2024-06-23 09:38:43', NULL),
(26, 'rider delete', 'web', 22, '2024-06-23 09:38:43', NULL),
(27, 'riderequest', 'web', NULL, '2024-06-23 09:38:43', NULL),
(28, 'riderequest list', 'web', 27, '2024-06-23 09:38:43', NULL),
(29, 'riderequest show', 'web', 27, '2024-06-23 09:38:43', NULL),
(30, 'riderequest delete', 'web', 27, '2024-06-23 09:38:43', NULL),
(31, 'pending driver', 'web', 17, '2024-06-23 09:38:43', NULL),
(32, 'document', 'web', NULL, '2024-06-23 09:38:43', NULL),
(33, 'document list', 'web', 32, '2024-06-23 09:38:43', NULL),
(34, 'document add', 'web', 32, '2024-06-23 09:38:43', NULL),
(35, 'document edit', 'web', 32, '2024-06-23 09:38:43', NULL),
(36, 'document delete', 'web', 32, '2024-06-23 09:38:43', NULL),
(37, 'driverdocument', 'web', NULL, '2024-06-23 09:38:43', NULL),
(38, 'driverdocument list', 'web', 37, '2024-06-23 09:38:43', NULL),
(39, 'driverdocument add', 'web', 37, '2024-06-23 09:38:43', NULL),
(40, 'driverdocument edit', 'web', 37, '2024-06-23 09:38:43', NULL),
(41, 'driverdocument delete', 'web', 37, '2024-06-23 09:38:43', NULL),
(42, 'coupon', 'web', NULL, '2024-06-23 09:38:43', NULL),
(43, 'coupon list', 'web', 42, '2024-06-23 09:38:43', NULL),
(44, 'coupon add', 'web', 42, '2024-06-23 09:38:43', NULL),
(45, 'coupon edit', 'web', 42, '2024-06-23 09:38:43', NULL),
(46, 'coupon delete', 'web', 42, '2024-06-23 09:38:43', NULL),
(47, 'additionalfees', 'web', NULL, '2024-06-23 09:38:43', NULL),
(48, 'additionalfees list', 'web', 47, '2024-06-23 09:38:43', NULL),
(49, 'additionalfees add', 'web', 47, '2024-06-23 09:38:43', NULL),
(50, 'additionalfees edit', 'web', 47, '2024-06-23 09:38:43', NULL),
(51, 'additionalfees delete', 'web', 47, '2024-06-23 09:38:43', NULL),
(52, 'sos', 'web', NULL, '2024-06-23 09:38:43', NULL),
(53, 'sos list', 'web', 52, '2024-06-23 09:38:43', NULL),
(54, 'sos add', 'web', 52, '2024-06-23 09:38:43', NULL),
(55, 'sos edit', 'web', 52, '2024-06-23 09:38:43', NULL),
(56, 'sos delete', 'web', 52, '2024-06-23 09:38:43', NULL),
(57, 'complaint', 'web', NULL, '2024-06-23 09:38:43', NULL),
(58, 'complaint list', 'web', 57, '2024-06-23 09:38:43', NULL),
(59, 'complaint add', 'web', 57, '2024-06-23 09:38:43', NULL),
(60, 'complaint edit', 'web', 57, '2024-06-23 09:38:43', NULL),
(61, 'complaint delete', 'web', 57, '2024-06-23 09:38:43', NULL),
(62, 'pages', 'web', NULL, '2024-06-23 09:38:43', NULL),
(63, 'terms condition', 'web', 62, '2024-06-23 09:38:43', NULL),
(64, 'privacy policy', 'web', 62, '2024-06-23 09:38:43', NULL),
(65, 'driver show', 'web', 17, '2024-06-23 09:38:43', NULL),
(66, 'rider show', 'web', 22, '2024-06-23 09:38:43', NULL),
(67, 'complaint show', 'web', 57, '2024-06-23 09:38:43', NULL),
(68, 'driverearning list', 'web', 17, '2024-06-23 09:38:43', NULL),
(69, 'driver location', 'web', 17, '2024-06-23 09:38:43', NULL),
(70, 'dispatch add', 'web', 27, '2024-06-23 09:38:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 3, 'auth_token', '746f64ab11fbffe6a331738e24fa2bc78ca1561703257277ba579cd8685521ee', '[\"*\"]', NULL, '2024-07-08 03:03:39', '2024-07-08 03:03:39'),
(2, 'App\\Models\\User', 3, 'auth_token', 'e179034f507c2d14b605e704c5d2a24ee43256b3fa8e6ae223328355129f1847', '[\"*\"]', '2024-07-11 23:06:20', '2024-07-08 03:04:43', '2024-07-11 23:06:20'),
(3, 'App\\Models\\User', 4, 'auth_token', 'a89a5fc4387115ed34ec5967dce0dfbc401195162ebbedcefbbd3caf04b2a169', '[\"*\"]', NULL, '2024-07-08 03:19:42', '2024-07-08 03:19:42'),
(4, 'App\\Models\\User', 4, 'auth_token', 'ab908e02d9f1b3c6617117c0ca21c57664ecfcef25db7917ddec3b0c176ed0e7', '[\"*\"]', '2024-07-08 03:21:07', '2024-07-08 03:19:59', '2024-07-08 03:21:07'),
(5, 'App\\Models\\User', 5, 'auth_token', '5e71fee61e59626b8fcfa5b497237d428c5c742a0d819027b9f59620a78306bf', '[\"*\"]', '2024-07-10 13:16:39', '2024-07-10 12:47:15', '2024-07-10 13:16:39'),
(6, 'App\\Models\\User', 7, 'auth_token', 'd4773b0a11c0aec437f32780212cc75eec63e984d8540c653420c9fae3705c98', '[\"*\"]', NULL, '2024-07-10 13:17:47', '2024-07-10 13:17:47'),
(7, 'App\\Models\\User', 8, 'auth_token', '74dc84cfcb4fbf5d0eddfda10e10c16e7a13462dbb0408b9fc56d08aadd4944d', '[\"*\"]', NULL, '2024-07-10 13:19:30', '2024-07-10 13:19:30'),
(8, 'App\\Models\\User', 7, 'auth_token', 'bac1666defdf6dbd240b1b8d6c94ce8bb66e1623e37c81ac308f42911298f98a', '[\"*\"]', '2024-07-10 22:44:12', '2024-07-10 13:20:16', '2024-07-10 22:44:12'),
(9, 'App\\Models\\User', 7, 'auth_token', 'c115dd30afcd68cb565299aac0ad50bbdc006a3c10a933d73a89c40741ed847f', '[\"*\"]', '2024-07-11 00:08:44', '2024-07-10 23:02:44', '2024-07-11 00:08:44'),
(10, 'App\\Models\\User', 11, 'auth_token', '62325d5496d7d4807efaff7c564bf7318ae2dd92c7bdcd41eafe19561d697f9d', '[\"*\"]', NULL, '2024-07-10 23:05:09', '2024-07-10 23:05:09'),
(11, 'App\\Models\\User', 11, 'auth_token', '14c10b81e18f18aeb8f748679608687f31b530a45d052bd533e66516ab66a246', '[\"*\"]', '2024-07-11 01:12:50', '2024-07-10 23:05:40', '2024-07-11 01:12:50'),
(12, 'App\\Models\\User', 5, 'auth_token', 'f111bca2b7c1687d3e0b283f7568311d81e793f414924aa892dc5b8323fa98bf', '[\"*\"]', '2024-07-11 01:15:45', '2024-07-11 00:08:58', '2024-07-11 01:15:45'),
(13, 'App\\Models\\User', 5, 'auth_token', 'ed7b76abc795599c8139b79866dedf1f018304e4b81f9d26170212cfb83a8f4a', '[\"*\"]', '2024-07-11 01:18:24', '2024-07-11 01:17:11', '2024-07-11 01:18:24'),
(14, 'App\\Models\\User', 5, 'auth_token', '29908781ac8e26e18cea05cbe93c4cbc9d8fdb5ea14a07ea7cd4e838029fbfff', '[\"*\"]', '2024-07-11 01:39:34', '2024-07-11 01:18:52', '2024-07-11 01:39:34'),
(15, 'App\\Models\\User', 5, 'auth_token', 'cc819a74a5f92d1ca7d0525d17f4934670f673b27e3766ca756067d9188f5516', '[\"*\"]', '2024-07-11 02:07:48', '2024-07-11 02:05:40', '2024-07-11 02:07:48'),
(16, 'App\\Models\\User', 12, 'auth_token', '0d36624865fdb1d1324e2997ab53a4b625062f63a8dc3b0bf251826ec588e4c2', '[\"*\"]', NULL, '2024-07-11 12:39:59', '2024-07-11 12:39:59'),
(17, 'App\\Models\\User', 12, 'auth_token', '4a4170b56dd398f534d5281369392ebf73087c05e0628b1fbab8789ba7a7cb66', '[\"*\"]', '2024-07-11 22:13:41', '2024-07-11 12:40:16', '2024-07-11 22:13:41'),
(18, 'App\\Models\\User', 5, 'auth_token', '4f0b1778ca80d57a443c2428325d517164aa0ba7679c24e97b243a30fe3cb280', '[\"*\"]', '2024-07-11 23:39:18', '2024-07-11 22:08:38', '2024-07-11 23:39:18'),
(19, 'App\\Models\\User', 13, 'auth_token', '0f05bb44a4fc919ae417b11bea31836e79e377c3beac599e45a98895b54187f4', '[\"*\"]', NULL, '2024-07-11 22:16:05', '2024-07-11 22:16:05'),
(20, 'App\\Models\\User', 13, 'auth_token', 'cdf79c619c86b759f2d83e227b14093d74dfbb5efdf6ffd33d22da8b74e207ef', '[\"*\"]', '2024-07-11 22:49:49', '2024-07-11 22:16:30', '2024-07-11 22:49:49'),
(21, 'App\\Models\\User', 14, 'auth_token', '31b04ab01db567991627abcb2248c4465b668ae44e114e318bcf4c6dbe8a3d3c', '[\"*\"]', NULL, '2024-07-11 22:40:37', '2024-07-11 22:40:37'),
(22, 'App\\Models\\User', 14, 'auth_token', 'dc9507b3daa46ac67bc0b8be35555c2fb2dc88979fe6af27d65f02802806fc4e', '[\"*\"]', '2024-07-11 23:45:48', '2024-07-11 22:41:11', '2024-07-11 23:45:48'),
(23, 'App\\Models\\User', 15, 'auth_token', '98137548bbbf169c3b6b162eedf2be50dec5a3ceb83dd85165405bd63d63b73e', '[\"*\"]', NULL, '2024-07-11 22:47:13', '2024-07-11 22:47:13'),
(24, 'App\\Models\\User', 13, 'auth_token', '0148f92d8d6607eb4ea2985b5d7b56217a3155b064d535cbcda90ff40d362174', '[\"*\"]', '2024-07-11 23:09:10', '2024-07-11 22:50:01', '2024-07-11 23:09:10'),
(25, 'App\\Models\\User', 16, 'auth_token', 'c251084866884a2225ae5a6f64b945dfe5309058c82f701a14bae7a0d2c62e24', '[\"*\"]', NULL, '2024-07-11 22:58:19', '2024-07-11 22:58:19'),
(26, 'App\\Models\\User', 17, 'auth_token', '597385b29c2a8e4b17cc6f0a9dfb4c99fe0e350d13a4966fadb575a696978cea', '[\"*\"]', NULL, '2024-07-11 23:02:20', '2024-07-11 23:02:20'),
(27, 'App\\Models\\User', 16, 'auth_token', '4211d7f513b237cf2700a21291eb0bed4d2f047ce63c7c844aa512ec7b2f0a04', '[\"*\"]', '2024-07-12 14:55:00', '2024-07-11 23:03:33', '2024-07-12 14:55:00'),
(28, 'App\\Models\\User', 18, 'auth_token', '06055e8764865577fa13af40e158895680423d241c467294c9219e6fc99bed84', '[\"*\"]', NULL, '2024-07-12 00:10:24', '2024-07-12 00:10:24'),
(29, 'App\\Models\\User', 19, 'auth_token', '08146095ff701dbed88e5a3cf5f76eb36092bf5703458ecd038befa95987d43c', '[\"*\"]', NULL, '2024-07-12 00:11:48', '2024-07-12 00:11:48'),
(30, 'App\\Models\\User', 20, 'auth_token', 'cdf0b1b214bfb63ec45ef8d54dff69a0598439144f9b63217d35ad8dd5d235ce', '[\"*\"]', NULL, '2024-07-12 00:11:54', '2024-07-12 00:11:54'),
(31, 'App\\Models\\User', 14, 'auth_token', 'f7923f8151ea1bf785d998cf84b44fec7849c8965863044e7e24a215fc1727fe', '[\"*\"]', '2024-07-12 00:17:12', '2024-07-12 00:12:14', '2024-07-12 00:17:12'),
(32, 'App\\Models\\User', 19, 'auth_token', '63b3e84cc09a2076cdf1eda3b6e41cc85efcaab228949fbaca728cac24a21a35', '[\"*\"]', '2024-07-12 00:28:06', '2024-07-12 00:13:43', '2024-07-12 00:28:06'),
(33, 'App\\Models\\User', 20, 'auth_token', 'ffbfd83ff84b703dcc36e3c7a5c6e16cd843e455e8b84ede1e58ae8135c7ce29', '[\"*\"]', '2024-07-15 01:52:53', '2024-07-12 00:16:41', '2024-07-15 01:52:53'),
(34, 'App\\Models\\User', 21, 'auth_token', 'ec22751c8d2a182c18f33f898e987ff5d54134a1971f1bfe6c0cbebf435bee90', '[\"*\"]', NULL, '2024-07-12 00:22:31', '2024-07-12 00:22:31'),
(35, 'App\\Models\\User', 21, 'auth_token', '4a270b943be7dc3e44a3122315bbc2463f0dc25d9d998954db5c30a1690f207c', '[\"*\"]', '2024-07-13 21:37:37', '2024-07-12 00:22:53', '2024-07-13 21:37:37'),
(36, 'App\\Models\\User', 2, 'auth_token', '5e4d62b9296cad460b3f4047c9f1576bfa7e006b5f4dd289a327e9c5a6147080', '[\"*\"]', '2024-07-31 13:57:10', '2024-07-12 11:10:33', '2024-07-31 13:57:10'),
(37, 'App\\Models\\User', 22, 'auth_token', 'bce72cdad2d6ca0655cadd6a34f073cd0f382b07f074b115a27d550544932d59', '[\"*\"]', NULL, '2024-07-12 14:49:20', '2024-07-12 14:49:20'),
(38, 'App\\Models\\User', 22, 'auth_token', 'd7160cbf68a8dee3bb43ee569f18bd8127f44635cb4ce7ab759444fdc5c3ed9a', '[\"*\"]', '2024-07-12 14:55:22', '2024-07-12 14:50:19', '2024-07-12 14:55:22'),
(39, 'App\\Models\\User', 23, 'auth_token', 'a7d4d69e1d25ceaee153ec9e3dfd07f43326243660b1744862f2b11389b3ab65', '[\"*\"]', NULL, '2024-07-12 15:00:17', '2024-07-12 15:00:17'),
(40, 'App\\Models\\User', 23, 'auth_token', '84e752b0d4d3e62b196f393f6b81a204f09fe514b500c7870347617e7c7f2ccd', '[\"*\"]', '2024-07-12 15:03:48', '2024-07-12 15:00:45', '2024-07-12 15:03:48'),
(41, 'App\\Models\\User', 23, 'auth_token', 'd872931ae1ad257dc9da204f22ac9da0959f5a733bd2c081c856ae93de8b1f5d', '[\"*\"]', '2024-07-12 15:04:14', '2024-07-12 15:04:09', '2024-07-12 15:04:14'),
(42, 'App\\Models\\User', 16, 'auth_token', '51004a8e0cf5740e8dc80100dfa8a14ed4989c2ecb19c17f9218b76ee37e1886', '[\"*\"]', '2024-07-19 17:19:39', '2024-07-12 15:08:53', '2024-07-19 17:19:39'),
(43, 'App\\Models\\User', 24, 'auth_token', '2ab25a77aac4a76973bcc7702155f221c4d736e7055e89925dbd5897c748ea85', '[\"*\"]', NULL, '2024-07-12 16:45:49', '2024-07-12 16:45:49'),
(44, 'App\\Models\\User', 24, 'auth_token', 'adbce5794294d3034194113646a7f324e3f50cbb0d0537d832155cf2402b46b6', '[\"*\"]', '2024-07-15 18:10:22', '2024-07-12 16:47:11', '2024-07-15 18:10:22'),
(45, 'App\\Models\\User', 25, 'auth_token', 'c3f2b007f08fc9574a29fce578c7e6107b74326e394211a9c1fd5af1d73815a7', '[\"*\"]', NULL, '2024-07-12 23:24:31', '2024-07-12 23:24:31'),
(46, 'App\\Models\\User', 25, 'auth_token', '8f8b5124a029b5867a4b02e08c8d9542822a8d29e9c416670d862d258382af8a', '[\"*\"]', '2024-07-12 23:29:44', '2024-07-12 23:25:13', '2024-07-12 23:29:44'),
(47, 'App\\Models\\User', 26, 'auth_token', '7b0a77c0e0d48c338f24b38fe9f2a538a27c2928e2518cd1f3326e764d431922', '[\"*\"]', NULL, '2024-07-13 00:21:22', '2024-07-13 00:21:22'),
(48, 'App\\Models\\User', 26, 'auth_token', 'b0ed9d097a16dc64493ee1581b93eea9c3ee4a25f40d77477855197c611bd715', '[\"*\"]', '2024-07-13 00:22:20', '2024-07-13 00:22:13', '2024-07-13 00:22:20'),
(49, 'App\\Models\\User', 27, 'auth_token', 'dbc2eae6c29852b93ff924555b930042b0c7219c83d08b8663e04b19b907c718', '[\"*\"]', NULL, '2024-07-13 01:21:06', '2024-07-13 01:21:06'),
(50, 'App\\Models\\User', 28, 'auth_token', '63f8b93c6486a38c080e801fba37ab62f39a595ae9afda05798113aca8acf5a6', '[\"*\"]', NULL, '2024-07-13 01:25:57', '2024-07-13 01:25:57'),
(51, 'App\\Models\\User', 29, 'auth_token', '2a1932d5cae88dbe7583b2cd972ca3dbe097f4f1f2591943b04ed18ee60fc113', '[\"*\"]', NULL, '2024-07-13 17:31:08', '2024-07-13 17:31:08'),
(52, 'App\\Models\\User', 29, 'auth_token', '3ba83154faf35022c964e64d68cc7f5c231e96cff06213425481651d28b970ae', '[\"*\"]', '2024-07-13 18:38:50', '2024-07-13 17:33:06', '2024-07-13 18:38:50'),
(53, 'App\\Models\\User', 29, 'auth_token', '4bba090563e19be0de03d19312831ab23ba0af76324a44c181a682caa1380520', '[\"*\"]', '2024-07-13 22:18:55', '2024-07-13 18:41:37', '2024-07-13 22:18:55'),
(54, 'App\\Models\\User', 2, 'auth_token', '8d7875de356f7310f599ebf4ad5c7a42859f5f5ec96401fc142307aa0367d75c', '[\"*\"]', '2024-07-13 22:26:19', '2024-07-13 21:39:29', '2024-07-13 22:26:19'),
(55, 'App\\Models\\User', 29, 'auth_token', '2c5a28fe4396d146d6e3239244535adfb1268973dc06981057428b9ee4d3c20a', '[\"*\"]', '2024-07-15 05:09:11', '2024-07-13 22:32:22', '2024-07-15 05:09:11'),
(56, 'App\\Models\\User', 2, 'auth_token', 'c0af742e9191462e930df01b00ba5dd15d0fd199e9f08596c6fe50cf72a017cc', '[\"*\"]', NULL, '2024-07-13 22:35:53', '2024-07-13 22:35:53'),
(57, 'App\\Models\\User', 2, 'auth_token', '994d75a272c10b29a5f0bd8e29183f6fbe569e8b22f736a02ac01086a1fa6329', '[\"*\"]', '2024-07-14 22:39:46', '2024-07-13 22:35:58', '2024-07-14 22:39:46'),
(58, 'App\\Models\\User', 30, 'auth_token', '328c220cde29ee74717081a5d9ea3bf4ca9c29e50e42912890ed1b2bc70bcd14', '[\"*\"]', NULL, '2024-07-14 02:19:15', '2024-07-14 02:19:15'),
(59, 'App\\Models\\User', 31, 'auth_token', '87f9b0b061c774ed8a7b7ff7db03a1f8ab89f0248c8ed3e5653403a5b6e69515', '[\"*\"]', NULL, '2024-07-14 02:20:37', '2024-07-14 02:20:37'),
(60, 'App\\Models\\User', 31, 'auth_token', '9c597903f6122cee2abd7e0d41581753614718bd88d11fa474ef6bb86adf5c22', '[\"*\"]', '2024-07-14 02:21:40', '2024-07-14 02:20:48', '2024-07-14 02:21:40'),
(61, 'App\\Models\\User', 32, 'auth_token', 'db8bdf3923c9baf183298d515c811d57493f210a1d7d96b9d3cfcad19157b5c5', '[\"*\"]', NULL, '2024-07-14 02:26:01', '2024-07-14 02:26:01'),
(62, 'App\\Models\\User', 32, 'auth_token', 'f35eee22ccf20c78e7b8ee31b261108a0c05fabfd0280869e7752c8dd480e195', '[\"*\"]', '2024-07-14 02:27:23', '2024-07-14 02:26:32', '2024-07-14 02:27:23'),
(63, 'App\\Models\\User', 2, 'auth_token', '1ba4ac50952187a4fe0d31d564dfa2ce828be170f2bf12901abfbba511eb05dc', '[\"*\"]', '2024-07-14 23:34:45', '2024-07-14 23:32:52', '2024-07-14 23:34:45'),
(64, 'App\\Models\\User', 2, 'auth_token', 'efd3bc03c05daddf5ae87ad8f4b143244e2ebfbb1102c7ff93e4f0cc25123994', '[\"*\"]', '2024-07-15 00:16:13', '2024-07-14 23:35:03', '2024-07-15 00:16:13'),
(65, 'App\\Models\\User', 29, 'auth_token', 'e7687d45d1a607644d77f4a42f745fd869f209bf5ba144e187a298dab56588e9', '[\"*\"]', '2024-07-15 14:14:12', '2024-07-15 00:47:22', '2024-07-15 14:14:12'),
(66, 'App\\Models\\User', 33, 'auth_token', 'c5bcb80261ff6b6e2c18610400733c7066e73c12efaaafdd162362579129d996', '[\"*\"]', NULL, '2024-07-15 01:27:23', '2024-07-15 01:27:23'),
(67, 'App\\Models\\User', 33, 'auth_token', '48a4471335c63e85d96180c4c1480f536c332808d0174545ec1fc8c97cb96baf', '[\"*\"]', '2024-07-16 16:48:16', '2024-07-15 01:28:01', '2024-07-16 16:48:16'),
(68, 'App\\Models\\User', 34, 'auth_token', '33da5a688fa1dbc5310deb85e18d3e25405aa555f9fbc0e2d1905285f95fe6be', '[\"*\"]', NULL, '2024-07-15 01:54:30', '2024-07-15 01:54:30'),
(69, 'App\\Models\\User', 34, 'auth_token', '965e24baf6b22b80f812ef508d54471e77cd3c2bd31c821ffa5d8ccf42cba18a', '[\"*\"]', '2024-07-15 02:11:56', '2024-07-15 01:54:55', '2024-07-15 02:11:56'),
(70, 'App\\Models\\User', 25, 'auth_token', 'f8e681a955d44e62402a11a2d454fc344ca81476e982ff93eb17aed8516f26c5', '[\"*\"]', '2024-07-15 05:07:46', '2024-07-15 02:06:59', '2024-07-15 05:07:46'),
(71, 'App\\Models\\User', 34, 'auth_token', 'c27576ca4cfae0267dfcf36d4e7fdac3e3a1c19509a70c07547466229f1054a8', '[\"*\"]', '2024-07-15 02:25:08', '2024-07-15 02:12:13', '2024-07-15 02:25:08'),
(72, 'App\\Models\\User', 35, 'auth_token', '11ee594ede91b7fc10ff1211173737a5ccea9e82542e1749e610aba19fb99a9b', '[\"*\"]', NULL, '2024-07-15 02:15:03', '2024-07-15 02:15:03'),
(73, 'App\\Models\\User', 35, 'auth_token', '5ff0c7ebae9ec8dfed253c1ad21146d33f71853abc51712ce66c5c663c4b29eb', '[\"*\"]', '2024-07-15 02:26:39', '2024-07-15 02:16:57', '2024-07-15 02:26:39'),
(74, 'App\\Models\\User', 32, 'auth_token', '3bb5c59e1dc1c733ba6636494b503c31aae319c484c166815261db4b98945d36', '[\"*\"]', '2024-07-15 04:51:32', '2024-07-15 02:18:00', '2024-07-15 04:51:32'),
(75, 'App\\Models\\User', 34, 'auth_token', '7b55a067697bf9205c3f215239e22ecdf42c7b1abfa6e35c780d3ebfbf806cdc', '[\"*\"]', '2024-07-15 23:14:14', '2024-07-15 02:25:26', '2024-07-15 23:14:14'),
(76, 'App\\Models\\User', 36, 'auth_token', '666eecaae3aac533490721c809545de5d966058c7de693e36152f0151b20da49', '[\"*\"]', NULL, '2024-07-15 05:13:25', '2024-07-15 05:13:25'),
(77, 'App\\Models\\User', 36, 'auth_token', '686fe1855706941ca49b384717297fc9eeba0f31a0f1dfb07aec723f48de12cb', '[\"*\"]', '2024-07-15 05:14:43', '2024-07-15 05:13:46', '2024-07-15 05:14:43'),
(78, 'App\\Models\\User', 2, 'auth_token', 'f7cf70dcd9cb62b7884c16a2bab13735f2c0d2ce6629ae508476d314b004f44f', '[\"*\"]', '2024-07-15 22:33:03', '2024-07-15 22:25:43', '2024-07-15 22:33:03'),
(79, 'App\\Models\\User', 2, 'auth_token', '5f28761068ee24699181ed36fe27bf751937a5a6b5d0e60b912e8573b320bc70', '[\"*\"]', '2024-07-16 00:19:30', '2024-07-15 22:35:20', '2024-07-16 00:19:30'),
(80, 'App\\Models\\User', 34, 'auth_token', 'efb3cdf3c89febec3548f496034b37d0729fe8eea884a07e70939cd27f21f937', '[\"*\"]', '2024-07-16 03:53:17', '2024-07-15 23:20:57', '2024-07-16 03:53:17'),
(81, 'App\\Models\\User', 29, 'auth_token', '67bd1024d36029c3f5c7bd01c01ce9a214a0fa4adb18ebe25b94d5adff6b8847', '[\"*\"]', '2024-07-15 23:34:39', '2024-07-15 23:26:59', '2024-07-15 23:34:39'),
(82, 'App\\Models\\User', 2, 'auth_token', 'bf34372dafed41563877520b576fa600511f36a88af58705ce8734eb80904336', '[\"*\"]', '2024-07-17 13:57:19', '2024-07-16 00:20:35', '2024-07-17 13:57:19'),
(83, 'App\\Models\\User', 29, 'auth_token', '5376672a003e833a2644d95566c11551aa946e0e376bd4f1bff085123a9d5912', '[\"*\"]', '2024-07-16 23:37:48', '2024-07-16 23:36:24', '2024-07-16 23:37:48'),
(84, 'App\\Models\\User', 2, 'auth_token', 'd2e71e8d80ef225873a3b5de469f6bc479e8263923c38e0cd1fb8d338d356d78', '[\"*\"]', '2024-07-17 15:07:55', '2024-07-17 14:00:44', '2024-07-17 15:07:55'),
(85, 'App\\Models\\User', 2, 'auth_token', 'e0a1fa22ebdd6c86a66d4b73cc59afa749638aef4d034328d6bd59da8cadd849', '[\"*\"]', '2024-07-17 15:35:56', '2024-07-17 15:13:53', '2024-07-17 15:35:56'),
(86, 'App\\Models\\User', 29, 'auth_token', 'ab45fea3f60b188f953bb591321173dac60c686072435ae3397ac594546cedbe', '[\"*\"]', '2024-07-17 16:57:19', '2024-07-17 16:28:19', '2024-07-17 16:57:19'),
(87, 'App\\Models\\User', 29, 'auth_token', 'e69bcb048329c7fc641277fa3cb6ddcee76102daea0927b8e0dead78f854ac76', '[\"*\"]', '2024-07-19 01:06:49', '2024-07-17 17:17:40', '2024-07-19 01:06:49'),
(88, 'App\\Models\\User', 29, 'auth_token', '08d6a2be890990cbc9a053ebbb54d6fa7cf2f991b5d3d272724ca9812310105f', '[\"*\"]', '2024-07-21 19:56:18', '2024-07-19 17:42:16', '2024-07-21 19:56:18'),
(89, 'App\\Models\\User', 37, 'auth_token', '4bb02a022bda7ac7e34acccd60871a03da9e454ec94f78ddc29046ecffb1bfb9', '[\"*\"]', NULL, '2024-07-19 17:45:37', '2024-07-19 17:45:37'),
(90, 'App\\Models\\User', 37, 'auth_token', 'ce35c9a346ea7daeee79e0ee8edee98d700105b25bb14ea60aedc036f20ecd5c', '[\"*\"]', '2024-07-19 17:46:08', '2024-07-19 17:46:05', '2024-07-19 17:46:08'),
(91, 'App\\Models\\User', 38, 'auth_token', 'dd866cc27b89b444afb99ed8de0324664b3d316f97a5f0f8f80a9b662bc35c51', '[\"*\"]', NULL, '2024-07-19 18:10:09', '2024-07-19 18:10:09'),
(92, 'App\\Models\\User', 39, 'auth_token', '3b4ad906a2d161a337982a81a4910b5eba830be7c76a956e6d6afab9f8eed4b0', '[\"*\"]', NULL, '2024-07-19 18:27:51', '2024-07-19 18:27:51'),
(93, 'App\\Models\\User', 40, 'auth_token', '19bbd6202fe343b5f08c984c4b66498f2ea7dd0526d8e17839a360c353ec5fbb', '[\"*\"]', NULL, '2024-07-19 18:53:09', '2024-07-19 18:53:09'),
(94, 'App\\Models\\User', 39, 'auth_token', '7be29a9c7cf0bb1826a252df091a6dab2b06599323e3be86e6945fd83ceecf1e', '[\"*\"]', '2024-07-23 01:55:00', '2024-07-19 19:09:07', '2024-07-23 01:55:00'),
(95, 'App\\Models\\User', 41, 'auth_token', '4e2d8da99809633f3d6e578862079f0805c8445c4c4da3230542f11c55e03fca', '[\"*\"]', NULL, '2024-07-19 19:40:28', '2024-07-19 19:40:28'),
(96, 'App\\Models\\User', 29, 'auth_token', 'dbcb77767b601b0c8e859778f196d9a8c81b1c3fd813755ddf0102bffe60ede4', '[\"*\"]', '2024-07-21 20:48:13', '2024-07-21 19:56:24', '2024-07-21 20:48:13'),
(97, 'App\\Models\\User', 29, 'auth_token', '96f1bb1697d00761e01954a6ee9feac1d266845abf02365dfb0f935ec6fb5c39', '[\"*\"]', '2024-07-21 20:49:48', '2024-07-21 20:48:40', '2024-07-21 20:49:48'),
(98, 'App\\Models\\User', 29, 'auth_token', '0ba7db2998b2f1ac665d5d95336f670debbdf9394170146ee6f6326dc9bc4681', '[\"*\"]', '2024-07-22 01:05:57', '2024-07-21 20:50:50', '2024-07-22 01:05:57'),
(99, 'App\\Models\\User', 29, 'auth_token', '4fac56546dbdab574a88f864f3d78430721ebadfaf2e0345c1d18abd19858936', '[\"*\"]', '2024-07-22 01:06:16', '2024-07-22 01:06:06', '2024-07-22 01:06:16'),
(100, 'App\\Models\\User', 29, 'auth_token', '541d7a5f5f7c2373efe64cc631b7f95d67d75ad2ff4eb7095ea1280b298a45ee', '[\"*\"]', '2024-07-22 01:10:26', '2024-07-22 01:06:29', '2024-07-22 01:10:26'),
(101, 'App\\Models\\User', 29, 'auth_token', 'd1104406d46b14da02b8d542d60ba0e8d8220503c4f3fd63333908cfac2d3cb5', '[\"*\"]', '2024-07-24 00:43:44', '2024-07-22 01:10:32', '2024-07-24 00:43:44'),
(102, 'App\\Models\\User', 2, 'auth_token', '68d1533e23eb2c9f66516d6aa0125e2e7ccf77dc444aca1e4695105ae0ada073', '[\"*\"]', '2024-07-25 21:17:03', '2024-07-22 19:53:20', '2024-07-25 21:17:03'),
(103, 'App\\Models\\User', 29, 'auth_token', 'ad70d1c8e205978f7429ffaf32e3a71061a7c9d35339b9a49ca1b3b5fa8f6936', '[\"*\"]', '2024-07-23 01:56:35', '2024-07-23 01:55:46', '2024-07-23 01:56:35'),
(104, 'App\\Models\\User', 42, 'auth_token', '57687c191249979a4fdfa10e353eae515e89ebb7ceeeb364a6b371a6933d037c', '[\"*\"]', NULL, '2024-07-23 01:58:09', '2024-07-23 01:58:09'),
(105, 'App\\Models\\User', 42, 'auth_token', '97a544d188ac60bf2bb5ef1bbad06fe074d765745fcd9e74a4c2371bb09cf443', '[\"*\"]', '2024-07-23 01:58:38', '2024-07-23 01:58:30', '2024-07-23 01:58:38'),
(106, 'App\\Models\\User', 44, 'auth_token', 'a80e91c6807588a12882b9296c1fe4113d3626f79ca6dd35dc8e03b1c310899b', '[\"*\"]', NULL, '2024-07-23 17:07:26', '2024-07-23 17:07:26'),
(107, 'App\\Models\\User', 44, 'auth_token', '6d8ef984ab0dd27a400a7e6dfd2d439bb9e917c9f644c57e2b718720077e8fac', '[\"*\"]', '2024-07-23 18:46:41', '2024-07-23 17:08:14', '2024-07-23 18:46:41'),
(108, 'App\\Models\\User', 44, 'auth_token', '48293d3042be1a0995e2c7ea8865e89b6031658b3bffef8a0a5c53617213152f', '[\"*\"]', '2024-07-23 19:08:05', '2024-07-23 19:07:42', '2024-07-23 19:08:05'),
(109, 'App\\Models\\User', 45, 'auth_token', '7a8c6065d7508664a9f6546c4facee2499527c370668f1007bbef6a20f1912bb', '[\"*\"]', NULL, '2024-07-23 19:12:19', '2024-07-23 19:12:19'),
(110, 'App\\Models\\User', 46, 'auth_token', 'ad74f016b28bebfbd576bbd9c84331afa6195d3f4addbb4e55b454095438b82d', '[\"*\"]', NULL, '2024-07-23 19:13:39', '2024-07-23 19:13:39'),
(111, 'App\\Models\\User', 45, 'auth_token', '7b861bf2bead6cab28488c3a09a508c2259e1687dfa5596614bc8c0eccf60490', '[\"*\"]', '2024-07-23 19:34:38', '2024-07-23 19:14:05', '2024-07-23 19:34:38'),
(112, 'App\\Models\\User', 47, 'auth_token', '8ab0221a042765cddb109537a12333e107e68fb293a13db809dae6850d9f77f5', '[\"*\"]', NULL, '2024-07-23 19:15:33', '2024-07-23 19:15:33'),
(113, 'App\\Models\\User', 48, 'auth_token', 'e901a78a2b88cdca1c1ead89031908caa666923117e42b38f9eafe8b6f291af7', '[\"*\"]', NULL, '2024-07-23 19:17:40', '2024-07-23 19:17:40'),
(114, 'App\\Models\\User', 49, 'auth_token', '9e15db720d57434d042a9794801794d200b4d28cc615e2dbae32ef9735b2d5f5', '[\"*\"]', NULL, '2024-07-23 19:19:23', '2024-07-23 19:19:23'),
(115, 'App\\Models\\User', 49, 'auth_token', '0d718291666c59ff03b88aa838eaa39c39f18135e72301e47fdad8bcdacbbaa4', '[\"*\"]', '2024-07-23 19:37:52', '2024-07-23 19:20:02', '2024-07-23 19:37:52'),
(116, 'App\\Models\\User', 50, 'auth_token', '62e0fa265a74840d98e64cda0dc655b01a93485096429772c15404149571d2a4', '[\"*\"]', NULL, '2024-07-23 19:20:21', '2024-07-23 19:20:21'),
(117, 'App\\Models\\User', 50, 'auth_token', '435a219c2062bc5fe1840fba1602ab610b4ef71ed3cdde8f877e49f35d47601f', '[\"*\"]', '2024-07-23 19:34:24', '2024-07-23 19:21:08', '2024-07-23 19:34:24'),
(118, 'App\\Models\\User', 44, 'auth_token', '2ef819a9ce824c2c4f6d6c5810201750b1fd9bc223525698e085e327483d787f', '[\"*\"]', '2024-07-24 12:43:11', '2024-07-23 19:23:55', '2024-07-24 12:43:11'),
(119, 'App\\Models\\User', 51, 'auth_token', 'a9368b155718e7255c505963bb7bb0f0439d1e8584dc60abed736a1a1e076a3d', '[\"*\"]', NULL, '2024-07-23 19:24:05', '2024-07-23 19:24:05'),
(120, 'App\\Models\\User', 51, 'auth_token', '3bbf7d28f2bbee9ede285952ada187481ffe6a5b7db138216f2153efbd2bff5b', '[\"*\"]', '2024-07-23 19:39:22', '2024-07-23 19:24:32', '2024-07-23 19:39:22'),
(121, 'App\\Models\\User', 52, 'auth_token', '6215862d675558098c2d44bec34f6404b647e9a4717d602f757b2ca4445a77d5', '[\"*\"]', NULL, '2024-07-23 19:43:14', '2024-07-23 19:43:14'),
(122, 'App\\Models\\User', 49, 'auth_token', '1f3ce244c24422e34100960f18141ac4c4ba9dc4a4e7bef755ee9dac0ecd4efc', '[\"*\"]', '2024-07-24 14:34:15', '2024-07-23 19:44:33', '2024-07-24 14:34:15'),
(123, 'App\\Models\\User', 53, 'auth_token', '98fee4239b05fb21e90420a116d9632254da24035935c950c920e2df0a509435', '[\"*\"]', NULL, '2024-07-23 19:45:37', '2024-07-23 19:45:37'),
(124, 'App\\Models\\User', 53, 'auth_token', '775d13ee64cc3c2378660833d0f763a4e4ae001cf3a6c5d33cca6b07c6838169', '[\"*\"]', '2024-07-23 22:59:08', '2024-07-23 19:46:05', '2024-07-23 22:59:08'),
(125, 'App\\Models\\User', 54, 'auth_token', 'df155aa9792910e4562f6790761123af5c5b2e5cecd0d91ac895550b07a436a8', '[\"*\"]', NULL, '2024-07-23 19:47:49', '2024-07-23 19:47:49'),
(126, 'App\\Models\\User', 54, 'auth_token', 'c3d17f4971cdbb3e0f653d84d2f8b96bceaf37c5c7fc5bd947c7e60497d4ead4', '[\"*\"]', '2024-07-23 19:51:19', '2024-07-23 19:48:23', '2024-07-23 19:51:19'),
(127, 'App\\Models\\User', 54, 'auth_token', '4db18c7df6e3df786b40af00f8ed3ed5932f9a6a2f011228fbbdca566fae393d', '[\"*\"]', '2024-07-23 19:56:18', '2024-07-23 19:55:32', '2024-07-23 19:56:18'),
(128, 'App\\Models\\User', 55, 'auth_token', '2c64046ea9d5166f8bb7c425c465114c23cb84b17dec8349c259c1073fb54393', '[\"*\"]', NULL, '2024-07-23 20:02:21', '2024-07-23 20:02:21'),
(129, 'App\\Models\\User', 55, 'auth_token', 'f8bb8987d54a81d78cf2f25618179c796eea4bd43fae0682104a2ddfb1311801', '[\"*\"]', '2024-07-23 20:18:18', '2024-07-23 20:11:12', '2024-07-23 20:18:18'),
(130, 'App\\Models\\User', 53, 'auth_token', '406221fb912fb06424b99e5901126bb56e9c4267bfd163c379bf09956c60b5d9', '[\"*\"]', '2024-07-24 13:20:14', '2024-07-23 22:59:34', '2024-07-24 13:20:14'),
(131, 'App\\Models\\User', 55, 'auth_token', '86a0c27407882d71e235783356034df9d5ef800162fefaf5077c22c793e9ad99', '[\"*\"]', '2024-07-24 16:02:59', '2024-07-23 23:51:08', '2024-07-24 16:02:59'),
(132, 'App\\Models\\User', 29, 'auth_token', '230e94ba4873ca5f2ecd0029c7c389f13174a89f11defaae352f20944307828b', '[\"*\"]', '2024-07-24 01:40:45', '2024-07-24 00:53:28', '2024-07-24 01:40:45'),
(133, 'App\\Models\\User', 29, 'auth_token', '401acf15840d4a95ad97f40ed8ae58be599336c0b8a56eca3dbad71a617829eb', '[\"*\"]', '2024-07-27 20:14:44', '2024-07-24 01:40:51', '2024-07-27 20:14:44'),
(134, 'App\\Models\\User', 44, 'auth_token', '8591bf3a1da0af9789cddcc5f9c9ea46f85fd691fba42d66b77a2cd5678ffab2', '[\"*\"]', '2024-07-24 15:11:43', '2024-07-24 12:43:44', '2024-07-24 15:11:43'),
(135, 'App\\Models\\User', 56, 'auth_token', 'c2d68f9d0a457d413e2c5c2b77c077ed08f5505261b4d44735df4563d73d13cb', '[\"*\"]', NULL, '2024-07-24 14:35:09', '2024-07-24 14:35:09'),
(136, 'App\\Models\\User', 57, 'auth_token', '62640a4bb5929ec92b76b1fc199aa99e94127222e8dff2665daeec8b40982a4c', '[\"*\"]', NULL, '2024-07-24 14:37:16', '2024-07-24 14:37:16'),
(137, 'App\\Models\\User', 57, 'auth_token', 'ad00fb387f0901a7576bce4ff5642421d78463c8a2308035a23d527b6cfacbee', '[\"*\"]', '2024-07-24 14:43:58', '2024-07-24 14:37:51', '2024-07-24 14:43:58'),
(138, 'App\\Models\\User', 58, 'auth_token', '7f9d034ef13c03e8a0bb833ee0f08a217bcab7cba482523c525b93fa765b8818', '[\"*\"]', NULL, '2024-07-24 14:40:51', '2024-07-24 14:40:51'),
(139, 'App\\Models\\User', 58, 'auth_token', '15ff73ed03dc84821977eab9c30d35f44e6d9b5776b993e3e811872fed2f6b91', '[\"*\"]', '2024-07-24 14:48:41', '2024-07-24 14:41:10', '2024-07-24 14:48:41'),
(140, 'App\\Models\\User', 59, 'auth_token', 'a798729fe336de9c2c664749879a087b8d0c9cd8018bee25360a5438c393e06f', '[\"*\"]', NULL, '2024-07-24 14:52:09', '2024-07-24 14:52:09'),
(141, 'App\\Models\\User', 59, 'auth_token', '3f108645583f569119ce004a982a03d7a5d21570a4a277adcf7c48b06a14c4e5', '[\"*\"]', '2024-07-24 15:09:39', '2024-07-24 14:52:48', '2024-07-24 15:09:39'),
(142, 'App\\Models\\User', 60, 'auth_token', '1357f87dc5ccf4cc89e55af24a8393abfcb124b4db70a5074157dfd00345498c', '[\"*\"]', NULL, '2024-07-24 14:53:23', '2024-07-24 14:53:23'),
(143, 'App\\Models\\User', 60, 'auth_token', 'bfb797825aca142ab44552fd067130155c9e9422d2ee95a2a20b0185383df8d6', '[\"*\"]', '2024-07-24 14:55:22', '2024-07-24 14:53:51', '2024-07-24 14:55:22'),
(144, 'App\\Models\\User', 61, 'auth_token', 'ec99d80e41adb642178a446b21253bcd33ad5d09b957981fd1565726f8bfabef', '[\"*\"]', NULL, '2024-07-24 15:07:09', '2024-07-24 15:07:09'),
(145, 'App\\Models\\User', 61, 'auth_token', '07aa58f3eb3f4018a3b04a61b2e9375729ac97b69cd2f70b95775da1f5cf0291', '[\"*\"]', '2024-07-24 16:43:58', '2024-07-24 15:07:51', '2024-07-24 16:43:58'),
(146, 'App\\Models\\User', 62, 'auth_token', 'fd1b62dfd082f02581fa3ce940d1cdb6e70a6e43378456380af3827e0db0aeee', '[\"*\"]', NULL, '2024-07-24 15:31:01', '2024-07-24 15:31:01'),
(147, 'App\\Models\\User', 62, 'auth_token', 'a337874aba20946bad26f7b7c78577156b37ced136388ed7400e8a090c3a3500', '[\"*\"]', '2024-07-24 15:34:33', '2024-07-24 15:31:38', '2024-07-24 15:34:33'),
(148, 'App\\Models\\User', 63, 'auth_token', '27f6e26274fc56d5c77b461a8dbd6db7096e8e606126b987f8e9200945a73835', '[\"*\"]', NULL, '2024-07-24 16:05:26', '2024-07-24 16:05:26'),
(149, 'App\\Models\\User', 63, 'auth_token', '63eed458f612455b37131b1e10e9f550294c2c06b48f152373f67587c6540b2a', '[\"*\"]', '2024-07-24 16:42:42', '2024-07-24 16:06:24', '2024-07-24 16:42:42'),
(150, 'App\\Models\\User', 64, 'auth_token', 'ce559569ee43dfdcd71c30b4a2f6dc798f44d4f47e70fa9cd913337c78668ef3', '[\"*\"]', NULL, '2024-07-24 16:37:55', '2024-07-24 16:37:55'),
(151, 'App\\Models\\User', 65, 'auth_token', 'ab998b0615294f3136f67a82c42ba088722317ee9a21e8b9cf60e9fcedc27f40', '[\"*\"]', NULL, '2024-07-24 16:45:14', '2024-07-24 16:45:14'),
(152, 'App\\Models\\User', 65, 'auth_token', '19195ea5c0a827dd49dcc968b7372aabae23777e7ee414dab4a27ca53dfa94dc', '[\"*\"]', '2024-07-24 16:47:56', '2024-07-24 16:45:41', '2024-07-24 16:47:56'),
(153, 'App\\Models\\User', 66, 'auth_token', '9be6f4d550f31d85a4e265a616fc293b87e07921ef57a6f0e2d42d0a341b6064', '[\"*\"]', NULL, '2024-07-24 17:26:43', '2024-07-24 17:26:43'),
(154, 'App\\Models\\User', 67, 'auth_token', '2b2bc26a338ddf77847d16693796fc1e9e5ac4a546b2ee821bb51b1d9c53ba7e', '[\"*\"]', NULL, '2024-07-24 17:51:21', '2024-07-24 17:51:21'),
(155, 'App\\Models\\User', 67, 'auth_token', 'ba2608663dcbb5a69b131b4008d672f226ff82f477b73fbe4e941c836371f7cd', '[\"*\"]', '2024-07-24 17:55:42', '2024-07-24 17:52:00', '2024-07-24 17:55:42'),
(156, 'App\\Models\\User', 68, 'auth_token', 'eba773df2b05b6846a3e290033541f54f4343c02d377f50ddb75ec0064ca1967', '[\"*\"]', NULL, '2024-07-24 18:23:21', '2024-07-24 18:23:21'),
(157, 'App\\Models\\User', 68, 'auth_token', '5e72a3bb2d01727a7337fc22e4fb01f8548a79e8698da8fdf241cff46e30228d', '[\"*\"]', '2024-07-25 12:16:12', '2024-07-24 18:24:21', '2024-07-25 12:16:12'),
(158, 'App\\Models\\User', 69, 'auth_token', '51e86930a0f719336e9e897b652fd3c773ec413c595041a8b7ffe4296982c0e8', '[\"*\"]', NULL, '2024-07-24 18:33:37', '2024-07-24 18:33:37'),
(159, 'App\\Models\\User', 69, 'auth_token', 'fbefefdc5ebd2189405a7688d76edc9b21536c8e1bc002fa8b3a03fc75429140', '[\"*\"]', '2024-07-24 18:35:36', '2024-07-24 18:34:04', '2024-07-24 18:35:36'),
(160, 'App\\Models\\User', 70, 'auth_token', 'b85a78eed7ac1bbae157a44df8d5927ca44ae66222b0c58104dd00c0174cfa24', '[\"*\"]', NULL, '2024-07-24 18:40:49', '2024-07-24 18:40:49'),
(161, 'App\\Models\\User', 70, 'auth_token', 'e542a157f11ed03ada2dcea72bca1f45dc4c7d15cecb993cb8c9303f04ddea39', '[\"*\"]', '2024-07-24 18:44:54', '2024-07-24 18:41:51', '2024-07-24 18:44:54'),
(162, 'App\\Models\\User', 71, 'auth_token', '22b66bc2f85428cfb8ae5e4e06f3e11eaef0ef1ac6d01d95928344f3a9d6e46d', '[\"*\"]', NULL, '2024-07-25 03:35:16', '2024-07-25 03:35:16'),
(163, 'App\\Models\\User', 71, 'auth_token', 'f23f4714b9568cc7cafa6d90cbca792d84eb8be66d6d02bc9cc0acb3b2a2e462', '[\"*\"]', '2024-07-25 12:44:52', '2024-07-25 03:35:53', '2024-07-25 12:44:52'),
(164, 'App\\Models\\User', 44, 'auth_token', 'b3fae093c0b93d7f6cd13eef0b0a4a296761a76ab3522f82584b89d506924071', '[\"*\"]', '2024-07-25 17:29:30', '2024-07-25 03:53:25', '2024-07-25 17:29:30'),
(165, 'App\\Models\\User', 63, 'auth_token', '15b99780573c16288f56dd2cd07571a177dbf8933c25d7cca77596c49e4432c6', '[\"*\"]', '2024-07-25 12:53:20', '2024-07-25 12:46:53', '2024-07-25 12:53:20'),
(166, 'App\\Models\\User', 72, 'auth_token', '31a02547752f28fee11609d59197482361fc19be2f40e119df277745b568af8d', '[\"*\"]', NULL, '2024-07-25 13:06:47', '2024-07-25 13:06:47'),
(167, 'App\\Models\\User', 72, 'auth_token', '53f0be05475ce7e2034e73efe6afb3eee1ffece5b54986213d3513a62dcbded9', '[\"*\"]', '2024-07-25 13:10:16', '2024-07-25 13:07:14', '2024-07-25 13:10:16'),
(168, 'App\\Models\\User', 73, 'auth_token', 'ebdae8721198c960d4929178320d10c33f670c8db7c7ea96702afcd29819e705', '[\"*\"]', NULL, '2024-07-25 14:01:09', '2024-07-25 14:01:09'),
(169, 'App\\Models\\User', 73, 'auth_token', 'f0e2cad3e937fa7134088334f4e23e45efbd4032d63ec26b8da4cfed4deea48e', '[\"*\"]', '2024-07-25 14:04:13', '2024-07-25 14:01:47', '2024-07-25 14:04:13'),
(170, 'App\\Models\\User', 74, 'auth_token', 'edc9c6ba22ab274f070128b415b9f8583c50468402eccaa11cb944ef507a7f38', '[\"*\"]', NULL, '2024-07-25 16:48:28', '2024-07-25 16:48:28'),
(171, 'App\\Models\\User', 74, 'auth_token', '2d3b1bb02fca0888b39e4cf8be970898cb48d2b69da5e73819133878dcea6ba6', '[\"*\"]', '2024-07-25 16:52:01', '2024-07-25 16:49:07', '2024-07-25 16:52:01'),
(172, 'App\\Models\\User', 75, 'auth_token', '2818d185e86604d6f8c72f87ed9e4942cea2d39c9403e059d92d85261432816f', '[\"*\"]', NULL, '2024-07-25 17:01:00', '2024-07-25 17:01:00'),
(173, 'App\\Models\\User', 75, 'auth_token', '08ae714b17a12d165262ba23f26c406687c0ef9a4ac2d24b9fcd1dcb0aa10028', '[\"*\"]', '2024-07-25 17:03:31', '2024-07-25 17:01:38', '2024-07-25 17:03:31'),
(174, 'App\\Models\\User', 76, 'auth_token', '9b4c079fa00821a317ac1a72f48f88142c7fb77401f5bb219dee67b1673bf276', '[\"*\"]', NULL, '2024-07-25 17:25:10', '2024-07-25 17:25:10'),
(175, 'App\\Models\\User', 76, 'auth_token', '793c1d1a01084a334a7028f5e291ffe9303ab3d491cbcef21b43c2ad8dce6da6', '[\"*\"]', '2024-07-25 17:58:22', '2024-07-25 17:25:49', '2024-07-25 17:58:22'),
(176, 'App\\Models\\User', 77, 'auth_token', '5ceb089d5fe5c44e74e87f6749f96a392d0dd7c29d6a4c069d65407d6d20ac70', '[\"*\"]', NULL, '2024-07-25 18:04:31', '2024-07-25 18:04:31'),
(177, 'App\\Models\\User', 78, 'auth_token', '292e88c50aef5f93772c89301ff52ad6087cfc2fad2956ed2049288f5b74740f', '[\"*\"]', NULL, '2024-07-25 18:08:10', '2024-07-25 18:08:10'),
(178, 'App\\Models\\User', 79, 'auth_token', 'fb0d0d7cc144fc50722dbf5b58cf5d8857ac7e8ea65dabc5fcd1b88557d379b9', '[\"*\"]', NULL, '2024-07-25 18:08:37', '2024-07-25 18:08:37'),
(179, 'App\\Models\\User', 78, 'auth_token', 'e45264a06a845e408a0bed2b63c45bba768f9b1f779d3293bf120041cbee5129', '[\"*\"]', '2024-07-25 18:13:32', '2024-07-25 18:08:46', '2024-07-25 18:13:32'),
(180, 'App\\Models\\User', 44, 'auth_token', '587a8817a4103842cfb25ca7efa55dd8cc1dc634af8e91e4957d9a9b33643d58', '[\"*\"]', '2024-07-29 20:34:42', '2024-07-25 18:08:47', '2024-07-29 20:34:42'),
(181, 'App\\Models\\User', 79, 'auth_token', 'b7fdd2d40bf065b0716bf52ff3949f33bd5ad4de180245649f892e9618f80fd1', '[\"*\"]', '2024-07-25 21:06:06', '2024-07-25 18:08:52', '2024-07-25 21:06:06'),
(182, 'App\\Models\\User', 80, 'auth_token', '69c93bcaa9d1cc9a6c390c33338f38ece2efac29bd5ae5f411b13b61135cb07b', '[\"*\"]', NULL, '2024-07-25 18:54:16', '2024-07-25 18:54:16'),
(183, 'App\\Models\\User', 80, 'auth_token', 'bbf907d22e25059f8c712283298d6c85e98f86facc43d6ac07e5af3398d28e53', '[\"*\"]', '2024-07-25 18:59:47', '2024-07-25 18:57:05', '2024-07-25 18:59:47'),
(184, 'App\\Models\\User', 53, 'auth_token', '621833a9f00f333caa16991c7e140fb257aabdf322f92c8873b04d536db26b5a', '[\"*\"]', '2024-07-26 14:26:55', '2024-07-25 21:06:46', '2024-07-26 14:26:55'),
(185, 'App\\Models\\User', 81, 'auth_token', '12b17fd444e1ee8420220cf576f8fb05d938a33f27592504e4961a34f0d8d943', '[\"*\"]', NULL, '2024-07-26 14:52:33', '2024-07-26 14:52:33'),
(186, 'App\\Models\\User', 81, 'auth_token', 'e1aa3908753b773a25e33ae82ee0362fdf6eba2f00bd4331e1722f9184e33320', '[\"*\"]', '2024-07-26 14:54:42', '2024-07-26 14:52:54', '2024-07-26 14:54:42'),
(187, 'App\\Models\\User', 82, 'auth_token', 'cfa4d4b12484a86ff57f7ca1d20424a15bf6d996eb2b0a110cb0013ac45fea76', '[\"*\"]', NULL, '2024-07-26 15:10:12', '2024-07-26 15:10:12'),
(188, 'App\\Models\\User', 82, 'auth_token', '618bb7843b845de1c418fa8edec2aa910a327ae19f64812e38dc2034987e83d1', '[\"*\"]', '2024-07-26 18:32:48', '2024-07-26 15:10:37', '2024-07-26 18:32:48'),
(189, 'App\\Models\\User', 83, 'auth_token', 'bc3543b4cba35cfca8eefe0884d5ddb138060af5baf0c19c51c7b3ba247c297f', '[\"*\"]', NULL, '2024-07-26 20:12:23', '2024-07-26 20:12:23'),
(190, 'App\\Models\\User', 83, 'auth_token', 'a24ce9b77902f900de30e0a2131b0e869145ecbc126a6de011e0d089a283f7a7', '[\"*\"]', '2024-07-27 16:21:45', '2024-07-26 20:13:17', '2024-07-27 16:21:45'),
(191, 'App\\Models\\User', 79, 'auth_token', '4d498526ff03a26275c7a2184912261ed68d5bd24159cc87a5e906aecccc4d71', '[\"*\"]', '2024-07-27 16:23:44', '2024-07-27 16:23:41', '2024-07-27 16:23:44'),
(192, 'App\\Models\\User', 84, 'auth_token', 'a8071ac1c4e9214f2149dbc5e750e9d55ff1fd63b4791cdb323f0516bd1f3f2b', '[\"*\"]', NULL, '2024-07-27 16:37:41', '2024-07-27 16:37:41'),
(193, 'App\\Models\\User', 84, 'auth_token', '40b08f0adf36ad8ef0c8bd117c59882c9da9424fc31a5828640814bba99c85a6', '[\"*\"]', '2024-07-27 16:41:38', '2024-07-27 16:38:02', '2024-07-27 16:41:38'),
(194, 'App\\Models\\User', 85, 'auth_token', '28534ee6e4c2a2fab7ca837c129197b86e38c6a36d81512163607bc683e72bd8', '[\"*\"]', NULL, '2024-07-27 16:43:38', '2024-07-27 16:43:38'),
(195, 'App\\Models\\User', 85, 'auth_token', 'bb07f552e9c28c90ee4564e8c1cbdae13bdd54c515bc2fa9093eb08410e1e9af', '[\"*\"]', '2024-07-27 16:45:57', '2024-07-27 16:44:09', '2024-07-27 16:45:57'),
(196, 'App\\Models\\User', 86, 'auth_token', 'b34dc04f6a7b12a710d3f8b050ec5803d4ed47ffc1adb83e6b97a43cd33f5d4b', '[\"*\"]', NULL, '2024-07-27 17:11:24', '2024-07-27 17:11:24'),
(197, 'App\\Models\\User', 86, 'auth_token', '3f23528225d34354a620ff643cb2d9d97af9200291bcfab1ca931f67de31f80a', '[\"*\"]', '2024-07-29 12:17:35', '2024-07-27 17:12:16', '2024-07-29 12:17:35'),
(198, 'App\\Models\\User', 87, 'auth_token', 'fcce62a3abd78d742357ff284704f6312858882b070db2298a356edb1f21c7e1', '[\"*\"]', NULL, '2024-07-27 17:57:17', '2024-07-27 17:57:17'),
(199, 'App\\Models\\User', 87, 'auth_token', '2ab420a976a97efcaa62a395a1169641aedc9dd5ee0cadc1e734142aee095bdd', '[\"*\"]', '2024-07-29 11:58:36', '2024-07-27 17:57:43', '2024-07-29 11:58:36'),
(200, 'App\\Models\\User', 88, 'auth_token', '6e18398f20d2733c3de23ef27f0016a35455e4df48c275a7182624e0e212ffb4', '[\"*\"]', NULL, '2024-07-27 20:27:04', '2024-07-27 20:27:04'),
(201, 'App\\Models\\User', 88, 'auth_token', '0d5c5ba62114a374c25306ad2f329ad52f177c50cd1108b588c65c2d80039949', '[\"*\"]', '2024-07-27 21:33:41', '2024-07-27 20:27:27', '2024-07-27 21:33:41'),
(202, 'App\\Models\\User', 88, 'auth_token', '7c324a94fde617fe28817659b8ac05f2fa13c95c4a94cd8c6fdc1c0aae2f011d', '[\"*\"]', '2024-07-27 23:13:27', '2024-07-27 21:41:25', '2024-07-27 23:13:27'),
(203, 'App\\Models\\User', 88, 'auth_token', 'c6b2db0ad63c70b24cb4ff8046aae87c828a263312e262e6c0e8cab89705a6c8', '[\"*\"]', '2024-07-28 01:16:07', '2024-07-27 23:18:57', '2024-07-28 01:16:07'),
(204, 'App\\Models\\User', 29, 'auth_token', '74bfa9c912037273df4d32fcfe708ef091280a14b59285ec839c692c660f6dc3', '[\"*\"]', '2024-07-27 23:40:25', '2024-07-27 23:24:53', '2024-07-27 23:40:25'),
(205, 'App\\Models\\User', 21, 'auth_token', 'fc6f5458a38dbed8263b6e0a16989479313506a970b12348a39016dc066ed468', '[\"*\"]', '2024-07-28 05:38:28', '2024-07-27 23:41:10', '2024-07-28 05:38:28'),
(206, 'App\\Models\\User', 29, 'auth_token', 'f5fc8330cb74f94073cfc5851759a7bec11b920b302735b32257639fe1cf5eec', '[\"*\"]', '2024-07-29 23:26:43', '2024-07-28 01:30:17', '2024-07-29 23:26:43'),
(207, 'App\\Models\\User', 3, 'auth_token', '77baec2036d9d5289ae13b053bf53774b6e1632aa94d2597c258cf5c2a1c2336', '[\"*\"]', '2024-07-28 06:07:00', '2024-07-28 05:44:32', '2024-07-28 06:07:00'),
(208, 'App\\Models\\User', 3, 'auth_token', 'd352047aac623ba0dc9c8aed9de6df88cf0a8e86c8880239531a143570943c79', '[\"*\"]', '2024-07-29 00:13:30', '2024-07-28 06:22:13', '2024-07-29 00:13:30'),
(209, 'App\\Models\\User', 53, 'auth_token', 'fee5aa82638f9a06dad08658c8d9087f89a0a18748440fe1cf9efa10ffe82874', '[\"*\"]', '2024-07-29 14:01:33', '2024-07-29 11:59:22', '2024-07-29 14:01:33'),
(210, 'App\\Models\\User', 89, 'auth_token', '7fa4fef8f892b1724d34878d4b46965c03e4cf78f502eebc15ab1e4eb59efa18', '[\"*\"]', NULL, '2024-07-29 12:24:13', '2024-07-29 12:24:13'),
(211, 'App\\Models\\User', 89, 'auth_token', '6d8db19d55922b3b75ee5b9d709c860652eaa4e2b40edf073f5bae37590a48a6', '[\"*\"]', '2024-07-29 12:40:02', '2024-07-29 12:24:52', '2024-07-29 12:40:02'),
(212, 'App\\Models\\User', 89, 'auth_token', '87c791609653b8d0979c5e452b92686fe03c6397037deb4610c255a7878ae7cb', '[\"*\"]', '2024-07-29 13:13:46', '2024-07-29 12:43:53', '2024-07-29 13:13:46'),
(213, 'App\\Models\\User', 89, 'auth_token', '7dfacdac9fe171b9298e0c3557365357a4532282b5306ac6617fbbf6bef6f1f4', '[\"*\"]', '2024-07-29 16:33:14', '2024-07-29 13:32:49', '2024-07-29 16:33:14'),
(214, 'App\\Models\\User', 89, 'auth_token', 'e3b4a6a2fead60a2f8eb037bc315b48fc0ca16df32ac6ea2fb470dbe47f05618', '[\"*\"]', '2024-07-29 14:05:13', '2024-07-29 14:03:04', '2024-07-29 14:05:13'),
(215, 'App\\Models\\User', 53, 'auth_token', '828cad0e20eb42c63fd5ec9c1216237688eb4de3b576179fe6a4536763a286a8', '[\"*\"]', '2024-07-29 17:31:06', '2024-07-29 14:29:51', '2024-07-29 17:31:06'),
(216, 'App\\Models\\User', 89, 'auth_token', '7c3f806a91533e62b61e108756c2ee62e685040eca8a9293106148ecffd8943a', '[\"*\"]', '2024-07-29 16:48:19', '2024-07-29 16:47:42', '2024-07-29 16:48:19'),
(217, 'App\\Models\\User', 90, 'auth_token', '99ee18d6f30bc396e8b334912cee3c60c67960ed684ffb37d314f181891548e2', '[\"*\"]', NULL, '2024-07-29 17:13:54', '2024-07-29 17:13:54'),
(218, 'App\\Models\\User', 91, 'auth_token', '57303ac4f3f5d23a524d67a1568f239855bb9db9175711b42e3fa4d304c50233', '[\"*\"]', NULL, '2024-07-29 17:15:19', '2024-07-29 17:15:19'),
(219, 'App\\Models\\User', 91, 'auth_token', '67fd0b9d1e9d66c20a6c78d0560abe275e349518f28a084d1ff05655acb943e7', '[\"*\"]', '2024-07-29 17:25:56', '2024-07-29 17:17:41', '2024-07-29 17:25:56'),
(220, 'App\\Models\\User', 92, 'auth_token', '9da63dbc940eea4d6a56117182b2911982f66a44708827be13e37dc34d7ce05c', '[\"*\"]', NULL, '2024-07-29 17:34:32', '2024-07-29 17:34:32'),
(221, 'App\\Models\\User', 92, 'auth_token', '6a34d40137d5c6319328e12e8790fedbf992d761e0d4b7a122bd66b58dba7477', '[\"*\"]', '2024-07-30 18:23:16', '2024-07-29 17:34:59', '2024-07-30 18:23:16'),
(222, 'App\\Models\\User', 3, 'auth_token', '8a4b352eb0a96884d29b39cae7099ec0033ca018c4ccb322af03a35543f12acf', '[\"*\"]', '2024-07-29 20:34:23', '2024-07-29 20:18:01', '2024-07-29 20:34:23'),
(223, 'App\\Models\\User', 21, 'auth_token', '52f147bdfc7f976c70987b03f0cc1e5b4b0d0fdc0db9754721b5cf9444a4031f', '[\"*\"]', '2024-07-29 21:31:36', '2024-07-29 20:50:16', '2024-07-29 21:31:36'),
(224, 'App\\Models\\User', 44, 'auth_token', '49d8274cab1183b2e6b72bda86304c328b03c33805fe077a0602f15406405a1e', '[\"*\"]', '2024-08-06 18:49:49', '2024-07-29 21:09:59', '2024-08-06 18:49:49'),
(225, 'App\\Models\\User', 29, 'auth_token', '757dc81587a089a984b563ea9321d8813baf32e36c958b0133a797dd39afe2dd', '[\"*\"]', '2024-07-31 22:04:28', '2024-07-29 23:31:04', '2024-07-31 22:04:28'),
(226, 'App\\Models\\User', 3, 'auth_token', '8fe42e26b3b277221213626145459c1c87594d094a36be54ff5bc7e9f4442eb7', '[\"*\"]', '2024-07-30 01:32:44', '2024-07-30 01:31:04', '2024-07-30 01:32:44'),
(227, 'App\\Models\\User', 29, 'auth_token', '06b78aee1b007c3e99d3af0c0611b74ed66dcf44764b9781a714101914a25644', '[\"*\"]', '2024-07-30 12:38:31', '2024-07-30 12:25:30', '2024-07-30 12:38:31'),
(228, 'App\\Models\\User', 53, 'auth_token', 'bcb983a88eb1a2916186f2035fe11c8088d627b5269dafa72163e37b7971a638', '[\"*\"]', '2024-07-30 18:39:53', '2024-07-30 18:24:01', '2024-07-30 18:39:53'),
(229, 'App\\Models\\User', 53, 'auth_token', '1cae8188e113db7710afc44e0dddcb005f0c9b1ea8634083047e9641be62ecd2', '[\"*\"]', '2024-07-30 21:18:18', '2024-07-30 21:14:35', '2024-07-30 21:18:18'),
(230, 'App\\Models\\User', 53, 'auth_token', '04e8bcac497be70d00a3ac6ff5e4a0c5d78bdffc6adb34b68e09e2a5a12ac701', '[\"*\"]', '2024-07-31 00:32:55', '2024-07-30 21:18:33', '2024-07-31 00:32:55'),
(231, 'App\\Models\\User', 3, 'auth_token', '156286410acd45f8d14ea699bca249a4251f1d6827e1b974066d3fa61cbd7464', '[\"*\"]', '2024-07-30 21:21:19', '2024-07-30 21:19:19', '2024-07-30 21:21:19'),
(232, 'App\\Models\\User', 53, 'auth_token', '49ceea0eb4ab302f6dd8f3fb027f5ee5c21575f38d265845499cad0501e1d282', '[\"*\"]', '2024-08-09 10:27:02', '2024-07-30 21:40:47', '2024-08-09 10:27:02'),
(233, 'App\\Models\\User', 93, 'auth_token', '7f395140294af7be842b4c20029173bae3ff273aa0ca9c1c7de7ebace638908c', '[\"*\"]', NULL, '2024-07-31 15:24:52', '2024-07-31 15:24:52'),
(234, 'App\\Models\\User', 93, 'auth_token', '33b8ea4b3617e53de3ba0e4d7d2fecdc030e33d3e7fccddcf8f13bdf5f5d4676', '[\"*\"]', '2024-07-31 15:27:07', '2024-07-31 15:25:12', '2024-07-31 15:27:07'),
(235, 'App\\Models\\User', 53, 'auth_token', '4634b0a4afea8385cadecfe772b293aa77c6a36e1b7a91f40d96e80d956bf64e', '[\"*\"]', '2024-07-31 17:06:08', '2024-07-31 17:04:59', '2024-07-31 17:06:08'),
(236, 'App\\Models\\User', 94, 'auth_token', '167d9c81435aa29b7e041ed2066d86ed06823365cea7a19d142d50bce0fdfc46', '[\"*\"]', NULL, '2024-07-31 17:34:27', '2024-07-31 17:34:27'),
(237, 'App\\Models\\User', 94, 'auth_token', 'd09c78285699d679c3f55c90f4f2605f4bd169fa9ec1f31a5563320c7f483bf1', '[\"*\"]', '2024-08-01 22:04:17', '2024-07-31 17:35:11', '2024-08-01 22:04:17'),
(238, 'App\\Models\\User', 95, 'auth_token', '1d98b7b0c46f5cad802d28d51d07de52201c98801d7ec169448557d966a3e48d', '[\"*\"]', NULL, '2024-08-01 01:13:14', '2024-08-01 01:13:14'),
(239, 'App\\Models\\User', 96, 'auth_token', 'c8987c12126a5208fa235f55fcb96b4b29c72c16302103802a8088ffb105fa33', '[\"*\"]', NULL, '2024-08-01 22:19:25', '2024-08-01 22:19:25'),
(240, 'App\\Models\\User', 96, 'auth_token', '50612e1fcfd7d21911fca83771c352b91c8de98850b9b35f720236499e980ece', '[\"*\"]', '2024-08-01 22:21:44', '2024-08-01 22:19:55', '2024-08-01 22:21:44'),
(241, 'App\\Models\\User', 97, 'auth_token', '27972a87dcd2355ddf101989a609987113b4cb06e0b173dc33d9829bd817c5c0', '[\"*\"]', NULL, '2024-08-02 13:52:55', '2024-08-02 13:52:55'),
(242, 'App\\Models\\User', 97, 'auth_token', 'c205bc6cc56d0ee64f1e32bb9253c99f33cf0e6c4202fae65f2f526c7f2218c5', '[\"*\"]', '2024-08-05 16:28:41', '2024-08-02 13:53:24', '2024-08-05 16:28:41'),
(243, 'App\\Models\\User', 29, 'auth_token', 'ce50dd503430984a31dbbc493849724fc85fa1b0d6ff0aa3c46e6f3f79d4e307', '[\"*\"]', '2024-08-03 22:23:25', '2024-08-03 21:05:21', '2024-08-03 22:23:25'),
(244, 'App\\Models\\User', 29, 'auth_token', '46ef9e1d066c8c3d96997082d746c4ae0493a9c8e977a77130070d0da3a7bc5b', '[\"*\"]', '2024-08-04 23:13:01', '2024-08-03 22:27:43', '2024-08-04 23:13:01'),
(245, 'App\\Models\\User', 29, 'auth_token', '8cfcab6b6c35eac01ba8db04c6fb18052e12485a208348870cf5de96da19c1b2', '[\"*\"]', '2024-08-07 03:30:01', '2024-08-04 23:24:26', '2024-08-07 03:30:01'),
(246, 'App\\Models\\User', 29, 'auth_token', '758e910b54afa71751ea9635fb798ea7bde164ca8deaf906e0d21f2f8a2a04d5', '[\"*\"]', '2024-08-08 01:17:17', '2024-08-07 03:30:48', '2024-08-08 01:17:17');

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `distance_unit` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'km' COMMENT 'km,mile',
  `coordinates` polygon DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  `timezone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'UTC',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `regions`
--

INSERT INTO `regions` (`id`, `name`, `distance_unit`, `coordinates`, `status`, `timezone`, `created_at`, `updated_at`) VALUES
(1, 'Central Karachi', 'km', 0x0000000001030000000100000005000000aafbfdc5cfc850408d3bf88336e53840d89b03ee95cb5040d985ee0a72e53840d81bfc157dcb50403b5941b357dd3840cdfbfd8938c950409a82bda0f1dc3840aafbfdc5cfc850408d3bf88336e53840, 1, 'Asia/Karachi', '2024-07-10 13:07:41', '2024-07-12 11:14:05'),
(2, 'karachi', 'km', 0x0000000001030000000100000005000000d5149c670da4504034e2088ba00a3940d5149c67f5bb5040480449803f6c3840b1149c67efee504039e9a2f711013940b1149c6727c6504086e79d2a2f3e3940d5149c670da4504034e2088ba00a3940, 1, 'Asia/Karachi', '2024-07-10 13:11:30', '2024-07-29 16:20:03'),
(3, 'Bahdurabad', 'km', 0x00000000010300000001000000050000006946c8ebddba50407036d849c0e638404646c8ebc3c550407036d849c0e638403446c8ebf0c55040fd2fa9023bcd38403446c8ebb0ba5040bb554a1656d238406946c8ebddba50407036d849c0e63840, 1, 'Asia/Karachi', '2024-07-11 00:01:24', '2024-07-11 00:01:24'),
(4, 'PECHS', 'km', 0x000000000103000000010000000600000012cad5770dc35040ee989d0038e038400bcad5d76fc45040566837e632e0384008cad5076dc450404c7185618fd938400dcad5c7ccc25040a269371cb3d93840eec9d5ffd0c250408d40346a4ce0384012cad5770dc35040ee989d0038e03840, 1, 'Asia/Karachi', '2024-07-13 21:28:20', '2024-07-27 23:37:35');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint UNSIGNED NOT NULL,
  `driver_id` bigint UNSIGNED DEFAULT NULL,
  `rider_id` bigint UNSIGNED DEFAULT NULL,
  `ride_request_id` bigint UNSIGNED DEFAULT NULL,
  `driver_rating` double DEFAULT '0',
  `rider_rating` double DEFAULT '0',
  `driver_review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rider_review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ride_requests`
--

CREATE TABLE `ride_requests` (
  `id` bigint UNSIGNED NOT NULL,
  `rider_id` bigint UNSIGNED DEFAULT NULL,
  `service_id` bigint UNSIGNED DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `is_schedule` tinyint(1) DEFAULT '0' COMMENT '0-regular, 1-schedule',
  `ride_attempt` int DEFAULT '0',
  `distance_unit` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_amount` double DEFAULT '0',
  `subtotal` double DEFAULT '0',
  `extra_charges_amount` double DEFAULT '0',
  `driver_id` bigint UNSIGNED DEFAULT NULL,
  `riderequest_in_driver_id` bigint UNSIGNED DEFAULT NULL,
  `riderequest_in_datetime` datetime DEFAULT NULL,
  `start_latitude` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_longitude` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `end_latitude` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_longitude` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `distance` double DEFAULT NULL,
  `base_distance` double DEFAULT NULL,
  `duration` double DEFAULT NULL,
  `seat_count` double DEFAULT NULL,
  `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `base_fare` double DEFAULT NULL,
  `minimum_fare` double DEFAULT NULL,
  `per_distance` double DEFAULT NULL,
  `per_distance_charge` double DEFAULT NULL,
  `per_minute_drive` double DEFAULT NULL,
  `per_minute_drive_charge` double DEFAULT NULL,
  `extra_charges` json DEFAULT NULL,
  `coupon_discount` double DEFAULT NULL,
  `coupon_code` bigint UNSIGNED DEFAULT NULL,
  `coupon_data` json DEFAULT NULL,
  `otp` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancel_by` enum('rider','driver','auto') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancelation_charges` double DEFAULT NULL,
  `waiting_time` double DEFAULT NULL,
  `waiting_time_limit` double DEFAULT NULL,
  `tips` double DEFAULT NULL,
  `per_minute_waiting` double DEFAULT NULL,
  `per_minute_waiting_charge` double DEFAULT NULL,
  `payment_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_driver_rated` tinyint(1) DEFAULT '0',
  `is_rider_rated` tinyint(1) DEFAULT '0',
  `cancelled_driver_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `service_data` json DEFAULT NULL,
  `max_time_for_find_driver_for_ride_request` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_ride_for_other` tinyint(1) DEFAULT '0' COMMENT '0-self, 1-other',
  `other_rider_data` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ride_requests`
--

INSERT INTO `ride_requests` (`id`, `rider_id`, `service_id`, `datetime`, `is_schedule`, `ride_attempt`, `distance_unit`, `total_amount`, `subtotal`, `extra_charges_amount`, `driver_id`, `riderequest_in_driver_id`, `riderequest_in_datetime`, `start_latitude`, `start_longitude`, `start_address`, `end_latitude`, `end_longitude`, `end_address`, `distance`, `base_distance`, `duration`, `seat_count`, `reason`, `status`, `base_fare`, `minimum_fare`, `per_distance`, `per_distance_charge`, `per_minute_drive`, `per_minute_drive_charge`, `extra_charges`, `coupon_discount`, `coupon_code`, `coupon_data`, `otp`, `cancel_by`, `cancelation_charges`, `waiting_time`, `waiting_time_limit`, `tips`, `per_minute_waiting`, `per_minute_waiting_charge`, `payment_type`, `is_driver_rated`, `is_rider_rated`, `cancelled_driver_ids`, `service_data`, `max_time_for_find_driver_for_ride_request`, `created_at`, `updated_at`, `is_ride_for_other`, `other_rider_data`) VALUES
(4, 11, 1, '2024-07-10 22:06:12', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.86044', '67.0604296', 'V366+562, PECHS, Karachi, Sindh , Pakistan', '24.8904129', '67.0911409', 'Karsaz Faisal Cantonment, Karachi, Pakistan', NULL, NULL, NULL, 4, 'Pick up time taking too long', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rider', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, NULL, '2024-07-11 00:06:13', '2024-07-11 00:06:41', 0, NULL),
(5, 11, 1, '2024-07-10 22:08:21', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.8606317', '67.060468', 'Plot 1901 B, PECHS, Karachi, Sindh , Pakistan', '24.8805437', '67.1559336', 'Shah Faisal Colony 3 Shah Faisal Colony, Karachi, Pakistan', NULL, NULL, NULL, 4, 'Driver asked me to cancel', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rider', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, NULL, '2024-07-11 00:08:22', '2024-07-11 00:08:50', 0, NULL),
(6, 11, 1, '2024-07-10 22:09:22', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.8602803', '67.0601514', 'Shahrah-e-Faisal Road, PECHS, Karachi, Sindh , Pakistan', '24.8805437', '67.1559336', 'Shah Faisal Colony 3 Shah Faisal Colony, Karachi, Pakistan', NULL, NULL, NULL, 4, 'mujhy nahi jana', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rider', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, 180, '2024-07-11 00:09:23', '2024-07-11 00:11:36', 0, NULL),
(7, 11, 1, '2024-07-10 22:14:08', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.8602023', '67.0600285', '1881 A, PECHS, Karachi, Sindh , Pakistan', '24.8773062', '67.1591053', 'Shah Faisal Colony, Karachi, Pakistan', NULL, NULL, NULL, 4, 'Driver asked me to cancel', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rider', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, NULL, '2024-07-11 00:14:09', '2024-07-11 00:14:24', 0, NULL),
(8, 12, 1, '2024-07-11 20:11:52', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.8603401', '67.0600157', '75400, PECHS, Karachi, Sindh , Pakistan', '24.8805437', '67.1559336', 'Shah Faisal Colony 3 Shah Faisal Colony, Karachi, Pakistan', NULL, NULL, NULL, 4, 'Driver going wrong direction', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rider', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, 240, '2024-07-11 22:11:53', '2024-07-11 22:13:21', 0, NULL),
(9, 13, 1, '2024-07-11 20:17:28', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.8603458', '67.0600475', '75400, PECHS, Karachi, Sindh , Pakistan', '24.8805437', '67.1559336', 'Shah Faisal Colony 3 Shah Faisal Colony, Karachi, Pakistan', NULL, NULL, NULL, 4, 'Ride is auto cancelled', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'auto', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, 0, '2024-07-11 22:17:29', '2024-07-11 22:22:38', 0, NULL),
(10, 13, 1, '2024-07-11 20:49:17', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.8602809', '67.0598205', '1881 A, PECHS, Karachi, Sindh , Pakistan', '24.8805437', '67.1559336', 'Shah Faisal Colony 3 Shah Faisal Colony, Karachi, Pakistan', NULL, NULL, NULL, 4, 'Pick up time taking too long', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rider', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, NULL, '2024-07-11 22:49:18', '2024-07-11 22:49:37', 0, NULL),
(11, 13, 1, '2024-07-11 20:51:00', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.8602558', '67.0600944', '1881 A, PECHS, Karachi, Sindh , Pakistan', '24.8603079', '67.0600588', 'Humera Centre, Suite B-11 1st Floor Plot # 188/ 1-A, Shahrah-e-Faisal Rd, Block 2 P.E.C.H.S., Karachi, Karachi City, Sindh, Pakistan', NULL, NULL, NULL, 4, 'Driver asked me to cancel', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rider', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, 180, '2024-07-11 22:51:01', '2024-07-11 22:53:26', 0, NULL),
(12, 13, 1, '2024-07-11 20:54:09', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.860225', '67.0599742', 'Hill Park, PECHS, Karachi, Sindh , Pakistan', '24.8871906', '67.1337822', 'Shahrah-e-Faisal Road, Faisal Cantonment, Karachi, Pakistan', NULL, NULL, NULL, 4, 'Ride is auto cancelled', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'auto', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, 0, '2024-07-11 22:54:10', '2024-07-11 22:59:19', 0, NULL),
(13, 2, 1, '2024-07-12 09:17:19', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.884293', '67.1552634', 'V5M4+Q4Q, Shah Faisal Colony, Karachi, Sindh , Pakistan', '24.8805437', '67.1559336', 'Shah Faisal Colony 3 Shah Faisal Colony, Karachi, Pakistan', NULL, NULL, NULL, 4, 'helo world', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rider', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, NULL, '2024-07-12 11:17:19', '2024-07-12 11:20:56', 0, NULL),
(15, 2, 2, '2024-07-13 19:44:07', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.8602909', '67.059881', '1881 A, PECHS, Karachi, Sindh , Pakistan', '24.8605766', '67.06433129999999', 'P.E.C.H.S Block 2 Block 2 Pakistan Employees Co-Operative Housing Society, Karachi, Pakistan', NULL, NULL, NULL, 4, 'Ride is auto cancelled', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'auto', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, 0, '2024-07-13 21:44:10', '2024-07-13 21:49:19', 0, NULL),
(16, 2, 2, '2024-07-13 20:25:07', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.8601183', '67.060065', '1881 A, PECHS, Karachi, Sindh , Pakistan', '24.8605766', '67.06433129999999', 'P.E.C.H.S Block 2 Block 2 Pakistan Employees Co-Operative Housing Society, Karachi, Pakistan', NULL, NULL, NULL, 4, 'hello word', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rider', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, NULL, '2024-07-13 22:25:11', '2024-07-13 22:26:12', 0, NULL),
(17, 2, 2, '2024-07-13 20:36:24', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.8603466', '67.059872', 'Block 2, PECHS, Karachi, Sindh , Pakistan', '24.8605766', '67.06433129999999', 'P.E.C.H.S Block 2 Block 2 Pakistan Employees Co-Operative Housing Society, Karachi, Pakistan', NULL, NULL, NULL, 4, 'Pick up time taking too long', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rider', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, NULL, '2024-07-13 22:36:25', '2024-07-13 22:37:09', 0, NULL),
(18, 2, 2, '2024-07-13 20:37:47', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.8603472', '67.0598698', 'Block 2, PECHS, Karachi, Sindh , Pakistan', '24.8605766', '67.06433129999999', 'P.E.C.H.S Block 2 Block 2 Pakistan Employees Co-Operative Housing Society, Karachi, Pakistan', NULL, NULL, NULL, 4, 'Ride is auto cancelled', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'auto', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, 60, '2024-07-13 22:37:49', '2024-07-13 22:43:09', 0, NULL),
(19, 2, 2, '2024-07-13 21:21:44', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.8619282', '67.0666224', '43/1-B, PECHS, Karachi, Sindh , Pakistan', '24.8605766', '67.06433129999999', 'P.E.C.H.S Block 2 Block 2 Pakistan Employees Co-Operative Housing Society, Karachi, Pakistan', NULL, NULL, NULL, 4, 'ff', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rider', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, 240, '2024-07-13 23:21:45', '2024-07-13 23:23:44', 0, NULL),
(20, 2, 2, '2024-07-13 21:25:32', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.8599367', '67.0601318', 'Main, PECHS, Karachi, Sindh , Pakistan', '24.8605766', '67.06433129999999', 'P.E.C.H.S Block 2 Block 2 Pakistan Employees Co-Operative Housing Society, Karachi, Pakistan', NULL, NULL, NULL, 4, 'Ride is auto cancelled', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'auto', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, 0, '2024-07-13 23:25:33', '2024-07-13 23:30:42', 0, NULL),
(21, 2, 2, '2024-07-13 22:19:21', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.8605766', '67.06433129999999', 'P.E.C.H.S Block 2 Block 2 Pakistan Employees Co-Operative Housing Society, Karachi, Pakistan', '24.8605766', '67.06433129999999', 'P.E.C.H.S Block 2 Block 2 Pakistan Employees Co-Operative Housing Society, Karachi, Pakistan', NULL, NULL, NULL, 4, 'Ride is auto cancelled', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'auto', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, 0, '2024-07-14 00:19:24', '2024-07-14 00:24:32', 0, NULL),
(22, 2, 2, '2024-07-13 22:35:51', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.8601768', '67.059885', 'Hill Park, PECHS, Karachi, Sindh , Pakistan', '24.8697222', '67.07055559999999', 'Hill Park, Block 6 Pakistan Employees Co-Operative Housing Society, Karachi, Pakistan', NULL, NULL, NULL, 4, 'Ride is auto cancelled', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'auto', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, 0, '2024-07-14 00:35:53', '2024-07-14 00:41:02', 0, NULL),
(24, 2, 1, '2024-07-14 01:10:37', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.8708716', '67.1775485', 'V5CG+9W3, Shah Faisal Colony, Shah Faisal Town, Sindh , Pakistan', '24.9403', '67.0760811', 'Plot R 1050, Block 17 Gulberg Town, Karachi, Pakistan', NULL, NULL, NULL, 4, 'Driver going wrong direction', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rider', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, NULL, '2024-07-14 03:10:39', '2024-07-14 03:10:59', 0, NULL),
(25, 2, 1, '2024-07-14 20:37:09', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.8834024', '67.1520043', '1 A, Shah Faisal Colony, Karachi, Sindh 75230, Pakistan', '24.912651', '67.1982933', 'Malir Cantt Check Post No 2, Malir Cantonment, Karachi, Pakistan', NULL, NULL, NULL, 4, 'Driver asked me to cancel', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rider', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, NULL, '2024-07-14 22:37:11', '2024-07-14 22:37:18', 0, NULL),
(26, 2, 1, '2024-07-14 20:38:42', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.8835623', '67.1523932', '145 A, Shah Faisal Colony, Karachi, Sindh 75230, Pakistan', '24.912651', '67.1982933', 'Malir Cantt Check Post No 2, Malir Cantonment, Karachi, Pakistan', NULL, NULL, NULL, 4, 'Driver asked me to cancel', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rider', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, NULL, '2024-07-14 22:38:44', '2024-07-14 22:38:58', 0, NULL),
(27, 2, 1, '2024-07-14 21:33:44', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.8708918', '67.1775284', 'V5CG+9W3, Shah Faisal Colony, Shah Faisal Town, Sindh , Pakistan', '24.8773062', '67.1591053', 'Shah Faisal Colony, Karachi, Pakistan', NULL, NULL, NULL, 4, 'Driver asked me to cancel', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rider', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, NULL, '2024-07-14 23:33:46', '2024-07-14 23:34:38', 0, NULL),
(28, 2, 1, '2024-07-14 22:01:51', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.8708823', '67.1775241', 'V5CG+9W3, Shah Faisal Colony, Shah Faisal Town, Sindh , Pakistan', '33.6903799', '72.9802883', 'Ahad Residences, Main Margalla Road, Al-Meher Colony Golra E-11, Islamabad, Pakistan', NULL, NULL, NULL, 4, 'Driver asked me to cancel', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rider', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, NULL, '2024-07-15 00:01:53', '2024-07-15 00:02:09', 0, NULL),
(29, 2, 1, '2024-07-14 22:04:39', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.8708821', '67.1775272', 'V5CG+9W3, Shah Faisal Colony, Shah Faisal Town, Sindh , Pakistan', '24.8773062', '67.1591053', 'Shah Faisal Colony, Karachi, Pakistan', NULL, NULL, NULL, 4, 'Ride is auto cancelled', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'auto', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, 0, '2024-07-15 00:04:41', '2024-07-15 00:09:42', 0, NULL),
(30, 2, 1, '2024-07-14 22:11:03', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.8708821', '67.1775282', 'V5CG+9W3, Shah Faisal Colony, Shah Faisal Town, Sindh , Pakistan', '24.8773062', '67.1591053', 'Shah Faisal Colony, Karachi, Pakistan', NULL, NULL, NULL, 4, 'Ride is auto cancelled', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'auto', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, 0, '2024-07-15 00:11:05', '2024-07-15 00:16:09', 0, NULL),
(43, 2, 3, '2024-07-15 21:00:45', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.8708734', '67.177542', 'Malir Cantt Check Post No 2, Malir Cantonment, Karachi, Pakistan', '24.8773062', '67.1591053', 'Shah Faisal Colony, Karachi, Pakistan', NULL, NULL, NULL, 1, 'Driver asked me to cancel', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rider', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, NULL, '2024-07-15 23:00:46', '2024-07-15 23:01:14', 1, '{\"name\": \"Rehman\", \"contact_number\": \"+92649464.49.4\"}'),
(44, 2, 3, '2024-07-17 12:41:11', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.8709033', '67.1775779', 'V5CG+9W3, Shah Faisal Colony, Shah Faisal Town, Sindh , Pakistan', '24.8708579', '67.1773357', 'V5CG+9W3, Gulistan E Malir Gulshan e Rafi Shah Faisal Colony, Shah Faisal Town, Karachi City, Sindh, Pakistan', NULL, NULL, NULL, 1, 'Pick up time taking too long', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rider', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, NULL, '2024-07-17 14:41:13', '2024-07-17 15:07:51', 0, NULL),
(45, 2, 3, '2024-07-17 13:23:23', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.870894', '67.1775758', 'V5CG+9W3, Shah Faisal Colony, Shah Faisal Town, Sindh , Pakistan', '24.8871906', '67.1337822', 'Shahrah-e-Faisal Road, Faisal Cantonment, Karachi, Pakistan', NULL, NULL, NULL, 1, 'Pick up time taking too long', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rider', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, 60, '2024-07-17 15:23:25', '2024-07-17 15:27:58', 0, NULL),
(58, 2, 1, '2024-07-22 17:54:20', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.8842716', '67.1552391', 'V5M4+Q4Q, Shah Faisal Colony, Karachi, Sindh , Pakistan', '24.8805437', '67.1559336', 'Shah Faisal Colony 3 Shah Faisal Colony, Karachi, Pakistan', NULL, NULL, NULL, 4, 'Ride is auto cancelled', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'auto', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, 0, '2024-07-22 19:54:22', '2024-07-22 19:59:23', 0, NULL),
(59, 2, 3, '2024-07-22 18:01:21', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.8842726', '67.1552383', 'V5M4+Q4Q, Shah Faisal Colony, Karachi, Sindh , Pakistan', '24.8871906', '67.1337822', 'Shahrah-e-Faisal Road, Faisal Cantonment, Karachi, Pakistan', NULL, NULL, NULL, 1, 'Ride is auto cancelled', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'auto', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, 0, '2024-07-22 20:01:26', '2024-07-22 20:06:27', 0, NULL),
(61, 2, 3, '2024-07-25 19:06:58', 0, 0, 'km', 90.698666666667, 0, 0, NULL, NULL, NULL, '24.8805437', '67.1559336', 'Block 3 Shah Faisal Colony 3 Shah Faisal Colony, Shah Faisal Town, Karachi City, Sindh, Pakistan', '24.8726093', '67.12837750000001', 'Block 5 Shah Faisal Colony 5 Shah Faisal Colony, Shah Faisal Town, Karachi City, Sindh, Pakistan', 3.524, NULL, 10.633333333333, NULL, 'Driver asked me to cancel', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rider', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, NULL, NULL, NULL, '2024-07-25 21:06:58', '2024-07-25 21:08:59', 0, NULL),
(66, 88, 2, '2024-07-27 18:37:55', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.8600826', '67.0600739', '1881 A, PECHS, Karachi, Sindh , Pakistan', '24.8605766', '67.06433129999999', 'P.E.C.H.S Block 2 Block 2 Pakistan Employees Co-Operative Housing Society, Karachi, Pakistan', NULL, NULL, NULL, 4, 'Driver going wrong direction', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rider', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, 240, '2024-07-27 20:37:56', '2024-07-27 20:42:34', 0, NULL),
(67, 88, 2, '2024-07-27 18:43:09', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.8601216', '67.0600741', '1881 A, PECHS, Karachi, Sindh , Pakistan', '24.8688044', '67.0613528', 'P.E.C.H.S., Karachi, Pakistan', NULL, NULL, NULL, 4, 'Driver asked me to cancel', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rider', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, NULL, '2024-07-27 20:43:11', '2024-07-27 20:59:10', 0, NULL),
(68, 88, 2, '2024-07-27 19:01:44', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.8600869', '67.0600751', '1881 A, PECHS, Karachi, Sindh , Pakistan', '24.8609289', '67.0597959', 'Plot 188 A, Block 2 P.E.C.H.S., Karachi, Karachi City, Sindh, Pakistan', NULL, NULL, NULL, 4, 'Driver asked me to cancel', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rider', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, NULL, '2024-07-27 21:01:45', '2024-07-27 21:03:49', 0, NULL),
(70, 88, 2, '2024-07-27 19:16:13', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.8594132', '67.0602238', 'V356+P3C, PECHS, Karachi, Sindh , Pakistan', '24.8688044', '67.0613528', 'P.E.C.H.S., Karachi, Pakistan', NULL, NULL, NULL, 4, 'Driver going wrong direction', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rider', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, 180, '2024-07-27 21:16:18', '2024-07-27 21:23:04', 0, NULL),
(71, 88, 2, '2024-07-27 19:26:20', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.8600841', '67.0600679', '1881 A, PECHS, Karachi, Sindh , Pakistan', '24.8605766', '67.06433129999999', 'P.E.C.H.S Block 2 Block 2 Pakistan Employees Co-Operative Housing Society, Karachi, Pakistan', NULL, NULL, NULL, 4, 'Pick up time taking too long', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rider', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, NULL, '2024-07-27 21:26:22', '2024-07-27 21:32:19', 0, NULL),
(72, 88, 2, '2024-07-27 19:33:39', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.8601001', '67.0601047', '1881 A, PECHS, Karachi, Sindh , Pakistan', '24.8605766', '67.06433129999999', 'P.E.C.H.S Block 2 Block 2 Pakistan Employees Co-Operative Housing Society, Karachi, Pakistan', NULL, NULL, NULL, 4, 'Pick up time taking too long', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rider', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, 240, '2024-07-27 21:33:41', '2024-07-27 21:42:54', 0, NULL),
(84, 88, 3, '2024-07-27 22:29:20', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.860085', '67.0600791', '1881 A, PECHS, Karachi, Sindh , Pakistan', '24.8605766', '67.06433129999999', 'P.E.C.H.S Block 2 Block 2 Pakistan Employees Co-Operative Housing Society, Karachi, Pakistan', NULL, NULL, NULL, 1, 'Pick up time taking too long', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rider', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, NULL, '2024-07-28 00:29:22', '2024-07-28 00:30:15', 0, NULL),
(85, 88, 2, '2024-07-27 22:30:49', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.8600793', '67.0600555', '1881 A, PECHS, Karachi, Sindh , Pakistan', '24.8602729', '67.0599818', '1881 A, Block 2 P.E.C.H.S., Karachi, Karachi City, Sindh, Pakistan', NULL, NULL, NULL, 4, 'Driver asked me to cancel', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rider', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, NULL, '2024-07-28 00:30:51', '2024-07-28 00:33:45', 0, NULL),
(86, 88, 3, '2024-07-27 22:39:48', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.8600812', '67.0600791', '1881 A, PECHS, Karachi, Sindh , Pakistan', '24.8688044', '67.0613528', 'P.E.C.H.S., Karachi, Pakistan', NULL, NULL, NULL, 1, 'Pick up time taking too long', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rider', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, NULL, '2024-07-28 00:39:49', '2024-07-28 00:48:11', 0, NULL),
(87, 88, 3, '2024-07-27 22:48:50', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.8602517', '67.0600433', '1881 A, PECHS, Karachi, Sindh , Pakistan', '24.8605766', '67.06433129999999', 'P.E.C.H.S Block 2 Block 2 Pakistan Employees Co-Operative Housing Society, Karachi, Pakistan', NULL, NULL, NULL, 1, 'Driver going wrong direction', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rider', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, NULL, '2024-07-28 00:48:52', '2024-07-28 00:49:10', 0, NULL),
(88, 88, 3, '2024-07-27 22:49:33', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.8600826', '67.0600781', '1881 A, PECHS, Karachi, Sindh , Pakistan', '24.8605766', '67.06433129999999', 'P.E.C.H.S Block 2 Block 2 Pakistan Employees Co-Operative Housing Society, Karachi, Pakistan', NULL, NULL, NULL, 1, 'Pick up time taking too long', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rider', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, NULL, '2024-07-28 00:49:35', '2024-07-28 00:50:19', 0, NULL),
(89, 88, 3, '2024-07-27 22:54:59', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.8600931', '67.0600827', '1881 A, PECHS, Karachi, Sindh , Pakistan', '24.8605766', '67.06433129999999', 'P.E.C.H.S Block 2 Block 2 Pakistan Employees Co-Operative Housing Society, Karachi, Pakistan', NULL, NULL, NULL, 1, 'Pick up time taking too long', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rider', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, NULL, '2024-07-28 00:55:01', '2024-07-28 00:55:24', 0, NULL),
(90, 88, 2, '2024-07-27 22:55:45', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.8600788', '67.0600807', '1881 A, PECHS, Karachi, Sindh , Pakistan', '24.8605766', '67.06433129999999', 'P.E.C.H.S Block 2 Block 2 Pakistan Employees Co-Operative Housing Society, Karachi, Pakistan', NULL, NULL, NULL, 4, 'Pick up time taking too long', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rider', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, NULL, '2024-07-28 00:55:47', '2024-07-28 00:56:07', 0, NULL),
(97, 3, 5, '2024-07-28 03:45:36', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.8843162', '67.155268', 'V5M4+Q4Q, Shah Faisal Colony, Karachi, Sindh , Pakistan', '24.8726093', '67.12837750000001', 'Shah Faisal Colony 5 Shah Faisal Colony, Karachi, Pakistan', NULL, NULL, NULL, 3, 'Pick up time taking too long', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rider', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, NULL, '2024-07-28 05:45:49', '2024-07-28 05:59:05', 0, NULL),
(98, 3, 5, '2024-07-28 03:59:32', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.8842625', '67.1552444', 'V5M4+Q4Q, Shah Faisal Colony, Karachi, Sindh , Pakistan', '24.8726093', '67.12837750000001', 'Shah Faisal Colony 5 Shah Faisal Colony, Karachi, Pakistan', NULL, NULL, NULL, 3, 'Driver asked me to cancel', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rider', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, NULL, '2024-07-28 05:59:35', '2024-07-28 06:05:37', 0, NULL),
(99, 3, 6, '2024-07-28 04:06:57', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.884261', '67.1552477', 'V5M4+Q4Q, Shah Faisal Colony, Karachi, Sindh , Pakistan', '24.8726093', '67.12837750000001', 'Shah Faisal Colony 5 Shah Faisal Colony, Karachi, Pakistan', NULL, NULL, NULL, 1, 'Driver asked me to cancel', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rider', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, NULL, '2024-07-28 06:07:00', '2024-07-28 06:25:19', 0, NULL),
(100, 3, 5, '2024-07-28 04:30:17', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.8842648', '67.1552474', 'V5M4+Q4Q, Shah Faisal Colony, Karachi, Sindh , Pakistan', '24.8726093', '67.12837750000001', 'Shah Faisal Colony 5 Shah Faisal Colony, Karachi, Pakistan', NULL, NULL, NULL, 3, 'Ride is auto cancelled', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'auto', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, NULL, '2024-07-28 06:30:19', '2024-07-28 06:48:00', 0, NULL),
(113, 3, 3, '2024-07-29 18:25:24', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.8600864', '67.0600694', '1881 A, PECHS, Karachi, Sindh , Pakistan', '24.8602241', '67.0607101', 'Blue Ribbon Bakery, Nursery، Shahrah-e-Faisal Service Road South, Block 2 P.E.C.H.S., Karachi, Pakistan', NULL, NULL, NULL, 1, 'Pick up time taking too long', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rider', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, NULL, '2024-07-29 20:25:26', '2024-07-29 20:26:16', 0, NULL),
(114, 3, 3, '2024-07-29 18:30:38', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.8600774', '67.0600878', '1881 A, PECHS, Karachi, Sindh , Pakistan', '24.8602241', '67.0607101', 'Blue Ribbon Bakery, Nursery، Shahrah-e-Faisal Service Road South, Block 2 P.E.C.H.S., Karachi, Pakistan', NULL, NULL, NULL, 1, 'Pick up time taking too long', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rider', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, NULL, '2024-07-29 20:30:40', '2024-07-29 20:31:04', 0, NULL),
(115, 3, 3, '2024-07-29 18:31:46', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.860082', '67.0600744', '1881 A, PECHS, Karachi, Sindh , Pakistan', '24.8602241', '67.0607101', 'Blue Ribbon Bakery, Nursery، Shahrah-e-Faisal Service Road South, Block 2 P.E.C.H.S., Karachi, Pakistan', NULL, NULL, NULL, 1, 'Ride is auto cancelled', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'auto', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, 30, '2024-07-29 20:31:48', '2024-07-29 20:34:21', 0, NULL),
(123, 29, 1, '2024-07-29 20:40:39', 0, 0, 'km', 0, 0, 0, NULL, 29, '2024-07-29 15:40:43', '24.8708781', '67.1775789', 'V5CG+6WH, Shah Faisal Colony, Karachi, Sindh , Pakistan', '24.8773062', '67.1591053', 'Shah Faisal Colony, Karachi, Pakistan', NULL, NULL, NULL, 4, 'Driver asked me to cancel', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rider', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, NULL, '2024-07-29 22:40:43', '2024-07-29 22:41:35', 0, NULL),
(124, 29, 1, '2024-07-29 21:05:14', 0, 0, 'km', 0, 0, 0, NULL, 29, '2024-07-29 16:05:17', '24.8708744', '67.1776056', 'V5CG+6WH, Shah Faisal Colony, Karachi, Sindh , Pakistan', '24.8773062', '67.1591053', 'Shah Faisal Colony, Karachi, Pakistan', NULL, NULL, NULL, 4, 'Pick up time taking too long', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rider', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, NULL, '2024-07-29 23:05:17', '2024-07-29 23:05:45', 0, NULL),
(128, 3, 1, '2024-07-29 23:31:26', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.8788086', '67.0675939', '15, Bahadur Yar Jang CHS, Karachi, Sindh , Pakistan', '24.8805437', '67.1559336', 'Shah Faisal Colony 3 Shah Faisal Colony, Karachi, Pakistan', NULL, NULL, NULL, 4, 'Driver asked me to cancel', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rider', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, 90, '2024-07-30 01:31:28', '2024-07-30 01:32:42', 0, NULL),
(130, 29, 1, '2024-07-30 10:13:45', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.931289', '67.0953639', '55, Gulshan-e-Iqbal, Karachi, Sindh 75300, Pakistan', '24.917218', '67.0923866', 'Gulshan-e-Iqbal, Karachi, Pakistan', NULL, NULL, NULL, 4, 'Pick up time taking too long', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rider', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, 30, '2024-07-30 12:13:47', '2024-07-30 12:26:30', 0, NULL),
(131, 29, 1, '2024-07-30 10:29:16', 0, 0, 'km', 0, 0, 0, NULL, 29, '2024-07-30 05:29:18', '24.9312831', '67.095366', '55, Gulshan-e-Iqbal, Karachi, Sindh 75300, Pakistan', '24.917218', '67.0923866', 'Gulshan-e-Iqbal, Karachi, Pakistan', NULL, NULL, NULL, 4, 'Driver asked me to cancel', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rider', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, 30, '2024-07-30 12:29:18', '2024-07-30 12:31:28', 0, NULL),
(134, 3, 2, '2024-07-30 19:19:50', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.8600217', '67.0601467', 'Main, PECHS, Karachi, Sindh , Pakistan', '24.8602241', '67.0607101', 'Blue Ribbon Bakery, Nursery، Shahrah-e-Faisal Service Road South, Block 2 P.E.C.H.S., Karachi, Pakistan', NULL, NULL, NULL, 4, 'Pick up time taking too long', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rider', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, 90, '2024-07-30 21:19:50', '2024-07-30 21:21:13', 0, NULL),
(148, 29, 1, '2024-07-30 23:17:28', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.8708619', '67.1775783', 'V5CG+9W3, Shah Faisal Colony, Shah Faisal Town, Sindh , Pakistan', '24.8773062', '67.1591053', 'Shah Faisal Colony, Karachi, Pakistan', NULL, NULL, NULL, 4, 'Ride is auto cancelled', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'auto', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, 30, '2024-07-31 01:17:28', '2024-07-31 01:20:00', 0, NULL),
(149, 29, 1, '2024-07-31 20:01:47', 0, 0, 'km', 0, 0, 0, NULL, NULL, NULL, '24.8708742', '67.1778277', 'V5CG+6WH, Shah Faisal Colony, Karachi, Sindh , Pakistan', '24.8773062', '67.1591053', 'Shah Faisal Colony, Karachi, Pakistan', NULL, NULL, NULL, 4, 'Ride is auto cancelled', 'canceled', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'auto', NULL, NULL, NULL, NULL, NULL, NULL, 'cash', 0, 0, '[]', NULL, 30, '2024-07-31 22:01:49', '2024-07-31 22:04:20', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ride_request_histories`
--

CREATE TABLE `ride_request_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `ride_request_id` bigint UNSIGNED NOT NULL,
  `datetime` datetime DEFAULT NULL,
  `history_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `history_message` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `history_data` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ride_request_histories`
--

INSERT INTO `ride_request_histories` (`id`, `ride_request_id`, `datetime`, `history_type`, `history_message`, `history_data`, `created_at`, `updated_at`) VALUES
(8, 4, '2024-07-10 17:06:13', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 11, \"rider_name\": \"test2 test2\"}', '2024-07-11 00:06:13', '2024-07-11 00:06:13'),
(9, 4, '2024-07-10 17:06:41', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 11, \"cancel_by\": \"rider\", \"rider_name\": \"test2 test2\"}', '2024-07-11 00:06:41', '2024-07-11 00:06:41'),
(11, 5, '2024-07-10 17:08:22', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 11, \"rider_name\": \"test2 test2\"}', '2024-07-11 00:08:22', '2024-07-11 00:08:22'),
(12, 5, '2024-07-10 17:08:43', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 11, \"cancel_by\": \"rider\", \"rider_name\": \"test2 test2\"}', '2024-07-11 00:08:43', '2024-07-11 00:08:43'),
(13, 5, '2024-07-10 17:08:45', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 11, \"cancel_by\": \"rider\", \"rider_name\": \"test2 test2\"}', '2024-07-11 00:08:45', '2024-07-11 00:08:45'),
(14, 5, '2024-07-10 17:08:46', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 11, \"cancel_by\": \"rider\", \"rider_name\": \"test2 test2\"}', '2024-07-11 00:08:46', '2024-07-11 00:08:46'),
(15, 5, '2024-07-10 17:08:46', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 11, \"cancel_by\": \"rider\", \"rider_name\": \"test2 test2\"}', '2024-07-11 00:08:46', '2024-07-11 00:08:46'),
(16, 5, '2024-07-10 17:08:47', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 11, \"cancel_by\": \"rider\", \"rider_name\": \"test2 test2\"}', '2024-07-11 00:08:47', '2024-07-11 00:08:47'),
(17, 5, '2024-07-10 17:08:47', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 11, \"cancel_by\": \"rider\", \"rider_name\": \"test2 test2\"}', '2024-07-11 00:08:47', '2024-07-11 00:08:47'),
(18, 5, '2024-07-10 17:08:47', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 11, \"cancel_by\": \"rider\", \"rider_name\": \"test2 test2\"}', '2024-07-11 00:08:47', '2024-07-11 00:08:47'),
(19, 5, '2024-07-10 17:08:47', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 11, \"cancel_by\": \"rider\", \"rider_name\": \"test2 test2\"}', '2024-07-11 00:08:47', '2024-07-11 00:08:47'),
(20, 5, '2024-07-10 17:08:47', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 11, \"cancel_by\": \"rider\", \"rider_name\": \"test2 test2\"}', '2024-07-11 00:08:47', '2024-07-11 00:08:47'),
(21, 6, '2024-07-10 17:09:23', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 11, \"rider_name\": \"test2 test2\"}', '2024-07-11 00:09:23', '2024-07-11 00:09:23'),
(22, 6, '2024-07-10 17:11:31', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 11, \"cancel_by\": \"rider\", \"rider_name\": \"test2 test2\"}', '2024-07-11 00:11:31', '2024-07-11 00:11:31'),
(23, 6, '2024-07-10 17:11:33', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 11, \"cancel_by\": \"rider\", \"rider_name\": \"test2 test2\"}', '2024-07-11 00:11:33', '2024-07-11 00:11:33'),
(24, 7, '2024-07-10 17:14:09', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 11, \"rider_name\": \"test2 test2\"}', '2024-07-11 00:14:09', '2024-07-11 00:14:09'),
(25, 7, '2024-07-10 17:14:24', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 11, \"cancel_by\": \"rider\", \"rider_name\": \"test2 test2\"}', '2024-07-11 00:14:24', '2024-07-11 00:14:24'),
(26, 7, '2024-07-10 17:14:25', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 11, \"cancel_by\": \"rider\", \"rider_name\": \"test2 test2\"}', '2024-07-11 00:14:25', '2024-07-11 00:14:25'),
(27, 8, '2024-07-11 15:11:53', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 12, \"rider_name\": \"User check\"}', '2024-07-11 22:11:53', '2024-07-11 22:11:53'),
(28, 8, '2024-07-11 15:13:16', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 12, \"cancel_by\": \"rider\", \"rider_name\": \"User check\"}', '2024-07-11 22:13:16', '2024-07-11 22:13:16'),
(29, 8, '2024-07-11 15:13:18', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 12, \"cancel_by\": \"rider\", \"rider_name\": \"User check\"}', '2024-07-11 22:13:18', '2024-07-11 22:13:18'),
(30, 9, '2024-07-11 15:17:29', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 13, \"rider_name\": \"Test3 test3\"}', '2024-07-11 22:17:29', '2024-07-11 22:17:29'),
(31, 9, '2024-07-11 15:22:34', 'canceled', 'The ride is canceled.', '{\"rider_id\": 13, \"cancel_by\": \"auto\", \"rider_name\": \"Test3 test3\"}', '2024-07-11 22:22:34', '2024-07-11 22:22:34'),
(32, 10, '2024-07-11 15:49:18', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 13, \"rider_name\": \"Test3 test3\"}', '2024-07-11 22:49:18', '2024-07-11 22:49:18'),
(33, 10, '2024-07-11 15:49:33', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 13, \"cancel_by\": \"rider\", \"rider_name\": \"Test3 test3\"}', '2024-07-11 22:49:33', '2024-07-11 22:49:33'),
(34, 11, '2024-07-11 15:51:01', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 13, \"rider_name\": \"Test3 test3\"}', '2024-07-11 22:51:01', '2024-07-11 22:51:01'),
(35, 11, '2024-07-11 15:53:23', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 13, \"cancel_by\": \"rider\", \"rider_name\": \"Test3 test3\"}', '2024-07-11 22:53:23', '2024-07-11 22:53:23'),
(36, 11, '2024-07-11 15:53:27', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 13, \"cancel_by\": \"rider\", \"rider_name\": \"Test3 test3\"}', '2024-07-11 22:53:27', '2024-07-11 22:53:27'),
(37, 12, '2024-07-11 15:54:10', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 13, \"rider_name\": \"Test3 test3\"}', '2024-07-11 22:54:10', '2024-07-11 22:54:10'),
(38, 12, '2024-07-11 15:59:15', 'canceled', 'The ride is canceled.', '{\"rider_id\": 13, \"cancel_by\": \"auto\", \"rider_name\": \"Test3 test3\"}', '2024-07-11 22:59:15', '2024-07-11 22:59:15'),
(39, 13, '2024-07-12 04:17:19', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 2, \"rider_name\": \"Mohammad Shaheryar\"}', '2024-07-12 11:17:19', '2024-07-12 11:17:19'),
(40, 13, '2024-07-12 04:20:52', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 2, \"cancel_by\": \"rider\", \"rider_name\": \"Mohammad Shaheryar\"}', '2024-07-12 11:20:52', '2024-07-12 11:20:52'),
(42, 15, '2024-07-13 14:44:10', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 2, \"rider_name\": \"Mohammad Shaheryar\"}', '2024-07-13 21:44:10', '2024-07-13 21:44:10'),
(43, 15, '2024-07-13 14:49:15', 'canceled', 'The ride is canceled.', '{\"rider_id\": 2, \"cancel_by\": \"auto\", \"rider_name\": \"Mohammad Shaheryar\"}', '2024-07-13 21:49:15', '2024-07-13 21:49:15'),
(44, 16, '2024-07-13 15:25:11', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 2, \"rider_name\": \"Mohammad Shaheryar\"}', '2024-07-13 22:25:11', '2024-07-13 22:25:11'),
(45, 16, '2024-07-13 15:26:08', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 2, \"cancel_by\": \"rider\", \"rider_name\": \"Mohammad Shaheryar\"}', '2024-07-13 22:26:08', '2024-07-13 22:26:08'),
(46, 17, '2024-07-13 15:36:25', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 2, \"rider_name\": \"Mohammad Shaheryar\"}', '2024-07-13 22:36:25', '2024-07-13 22:36:25'),
(47, 17, '2024-07-13 15:37:03', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 2, \"cancel_by\": \"rider\", \"rider_name\": \"Mohammad Shaheryar\"}', '2024-07-13 22:37:03', '2024-07-13 22:37:03'),
(48, 17, '2024-07-13 15:37:05', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 2, \"cancel_by\": \"rider\", \"rider_name\": \"Mohammad Shaheryar\"}', '2024-07-13 22:37:05', '2024-07-13 22:37:05'),
(49, 18, '2024-07-13 15:37:49', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 2, \"rider_name\": \"Mohammad Shaheryar\"}', '2024-07-13 22:37:49', '2024-07-13 22:37:49'),
(50, 18, '2024-07-13 15:43:04', 'canceled', 'The ride is canceled.', '{\"rider_id\": 2, \"cancel_by\": \"auto\", \"rider_name\": \"Mohammad Shaheryar\"}', '2024-07-13 22:43:04', '2024-07-13 22:43:04'),
(51, 19, '2024-07-13 16:21:45', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 2, \"rider_name\": \"Mohammad Shaheryar\"}', '2024-07-13 23:21:45', '2024-07-13 23:21:45'),
(52, 19, '2024-07-13 16:23:40', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 2, \"cancel_by\": \"rider\", \"rider_name\": \"Mohammad Shaheryar\"}', '2024-07-13 23:23:40', '2024-07-13 23:23:40'),
(53, 20, '2024-07-13 16:25:33', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 2, \"rider_name\": \"Mohammad Shaheryar\"}', '2024-07-13 23:25:33', '2024-07-13 23:25:33'),
(54, 20, '2024-07-13 16:30:38', 'canceled', 'The ride is canceled.', '{\"rider_id\": 2, \"cancel_by\": \"auto\", \"rider_name\": \"Mohammad Shaheryar\"}', '2024-07-13 23:30:38', '2024-07-13 23:30:38'),
(55, 21, '2024-07-13 17:19:24', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 2, \"rider_name\": \"Mohammad Shaheryar\"}', '2024-07-14 00:19:24', '2024-07-14 00:19:24'),
(56, 21, '2024-07-13 17:24:29', 'canceled', 'The ride is canceled.', '{\"rider_id\": 2, \"cancel_by\": \"auto\", \"rider_name\": \"Mohammad Shaheryar\"}', '2024-07-14 00:24:29', '2024-07-14 00:24:29'),
(57, 22, '2024-07-13 17:35:53', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 2, \"rider_name\": \"Mohammad Shaheryar\"}', '2024-07-14 00:35:53', '2024-07-14 00:35:53'),
(58, 22, '2024-07-13 17:40:59', 'canceled', 'The ride is canceled.', '{\"rider_id\": 2, \"cancel_by\": \"auto\", \"rider_name\": \"Mohammad Shaheryar\"}', '2024-07-14 00:40:59', '2024-07-14 00:40:59'),
(64, 24, '2024-07-13 20:10:39', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 2, \"rider_name\": \"Mohammad Shaheryar\"}', '2024-07-14 03:10:39', '2024-07-14 03:10:39'),
(65, 24, '2024-07-13 20:10:59', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 2, \"cancel_by\": \"rider\", \"rider_name\": \"Mohammad Shaheryar\"}', '2024-07-14 03:10:59', '2024-07-14 03:10:59'),
(66, 25, '2024-07-14 15:37:11', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 2, \"rider_name\": \"Mohammad Shaheryar\"}', '2024-07-14 22:37:11', '2024-07-14 22:37:11'),
(67, 25, '2024-07-14 15:37:18', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 2, \"cancel_by\": \"rider\", \"rider_name\": \"Mohammad Shaheryar\"}', '2024-07-14 22:37:18', '2024-07-14 22:37:18'),
(68, 26, '2024-07-14 15:38:44', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 2, \"rider_name\": \"Mohammad Shaheryar\"}', '2024-07-14 22:38:44', '2024-07-14 22:38:44'),
(69, 26, '2024-07-14 15:38:58', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 2, \"cancel_by\": \"rider\", \"rider_name\": \"Mohammad Shaheryar\"}', '2024-07-14 22:38:58', '2024-07-14 22:38:58'),
(70, 27, '2024-07-14 16:33:46', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 2, \"rider_name\": \"Mohammad Shaheryar\"}', '2024-07-14 23:33:46', '2024-07-14 23:33:46'),
(71, 27, '2024-07-14 16:34:38', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 2, \"cancel_by\": \"rider\", \"rider_name\": \"Mohammad Shaheryar\"}', '2024-07-14 23:34:38', '2024-07-14 23:34:38'),
(72, 28, '2024-07-14 17:01:53', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 2, \"rider_name\": \"Mohammad Shaheryar\"}', '2024-07-15 00:01:53', '2024-07-15 00:01:53'),
(73, 28, '2024-07-14 17:02:09', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 2, \"cancel_by\": \"rider\", \"rider_name\": \"Mohammad Shaheryar\"}', '2024-07-15 00:02:09', '2024-07-15 00:02:09'),
(74, 29, '2024-07-14 17:04:41', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 2, \"rider_name\": \"Mohammad Shaheryar\"}', '2024-07-15 00:04:41', '2024-07-15 00:04:41'),
(75, 29, '2024-07-14 17:09:42', 'canceled', 'The ride is canceled.', '{\"rider_id\": 2, \"cancel_by\": \"auto\", \"rider_name\": \"Mohammad Shaheryar\"}', '2024-07-15 00:09:42', '2024-07-15 00:09:42'),
(76, 30, '2024-07-14 17:11:05', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 2, \"rider_name\": \"Mohammad Shaheryar\"}', '2024-07-15 00:11:05', '2024-07-15 00:11:05'),
(77, 30, '2024-07-14 17:16:09', 'canceled', 'The ride is canceled.', '{\"rider_id\": 2, \"cancel_by\": \"auto\", \"rider_name\": \"Mohammad Shaheryar\"}', '2024-07-15 00:16:09', '2024-07-15 00:16:09'),
(109, 43, '2024-07-15 16:00:46', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 2, \"rider_name\": \"Mohammad Shaheryar\"}', '2024-07-15 23:00:46', '2024-07-15 23:00:46'),
(110, 43, '2024-07-15 16:01:14', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 2, \"cancel_by\": \"rider\", \"rider_name\": \"Mohammad Shaheryar\"}', '2024-07-15 23:01:14', '2024-07-15 23:01:14'),
(111, 44, '2024-07-17 07:41:13', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 2, \"rider_name\": \"Mohammad Shaheryar\"}', '2024-07-17 14:41:13', '2024-07-17 14:41:13'),
(112, 44, '2024-07-17 08:07:51', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 2, \"cancel_by\": \"rider\", \"rider_name\": \"Mohammad Shaheryar\"}', '2024-07-17 15:07:51', '2024-07-17 15:07:51'),
(113, 45, '2024-07-17 08:23:25', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 2, \"rider_name\": \"Mohammad Shaheryar\"}', '2024-07-17 15:23:25', '2024-07-17 15:23:25'),
(114, 45, '2024-07-17 08:27:58', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 2, \"cancel_by\": \"rider\", \"rider_name\": \"Mohammad Shaheryar\"}', '2024-07-17 15:27:58', '2024-07-17 15:27:58'),
(127, 58, '2024-07-22 12:54:22', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 2, \"rider_name\": \"Mohammad Shaheryar\"}', '2024-07-22 19:54:22', '2024-07-22 19:54:22'),
(128, 58, '2024-07-22 12:59:23', 'canceled', 'The ride is canceled.', '{\"rider_id\": 2, \"cancel_by\": \"auto\", \"rider_name\": \"Mohammad Shaheryar\"}', '2024-07-22 19:59:23', '2024-07-22 19:59:23'),
(129, 59, '2024-07-22 13:01:26', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 2, \"rider_name\": \"Mohammad Shaheryar\"}', '2024-07-22 20:01:26', '2024-07-22 20:01:26'),
(130, 59, '2024-07-22 13:06:27', 'canceled', 'The ride is canceled.', '{\"rider_id\": 2, \"cancel_by\": \"auto\", \"rider_name\": \"Mohammad Shaheryar\"}', '2024-07-22 20:06:27', '2024-07-22 20:06:27'),
(132, 61, '2024-07-25 14:06:58', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 2, \"rider_name\": \"Mohammad Shaheryar\"}', '2024-07-25 21:06:58', '2024-07-25 21:06:58'),
(133, 61, '2024-07-25 14:08:54', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 2, \"cancel_by\": \"rider\", \"rider_name\": \"Mohammad Shaheryar\"}', '2024-07-25 21:08:54', '2024-07-25 21:08:54'),
(134, 61, '2024-07-25 14:08:55', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 2, \"cancel_by\": \"rider\", \"rider_name\": \"Mohammad Shaheryar\"}', '2024-07-25 21:08:55', '2024-07-25 21:08:55'),
(139, 66, '2024-07-27 13:37:56', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 88, \"rider_name\": \"ABDUR REHMAN\"}', '2024-07-27 20:37:56', '2024-07-27 20:37:56'),
(140, 66, '2024-07-27 13:42:28', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 88, \"cancel_by\": \"rider\", \"rider_name\": \"ABDUR REHMAN\"}', '2024-07-27 20:42:28', '2024-07-27 20:42:28'),
(141, 66, '2024-07-27 13:42:31', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 88, \"cancel_by\": \"rider\", \"rider_name\": \"ABDUR REHMAN\"}', '2024-07-27 20:42:31', '2024-07-27 20:42:31'),
(142, 67, '2024-07-27 13:43:12', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 88, \"rider_name\": \"ABDUR REHMAN\"}', '2024-07-27 20:43:12', '2024-07-27 20:43:12'),
(143, 67, '2024-07-27 13:59:05', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 88, \"cancel_by\": \"rider\", \"rider_name\": \"ABDUR REHMAN\"}', '2024-07-27 20:59:05', '2024-07-27 20:59:05'),
(144, 67, '2024-07-27 13:59:07', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 88, \"cancel_by\": \"rider\", \"rider_name\": \"ABDUR REHMAN\"}', '2024-07-27 20:59:07', '2024-07-27 20:59:07'),
(145, 68, '2024-07-27 14:01:45', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 88, \"rider_name\": \"ABDUR REHMAN\"}', '2024-07-27 21:01:45', '2024-07-27 21:01:45'),
(146, 68, '2024-07-27 14:03:45', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 88, \"cancel_by\": \"rider\", \"rider_name\": \"ABDUR REHMAN\"}', '2024-07-27 21:03:45', '2024-07-27 21:03:45'),
(148, 70, '2024-07-27 14:16:18', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 88, \"rider_name\": \"ABDUR REHMAN\"}', '2024-07-27 21:16:18', '2024-07-27 21:16:18'),
(149, 70, '2024-07-27 14:23:01', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 88, \"cancel_by\": \"rider\", \"rider_name\": \"ABDUR REHMAN\"}', '2024-07-27 21:23:01', '2024-07-27 21:23:01'),
(150, 70, '2024-07-27 14:23:06', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 88, \"cancel_by\": \"rider\", \"rider_name\": \"ABDUR REHMAN\"}', '2024-07-27 21:23:06', '2024-07-27 21:23:06'),
(151, 71, '2024-07-27 14:26:22', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 88, \"rider_name\": \"ABDUR REHMAN\"}', '2024-07-27 21:26:22', '2024-07-27 21:26:22'),
(152, 71, '2024-07-27 14:32:16', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 88, \"cancel_by\": \"rider\", \"rider_name\": \"ABDUR REHMAN\"}', '2024-07-27 21:32:16', '2024-07-27 21:32:16'),
(153, 72, '2024-07-27 14:33:41', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 88, \"rider_name\": \"ABDUR REHMAN\"}', '2024-07-27 21:33:41', '2024-07-27 21:33:41'),
(154, 72, '2024-07-27 14:42:50', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 88, \"cancel_by\": \"rider\", \"rider_name\": \"ABDUR REHMAN\"}', '2024-07-27 21:42:50', '2024-07-27 21:42:50'),
(155, 72, '2024-07-27 14:42:55', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 88, \"cancel_by\": \"rider\", \"rider_name\": \"ABDUR REHMAN\"}', '2024-07-27 21:42:55', '2024-07-27 21:42:55'),
(169, 84, '2024-07-27 17:29:22', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 88, \"rider_name\": \"ABDUR REHMAN\"}', '2024-07-28 00:29:22', '2024-07-28 00:29:22'),
(170, 84, '2024-07-27 17:30:08', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 88, \"cancel_by\": \"rider\", \"rider_name\": \"ABDUR REHMAN\"}', '2024-07-28 00:30:08', '2024-07-28 00:30:08'),
(171, 84, '2024-07-27 17:30:11', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 88, \"cancel_by\": \"rider\", \"rider_name\": \"ABDUR REHMAN\"}', '2024-07-28 00:30:11', '2024-07-28 00:30:11'),
(172, 85, '2024-07-27 17:30:51', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 88, \"rider_name\": \"ABDUR REHMAN\"}', '2024-07-28 00:30:51', '2024-07-28 00:30:51'),
(173, 85, '2024-07-27 17:33:42', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 88, \"cancel_by\": \"rider\", \"rider_name\": \"ABDUR REHMAN\"}', '2024-07-28 00:33:42', '2024-07-28 00:33:42'),
(174, 86, '2024-07-27 17:39:49', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 88, \"rider_name\": \"ABDUR REHMAN\"}', '2024-07-28 00:39:49', '2024-07-28 00:39:49'),
(175, 86, '2024-07-27 17:48:08', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 88, \"cancel_by\": \"rider\", \"rider_name\": \"ABDUR REHMAN\"}', '2024-07-28 00:48:08', '2024-07-28 00:48:08'),
(176, 86, '2024-07-27 17:48:14', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 88, \"cancel_by\": \"rider\", \"rider_name\": \"ABDUR REHMAN\"}', '2024-07-28 00:48:14', '2024-07-28 00:48:14'),
(177, 87, '2024-07-27 17:48:52', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 88, \"rider_name\": \"ABDUR REHMAN\"}', '2024-07-28 00:48:52', '2024-07-28 00:48:52'),
(178, 87, '2024-07-27 17:49:07', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 88, \"cancel_by\": \"rider\", \"rider_name\": \"ABDUR REHMAN\"}', '2024-07-28 00:49:07', '2024-07-28 00:49:07'),
(179, 88, '2024-07-27 17:49:35', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 88, \"rider_name\": \"ABDUR REHMAN\"}', '2024-07-28 00:49:35', '2024-07-28 00:49:35'),
(180, 88, '2024-07-27 17:50:15', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 88, \"cancel_by\": \"rider\", \"rider_name\": \"ABDUR REHMAN\"}', '2024-07-28 00:50:15', '2024-07-28 00:50:15'),
(181, 89, '2024-07-27 17:55:01', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 88, \"rider_name\": \"ABDUR REHMAN\"}', '2024-07-28 00:55:01', '2024-07-28 00:55:01'),
(182, 89, '2024-07-27 17:55:18', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 88, \"cancel_by\": \"rider\", \"rider_name\": \"ABDUR REHMAN\"}', '2024-07-28 00:55:18', '2024-07-28 00:55:18'),
(183, 89, '2024-07-27 17:55:20', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 88, \"cancel_by\": \"rider\", \"rider_name\": \"ABDUR REHMAN\"}', '2024-07-28 00:55:21', '2024-07-28 00:55:21'),
(184, 90, '2024-07-27 17:55:47', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 88, \"rider_name\": \"ABDUR REHMAN\"}', '2024-07-28 00:55:47', '2024-07-28 00:55:47'),
(185, 90, '2024-07-27 17:56:03', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 88, \"cancel_by\": \"rider\", \"rider_name\": \"ABDUR REHMAN\"}', '2024-07-28 00:56:03', '2024-07-28 00:56:03'),
(193, 97, '2024-07-27 22:45:49', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 3, \"rider_name\": \"Mohammad shaheryar\"}', '2024-07-28 05:45:49', '2024-07-28 05:45:49'),
(194, 97, '2024-07-27 22:59:05', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 3, \"cancel_by\": \"rider\", \"rider_name\": \"Mohammad shaheryar\"}', '2024-07-28 05:59:05', '2024-07-28 05:59:05'),
(195, 98, '2024-07-27 22:59:35', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 3, \"rider_name\": \"Mohammad shaheryar\"}', '2024-07-28 05:59:35', '2024-07-28 05:59:35'),
(196, 98, '2024-07-27 23:05:37', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 3, \"cancel_by\": \"rider\", \"rider_name\": \"Mohammad shaheryar\"}', '2024-07-28 06:05:37', '2024-07-28 06:05:37'),
(197, 99, '2024-07-27 23:07:00', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 3, \"rider_name\": \"Mohammad shaheryar\"}', '2024-07-28 06:07:00', '2024-07-28 06:07:00'),
(198, 99, '2024-07-27 23:25:19', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 3, \"cancel_by\": \"rider\", \"rider_name\": \"Mohammad shaheryar\"}', '2024-07-28 06:25:19', '2024-07-28 06:25:19'),
(199, 100, '2024-07-27 23:30:19', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 3, \"rider_name\": \"Mohammad shaheryar\"}', '2024-07-28 06:30:19', '2024-07-28 06:30:19'),
(200, 100, '2024-07-27 23:48:00', 'canceled', 'The ride is canceled.', '{\"rider_id\": 3, \"cancel_by\": \"auto\", \"rider_name\": \"Mohammad shaheryar\"}', '2024-07-28 06:48:00', '2024-07-28 06:48:00'),
(214, 113, '2024-07-29 13:25:26', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 3, \"rider_name\": \"Mohammad shaheryar\"}', '2024-07-29 20:25:26', '2024-07-29 20:25:26'),
(215, 113, '2024-07-29 13:26:16', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 3, \"cancel_by\": \"rider\", \"rider_name\": \"Mohammad shaheryar\"}', '2024-07-29 20:26:16', '2024-07-29 20:26:16'),
(216, 113, '2024-07-29 13:26:18', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 3, \"cancel_by\": \"rider\", \"rider_name\": \"Mohammad shaheryar\"}', '2024-07-29 20:26:18', '2024-07-29 20:26:18'),
(217, 114, '2024-07-29 13:30:40', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 3, \"rider_name\": \"Mohammad shaheryar\"}', '2024-07-29 20:30:40', '2024-07-29 20:30:40'),
(218, 114, '2024-07-29 13:31:05', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 3, \"cancel_by\": \"rider\", \"rider_name\": \"Mohammad shaheryar\"}', '2024-07-29 20:31:05', '2024-07-29 20:31:05'),
(219, 114, '2024-07-29 13:31:06', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 3, \"cancel_by\": \"rider\", \"rider_name\": \"Mohammad shaheryar\"}', '2024-07-29 20:31:06', '2024-07-29 20:31:06'),
(220, 115, '2024-07-29 13:31:48', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 3, \"rider_name\": \"Mohammad shaheryar\"}', '2024-07-29 20:31:48', '2024-07-29 20:31:48'),
(221, 115, '2024-07-29 13:34:21', 'canceled', 'The ride is canceled.', '{\"rider_id\": 3, \"cancel_by\": \"auto\", \"rider_name\": \"Mohammad shaheryar\"}', '2024-07-29 20:34:21', '2024-07-29 20:34:21'),
(229, 123, '2024-07-29 15:40:43', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 29, \"rider_name\": \"Test Cab\"}', '2024-07-29 22:40:43', '2024-07-29 22:40:43'),
(230, 123, '2024-07-29 15:41:35', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 29, \"cancel_by\": \"rider\", \"rider_name\": \"Test Cab\"}', '2024-07-29 22:41:35', '2024-07-29 22:41:35'),
(231, 124, '2024-07-29 16:05:17', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 29, \"rider_name\": \"Test Cab\"}', '2024-07-29 23:05:17', '2024-07-29 23:05:17'),
(232, 124, '2024-07-29 16:05:45', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 29, \"cancel_by\": \"rider\", \"rider_name\": \"Test Cab\"}', '2024-07-29 23:05:45', '2024-07-29 23:05:45'),
(236, 128, '2024-07-29 18:31:28', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 3, \"rider_name\": \"Mohammad shaheryar\"}', '2024-07-30 01:31:28', '2024-07-30 01:31:28'),
(237, 128, '2024-07-29 18:32:38', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 3, \"cancel_by\": \"rider\", \"rider_name\": \"Mohammad shaheryar\"}', '2024-07-30 01:32:38', '2024-07-30 01:32:38'),
(239, 130, '2024-07-30 05:13:47', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 29, \"rider_name\": \"Test Cab\"}', '2024-07-30 12:13:47', '2024-07-30 12:13:47'),
(240, 130, '2024-07-30 05:16:18', 'canceled', 'The ride is canceled.', '{\"rider_id\": 29, \"cancel_by\": \"auto\", \"rider_name\": \"Test Cab\"}', '2024-07-30 12:16:18', '2024-07-30 12:16:18'),
(241, 130, '2024-07-30 05:26:30', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 29, \"cancel_by\": \"rider\", \"rider_name\": \"Test Cab\"}', '2024-07-30 12:26:30', '2024-07-30 12:26:30'),
(242, 131, '2024-07-30 05:29:18', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 29, \"rider_name\": \"Test Cab\"}', '2024-07-30 12:29:18', '2024-07-30 12:29:18'),
(243, 131, '2024-07-30 05:31:28', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 29, \"cancel_by\": \"rider\", \"rider_name\": \"Test Cab\"}', '2024-07-30 12:31:28', '2024-07-30 12:31:28'),
(246, 134, '2024-07-30 14:19:50', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 3, \"rider_name\": \"Mohammad shaheryar\"}', '2024-07-30 21:19:51', '2024-07-30 21:19:51'),
(247, 134, '2024-07-30 14:21:09', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 3, \"cancel_by\": \"rider\", \"rider_name\": \"Mohammad shaheryar\"}', '2024-07-30 21:21:09', '2024-07-30 21:21:09'),
(248, 134, '2024-07-30 14:21:09', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 3, \"cancel_by\": \"rider\", \"rider_name\": \"Mohammad shaheryar\"}', '2024-07-30 21:21:09', '2024-07-30 21:21:09'),
(249, 134, '2024-07-30 14:21:09', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 3, \"cancel_by\": \"rider\", \"rider_name\": \"Mohammad shaheryar\"}', '2024-07-30 21:21:09', '2024-07-30 21:21:09'),
(250, 134, '2024-07-30 14:21:09', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 3, \"cancel_by\": \"rider\", \"rider_name\": \"Mohammad shaheryar\"}', '2024-07-30 21:21:09', '2024-07-30 21:21:09'),
(264, 148, '2024-07-30 18:17:28', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 29, \"rider_name\": \"Test Cab\"}', '2024-07-31 01:17:28', '2024-07-31 01:17:28'),
(265, 148, '2024-07-30 18:20:00', 'canceled', 'The ride is canceled.', '{\"rider_id\": 29, \"cancel_by\": \"auto\", \"rider_name\": \"Test Cab\"}', '2024-07-31 01:20:00', '2024-07-31 01:20:00'),
(266, 149, '2024-07-31 15:01:49', 'new_ride_requested', 'New Ride requested', '{\"rider_id\": 29, \"rider_name\": \"Test Cab\"}', '2024-07-31 22:01:49', '2024-07-31 22:01:49'),
(267, 149, '2024-07-31 15:04:16', 'canceled', 'The rider canceled the request.', '{\"rider_id\": 29, \"cancel_by\": \"rider\", \"rider_name\": \"Test Cab\"}', '2024-07-31 22:04:16', '2024-07-31 22:04:16'),
(268, 149, '2024-07-31 15:04:20', 'canceled', 'The ride is canceled.', '{\"rider_id\": 29, \"cancel_by\": \"auto\", \"rider_name\": \"Test Cab\"}', '2024-07-31 22:04:20', '2024-07-31 22:04:20');

-- --------------------------------------------------------

--
-- Table structure for table `ride_request_ratings`
--

CREATE TABLE `ride_request_ratings` (
  `id` bigint UNSIGNED NOT NULL,
  `ride_request_id` bigint UNSIGNED NOT NULL,
  `rider_id` bigint UNSIGNED DEFAULT NULL,
  `driver_id` bigint UNSIGNED DEFAULT NULL,
  `rating` double NOT NULL DEFAULT '0',
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rating_by` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', 1, '2024-06-23 09:38:42', NULL),
(2, 'rider', 'web', 1, '2024-06-23 09:38:42', NULL),
(3, 'driver', 'web', 1, '2024-06-23 09:38:42', NULL),
(4, 'Umer Ahmed', 'web', 0, '2024-07-08 19:37:26', '2024-07-24 00:01:15'),
(5, 'Abdur Rehman', 'web', 0, '2024-07-10 14:06:44', '2024-07-24 00:02:48'),
(6, 'sales man', 'web', 0, '2024-07-24 00:05:56', '2024-07-24 00:06:34');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(2, 5),
(3, 5),
(5, 5),
(6, 5),
(8, 5),
(9, 5),
(10, 5),
(11, 5),
(13, 5),
(14, 5),
(15, 5),
(16, 5),
(18, 5),
(19, 5),
(20, 5),
(21, 5),
(23, 5),
(24, 5),
(25, 5),
(26, 5),
(29, 5),
(30, 5),
(31, 5),
(33, 5),
(34, 5),
(35, 5),
(36, 5),
(38, 5),
(39, 5),
(40, 5),
(41, 5),
(43, 5),
(44, 5),
(45, 5),
(46, 5),
(48, 5),
(49, 5),
(50, 5),
(51, 5),
(53, 5),
(54, 5),
(55, 5),
(56, 5),
(58, 5),
(59, 5),
(60, 5),
(61, 5),
(63, 5),
(64, 5),
(65, 5),
(66, 5),
(67, 5),
(68, 5),
(69, 5),
(70, 5);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region_id` bigint UNSIGNED DEFAULT NULL,
  `capacity` bigint UNSIGNED DEFAULT '1',
  `base_fare` double DEFAULT NULL,
  `minimum_fare` double DEFAULT NULL,
  `minimum_distance` double DEFAULT NULL,
  `per_distance` double DEFAULT NULL,
  `per_minute_drive` double DEFAULT NULL,
  `per_minute_wait` double DEFAULT NULL,
  `waiting_time_limit` double DEFAULT NULL,
  `cancellation_fee` double DEFAULT NULL,
  `payment_method` enum('cash_wallet','cash','wallet') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cash',
  `commission_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'fixed, percentage',
  `admin_commission` double DEFAULT '0',
  `fleet_commission` double DEFAULT '0',
  `status` tinyint DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `region_id`, `capacity`, `base_fare`, `minimum_fare`, `minimum_distance`, `per_distance`, `per_minute_drive`, `per_minute_wait`, `waiting_time_limit`, `cancellation_fee`, `payment_method`, `commission_type`, `admin_commission`, `fleet_commission`, `status`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Business', 2, 4, 230, 230, 4, 55, 15, 3, 3, 170, 'cash', 'percentage', 5, 0, 1, NULL, '2024-07-10 13:13:29', '2024-07-29 17:45:10'),
(2, 'Economy', 4, 4, 160, 160, 4, 40, 13, 3, 3, 150, 'cash', 'percentage', 5, 0, 1, NULL, '2024-07-11 01:02:28', '2024-07-28 01:28:14'),
(3, 'Bike', 4, 1, 60, 60, 3, 18, 2, 5, 3, 60, 'cash', 'percentage', 13, 0, 1, NULL, '2024-07-15 18:28:55', '2024-07-27 23:45:08'),
(4, 'Mini', 2, 4, 130, 130, 4, 38, 10, NULL, 4, 130, 'cash', 'percentage', 5, 0, 1, NULL, '2024-07-15 18:30:53', '2024-07-15 18:30:53'),
(5, 'Rickshaw', 2, 3, 100, 100, 4, 25, 7, 7, 4, 100, 'cash', 'percentage', 5, 0, 1, NULL, '2024-07-15 18:37:51', '2024-07-27 23:05:29'),
(6, 'Courier', 2, 1, 70, 70, 4, 22, 8, 5, 4, 70, 'cash', 'percentage', 5, 0, 1, NULL, '2024-07-15 18:48:05', '2024-07-27 23:05:36');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `type`, `value`) VALUES
(1, 'CURRENCY_CODE', 'CURRENCY', 'PKR'),
(2, 'CURRENCY_POSITION', 'CURRENCY', 'right'),
(3, 'ONESIGNAL_APP_ID', 'ONESIGNAL', 'facac5e8-5c45-491a-9e2c-104c268abcbc'),
(4, 'ONESIGNAL_REST_API_KEY', 'ONESIGNAL', 'NWM4YWJhYWEtYTUxZi00MjVlLWEyYTAtNzVkNDVhMjkxMTJh'),
(5, 'ONESIGNAL_DRIVER_APP_ID', 'ONESIGNAL', '1a7431a1-136f-4aa9-842c-c4980f02351e'),
(6, 'ONESIGNAL_DRIVER_REST_API_KEY', 'ONESIGNAL', 'NzE5OWU1MGYtMDUxMy00ODBjLThmNmQtMjQ5MGJhZDhiZGZh'),
(7, 'DISTANCE_RADIUS', 'DISTANCE', '5779'),
(8, 'RIDE_FOR_OTHER', 'RIDE', '1'),
(9, 'FIREBASE_SERVER_KEY', 'FIREBASE', 'AIzaSyC9u05eUDSKOOINuktZkpX3LowpTS1ov-M'),
(10, 'max_time_for_find_drivers_for_regular_ride_in_minute', 'ride', '2.5'),
(11, 'ride_accept_decline_duration_for_driver_in_second', 'ride', '15'),
(12, 'preset_tip_amount', 'ride', '10'),
(13, 'apply_additional_fee', 'ride', '1'),
(14, 'min_amount_to_add', 'wallet', '1'),
(15, 'max_amount_to_add', 'wallet', '5000'),
(16, 'min_amount_to_get_ride', 'wallet', '1500'),
(17, 'preset_topup_amount', 'wallet', '500');

-- --------------------------------------------------------

--
-- Table structure for table `sos`
--

CREATE TABLE `sos` (
  `id` bigint UNSIGNED NOT NULL,
  `region_id` bigint UNSIGNED DEFAULT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `added_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` enum('male','female','other') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `user_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `player_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_id` bigint UNSIGNED DEFAULT NULL,
  `fleet_id` bigint UNSIGNED DEFAULT NULL,
  `latitude` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_notification_seen` timestamp NULL DEFAULT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `is_online` tinyint DEFAULT '0',
  `is_available` tinyint DEFAULT '1',
  `is_verified_driver` tinyint DEFAULT '0',
  `uid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fcm_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `display_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'UTC',
  `last_location_update_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `username`, `password`, `contact_number`, `gender`, `email_verified_at`, `address`, `user_type`, `player_id`, `service_id`, `fleet_id`, `latitude`, `longitude`, `remember_token`, `last_notification_seen`, `status`, `is_online`, `is_available`, `is_verified_driver`, `uid`, `fcm_token`, `display_name`, `login_type`, `timezone`, `last_location_update_at`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Admin', 'admin@admin.com', 'admin', '$2y$10$4ypHi.iAUWni.9cr1YrOu.s/DzYJvnCdGe8jBh.NQt9ihVM2ZUUYu', '+923004295999', NULL, NULL, NULL, 'admin', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-07 23:31:37', 'active', 0, 1, 0, NULL, NULL, 'Admin', NULL, 'Asia/Karachi', NULL, '2024-06-23 09:38:42', '2024-08-07 23:31:37'),
(2, 'Mohammad', 'Shaheryarr', 'zkermark@gmail.com', 'd3xter', '$2y$10$pqL0uF2YwSvUxbjN3ZXWLuaOX1rgxSGdMbn6WbF30.XbP9eJWuUP2', '+923410396793', NULL, NULL, '32-saleem housing project shahfaisal colony 3', 'rider', 'a10762a9-ad99-4290-89c1-7d0e85ab331c', NULL, NULL, '24.8600723', '67.0600787', NULL, '2024-07-17 15:35:56', 'active', 0, 1, 0, NULL, NULL, 'Mohammad Shaheryar', NULL, 'Asia/Karachi', '2024-07-25 14:09:03', '2024-07-01 20:26:48', '2024-07-31 13:57:10'),
(3, 'Mohammad', 'shaheryar', 'mohammad.shaheryar1997@gmail.com', 'shery', '$2y$10$hr68RO1mV9EX0a01OQwHgeKj4d..HXl/hyla4UqfdrTsPsmnt3J3G', '+92341039763', NULL, NULL, 'Hello world 123 near black mail', 'rider', 'b85dae71-5d77-42ba-b406-4aa7686457ea', NULL, NULL, '24.8601493', '67.060126', NULL, NULL, 'active', 0, 1, 0, NULL, NULL, 'Mohammad shaheryar', NULL, 'Asia/Karachi', '2024-07-30 14:21:19', '2024-07-08 03:03:39', '2024-07-30 21:21:19'),
(11, 'test2', 'test2', 'test2@gmail.com', 'test2', '$2y$10$jq40vc146.MuEuZB6vCQbuf9L328gnQj48HhQdrq4JO1wNP/PnSSS', '+923007649794', NULL, NULL, NULL, 'rider', 'b0e9e898-b9d0-4ddd-a221-1dfb31b073bf', NULL, NULL, '24.8851318', '67.1537278', NULL, NULL, 'active', 0, 1, 0, NULL, NULL, 'test2 test2', NULL, 'UTC', '2024-07-10 18:12:50', '2024-07-10 23:05:09', '2024-07-11 01:12:50'),
(12, 'User', 'check', 'user@gmail.com', 'user', '$2y$10$usgVh0yHM.FHWsWFg6m/du1scSFY9grh8dYfmSHTpVpDzU18uIE1u', '+923649657575', NULL, NULL, NULL, 'rider', NULL, NULL, NULL, '24.8596967', '67.0603766', NULL, NULL, 'active', 0, 1, 0, NULL, NULL, 'User check', NULL, 'UTC', '2024-07-11 15:13:31', '2024-07-11 12:39:59', '2024-07-11 22:13:41'),
(13, 'Test3', 'test3', 'test3@gmail.com', 'test3', '$2y$10$mOr5LWRtZb1b7P1Y9PmhQ.UEyArtEYLrcSYypG.0GFts77RZH2cC2', '+923045984599', NULL, NULL, NULL, 'rider', '67265b6b-2e26-4407-995e-12dc22721ff6', NULL, NULL, '24.8603279', '67.0601033', NULL, NULL, 'active', 0, 1, 0, NULL, NULL, 'Test3 test3', NULL, 'UTC', '2024-07-11 16:09:10', '2024-07-11 22:16:05', '2024-07-11 23:09:10'),
(21, 'Mohammad', 'Shaheryar', 'shery@alitacode.com', 'dexter', '$2y$10$ySA3mSQtrNuxaR5/uI08quG4eXX9S/1X1QmanNqJJ90L1I9pzaCTC', '+923152056800', 'male', NULL, NULL, 'driver', NULL, 2, NULL, '24.8600914', '67.0600918', NULL, NULL, 'active', 1, 1, 1, NULL, NULL, 'Mohammad Shaheryar', NULL, 'UTC', '2024-07-29 14:31:36', '2024-07-12 00:22:31', '2024-07-29 21:31:36'),
(23, 'Shaheer', 'ahmed', 'shaheer@kymcargo.com', 'shaheer@kymcargo.com', '$2y$10$JfEWN/rqOUcb94gSD2Q0mupp87gt6VmTa3e9DsmjP/IkmIpOBFVva', '+923002999273', NULL, NULL, NULL, 'rider', '83d6d452-ae79-4ea6-968e-148914316796', NULL, NULL, '24.8601079', '67.0601746', NULL, NULL, 'active', 0, 1, 0, NULL, NULL, 'Shaheer ahmed', NULL, 'Asia/Karachi', '2024-07-12 08:04:14', '2024-07-12 15:00:16', '2024-07-19 22:09:15'),
(29, 'Test', 'Cab', 'test@gmail.com', 'test', '$2y$10$cJ.0yFcAwgwK8WAarvZhHeeQ.jRNkXpeoHc/5PGA87L7IqGD0JcmW', '304596588', 'male', NULL, NULL, 'driver', 'fec8da5e-63b1-4e23-ac56-54fa921f06a8', 1, NULL, '24.86014', '67.0600367', NULL, '2024-08-08 00:54:42', 'active', 1, 1, 1, NULL, NULL, 'Test Cab', NULL, 'UTC', '2024-08-07 18:17:17', '2024-07-13 17:31:07', '2024-08-08 01:17:17'),
(44, 'Kamran', 'Khan', 'desire.kamran14@gmail.com', 'kamrankhan', '$2y$10$TCHD4FtG3vpkzcbRpj9x5ODTjZyYYGjeOFHgzOetGwDB8ay1oP.eK', '3272722860', NULL, NULL, NULL, 'driver', '11882f25-7753-44e1-9f2e-89c61b446bdb', 3, NULL, '24.8601', '67.060025', NULL, '2024-07-25 21:03:17', 'active', 0, 1, 1, 'null', NULL, 'Kamran Khan', NULL, 'UTC', '2024-07-31 12:42:36', '2024-07-23 17:07:26', '2024-08-06 18:49:29'),
(45, 'Hammad', 'Zia', 'hammadzia199@gmail.com', 'Hammad', '$2y$10$2BSFm./So0uLZvKXAyCMnO9qIunlZKo9zmKAoRQT1lhJdTg.d2LU.', '+923353313590', 'male', NULL, NULL, 'driver', NULL, 3, NULL, '24.8601298', '67.0601016', NULL, NULL, 'active', 0, 1, 1, 'null', NULL, 'Hammad Zia', NULL, 'UTC', '2024-07-23 12:34:33', '2024-07-23 19:12:19', '2024-07-23 19:34:38'),
(49, 'Umer', 'Ahmed', 'umer9790@gmail.com', 'umerahmed', '$2y$10$TrCYcHm4czTWUEHu6yVUKeYPce5y39ZgZMsKhInXVLmBt1K2E.7x2', '+923132625640', 'male', NULL, NULL, 'driver', NULL, 3, NULL, '24.8601298', '67.0600803', NULL, NULL, 'active', 0, 1, 1, NULL, NULL, 'Umer Ahmed', NULL, 'UTC', '2024-07-23 12:45:32', '2024-07-23 19:19:23', '2024-07-24 14:34:15'),
(53, 'huzaifa', 'taj', 'huzaifataj@gmail.com', 'huzaifa', '$2y$10$xymM4EyNn0laDlMe47nAyOzmqcIIvehyRvIzeorjFDAtIy5c2ThBu', '+923412313860', 'male', NULL, NULL, 'driver', '99c20049-84aa-483d-b16f-292db5b268a3', 2, NULL, '24.8843417', '67.1554567', NULL, '2024-07-30 21:28:52', 'active', 1, 1, 1, NULL, NULL, 'huzaifa taj', NULL, 'UTC', '2024-08-09 03:27:02', '2024-07-23 19:45:37', '2024-08-09 10:27:02'),
(55, 'Muhammad Salman', 'Ahmed', 'salmanahmed@gmail.com', 'msalmanahmed', '$2y$10$g2R.hEmWXXMgR4.Y6EeNBO9uv8seM.VbHYFLNCkYEgmIsZmOx1C4e', '+923462492838', 'male', NULL, NULL, 'driver', NULL, 3, NULL, '24.9133651', '67.0807319', NULL, NULL, 'active', 0, 1, 1, 'null', NULL, 'Muhammad Salman Ahmed', NULL, 'UTC', '2024-07-23 16:52:24', '2024-07-23 20:02:21', '2024-07-24 16:02:59'),
(56, 'ali', 'ahmed', 'aliahmed@gmail.com', 'ali', '$2y$10$B0thsXFgApWK21WQ.hSSBOtADP9K.qP0Z//Fwlac3jCGCebCds7UC', '+923324272877', NULL, NULL, NULL, 'driver', 'ef51c950-911c-4f28-a640-48aec1400883', 3, NULL, NULL, NULL, NULL, NULL, 'pending', 0, 1, 0, NULL, NULL, 'ali ahmed', NULL, 'UTC', NULL, '2024-07-24 14:35:08', '2024-07-24 14:35:08'),
(57, 'Amjad', 'Inayat', 'amjad12@gmail.com', 'amjad', '$2y$10$MSciMwyODq.btk78BssZ/e4pd.JMWtRnztO26za7LxhD46QdQsR4q', '+923132050906', NULL, NULL, NULL, 'driver', 'a7eaf900-02e9-4365-adbc-de504d50576e', 3, NULL, '24.8651941', '67.0559541', NULL, NULL, 'pending', 0, 1, 0, NULL, NULL, 'Amjad Inayat', NULL, 'UTC', '2024-07-24 07:43:58', '2024-07-24 14:37:16', '2024-07-24 14:43:58'),
(58, 'bilal', 'khan', 'bilalkhan@gmail.com', 'bilalkhan', '$2y$10$HAsSg7IwnIM8SAnPyYYQY.uIMrPTFsQ8wC08Ug40qxNrwzRFrkpVC', '+923111003161', NULL, NULL, NULL, 'driver', 'ef51c950-911c-4f28-a640-48aec1400883', 3, NULL, NULL, NULL, NULL, NULL, 'pending', 0, 1, 0, 'null', NULL, 'bilal khan', NULL, 'UTC', NULL, '2024-07-24 14:40:51', '2024-07-24 14:48:39'),
(59, 'Shakir', 'Lilah', 'shakir12@gmail.com', 'shakir', '$2y$10$xiUbIpOiysWmcN1QH58DTONOdfgPuXTIZTTP3ZL7KvZcw9QEH0LRS', '+923030901277', NULL, NULL, NULL, 'driver', '4e8a81cc-8339-4a52-84f9-ef24d26fff61', 3, NULL, NULL, NULL, NULL, NULL, 'pending', 0, 1, 0, 'null', NULL, 'Shakir Lilah', NULL, 'UTC', NULL, '2024-07-24 14:52:09', '2024-07-24 15:07:27'),
(60, 'shahab', 'uddin', 'shahabuddin@gmail.com', 'shahab', '$2y$10$nUBeNtBFYDZ26d51SEG6yuK9htHROGp9Bg2VApsRGQS4i/Tp4d.Xm', '+923182822955', NULL, NULL, NULL, 'driver', '42876fa2-e45f-4fc2-b0f3-b8df9372c358', 3, NULL, NULL, NULL, NULL, NULL, 'pending', 0, 1, 0, NULL, NULL, 'shahab uddin', NULL, 'UTC', NULL, '2024-07-24 14:53:23', '2024-07-24 14:53:23'),
(61, 'adnan', 'khan', 'adnankhan@gmail.com', 'adnan', '$2y$10$ERhbnRxh93G0A6UPzi.jEOH7OajWtD5s.u.ptrOZQ1NfMgA6R.wJy', '+923428310789', NULL, NULL, NULL, 'driver', 'b352a53c-f6bd-43ad-89a4-75db3f9fd02d', 3, NULL, NULL, NULL, NULL, NULL, 'pending', 0, 1, 0, 'null', NULL, 'adnan khan', NULL, 'UTC', NULL, '2024-07-24 15:07:08', '2024-07-24 16:43:55'),
(62, 'Muhammad', 'Munir', 'munir12@gmail.com', 'munir', '$2y$10$NRfQIzOsNFTR1ysfQIVykexyP89NNh5Ayo/QRnk/7niaEmW0iSF4O', '+9203027864876', NULL, NULL, NULL, 'driver', '375d7e3c-f22d-4e2d-88bb-0f02a904f236', 3, NULL, NULL, NULL, NULL, NULL, 'pending', 0, 1, 0, 'null', NULL, 'Muhammad Munir', NULL, 'UTC', NULL, '2024-07-24 15:31:01', '2024-07-24 15:32:18'),
(63, 'Shahzad', 'Ali', 'Shahzad.ali757@gmail.com', 'shahzadali', '$2y$10$wByLNixJsPVVoV1cZhi8AOsgEU1bhaN8QR0jN5ySn7fREHmm96iYW', '+923148852365', NULL, NULL, NULL, 'driver', '88a3c51f-e296-4f52-9c14-6879cd20ddf5', 3, NULL, '24.871575', '67.035375', NULL, NULL, 'pending', 0, 1, 0, 'null', NULL, 'Shahzad Ali', NULL, 'UTC', '2024-07-24 09:16:44', '2024-07-24 16:05:26', '2024-07-25 12:46:53'),
(64, 'Sarfaraz', 'Fayaz', 'sarfaraz13@gmil.com', 'sarfaraz', '$2y$10$BiL1tguAVDz/r5NDQq1P6uVOML.ru8jB2HRTiE9.XTBBPUFkp5sZm', '+923152476726', NULL, NULL, NULL, 'driver', '06006a5b-cbad-4b9f-b655-3c6e99524501', 3, NULL, NULL, NULL, NULL, NULL, 'pending', 0, 1, 0, NULL, NULL, 'Sarfaraz Fayaz', NULL, 'UTC', NULL, '2024-07-24 16:37:55', '2024-07-24 16:37:55'),
(65, 'Muhammad', 'Tariq', 'tariq12@gmail.com', 'tariq', '$2y$10$aQOsTA/FGJzPCz.MoZNrteK7S9ka8L1qcdmXNYAjYPpwUDhuM5EVG', '+923022253083', NULL, NULL, NULL, 'driver', '2c1a76c6-ed2e-41eb-b9ea-4b4252129a2b', 2, NULL, NULL, NULL, NULL, NULL, 'pending', 0, 1, 0, NULL, NULL, 'Muhammad Tariq', NULL, 'UTC', NULL, '2024-07-24 16:45:14', '2024-07-24 16:45:14'),
(66, 'mohammad', 'yousuf', 'mohammadyousof@gmail.com', 'yousuf', '$2y$10$elz.Hmnj7n1A2VyHf21tp.tzhPxKxcxGmeC9UUTugdsroVRMWdhe.', '+923152601774', NULL, NULL, NULL, 'driver', 'a441265d-f633-469c-8137-366f928fcfb1', 2, NULL, NULL, NULL, NULL, NULL, 'pending', 0, 1, 0, NULL, NULL, 'mohammad yousuf', NULL, 'UTC', NULL, '2024-07-24 17:26:43', '2024-07-24 17:26:43'),
(67, 'noor', 'muhammad', 'noor12@gmail.com', 'noor', '$2y$10$rH2fMKdhLEVHp8ygZriGK.3kE47VX1E87zCWK9UAEDRBJis5AQPlW', '+923012592174', NULL, NULL, NULL, 'driver', '0ab3d745-cb33-4c65-aa36-0ec6b43e9ff3', 3, NULL, NULL, NULL, NULL, NULL, 'pending', 0, 1, 0, 'null', NULL, 'noor muhammad', NULL, 'UTC', NULL, '2024-07-24 17:51:21', '2024-07-24 17:55:39'),
(68, 'Malik', 'Nadeem', 'malik14@gmail.com', 'malik', '$2y$10$Gtk6JQGTXRHfbhfjNqKqIup/O0KOYu0iSc4yZdVNN5gH9ZuAdMb2C', '+923422692010', NULL, NULL, NULL, 'driver', '06006a5b-cbad-4b9f-b655-3c6e99524501', 3, NULL, NULL, NULL, NULL, NULL, 'pending', 0, 1, 0, 'null', NULL, 'Malik Nadeem', NULL, 'UTC', NULL, '2024-07-24 18:23:21', '2024-07-24 23:58:56'),
(69, 'altaf', 'gohar', 'altaf1@gmail.com', 'altaf', '$2y$10$B1BW4WqYHpGJhmf/1mECu.kWLd8k/Ey0sp1xiXgi/ys81jjGqYyTK', '+923181205847', NULL, NULL, NULL, 'driver', 'bc0f6948-d852-423b-b05b-e9fb978827e3', 3, NULL, NULL, NULL, NULL, NULL, 'pending', 0, 1, 0, 'null', NULL, 'altaf gohar', NULL, 'UTC', NULL, '2024-07-24 18:33:37', '2024-07-24 18:35:34'),
(70, 'sohail', 'riaz', 'sohail12@gmail.com', 'sohail', '$2y$10$gNzCEqv8/BeVqTTcu/lXsOZF6qA4VYmbhqb.B8Cy/UxnV6Hfl5i2C', '+923102672905', NULL, NULL, NULL, 'driver', '99cb36a9-5aee-4da4-a0e8-7e46a9ef18df', 3, NULL, NULL, NULL, NULL, NULL, 'pending', 0, 1, 0, 'null', NULL, 'sohail riaz', NULL, 'UTC', NULL, '2024-07-24 18:40:49', '2024-07-24 18:43:50'),
(71, 'Salam', 'Qureshi', 'salamqueshi@gmail.com', 'salamqureshi', '$2y$10$YZl5WWbL6Gu2QVGHvHsv2.vhQ0hd6WfItwiV9H1u2SCzETGLaqfaq', '+923442111184', NULL, NULL, NULL, 'driver', '4ad54376-2dd1-43a5-8c3c-4ef16d2ac9b3', 3, NULL, NULL, NULL, NULL, NULL, 'pending', 0, 1, 0, 'null', NULL, 'Salam Qureshi', NULL, 'UTC', NULL, '2024-07-25 03:35:16', '2024-07-25 12:01:37'),
(72, 'Muhammad', 'Arshad', 'marshad90@gmail.com', 'marshad', '$2y$10$kI1.T3i4uhLXc0joVEpCrOU0UkcQ0HVPTptKdWUccTkJofifcc1hK', '+923058090330', NULL, NULL, NULL, 'driver', '10fffd50-e906-4ea4-b5f6-920ae7c82a4b', 4, NULL, NULL, NULL, NULL, NULL, 'pending', 0, 1, 0, NULL, NULL, 'Muhammad Arshad', NULL, 'UTC', NULL, '2024-07-25 13:06:47', '2024-07-25 13:06:47'),
(73, 'Didar', 'Hussain', 'didarhussain90@gmail.com', 'didarhussain', '$2y$10$piC2QBb0MTVG/K57FSKw9u7VC78ODnxe2FZdrTODjDaajSqQwNzES', '+923451296435', NULL, NULL, NULL, 'driver', '675fd5ea-036a-49a0-b57d-8944c22a5c7b', 5, NULL, NULL, NULL, NULL, NULL, 'pending', 0, 1, 0, NULL, NULL, 'Didar Hussain', NULL, 'UTC', NULL, '2024-07-25 14:01:06', '2024-07-25 14:01:06'),
(74, 'Kashif', 'Hashmat', 'kashifhashmat90@gmail.com', 'kashifhashmat', '$2y$10$Gd3e57guuz3i.v1P5QUty.OONBVXyjh8IXObj0gyMc5HYKUgdgCDe', '+923126806808', NULL, NULL, NULL, 'driver', 'e112700c-b4cf-4646-95c1-1c17fac2b589', 3, NULL, NULL, NULL, NULL, NULL, 'pending', 0, 1, 0, NULL, NULL, 'Kashif Hashmat', NULL, 'UTC', NULL, '2024-07-25 16:48:28', '2024-07-25 16:48:28'),
(75, 'muhammad', 'asad', 'muhammadasad@gmail.com', 'asad', '$2y$10$O6UAqdNF3s25/Z1zryxamO5ww7NUiFVC7XazhtzmN5RoJMM6Y1f3e', '+923472541810', 'male', NULL, NULL, 'driver', 'eadd4952-d397-426a-96d7-f2d2b7f9df65', 3, NULL, NULL, NULL, NULL, NULL, 'pending', 0, 1, 0, NULL, NULL, 'muhammad asad', NULL, 'UTC', NULL, '2024-07-25 17:01:00', '2024-07-29 17:18:31'),
(76, 'muhammad', 'mudassir', 'muhammadmudassir@gmail.com', 'mudassir', '$2y$10$RyhdFwOwx5GIx1PimV0rC.PFgiSqreUM51zvKS7Q4XafBc.mQ6DQ.', '+92301 2317407', NULL, NULL, NULL, 'driver', '0614ae1c-f548-4429-adbd-934afe600346', 3, NULL, NULL, NULL, NULL, NULL, 'pending', 0, 1, 0, 'null', NULL, 'muhammad mudassir', NULL, 'UTC', NULL, '2024-07-25 17:25:10', '2024-07-25 17:30:23'),
(77, 'muzammil', 'ahmed', 'muzmmil@gmail.com', 'muzammil', '$2y$10$WE6PXr6dC.mF2s9zVDmunOVcPGuejM9sP79Nr4ABavqttarMrAB3S', '+92334 2904664', NULL, NULL, NULL, 'driver', '8518a042-d167-4900-97eb-739473ac84a6', 3, NULL, NULL, NULL, NULL, NULL, 'pending', 0, 1, 0, NULL, NULL, 'muzammil ahmed', NULL, 'UTC', NULL, '2024-07-25 18:04:30', '2024-07-25 18:04:30'),
(78, 'Arsalan', 'Aftab', 'arsalanaftab90@gmail.con', 'arsalanaftab', '$2y$10$YH1qnSeW73tur.vHUJ3kKeJmE0LNpTw/9jurgac9INqKuUSIJubWC', '+923367989547', NULL, NULL, NULL, 'driver', 'c3b7088f-f804-444d-a712-95a6a384ff81', 3, NULL, NULL, NULL, NULL, NULL, 'pending', 0, 1, 0, NULL, NULL, 'Arsalan Aftab', NULL, 'UTC', NULL, '2024-07-25 18:08:10', '2024-07-25 18:08:10'),
(79, 'muzammil', 'ahmed', 'ahmed@gmail.com', 'ahmed', '$2y$10$o43fB9G5ff6Q1AdR2i0atuiqZZgJnYxl63T6MLMe2OpLnxfFPefUS', '+923342904664', 'male', NULL, NULL, 'driver', '381752f5-d325-44ff-b3dd-b6434f4ad2c8', 3, NULL, NULL, NULL, NULL, NULL, 'pending', 0, 1, 0, 'null', NULL, 'muzammil ahmed', NULL, 'UTC', NULL, '2024-07-25 18:08:37', '2024-07-29 17:17:45'),
(80, 'Muhammad', 'Suleman', 'msuleman90@gmail.com', 'msuleman', '$2y$10$PDwrcNnZ7ybc70z8Zd3EQONmyfrisabObNq.nVyMf3tStyFaCWDjq', '+923132651469', NULL, NULL, NULL, 'driver', 'cfcf13cd-12f4-4eca-8977-7f9c0a2f4818', 3, NULL, NULL, NULL, NULL, NULL, 'pending', 0, 1, 0, NULL, NULL, 'Muhammad Suleman', NULL, 'UTC', NULL, '2024-07-25 18:54:15', '2024-07-25 18:54:15'),
(81, 'furqan', 'ul haq', 'furqan@gmail.com', 'furqan', '$2y$10$THYFniOYh7qjJ2iWfVqx9O6gBFWcn/2oBEOdnNSzRu30Bx8HNTBq2', '+92345 2977717', NULL, NULL, NULL, 'driver', 'b15b32b8-0ee7-4140-92f1-f049f6136523', 3, NULL, NULL, NULL, NULL, NULL, 'pending', 0, 1, 0, NULL, NULL, 'furqan ul haq', NULL, 'UTC', NULL, '2024-07-26 14:52:32', '2024-07-26 14:52:32'),
(82, 'faraz', 'alam', 'faraz@gmail.com', 'faraz', '$2y$10$WrgYb9layZsNKTfE1cwku.wWm6O5hehxN2jVgko1WVj3Vi1NepqgG', '+92317 8930380', NULL, NULL, NULL, 'driver', 'a8d34357-e7fe-4442-b899-07d2c05bfcd3', 3, NULL, NULL, NULL, NULL, NULL, 'pending', 0, 1, 0, 'null', NULL, 'faraz alam', NULL, 'UTC', NULL, '2024-07-26 15:10:12', '2024-07-26 18:32:45'),
(83, 'Ibrahim', 'Ali', 'ibrahim12@gmail.com', 'ibrahim', '$2y$10$uZvXw//JcVKpeKDUg26ka.Ch1wE5v.R3fe2/1s/Q0sbL/FBfy/iJW', '+923282663975', NULL, NULL, NULL, 'driver', 'b77c9486-a7d1-4a27-b7d0-2af72bbd094e', 3, NULL, NULL, NULL, NULL, NULL, 'pending', 0, 1, 0, 'null', NULL, 'Ibrahim Ali', NULL, 'UTC', NULL, '2024-07-26 20:12:23', '2024-07-26 20:15:24'),
(84, 'ahmed', 'raza', 'ahmedraza1@gmail.com', 'ahmedraza', '$2y$10$mRwIpRCvPQv42nI8B5ZqTulRW5kMAnj7xEny4qippTxPKY7Se2yUW', '+923131105997', 'male', NULL, NULL, 'driver', 'e1a294b4-d787-4f47-9023-7c54b5117d19', 3, NULL, NULL, NULL, NULL, NULL, 'pending', 0, 1, 0, 'null', NULL, 'ahmed raza', NULL, 'UTC', NULL, '2024-07-27 16:37:41', '2024-07-29 17:19:40'),
(85, 'abdul', 'qadir', 'abdulqadir@gmail.com', 'abdulqadir', '$2y$10$SC5pS4CXI..vt/ZXHo.Fh.PZ4wQ2M6RJLvW5lGTiyGiu8PT.sw9ym', '+92312 2330444', NULL, NULL, NULL, 'driver', 'd0a8d43b-820a-4057-9432-1a7775079c6d', 3, NULL, NULL, NULL, NULL, NULL, 'pending', 0, 1, 0, NULL, NULL, 'abdul qadir', NULL, 'UTC', NULL, '2024-07-27 16:43:38', '2024-07-27 16:43:38'),
(86, 'Arsalan', 'Khalid', 'arsalankhalid90@gmail.com', 'arsalankhalid', '$2y$10$ja9VpWN.eDQ83imUGRXfCuVFWeFIy5iuy1tGAvWsBzKqXqN9QG3O.', '+923082268416', NULL, NULL, NULL, 'driver', '39097a67-43fc-4452-ae25-defd0e994517', 4, NULL, NULL, NULL, NULL, NULL, 'pending', 0, 1, 0, 'null', NULL, 'Arsalan Khalid', NULL, 'UTC', NULL, '2024-07-27 17:11:24', '2024-07-29 12:17:33'),
(87, 'muhammad', 'ashraf', 'ashraf@gmail.com', 'ashraf', '$2y$10$F6h7.W/F2K347WZmu3sH3usNQH96p0aF3gK5.zFWdmO.KYjwzF.Q.', '+923102750911', NULL, NULL, NULL, 'driver', '6e3abe48-8ee6-4d35-85b9-ad0729b1cbeb', 3, NULL, NULL, NULL, NULL, NULL, 'pending', 0, 1, 0, 'null', NULL, 'muhammad ashraf', NULL, 'UTC', NULL, '2024-07-27 17:57:17', '2024-07-27 17:59:38'),
(88, 'ABDUR', 'REHMAN', 'abd@gmail.com', 'Abdur', '$2y$10$0n1aTYes6dJbc7EmasUf5Oq5GbiW5WWfE4DbBZhRJSPmPJpaPbwmG', '+923002522885', 'male', NULL, 'Green Town\r\n2st', 'rider', '3b815408-4243-4d9d-aaa0-909d9804f824', NULL, NULL, '24.8600893', '67.0600773', NULL, NULL, 'active', 0, 1, 0, NULL, NULL, 'ABDUR REHMAN', NULL, 'Asia/Karachi', '2024-07-27 18:16:07', '2024-07-27 20:27:04', '2024-07-28 01:16:07'),
(89, 'Javed', 'Abdullah', 'javedabdullah90@gmail.com', 'javedabdullah', '$2y$10$E7sXTN7N8Iqii6my8ypNqeVRO8K7xswVqODRqNm3yd.jGxxrSPUTu', '+923232525155', NULL, NULL, NULL, 'driver', '98bee7d9-f49a-49ad-9dfe-d6e56d9e5ff0', 3, NULL, NULL, NULL, NULL, NULL, 'pending', 0, 1, 0, 'null', NULL, 'Javed Abdullah', NULL, 'UTC', NULL, '2024-07-29 12:24:13', '2024-07-29 16:47:42'),
(90, 'Testing', 'one', 'testing@gmail.com', 'testing', '$2y$10$gJPve8YT0NAFVlePbuY8wOLgAOH78nacO/9YqFxoCRMT2J6Aa8iGO', '+923460137826', NULL, NULL, NULL, 'rider', '767e1c08-1b69-4ff3-8824-540b2c092387', NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, 1, 0, NULL, NULL, 'Testing one', NULL, 'UTC', NULL, '2024-07-29 17:13:54', '2024-07-29 17:13:54'),
(91, 'Test', 'one', 'test09@gmail.com', 'test09', '$2y$10$4AZ7MX5bwVQmkw/jJotCOOl0WiJ.oP/E0RMvl9TpTHdUCiNXw.WMu', '+923333332', NULL, NULL, NULL, 'rider', '767e1c08-1b69-4ff3-8824-540b2c092387', NULL, NULL, '24.9312744', '67.0953144', NULL, '2024-07-29 17:19:23', 'active', 0, 1, 0, NULL, NULL, 'Test one', NULL, 'UTC', '2024-07-29 10:21:32', '2024-07-29 17:15:18', '2024-07-29 17:21:32'),
(92, 'aqib', 'ali', 'aqibali@gmail.com', 'aqib', '$2y$10$qRTsS6xOiXwiITo92cvmCeOBAGucS5/LpfJgKU7nZxA7fEm07Kngq', '+92318 3693224', NULL, NULL, NULL, 'driver', 'd665ab29-0085-4db4-b336-995b0db3a619', 3, NULL, NULL, NULL, NULL, NULL, 'pending', 0, 1, 0, 'null', NULL, 'aqib ali', NULL, 'UTC', NULL, '2024-07-29 17:34:32', '2024-07-29 17:35:57'),
(93, 'kamran', 'ali', 'kamran@gmail.com', '12345678', '$2y$10$asw7lGbm/En/LhpO4vxBqOlMvR8zDbs9XUdod6ka4t6/Pr.VNwbcK', '+92312 2327182', NULL, NULL, NULL, 'driver', '5a00eaf6-672b-4f58-9e95-55eb0f58bbf4', 3, NULL, NULL, NULL, NULL, NULL, 'pending', 0, 1, 0, 'null', NULL, 'kamran ali', NULL, 'UTC', NULL, '2024-07-31 15:24:52', '2024-07-31 15:26:12'),
(94, 'Muhammad Ayub', 'Khan', 'mayubkhan90@gmail.com', 'mayubkhan', '$2y$10$0pwA0Kegtjt5ua/Al5dhd.3mIuCrnXwMoPWF5CaE86dgOJJNTHdpu', '+923161039676', NULL, NULL, NULL, 'driver', '02c98781-cb63-4e38-b5a7-b4d1f2d5abf2', 3, NULL, NULL, NULL, NULL, NULL, 'pending', 0, 1, 0, 'null', NULL, 'Muhammad Ayub Khan', NULL, 'UTC', NULL, '2024-07-31 17:34:27', '2024-08-01 22:04:14'),
(95, 'Sameed', 'kha', 'Sameedkhab0989@gmail.com', 'Sameedkhan', '$2y$10$jAyJ5LRzRFWcefnad8VhnuOa3BsLPQRvOHhIfbautBYZv.zkhy05S', '+923068279933', NULL, NULL, NULL, 'rider', '607f6150-a0ca-439c-a7b1-e2b11f7a7dcb', NULL, NULL, NULL, NULL, NULL, NULL, 'active', 0, 1, 0, NULL, NULL, 'Sameed kha', NULL, 'UTC', NULL, '2024-08-01 01:13:14', '2024-08-01 01:13:14'),
(96, 'Muhammad', 'Salman', 'msalman90@gmail.com', 'msalman', '$2y$10$Og03A23eVe7tlKDuUJvnDe99/ftOq.zlL5Gb4Ehp5AbLJs7SaYMKe', '+9203181022132', NULL, NULL, NULL, 'driver', '34a5c8fe-d354-437d-8312-9a8a38ad4282', 3, NULL, NULL, NULL, NULL, NULL, 'pending', 0, 1, 0, NULL, NULL, 'Muhammad Salman', NULL, 'UTC', NULL, '2024-08-01 22:19:25', '2024-08-01 22:19:25'),
(97, 'Tanseef', 'Ahmed', 'tanseefahmed90@gmail.com', 'tanseefahmed', '$2y$10$qKayo1VpByWU/F/WNq0TnOXDQVPp/m.SYpePugnJ58s0.MasB/8qW', '+9203282076836', NULL, NULL, NULL, 'driver', '120d521d-12ed-4f95-81c9-a5a7a2ee5d4d', 3, NULL, NULL, NULL, NULL, NULL, 'pending', 0, 1, 0, 'null', NULL, 'Tanseef Ahmed', NULL, 'UTC', NULL, '2024-08-02 13:52:55', '2024-08-05 16:28:39');

-- --------------------------------------------------------

--
-- Table structure for table `user_bank_accounts`
--

CREATE TABLE `user_bank_accounts` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `bank_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_holder_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_bank_accounts`
--

INSERT INTO `user_bank_accounts` (`id`, `user_id`, `bank_name`, `bank_code`, `account_holder_name`, `account_number`, `created_at`, `updated_at`) VALUES
(1, 2, 'Meezan', '2010', 'Muhammad Shaheryar', '2010192827191020281', '2024-07-01 20:26:48', '2024-07-01 20:26:48'),
(9, 21, NULL, NULL, NULL, NULL, '2024-07-12 00:27:59', '2024-07-12 00:27:59'),
(11, 29, 'Meezan', '3637', 'REHMAN', '916443494649', '2024-07-13 17:35:21', '2024-07-30 14:32:37'),
(14, 44, NULL, '1234', 'Kamran', NULL, '2024-07-23 17:09:16', '2024-07-23 17:14:02'),
(17, 45, NULL, NULL, NULL, NULL, '2024-07-23 19:21:26', '2024-07-23 19:21:26'),
(18, 49, NULL, NULL, NULL, NULL, '2024-07-23 19:21:41', '2024-07-23 19:21:41'),
(21, 53, NULL, NULL, NULL, NULL, '2024-07-23 19:47:57', '2024-07-23 19:47:57'),
(23, 55, NULL, NULL, NULL, NULL, '2024-07-23 20:06:03', '2024-07-23 20:06:03'),
(24, 88, 'meezan', '26654', 'Shaka', '456286465852', '2024-07-27 22:59:11', '2024-07-27 22:59:11'),
(25, 79, NULL, NULL, NULL, NULL, '2024-07-29 17:17:45', '2024-07-29 17:17:45'),
(26, 75, NULL, NULL, NULL, NULL, '2024-07-29 17:18:31', '2024-07-29 17:18:31'),
(27, 84, NULL, NULL, NULL, NULL, '2024-07-29 17:19:40', '2024-07-29 17:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `car_model` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `car_color` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `car_plate_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `car_production_year` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `work_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `home_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `work_latitude` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `work_longitude` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_latitude` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_longitude` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`id`, `user_id`, `car_model`, `car_color`, `car_plate_number`, `car_production_year`, `work_address`, `home_address`, `work_latitude`, `work_longitude`, `home_latitude`, `home_longitude`, `created_at`, `updated_at`) VALUES
(12, 21, 'My Car', 'Black', 'Ajb926', '2005', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-12 00:22:31', '2024-07-12 00:22:31'),
(16, 29, 'Sazuki WagonR', 'Silver', 'KH00', '2019', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-13 17:31:08', '2024-07-13 17:31:08'),
(27, 44, 'Super Power', 'Black', 'Kom-9446', '2021', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-23 17:07:26', '2024-07-23 17:07:26'),
(28, 45, 'Honda', 'Black', 'Kgf 007', '2013', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-23 19:12:19', '2024-07-23 19:12:19'),
(32, 49, '2013', 'Black', 'KGF-0884', '2013', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-23 19:19:23', '2024-07-23 19:19:23'),
(36, 53, '2018', 'black', 'kjw0247', '2017', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-23 19:45:37', '2024-07-23 19:45:37'),
(38, 55, 'Unique', 'Black', 'KIE-0525', '2015', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-23 20:02:21', '2024-07-23 20:02:21'),
(39, 56, 'honda', 'red', 'lan-5590', '2017', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-24 14:35:09', '2024-07-24 14:35:09'),
(40, 57, 'Super Power', 'Black', 'KIY-2126', '2016', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-24 14:37:16', '2024-07-24 14:37:16'),
(41, 58, 'superpower', 'black', 'kou-6154', '2021', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-24 14:40:51', '2024-07-24 14:40:51'),
(42, 59, 'Super Power', 'Black', 'KIG-6274', '2014', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-24 14:52:09', '2024-07-24 14:52:09'),
(43, 60, 'habib', 'black', 'keg-1276', '2010', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-24 14:53:23', '2024-07-24 14:53:23'),
(44, 61, 'superpower', 'black', 'kkz-7472', '2017', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-24 15:07:08', '2024-07-24 15:07:08'),
(45, 62, 'Sutlej', 'Red', 'BRK-4976', '2017', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-24 15:31:01', '2024-07-24 15:31:01'),
(46, 63, 'Super Power', 'Black', 'KHS-3513', '2014', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-24 16:05:26', '2024-07-24 16:05:26'),
(47, 64, 'Unique', 'Black', 'KFU-8377', '2012', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-24 16:37:55', '2024-07-24 16:37:55'),
(48, 65, 'Wagnar', 'Gray', 'BK-681', '2017', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-24 16:45:14', '2024-07-24 16:45:14'),
(49, 66, 'centro', 'white', 'add-952', '2001', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-24 17:26:43', '2024-07-24 17:26:43'),
(50, 67, 'hi speed', 'red', 'SLN-2788', '2015', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-24 17:51:21', '2024-07-24 17:51:21'),
(51, 68, 'Unique', 'Black', '2009', '2009', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-24 18:23:21', '2024-07-24 18:23:21'),
(52, 69, 'unique', 'black', 'knd-3902', '2019', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-24 18:33:37', '2024-07-24 18:33:37'),
(53, 70, 'super power', 'black', 'kEB-3320', '2018', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-24 18:40:49', '2024-07-24 18:40:49'),
(54, 71, 'Super Power', 'Black', 'KHR-3563', '2014', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-25 03:35:16', '2024-07-25 03:35:16'),
(55, 72, 'Suzuki Cultus', 'Black', 'AJT-294', '2005', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-25 13:06:47', '2024-07-25 13:06:47'),
(56, 73, 'Sazgar Rickshaw', 'Yellow Chocolate Brown', '14609-D18', '2018', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-25 14:01:09', '2024-07-25 14:01:09'),
(57, 74, 'Super Power', 'Black', 'KMW-8309', '2019', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-25 16:48:28', '2024-07-25 16:48:28'),
(58, 75, 'super power', 'black', 'kok-1603', '2021', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-25 17:01:00', '2024-07-25 17:01:00'),
(59, 76, 'target', 'black', 'kga-4493', '2012', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-25 17:25:10', '2024-07-25 17:25:10'),
(60, 77, 'super power', 'black', 'kjf-3822', '2010', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-25 18:04:31', '2024-07-25 18:04:31'),
(61, 78, 'Super Star', 'Black', 'KFK-2056', '2011', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-25 18:08:10', '2024-07-25 18:08:10'),
(62, 79, 'super power', 'black', 'kjf-3822', '2010', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-25 18:08:37', '2024-07-25 18:08:37'),
(63, 80, 'Sitara', 'Black', 'KGV-7192', '2013', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-25 18:54:16', '2024-07-25 18:54:16'),
(64, 81, 'unique', 'black', 'kgl-8061', '2017', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-26 14:52:33', '2024-07-26 14:52:33'),
(65, 82, 'super power', 'black', 'kkv-4813', '2017', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-26 15:10:12', '2024-07-26 15:10:12'),
(66, 83, 'honda', 'red', 'kBR-6256', '2005', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-26 20:12:23', '2024-07-26 20:12:23'),
(67, 84, 'super star', 'black', 'kne-9524', '2019', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-27 16:37:41', '2024-07-27 16:37:41'),
(68, 85, 'unique', 'black', 'kim-9886', '2015', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-27 16:43:38', '2024-07-27 16:43:38'),
(69, 86, 'Suzuki Alto', 'White', 'AXH-392', '2012', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-27 17:11:24', '2024-07-27 17:11:24'),
(70, 87, 'super power', 'black', 'kiq-3079', '2015', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-27 17:57:17', '2024-07-27 17:57:17'),
(71, 89, 'Super Power', 'Black', 'KIU-3758', '2016', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-29 12:24:13', '2024-07-29 12:24:13'),
(72, 92, 'hi speed', 'red', 'hct-2517', '2021', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-29 17:34:32', '2024-07-29 17:34:32'),
(73, 93, 'unique', 'black', 'kec-3206', '2009', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-31 15:24:52', '2024-07-31 15:24:52'),
(74, 94, 'Hi-Speed', 'Black', 'KNK-4591', '2020', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-31 17:34:27', '2024-07-31 17:34:27'),
(75, 96, 'Hi-Speed', 'Black', 'SMF-9755', '2021', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-01 22:19:25', '2024-08-01 22:19:25'),
(76, 97, 'Grace', 'Black', 'KPV-6980', '2022', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-02 13:52:55', '2024-08-02 13:52:55');

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `online_received` double DEFAULT NULL,
  `collected_cash` double DEFAULT NULL,
  `manual_received` double DEFAULT NULL,
  `total_withdrawn` double DEFAULT NULL,
  `currency` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallets`
--

INSERT INTO `wallets` (`id`, `user_id`, `total_amount`, `online_received`, `collected_cash`, `manual_received`, `total_withdrawn`, `currency`, `created_at`, `updated_at`) VALUES
(12, 21, 200000, NULL, NULL, NULL, NULL, 'pkr', '2024-07-12 00:22:31', '2024-07-21 20:29:10'),
(16, 29, 9500, NULL, NULL, NULL, 500, 'pkr', '2024-07-13 17:31:08', '2024-07-30 14:34:03'),
(27, 44, 0, NULL, NULL, NULL, NULL, NULL, '2024-07-23 17:07:26', '2024-07-23 17:07:26'),
(28, 45, 0, NULL, NULL, NULL, NULL, NULL, '2024-07-23 19:12:19', '2024-07-23 19:12:19'),
(32, 49, 0, NULL, NULL, NULL, NULL, NULL, '2024-07-23 19:19:23', '2024-07-23 19:19:23'),
(36, 53, 10000, NULL, NULL, NULL, NULL, 'pkr', '2024-07-23 19:45:37', '2024-07-30 21:17:40'),
(38, 55, 0, NULL, NULL, NULL, NULL, NULL, '2024-07-23 20:02:21', '2024-07-23 20:02:21'),
(39, 56, 0, NULL, NULL, NULL, NULL, NULL, '2024-07-24 14:35:09', '2024-07-24 14:35:09'),
(40, 57, 0, NULL, NULL, NULL, NULL, NULL, '2024-07-24 14:37:16', '2024-07-24 14:37:16'),
(41, 58, 0, NULL, NULL, NULL, NULL, NULL, '2024-07-24 14:40:51', '2024-07-24 14:40:51'),
(42, 59, 0, NULL, NULL, NULL, NULL, NULL, '2024-07-24 14:52:09', '2024-07-24 14:52:09'),
(43, 60, 0, NULL, NULL, NULL, NULL, NULL, '2024-07-24 14:53:23', '2024-07-24 14:53:23'),
(44, 61, 0, NULL, NULL, NULL, NULL, NULL, '2024-07-24 15:07:08', '2024-07-24 15:07:08'),
(45, 62, 0, NULL, NULL, NULL, NULL, NULL, '2024-07-24 15:31:01', '2024-07-24 15:31:01'),
(46, 63, 0, NULL, NULL, NULL, NULL, NULL, '2024-07-24 16:05:26', '2024-07-24 16:05:26'),
(47, 64, 0, NULL, NULL, NULL, NULL, NULL, '2024-07-24 16:37:55', '2024-07-24 16:37:55'),
(48, 65, 0, NULL, NULL, NULL, NULL, NULL, '2024-07-24 16:45:14', '2024-07-24 16:45:14'),
(49, 66, 0, NULL, NULL, NULL, NULL, NULL, '2024-07-24 17:26:43', '2024-07-24 17:26:43'),
(50, 67, 0, NULL, NULL, NULL, NULL, NULL, '2024-07-24 17:51:21', '2024-07-24 17:51:21'),
(51, 68, 0, NULL, NULL, NULL, NULL, NULL, '2024-07-24 18:23:21', '2024-07-24 18:23:21'),
(52, 69, 0, NULL, NULL, NULL, NULL, NULL, '2024-07-24 18:33:37', '2024-07-24 18:33:37'),
(53, 70, 0, NULL, NULL, NULL, NULL, NULL, '2024-07-24 18:40:49', '2024-07-24 18:40:49'),
(54, 71, 0, NULL, NULL, NULL, NULL, NULL, '2024-07-25 03:35:16', '2024-07-25 03:35:16'),
(55, 72, 0, NULL, NULL, NULL, NULL, NULL, '2024-07-25 13:06:47', '2024-07-25 13:06:47'),
(56, 73, 0, NULL, NULL, NULL, NULL, NULL, '2024-07-25 14:01:09', '2024-07-25 14:01:09'),
(57, 74, 0, NULL, NULL, NULL, NULL, NULL, '2024-07-25 16:48:28', '2024-07-25 16:48:28'),
(58, 75, 0, NULL, NULL, NULL, NULL, NULL, '2024-07-25 17:01:00', '2024-07-25 17:01:00'),
(59, 76, 0, NULL, NULL, NULL, NULL, NULL, '2024-07-25 17:25:10', '2024-07-25 17:25:10'),
(60, 77, 0, NULL, NULL, NULL, NULL, NULL, '2024-07-25 18:04:31', '2024-07-25 18:04:31'),
(61, 78, 0, NULL, NULL, NULL, NULL, NULL, '2024-07-25 18:08:10', '2024-07-25 18:08:10'),
(62, 79, 0, NULL, NULL, NULL, NULL, NULL, '2024-07-25 18:08:37', '2024-07-25 18:08:37'),
(63, 80, 0, NULL, NULL, NULL, NULL, NULL, '2024-07-25 18:54:16', '2024-07-25 18:54:16'),
(64, 81, 0, NULL, NULL, NULL, NULL, NULL, '2024-07-26 14:52:33', '2024-07-26 14:52:33'),
(65, 82, 0, NULL, NULL, NULL, NULL, NULL, '2024-07-26 15:10:12', '2024-07-26 15:10:12'),
(66, 83, 0, NULL, NULL, NULL, NULL, NULL, '2024-07-26 20:12:23', '2024-07-26 20:12:23'),
(67, 84, 0, NULL, NULL, NULL, NULL, NULL, '2024-07-27 16:37:41', '2024-07-27 16:37:41'),
(68, 85, 0, NULL, NULL, NULL, NULL, NULL, '2024-07-27 16:43:38', '2024-07-27 16:43:38'),
(69, 86, 0, NULL, NULL, NULL, NULL, NULL, '2024-07-27 17:11:24', '2024-07-27 17:11:24'),
(70, 87, 0, NULL, NULL, NULL, NULL, NULL, '2024-07-27 17:57:17', '2024-07-27 17:57:17'),
(71, 89, 0, NULL, NULL, NULL, NULL, NULL, '2024-07-29 12:24:13', '2024-07-29 12:24:13'),
(72, 92, 0, NULL, NULL, NULL, NULL, NULL, '2024-07-29 17:34:32', '2024-07-29 17:34:32'),
(73, 93, 0, NULL, NULL, NULL, NULL, NULL, '2024-07-31 15:24:52', '2024-07-31 15:24:52'),
(74, 94, 0, NULL, NULL, NULL, NULL, NULL, '2024-07-31 17:34:27', '2024-07-31 17:34:27'),
(75, 96, 0, NULL, NULL, NULL, NULL, NULL, '2024-08-01 22:19:25', '2024-08-01 22:19:25'),
(76, 97, 0, NULL, NULL, NULL, NULL, NULL, '2024-08-02 13:52:55', '2024-08-02 13:52:55');

-- --------------------------------------------------------

--
-- Table structure for table `wallet_histories`
--

CREATE TABLE `wallet_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'credit,debit',
  `transaction_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'credit- ,debit',
  `currency` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double DEFAULT '0',
  `balance` double DEFAULT '0',
  `datetime` datetime DEFAULT NULL,
  `ride_request_id` bigint UNSIGNED DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallet_histories`
--

INSERT INTO `wallet_histories` (`id`, `user_id`, `type`, `transaction_type`, `currency`, `amount`, `balance`, `datetime`, `ride_request_id`, `description`, `data`, `created_at`, `updated_at`) VALUES
(5, 21, 'credit', 'topup', NULL, 100000, 100000, '2024-07-21 13:28:50', NULL, 'testing', NULL, '2024-07-21 20:28:50', '2024-07-21 20:28:50'),
(6, 21, 'credit', 'topup', NULL, 100000, 200000, '2024-07-21 13:29:10', NULL, 'testing', NULL, '2024-07-21 20:29:10', '2024-07-21 20:29:10'),
(8, 29, 'credit', 'topup', NULL, 10000, 10000, '2024-07-21 13:29:39', NULL, NULL, NULL, '2024-07-21 20:29:39', '2024-07-21 20:29:39'),
(10, 29, 'debit', 'withdraw', 'pkr', 500, 9500, '2024-07-30 07:34:03', NULL, NULL, NULL, '2024-07-30 14:34:03', '2024-07-30 14:34:03'),
(11, 53, 'credit', 'topup', NULL, 10000, 10000, '2024-07-30 14:17:40', NULL, NULL, NULL, '2024-07-30 21:17:40', '2024-07-30 21:17:40');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_requests`
--

CREATE TABLE `withdraw_requests` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `amount` double DEFAULT '0',
  `currency` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint DEFAULT '0' COMMENT '0-requested,1-approved,2-decline',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdraw_requests`
--

INSERT INTO `withdraw_requests` (`id`, `user_id`, `amount`, `currency`, `status`, `created_at`, `updated_at`) VALUES
(1, 29, 500, 'pkr', 1, '2024-07-30 14:33:01', '2024-07-30 14:34:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `additional_fees`
--
ALTER TABLE `additional_fees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_settings`
--
ALTER TABLE `app_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`id`),
  ADD KEY `complaints_rider_id_foreign` (`rider_id`),
  ADD KEY `complaints_ride_request_id_foreign` (`ride_request_id`);

--
-- Indexes for table `complaint_comments`
--
ALTER TABLE `complaint_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `complaint_comments_complaint_id_foreign` (`complaint_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `driver_documents`
--
ALTER TABLE `driver_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_documents_driver_id_foreign` (`driver_id`),
  ADD KEY `driver_documents_document_id_foreign` (`document_id`);

--
-- Indexes for table `driver_services`
--
ALTER TABLE `driver_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_services_driver_id_foreign` (`driver_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_order_column_index` (`order_column`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_rider_id_foreign` (`rider_id`),
  ADD KEY `payments_ride_request_id_foreign` (`ride_request_id`);

--
-- Indexes for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_rider_id_foreign` (`rider_id`),
  ADD KEY `reviews_ride_request_id_foreign` (`ride_request_id`);

--
-- Indexes for table `ride_requests`
--
ALTER TABLE `ride_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ride_requests_rider_id_foreign` (`rider_id`);

--
-- Indexes for table `ride_request_histories`
--
ALTER TABLE `ride_request_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ride_request_histories_ride_request_id_foreign` (`ride_request_id`);

--
-- Indexes for table `ride_request_ratings`
--
ALTER TABLE `ride_request_ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ride_request_ratings_ride_request_id_foreign` (`ride_request_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `services_region_id_foreign` (`region_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sos`
--
ALTER TABLE `sos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sos_region_id_foreign` (`region_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Indexes for table `user_bank_accounts`
--
ALTER TABLE `user_bank_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_bank_accounts_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wallets_user_id_foreign` (`user_id`);

--
-- Indexes for table `wallet_histories`
--
ALTER TABLE `wallet_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wallet_histories_user_id_foreign` (`user_id`),
  ADD KEY `wallet_histories_ride_request_id_foreign` (`ride_request_id`);

--
-- Indexes for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `withdraw_requests_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `additional_fees`
--
ALTER TABLE `additional_fees`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `app_settings`
--
ALTER TABLE `app_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `complaint_comments`
--
ALTER TABLE `complaint_comments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `driver_documents`
--
ALTER TABLE `driver_documents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=322;

--
-- AUTO_INCREMENT for table `driver_services`
--
ALTER TABLE `driver_services`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=231;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `regions`
--
ALTER TABLE `regions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ride_requests`
--
ALTER TABLE `ride_requests`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT for table `ride_request_histories`
--
ALTER TABLE `ride_request_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=271;

--
-- AUTO_INCREMENT for table `ride_request_ratings`
--
ALTER TABLE `ride_request_ratings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `sos`
--
ALTER TABLE `sos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `user_bank_accounts`
--
ALTER TABLE `user_bank_accounts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `wallet_histories`
--
ALTER TABLE `wallet_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `complaints`
--
ALTER TABLE `complaints`
  ADD CONSTRAINT `complaints_ride_request_id_foreign` FOREIGN KEY (`ride_request_id`) REFERENCES `ride_requests` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `complaints_rider_id_foreign` FOREIGN KEY (`rider_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `complaint_comments`
--
ALTER TABLE `complaint_comments`
  ADD CONSTRAINT `complaint_comments_complaint_id_foreign` FOREIGN KEY (`complaint_id`) REFERENCES `complaints` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `driver_documents`
--
ALTER TABLE `driver_documents`
  ADD CONSTRAINT `driver_documents_document_id_foreign` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `driver_documents_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `driver_services`
--
ALTER TABLE `driver_services`
  ADD CONSTRAINT `driver_services_driver_id_foreign` FOREIGN KEY (`driver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ride_request_id_foreign` FOREIGN KEY (`ride_request_id`) REFERENCES `ride_requests` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_rider_id_foreign` FOREIGN KEY (`rider_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ride_request_id_foreign` FOREIGN KEY (`ride_request_id`) REFERENCES `ride_requests` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_rider_id_foreign` FOREIGN KEY (`rider_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ride_requests`
--
ALTER TABLE `ride_requests`
  ADD CONSTRAINT `ride_requests_rider_id_foreign` FOREIGN KEY (`rider_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ride_request_histories`
--
ALTER TABLE `ride_request_histories`
  ADD CONSTRAINT `ride_request_histories_ride_request_id_foreign` FOREIGN KEY (`ride_request_id`) REFERENCES `ride_requests` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ride_request_ratings`
--
ALTER TABLE `ride_request_ratings`
  ADD CONSTRAINT `ride_request_ratings_ride_request_id_foreign` FOREIGN KEY (`ride_request_id`) REFERENCES `ride_requests` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_region_id_foreign` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sos`
--
ALTER TABLE `sos`
  ADD CONSTRAINT `sos_region_id_foreign` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_bank_accounts`
--
ALTER TABLE `user_bank_accounts`
  ADD CONSTRAINT `user_bank_accounts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wallets`
--
ALTER TABLE `wallets`
  ADD CONSTRAINT `wallets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wallet_histories`
--
ALTER TABLE `wallet_histories`
  ADD CONSTRAINT `wallet_histories_ride_request_id_foreign` FOREIGN KEY (`ride_request_id`) REFERENCES `ride_requests` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wallet_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  ADD CONSTRAINT `withdraw_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
