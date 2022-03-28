-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 27, 2022 at 08:04 PM
-- Server version: 5.6.51-cll-lve
-- PHP Version: 7.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `easyappointments`
--

-- --------------------------------------------------------

--
-- Table structure for table `ea_appointments`
--

CREATE TABLE `ea_appointments` (
  `id` int(11) NOT NULL,
  `book_datetime` datetime DEFAULT NULL,
  `start_datetime` datetime DEFAULT NULL,
  `end_datetime` datetime DEFAULT NULL,
  `location` text,
  `notes` text,
  `hash` text,
  `is_unavailable` tinyint(4) NOT NULL DEFAULT '0',
  `id_users_provider` int(11) DEFAULT NULL,
  `id_users_customer` int(11) DEFAULT NULL,
  `id_services` int(11) DEFAULT NULL,
  `id_google_calendar` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ea_appointments`
--

INSERT INTO `ea_appointments` (`id`, `book_datetime`, `start_datetime`, `end_datetime`, `location`, `notes`, `hash`, `is_unavailable`, `id_users_provider`, `id_users_customer`, `id_services`, `id_google_calendar`) VALUES
(2, '2022-03-26 18:11:47', '2022-03-30 10:30:00', '2022-03-30 12:00:00', NULL, '', 'VThSPNvmcgoF', 0, 5, 4, 1, NULL),
(4, '2022-03-26 18:32:02', '2022-03-28 09:00:00', '2022-03-28 10:30:00', NULL, '', 'LR80bqVPixIX', 0, 5, 4, 1, NULL),
(5, '2022-03-26 18:32:37', '2022-03-28 10:30:00', '2022-03-28 12:00:00', NULL, '', 'Tx3w7mF6tSyv', 0, 5, 4, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ea_consents`
--

CREATE TABLE `ea_consents` (
  `id` int(11) NOT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `modified` timestamp NULL DEFAULT NULL,
  `first_name` varchar(256) DEFAULT NULL,
  `last_name` varchar(256) DEFAULT NULL,
  `email` varchar(512) DEFAULT NULL,
  `ip` varchar(256) DEFAULT NULL,
  `type` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ea_migrations`
--

CREATE TABLE `ea_migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ea_migrations`
--

INSERT INTO `ea_migrations` (`version`) VALUES
(21);

-- --------------------------------------------------------

--
-- Table structure for table `ea_roles`
--

CREATE TABLE `ea_roles` (
  `id` int(11) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `slug` varchar(256) DEFAULT NULL,
  `is_admin` tinyint(4) DEFAULT NULL,
  `appointments` int(11) DEFAULT NULL,
  `customers` int(11) DEFAULT NULL,
  `services` int(11) DEFAULT NULL,
  `users` int(11) DEFAULT NULL,
  `system_settings` int(11) DEFAULT NULL,
  `user_settings` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ea_roles`
--

INSERT INTO `ea_roles` (`id`, `name`, `slug`, `is_admin`, `appointments`, `customers`, `services`, `users`, `system_settings`, `user_settings`) VALUES
(1, 'Administrator', 'admin', 1, 15, 15, 15, 15, 15, 15),
(2, 'Provider', 'provider', 0, 15, 15, 0, 0, 0, 15),
(3, 'Customer', 'customer', 0, 0, 0, 0, 0, 0, 0),
(4, 'Secretary', 'secretary', 0, 15, 15, 0, 0, 0, 15);

-- --------------------------------------------------------

--
-- Table structure for table `ea_secretaries_providers`
--

CREATE TABLE `ea_secretaries_providers` (
  `id_users_secretary` int(11) NOT NULL DEFAULT '0',
  `id_users_provider` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ea_services`
--

CREATE TABLE `ea_services` (
  `id` int(11) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `currency` varchar(32) DEFAULT NULL,
  `description` text,
  `location` text,
  `availabilities_type` varchar(32) DEFAULT 'flexible',
  `attendants_number` int(11) DEFAULT '1',
  `id_service_categories` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ea_services`
--

INSERT INTO `ea_services` (`id`, `name`, `duration`, `price`, `currency`, `description`, `location`, `availabilities_type`, `attendants_number`, `id_service_categories`) VALUES
(1, 'ChargePoint Walkthrough', 90, 0.00, '', '', '', 'fixed', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ea_services_providers`
--

CREATE TABLE `ea_services_providers` (
  `id_users` int(11) NOT NULL DEFAULT '0',
  `id_services` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ea_services_providers`
--

INSERT INTO `ea_services_providers` (`id_users`, `id_services`) VALUES
(5, 1),
(7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ea_service_categories`
--

CREATE TABLE `ea_service_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ea_settings`
--

CREATE TABLE `ea_settings` (
  `id` int(11) NOT NULL,
  `name` varchar(512) DEFAULT NULL,
  `value` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ea_settings`
--

INSERT INTO `ea_settings` (`id`, `name`, `value`) VALUES
(1, 'company_working_plan', '{\"sunday\":null,\"monday\":{\"start\":\"09:00\",\"end\":\"19:00\",\"breaks\":[]},\"tuesday\":{\"start\":\"09:00\",\"end\":\"19:00\",\"breaks\":[]},\"wednesday\":{\"start\":\"09:00\",\"end\":\"19:00\",\"breaks\":[]},\"thursday\":{\"start\":\"09:00\",\"end\":\"19:00\",\"breaks\":[]},\"friday\":{\"start\":\"09:00\",\"end\":\"19:00\",\"breaks\":[]},\"saturday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[]}}'),
(2, 'book_advance_timeout', '30'),
(3, 'google_analytics_code', ''),
(4, 'customer_notifications', '1'),
(5, 'date_format', 'MDY'),
(6, 'require_captcha', '0'),
(7, 'time_format', 'regular'),
(8, 'display_cookie_notice', '0'),
(9, 'cookie_notice_content', 'Cookie notice content.'),
(10, 'display_terms_and_conditions', '0'),
(11, 'terms_and_conditions_content', 'Terms and conditions content.'),
(12, 'display_privacy_policy', '0'),
(13, 'privacy_policy_content', 'Privacy policy content.'),
(14, 'first_weekday', 'sunday'),
(15, 'require_phone_number', '1'),
(16, 'api_token', ''),
(17, 'display_any_provider', '1'),
(18, 'company_name', 'Skybridge Renewables'),
(19, 'company_email', 'dave@davehansen.com'),
(20, 'company_link', 'https://skybridgerenewables.com');

-- --------------------------------------------------------

--
-- Table structure for table `ea_users`
--

CREATE TABLE `ea_users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(256) DEFAULT NULL,
  `last_name` varchar(512) DEFAULT NULL,
  `email` varchar(512) DEFAULT NULL,
  `mobile_number` varchar(128) DEFAULT NULL,
  `phone_number` varchar(128) DEFAULT NULL,
  `address` varchar(256) DEFAULT NULL,
  `city` varchar(256) DEFAULT NULL,
  `state` varchar(128) DEFAULT NULL,
  `zip_code` varchar(64) DEFAULT NULL,
  `notes` text,
  `timezone` varchar(256) DEFAULT 'UTC',
  `language` varchar(256) DEFAULT 'english',
  `id_roles` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ea_users`
--

INSERT INTO `ea_users` (`id`, `first_name`, `last_name`, `email`, `mobile_number`, `phone_number`, `address`, `city`, `state`, `zip_code`, `notes`, `timezone`, `language`, `id_roles`) VALUES
(1, 'Jason', 'Atkins', 'dave@davehansen.com', '', '412-403-4110', '', '', '', '', '', 'America/Los_Angeles', 'english', 1),
(4, 'Testy', 'McTester', 'kosong0926@gmail.com', NULL, '12345', 'Los Angles', 'CA', NULL, '90210', '', 'UTC', 'english', 3),
(5, 'Test', 'Employee1', 'info@dataminerapps.com', '', '9496107485', '', '', '', '', '', 'America/Los_Angeles', 'english', 2),
(6, 'Dave', 'Hansen', 'usamtg@hotmail.com', '412-403-4110', '412-403-4110', '', '', '', '', '', 'America/Los_Angeles', 'english', 1),
(7, 'Test', 'Employee2', 'admin@davehansen.com', '4124034110', '4124034110', '', '', '', '', '', 'America/Los_Angeles', 'english', 2);

-- --------------------------------------------------------

--
-- Table structure for table `ea_user_settings`
--

CREATE TABLE `ea_user_settings` (
  `id_users` int(11) NOT NULL DEFAULT '0',
  `username` varchar(256) DEFAULT NULL,
  `password` varchar(512) DEFAULT NULL,
  `salt` varchar(512) DEFAULT NULL,
  `working_plan` text,
  `working_plan_exceptions` text,
  `notifications` tinyint(4) DEFAULT NULL,
  `google_sync` tinyint(4) DEFAULT NULL,
  `google_token` text,
  `google_calendar` varchar(128) DEFAULT NULL,
  `sync_past_days` int(11) DEFAULT '30',
  `sync_future_days` int(11) DEFAULT '90',
  `calendar_view` varchar(32) DEFAULT 'default'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ea_user_settings`
--

INSERT INTO `ea_user_settings` (`id_users`, `username`, `password`, `salt`, `working_plan`, `working_plan_exceptions`, `notifications`, `google_sync`, `google_token`, `google_calendar`, `sync_past_days`, `sync_future_days`, `calendar_view`) VALUES
(1, 'jatkins', 'f02b9a5a549840684b48ecac6cd270c9d320372821208d0542573c72532de90c', '0b1cea254b98a8b21fac1b8183dba393212f45ecdaf7003ab8d5fec8263fe33f', NULL, NULL, 1, NULL, NULL, NULL, 30, 90, 'default'),
(5, 'test1', '3216756bc2d8a9c400f99cf6320f2e71841869fb2cfb0024143394e1bdf3053f', '9f419058a34f96b99ebc4835bafcc8fa64f4a7480e365cef30ff36b30d424724', '{\"sunday\":null,\"monday\":{\"start\":\"09:00\",\"end\":\"19:00\",\"breaks\":[]},\"tuesday\":{\"start\":\"09:00\",\"end\":\"19:00\",\"breaks\":[]},\"wednesday\":{\"start\":\"09:00\",\"end\":\"19:00\",\"breaks\":[]},\"thursday\":{\"start\":\"09:00\",\"end\":\"19:00\",\"breaks\":[]},\"friday\":{\"start\":\"09:00\",\"end\":\"19:00\",\"breaks\":[]},\"saturday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[]}}', '[]', 0, NULL, NULL, NULL, 30, 90, 'default'),
(6, 'davehansen', 'adb109b434afe57baefb1ad4a8872e6bba41acae14675debda8d759f880b7d2a', '4450b7238d60f30871343394c1b868124d9a6c724ca43817eb6ff540069284d1', NULL, NULL, 0, NULL, NULL, NULL, 30, 90, 'default'),
(7, 'testuser2', 'f4ebaf03b7a0fcecfeb2d864d651f8f1b31b4873707a5db9ba52a68dc0e4bc73', '4234774238ee8264216d51be87718f772dbae6177a19ab42f67153be5abe8ccc', '{\"sunday\":null,\"monday\":{\"start\":\"09:00\",\"end\":\"19:00\",\"breaks\":[]},\"tuesday\":{\"start\":\"09:00\",\"end\":\"19:00\",\"breaks\":[]},\"wednesday\":{\"start\":\"09:00\",\"end\":\"19:00\",\"breaks\":[]},\"thursday\":{\"start\":\"09:00\",\"end\":\"19:00\",\"breaks\":[]},\"friday\":{\"start\":\"09:00\",\"end\":\"19:00\",\"breaks\":[]},\"saturday\":{\"start\":\"09:00\",\"end\":\"18:00\",\"breaks\":[]}}', '[]', 1, NULL, NULL, NULL, 30, 90, 'default');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ea_appointments`
--
ALTER TABLE `ea_appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_users_provider` (`id_users_provider`),
  ADD KEY `id_users_customer` (`id_users_customer`),
  ADD KEY `id_services` (`id_services`);

--
-- Indexes for table `ea_consents`
--
ALTER TABLE `ea_consents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ea_roles`
--
ALTER TABLE `ea_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ea_secretaries_providers`
--
ALTER TABLE `ea_secretaries_providers`
  ADD PRIMARY KEY (`id_users_secretary`,`id_users_provider`),
  ADD KEY `secretaries_users_provider` (`id_users_provider`);

--
-- Indexes for table `ea_services`
--
ALTER TABLE `ea_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_service_categories` (`id_service_categories`);

--
-- Indexes for table `ea_services_providers`
--
ALTER TABLE `ea_services_providers`
  ADD PRIMARY KEY (`id_users`,`id_services`),
  ADD KEY `services_providers_services` (`id_services`);

--
-- Indexes for table `ea_service_categories`
--
ALTER TABLE `ea_service_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ea_settings`
--
ALTER TABLE `ea_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ea_users`
--
ALTER TABLE `ea_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_roles` (`id_roles`);

--
-- Indexes for table `ea_user_settings`
--
ALTER TABLE `ea_user_settings`
  ADD PRIMARY KEY (`id_users`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ea_appointments`
--
ALTER TABLE `ea_appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ea_consents`
--
ALTER TABLE `ea_consents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ea_roles`
--
ALTER TABLE `ea_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ea_services`
--
ALTER TABLE `ea_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ea_service_categories`
--
ALTER TABLE `ea_service_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ea_settings`
--
ALTER TABLE `ea_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `ea_users`
--
ALTER TABLE `ea_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ea_appointments`
--
ALTER TABLE `ea_appointments`
  ADD CONSTRAINT `appointments_services` FOREIGN KEY (`id_services`) REFERENCES `ea_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointments_users_customer` FOREIGN KEY (`id_users_customer`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointments_users_provider` FOREIGN KEY (`id_users_provider`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ea_secretaries_providers`
--
ALTER TABLE `ea_secretaries_providers`
  ADD CONSTRAINT `secretaries_users_provider` FOREIGN KEY (`id_users_provider`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `secretaries_users_secretary` FOREIGN KEY (`id_users_secretary`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ea_services`
--
ALTER TABLE `ea_services`
  ADD CONSTRAINT `services_service_categories` FOREIGN KEY (`id_service_categories`) REFERENCES `ea_service_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `ea_services_providers`
--
ALTER TABLE `ea_services_providers`
  ADD CONSTRAINT `services_providers_services` FOREIGN KEY (`id_services`) REFERENCES `ea_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `services_providers_users_provider` FOREIGN KEY (`id_users`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ea_users`
--
ALTER TABLE `ea_users`
  ADD CONSTRAINT `users_roles` FOREIGN KEY (`id_roles`) REFERENCES `ea_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ea_user_settings`
--
ALTER TABLE `ea_user_settings`
  ADD CONSTRAINT `user_settings_users` FOREIGN KEY (`id_users`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
