-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 02, 2022 at 02:35 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hash_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `image`, `email`, `phone`, `address`, `is_active`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'مدير النظام', '16541729566298ad1c58d81.png', 'Admin@admin.com', '966505505050', '15 d', 1, NULL, '$2y$10$h6Jf2FodDlN3J5C01OyOUOzM/jAMsG7aFIMKPMEuyDh8mzd6XMeLm', NULL, NULL, '2022-06-02 13:29:16');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inboxes`
--

CREATE TABLE `inboxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_id` bigint(20) UNSIGNED DEFAULT NULL,
  `receiver_id` bigint(20) UNSIGNED DEFAULT NULL,
  `inbox_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` enum('notification','mail') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'mail',
  `is_read` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inboxes`
--

INSERT INTO `inboxes` (`id`, `message`, `sender_id`, `receiver_id`, `inbox_id`, `type`, `is_read`, `created_at`, `updated_at`) VALUES
(1, 'eyJpdiI6InJ1VWVyb2QxRmsyM1NEZEVmYnMxVlE9PSIsInZhbHVlIjoic1l2MFRLNlZFbUdOYUVxT1AvU0VuQ2J0L3ZsT2c3NjdheGNoZS93Q0dXST0iLCJtYWMiOiJmYTlkYTI2MGQyYjE0YzI2MWMxZmVkZDczMWMwYThmM2ZmZGRjNzU1Yjk5YjMwYjgwZGQxY2VjOTdkZTM4MzhjIiwidGFnIjoiIn0=', 1, 2, NULL, 'mail', 1, '2022-06-02 11:16:10', NULL),
(2, 'eyJpdiI6ImFSQUlCcEsvUGNwSUdQRmhjeVhpMHc9PSIsInZhbHVlIjoiaFhWNk1yVW5qZFlEWVNEOG1lYjg5UHBGTWp6eFdoOEpsdnpoK3pXdXhKST0iLCJtYWMiOiJlM2ZlMzMxOWI5MWQ4YTg1ODE3YzYwZWMyNWU3ZTMwZmNjMjgxM2FjMDIyODYxNzYwYmM0NmI4MTExZGVjNDkyIiwidGFnIjoiIn0=', 1, 1, 1, 'mail', 0, NULL, NULL),
(3, 'eyJpdiI6IkVyUTR4cGR3SVJwSGJ3aHZJU3UwK1E9PSIsInZhbHVlIjoiYjk0b2pZanV0UXpiOUN1YzdGWndKSHVEOWt5VnNUWTlneE40b01raDRNST0iLCJtYWMiOiJiZjM3OTJmZjY0N2NjNzA3MTI3YjdmNWQwOTA1Y2MxNzE5ZDE5MDU3ZTVjNzNkNDE0YjE4MzNmYjljNDA1OWM3IiwidGFnIjoiIn0=', 2, 1, NULL, 'mail', 1, '2022-06-02 11:54:33', NULL),
(4, 'eyJpdiI6Ino3U0lNZUgyOTdPajhFb0g1Nm4vUEE9PSIsInZhbHVlIjoiTkg1bUQ1WExKb3V5M1NtU1RCSWVPbkQ1cVd3VzhYVk5kTmFpM04rd2tIZz0iLCJtYWMiOiI5OThhMTJiMzNlMWMzNDg0NGVmNThhMzEwMGI2MjIzNzE3YTg0MTJjZmRlYjMzZDk5ZjVhZmYxZGE2NWUwYmQxIiwidGFnIjoiIn0=', 2, 1, NULL, 'mail', 1, '2022-06-02 11:54:45', NULL),
(5, 'eyJpdiI6IkE2WjRQUjIzL3k2bC91cEpsQ3ppZ2c9PSIsInZhbHVlIjoiZ2dBU0o5M1RJbXZxZVRIMVNkZFBTcDlEQUxmNE5tOGx2OEo0Z2VvaDZpY2RXNWpPeG9NRnp5MVkzdHJyRE43dSIsIm1hYyI6IjU5ZTIzMDNiZDFhOWE3NmZlMmExZmEyNzUzZjcxZDU4NGRlYjhhZTQ3N2Y4OWU1YThhMDYyNTZmNTg2NWE3NzMiLCJ0YWciOiIifQ==', 2, 1, NULL, 'mail', 1, '2022-06-02 11:56:31', NULL),
(6, 'eyJpdiI6IkR1YU5jaE1ITEx6Z29CRkN2RWw5WVE9PSIsInZhbHVlIjoiSCsvbHh3Z0ZNa0gzQXM5WEYyVGNtemFXMEJtUVlqZmU3VVpqUFUramc2OD0iLCJtYWMiOiI1ODcyYWFhMDQ5MTIyY2E5Y2ZkZjA5MGU0M2Q4YTQxNmIwOGU3Y2NkYTI5MDhjZDkwMzdiZjYxNDM2OTNmZGZhIiwidGFnIjoiIn0=', 1, 2, NULL, 'mail', 1, '2022-06-02 13:10:43', NULL),
(7, 'eyJpdiI6IjlBYWVNY2NocXdjY3oyOTEwQTZOQ0E9PSIsInZhbHVlIjoiQWY1ckVZV1NxR2xqQUVZWXZWTkc1Sm0wMWJlWisvUTRoKzNSOStaOWIyZz0iLCJtYWMiOiI4YTlkMDM0YjZhYzZkZGJkMTBlNDkxNGViMzkwYWVjY2IxZjY2YWQzN2Y0ZjYzMGI0NjRlNjg4NzI4MmY4ZmE2IiwidGFnIjoiIn0=', 1, 1, 6, 'mail', 0, NULL, NULL),
(8, 'eyJpdiI6ImpiNGtZRzR6d1dLVjRDUGgrMkN4WHc9PSIsInZhbHVlIjoiTWNtcjhpcmxqclA4eHJJWUQ4UzJJdmZhNGIwdHlqNXRTLzJsNGVzYS8zalNSRWpvMm0vWW1hRjl4SjhWaE9aQyIsIm1hYyI6IjQ1N2E2MzJiMzBlMWNhZjM0Njk4OTBmNDdiMjE2NWEwNzcyNjA0OWMzNGE3MmVkNTA3MzE1NTdiMDczNWYyNDIiLCJ0YWciOiIifQ==', 1, 1, 6, 'mail', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `inbox_files`
--

CREATE TABLE `inbox_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inbox_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_06_01_105111_create_admins_table', 1),
(6, '2022_06_01_105141_create_inboxes_table', 1),
(7, '2022_06_01_106111_create_inbox_files_table', 1),
(8, '2022_06_02_114822_create_settings_table', 1),
(9, '2022_06_02_143354_create_synonyms_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `footer_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_login` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `footer_description`, `logo`, `background_login`, `created_at`, `updated_at`) VALUES
(1, 'نظام التشفير النصي', '1', '16541728416298aca98d5a9.png', '16541728416298aca98da17.png', NULL, '2022-06-02 13:27:21');

-- --------------------------------------------------------

--
-- Table structure for table `synonyms`
--

CREATE TABLE `synonyms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `word` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `synonym` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `synonyms`
--

INSERT INTO `synonyms` (`id`, `word`, `synonym`, `created_at`, `updated_at`) VALUES
(2, 'صباح', 'بليل', '2022-06-02 12:52:55', '2022-06-02 13:17:50'),
(4, 'الرسالة', 'المعاد', '2022-06-02 13:21:53', '2022-06-02 13:21:53');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `is_verified` tinyint(4) NOT NULL DEFAULT 0,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `image`, `email`, `phone`, `address`, `is_active`, `is_verified`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'user 2', '16541716036298a7d312eb1.PNG', 'a@a.com', '966505509090', '15Th disrict hh', 1, 0, NULL, '$2y$10$h6Jf2FodDlN3J5C01OyOUOzM/jAMsG7aFIMKPMEuyDh8mzd6XMeLm', NULL, '2022-06-02 11:14:10', '2022-06-02 13:06:43'),
(2, 'test update', NULL, 'mostafaelebzary@gmail.com', '966515975365', '15Th disrict', 1, 0, NULL, '$2y$10$h6Jf2FodDlN3J5C01OyOUOzM/jAMsG7aFIMKPMEuyDh8mzd6XMeLm', NULL, '2022-06-02 11:14:45', '2022-06-02 12:50:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`),
  ADD UNIQUE KEY `admins_phone_unique` (`phone`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `inboxes`
--
ALTER TABLE `inboxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inboxes_sender_id_foreign` (`sender_id`),
  ADD KEY `inboxes_receiver_id_foreign` (`receiver_id`),
  ADD KEY `inboxes_inbox_id_foreign` (`inbox_id`);

--
-- Indexes for table `inbox_files`
--
ALTER TABLE `inbox_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inbox_files_inbox_id_foreign` (`inbox_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `synonyms`
--
ALTER TABLE `synonyms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inboxes`
--
ALTER TABLE `inboxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `inbox_files`
--
ALTER TABLE `inbox_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `synonyms`
--
ALTER TABLE `synonyms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `inboxes`
--
ALTER TABLE `inboxes`
  ADD CONSTRAINT `inboxes_inbox_id_foreign` FOREIGN KEY (`inbox_id`) REFERENCES `inboxes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inboxes_receiver_id_foreign` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `inboxes_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `inbox_files`
--
ALTER TABLE `inbox_files`
  ADD CONSTRAINT `inbox_files_inbox_id_foreign` FOREIGN KEY (`inbox_id`) REFERENCES `inboxes` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
