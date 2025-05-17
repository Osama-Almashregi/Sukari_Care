-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2025 at 12:08 AM
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
-- Table structure for table `alarms`
--

CREATE TABLE `alarms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `repeat` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `alarms`
--

INSERT INTO `alarms` (`id`, `patient_id`, `title`, `time`, `date`, `repeat`, `is_active`, `created_at`, `updated_at`) VALUES
(29, 32, 'نرور', '21:45:00', '2025-05-13', 'أربعاء', 1, '2025-05-13 15:34:31', '2025-05-13 15:34:31'),
(30, 32, 'نلوو', '12:00:00', '2025-05-07', 'أربعاء', 1, '2025-05-13 15:40:37', '2025-05-13 15:40:37');

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
  `is_educational` tinyint(1) DEFAULT 1,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`blog_id`, `author_id`, `title`, `slug`, `content`, `is_educational`, `image_url`, `created_at`, `updated_at`) VALUES
(2, 2, 'مقال م اسامه عبده علي المشرقي', 'مقا لشرف', 'مقال متميز', 1, '1744129259.jpg', '2025-04-08 13:21:01', '2025-04-11 14:35:13'),
(3, 2, 'سيشبشسيبس', 'بشسيبسيبشسيبسيب', 'سيبسيبسيببيسبببيسبب', 1, '1744129262.jpg', '2025-04-08 13:21:02', '2025-04-08 13:21:02'),
(13, 1, 'من اسامه الى شرف', 'شرف مقال', 'على هونك', 1, '1744680943.png', '2025-04-14 18:46:34', '2025-04-14 22:35:43'),
(14, 5, 'هيا ناهي', 'هيا ناهي', 'على هونك', 1, '1744667316.png', '2025-04-14 18:48:36', '2025-04-14 18:48:36'),
(15, 1, 'sssss', 'sdfdsf', 'dsffdsfsddewd', 1, '1744680065.jpg', '2025-04-14 22:11:12', '2025-04-14 22:21:05'),
(16, 1, 'blog text', 'blog text', 'blog text content', 1, NULL, '2025-04-18 12:56:46', '2025-04-18 12:56:46'),
(17, 1, 'blog text', 'blog text', 'blog text content', 1, NULL, '2025-04-18 12:56:47', '2025-04-18 12:56:47'),
(26, 5, 'نقلهم بعد', 'عنقلهم', 'عنقلهم', 1, '1746400739.png', '2025-05-04 20:18:59', '2025-05-04 20:18:59'),
(27, 5, 'نقلهم بعد', 'عنقلهم', 'عنقلهم', 1, '1746400852.png', '2025-05-04 20:20:53', '2025-05-04 20:20:53'),
(28, 5, 'نقلهم بعد', 'nklhm-baad', 'عنقلهم', 1, '1746401015.png', '2025-05-04 20:23:36', '2025-05-04 20:23:36'),
(29, 5, 'نقلهم بعد', 'nklhm-baad', 'عنقلهم', 1, '1746401019.png', '2025-05-04 20:23:40', '2025-05-04 20:23:40'),
(30, 5, 'نقلهم بعد', 'nklhm-baad', 'عنقلهم', 1, '1746401445.png', '2025-05-04 20:30:46', '2025-05-04 20:30:46'),
(31, 5, 'نقلهم بعد', 'nklhm-baad', 'عنقلهم', 1, '1746401458.png', '2025-05-04 20:30:58', '2025-05-04 20:30:58'),
(32, 1, 'مقال جديد', 'php', 'عن filament 3', 1, 'uploads/blogs/01JTY7TTGPY8C7AXJ50KZDKXYB.jpeg', '2025-05-10 20:17:37', '2025-05-10 20:17:37'),
(33, 1, 'php in the meine', 'wefew', 'wfwefwef', 1, 'uploads/blogs/01JV59CBXPZZ6M9JRJX5EFW1KG.jpg', '2025-05-13 13:59:22', '2025-05-13 13:59:22');

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
('laravel_cache_356a192b7913b04c54574d18c28d46e6395428ab', 'i:1;', 1747170704),
('laravel_cache_356a192b7913b04c54574d18c28d46e6395428ab:timer', 'i:1747170704;', 1747170704),
('laravel_cache_ac3478d69a3c81fa62e60f5c3696165a4e5e6ac4', 'i:1;', 1747178205),
('laravel_cache_ac3478d69a3c81fa62e60f5c3696165a4e5e6ac4:timer', 'i:1747178205;', 1747178205),
('laravel_cache_livewire-rate-limiter:62dcdddd2131784090e8a5916c260a90678e71b3', 'i:2;', 1747175715),
('laravel_cache_livewire-rate-limiter:62dcdddd2131784090e8a5916c260a90678e71b3:timer', 'i:1747175715;', 1747175715),
('laravel_cache_livewire-rate-limiter:8638f7831ecfe79ca44c94a8e853c8a852866ba7', 'i:1;', 1747174847),
('laravel_cache_livewire-rate-limiter:8638f7831ecfe79ca44c94a8e853c8a852866ba7:timer', 'i:1747174847;', 1747174847),
('laravel_cache_livewire-rate-limiter:9178fb51a4883de18f87f7706cfba0f1f037623c', 'i:3;', 1747508406),
('laravel_cache_livewire-rate-limiter:9178fb51a4883de18f87f7706cfba0f1f037623c:timer', 'i:1747508406;', 1747508406),
('laravel_cache_livewire-rate-limiter:a17961fa74e9275d529f489537f179c05d50c2f3', 'i:1;', 1747096533),
('laravel_cache_livewire-rate-limiter:a17961fa74e9275d529f489537f179c05d50c2f3:timer', 'i:1747096533;', 1747096533);

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

--
-- Dumping data for table `drug_recommendations`
--

INSERT INTO `drug_recommendations` (`id`, `patient_id`, `drug_id`, `when_to_take`, `time_to_take`, `number_of_takes`, `image_url`, `created_at`, `updated_at`) VALUES
(46, 32, 2, 'after_meal', 'afternoon', '2', '23ق2ق23ق23', NULL, NULL),
(47, 32, 6, 'after_meal', 'afternoon', '1', NULL, '2025-05-13 23:18:29', '2025-05-13 23:18:29'),
(48, 32, 1, 'before_meal', 'morning', '2', NULL, '2025-05-13 23:19:05', '2025-05-13 23:19:05');

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

--
-- Dumping data for table `failed_jobs`
--

INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(1, 'fec84625-4fc6-41e4-81a5-c660a26ac371', 'database', 'default', '{\"uuid\":\"fec84625-4fc6-41e4-81a5-c660a26ac371\",\"displayName\":\"Filament\\\\Notifications\\\\Auth\\\\ResetPassword\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:5;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:41:\\\"Filament\\\\Notifications\\\\Auth\\\\ResetPassword\\\":3:{s:3:\\\"url\\\";s:222:\\\"http:\\/\\/192.168.0.151:8000\\/user\\/password-reset\\/reset?email=sharaf%40gmail.com&token=05cf00c8652eba6bfc0460bca3270169dd548ff38bf483e08b7a297451339eab&signature=76f9e4a9aefb7ac475aff5f684f9454124e995c3c36291f70b69041b5b8ac9b0\\\";s:5:\\\"token\\\";s:64:\\\"05cf00c8652eba6bfc0460bca3270169dd548ff38bf483e08b7a297451339eab\\\";s:2:\\\"id\\\";s:36:\\\"3517e622-edd0-4cd2-bae6-e77552a3cada\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"},\"createdAt\":1747172269,\"delay\":null}', 'Symfony\\Component\\Mailer\\Exception\\TransportException: Failed to authenticate on SMTP server with username \"232b961e9f3ba2\" using the following authenticators: \"CRAM-MD5\", \"LOGIN\", \"PLAIN\". Authenticator \"CRAM-MD5\" returned \"Expected response code \"235\" but got code \"535\", with message \"535 5.7.0 Invalid credentials\".\". Authenticator \"LOGIN\" returned \"Expected response code \"334\" but got empty code.\". Authenticator \"PLAIN\" returned \"Expected response code \"235\" but got empty code.\". in C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php:247\nStack trace:\n#0 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php(177): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->handleAuth(Array)\n#1 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php(134): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->doEhloCommand()\n#2 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(255): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->executeCommand(\'HELO http\\r\\n\', Array)\n#3 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(281): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doHeloCommand()\n#4 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(211): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->start()\n#5 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend(Object(Symfony\\Component\\Mailer\\SentMessage))\n#6 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(138): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#7 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(584): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#8 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(331): Illuminate\\Mail\\Mailer->sendSymfonyMessage(Object(Symfony\\Component\\Mime\\Email))\n#9 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\Channels\\MailChannel.php(66): Illuminate\\Mail\\Mailer->send(Object(Closure), Array, Object(Closure))\n#10 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(159): Illuminate\\Notifications\\Channels\\MailChannel->send(Object(App\\Models\\User), Object(Filament\\Notifications\\Auth\\ResetPassword))\n#11 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(116): Illuminate\\Notifications\\NotificationSender->sendToNotifiable(Object(App\\Models\\User), \'6ddd3c48-9b5e-4...\', Object(Filament\\Notifications\\Auth\\ResetPassword), \'mail\')\n#12 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#13 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(111): Illuminate\\Notifications\\NotificationSender->withLocale(NULL, Object(Closure))\n#14 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\ChannelManager.php(54): Illuminate\\Notifications\\NotificationSender->sendNow(Object(Illuminate\\Database\\Eloquent\\Collection), Object(Filament\\Notifications\\Auth\\ResetPassword), Array)\n#15 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\SendQueuedNotifications.php(118): Illuminate\\Notifications\\ChannelManager->sendNow(Object(Illuminate\\Database\\Eloquent\\Collection), Object(Filament\\Notifications\\Auth\\ResetPassword), Array)\n#16 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Notifications\\SendQueuedNotifications->handle(Object(Illuminate\\Notifications\\ChannelManager))\n#17 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#18 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#19 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#20 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#21 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Container\\Container->call(Array)\n#22 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#23 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#24 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#25 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(125): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Notifications\\SendQueuedNotifications), false)\n#26 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#27 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#28 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#29 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#30 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#31 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#32 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#33 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#34 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#35 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#36 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#37 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#38 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#39 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#40 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#41 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#42 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#43 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#44 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\console\\Application.php(1094): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#45 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\console\\Application.php(342): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#46 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\console\\Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#47 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#49 C:\\xampp\\htdocs\\Sukari_Care-main\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#50 {main}', '2025-05-13 19:03:22'),
(2, '19a8eb5c-2007-41e1-ad8f-86d27dfb0b91', 'database', 'default', '{\"uuid\":\"19a8eb5c-2007-41e1-ad8f-86d27dfb0b91\",\"displayName\":\"Filament\\\\Notifications\\\\Auth\\\\ResetPassword\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:2;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:41:\\\"Filament\\\\Notifications\\\\Auth\\\\ResetPassword\\\":3:{s:3:\\\"url\\\";s:226:\\\"http:\\/\\/192.168.0.151:8000\\/user\\/password-reset\\/reset?email=osamaten77%40gmail.com&token=ad4f075d89abdf55fe06a00ac2b32c6075332284dce6e8e8d9092bcfc490c7f4&signature=de6a4002562906adfc5626811ddcccd2a425e158955266b52c99ca0583319bc4\\\";s:5:\\\"token\\\";s:64:\\\"ad4f075d89abdf55fe06a00ac2b32c6075332284dce6e8e8d9092bcfc490c7f4\\\";s:2:\\\"id\\\";s:36:\\\"8d3e3b69-e0a2-4f17-8cec-68ca01dd0c4b\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"},\"createdAt\":1747172364,\"delay\":null}', 'Symfony\\Component\\Mailer\\Exception\\TransportException: Failed to authenticate on SMTP server with username \"232b961e9f3ba2\" using the following authenticators: \"CRAM-MD5\", \"LOGIN\", \"PLAIN\". Authenticator \"CRAM-MD5\" returned \"Expected response code \"235\" but got code \"535\", with message \"535 5.7.0 Invalid credentials\".\". Authenticator \"LOGIN\" returned \"Expected response code \"334\" but got empty code.\". Authenticator \"PLAIN\" returned \"Expected response code \"235\" but got empty code.\". in C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php:247\nStack trace:\n#0 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php(177): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->handleAuth(Array)\n#1 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php(134): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->doEhloCommand()\n#2 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(255): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->executeCommand(\'HELO http\\r\\n\', Array)\n#3 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(281): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doHeloCommand()\n#4 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(211): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->start()\n#5 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend(Object(Symfony\\Component\\Mailer\\SentMessage))\n#6 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(138): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#7 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(584): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#8 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(331): Illuminate\\Mail\\Mailer->sendSymfonyMessage(Object(Symfony\\Component\\Mime\\Email))\n#9 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\Channels\\MailChannel.php(66): Illuminate\\Mail\\Mailer->send(Object(Closure), Array, Object(Closure))\n#10 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(159): Illuminate\\Notifications\\Channels\\MailChannel->send(Object(App\\Models\\User), Object(Filament\\Notifications\\Auth\\ResetPassword))\n#11 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(116): Illuminate\\Notifications\\NotificationSender->sendToNotifiable(Object(App\\Models\\User), \'d7751250-1bcd-4...\', Object(Filament\\Notifications\\Auth\\ResetPassword), \'mail\')\n#12 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#13 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(111): Illuminate\\Notifications\\NotificationSender->withLocale(NULL, Object(Closure))\n#14 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\ChannelManager.php(54): Illuminate\\Notifications\\NotificationSender->sendNow(Object(Illuminate\\Database\\Eloquent\\Collection), Object(Filament\\Notifications\\Auth\\ResetPassword), Array)\n#15 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\SendQueuedNotifications.php(118): Illuminate\\Notifications\\ChannelManager->sendNow(Object(Illuminate\\Database\\Eloquent\\Collection), Object(Filament\\Notifications\\Auth\\ResetPassword), Array)\n#16 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Notifications\\SendQueuedNotifications->handle(Object(Illuminate\\Notifications\\ChannelManager))\n#17 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#18 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#19 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#20 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#21 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Container\\Container->call(Array)\n#22 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#23 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#24 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#25 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(125): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Notifications\\SendQueuedNotifications), false)\n#26 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#27 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#28 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#29 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#30 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#31 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#32 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#33 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#34 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#35 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#36 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#37 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#38 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#39 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#40 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#41 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#42 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#43 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#44 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\console\\Application.php(1094): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#45 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\console\\Application.php(342): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#46 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\console\\Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#47 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#49 C:\\xampp\\htdocs\\Sukari_Care-main\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#50 {main}', '2025-05-13 19:03:25'),
(3, '245631fc-4c55-4df4-990a-80a54bb6f0bd', 'database', 'default', '{\"uuid\":\"245631fc-4c55-4df4-990a-80a54bb6f0bd\",\"displayName\":\"Filament\\\\Notifications\\\\Auth\\\\ResetPassword\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:46;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:41:\\\"Filament\\\\Notifications\\\\Auth\\\\ResetPassword\\\":3:{s:3:\\\"url\\\";s:228:\\\"http:\\/\\/192.168.0.151:8000\\/user\\/password-reset\\/reset?email=osamaabdu711%40gmail.com&token=fe7cced75ed7eaf1b7224f825d054868b70fb403b383d0e216be1507e9fe8306&signature=874f06085d453b781212902cab7248ef9cf7e63e85287b39dace4c5b2e2637f5\\\";s:5:\\\"token\\\";s:64:\\\"fe7cced75ed7eaf1b7224f825d054868b70fb403b383d0e216be1507e9fe8306\\\";s:2:\\\"id\\\";s:36:\\\"d079c69a-a36b-4cc7-927c-97d29a6f39e0\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"},\"createdAt\":1747172558,\"delay\":null}', 'Symfony\\Component\\Mailer\\Exception\\TransportException: Failed to authenticate on SMTP server with username \"232b961e9f3ba2\" using the following authenticators: \"CRAM-MD5\", \"LOGIN\", \"PLAIN\". Authenticator \"CRAM-MD5\" returned \"Expected response code \"235\" but got code \"535\", with message \"535 5.7.0 Invalid credentials\".\". Authenticator \"LOGIN\" returned \"Expected response code \"334\" but got empty code.\". Authenticator \"PLAIN\" returned \"Expected response code \"235\" but got empty code.\". in C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php:247\nStack trace:\n#0 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php(177): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->handleAuth(Array)\n#1 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php(134): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->doEhloCommand()\n#2 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(255): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->executeCommand(\'HELO http\\r\\n\', Array)\n#3 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(281): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doHeloCommand()\n#4 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(211): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->start()\n#5 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend(Object(Symfony\\Component\\Mailer\\SentMessage))\n#6 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(138): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#7 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(584): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#8 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(331): Illuminate\\Mail\\Mailer->sendSymfonyMessage(Object(Symfony\\Component\\Mime\\Email))\n#9 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\Channels\\MailChannel.php(66): Illuminate\\Mail\\Mailer->send(Object(Closure), Array, Object(Closure))\n#10 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(159): Illuminate\\Notifications\\Channels\\MailChannel->send(Object(App\\Models\\User), Object(Filament\\Notifications\\Auth\\ResetPassword))\n#11 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(116): Illuminate\\Notifications\\NotificationSender->sendToNotifiable(Object(App\\Models\\User), \'a8038d83-8264-4...\', Object(Filament\\Notifications\\Auth\\ResetPassword), \'mail\')\n#12 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#13 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(111): Illuminate\\Notifications\\NotificationSender->withLocale(NULL, Object(Closure))\n#14 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\ChannelManager.php(54): Illuminate\\Notifications\\NotificationSender->sendNow(Object(Illuminate\\Database\\Eloquent\\Collection), Object(Filament\\Notifications\\Auth\\ResetPassword), Array)\n#15 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\SendQueuedNotifications.php(118): Illuminate\\Notifications\\ChannelManager->sendNow(Object(Illuminate\\Database\\Eloquent\\Collection), Object(Filament\\Notifications\\Auth\\ResetPassword), Array)\n#16 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Notifications\\SendQueuedNotifications->handle(Object(Illuminate\\Notifications\\ChannelManager))\n#17 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#18 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#19 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#20 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#21 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Container\\Container->call(Array)\n#22 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#23 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#24 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#25 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(125): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Notifications\\SendQueuedNotifications), false)\n#26 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#27 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#28 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#29 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#30 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#31 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#32 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#33 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#34 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#35 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#36 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#37 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#38 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#39 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#40 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#41 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#42 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#43 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#44 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\console\\Application.php(1094): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#45 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\console\\Application.php(342): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#46 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\console\\Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#47 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#49 C:\\xampp\\htdocs\\Sukari_Care-main\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#50 {main}', '2025-05-13 19:03:28');
INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(4, '6426aebf-06c5-4ce4-8835-d3ed7de8a10b', 'database', 'default', '{\"uuid\":\"6426aebf-06c5-4ce4-8835-d3ed7de8a10b\",\"displayName\":\"Filament\\\\Notifications\\\\Auth\\\\ResetPassword\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:2;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:41:\\\"Filament\\\\Notifications\\\\Auth\\\\ResetPassword\\\":3:{s:3:\\\"url\\\";s:226:\\\"http:\\/\\/192.168.0.151:8000\\/user\\/password-reset\\/reset?email=osamaten77%40gmail.com&token=5d0da347c7bf4bec7c62d45f4dd14b3b96d46a9dd256726815073bbbf89a2105&signature=86780174590abf2c86436382928eb68117398375558fcb17c2359afa97a6d362\\\";s:5:\\\"token\\\";s:64:\\\"5d0da347c7bf4bec7c62d45f4dd14b3b96d46a9dd256726815073bbbf89a2105\\\";s:2:\\\"id\\\";s:36:\\\"a4dfbe45-0684-4232-9737-27a2392a80ad\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"},\"createdAt\":1747172907,\"delay\":null}', 'Symfony\\Component\\Mailer\\Exception\\TransportException: Failed to authenticate on SMTP server with username \"232b961e9f3ba2\" using the following authenticators: \"CRAM-MD5\", \"LOGIN\", \"PLAIN\". Authenticator \"CRAM-MD5\" returned \"Expected response code \"235\" but got code \"535\", with message \"535 5.7.0 Invalid credentials\".\". Authenticator \"LOGIN\" returned \"Expected response code \"334\" but got empty code.\". Authenticator \"PLAIN\" returned \"Expected response code \"235\" but got empty code.\". in C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php:247\nStack trace:\n#0 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php(177): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->handleAuth(Array)\n#1 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php(134): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->doEhloCommand()\n#2 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(255): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->executeCommand(\'HELO http\\r\\n\', Array)\n#3 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(281): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doHeloCommand()\n#4 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(211): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->start()\n#5 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend(Object(Symfony\\Component\\Mailer\\SentMessage))\n#6 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(138): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#7 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(584): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#8 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(331): Illuminate\\Mail\\Mailer->sendSymfonyMessage(Object(Symfony\\Component\\Mime\\Email))\n#9 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\Channels\\MailChannel.php(66): Illuminate\\Mail\\Mailer->send(Object(Closure), Array, Object(Closure))\n#10 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(159): Illuminate\\Notifications\\Channels\\MailChannel->send(Object(App\\Models\\User), Object(Filament\\Notifications\\Auth\\ResetPassword))\n#11 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(116): Illuminate\\Notifications\\NotificationSender->sendToNotifiable(Object(App\\Models\\User), \'400eecd8-c195-4...\', Object(Filament\\Notifications\\Auth\\ResetPassword), \'mail\')\n#12 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#13 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(111): Illuminate\\Notifications\\NotificationSender->withLocale(NULL, Object(Closure))\n#14 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\ChannelManager.php(54): Illuminate\\Notifications\\NotificationSender->sendNow(Object(Illuminate\\Database\\Eloquent\\Collection), Object(Filament\\Notifications\\Auth\\ResetPassword), Array)\n#15 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\SendQueuedNotifications.php(118): Illuminate\\Notifications\\ChannelManager->sendNow(Object(Illuminate\\Database\\Eloquent\\Collection), Object(Filament\\Notifications\\Auth\\ResetPassword), Array)\n#16 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Notifications\\SendQueuedNotifications->handle(Object(Illuminate\\Notifications\\ChannelManager))\n#17 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#18 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#19 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#20 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#21 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Container\\Container->call(Array)\n#22 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#23 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#24 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#25 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(125): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Notifications\\SendQueuedNotifications), false)\n#26 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#27 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#28 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#29 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#30 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#31 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#32 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#33 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#34 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#35 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#36 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#37 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#38 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#39 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#40 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#41 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#42 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#43 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#44 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\console\\Application.php(1094): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#45 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\console\\Application.php(342): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#46 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\console\\Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#47 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#49 C:\\xampp\\htdocs\\Sukari_Care-main\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#50 {main}', '2025-05-13 19:03:31'),
(5, 'd8649da1-7534-40bc-b2b7-cff8d5fe5982', 'database', 'default', '{\"uuid\":\"d8649da1-7534-40bc-b2b7-cff8d5fe5982\",\"displayName\":\"Filament\\\\Notifications\\\\Auth\\\\ResetPassword\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:46;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:41:\\\"Filament\\\\Notifications\\\\Auth\\\\ResetPassword\\\":3:{s:3:\\\"url\\\";s:228:\\\"http:\\/\\/192.168.0.151:8000\\/user\\/password-reset\\/reset?email=osamaabdu711%40gmail.com&token=de568d95911d061fba9c59bd233973644eb98b27a0bd458e07ff5eb0e7a4198e&signature=51d29a6c912c5f18b044b031ae829450526501ae79f8374f95880cb4c49dad6e\\\";s:5:\\\"token\\\";s:64:\\\"de568d95911d061fba9c59bd233973644eb98b27a0bd458e07ff5eb0e7a4198e\\\";s:2:\\\"id\\\";s:36:\\\"c97f6ef7-df89-4e68-ad9c-185b17e7b629\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"},\"createdAt\":1747173014,\"delay\":null}', 'Symfony\\Component\\Mailer\\Exception\\TransportException: Failed to authenticate on SMTP server with username \"232b961e9f3ba2\" using the following authenticators: \"CRAM-MD5\", \"LOGIN\", \"PLAIN\". Authenticator \"CRAM-MD5\" returned \"Expected response code \"235\" but got code \"535\", with message \"535 5.7.0 Too many failed login attempts\".\". Authenticator \"LOGIN\" returned \"Expected response code \"334\" but got empty code.\". Authenticator \"PLAIN\" returned \"Expected response code \"235\" but got empty code.\". in C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php:247\nStack trace:\n#0 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php(177): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->handleAuth(Array)\n#1 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php(134): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->doEhloCommand()\n#2 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(255): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->executeCommand(\'HELO http\\r\\n\', Array)\n#3 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(281): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doHeloCommand()\n#4 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(211): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->start()\n#5 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend(Object(Symfony\\Component\\Mailer\\SentMessage))\n#6 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(138): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#7 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(584): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#8 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(331): Illuminate\\Mail\\Mailer->sendSymfonyMessage(Object(Symfony\\Component\\Mime\\Email))\n#9 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\Channels\\MailChannel.php(66): Illuminate\\Mail\\Mailer->send(Object(Closure), Array, Object(Closure))\n#10 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(159): Illuminate\\Notifications\\Channels\\MailChannel->send(Object(App\\Models\\User), Object(Filament\\Notifications\\Auth\\ResetPassword))\n#11 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(116): Illuminate\\Notifications\\NotificationSender->sendToNotifiable(Object(App\\Models\\User), \'56999d87-bcf2-4...\', Object(Filament\\Notifications\\Auth\\ResetPassword), \'mail\')\n#12 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#13 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(111): Illuminate\\Notifications\\NotificationSender->withLocale(NULL, Object(Closure))\n#14 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\ChannelManager.php(54): Illuminate\\Notifications\\NotificationSender->sendNow(Object(Illuminate\\Database\\Eloquent\\Collection), Object(Filament\\Notifications\\Auth\\ResetPassword), Array)\n#15 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\SendQueuedNotifications.php(118): Illuminate\\Notifications\\ChannelManager->sendNow(Object(Illuminate\\Database\\Eloquent\\Collection), Object(Filament\\Notifications\\Auth\\ResetPassword), Array)\n#16 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Notifications\\SendQueuedNotifications->handle(Object(Illuminate\\Notifications\\ChannelManager))\n#17 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#18 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#19 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#20 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#21 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Container\\Container->call(Array)\n#22 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#23 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#24 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#25 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(125): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Notifications\\SendQueuedNotifications), false)\n#26 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#27 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#28 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#29 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#30 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#31 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#32 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#33 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#34 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#35 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#36 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#37 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#38 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#39 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#40 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#41 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#42 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#43 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#44 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\console\\Application.php(1094): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#45 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\console\\Application.php(342): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#46 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\console\\Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#47 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#49 C:\\xampp\\htdocs\\Sukari_Care-main\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#50 {main}', '2025-05-13 19:03:35'),
(6, '591488c7-56d6-4e8f-a790-a0d679f208d8', 'database', 'default', '{\"uuid\":\"591488c7-56d6-4e8f-a790-a0d679f208d8\",\"displayName\":\"Filament\\\\Notifications\\\\Auth\\\\ResetPassword\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:2;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:41:\\\"Filament\\\\Notifications\\\\Auth\\\\ResetPassword\\\":3:{s:3:\\\"url\\\";s:226:\\\"http:\\/\\/192.168.0.151:8000\\/user\\/password-reset\\/reset?email=osamaten77%40gmail.com&token=c9d743cf01f4df8bf7aa704514d773c935a044e3a7ae80c24ed930b306e5fa32&signature=20fede0d10f50ee751a3ce8fc0949df1fbc723e4206297709e2d36fe7a83dc4a\\\";s:5:\\\"token\\\";s:64:\\\"c9d743cf01f4df8bf7aa704514d773c935a044e3a7ae80c24ed930b306e5fa32\\\";s:2:\\\"id\\\";s:36:\\\"9c299042-d6b2-493e-afe6-ec870146b056\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"},\"createdAt\":1747173181,\"delay\":null}', 'Symfony\\Component\\Mailer\\Exception\\TransportException: Failed to authenticate on SMTP server with username \"232b961e9f3ba2\" using the following authenticators: \"CRAM-MD5\", \"LOGIN\", \"PLAIN\". Authenticator \"CRAM-MD5\" returned \"Expected response code \"235\" but got code \"535\", with message \"535 5.7.0 Too many failed login attempts\".\". Authenticator \"LOGIN\" returned \"Expected response code \"334\" but got empty code.\". Authenticator \"PLAIN\" returned \"Expected response code \"235\" but got empty code.\". in C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php:247\nStack trace:\n#0 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php(177): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->handleAuth(Array)\n#1 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php(134): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->doEhloCommand()\n#2 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(255): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->executeCommand(\'HELO http\\r\\n\', Array)\n#3 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(281): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doHeloCommand()\n#4 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(211): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->start()\n#5 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend(Object(Symfony\\Component\\Mailer\\SentMessage))\n#6 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(138): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#7 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(584): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#8 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(331): Illuminate\\Mail\\Mailer->sendSymfonyMessage(Object(Symfony\\Component\\Mime\\Email))\n#9 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\Channels\\MailChannel.php(66): Illuminate\\Mail\\Mailer->send(Object(Closure), Array, Object(Closure))\n#10 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(159): Illuminate\\Notifications\\Channels\\MailChannel->send(Object(App\\Models\\User), Object(Filament\\Notifications\\Auth\\ResetPassword))\n#11 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(116): Illuminate\\Notifications\\NotificationSender->sendToNotifiable(Object(App\\Models\\User), \'a0d9a8b3-277c-4...\', Object(Filament\\Notifications\\Auth\\ResetPassword), \'mail\')\n#12 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#13 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(111): Illuminate\\Notifications\\NotificationSender->withLocale(NULL, Object(Closure))\n#14 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\ChannelManager.php(54): Illuminate\\Notifications\\NotificationSender->sendNow(Object(Illuminate\\Database\\Eloquent\\Collection), Object(Filament\\Notifications\\Auth\\ResetPassword), Array)\n#15 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\SendQueuedNotifications.php(118): Illuminate\\Notifications\\ChannelManager->sendNow(Object(Illuminate\\Database\\Eloquent\\Collection), Object(Filament\\Notifications\\Auth\\ResetPassword), Array)\n#16 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Notifications\\SendQueuedNotifications->handle(Object(Illuminate\\Notifications\\ChannelManager))\n#17 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#18 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#19 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#20 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#21 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Container\\Container->call(Array)\n#22 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#23 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#24 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#25 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(125): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Notifications\\SendQueuedNotifications), false)\n#26 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#27 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#28 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#29 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#30 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#31 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#32 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#33 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#34 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#35 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#36 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#37 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#38 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#39 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#40 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#41 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#42 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#43 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#44 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\console\\Application.php(1094): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#45 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\console\\Application.php(342): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#46 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\console\\Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#47 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#49 C:\\xampp\\htdocs\\Sukari_Care-main\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#50 {main}', '2025-05-13 19:03:38');
INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(7, '60f1fc0e-5dfe-4864-93b9-bfac124e19f5', 'database', 'default', '{\"uuid\":\"60f1fc0e-5dfe-4864-93b9-bfac124e19f5\",\"displayName\":\"Filament\\\\Notifications\\\\Auth\\\\ResetPassword\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:1;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:41:\\\"Filament\\\\Notifications\\\\Auth\\\\ResetPassword\\\":3:{s:3:\\\"url\\\";s:221:\\\"http:\\/\\/192.168.0.151:8000\\/user\\/password-reset\\/reset?email=admin%40gmail.com&token=3b29fc91c754810028fe6ae2de19ca44c65d9a2a134408be174b6a2f1ac07937&signature=bef8c1991ec6f506db491c35bf94aba2d3c687733275bddf7c263c6480ada942\\\";s:5:\\\"token\\\";s:64:\\\"3b29fc91c754810028fe6ae2de19ca44c65d9a2a134408be174b6a2f1ac07937\\\";s:2:\\\"id\\\";s:36:\\\"488e36e0-d9de-4639-9bbb-abc2fa74ad67\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"},\"createdAt\":1747173721,\"delay\":null}', 'Symfony\\Component\\Mailer\\Exception\\TransportException: Failed to authenticate on SMTP server with username \"232b961e9f3ba2\" using the following authenticators: \"CRAM-MD5\", \"LOGIN\", \"PLAIN\". Authenticator \"CRAM-MD5\" returned \"Expected response code \"235\" but got code \"535\", with message \"535 5.7.0 Too many failed login attempts\".\". Authenticator \"LOGIN\" returned \"Expected response code \"334\" but got empty code.\". Authenticator \"PLAIN\" returned \"Expected response code \"235\" but got empty code.\". in C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php:247\nStack trace:\n#0 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php(177): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->handleAuth(Array)\n#1 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php(134): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->doEhloCommand()\n#2 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(255): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->executeCommand(\'HELO http\\r\\n\', Array)\n#3 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(281): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doHeloCommand()\n#4 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(211): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->start()\n#5 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend(Object(Symfony\\Component\\Mailer\\SentMessage))\n#6 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(138): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#7 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(584): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#8 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(331): Illuminate\\Mail\\Mailer->sendSymfonyMessage(Object(Symfony\\Component\\Mime\\Email))\n#9 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\Channels\\MailChannel.php(66): Illuminate\\Mail\\Mailer->send(Object(Closure), Array, Object(Closure))\n#10 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(159): Illuminate\\Notifications\\Channels\\MailChannel->send(Object(App\\Models\\User), Object(Filament\\Notifications\\Auth\\ResetPassword))\n#11 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(116): Illuminate\\Notifications\\NotificationSender->sendToNotifiable(Object(App\\Models\\User), \'5c0db872-1b52-4...\', Object(Filament\\Notifications\\Auth\\ResetPassword), \'mail\')\n#12 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#13 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(111): Illuminate\\Notifications\\NotificationSender->withLocale(NULL, Object(Closure))\n#14 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\ChannelManager.php(54): Illuminate\\Notifications\\NotificationSender->sendNow(Object(Illuminate\\Database\\Eloquent\\Collection), Object(Filament\\Notifications\\Auth\\ResetPassword), Array)\n#15 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\SendQueuedNotifications.php(118): Illuminate\\Notifications\\ChannelManager->sendNow(Object(Illuminate\\Database\\Eloquent\\Collection), Object(Filament\\Notifications\\Auth\\ResetPassword), Array)\n#16 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Notifications\\SendQueuedNotifications->handle(Object(Illuminate\\Notifications\\ChannelManager))\n#17 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#18 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#19 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#20 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#21 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Container\\Container->call(Array)\n#22 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#23 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#24 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#25 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(125): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Notifications\\SendQueuedNotifications), false)\n#26 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#27 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#28 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#29 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#30 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#31 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#32 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#33 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#34 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#35 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#36 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#37 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#38 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#39 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#40 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#41 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#42 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#43 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#44 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\console\\Application.php(1094): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#45 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\console\\Application.php(342): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#46 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\console\\Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#47 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#49 C:\\xampp\\htdocs\\Sukari_Care-main\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#50 {main}', '2025-05-13 19:03:41'),
(8, '4319b765-235d-4d46-9614-e15fd6f39a75', 'database', 'default', '{\"uuid\":\"4319b765-235d-4d46-9614-e15fd6f39a75\",\"displayName\":\"Filament\\\\Notifications\\\\Auth\\\\ResetPassword\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:2;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:41:\\\"Filament\\\\Notifications\\\\Auth\\\\ResetPassword\\\":3:{s:3:\\\"url\\\";s:226:\\\"http:\\/\\/192.168.0.151:8000\\/user\\/password-reset\\/reset?email=osamaten77%40gmail.com&token=a908ce44832d4b0ee99bd6fedda05d009c7208854fcaae5b701e341bfca77863&signature=6567f958e21d0ff1357eaf758efc92f56822bde2d1bc0557b03ead267c82bcee\\\";s:5:\\\"token\\\";s:64:\\\"a908ce44832d4b0ee99bd6fedda05d009c7208854fcaae5b701e341bfca77863\\\";s:2:\\\"id\\\";s:36:\\\"2683f6b8-8581-4bde-a53c-cadc7595a8b9\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"},\"createdAt\":1747174448,\"delay\":null}', 'Symfony\\Component\\Mailer\\Exception\\TransportException: Failed to authenticate on SMTP server with username \"232b961e9f3ba2\" using the following authenticators: \"CRAM-MD5\", \"LOGIN\", \"PLAIN\". Authenticator \"CRAM-MD5\" returned \"Expected response code \"235\" but got code \"535\", with message \"535 5.7.0 Invalid credentials\".\". Authenticator \"LOGIN\" returned \"Expected response code \"334\" but got empty code.\". Authenticator \"PLAIN\" returned \"Expected response code \"235\" but got empty code.\". in C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php:247\nStack trace:\n#0 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php(177): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->handleAuth(Array)\n#1 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php(134): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->doEhloCommand()\n#2 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(255): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->executeCommand(\'HELO localhost\\r...\', Array)\n#3 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(281): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doHeloCommand()\n#4 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(211): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->start()\n#5 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend(Object(Symfony\\Component\\Mailer\\SentMessage))\n#6 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(138): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#7 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(584): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#8 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(331): Illuminate\\Mail\\Mailer->sendSymfonyMessage(Object(Symfony\\Component\\Mime\\Email))\n#9 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\Channels\\MailChannel.php(66): Illuminate\\Mail\\Mailer->send(Object(Closure), Array, Object(Closure))\n#10 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(159): Illuminate\\Notifications\\Channels\\MailChannel->send(Object(App\\Models\\User), Object(Filament\\Notifications\\Auth\\ResetPassword))\n#11 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(116): Illuminate\\Notifications\\NotificationSender->sendToNotifiable(Object(App\\Models\\User), \'4330e61e-5b56-4...\', Object(Filament\\Notifications\\Auth\\ResetPassword), \'mail\')\n#12 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#13 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(111): Illuminate\\Notifications\\NotificationSender->withLocale(NULL, Object(Closure))\n#14 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\ChannelManager.php(54): Illuminate\\Notifications\\NotificationSender->sendNow(Object(Illuminate\\Database\\Eloquent\\Collection), Object(Filament\\Notifications\\Auth\\ResetPassword), Array)\n#15 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\SendQueuedNotifications.php(118): Illuminate\\Notifications\\ChannelManager->sendNow(Object(Illuminate\\Database\\Eloquent\\Collection), Object(Filament\\Notifications\\Auth\\ResetPassword), Array)\n#16 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Notifications\\SendQueuedNotifications->handle(Object(Illuminate\\Notifications\\ChannelManager))\n#17 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#18 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#19 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#20 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#21 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Container\\Container->call(Array)\n#22 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#23 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#24 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#25 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(125): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Notifications\\SendQueuedNotifications), false)\n#26 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#27 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#28 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#29 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#30 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#31 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#32 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#33 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#34 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#35 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#36 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#37 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#38 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#39 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#40 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#41 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#42 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#43 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#44 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\console\\Application.php(1094): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#45 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\console\\Application.php(342): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#46 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\console\\Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#47 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#49 C:\\xampp\\htdocs\\Sukari_Care-main\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#50 {main}', '2025-05-13 19:19:32'),
(9, 'f3e8ee30-ded9-452f-9850-33c021934906', 'database', 'default', '{\"uuid\":\"f3e8ee30-ded9-452f-9850-33c021934906\",\"displayName\":\"Filament\\\\Notifications\\\\Auth\\\\ResetPassword\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:46;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:41:\\\"Filament\\\\Notifications\\\\Auth\\\\ResetPassword\\\":3:{s:3:\\\"url\\\";s:228:\\\"http:\\/\\/192.168.0.151:8000\\/user\\/password-reset\\/reset?email=osamaabdu711%40gmail.com&token=7b0ca15b3513fd2d77be5336239050158b2fe62c1614c78d0e0460035e117053&signature=50356c1dc315ec249e477abafd73426aa19985420db6c18253f7d20eec939e49\\\";s:5:\\\"token\\\";s:64:\\\"7b0ca15b3513fd2d77be5336239050158b2fe62c1614c78d0e0460035e117053\\\";s:2:\\\"id\\\";s:36:\\\"4613b5a4-585a-4f1d-869f-2b0fec4d1e84\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"},\"createdAt\":1747174619,\"delay\":null}', 'Symfony\\Component\\Mailer\\Exception\\TransportException: Failed to authenticate on SMTP server with username \"232b961e9f3ba2\" using the following authenticators: \"CRAM-MD5\", \"LOGIN\", \"PLAIN\". Authenticator \"CRAM-MD5\" returned \"Expected response code \"235\" but got code \"535\", with message \"535 5.7.0 Invalid credentials\".\". Authenticator \"LOGIN\" returned \"Expected response code \"334\" but got empty code.\". Authenticator \"PLAIN\" returned \"Expected response code \"235\" but got empty code.\". in C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php:247\nStack trace:\n#0 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php(177): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->handleAuth(Array)\n#1 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php(134): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->doEhloCommand()\n#2 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(255): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->executeCommand(\'HELO localhost\\r...\', Array)\n#3 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(281): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doHeloCommand()\n#4 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(211): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->start()\n#5 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend(Object(Symfony\\Component\\Mailer\\SentMessage))\n#6 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(138): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#7 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(584): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#8 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(331): Illuminate\\Mail\\Mailer->sendSymfonyMessage(Object(Symfony\\Component\\Mime\\Email))\n#9 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\Channels\\MailChannel.php(66): Illuminate\\Mail\\Mailer->send(Object(Closure), Array, Object(Closure))\n#10 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(159): Illuminate\\Notifications\\Channels\\MailChannel->send(Object(App\\Models\\User), Object(Filament\\Notifications\\Auth\\ResetPassword))\n#11 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(116): Illuminate\\Notifications\\NotificationSender->sendToNotifiable(Object(App\\Models\\User), \'aec9b73b-f648-4...\', Object(Filament\\Notifications\\Auth\\ResetPassword), \'mail\')\n#12 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#13 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(111): Illuminate\\Notifications\\NotificationSender->withLocale(NULL, Object(Closure))\n#14 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\ChannelManager.php(54): Illuminate\\Notifications\\NotificationSender->sendNow(Object(Illuminate\\Database\\Eloquent\\Collection), Object(Filament\\Notifications\\Auth\\ResetPassword), Array)\n#15 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\SendQueuedNotifications.php(118): Illuminate\\Notifications\\ChannelManager->sendNow(Object(Illuminate\\Database\\Eloquent\\Collection), Object(Filament\\Notifications\\Auth\\ResetPassword), Array)\n#16 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Notifications\\SendQueuedNotifications->handle(Object(Illuminate\\Notifications\\ChannelManager))\n#17 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#18 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#19 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#20 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#21 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Container\\Container->call(Array)\n#22 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#23 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#24 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#25 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(125): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Notifications\\SendQueuedNotifications), false)\n#26 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#27 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#28 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#29 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#30 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#31 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#32 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#33 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#34 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#35 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#36 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#37 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#38 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#39 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#40 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#41 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#42 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#43 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#44 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\console\\Application.php(1094): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#45 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\console\\Application.php(342): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#46 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\console\\Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#47 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#49 C:\\xampp\\htdocs\\Sukari_Care-main\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#50 {main}', '2025-05-13 19:19:35');
INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(10, 'acf40cd6-6b21-46ec-9b19-31a6b30b453e', 'database', 'default', '{\"uuid\":\"acf40cd6-6b21-46ec-9b19-31a6b30b453e\",\"displayName\":\"Filament\\\\Notifications\\\\Auth\\\\ResetPassword\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:2;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:41:\\\"Filament\\\\Notifications\\\\Auth\\\\ResetPassword\\\":3:{s:3:\\\"url\\\";s:226:\\\"http:\\/\\/192.168.0.151:8000\\/user\\/password-reset\\/reset?email=osamaten77%40gmail.com&token=121d9cb955a25ad6db5cbd87042f10aa5ece3ff137e9d5c1f20ec2263c41f2e9&signature=a4a40dadef2144043ad33b1dc256cf133a4cf6952ac71f3b0cebe7fa76ae8ce6\\\";s:5:\\\"token\\\";s:64:\\\"121d9cb955a25ad6db5cbd87042f10aa5ece3ff137e9d5c1f20ec2263c41f2e9\\\";s:2:\\\"id\\\";s:36:\\\"9bd341b3-eb57-4838-9ac9-0ad119807c95\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"},\"createdAt\":1747174716,\"delay\":null}', 'Symfony\\Component\\Mailer\\Exception\\TransportException: Failed to authenticate on SMTP server with username \"232b961e9f3ba2\" using the following authenticators: \"CRAM-MD5\", \"LOGIN\", \"PLAIN\". Authenticator \"CRAM-MD5\" returned \"Expected response code \"235\" but got code \"535\", with message \"535 5.7.0 Invalid credentials\".\". Authenticator \"LOGIN\" returned \"Expected response code \"334\" but got empty code.\". Authenticator \"PLAIN\" returned \"Expected response code \"235\" but got empty code.\". in C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php:247\nStack trace:\n#0 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php(177): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->handleAuth(Array)\n#1 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php(134): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->doEhloCommand()\n#2 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(255): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->executeCommand(\'HELO localhost\\r...\', Array)\n#3 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(281): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doHeloCommand()\n#4 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(211): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->start()\n#5 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend(Object(Symfony\\Component\\Mailer\\SentMessage))\n#6 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(138): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#7 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(584): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#8 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(331): Illuminate\\Mail\\Mailer->sendSymfonyMessage(Object(Symfony\\Component\\Mime\\Email))\n#9 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\Channels\\MailChannel.php(66): Illuminate\\Mail\\Mailer->send(Object(Closure), Array, Object(Closure))\n#10 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(159): Illuminate\\Notifications\\Channels\\MailChannel->send(Object(App\\Models\\User), Object(Filament\\Notifications\\Auth\\ResetPassword))\n#11 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(116): Illuminate\\Notifications\\NotificationSender->sendToNotifiable(Object(App\\Models\\User), \'e22b830f-67f5-4...\', Object(Filament\\Notifications\\Auth\\ResetPassword), \'mail\')\n#12 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#13 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(111): Illuminate\\Notifications\\NotificationSender->withLocale(NULL, Object(Closure))\n#14 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\ChannelManager.php(54): Illuminate\\Notifications\\NotificationSender->sendNow(Object(Illuminate\\Database\\Eloquent\\Collection), Object(Filament\\Notifications\\Auth\\ResetPassword), Array)\n#15 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\SendQueuedNotifications.php(118): Illuminate\\Notifications\\ChannelManager->sendNow(Object(Illuminate\\Database\\Eloquent\\Collection), Object(Filament\\Notifications\\Auth\\ResetPassword), Array)\n#16 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Notifications\\SendQueuedNotifications->handle(Object(Illuminate\\Notifications\\ChannelManager))\n#17 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#18 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#19 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#20 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#21 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Container\\Container->call(Array)\n#22 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#23 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#24 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#25 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(125): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Notifications\\SendQueuedNotifications), false)\n#26 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#27 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#28 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#29 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#30 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#31 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#32 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#33 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#34 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#35 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#36 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#37 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#38 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#39 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#40 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#41 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#42 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#43 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#44 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\console\\Application.php(1094): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#45 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\console\\Application.php(342): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#46 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\console\\Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#47 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#49 C:\\xampp\\htdocs\\Sukari_Care-main\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#50 {main}', '2025-05-13 19:19:38'),
(11, 'e5efa114-6eba-4a3a-b2e9-8938919ca3e1', 'database', 'default', '{\"uuid\":\"e5efa114-6eba-4a3a-b2e9-8938919ca3e1\",\"displayName\":\"Filament\\\\Notifications\\\\Auth\\\\ResetPassword\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:2;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:41:\\\"Filament\\\\Notifications\\\\Auth\\\\ResetPassword\\\":3:{s:3:\\\"url\\\";s:226:\\\"http:\\/\\/192.168.0.151:8000\\/user\\/password-reset\\/reset?email=osamaten77%40gmail.com&token=5888c6633422356fa82a662b0565c63c62343c43f03aa7d4417546f6c14dc92e&signature=215e55a549b536ad6068060d62266e7bd273c856e110a7dbf0631da9b14914f8\\\";s:5:\\\"token\\\";s:64:\\\"5888c6633422356fa82a662b0565c63c62343c43f03aa7d4417546f6c14dc92e\\\";s:2:\\\"id\\\";s:36:\\\"e5d317eb-cdbc-42c4-be9b-77d70865398f\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"},\"createdAt\":1747174787,\"delay\":null}', 'Symfony\\Component\\Mailer\\Exception\\TransportException: Failed to authenticate on SMTP server with username \"232b961e9f3ba2\" using the following authenticators: \"CRAM-MD5\", \"LOGIN\", \"PLAIN\". Authenticator \"CRAM-MD5\" returned \"Expected response code \"235\" but got code \"535\", with message \"535 5.7.0 Invalid credentials\".\". Authenticator \"LOGIN\" returned \"Expected response code \"334\" but got empty code.\". Authenticator \"PLAIN\" returned \"Expected response code \"235\" but got empty code.\". in C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php:247\nStack trace:\n#0 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php(177): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->handleAuth(Array)\n#1 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php(134): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->doEhloCommand()\n#2 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(255): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->executeCommand(\'HELO localhost\\r...\', Array)\n#3 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(281): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doHeloCommand()\n#4 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(211): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->start()\n#5 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend(Object(Symfony\\Component\\Mailer\\SentMessage))\n#6 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(138): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#7 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(584): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#8 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(331): Illuminate\\Mail\\Mailer->sendSymfonyMessage(Object(Symfony\\Component\\Mime\\Email))\n#9 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\Channels\\MailChannel.php(66): Illuminate\\Mail\\Mailer->send(Object(Closure), Array, Object(Closure))\n#10 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(159): Illuminate\\Notifications\\Channels\\MailChannel->send(Object(App\\Models\\User), Object(Filament\\Notifications\\Auth\\ResetPassword))\n#11 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(116): Illuminate\\Notifications\\NotificationSender->sendToNotifiable(Object(App\\Models\\User), \'0ab34055-6ac6-4...\', Object(Filament\\Notifications\\Auth\\ResetPassword), \'mail\')\n#12 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Notifications\\NotificationSender->Illuminate\\Notifications\\{closure}()\n#13 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\NotificationSender.php(111): Illuminate\\Notifications\\NotificationSender->withLocale(NULL, Object(Closure))\n#14 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\ChannelManager.php(54): Illuminate\\Notifications\\NotificationSender->sendNow(Object(Illuminate\\Database\\Eloquent\\Collection), Object(Filament\\Notifications\\Auth\\ResetPassword), Array)\n#15 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Notifications\\SendQueuedNotifications.php(118): Illuminate\\Notifications\\ChannelManager->sendNow(Object(Illuminate\\Database\\Eloquent\\Collection), Object(Filament\\Notifications\\Auth\\ResetPassword), Array)\n#16 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Notifications\\SendQueuedNotifications->handle(Object(Illuminate\\Notifications\\ChannelManager))\n#17 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#18 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#19 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#20 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#21 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Container\\Container->call(Array)\n#22 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#23 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#24 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(136): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#25 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(125): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Notifications\\SendQueuedNotifications), false)\n#26 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#27 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#28 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#29 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Notifications\\SendQueuedNotifications))\n#30 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#31 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#32 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#33 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#34 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#35 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#36 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#37 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#38 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#39 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#40 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#41 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#42 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#43 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#44 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\console\\Application.php(1094): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#45 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\console\\Application.php(342): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#46 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\symfony\\console\\Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#47 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 C:\\xampp\\htdocs\\Sukari_Care-main\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#49 C:\\xampp\\htdocs\\Sukari_Care-main\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#50 {main}', '2025-05-13 19:19:50');

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
(8, 1, 13, '2025-05-10 20:31:26', '2025-05-10 20:31:26'),
(9, 38, 32, '2024-05-09 16:41:01', '2024-05-23 16:41:01'),
(10, 38, 26, '2024-07-18 15:59:53', '2024-07-17 15:59:53'),
(11, 38, 32, '2024-05-09 16:41:01', '2024-05-23 16:41:01'),
(12, 38, 26, '2024-07-18 15:59:53', '2024-07-17 15:59:53');

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

--
-- Dumping data for table `glucose_readings`
--

INSERT INTO `glucose_readings` (`id`, `patient_id`, `reading_value`, `reading_type`, `created_at`, `updated_at`) VALUES
(32, 32, 202.00, 'after_meal', '2025-05-12 22:19:35', '2025-05-12 22:19:35'),
(33, 32, 90.00, 'before_meal', '2025-05-12 22:19:53', '2025-05-12 22:19:53'),
(34, 32, 90.00, 'after_meal', '2025-05-12 22:19:59', '2025-05-12 22:19:59'),
(35, 32, 90.00, 'after_meal', '2025-05-12 22:20:06', '2025-05-12 22:20:06'),
(36, 32, 96.00, 'before_meal', '2025-05-12 22:47:04', '2025-05-12 22:47:04'),
(37, 3, 150.00, 'before_meal', '2025-05-12 22:48:13', '2025-05-12 22:48:13'),
(38, 32, 190.00, 'before_meal', '2025-05-13 12:18:25', '2025-05-13 12:18:25'),
(39, 32, 290.00, 'after_meal', '2025-05-13 13:58:33', '2025-05-13 13:58:33'),
(40, 32, 291.00, 'before_meal', '2025-05-13 13:59:28', '2025-05-13 13:59:28'),
(41, 3, 190.00, 'before_meal', '2025-05-13 20:03:00', '2025-05-13 20:03:00');

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

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(12, 'default', '{\"uuid\":\"f50651ff-17f4-48d1-aca0-f93b58cc6576\",\"displayName\":\"Filament\\\\Notifications\\\\Auth\\\\ResetPassword\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:1;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:41:\\\"Filament\\\\Notifications\\\\Auth\\\\ResetPassword\\\":3:{s:3:\\\"url\\\";s:217:\\\"http:\\/\\/127.0.0.1:8000\\/user\\/password-reset\\/reset?email=admin%40gmail.com&token=61ddd7df1204a30c52c152c35494081f1f11b3169280a20285f7455a74bfdaf7&signature=d8b6339e444e2742bb6fcb44f8acc31cff8f4473e7f07586d4f479bae5f26ae6\\\";s:5:\\\"token\\\";s:64:\\\"61ddd7df1204a30c52c152c35494081f1f11b3169280a20285f7455a74bfdaf7\\\";s:2:\\\"id\\\";s:36:\\\"5cbe4347-939a-4407-b691-648e5ae12520\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"},\"createdAt\":1747175034,\"delay\":null}', 0, NULL, 1747175034, 1747175034),
(13, 'default', '{\"uuid\":\"13f684cb-495b-48e3-a3ea-b66015e4aadc\",\"displayName\":\"Filament\\\\Notifications\\\\Auth\\\\ResetPassword\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:1;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:41:\\\"Filament\\\\Notifications\\\\Auth\\\\ResetPassword\\\":3:{s:3:\\\"url\\\";s:217:\\\"http:\\/\\/127.0.0.1:8000\\/user\\/password-reset\\/reset?email=admin%40gmail.com&token=009e220f05ac2f0ca14336b0221f3a02d453c9897757a9082f04c0fb9082989d&signature=565d81673ff82ec2dd871b1deca299594c4670d223a6fdc2c3c674b67368a41c\\\";s:5:\\\"token\\\";s:64:\\\"009e220f05ac2f0ca14336b0221f3a02d453c9897757a9082f04c0fb9082989d\\\";s:2:\\\"id\\\";s:36:\\\"73b51fae-1755-4e82-81f4-f91c584e2627\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"},\"createdAt\":1747175387,\"delay\":null}', 0, NULL, 1747175387, 1747175387),
(14, 'default', '{\"uuid\":\"b8b3c0b0-b714-451e-9349-c579b5c86aaa\",\"displayName\":\"Filament\\\\Notifications\\\\Auth\\\\ResetPassword\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:1;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:41:\\\"Filament\\\\Notifications\\\\Auth\\\\ResetPassword\\\":3:{s:3:\\\"url\\\";s:217:\\\"http:\\/\\/127.0.0.1:8000\\/user\\/password-reset\\/reset?email=admin%40gmail.com&token=0a9a568a88a2349a693de24141288c15b07123d47de19e0e2fdf6ba5f7c22e7c&signature=9eb98b69c6c1ab2f1346eb3a1dedb43df7291caa01d17b35ca97c7b616d8ca57\\\";s:5:\\\"token\\\";s:64:\\\"0a9a568a88a2349a693de24141288c15b07123d47de19e0e2fdf6ba5f7c22e7c\\\";s:2:\\\"id\\\";s:36:\\\"a68b15b4-c7a3-46ab-aa78-a3613f500fb0\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"},\"createdAt\":1747175656,\"delay\":null}', 0, NULL, 1747175656, 1747175656),
(15, 'default', '{\"uuid\":\"b6a36cec-6ad0-46b5-be83-1e9f2c8a930f\",\"displayName\":\"Filament\\\\Notifications\\\\Auth\\\\ResetPassword\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\",\"command\":\"O:48:\\\"Illuminate\\\\Notifications\\\\SendQueuedNotifications\\\":3:{s:11:\\\"notifiables\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";a:1:{i:0;i:2;}s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:12:\\\"notification\\\";O:41:\\\"Filament\\\\Notifications\\\\Auth\\\\ResetPassword\\\":3:{s:3:\\\"url\\\";s:222:\\\"http:\\/\\/127.0.0.1:8000\\/user\\/password-reset\\/reset?email=osamaten77%40gmail.com&token=87ac3cc14f252160ee9a24a71c2fea7e9d632855ae61bfed44da32c88a3397ed&signature=5794082f3c79f408df41242bb46a96cadbba7b1d926098787862a0ea67a2d520\\\";s:5:\\\"token\\\";s:64:\\\"87ac3cc14f252160ee9a24a71c2fea7e9d632855ae61bfed44da32c88a3397ed\\\";s:2:\\\"id\\\";s:36:\\\"a3c3188c-2b75-43ea-8ff4-dc4635e04bd6\\\";}s:8:\\\"channels\\\";a:1:{i:0;s:4:\\\"mail\\\";}}\"},\"createdAt\":1747175688,\"delay\":null}', 0, NULL, 1747175688, 1747175688);

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
(2, 32, 1, 'وقت العشاء', 'ملعقتين', '2025-05-12 15:00:02', '2025-05-12 15:00:02'),
(3, 32, 1, 'وقت الغداء', 'نص صحن صغير', '2025-05-12 15:00:37', '2025-05-12 15:00:37'),
(4, 3, 1, 'وقت الفطور', 'نص صحن صغير', '2025-05-12 23:17:32', '2025-05-12 23:17:32'),
(5, 3, 1, 'وقت الغداء', 'نص صحن صغير', '2025-05-13 22:11:22', '2025-05-13 22:11:22'),
(6, 32, 1, 'وقت الغداء', 'نص صحن صغير', '2025-05-13 22:11:36', '2025-05-13 22:11:36'),
(7, 32, 1, 'وقت العشاء', 'نص صحن صغير', '2025-05-13 22:14:05', '2025-05-13 22:14:05'),
(8, 32, 1, 'وقت الغداء', 'نص صحن صغير', '2025-05-13 22:19:20', '2025-05-13 22:19:20'),
(9, 32, 1, 'وقت الفطور', 'نص صحن صغير', '2025-05-13 22:20:10', '2025-05-13 22:20:10'),
(13, 32, 1, 'وقت الفطور', 'توكل بالملعقه هههههrgr', '2025-05-13 23:50:07', '2025-05-13 23:50:07');

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
(1, 'زوو', 32, 'صباحا', '/data/user/0/com.example.sukari_care/cache/9ea6fd6b-86f7-4b12-b435-faaa7977d03d/Screenshot_٢٠٢٥٠٥١٣-٠٦٢٦٢٩_Instagram.jpg', 'وووة', '2025-05-13 13:43:25', '2025-05-13 13:43:25'),
(2, 'jdbdb', 3, 'عشاء', '/data/user/0/com.example.sukari_care/cache/9ba8b109-a3b4-495b-9a2b-dcfb7b4940cd/Screenshot_٢٠٢٥٠٥١٣-٠٦٢٦٢٩_Instagram.jpg', 'djbfbfn', '2025-05-13 20:00:09', '2025-05-13 20:00:09');

-- --------------------------------------------------------

--
-- Table structure for table `medical_history`
--

CREATE TABLE `medical_history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `medical_history`
--

