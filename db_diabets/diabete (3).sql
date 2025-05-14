-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2025 at 09:35 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `diabete`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `blog_id` bigint(20) UNSIGNED NOT NULL,
  `author_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`blog_id`, `author_id`, `title`, `slug`, `content`, `image_url`, `created_at`, `updated_at`) VALUES
(2, 2, 'مقال م اسامه عبده علي المشرقي', 'مقا لشرف', 'مقال متميز', '1744129259.jpg', '2025-04-08 13:21:01', '2025-04-11 14:35:13'),
(3, 2, 'سيشبشسيبس', 'بشسيبسيبشسيبسيب', 'سيبسيبسيببيسبببيسبب', '1744129262.jpg', '2025-04-08 13:21:02', '2025-04-08 13:21:02'),
(13, 1, 'من اسامه الى شرف', 'شرف مقال', 'على هونك', '1744680943.png', '2025-04-14 18:46:34', '2025-04-14 22:35:43'),
(14, 5, 'هيا ناهي', 'هيا ناهي', 'على هونك', '1744667316.png', '2025-04-14 18:48:36', '2025-04-14 18:48:36'),
(15, 1, 'sssss', 'sdfdsf', 'dsffdsfsddewd', '1744680065.jpg', '2025-04-14 22:11:12', '2025-04-14 22:21:05'),
(16, 1, 'blog text', 'blog text', 'blog text content', NULL, '2025-04-18 12:56:46', '2025-04-18 12:56:46'),
(17, 1, 'blog text', 'blog text', 'blog text content', NULL, '2025-04-18 12:56:47', '2025-04-18 12:56:47'),
(26, 5, 'نقلهم بعد', 'عنقلهم', 'عنقلهم', '1746400739.png', '2025-05-04 20:18:59', '2025-05-04 20:18:59'),
(27, 5, 'نقلهم بعد', 'عنقلهم', 'عنقلهم', '1746400852.png', '2025-05-04 20:20:53', '2025-05-04 20:20:53'),
(28, 5, 'نقلهم بعد', 'nklhm-baad', 'عنقلهم', '1746401015.png', '2025-05-04 20:23:36', '2025-05-04 20:23:36'),
(29, 5, 'نقلهم بعد', 'nklhm-baad', 'عنقلهم', '1746401019.png', '2025-05-04 20:23:40', '2025-05-04 20:23:40'),
(30, 5, 'نقلهم بعد', 'nklhm-baad', 'عنقلهم', '1746401445.png', '2025-05-04 20:30:46', '2025-05-04 20:30:46'),
(31, 5, 'نقلهم بعد', 'nklhm-baad', 'عنقلهم', '1746401458.png', '2025-05-04 20:30:58', '2025-05-04 20:30:58'),
(32, 1, 'مقال جديد', 'php', 'عن filament 3', 'uploads/blogs/01JTY7TTGPY8C7AXJ50KZDKXYB.jpeg', '2025-05-10 20:17:37', '2025-05-10 20:17:37');

-- --------------------------------------------------------

--
-- Table structure for table `blog_comments`
--

CREATE TABLE `blog_comments` (
  `comment_id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_comments`
--

INSERT INTO `blog_comments` (`comment_id`, `blog_id`, `user_id`, `comment`, `created_at`, `updated_at`) VALUES
(9, 3, 1, 'انه مقال ممتاز دكتورنا العزيز الفاضل ddd', '2025-04-14 13:10:24', '2025-04-14 13:10:24'),
(10, 3, 1, 'انه مقال ممتاز دكتورنا العزيز', '2025-04-14 13:16:42', '2025-04-14 13:16:42'),
(13, 3, 1, 'انه مقال ممتاز دكتورنا العزيز الفاضل ddd', '2025-04-14 13:29:34', '2025-04-14 13:29:34'),
(14, 2, 1, 'rferferferf', '2025-04-15 21:46:39', '2025-04-15 21:46:39'),
(16, 14, 2, 'انه مقال ممتاز دكتورنا العزيز الفاضل ddd', '2025-04-20 18:40:14', '2025-04-20 18:40:14'),
(17, 14, 2, 'فاشل', '2025-04-20 18:44:12', '2025-04-20 18:44:12');

-- --------------------------------------------------------

--
-- Table structure for table `blood_tests`
--

CREATE TABLE `blood_tests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `test_type` enum('fasting_glucose','hba1c','triglycerides','kidney_function') NOT NULL,
  `result` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blood_tests`
--

INSERT INTO `blood_tests` (`id`, `patient_id`, `attachment`, `test_type`, `result`, `created_at`, `updated_at`) VALUES
(20, 32, NULL, 'hba1c', 98.00, '2025-03-15 19:45:47', '2025-03-15 19:45:47');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel_cache_356a192b7913b04c54574d18c28d46e6395428ab', 'i:2;', 1746919109),
('laravel_cache_356a192b7913b04c54574d18c28d46e6395428ab:timer', 'i:1746919109;', 1746919109),
('laravel_cache_livewire-rate-limiter:9178fb51a4883de18f87f7706cfba0f1f037623c', 'i:1;', 1747076065),
('laravel_cache_livewire-rate-limiter:9178fb51a4883de18f87f7706cfba0f1f037623c:timer', 'i:1747076065;', 1747076065),
('laravel_cache_livewire-rate-limiter:a17961fa74e9275d529f489537f179c05d50c2f3', 'i:1;', 1746908972),
('laravel_cache_livewire-rate-limiter:a17961fa74e9275d529f489537f179c05d50c2f3:timer', 'i:1746908972;', 1746908972);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `resume` varchar(255) DEFAULT NULL,
  `specialization` varchar(255) DEFAULT NULL,
  `status` enum('active','paused') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `license_image` varchar(255) DEFAULT NULL,
  `license_number` varchar(255) DEFAULT NULL,
  `license_expiry_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `user_id`, `resume`, `specialization`, `status`, `created_at`, `updated_at`, `license_image`, `license_number`, `license_expiry_date`) VALUES
