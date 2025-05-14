-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 01, 2025 at 10:39 PM
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
(18, 1, 'blog text', 'blog text', 'blog text content', NULL, '2025-04-18 12:56:47', '2025-04-18 12:56:47'),
(19, 1, 'blog text', 'blog text', 'blog text content', NULL, '2025-04-18 12:56:47', '2025-04-18 12:56:47'),
(20, 1, 'blog text', 'blog text', 'blog text content', '1744992274.jpg', '2025-04-18 12:56:47', '2025-04-18 13:04:34'),
(21, 1, 'blogweidh', 'oifhewiofhw', 'wodjweopdjewo', NULL, '2025-04-18 12:58:01', '2025-04-18 12:58:01'),
(22, 1, 'blogweidh', 'oifhewiofhw', 'wodjweopdjewo', NULL, '2025-04-18 12:58:01', '2025-04-18 12:58:01'),
(23, 1, 'blogweidh', 'oifhewiofhw', 'wodjweopdjewo', NULL, '2025-04-18 12:58:01', '2025-04-18 12:58:01'),
(24, 1, 'blogweidh', 'oifhewiofhw', 'wodjweopdjewo', NULL, '2025-04-18 12:58:02', '2025-04-18 12:58:02'),
(25, 1, 'jjdsghsdfs', 'kljjdkwehd', 'ojewfoefowjf', NULL, '2025-04-18 12:59:34', '2025-04-18 12:59:34');

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
(15, 18, 2, 'مقال رهيب', '2025-04-20 18:36:08', '2025-04-20 18:36:08'),
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
('laravel_cache_356a192b7913b04c54574d18c28d46e6395428ab', 'i:2;', 1744988446),
('laravel_cache_356a192b7913b04c54574d18c28d46e6395428ab:timer', 'i:1744988446;', 1744988446);

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
(6, 60, '1744742688.pdf', 'قدم سكري', 'active', NULL, NULL, NULL, NULL, NULL),
(11, 83, '1745167221.pdf', 'قدم سكري', 'active', '2025-04-20 13:40:21', '2025-04-20 13:40:21', '1745167221.png', '234123123123', '2025-04-02');

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

--
-- Dumping data for table `drug_recommendations`
--

INSERT INTO `drug_recommendations` (`id`, `patient_id`, `drug_id`, `when_to_take`, `time_to_take`, `number_of_takes`, `image_url`, `created_at`, `updated_at`) VALUES
(26, 32, 19, 'after_meal', 'morning', '2', 'http://example.com/image1.png', '2025-03-15 19:45:47', '2025-03-15 19:45:47'),
(27, 32, 20, 'before_meal', 'evening', '1', 'http://example.com/image2.png', '2025-03-15 19:45:47', '2025-03-15 19:45:47'),
(31, 32, 2, 'after_meal', 'afternoon', '3', NULL, '2025-04-12 14:45:35', '2025-04-12 14:45:35');

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
(2, 32, 2, '1 كل عشر مرات تسوي راحه لمده 30 ثانية', '2025-04-18 13:40:42', '2025-04-18 13:40:42'),
(3, 32, 2, '1 كل عشر مرات تسوي راحه لمده 30 ثانية', '2025-04-18 13:42:29', '2025-04-18 13:42:29');

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
(3, 1, 14, '2025-04-18 12:27:52', '2025-04-18 12:27:52');

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
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `meal_recommendations`
--

CREATE TABLE `meal_recommendations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `meal_id` bigint(20) UNSIGNED NOT NULL,
  `meal_description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(80, '2025_02_27_224726_create_meal_recommendations_table', 9),