INSERT INTO `medical_history` (`id`, `patient_id`, `notes`, `created_at`, `updated_at`) VALUES
(1, 32, 'استمرار انخفاض معدل السكر التراكمي من 7.2 إلى 7 وانخفاض معدل الضغط', '2025-03-15 19:45:47', '2025-03-15 19:45:47'),
(17, 60, 'wugefqiwugfwefqw', '2025-05-17 18:23:28', '2025-05-17 18:23:28'),
(19, 62, 'زو', '2025-05-17 18:26:13', '2025-05-17 18:26:13'),
(20, 64, 'زرزر', '2025-05-17 19:07:20', '2025-05-17 19:07:20');

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
(94, '2025_02_27_224726_create_meal_recommendations_table', 15),
(95, '2025_05_12_173258_edit_meal_table', 16),
(96, '2025_05_12_150053_create_meal_systems_table', 17),
(101, '2025_05_13_150149_create_alarms_table', 18),
(102, '2025_05_15_195109_update_blog', 19),
(105, '2025_05_17_190039_update__patient', 20),
(108, '2025_05_17_190454_update_user_profile', 21),
(109, '2025_05_17_191917_update__patient', 22),
(111, '2025_05_17_192456_update_medcal_hestory', 23),
(113, '2025_05_17_205022_update_physcal', 24),
(115, '2025_02_27_223354_create_symptoms_table', 25);

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
('180b9c0a-e23d-48ab-ae24-6697dfbae320', 'App\\Notifications\\DoctorNewRecommandationNotfication', 'App\\Models\\User', 38, '{\"id\":3,\"title\":\"New Recommandation Added meal \\u0641\\u062a\\u0647\",\"data\":\"this recommendation at 2025-05-12 18:00:37\",\"notifiable_id\":\"32\"}', '2025-05-12 22:21:56', '2025-05-12 15:00:37', '2025-05-12 22:21:56'),
('326cf8ff-1f17-4ce7-88ad-fd7fe4c6b953', 'App\\Notifications\\DoctorNewRecommandationNotfication', 'App\\Models\\User', 38, '{\"id\":9,\"title\":\"\\u0648\\u0635\\u0641\\u0629\\u063a\\u0630\\u0627\\u0626\\u064a\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629\",\"hi_user_name\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0639\\u0632\\u064a\\u0632\\u064a \\u0632\\u0643\\u0631\\u064a\\u0627 \\u064a\\u062d\\u064a \\u0627\\u0644\\u0628\\u0627\\u0631\\u0632\\u064a\",\"data\":\" \\u0644\\u0642\\u062f \\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0648\\u0635\\u0641\\u0629 \\u063a\\u0630\\u0627\\u064a\\u0629  \\u0641\\u062a\\u0647\",\"notifiable_id\":\"32\"}', '2025-05-13 22:20:16', '2025-05-13 22:20:10', '2025-05-13 22:20:16'),
('3d734077-8cac-42eb-ba36-6c802541cddb', 'App\\Notifications\\DoctorNewRecommandationNotfication', 'App\\Models\\User', 6, '{\"id\":10,\"title\":\"New Recommandation Added meal soshi\",\"data\":\"this recommendation at 2025-05-04 23:14:55\",\"notifiable_id\":\"3\"}', '2025-05-04 20:14:58', '2025-05-04 20:14:55', '2025-05-04 20:14:58'),
('3e1af37c-4a87-4ba1-8323-52779bf96d86', 'App\\Notifications\\DoctorNewRecommandationNotfication', 'App\\Models\\User', 38, '{\"id\":6,\"title\":\"\\u0648\\u0635\\u0641\\u0629\\u063a\\u0630\\u0627\\u0626\\u064a\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629\",\"data\":\"\\u0639\\u0632\\u064a\\u0632\\u064a zakaria \\u0644\\u0642\\u062f \\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0648\\u0635\\u0641\\u0629 \\u063a\\u0630\\u0627\\u064a\\u0629  \\u0641\\u062a\\u0647\",\"notifiable_id\":\"32\"}', '2025-05-13 22:11:48', '2025-05-13 22:11:36', '2025-05-13 22:11:48'),
('41488975-5ea0-4bea-8b26-ce2302099b3a', 'App\\Notifications\\DoctorNewRecommandationNotfication', 'App\\Models\\User', 6, '{\"id\":4,\"title\":\"New Recommandation Added meal \\u0641\\u062a\\u0647\",\"data\":\"this recommendation at 2025-05-13 02:17:32\",\"notifiable_id\":\"3\"}', NULL, '2025-05-12 23:17:32', '2025-05-12 23:17:32'),
('69327320-6aa8-4175-837f-ee5936fa8379', 'App\\Notifications\\DoctorNewRecommandationNotfication', 'App\\Models\\User', 38, '{\"id\":2,\"title\":\"New Recommandation Added meal \\u0641\\u062a\\u0647\",\"data\":\"this recommendation at 2025-05-12 18:00:02\",\"notifiable_id\":\"32\"}', '2025-05-12 22:21:56', '2025-05-12 15:00:02', '2025-05-12 22:21:56'),
('8aac34fb-47e4-4eee-948d-7433c7894303', 'App\\Notifications\\DoctorNewRecommandationNotfication', 'App\\Models\\User', 38, '{\"id\":11,\"title\":\"New Recommandation Added meal soshi\",\"data\":\"this recommendation at 2025-05-12 16:23:07\",\"notifiable_id\":\"32\"}', '2025-05-12 22:21:56', '2025-05-12 13:23:10', '2025-05-12 22:21:56'),
('91a60fa9-5263-4f2a-9909-016db281c1be', 'App\\Notifications\\DoctorNewRecommandationNotfication', 'App\\Models\\User', 38, '{\"id\":7,\"title\":\"\\u0648\\u0635\\u0641\\u0629\\u063a\\u0630\\u0627\\u0626\\u064a\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629\",\"data\":\"\\u0639\\u0632\\u064a\\u0632\\u064a \\u0632\\u0643\\u0631\\u064a\\u0627 \\u064a\\u062d\\u064a \\u0627\\u0644\\u0628\\u0627\\u0631\\u0632\\u064a \\u0644\\u0642\\u062f \\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0648\\u0635\\u0641\\u0629 \\u063a\\u0630\\u0627\\u064a\\u0629  \\u0641\\u062a\\u0647\",\"notifiable_id\":\"32\"}', '2025-05-13 22:14:14', '2025-05-13 22:14:05', '2025-05-13 22:14:14'),
('bd25dc06-637c-43a6-ab06-921fd0dcbb67', 'App\\Notifications\\DoctorNewRecommandationNotfication', 'App\\Models\\User', 38, '{\"id\":13,\"title\":\"New Recommandation Added meal soshi\",\"data\":\"this recommendation at 2025-05-12 16:24:35\",\"notifiable_id\":\"32\"}', '2025-05-12 22:21:56', '2025-05-12 13:24:35', '2025-05-12 22:21:56'),
('e047f59a-05f1-442c-9641-77d551581b02', 'App\\Notifications\\DoctorNewRecommandationNotfication', 'App\\Models\\User', 6, '{\"id\":5,\"title\":\"\\u0648\\u0635\\u0641\\u0629\\u063a\\u0630\\u0627\\u0626\\u064a\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629\",\"data\":\"\\u0639\\u0632\\u064a\\u0632\\u064a ali \\u0644\\u0642\\u062f \\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0648\\u0635\\u0641\\u0629 \\u063a\\u0630\\u0627\\u064a\\u0629  \\u0641\\u062a\\u0647\",\"notifiable_id\":\"3\"}', NULL, '2025-05-13 22:11:22', '2025-05-13 22:11:22'),
('f9ef1d91-1fd1-4b36-be0f-603905e08505', 'App\\Notifications\\DoctorNewRecommandationNotfication', 'App\\Models\\User', 38, '{\"id\":8,\"title\":\"\\u0648\\u0635\\u0641\\u0629\\u063a\\u0630\\u0627\\u0626\\u064a\\u0629 \\u062c\\u062f\\u064a\\u062f\\u0629\",\"hi_user_name\":\"\\u0645\\u0631\\u062d\\u0628\\u0627 \\u0639\\u0632\\u064a\\u0632\\u064a \\u0632\\u0643\\u0631\\u064a\\u0627 \\u064a\\u062d\\u064a \\u0627\\u0644\\u0628\\u0627\\u0631\\u0632\\u064a\",\"data\":\" \\u0644\\u0642\\u062f \\u062a\\u0645 \\u0627\\u0636\\u0627\\u0641\\u0629 \\u0648\\u0635\\u0641\\u0629 \\u063a\\u0630\\u0627\\u064a\\u0629  \\u0641\\u062a\\u0647\",\"notifiable_id\":\"32\"}', '2025-05-13 22:19:29', '2025-05-13 22:19:20', '2025-05-13 22:19:29');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('admin@gmail.com', '$2y$12$t1ECLCgSsOJdGSCl.H7zueedAQFF8wJsz13Ldw61HXj57JO5uz6i.', '2025-05-13 19:34:16'),
('osamaabdu711@gmail.com', '$2y$12$RP8fVuabIzlWUVV9biit.eoStf/vFVvIKV89H2mjmXZD0rGU.ZMSi', '2025-05-13 19:28:03'),
('osamaten77@gmail.com', '$2y$12$Pt3jQUR1xfb9PYcoGzQt4u80g1w8/.kQb1WcIBbmi.jwAZjek9LVq', '2025-05-13 19:34:48'),
('sharaf@gmail.com', '$2y$12$ptuStni3I2NAcYE7mvOBhuXNclcyesgsgCbbBGBgNhI47CCznvaam', '2025-05-13 18:37:48');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type_of_sugar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `user_id`, `doctor_id`, `created_at`, `updated_at`, `type_of_sugar`) VALUES
(3, 6, 2, '2025-03-11 16:59:58', '2025-03-11 16:59:58', NULL),
(32, 38, 2, '2025-03-15 19:45:47', '2025-03-15 19:45:47', NULL),
(41, 156, 5, '2025-05-13 20:22:45', '2025-05-13 20:22:45', NULL),
(60, 217, 2, '2025-05-17 18:23:28', '2025-05-17 18:23:28', 'الاول'),
(62, 221, 2, '2025-05-17 18:26:13', '2025-05-17 18:26:13', 'النوع الاول'),
(63, 222, 2, '2025-05-17 19:05:52', '2025-05-17 19:05:52', 'النوع الثاني'),
(64, 223, 2, '2025-05-17 19:07:20', '2025-05-17 19:07:20', 'النوع الاول');

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
(254, 'App\\Models\\User', 6, 'web', 'd92d27308eee9169ed0105afc64d22b1d1452b02afebbfd2a31c63269fdc6c31', '[\"*\"]', '2025-05-12 23:00:38', NULL, '2025-05-12 23:00:34', '2025-05-12 23:00:38'),
(262, 'App\\Models\\User', 6, 'web', '6d65b5cfc6675b9d6d6cb4b8374752a4ec406245d86e988102d131441471c0fe', '[\"*\"]', '2025-05-12 23:16:35', NULL, '2025-05-12 23:15:36', '2025-05-12 23:16:35'),
(263, 'App\\Models\\User', 5, 'web', '19cada8e841f8c5a4b16f1e6887a59309979f181e1240c6959dc25427717db22', '[\"*\"]', '2025-05-12 23:17:32', NULL, '2025-05-12 23:17:17', '2025-05-12 23:17:32'),
(264, 'App\\Models\\User', 6, 'web', 'afc858477b5961f790a5a68db541d8de15819257dc5eeb8ef53a7df38fb5bc92', '[\"*\"]', NULL, NULL, '2025-05-12 23:26:34', '2025-05-12 23:26:34'),
(267, 'App\\Models\\User', 38, 'web', 'c5fcf62506ced64bfe9dc14cce812ff97f5689a82af3df8968a302f0e3b41479', '[\"*\"]', '2025-05-13 11:48:10', NULL, '2025-05-13 11:08:50', '2025-05-13 11:48:10'),
(268, 'App\\Models\\User', 38, 'web', '1bb4cc1f4e6e89e3d1f13e3ecdaea73e0aa37bfa35983abc3cb04a84547e515b', '[\"*\"]', '2025-05-13 11:40:47', NULL, '2025-05-13 11:40:19', '2025-05-13 11:40:47'),
(270, 'App\\Models\\User', 38, 'web', '2cafbd13d6ceed68beeefb1d3850e6c3400a024e4d9cc01655ddefc1cf62d36d', '[\"*\"]', '2025-05-13 12:11:24', NULL, '2025-05-13 12:10:56', '2025-05-13 12:11:24'),
(272, 'App\\Models\\User', 38, 'web', 'ce168474e54f7d2e91c276ab342e3d9e2ceffca2162edee31a25d84931ec2834', '[\"*\"]', '2025-05-13 13:31:01', NULL, '2025-05-13 12:13:49', '2025-05-13 13:31:01'),
(273, 'App\\Models\\User', 38, 'web', '4809a682c8f7d6e540d135535ed7a9a1935696793e41c868d8f937b1aa94f729', '[\"*\"]', '2025-05-13 17:58:29', NULL, '2025-05-13 12:36:42', '2025-05-13 17:58:29'),
(274, 'App\\Models\\User', 38, 'web', '245a147da73919902bee9247e90c50babb0918ece5dd92cd6035e81e33ae1949', '[\"*\"]', '2025-05-13 13:43:25', NULL, '2025-05-13 13:43:12', '2025-05-13 13:43:25'),
(275, 'App\\Models\\User', 38, 'web', 'b48eea3be6707501d5d323b42fc563d808bf2711f116300621689e893e3f09b1', '[\"*\"]', NULL, NULL, '2025-05-13 13:44:46', '2025-05-13 13:44:46'),
(276, 'App\\Models\\User', 38, 'web', 'a690ba0aa7947f86fa74cffe25be618b166fb94fa874fb259eb61af7e56ff834', '[\"*\"]', '2025-05-13 14:54:37', NULL, '2025-05-13 13:48:11', '2025-05-13 14:54:37'),
(278, 'App\\Models\\User', 38, 'web', '40f7f6a54b84293aacfb63898c338c611d443cb17b7aa205905ae5bbc37f9acb', '[\"*\"]', '2025-05-13 15:26:51', NULL, '2025-05-13 14:54:53', '2025-05-13 15:26:51'),
(279, 'App\\Models\\User', 38, 'web', 'c56b6e62464138cb64ee341ccdc8bd8241be1fe155c04f841e7b1aa978085380', '[\"*\"]', '2025-05-13 16:41:32', NULL, '2025-05-13 15:28:02', '2025-05-13 16:41:32'),
(280, 'App\\Models\\User', 5, 'web', '94f7c1adee0fb8c78a59356fa340e41b791c51194a399d33af82704111f92a4d', '[\"*\"]', NULL, NULL, '2025-05-13 16:43:33', '2025-05-13 16:43:33'),
(281, 'App\\Models\\User', 38, 'web', '231227f0f8ee39d92342c499b7637b02b84818e5b28b79f13d884b386dcef3f8', '[\"*\"]', '2025-05-13 16:44:42', NULL, '2025-05-13 16:44:23', '2025-05-13 16:44:42'),
(283, 'App\\Models\\User', 38, 'web', '83edb20984527dfe6a0bb45387df588ac80a38dbed2cace62363c12237b5c50b', '[\"*\"]', '2025-05-13 17:09:28', NULL, '2025-05-13 16:50:12', '2025-05-13 17:09:28'),
(284, 'App\\Models\\User', 5, 'web', '5ac47dd428344b345e9e985d6e93f919dc8bac34bac051bc125200bd810ac4cf', '[\"*\"]', NULL, NULL, '2025-05-13 17:26:31', '2025-05-13 17:26:31'),
(285, 'App\\Models\\User', 38, 'web', '3283ebb19be6315d5ba74e603974378a1547e10181f61ea89c84e2db19bedff9', '[\"*\"]', '2025-05-13 18:10:07', NULL, '2025-05-13 17:27:25', '2025-05-13 18:10:07'),
(287, 'App\\Models\\User', 38, 'web', 'd3ce797b529ef54b08515538a14c57bb9ac50b26e0ca44a77b28e167efb94977', '[\"*\"]', '2025-05-13 18:40:20', NULL, '2025-05-13 18:19:57', '2025-05-13 18:40:20'),
(288, 'App\\Models\\User', 38, 'web', '34b58a9dadff6f553f220cb9c6d23c880a7af1ed7a87e8383a213db989ca73a3', '[\"*\"]', NULL, NULL, '2025-05-13 18:24:11', '2025-05-13 18:24:11'),
(291, 'App\\Models\\User', 38, 'web', '39c711ff9e508315a4f918085d6c717cc4a6a178e19ab8d39162bffb46cb3aa9', '[\"*\"]', '2025-05-13 18:32:01', NULL, '2025-05-13 18:27:04', '2025-05-13 18:32:01'),
(292, 'App\\Models\\User', 5, 'web', '07baa81d332a0730a8132bfe4f9d6c603a12ee72c76846b90a1484cac46e7175', '[\"*\"]', NULL, NULL, '2025-05-13 18:35:53', '2025-05-13 18:35:53'),
(293, 'App\\Models\\User', 38, 'web', '591d137ba5d8553170540ac5fbffcd6d5dd3de78aa0e54f76a8dbea99e21722d', '[\"*\"]', '2025-05-13 18:38:10', NULL, '2025-05-13 18:36:42', '2025-05-13 18:38:10'),
(295, 'App\\Models\\User', 38, 'web', '63bd617562f7a9ee8026172f3f013095ff8e3d59557deafc6d6a5c1c4561505b', '[\"*\"]', '2025-05-13 18:41:14', NULL, '2025-05-13 18:40:48', '2025-05-13 18:41:14'),
(297, 'App\\Models\\User', 38, 'web', '91c366ae9ffb24e924c1849575aeda2c10eab8cf387a2e07e10163e5e4e3d10f', '[\"*\"]', '2025-05-13 18:42:28', NULL, '2025-05-13 18:42:07', '2025-05-13 18:42:28'),
(299, 'App\\Models\\User', 38, 'web', '31507ad00ea886612cf0edfd08d98f5e872cb0a4cd1c61a3fc811e319140ab4d', '[\"*\"]', '2025-05-13 18:45:25', NULL, '2025-05-13 18:44:45', '2025-05-13 18:45:25'),
(301, 'App\\Models\\User', 38, 'web', '1fb80b2935ec8f8369e67e6dc4ed1a21f956d55c72c92869091ee03615c9b9c0', '[\"*\"]', '2025-05-13 18:54:17', NULL, '2025-05-13 18:50:56', '2025-05-13 18:54:17'),
(307, 'App\\Models\\User', 5, 'web', 'a9f973d59ac5e4b82aa26051dd348f724665964f957e8ed0e87543990d2db1f4', '[\"*\"]', NULL, NULL, '2025-05-13 18:58:29', '2025-05-13 18:58:29'),
(315, 'App\\Models\\User', 5, 'web', '7bd72e5b92f6628c39ebc9b8f479f18091aa487eb0315e6fa06e820db96b2974', '[\"*\"]', NULL, NULL, '2025-05-13 19:06:43', '2025-05-13 19:06:43'),
(324, 'App\\Models\\User', 38, 'web', '9053977b1fe85df0cfa56e3e8f3865bc500566a661756679bce26a9c6b128d2a', '[\"*\"]', '2025-05-13 19:13:40', NULL, '2025-05-13 19:12:30', '2025-05-13 19:13:40'),
(325, 'App\\Models\\User', 38, 'web', 'c7bada383486f6d5dd2a02e4e2b5d100401343e9d855649c9c8d64e1197cbe17', '[\"*\"]', '2025-05-13 19:39:54', NULL, '2025-05-13 19:14:03', '2025-05-13 19:39:54'),
(333, 'App\\Models\\User', 38, 'web', '12d09060bf6d0724374111929a964fb7adf7b358450ef69b536eaf50951633f7', '[\"*\"]', '2025-05-13 19:46:24', NULL, '2025-05-13 19:44:13', '2025-05-13 19:46:24'),
(336, 'App\\Models\\User', 5, 'web', '7c49a8031e639c1b1a21fcc5ce4dd7d3c01a549530f268258984d49d8448a23f', '[\"*\"]', '2025-05-13 19:48:38', NULL, '2025-05-13 19:48:03', '2025-05-13 19:48:38'),
(348, 'App\\Models\\User', 46, 'web', '7e8a73afd9937656d679f35b94b9e78fd6715b10f6a4743eedb7ab48b461cbea', '[\"*\"]', '2025-05-13 19:55:16', NULL, '2025-05-13 19:52:41', '2025-05-13 19:55:16'),
(349, 'App\\Models\\User', 38, 'web', 'de8bbcf7f36133126ed2410bd8e135d9da37a306c33c96cebbdfe579a83d3a9d', '[\"*\"]', '2025-05-13 19:58:29', NULL, '2025-05-13 19:54:55', '2025-05-13 19:58:29'),
(355, 'App\\Models\\User', 6, 'web', 'e08c56f286ac0c6584f9cbab2f24ab671a7fd67449056250a1ad82ad2bda4d92', '[\"*\"]', '2025-05-13 20:02:44', NULL, '2025-05-13 20:02:40', '2025-05-13 20:02:44'),
(358, 'App\\Models\\User', 5, 'web', '294a38c12e2ada22107933157274af89257e150e005a895cb16d55cec9e5266b', '[\"*\"]', NULL, NULL, '2025-05-13 20:08:59', '2025-05-13 20:08:59'),
(362, 'App\\Models\\User', 151, 'web', '412e77e63aea9e5d5e65cf0bc581db9fc7f13dc31a8e5870a88491a0d2f46eff', '[\"*\"]', '2025-05-13 21:05:52', NULL, '2025-05-13 21:04:22', '2025-05-13 21:05:52'),
(366, 'App\\Models\\User', 38, 'web', 'a2fe3f223197f0999d65b7969a833b6ce3bc9ab0d9d6a144c9933da31d2b0fd5', '[\"*\"]', '2025-05-13 22:24:50', NULL, '2025-05-13 21:30:01', '2025-05-13 22:24:50'),
(370, 'App\\Models\\User', 38, 'web', 'e6ff91c2d3d07c29fc73d12df6a98499f7b8a0f6438a9f396cc68d284508f24d', '[\"*\"]', '2025-05-13 21:35:02', NULL, '2025-05-13 21:34:07', '2025-05-13 21:35:02'),
(373, 'App\\Models\\User', 38, 'web', 'bffc1af233417132f3434dddada5e0e580ae2ad201d4b9ad0d8aac36505c0967', '[\"*\"]', '2025-05-13 22:16:37', NULL, '2025-05-13 21:47:13', '2025-05-13 22:16:37'),
(374, 'App\\Models\\User', 5, 'web', '06aad3c98059ea0047f7b940c615746882850404a4648d32806c6b1c755479f7', '[\"*\"]', '2025-05-13 22:20:10', NULL, '2025-05-13 22:11:01', '2025-05-13 22:20:10'),
(376, 'App\\Models\\User', 38, 'web', 'ad4549df5761690766af44c8ccae164a407710efa286461d3aad4d251960df20', '[\"*\"]', '2025-05-13 22:56:37', NULL, '2025-05-13 22:45:03', '2025-05-13 22:56:37'),
(379, 'App\\Models\\User', 38, 'web', 'fe6f3f4b3c0c969df72fe0b0a24fa337cbac4b9846a83dc75c4b7e5a655fa6fc', '[\"*\"]', '2025-05-13 23:05:17', NULL, '2025-05-13 23:03:28', '2025-05-13 23:05:17'),
(382, 'App\\Models\\User', 38, 'web', '2b40e61efcd62f4851760bf706ffef129b66aa488fc30630b44c2f1d89e065e3', '[\"*\"]', '2025-05-13 23:25:09', NULL, '2025-05-13 23:17:00', '2025-05-13 23:25:09'),
(384, 'App\\Models\\User', 159, 'web', '2cc746625368b90d20782f33550785953262e3dfed08f406fee03f284e99cbfe', '[\"*\"]', NULL, NULL, '2025-05-13 23:38:46', '2025-05-13 23:38:46'),
(385, 'App\\Models\\User', 38, 'web', 'b50bf4c332f11240d2f1126d8ad06d51ede895c22a6ab4c637e30f8db234ae9c', '[\"*\"]', '2025-05-13 23:52:07', NULL, '2025-05-13 23:40:41', '2025-05-13 23:52:07'),
(386, 'App\\Models\\User', 5, 'web', 'a5f2d75e751f50d3536f87e3a93ea3f9d01ec67b326ff395e1a81b7eb040d21d', '[\"*\"]', '2025-05-17 16:37:59', NULL, '2025-05-17 16:12:40', '2025-05-17 16:37:59'),
(387, 'App\\Models\\User', 5, 'web', 'e9e8fc718454036cd5ecd663659b1b11e4e94206e702faa2119ff98d1577a52f', '[\"*\"]', '2025-05-17 18:23:28', NULL, '2025-05-17 16:37:30', '2025-05-17 18:23:28'),
(388, 'App\\Models\\User', 5, 'web', '70d5949b1a2de4eef37a2ee044da08249bc5e3bd927c90a1ad4ef15b0ee11866', '[\"*\"]', '2025-05-17 19:07:19', NULL, '2025-05-17 16:52:02', '2025-05-17 19:07:19');

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `physical_examination`
--