(1, 2, NULL, 'بسثسثبسثسبثس', 'active', NULL, NULL, NULL, NULL, NULL),
(2, 5, '1744677394.pdf', 'سكؤي', 'paused', NULL, '2025-04-20 14:54:59', '1745171699.jpg', '1342141414234', '2025-04-30'),
(5, 49, '1744676915.pdf', 'غدد صماء', 'active', NULL, NULL, NULL, NULL, NULL),
(6, 60, '1744742688.pdf', 'قدم سكري', 'active', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `drugs`
--

CREATE TABLE `drugs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `drog_name` varchar(255) DEFAULT NULL,
  `drug_type` enum('pills','injections','syrup') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `drugs`
--

INSERT INTO `drugs` (`id`, `drog_name`, `drug_type`, `created_at`, `updated_at`) VALUES
(1, 'Paracetamol', 'pills', '2025-03-15 19:12:36', '2025-03-15 19:12:36'),
(2, 'Amoxicillin', 'pills', '2025-03-15 19:12:36', '2025-03-15 19:12:36'),
(3, 'Paracetamol', 'pills', '2025-03-15 19:23:07', '2025-03-15 19:23:07'),
(4, 'Amoxicillin', 'pills', '2025-03-15 19:23:07', '2025-03-15 19:23:07'),
(5, 'Paracetamol', 'pills', '2025-03-15 19:24:00', '2025-03-15 19:24:00'),
(6, 'Amoxicillin', 'pills', '2025-03-15 19:24:00', '2025-03-15 19:24:00'),
(7, 'Paracetamol', 'pills', '2025-03-15 19:25:04', '2025-03-15 19:25:04'),
(8, 'Amoxicillin', 'pills', '2025-03-15 19:25:04', '2025-03-15 19:25:04'),
(9, 'Paracetamol', 'pills', '2025-03-15 19:26:20', '2025-03-15 19:26:20'),
(10, 'Amoxicillin', 'pills', '2025-03-15 19:26:20', '2025-03-15 19:26:20'),
(11, 'Paracetamol', 'pills', '2025-03-15 19:27:20', '2025-03-15 19:27:20'),
(12, 'Amoxicillin', 'pills', '2025-03-15 19:27:20', '2025-03-15 19:27:20'),
(13, 'Paracetamol', 'pills', '2025-03-15 19:29:34', '2025-03-15 19:29:34'),
(14, 'Amoxicillin', 'pills', '2025-03-15 19:29:34', '2025-03-15 19:29:34'),
(15, 'Paracetamol', 'pills', '2025-03-15 19:30:20', '2025-03-15 19:30:20'),
(16, 'Amoxicillin', 'pills', '2025-03-15 19:30:20', '2025-03-15 19:30:20'),
(17, 'Paracetamol', 'pills', '2025-03-15 19:31:30', '2025-03-15 19:31:30'),
(18, 'Amoxicillin', 'pills', '2025-03-15 19:31:30', '2025-03-15 19:31:30'),
(19, 'Paracetamol', 'pills', '2025-03-15 19:45:47', '2025-03-15 19:45:47'),
(20, 'Amoxicillin', 'pills', '2025-03-15 19:45:47', '2025-03-15 19:45:47');

-- --------------------------------------------------------

--
-- Table structure for table `drug_recommendations`
--

CREATE TABLE `drug_recommendations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `drug_id` bigint(20) UNSIGNED NOT NULL,
  `when_to_take` enum('after_meal','before_meal') DEFAULT NULL,
  `time_to_take` enum('morning','afternoon','evening') DEFAULT NULL,
  `number_of_takes` enum('1','2','3') DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exercises`
--

CREATE TABLE `exercises` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `exercise_name` varchar(255) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exercises`
--

INSERT INTO `exercises` (`id`, `exercise_name`, `image_url`, `created_at`, `updated_at`) VALUES
(1, 'pup up', 'defiule.jpg', NULL, NULL),
(2, 'pup up', 'defiule.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exercise_recommendations`
--

CREATE TABLE `exercise_recommendations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `exercise_id` bigint(20) UNSIGNED NOT NULL,
  `exercise_description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exercise_recommendations`
--

INSERT INTO `exercise_recommendations` (`id`, `patient_id`, `exercise_id`, `exercise_description`, `created_at`, `updated_at`) VALUES
(4, 32, 1, 'jkasdadgkjasdasd', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`id`, `user_id`, `blog_id`, `created_at`, `updated_at`) VALUES
(7, 6, 2, '2025-05-04 18:35:31', '2025-05-04 18:35:31'),
(8, 1, 13, '2025-05-10 20:31:26', '2025-05-10 20:31:26');

-- --------------------------------------------------------

--
-- Table structure for table `glucose_readings`
--

CREATE TABLE `glucose_readings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `reading_value` decimal(5,2) DEFAULT NULL,
  `reading_type` enum('after_meal','before_meal') DEFAULT 'before_meal',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lifestyle_assessment`
--

CREATE TABLE `lifestyle_assessment` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `physical_activity_level` varchar(255) DEFAULT NULL,
  `medications` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`medications`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lifestyle_assessment`
--

INSERT INTO `lifestyle_assessment` (`id`, `patient_id`, `physical_activity_level`, `medications`, `created_at`, `updated_at`) VALUES
(10, 32, 'متحسن', '[\"sihsoi\",\"shoid\"]', '2025-03-15 19:45:47', '2025-03-15 19:45:47');

-- --------------------------------------------------------

--
-- Table structure for table `meals`
--

CREATE TABLE `meals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `meal_name` varchar(255) NOT NULL,
  `calories` varchar(255) DEFAULT NULL,
  `meal_description` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meals`
--

INSERT INTO `meals` (`id`, `meal_name`, `calories`, `meal_description`, `image_url`, `created_at`, `updated_at`) VALUES
(1, 'فته', '100', 'فته عسل ', '123123123ز1ا', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `meal_recommendations`
--

CREATE TABLE `meal_recommendations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `meal_id` bigint(20) UNSIGNED NOT NULL,
  `meal_time` text DEFAULT NULL,
  `meal_setup` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meal_recommendations`
--

INSERT INTO `meal_recommendations` (`id`, `patient_id`, `meal_id`, `meal_time`, `meal_setup`, `created_at`, `updated_at`) VALUES
(2, 32, 1, 'بعد الصبوح', 'ملعقتين', '2025-05-12 15:00:02', '2025-05-12 15:00:02'),
(3, 32, 1, 'بعد الغدا', 'نص صحن صغير', '2025-05-12 15:00:37', '2025-05-12 15:00:37');

-- --------------------------------------------------------

--
-- Table structure for table `meal_systems`
--

CREATE TABLE `meal_systems` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `meal_name` varchar(255) NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `meal_time` varchar(255) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `meal_setup` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meal_systems`
--

INSERT INTO `meal_systems` (`id`, `meal_name`, `patient_id`, `meal_time`, `image_url`, `meal_setup`, `created_at`, `updated_at`) VALUES
(3, 'ظبممرزىلنلم', 32, 'ضهرا', '/data/user/0/com.example.sukari_care/cache/6e144567-bc68-4aaa-bc67-c444240d6afc/٢٠٢٥٠٥١٢_١٤٠٣٥٢.jpg', 'رمرزرمبوؤترنربظ', '2025-05-12 14:54:50', '2025-05-12 14:54:50'),
(4, 'بكفومؤزقيمز', 32, 'عشاء', '/data/user/0/com.example.sukari_care/cache/6cd8e358-fa21-4c75-a0cc-1cdd927916e1/٢٠٢٥٠٥١٢_١٤٠٣٥٢.jpg', 'مبزقمرزرو', '2025-05-12 14:54:50', '2025-05-12 14:54:50');

-- --------------------------------------------------------

--
-- Table structure for table `medical_history`
--

CREATE TABLE `medical_history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('active','resolved') DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `medical_history`
--

INSERT INTO `medical_history` (`id`, `patient_id`, `status`, `notes`, `created_at`, `updated_at`) VALUES
(1, 32, 'active', 'استمرار انخفاض معدل السكر التراكمي من 7.2 إلى 7 وانخفاض معدل الضغط', '2025-03-15 19:45:47', '2025-03-15 19:45:47');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_02_27_222845_create_user_profiles_table', 1),
(5, '2025_02_27_222931_create_doctors_table', 1),
(6, '2025_02_27_223015_create_patients_table', 1),
(7, '2025_02_27_223114_create_medical_histories_table', 1),
(8, '2025_02_27_224844_create_blogs_table', 1),
(9, '2025_02_27_224927_create_blog_comments_table', 1),
(11, '2025_02_27_223354_create_symptoms_table', 2),
(12, '2025_03_07_213412_create_personal_access_tokens_table', 2),
(13, '2025_02_27_223509_create_physical_examinations_table', 3),
(14, '2025_02_27_223546_create_blood_tests_table', 4),
(19, '2025_02_27_223835_create_patient_goals_table', 6),
(20, '2025_02_27_224652_create_drug_recommendations_table', 7),
(22, '2025_02_27_223701_create_lifestyle_assessments_table', 8),
(79, '2025_02_27_223905_create_glucose_readings_table', 9),
(81, '2025_02_27_224757_create_exercise_recommendations_table', 9),
(82, '2025_04_08_223527_create_relatives_table', 9),
(83, '2025_04_12_141203_create_notifications_table', 9),
(86, '2025_04_14_134910_create_favorites_table', 10),
(87, '2025_04_17_195141_add_otp', 11),
(88, '2025_04_18_213034_add_license', 12),
(91, '2025_05_04_203553_add_phone', 13),
(93, '2025_05_12_150053_create_meal_systems_table', 14),
(94, '2025_02_27_224726_create_meal_recommendations_table', 15);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('180b9c0a-e23d-48ab-ae24-6697dfbae320', 'App\\Notifications\\DoctorNewRecommandationNotfication', 'App\\Models\\User', 38, '{\"id\":3,\"title\":\"New Recommandation Added meal \\u0641\\u062a\\u0647\",\"data\":\"this recommendation at 2025-05-12 18:00:37\",\"notifiable_id\":\"32\"}', NULL, '2025-05-12 15:00:37', '2025-05-12 15:00:37'),
('3d734077-8cac-42eb-ba36-6c802541cddb', 'App\\Notifications\\DoctorNewRecommandationNotfication', 'App\\Models\\User', 6, '{\"id\":10,\"title\":\"New Recommandation Added meal soshi\",\"data\":\"this recommendation at 2025-05-04 23:14:55\",\"notifiable_id\":\"3\"}', '2025-05-04 20:14:58', '2025-05-04 20:14:55', '2025-05-04 20:14:58'),
('69327320-6aa8-4175-837f-ee5936fa8379', 'App\\Notifications\\DoctorNewRecommandationNotfication', 'App\\Models\\User', 38, '{\"id\":2,\"title\":\"New Recommandation Added meal \\u0641\\u062a\\u0647\",\"data\":\"this recommendation at 2025-05-12 18:00:02\",\"notifiable_id\":\"32\"}', NULL, '2025-05-12 15:00:02', '2025-05-12 15:00:02'),
('8aac34fb-47e4-4eee-948d-7433c7894303', 'App\\Notifications\\DoctorNewRecommandationNotfication', 'App\\Models\\User', 38, '{\"id\":11,\"title\":\"New Recommandation Added meal soshi\",\"data\":\"this recommendation at 2025-05-12 16:23:07\",\"notifiable_id\":\"32\"}', NULL, '2025-05-12 13:23:10', '2025-05-12 13:23:10'),
('bd25dc06-637c-43a6-ab06-921fd0dcbb67', 'App\\Notifications\\DoctorNewRecommandationNotfication', 'App\\Models\\User', 38, '{\"id\":13,\"title\":\"New Recommandation Added meal soshi\",\"data\":\"this recommendation at 2025-05-12 16:24:35\",\"notifiable_id\":\"32\"}', NULL, '2025-05-12 13:24:35', '2025-05-12 13:24:35');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `user_id`, `doctor_id`, `created_at`, `updated_at`) VALUES
(3, 6, 2, '2025-03-11 16:59:58', '2025-03-11 16:59:58'),
(32, 38, 2, '2025-03-15 19:45:47', '2025-03-15 19:45:47');

-- --------------------------------------------------------

--
-- Table structure for table `patient_goals`
--

CREATE TABLE `patient_goals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `goal_description` text DEFAULT NULL,
  `goal_status` enum('pending','achieved','not achieved') NOT NULL DEFAULT 'pending',
  `target_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `patient_goals`
--

INSERT INTO `patient_goals` (`id`, `patient_id`, `goal_description`, `goal_status`, `target_date`, `created_at`, `updated_at`) VALUES
(12, 32, 'انزال التراكمي الى  6', 'pending', '2025-02-02', '2025-03-15 19:45:47', '2025-03-15 19:45:47');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(197, 'App\\Models\\User', 38, 'web', '57a5cef6dddaa60a9c61632eac33a857937eb22d7ead5a01b4f853242c49d31a', '[\"*\"]', NULL, NULL, '2025-05-12 12:44:25', '2025-05-12 12:44:25'),
(198, 'App\\Models\\User', 38, 'web', 'a9ca52079452e163dd24173f689a510ac08ce29d5b6725c226425caa8d0b114f', '[\"*\"]', '2025-05-12 12:58:54', NULL, '2025-05-12 12:44:59', '2025-05-12 12:58:54'),
(199, 'App\\Models\\User', 5, 'web', '197b1454a2c8e69aa263955af3eb76d8920328970c5fbf49a62688f4a82c46a6', '[\"*\"]', NULL, NULL, '2025-05-12 12:58:14', '2025-05-12 12:58:14'),
(200, 'App\\Models\\User', 38, 'web', 'ae72a3c0fc1469e71a9437dace90ca0ecdd3567eb5a00c1071b296ddc83b178f', '[\"*\"]', '2025-05-12 13:02:33', NULL, '2025-05-12 13:00:23', '2025-05-12 13:02:33'),
(201, 'App\\Models\\User', 38, 'web', 'bc710c82f6041d5982fc3c6b350b2301c46f5b334e540d0baf15c6a866b90d0c', '[\"*\"]', '2025-05-12 13:16:17', NULL, '2025-05-12 13:06:16', '2025-05-12 13:16:17'),
(202, 'App\\Models\\User', 5, 'web', '3606f6dffd2487ec4bcc28dc746428ab156a40561e104b1d3ce7364d8f24f71b', '[\"*\"]', NULL, NULL, '2025-05-12 13:06:25', '2025-05-12 13:06:25'),
(203, 'App\\Models\\User', 5, 'web', '68dd3ea5491eed3c83374a9b3344da220d719f426457220652d2e0fdb2f39bee', '[\"*\"]', NULL, NULL, '2025-05-12 13:07:49', '2025-05-12 13:07:49'),
(204, 'App\\Models\\User', 5, 'web', '38b3fb38b194bc2050350d8dc7af234391812751285148feccb40758ed7c1aa6', '[\"*\"]', NULL, NULL, '2025-05-12 13:09:31', '2025-05-12 13:09:31'),
(205, 'App\\Models\\User', 38, 'web', '19a0ebc0317d2f78f7734e4a9e8d45093005269327d3af024e4efa6664bb2c28', '[\"*\"]', NULL, NULL, '2025-05-12 13:09:55', '2025-05-12 13:09:55'),
(206, 'App\\Models\\User', 38, 'web', 'b17f23fe19549b8ebd583f48299c40c815a48c6ff0900ddfc9b7ebbd7d3b77a5', '[\"*\"]', '2025-05-12 13:17:16', NULL, '2025-05-12 13:17:02', '2025-05-12 13:17:16'),
(207, 'App\\Models\\User', 38, 'web', '677686ff7e382b5ef08439198e0df8b974110c432d2fe597bfdad0919e51ce57', '[\"*\"]', NULL, NULL, '2025-05-12 13:18:08', '2025-05-12 13:18:08'),
(209, 'App\\Models\\User', 38, 'web', '22631f5898e678a09130acbfc79c297f10ed0669fac342d63f10a4a46285174e', '[\"*\"]', NULL, NULL, '2025-05-12 13:19:17', '2025-05-12 13:19:17'),
(210, 'App\\Models\\User', 5, 'web', '812a7e0aa61f5a49822dc3851b80fa5315cfde69985af10b6081b584c455d986', '[\"*\"]', '2025-05-12 13:24:35', NULL, '2025-05-12 13:21:07', '2025-05-12 13:24:35'),
(211, 'App\\Models\\User', 5, 'web', '86dca5192228f507ce919f3ab09455b9e1339aa2b56965f8e2edc48d3630da51', '[\"*\"]', NULL, NULL, '2025-05-12 14:13:05', '2025-05-12 14:13:05'),
(212, 'App\\Models\\User', 38, 'web', '2474aec3d90fe01a686bf59a806047343b36b111d9f4eb73b65d254dbdb418b7', '[\"*\"]', NULL, NULL, '2025-05-12 14:15:24', '2025-05-12 14:15:24'),
(213, 'App\\Models\\User', 38, 'web', '07e14d3f5d2721e45c41037f4a8fdc0c985468ed9c76462d46a9d855f2cf3a2c', '[\"*\"]', '2025-05-12 16:17:06', NULL, '2025-05-12 14:15:59', '2025-05-12 16:17:06'),
(214, 'App\\Models\\User', 38, 'web', 'f1d6201bab6f383e26cd18b477441dc1b11c4e186536000bb5aec689cb643d97', '[\"*\"]', NULL, NULL, '2025-05-12 14:22:47', '2025-05-12 14:22:47'),
(215, 'App\\Models\\User', 38, 'web', 'a227f28081affb8de3d6fbc40f5887c204fd9ffc89a98aa7a33209b1fd3c5694', '[\"*\"]', '2025-05-12 14:43:16', NULL, '2025-05-12 14:38:40', '2025-05-12 14:43:16'),
(216, 'App\\Models\\User', 38, 'web', '720032084abd13b8ce9a98f3442e9afa2c46326ce90f615c320329332e602268', '[\"*\"]', NULL, NULL, '2025-05-12 14:44:14', '2025-05-12 14:44:14'),
(217, 'App\\Models\\User', 38, 'web', 'e36c04485d7e7cb5899aa84267fdcb5e54a04c53bdec7e1338ff1b2e7e3d51d3', '[\"*\"]', NULL, NULL, '2025-05-12 14:44:54', '2025-05-12 14:44:54'),
(218, 'App\\Models\\User', 38, 'web', 'f5c81eb5eaadc73424b34762af2b234484735c488562a0b4422e20cd4a454242', '[\"*\"]', '2025-05-12 14:54:50', NULL, '2025-05-12 14:54:29', '2025-05-12 14:54:50'),
(219, 'App\\Models\\User', 5, 'web', '94c5baf6d2cedc79c5bd40d03a90545d141605d3110c8db87ce9b20cb582c6cf', '[\"*\"]', '2025-05-12 15:00:37', NULL, '2025-05-12 14:56:33', '2025-05-12 15:00:37'),
(220, 'App\\Models\\User', 38, 'web', '7897f966662d8d1f0e5c15ca191ae428606a551f3e5eed2248c38a3a4c2aa2e9', '[\"*\"]', '2025-05-12 16:11:37', NULL, '2025-05-12 15:24:07', '2025-05-12 16:11:37'),
(221, 'App\\Models\\User', 38, 'web', 'ac2a54049fec2bdefc8ee7326fcc53ee9a6a2b5a5f98581ec82cd4f5626138b7', '[\"*\"]', NULL, NULL, '2025-05-12 15:58:28', '2025-05-12 15:58:28'),
(222, 'App\\Models\\User', 38, 'web', '1454c8b3d9c1af3e2a862c9c46a5c47344b6230da5d988109f7fbbac6e5b004c', '[\"*\"]', '2025-05-12 16:19:31', NULL, '2025-05-12 16:16:22', '2025-05-12 16:19:31');

-- --------------------------------------------------------

--
-- Table structure for table `physical_examination`
--

CREATE TABLE `physical_examination` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `blood_pressure` varchar(255) DEFAULT NULL,
  `heart_rate` int(11) DEFAULT NULL,
  `weight` decimal(5,2) DEFAULT NULL,
  `height` decimal(5,2) DEFAULT NULL,
  `bmi` decimal(5,2) DEFAULT NULL,
  `foot_examination_notes` text DEFAULT NULL,
  `skin_examination_notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `physical_examination`
--

INSERT INTO `physical_examination` (`id`, `patient_id`, `blood_pressure`, `heart_rate`, `weight`, `height`, `bmi`, `foot_examination_notes`, `skin_examination_notes`, `created_at`, `updated_at`) VALUES
(22, 32, '100/80', 81, 68.00, 167.00, 23.90, 'foot_examination_notes.pdf', 'skin_examination_notes', '2025-03-15 19:45:47', '2025-03-15 19:45:47');

-- --------------------------------------------------------

--
-- Table structure for table `relatives`
--

CREATE TABLE `relatives` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `relatives`
--

INSERT INTO `relatives` (`id`, `patient_id`, `user_id`, `created_at`, `updated_at`) VALUES
(12, 32, 143, '2025-05-11 21:48:23', '2025-05-11 21:48:23'),
(13, 32, 144, '2025-05-11 21:50:59', '2025-05-11 21:50:59'),
(14, 32, 145, '2025-05-11 21:52:20', '2025-05-11 21:52:20'),
(15, 32, 146, '2025-05-11 21:54:00', '2025-05-11 21:54:00'),
(16, 32, 147, '2025-05-12 10:58:50', '2025-05-12 10:58:50'),
(17, 32, 148, '2025-05-12 11:04:03', '2025-05-12 11:04:03'),
(18, 32, 149, '2025-05-12 11:09:24', '2025-05-12 11:09:24');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('moLRSiS702SnhAMJRd5WlUy5Dk07s11RVIZeE8NE', 5, '192.168.0.151', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRENxdDdXYUY1OHgwSDNjUFpJenhuSUlYajFlTUZZSmJBZm5kR2hXOCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xOTIuMTY4LjAuMTUxOjgwMDAvdXNlci9wYXRpZW50cyI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjU7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMiRPaVY1NTJCOU1GZnNrQnJGZUkvbDguYTFKWGs5UkU4VTFFNXUxcTE1aXlLSEROaU9WRXhZUyI7fQ==', 1747076013);

-- --------------------------------------------------------

--
-- Table structure for table `symptoms`
--
-- Error reading structure for table diabete.symptoms: #1932 - Table &#039;diabete.symptoms&#039; doesn&#039;t exist in engine
-- Error reading data for table diabete.symptoms: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `diabete`.`symptoms`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `otp` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL DEFAULT '123456',
  `status` enum('active','suspend') NOT NULL DEFAULT 'active',
  `role` enum('admin','doctor','patient','relative') DEFAULT 'doctor',
  `image_url` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `otp`, `email`, `email_verified_at`, `password`, `status`, `role`, `image_url`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '967781236868', '$2y$12$2a/oNeb4TyLu5I1dXE9pKejprqubdIxDU.lgIoPffZ6aaK/SM3SDm', 'admin@gmail.com', NULL, '$2y$12$9f6o/Pq6P0cJ4UwoFT3Sp.nzZryLx6gERy2F6LDL76Iua2JeY7bVK', 'active', 'admin', NULL, '75gsmCZAftBh255Vxnn7mBsilVoYR2DAPGkCZVn3S1qbrG2ADdA6M2vrjX7H', '2025-03-11 16:30:49', '2025-05-10 07:50:42'),
(2, 'osama Abdo', '967772790221', NULL, 'osamaten77@gmail.com', NULL, '$2y$12$OiV552B9MFfskBrFeI/l8.a1JXk9RE8U1E5u1q15iyKHDNiOVExYS', 'active', 'admin', NULL, 'yqxc6OMAGQkyCSs5yX3hlup4qGhLAM6kSCJAir6igCjM7pInysXfu3omKlms', '2025-03-11 16:34:22', '2025-04-18 13:29:51'),
(5, 'sharaf', '967712118984', '$2y$12$c8HjILYuRQ7Fnq2QxFwIKOsEWZkmmLJpwNYDvFHfHLG4EWbNGs1o6', 'sharaf@gmail.com', NULL, '$2y$12$OiV552B9MFfskBrFeI/l8.a1JXk9RE8U1E5u1q15iyKHDNiOVExYS', 'active', 'doctor', NULL, 'ZbmD6CFJLMEl6l3rrNh82tRi1tTcBRQR2fF6xOlInLgFMPK98yPq0d9lRPHr', '2025-03-11 16:58:27', '2025-05-10 22:30:12'),
(6, 'ali', '967771846099', NULL, 'ali@gmail.coms', NULL, '$2y$12$OiV552B9MFfskBrFeI/l8.a1JXk9RE8U1E5u1q15iyKHDNiOVExYS', 'active', 'patient', NULL, 'XP9MsbMB0Hyu79KNGQuLRhKHeXO0L735o6xSAH25MrB6tQs84U34gl12eOsh', '2025-03-11 16:59:58', '2025-05-04 19:32:29'),
(38, 'zakrya', '967777011235', NULL, 'zakrya@gmail.coms', NULL, '$2y$12$9f6o/Pq6P0cJ4UwoFT3Sp.nzZryLx6gERy2F6LDL76Iua2JeY7bVK', 'active', 'patient', NULL, NULL, '2025-03-15 19:45:47', '2025-03-15 19:45:47'),
(45, 'rel ahmed', NULL, NULL, 'relative@gmail.com', NULL, '$2y$12$HZkOIU/sXHlICNkYEbUw8OI.N0NeZldjKxGRWV.L9e1AHSmstGUJ6', 'active', 'relative', NULL, NULL, '2025-04-08 19:47:54', '2025-05-10 21:38:29'),
(46, 'osama711', NULL, NULL, 'osamaabdu711@gmail.com', NULL, '$2y$12$3YD3CfKTkwfSbbxi3L7S9.2rakr0Eri.mFVYqJEytPsMR2tzxSDgK', 'active', 'patient', NULL, 'cvhDdr0cOSASsGXttPPaGxLUOAU2Q2iR4Syjpdo8PKTLJaUMsxTRghPgZjBf', '2025-04-12 19:12:52', '2025-05-04 18:34:20'),
(47, 'abdu', NULL, NULL, 'abdu@gmail.com', NULL, '$2y$12$0WHF3WFIU1o5RLCBuaHvoOILBDFAS/Q4AqNQY.ZOvWwPmwB7aGLFS', 'active', 'doctor', NULL, NULL, '2025-04-13 11:02:52', '2025-04-13 11:02:52'),
(48, 'abdu', NULL, NULL, 'abdus@gmail.com', NULL, '$2y$12$zrZH0T1Ln/ZcEfIRR/vE3uBqCeWTEt0a3N3KJMXI1Fsr9L6RDwkvK', 'active', 'doctor', NULL, NULL, '2025-04-13 11:06:33', '2025-04-13 11:06:33'),
(49, 'abdu', NULL, NULL, 'abduss@gmail.com', NULL, '$2y$12$6QXHZX.WyaPReTFHwmPwEOBXVketN6mN3oVH0tdgdbg2ksj8A63oW', 'active', 'doctor', NULL, NULL, '2025-04-13 11:09:07', '2025-04-14 21:28:35'),
(50, 'wssem', NULL, NULL, 'wssem@gmail.com', NULL, '$2y$12$MueRNpmrC4phWE2foGa2w.xZ0IN3.m333UBopgWeVQSAIORFZ6abu', 'active', 'relative', NULL, NULL, '2025-04-13 20:17:17', '2025-04-13 20:47:18'),
(59, 'nasser', NULL, NULL, 'nasser@gmail.com', NULL, '$2y$12$1IROj0pmnwZpZBF31.457OabxYVZ99yDOdvXySlpNfKUw.Gpa/GRq', 'active', 'doctor', NULL, NULL, '2025-04-14 20:27:26', '2025-04-14 20:28:26'),
(60, 'nasser', NULL, NULL, 'nassers@gmail.com', NULL, '$2y$12$TBPvUukL/7yGoJpnLWXHGONKkzBLB7/KzKZvWa9lRf3g2gcEBctbC', 'active', 'doctor', NULL, NULL, '2025-04-15 15:44:48', '2025-04-15 16:03:33'),
(61, 'aliss', NULL, NULL, 'aliss@gmail.com', NULL, '$2y$12$dXvY7nQpl11pbm/oKW3ZDOJKdPkOyepHmpCTquYQykMi8nyAsl6t.', 'active', 'doctor', NULL, NULL, '2025-04-15 16:04:38', '2025-04-15 16:04:38'),
(77, 'abdualrhman', '967777777777', NULL, 'abdualrhman@gmail.com', NULL, '$2y$12$OiV552B9MFfskBrFeI/l8.a1JXk9RE8U1E5u1q15iyKHDNiOVExYS', 'active', 'relative', NULL, NULL, '2025-04-16 15:46:38', '2025-04-16 15:52:13'),
(78, 'ah', NULL, NULL, 'osamaabdu7111@gmail.com', NULL, '$2y$12$fw5RPcbwOL0IGm.JcjXTjOHls5TC0UjjNZI3rrWKhlHWX6akdcUom', 'active', NULL, NULL, NULL, '2025-04-16 18:54:47', '2025-04-16 18:54:47'),
(79, 'ASAM', NULL, NULL, 'asma@gmail.com', NULL, '$2y$12$c7ue1a/ArxDYd89B10ru7O2iRxYzgWW9oQp9mGN3PlWdSfTlKRaqi', 'active', NULL, NULL, NULL, '2025-04-17 19:14:38', '2025-04-17 19:14:38'),
(143, 'PL[[[', NULL, NULL, 'PL[[[103460@gmail.coms', NULL, '$2y$12$Ri/egrzH8baPxLXs6hv7fOGwGFUTBgyZY6HKiIrEGluIHIbPFWKwy', 'active', 'relative', NULL, NULL, '2025-05-11 21:48:23', '2025-05-11 21:48:23'),
(144, 'ah', '967788888888', NULL, 'ah653134@gmail.coms', NULL, '$2y$12$nU3qIfOdAB3AQpFQOZ2ezeZJqaaNXQcXDCrDw.7IR3Hxs7cNAuaZe', 'active', 'relative', '1747011058.jpg', NULL, '2025-05-11 21:50:59', '2025-05-11 21:50:59'),
(145, 'qqqqqqqq', NULL, NULL, 'qqqqqqqq336915@gmail.coms', NULL, '$2y$12$DQnbcvX4KA4AzH1WuVAX8emzNY49upgYhPOQ/MFy11o8v3R741cZG', 'active', 'relative', NULL, NULL, '2025-05-11 21:52:20', '2025-05-11 21:52:20'),
(146, 'mkmk', '967123456789', NULL, 'mkmk369318@gmail.coms', NULL, '$2y$12$qQat1RKWNgWz1LGt1OUlIu38pmwapTjiukmO.bQ/3iCADJifizzIS', 'active', 'relative', '/data/user/0/com.example.sukari_care/cache/84043a7b-028c-41e3-bd8b-6c4ccd2c91b1/images.jpg', NULL, '2025-05-11 21:54:00', '2025-05-11 21:54:00'),
(147, 'فاروق', '9671111111111', NULL, 'فاروق381623@gmail.coms', NULL, '$2y$12$h7KLDRq6rPS5LxzVwTc.j.pdakokV2Ufz1e./zrwQD/.cdZiOeDa6', 'active', 'relative', '/data/user/0/com.example.sukari_care/cache/a7e9967e-8c6a-4839-8fae-24368c969024/1000413983.jpg', NULL, '2025-05-12 10:58:50', '2025-05-12 10:58:50'),
(148, 'كمال', '967147147147', NULL, 'كمال807330@gmail.coms', NULL, '$2y$12$4lf5aVAD.3a2w.q6VA.24uzOagXkHln7PrAj9vv64dc0IWIkCJRAi', 'active', 'relative', '/data/user/0/com.example.sukari_care/cache/c5d05022-ac8b-4b1e-baca-a715f5b6268f/٢٠٢٥٠٥١٢_١٤٠٣٥٢.jpg', NULL, '2025-05-12 11:04:03', '2025-05-12 11:04:03'),
(149, 'محمد', '9677123123123', NULL, 'محمد753242@gmail.coms', NULL, '$2y$12$LIxoAYisuxznWnn3MVGhFuQNQRRtW6BJm0idBbShZhAC4vLHFMmAW', 'active', 'relative', '/data/user/0/com.example.sukari_care/cache/50d05079-ce8a-46a4-b400-30eb0a556b9a/٢٠٢٥٠٥١٢_١٤٠٣٥٢.jpg', NULL, '2025-05-12 11:09:24', '2025-05-12 11:09:24');

-- --------------------------------------------------------

--
-- Table structure for table `user_profiles`
--

CREATE TABLE `user_profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `contact_info` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_profiles`
--

INSERT INTO `user_profiles` (`id`, `user_id`, `first_name`, `last_name`, `date_of_birth`, `contact_info`, `image_url`, `created_at`, `updated_at`) VALUES
(1, 2, 'اسامه عبده', 'علي المشرقي', '2002-02-04', '772790221', '1744989715.jpg', '2025-03-11 16:34:22', '2025-04-18 12:21:55'),
(4, 5, 'شرف الدين', 'الشيخ', '2000-12-11', '7777777777', '1744829826.png', '2025-03-11 16:58:27', '2025-04-20 14:51:19'),
(5, 6, 'علي عبد الله', 'حطروم', '2000-02-02', '773787546', '1744743611.jpg', '2025-03-11 16:59:58', '2025-04-15 16:00:11'),
(34, 38, 'زكريا يحي', 'البارزي', '2000-02-02', '773787546', '1744745293.jpg', '2025-03-15 19:45:47', '2025-04-15 16:28:13'),
(36, 45, 'علي محمد', 'حطروم', '2025-11-11', '7878787878', '1744745723.png', '2025-04-08 19:47:54', '2025-04-15 16:35:23'),
(37, 48, 'عبده', 'المشرقي', '2025-04-15', '7777777777', NULL, '2025-04-13 11:06:33', '2025-04-13 11:06:33'),
(38, 49, 'عبده', 'المشرقي', '2025-04-15', '7777777777', '1744553347.jpg', '2025-04-13 11:09:10', '2025-04-13 11:09:10'),
(39, 59, 'nasser', 'nasser', '2000-01-01', NULL, '1744673246.jpg', '2025-04-14 20:27:26', '2025-04-14 20:27:26'),
(40, 60, 'ناصر', 'حطروم', '2025-04-13', '7727902211', '1744743813.jpg', '2025-04-15 15:44:48', '2025-04-15 16:03:33'),
(41, 61, 'ali', 'alialialiali', '2025-04-17', '7727902211', '1744762357.png', '2025-04-15 16:04:38', '2025-04-15 21:12:37'),
(42, 1, 'admin', 'admin', '2000-01-01', NULL, '1744745141.jpg', '2025-04-15 16:25:10', '2025-04-15 16:25:41'),
(43, 1, 'admin', 'admin', '2000-01-01', NULL, '1744745141.jpg', '2025-04-15 16:25:41', '2025-04-15 16:25:41'),
(44, 38, 'zakrya', 'zakrya', '2000-01-01', NULL, '1744745156.jpg', '2025-04-15 16:25:56', '2025-04-15 16:25:56'),
(45, 38, 'zakrya', 'zakrya', '2000-01-01', NULL, '1744745191.jpg', '2025-04-15 16:26:31', '2025-04-15 16:26:31'),
(46, 38, 'zakrya', 'zakrya', '2000-01-01', NULL, '1744745293.jpg', '2025-04-15 16:28:13', '2025-04-15 16:28:13'),
(49, 45, 'rel ahmed', 'rel ahmed', '2000-01-01', NULL, '1744745723.png', '2025-04-15 16:35:24', '2025-04-15 16:35:24'),
(59, 61, 'aliss', 'aliss', '2000-01-01', NULL, '1744762357.png', '2025-04-15 21:12:37', '2025-04-15 21:12:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`blog_id`),
  ADD KEY `blogs_author_id_foreign` (`author_id`);

--
-- Indexes for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `blog_comments_blog_id_foreign` (`blog_id`),
  ADD KEY `blog_comments_user_id_foreign` (`user_id`);

--
-- Indexes for table `blood_tests`
--
ALTER TABLE `blood_tests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blood_tests_patient_id_foreign` (`patient_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctors_user_id_foreign` (`user_id`);

--
-- Indexes for table `drugs`
--
ALTER TABLE `drugs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `drug_recommendations`
--
ALTER TABLE `drug_recommendations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `drug_recommendations_patient_id_foreign` (`patient_id`),
  ADD KEY `drug_recommendations_drug_id_foreign` (`drug_id`);

--
-- Indexes for table `exercises`
--
ALTER TABLE `exercises`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exercise_recommendations`
--
ALTER TABLE `exercise_recommendations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exercise_recommendations_patient_id_foreign` (`patient_id`),
  ADD KEY `exercise_recommendations_exercise_id_foreign` (`exercise_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `favorites_user_id_foreign` (`user_id`),
  ADD KEY `favorites_blog_id_foreign` (`blog_id`);

--
-- Indexes for table `glucose_readings`
--
ALTER TABLE `glucose_readings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `glucose_readings_patient_id_foreign` (`patient_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lifestyle_assessment`
--
ALTER TABLE `lifestyle_assessment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lifestyle_assessment_patient_id_foreign` (`patient_id`);

--
-- Indexes for table `meals`
--
ALTER TABLE `meals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meal_recommendations`
--
ALTER TABLE `meal_recommendations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meal_recommendations_patient_id_foreign` (`patient_id`),
  ADD KEY `meal_recommendations_meal_id_foreign` (`meal_id`);

--
-- Indexes for table `meal_systems`
--
ALTER TABLE `meal_systems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meal_systems_patient_id_foreign` (`patient_id`);

--
-- Indexes for table `medical_history`
--
ALTER TABLE `medical_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `medical_history_patient_id_foreign` (`patient_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patients_user_id_foreign` (`user_id`),
  ADD KEY `patients_doctor_id_foreign` (`doctor_id`);

--
-- Indexes for table `patient_goals`
--
ALTER TABLE `patient_goals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_goals_patient_id_foreign` (`patient_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `physical_examination`
--
ALTER TABLE `physical_examination`
  ADD PRIMARY KEY (`id`),
  ADD KEY `physical_examination_patient_id_foreign` (`patient_id`);

--
-- Indexes for table `relatives`
--
ALTER TABLE `relatives`
  ADD PRIMARY KEY (`id`),
  ADD KEY `relatives_patient_id_foreign` (`patient_id`),
  ADD KEY `relatives_user_id_foreign` (`user_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- Indexes for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_profiles_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `blog_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `blog_comments`
--
ALTER TABLE `blog_comments`
  MODIFY `comment_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `blood_tests`
--
ALTER TABLE `blood_tests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `drugs`
--
ALTER TABLE `drugs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `drug_recommendations`
--
ALTER TABLE `drug_recommendations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `exercises`
--
ALTER TABLE `exercises`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `exercise_recommendations`
--
ALTER TABLE `exercise_recommendations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `glucose_readings`
--
ALTER TABLE `glucose_readings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lifestyle_assessment`
--
ALTER TABLE `lifestyle_assessment`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `meals`
--
ALTER TABLE `meals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `meal_recommendations`
--
ALTER TABLE `meal_recommendations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `meal_systems`
--
ALTER TABLE `meal_systems`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `medical_history`
--
ALTER TABLE `medical_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `patient_goals`
--
ALTER TABLE `patient_goals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=223;

--
-- AUTO_INCREMENT for table `physical_examination`
--
ALTER TABLE `physical_examination`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `relatives`
--
ALTER TABLE `relatives`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT for table `user_profiles`
--
ALTER TABLE `user_profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD CONSTRAINT `blog_comments_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`blog_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blog_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blood_tests`
--
ALTER TABLE `blood_tests`
  ADD CONSTRAINT `blood_tests_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `doctors_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `drug_recommendations`
--
ALTER TABLE `drug_recommendations`
  ADD CONSTRAINT `drug_recommendations_drug_id_foreign` FOREIGN KEY (`drug_id`) REFERENCES `drugs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `drug_recommendations_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exercise_recommendations`
--
ALTER TABLE `exercise_recommendations`
  ADD CONSTRAINT `exercise_recommendations_exercise_id_foreign` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exercise_recommendations_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`blog_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favorites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `glucose_readings`
--
ALTER TABLE `glucose_readings`
  ADD CONSTRAINT `glucose_readings_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lifestyle_assessment`
--
ALTER TABLE `lifestyle_assessment`
  ADD CONSTRAINT `lifestyle_assessment_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `meal_recommendations`
--
ALTER TABLE `meal_recommendations`
  ADD CONSTRAINT `meal_recommendations_meal_id_foreign` FOREIGN KEY (`meal_id`) REFERENCES `meals` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `meal_recommendations_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `meal_systems`
--
ALTER TABLE `meal_systems`
  ADD CONSTRAINT `meal_systems_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `medical_history`
--
ALTER TABLE `medical_history`
  ADD CONSTRAINT `medical_history_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `patients`
--
ALTER TABLE `patients`
  ADD CONSTRAINT `patients_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `patients_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `patient_goals`
--
ALTER TABLE `patient_goals`
  ADD CONSTRAINT `patient_goals_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `physical_examination`
--
ALTER TABLE `physical_examination`
  ADD CONSTRAINT `physical_examination_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `relatives`
--
ALTER TABLE `relatives`
  ADD CONSTRAINT `relatives_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `relatives_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD CONSTRAINT `user_profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
