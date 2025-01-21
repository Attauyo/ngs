-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql107.infinityfree.com
-- Generation Time: Jan 07, 2025 at 03:38 PM
-- Server version: 10.6.19-MariaDB
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `if0_38025241_cc`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `created_at`) VALUES
(1, 'admin', 'admin', '2024-08-27 07:16:27'),
(2, 'admin2', 'adminpassword2', '2024-08-27 07:16:27');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `date_sent` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `message`, `date_sent`) VALUES
(3, 1, 'Congratulations! Charity,\r\nYou have been choosing as one of the top investors,\r\nIt\'s a prevail to see your investment scheme active.', '2023-12-18 00:05:09'),
(4, 1, 'Greetings Charity! Note: That your monthly fee for the month of August which payment was made on the Tuesday 26/08/2024 has been accepted on Wednesday 27/08/2024.  But you still have outstanding tasks which you haven\'t been completed. This includes investing the same amount of $1000 every month for 2 months as you were selected among top class investors and your agreement which was sealed and I\'m sure you also aware of the benefits this hold. So make sure you complete this tasks to enjoy the benefits and proceed with getting your funds', '2024-08-28 20:19:43'),
(5, 1, 'Congratulations charity!  Your payment of $950 has been approved  !!!,\r\nPlease do well as to follow up your investments scheme so you will be eligible to withdraw all your profits. Thanks! we all care about your success.', '2024-08-27 00:11:27'),
(6, 1, 'Congratulations charity! Your payment of $1,000 has been approved !!!, Please do well as to follow up your investments scheme so you will be eligible to withdraw all your profits. Thanks! we all care about your success.', '2024-09-21 12:06:10'),
(7, 1, 'Congratulations charity! Your payment of $1,000 has been approved !!!, Please do well as to follow up your investments scheme so you will be eligible to withdraw all your profits. Thanks! we all care about your success.', '2024-10-21 17:20:14'),
(8, 1, 'Warmest greetings Charity!,\r\nWe are pleased to inform you that you have received a VIP voucher reward along with a bonus of $370,000 on your recent deposit. You are eligible to withdraw your current balance funds at your convenience.', '2024-10-22 10:46:07'),
(9, 1, 'Please note that to proceed with the withdrawal, a VAT fee of $30,000 will be applicable.\r\nThank you for your understanding.', '2024-10-22 11:29:17'),
(10, 1, 'Congratulations charity! Your payment of $7,100 has been approved !!!, Please do well as to follow up your investments scheme so you will be eligible to withdraw all your profits. Thanks! we all care about your success.', '2024-12-27 01:42:53'),
(11, 1, 'Congratulations charity! Your payment of $800 has been approved !!!, Please do well as to follow up your investments scheme so you will be eligible to withdraw all your profits. Thanks! we all care about your success.', '2024-12-28 00:23:15');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `key_name` varchar(255) NOT NULL,
  `value` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key_name`, `value`) VALUES
(1, 'min_withdrawal', '2000000.00');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` enum('deposit','withdrawal','investment') NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `status` enum('pending','completed','failed') DEFAULT 'completed',
  `account_name` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `type`, `amount`, `date`, `status`, `account_name`, `account_number`, `bank_name`) VALUES
(1, 1, 'investment', '1000.00', '2022-09-26 17:45:07', 'completed', NULL, NULL, NULL),
(2, 1, 'investment', '1000.00', '2022-08-21 17:45:32', 'completed', NULL, NULL, NULL),
(3, 1, 'investment', '1000.00', '2023-04-18 15:11:10', 'completed', NULL, NULL, NULL),
(4, 1, 'investment', '1000.00', '2023-05-17 12:11:07', 'completed', NULL, NULL, NULL),
(5, 1, 'investment', '1000.00', '2023-06-18 16:15:15', 'completed', NULL, NULL, NULL),
(6, 1, 'investment', '1000.00', '2023-07-28 16:06:05', 'completed', NULL, NULL, NULL),
(7, 1, 'investment', '1000.00', '2023-08-20 18:06:17', 'completed', NULL, NULL, NULL),
(8, 1, 'investment', '1000.00', '2023-09-21 19:06:17', 'completed', NULL, NULL, NULL),
(9, 1, 'investment', '1000.00', '2023-10-22 16:06:17', 'completed', NULL, NULL, NULL),
(10, 1, 'investment', '1000.00', '2023-11-25 01:06:17', 'completed', NULL, NULL, NULL),
(11, 1, 'investment', '1000.00', '2023-12-28 16:06:17', 'completed', NULL, NULL, NULL),
(12, 1, 'investment', '1000.00', '2024-01-18 12:06:17', 'completed', NULL, NULL, NULL),
(13, 1, 'investment', '1000.00', '2024-02-21 10:06:17', 'completed', NULL, NULL, NULL),
(14, 1, 'investment', '1000.00', '2024-03-30 09:06:17', 'completed', NULL, NULL, NULL),
(15, 1, 'investment', '1000.00', '2024-04-20 11:01:17', 'completed', NULL, NULL, NULL),
(16, 1, 'investment', '1000.00', '2024-05-27 13:06:17', 'completed', NULL, NULL, NULL),
(17, 1, 'investment', '1000.00', '2022-10-18 15:06:17', 'completed', NULL, NULL, NULL),
(18, 1, 'investment', '1000.00', '2024-06-27 16:06:17', 'completed', NULL, NULL, NULL),
(19, 1, 'investment', '1000.00', '2022-12-26 10:06:17', 'completed', NULL, NULL, NULL),
(20, 1, 'investment', '1000.00', '2023-01-22 17:06:17', 'completed', NULL, NULL, NULL),
(21, 1, 'deposit', '950.00', '2024-08-27 22:20:37', 'completed', NULL, NULL, NULL),
(22, 1, 'investment', '1000.00', '0000-00-00 00:00:00', 'completed', NULL, NULL, NULL),
(23, 1, 'investment', '1000.00', '2024-02-28 22:42:47', 'completed', NULL, NULL, NULL),
(24, 1, 'investment', '1000.00', '2024-03-28 22:43:13', 'completed', NULL, NULL, NULL),
(25, 1, 'investment', '1000.00', '2024-07-28 22:43:45', 'completed', NULL, NULL, NULL),
(26, 1, 'deposit', '1000.00', '2024-09-21 12:06:10', 'completed', NULL, NULL, NULL),
(27, 1, 'deposit', '1000.00', '2024-10-21 08:51:27', 'completed', NULL, NULL, NULL),
(28, 1, 'investment', '370000.00', '2024-10-22 10:46:07', 'completed', NULL, NULL, NULL),
(29, 1, 'deposit', '7100.00', '2024-12-27 01:42:21', 'completed', NULL, NULL, NULL),
(30, 1, 'deposit', '800.00', '2024-12-28 00:23:04', 'completed', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `current_balance` decimal(15,2) DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `current_balance`, `created_at`) VALUES
(1, 'charity ', 'charity ', '1004002.00', '2024-10-22 05:16:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key_name` (`key_name`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