INSERT INTO `physical_examination` (`id`, `patient_id`, `blood_pressure`, `heart_rate`, `weight`, `height`, `bmi`, `foot_examination_notes`, `created_at`, `updated_at`) VALUES
(23, 60, '12', 120, 100.00, 150.00, 12.00, 'Screenshot_٢٠٢٥٠٥١٧-٠٨٢٩٢٤.jpg', '2025-05-17 18:23:28', '2025-05-17 18:23:28'),
(24, 62, '11', 11, 14.00, 45.00, 48.00, 'Screenshot_٢٠٢٥٠٥١٧-٠٨٢٩٢٤.jpg', '2025-05-17 18:26:13', '2025-05-17 18:26:13'),
(25, 64, '949', 99, 99.00, 98.00, 88.00, 'Screenshot_٢٠٢٥٠٥١٦-١٧٣٦٠٠_Drive.jpg', '2025-05-17 19:07:20', '2025-05-17 19:07:20');

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
(18, 32, 149, '2025-05-12 11:09:24', '2025-05-12 11:09:24'),
(19, 32, 150, '2025-05-13 12:12:17', '2025-05-13 12:12:17'),
(20, 32, 151, '2025-05-13 12:12:52', '2025-05-13 12:12:52'),
(21, 32, 158, '2025-05-13 23:12:02', '2025-05-13 23:12:02'),
(22, 32, 159, '2025-05-13 23:28:52', '2025-05-13 23:28:52');

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
('r5jX81nsOvY4PJvIncIkv4F4hbsQyPtqcgHX9gac', 5, '192.168.0.151', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiYVVJZEV3aW54WVpTaE96d3RSV0lRTjBGUnZFd25XQkM4WnJDbVcwMiI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM2OiJodHRwOi8vMTkyLjE2OC4wLjE1MTo4MDAwL3VzZXIvYmxvZ3MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo1O3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTIkR3FtSkczU0RhSkZTV2ZiRmlaR2FCT1NwNDZQaUtRV25SY05GaWIvVVYyNWxuN0NNczM1ZHkiO30=', 1747519659);

-- --------------------------------------------------------

--
-- Table structure for table `symptom`
--

CREATE TABLE `symptom` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `symptom_description` varchar(255) DEFAULT NULL,
  `severity` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `symptom`
--

INSERT INTO `symptom` (`id`, `patient_id`, `symptom_description`, `severity`, `created_at`, `updated_at`) VALUES
(1, 60, 'dqdiuqgwduiqgd', 'weiofhefwef', '2025-05-17 18:23:28', '2025-05-17 18:23:28'),
(3, 62, 'ماش', 'مشا', '2025-05-17 18:26:13', '2025-05-17 18:26:13'),
(4, 64, 'زبرز', 'نببزل', '2025-05-17 19:07:20', '2025-05-17 19:07:20');

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
(1, 'admin', '967781236868', '$2y$12$2a/oNeb4TyLu5I1dXE9pKejprqubdIxDU.lgIoPffZ6aaK/SM3SDm', 'admin@gmail.com', NULL, '$2y$12$9f6o/Pq6P0cJ4UwoFT3Sp.nzZryLx6gERy2F6LDL76Iua2JeY7bVK', 'active', 'admin', NULL, 'nYXCwwSRI46p4O4e1xRhj4rm2PbcDotyON9ZOW7hnG7Ru9wm4MNu158UfgND', '2025-03-11 16:30:49', '2025-05-12 18:31:25'),
(2, 'osama Abdo', '967772790221', '$2y$12$PExKt1fvcsadb.WhlOGtbeLwnA2MdnBqZyAJwNVNbvTonhwn4BXje', 'osamaten77@gmail.com', NULL, '$2y$12$vJHcrF87PXKKwR2dyBdqbOPeQKQnt3KNGdwy0KMSrqCoNg9oA4s42', 'active', 'admin', 'uploads/user_profile/patient-icon-9249.png', 'yqxc6OMAGQkyCSs5yX3hlup4qGhLAM6kSCJAir6igCjM7pInysXfu3omKlms', '2025-03-11 16:34:22', '2025-05-13 17:44:56'),
(5, 'sharaf', '967712118984', '$2y$12$Gct4jx0nijdyEWJ/IwDHr..zOTffpiDtSsWBS5AMUAGTfcwPZBh4a', 'sharaf@gmail.com', NULL, '$2y$12$GqmJG3SDaJFSWfbFiZGaBOSp46PiKQWnRcNFib/UV25ln7CMs35dy', 'active', 'doctor', NULL, 'YT6LIE3J2J5UnP7wsUpDs9Q6J0KattMWCoDsws9JtENcYt3hQOQp6ppXS3AP', '2025-03-11 16:58:27', '2025-05-13 23:37:24'),
(6, 'ali', '967771846099', NULL, 'ali@gmail.coms', NULL, '$2y$12$r0Nddtk1SxUdt2gAJQ9HCOYkJor2QaBuvR/W1wtFDGQEUsWe7MA9i', 'active', 'patient', 'uploads/user_profile/th.png', 'XP9MsbMB0Hyu79KNGQuLRhKHeXO0L735o6xSAH25MrB6tQs84U34gl12eOsh', '2025-03-11 16:59:58', '2025-05-13 17:48:22'),
(38, 'zakaria', '967777011235', NULL, 'zakrya@gmail.coms', NULL, '$2y$12$dPPzSeJzk0YJqHb9xRH0h.V9KDG4fazyPe7IbkkImTYNjK7usOSYu', 'active', 'patient', NULL, NULL, '2025-03-15 19:45:47', '2025-05-13 21:35:03'),
(45, 'rel ahmed', NULL, '$2y$12$VhLnGsei4F5a81SToKtpLefWP4ScTUvVyJ7jSU19pMRAJLhArIpgK', 'relative@gmail.com', NULL, '$2y$12$HZkOIU/sXHlICNkYEbUw8OI.N0NeZldjKxGRWV.L9e1AHSmstGUJ6', 'active', 'relative', NULL, NULL, '2025-04-08 19:47:54', '2025-05-13 19:45:56'),
(46, 'osama711', '967999999999', NULL, 'osamaabdu711@gmail.com', NULL, '$2y$12$mJJ5AgaLsRnBWh.G4n3IXuyJx6y4wGz85uDagKnjr1SmDDT1IZCjq', 'active', 'patient', NULL, 'cvhDdr0cOSASsGXttPPaGxLUOAU2Q2iR4Syjpdo8PKTLJaUMsxTRghPgZjBf', '2025-04-12 19:12:52', '2025-05-12 22:28:46'),
(47, 'abdu', NULL, NULL, 'abdu@gmail.com', NULL, '$2y$12$0WHF3WFIU1o5RLCBuaHvoOILBDFAS/Q4AqNQY.ZOvWwPmwB7aGLFS', 'active', 'doctor', NULL, NULL, '2025-04-13 11:02:52', '2025-04-13 11:02:52'),
(48, 'abdu', NULL, NULL, 'abdus@gmail.com', NULL, '$2y$12$zrZH0T1Ln/ZcEfIRR/vE3uBqCeWTEt0a3N3KJMXI1Fsr9L6RDwkvK', 'suspend', 'doctor', NULL, NULL, '2025-04-13 11:06:33', '2025-05-12 19:56:20'),
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
(149, 'محمد', '9677123123123', NULL, 'محمد753242@gmail.coms', NULL, '$2y$12$LIxoAYisuxznWnn3MVGhFuQNQRRtW6BJm0idBbShZhAC4vLHFMmAW', 'active', 'relative', '/data/user/0/com.example.sukari_care/cache/50d05079-ce8a-46a4-b400-30eb0a556b9a/٢٠٢٥٠٥١٢_١٤٠٣٥٢.jpg', NULL, '2025-05-12 11:09:24', '2025-05-12 11:09:24'),
(150, 'مبزرز', 'رمرزى', NULL, 'مبزرز668178@gmail.coms', NULL, '$2y$12$vHBtgj2MMM70j9vD.qptc.bYBSTVI58cjoPhr0HYfZsrbSGdn9zEy', 'active', 'relative', '/data/user/0/com.example.sukari_care/cache/62bd2409-5140-4fa3-8949-fcc7a2446ee9/Screenshot_٢٠٢٥٠٥١٣-٠٦٢٦٢٩_Instagram.jpg', NULL, '2025-05-13 12:12:17', '2025-05-13 12:12:17'),
(151, 'محمد', '967123123123', NULL, 'ناصر353350@gmail.coms', NULL, '$2y$12$.rIA1cwUjwVJ/U2yWq1JGOx1JEdXOPpSrm.NV2gfpaeZ9FASla4Wa', 'active', 'relative', '/data/user/0/com.example.sukari_care/cache/639e0267-2baa-4780-8004-f37294ef4247/Screenshot_٢٠٢٥٠٥١٣-٠٦٢٦٢٩_Instagram.jpg', NULL, '2025-05-13 12:12:52', '2025-05-13 21:05:52'),
(152, 'Lolos', '967899999999', NULL, 'osamsa@gmail.com', NULL, '$2y$12$70ISx3KQh8UQxwkTqlgLye.x2emR0bSOnPIwqU36mBU.NyLRsuyOm', 'active', 'admin', 'uploads/user_profile/default.png', NULL, '2025-05-13 16:34:25', '2025-05-13 17:09:11'),
(153, 'عل حمود', '967777777786', NULL, 'llll@gmail.com', NULL, '$2y$12$l/WYchiiMLsUaMGYsv4WzuGsC.pVblOS8rTWkb9WigFBb/vjoNaT2', 'active', 'patient', NULL, NULL, '2025-05-13 20:17:32', '2025-05-13 20:17:32'),
(156, 'osama abduefef', '0772790221', NULL, 'ah@gm.comd', NULL, '$2y$12$cYm5nQ5gZKe.FEcm2XaiROmCG/NzN6e7i9BSvhzLy2OtH2hV51ZKW', 'active', 'patient', NULL, NULL, '2025-05-13 20:22:45', '2025-05-13 20:22:45'),
(158, 'mohammed', '776345384', '$2y$12$QPzwloQusz9n26bUuAvDYOcGd9H8buklHZriXeUJt9YZqV7EFUu9W', 'mohammed571424@gmail.coms', NULL, '$2y$12$BaT/LQ1kidRXopKBXAWQouqeYLBnTPXUKe/CVjnVY1/gjkFVSCOJ2', 'active', 'relative', NULL, NULL, '2025-05-13 23:12:02', '2025-05-13 23:13:05'),
(159, 'mohammed', '967776345384', '$2y$12$ojmSc2UAq.9H9EqVNpthFOT1eY7mGBavnWjwb4jUYB.YyWNHLJVb.', 'mohammed710394@gmail.coms', NULL, '$2y$12$BFPd3BtGfJ/iudo49NDCWu60Z1MM/QNyWgtnQg..4ydSI/GNuvagS', 'active', 'relative', NULL, NULL, '2025-05-13 23:28:52', '2025-05-13 23:38:25'),
(217, 'hamod', '96777279022111', NULL, 'hamod@gmail.com', NULL, '$2y$12$FANUYEu/GCITsAt.sIkyEOXGe4DkFuxGbsOKG.oWMBVKbO74iBlim', 'active', 'patient', NULL, NULL, '2025-05-17 18:23:28', '2025-05-17 18:23:28'),
(221, 'زبير', '967944664644', NULL, 'زبير@gmail.com', NULL, '$2y$12$.iaEnsz1MSnLVCs9B.eQrOF3jL0y4nzzN1W2t8GhlGlPJAdwVfVd2', 'active', 'patient', NULL, NULL, '2025-05-17 18:26:13', '2025-05-17 18:26:13'),
(222, 'بزبز', '967797946494', NULL, 'بزبز@gmail.com', NULL, '$2y$12$5fSSid29xosnpHXhCJ9W9eB4DbX9O6k/8oo9lLT2r5wlF2E3OOuly', 'active', 'patient', NULL, NULL, '2025-05-17 19:05:52', '2025-05-17 19:05:52'),
(223, 'ظبز', '96799', NULL, 'ظبز@gmail.com', NULL, '$2y$12$M.l0FiXQtg97Sfd5wlxwp.DKXqDpmV34DYC6GjvdRf18UptJd4.HG', 'active', 'patient', NULL, NULL, '2025-05-17 19:07:20', '2025-05-17 19:07:20');

-- --------------------------------------------------------

--
-- Table structure for table `user_profiles`
--

CREATE TABLE `user_profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` varchar(255) DEFAULT 'male',
  `date_of_birth` date NOT NULL,
  `contact_info` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_profiles`
--

INSERT INTO `user_profiles` (`id`, `user_id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `contact_info`, `image_url`, `created_at`, `updated_at`) VALUES
(1, 2, 'اسامه عبده', 'علي المشرقي', 'male', '2002-02-04', '772790221', '1744989715.jpg', '2025-03-11 16:34:22', '2025-04-18 12:21:55'),
(4, 5, 'شرف الدين', 'الشيخ', 'male', '2000-12-11', '7777777777', '1744829826.png', '2025-03-11 16:58:27', '2025-04-20 14:51:19'),
(5, 6, 'علي عبد الله', 'حطروم', 'male', '2000-02-02', '773787546', '1744743611.jpg', '2025-03-11 16:59:58', '2025-04-15 16:00:11'),
(34, 38, 'زكريا يحي', 'البارزي', 'male', '2000-02-02', '773787546', '1744745293.jpg', '2025-03-15 19:45:47', '2025-04-15 16:28:13'),
(36, 45, 'علي محمد', 'حطروم', 'male', '2025-11-11', '7878787878', '1744745723.png', '2025-04-08 19:47:54', '2025-04-15 16:35:23'),
(37, 48, 'عبده', 'المشرقي', 'male', '2025-04-15', '7777777777', NULL, '2025-04-13 11:06:33', '2025-04-13 11:06:33'),
(38, 49, 'عبده', 'المشرقي', 'male', '2025-04-15', '7777777777', '1744553347.jpg', '2025-04-13 11:09:10', '2025-04-13 11:09:10'),
(39, 59, 'nasser', 'nasser', 'male', '2000-01-01', NULL, '1744673246.jpg', '2025-04-14 20:27:26', '2025-04-14 20:27:26'),
(40, 60, 'ناصر', 'حطروم', 'male', '2025-04-13', '7727902211', '1744743813.jpg', '2025-04-15 15:44:48', '2025-04-15 16:03:33'),
(41, 61, 'ali', 'alialialiali', 'male', '2025-04-17', '7727902211', '1744762357.png', '2025-04-15 16:04:38', '2025-04-15 21:12:37'),
(42, 1, 'admin', 'admin', 'male', '2000-01-01', NULL, '1744745141.jpg', '2025-04-15 16:25:10', '2025-04-15 16:25:41'),
(43, 1, 'admin', 'admin', 'male', '2000-01-01', NULL, '1744745141.jpg', '2025-04-15 16:25:41', '2025-04-15 16:25:41'),
(44, 38, 'zakrya', 'zakrya', 'male', '2000-01-01', NULL, '1744745156.jpg', '2025-04-15 16:25:56', '2025-04-15 16:25:56'),
(45, 38, 'zakrya', 'zakrya', 'male', '2000-01-01', NULL, '1744745191.jpg', '2025-04-15 16:26:31', '2025-04-15 16:26:31'),
(46, 38, 'zakrya', 'zakrya', 'male', '2000-01-01', NULL, '1744745293.jpg', '2025-04-15 16:28:13', '2025-04-15 16:28:13'),
(49, 45, 'rel ahmed', 'rel ahmed', 'male', '2000-01-01', NULL, '1744745723.png', '2025-04-15 16:35:24', '2025-04-15 16:35:24'),
(59, 61, 'aliss', 'aliss', 'male', '2000-01-01', NULL, '1744762357.png', '2025-04-15 21:12:37', '2025-04-15 21:12:37'),
(73, 156, 'osama', 'abduefef', 'male', '2025-06-03', '63623876232', NULL, '2025-05-13 20:22:45', '2025-05-13 20:22:45'),
(90, 217, 'hamod', 'hamod', 'male', '2000-02-02', '96777279022111', NULL, '2025-05-17 18:23:28', '2025-05-17 18:23:28'),
(92, 221, 'زبير', 'زبير', 'ذكر', '2025-05-14', '967944664644', NULL, '2025-05-17 18:26:13', '2025-05-17 18:26:13'),
(93, 223, 'ظبز', 'ظبز', 'ذكر', '2025-05-13', '96799', NULL, '2025-05-17 19:07:20', '2025-05-17 19:07:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alarms`
--
ALTER TABLE `alarms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alarms_patient_id_foreign` (`patient_id`);

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
-- Indexes for table `symptom`
--
ALTER TABLE `symptom`
  ADD PRIMARY KEY (`id`),
  ADD KEY `symptom_patient_id_foreign` (`patient_id`);

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
-- AUTO_INCREMENT for table `alarms`
--
ALTER TABLE `alarms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `blog_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `glucose_readings`
--
ALTER TABLE `glucose_readings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `meal_systems`
--
ALTER TABLE `meal_systems`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `medical_history`
--
ALTER TABLE `medical_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `patient_goals`
--
ALTER TABLE `patient_goals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=389;

--
-- AUTO_INCREMENT for table `physical_examination`
--
ALTER TABLE `physical_examination`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `relatives`
--
ALTER TABLE `relatives`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `symptom`
--
ALTER TABLE `symptom`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=224;

--
-- AUTO_INCREMENT for table `user_profiles`
--
ALTER TABLE `user_profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alarms`
--
ALTER TABLE `alarms`
  ADD CONSTRAINT `alarms_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE;

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
-- Constraints for table `symptom`
--
ALTER TABLE `symptom`
  ADD CONSTRAINT `symptom_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD CONSTRAINT `user_profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