(81, '2025_02_27_224757_create_exercise_recommendations_table', 9),
(82, '2025_04_08_223527_create_relatives_table', 9),
(83, '2025_04_12_141203_create_notifications_table', 9),
(86, '2025_04_14_134910_create_favorites_table', 10),
(87, '2025_04_17_195141_add_otp', 11),
(88, '2025_04_18_213034_add_license', 12);

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
('4590fafb-1030-461b-9876-de169814801e', 'App\\Notifications\\DoctorNewExerciseRecommandationNotfication', 'App\\Models\\User', 38, '{\"id\":38,\"title\":\"New Recommandation Added exercisepup up\",\"data\":\"this recommendation at 2025-04-18 16:42:29\",\"notifiable_id\":\"32\"}', NULL, '2025-04-18 13:42:29', '2025-04-18 13:42:29'),
('fe148378-e761-4a16-92c1-97b69bf8ab01', 'App\\Notifications\\DoctorNewExerciseRecommandationNotfication', 'App\\Models\\User', 38, '{\"id\":38,\"title\":\"New Recommandation Added exercisepup up\",\"data\":\"this recommendation at 2025-04-18 16:40:42\",\"notifiable_id\":\"32\"}', NULL, '2025-04-18 13:40:42', '2025-04-18 13:40:42');

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
(17, 'App\\Models\\User', 5, '3838383', '81e117fe0d11fb4739b5f9bbb341572fa571c4626ba8cd4f3ebeb2be454d40d9', '[\"*\"]', '2025-04-18 13:35:32', NULL, '2025-04-11 13:18:28', '2025-04-18 13:35:32'),
(18, 'App\\Models\\User', 38, '3838383', '4900df96448cc0233852bbb104d52b6f96b969cad3d6c8d6dd3634f8b392ddad', '[\"*\"]', '2025-04-14 19:16:29', NULL, '2025-04-11 14:07:47', '2025-04-14 19:16:29'),
(19, 'App\\Models\\User', 3, '3838383', '54a49b972c618c2f4d1e713dc6102a90b47970faeb6ea681bffdc3c55447485c', '[\"*\"]', '2025-04-12 14:16:12', NULL, '2025-04-12 14:07:21', '2025-04-12 14:16:12'),
(20, 'App\\Models\\User', 38, '3838383', '1d09abf8ba4172223a08721e69788f6812027ca822e5401724601d42a894d973', '[\"*\"]', '2025-04-12 14:17:57', NULL, '2025-04-12 14:17:31', '2025-04-12 14:17:57'),
(21, 'App\\Models\\User', 3, '3838383', '5e7a476ca669485690e675b9eb3a6af0c6c3580e68a5d87bfc9530d1e646db0d', '[\"*\"]', '2025-04-12 14:23:16', NULL, '2025-04-12 14:18:35', '2025-04-12 14:23:16'),
(22, 'App\\Models\\User', 38, '3838383', '7bfd551fc5b97aeb920f34c94edf57e1e78ca48dd57f6dd93269b7e4a4a6ebe2', '[\"*\"]', '2025-04-12 14:47:28', NULL, '2025-04-12 14:22:32', '2025-04-12 14:47:28'),
(23, 'App\\Models\\User', 3, '3838383', 'cce0fa9660d1407667ec52ec9e4938101a6cb6dc7a132d2be41965f32ae79a64', '[\"*\"]', '2025-04-12 15:01:12', NULL, '2025-04-12 14:49:19', '2025-04-12 15:01:12'),
(24, 'App\\Models\\User', 3, '3838383', 'f4ba35591689ab0e2cfef1539e318968df5bb4c39cc03a0cb3b91eaeca78503c', '[\"*\"]', '2025-04-14 13:31:14', NULL, '2025-04-14 12:27:14', '2025-04-14 13:31:14'),
(26, 'App\\Models\\User', 46, '3838383', '7ca2ce10522e49c3bfc8a2f5fb167f3751cfacb90b4e2913faf5646b838ed15c', '[\"*\"]', '2025-04-18 13:42:29', NULL, '2025-04-18 13:38:09', '2025-04-18 13:42:29');

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
('0fndAPGoD3pa32TJaNSfhZhJCHqXZ0U9rsh6qdeo', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiVzU4MUlQb01vZW9mcWRvS1NSMXY3V1NPVHR3VTJINWUzeEpzQ2tEMSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9yZWdpc3RlciI7fX0=', 1745245864),
('1Ohr6MH6FNczXd132pZJ1RF3G3WL19WetEQClB86', 85, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoib0s2WmpCSkhFOTlnOFY3TUs1SURtTm9PNzg4U0JNa0dUd04yZW1EZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hY2NvdW50X2Rhc2hib2FyZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjg1O30=', 1745962388),
('nA708HLEn9o7zT5rLvQFQiArLl2dvdoTd5HDkEhB', 84, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoieXdNRFd0VXJJVmlhbkZYUUJ5MlNDdDdKSmx4M3dsblRyZ1JYT2tUOSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9yZWdpc3RlciI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjg0O30=', 1745962360);

-- --------------------------------------------------------

--
-- Table structure for table `symptoms`
--

CREATE TABLE `symptoms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `symptom_description` varchar(255) DEFAULT NULL,
  `severity` enum('mild','moderate','severe') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `symptoms`
--

INSERT INTO `symptoms` (`id`, `patient_id`, `symptom_description`, `severity`, `created_at`, `updated_at`) VALUES
(30, 32, 'حمى مع الم في الساقين', 'mild', '2025-03-15 19:45:47', '2025-03-15 19:45:47');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
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

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `status`, `role`, `image_url`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', NULL, '$2y$12$qi0zqaKFNC2Ix7/pTY.i9OrLxB0YcuBChcqKnAH.9oBGkLQbsrTFC', 'active', 'admin', NULL, 'BOj5gu7w4Fm0MKz1vP1T6ynOfNgabgkKvtRxSIa0HICZPI2uQfjA83cuIly4', '2025-03-11 16:30:49', '2025-04-20 11:09:24'),
(2, 'osama Abdo', 'osamaten77@gmail.com', NULL, '$2y$12$NKu1UuxTJ3MicqujCcraLelOsIfU8lc7eXuXn0SCpyq5oqF2dxeT6', 'active', 'admin', NULL, 'yqxc6OMAGQkyCSs5yX3hlup4qGhLAM6kSCJAir6igCjM7pInysXfu3omKlms', '2025-03-11 16:34:22', '2025-04-18 13:29:51'),
(5, 'sharaf', 'sharaf@gmail.com', NULL, '$2y$12$Zj4s7lC3lZVhLaF5AtzNPeAzi3.OhyDHAd4tzm.EjeqLPTrs0B8mC', 'active', 'doctor', NULL, NULL, '2025-03-11 16:58:27', '2025-04-20 14:54:59'),
(6, 'ali', 'ali@gmail.coms', NULL, '$2y$12$TCJm4QojL2quxjmds2GMq.W7jjMnJU3Tn5oNtvt7wt14beBW..SQO', 'active', 'patient', NULL, NULL, '2025-03-11 16:59:58', '2025-04-15 16:00:11'),
(38, 'zakrya', 'zakrya@gmail.coms', NULL, '$2y$12$4vahuv6xnNlRFm3yrq3gZ.r3b5pU28w5EFT6axxazPAoU3o7Bg1dG', 'active', 'patient', NULL, NULL, '2025-03-15 19:45:47', '2025-03-15 19:45:47'),
(45, 'rel ahmed', 'relative@gmail.com', NULL, '$2y$12$HZkOIU/sXHlICNkYEbUw8OI.N0NeZldjKxGRWV.L9e1AHSmstGUJ6', 'suspend', 'relative', NULL, NULL, '2025-04-08 19:47:54', '2025-04-15 17:03:35'),
(46, 'osama711', 'osamaabdu711@gmail.com', NULL, '$2y$12$eb2NDaRtw9EC0M3u1WzApuI4mTld1ym33bpLVX5E4FBfC6yhbtczy', 'active', 'patient', NULL, 'NfyhGVT1JPaAjKdA61hFw2LOdvFCm44kO0FsPb7MX6X1sLs9nSQtifcKMly1', '2025-04-12 19:12:52', '2025-04-18 12:32:11'),
(47, 'abdu', 'abdu@gmail.com', NULL, '$2y$12$0WHF3WFIU1o5RLCBuaHvoOILBDFAS/Q4AqNQY.ZOvWwPmwB7aGLFS', 'active', 'doctor', NULL, NULL, '2025-04-13 11:02:52', '2025-04-13 11:02:52'),
(48, 'abdu', 'abdus@gmail.com', NULL, '$2y$12$zrZH0T1Ln/ZcEfIRR/vE3uBqCeWTEt0a3N3KJMXI1Fsr9L6RDwkvK', 'active', 'doctor', NULL, NULL, '2025-04-13 11:06:33', '2025-04-13 11:06:33'),
(49, 'abdu', 'abduss@gmail.com', NULL, '$2y$12$6QXHZX.WyaPReTFHwmPwEOBXVketN6mN3oVH0tdgdbg2ksj8A63oW', 'active', 'doctor', NULL, NULL, '2025-04-13 11:09:07', '2025-04-14 21:28:35'),
(50, 'wssem', 'wssem@gmail.com', NULL, '$2y$12$MueRNpmrC4phWE2foGa2w.xZ0IN3.m333UBopgWeVQSAIORFZ6abu', 'active', 'relative', NULL, NULL, '2025-04-13 20:17:17', '2025-04-13 20:47:18'),
(59, 'nasser', 'nasser@gmail.com', NULL, '$2y$12$1IROj0pmnwZpZBF31.457OabxYVZ99yDOdvXySlpNfKUw.Gpa/GRq', 'active', 'doctor', NULL, NULL, '2025-04-14 20:27:26', '2025-04-14 20:28:26'),
(60, 'nasser', 'nassers@gmail.com', NULL, '$2y$12$TBPvUukL/7yGoJpnLWXHGONKkzBLB7/KzKZvWa9lRf3g2gcEBctbC', 'active', 'doctor', NULL, NULL, '2025-04-15 15:44:48', '2025-04-15 16:03:33'),
(61, 'aliss', 'aliss@gmail.com', NULL, '$2y$12$dXvY7nQpl11pbm/oKW3ZDOJKdPkOyepHmpCTquYQykMi8nyAsl6t.', 'active', 'doctor', NULL, NULL, '2025-04-15 16:04:38', '2025-04-15 16:04:38'),
(77, 'abdualrhman', 'abdualrhman@gmail.com', NULL, '$2y$12$aBAxHyXThXvnoziYpVL3guM7cmarBLwT4.MuXNYtwSncxivaSGr0.', 'active', 'relative', NULL, NULL, '2025-04-16 15:46:38', '2025-04-16 15:52:13'),
(78, 'ah', 'osamaabdu7111@gmail.com', NULL, '$2y$12$fw5RPcbwOL0IGm.JcjXTjOHls5TC0UjjNZI3rrWKhlHWX6akdcUom', 'active', NULL, NULL, NULL, '2025-04-16 18:54:47', '2025-04-16 18:54:47'),
(79, 'ASAM', 'asma@gmail.com', NULL, '$2y$12$c7ue1a/ArxDYd89B10ru7O2iRxYzgWW9oQp9mGN3PlWdSfTlKRaqi', 'active', NULL, NULL, NULL, '2025-04-17 19:14:38', '2025-04-17 19:14:38'),
(83, 'diaa', 'diaa@gmail.com', NULL, '$2y$12$VO10W6YEMcRurN3cwpwz0uPd1joc/xhQv2Upvjkdisy7Bheaj4VTm', 'active', 'doctor', NULL, NULL, '2025-04-20 13:40:21', '2025-04-20 13:57:38'),
(84, 'osama abdu', 'sss@ss.com', NULL, '$2y$12$IjcoZt5cTMxPTLZUw2Gz6OHxol5/967RI0EkTc6qMwR5IHp4W41DK', 'active', 'doctor', NULL, NULL, '2025-04-29 18:32:26', '2025-04-29 18:32:26'),
(85, 'ss@aa', 'ss@ss.com', NULL, '$2y$12$4VI/t7TIJPvVW49kwGsPqeVDoBgVcFVmxTXSn4SnbUxqG1rGOHTwe', 'active', 'doctor', NULL, NULL, '2025-04-29 18:32:58', '2025-04-29 18:32:58');

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
(59, 61, 'aliss', 'aliss', '2000-01-01', NULL, '1744762357.png', '2025-04-15 21:12:37', '2025-04-15 21:12:37'),
(69, 83, 'ضيا', 'الجابري', '2025-04-10', '1772790221', '1745168258.png', '2025-04-20 13:40:21', '2025-04-20 13:57:38');

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
-- Indexes for table `symptoms`
--
ALTER TABLE `symptoms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `symptoms_patient_id_foreign` (`patient_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

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
  MODIFY `blog_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `drugs`
--
ALTER TABLE `drugs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `drug_recommendations`
--
ALTER TABLE `drug_recommendations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `exercises`
--
ALTER TABLE `exercises`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `exercise_recommendations`
--
ALTER TABLE `exercise_recommendations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `meal_recommendations`
--
ALTER TABLE `meal_recommendations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medical_history`
--
ALTER TABLE `medical_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `physical_examination`
--
ALTER TABLE `physical_examination`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `relatives`
--
ALTER TABLE `relatives`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `symptoms`
--
ALTER TABLE `symptoms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `user_profiles`
--
ALTER TABLE `user_profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

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
-- Constraints for table `symptoms`
--
ALTER TABLE `symptoms`
  ADD CONSTRAINT `symptoms_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD CONSTRAINT `user_profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
