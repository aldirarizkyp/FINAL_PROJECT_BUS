-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 05, 2022 at 02:24 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_finalprojectbus`
--

-- --------------------------------------------------------

--
-- Table structure for table `agency`
--

CREATE TABLE `agency` (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `owner_user_id` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `agency`
--

INSERT INTO `agency` (`id`, `code`, `details`, `name`, `owner_user_id`) VALUES
(1, 'RB', 'JKT-BDG', 'RedBus', 1),
(2, 'PAL', 'PALU', 'Agency', 1),
(3, 'PDG', 'PADANG-JAMBI', 'Jaw Bus', 2),
(4, 'JKT', 'JKT-LOM', 'Aldiransyah', 3),
(7, 'LOM', 'LOM-JKT', 'Aldira', 6),
(8, 'BBP', 'Jabodetabek', 'Black Bus Premium', 1),
(9, 'MB', 'Jawa Barat - Jawa Tengah', 'Maroon Bus', 5),
(10, 'LOM', 'LOM-JKT', 'Juhu', 7);

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE `bus` (
  `id` bigint(20) NOT NULL,
  `capacity` int(11) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `make` varchar(255) DEFAULT NULL,
  `agency_id` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bus`
--

INSERT INTO `bus` (`id`, `capacity`, `code`, `make`, `agency_id`) VALUES
(1, 20, 'BDL01', '20', 1),
(2, 15, 'BDL02', '15', 1),
(3, 30, 'JKT05', '30', 1),
(4, 20, 'MLG11', '20', 2),
(5, 20, 'SBY05', '20', 3),
(7, 30, 'BDL027', '30', 7),
(9, 20, 'B32', '20', 8);

-- --------------------------------------------------------

--
-- Table structure for table `flyway_schema_history`
--

CREATE TABLE `flyway_schema_history` (
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int(11) DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `flyway_schema_history`
--

INSERT INTO `flyway_schema_history` (`installed_rank`, `version`, `description`, `type`, `script`, `checksum`, `installed_by`, `installed_on`, `execution_time`, `success`) VALUES
(1, '1', '<< Flyway Baseline >>', 'BASELINE', '<< Flyway Baseline >>', NULL, 'root', '2022-06-28 16:29:40', 0, 1),
(2, '1.1', 'insert bus', 'SQL', 'V1.1__insert_bus.sql', -323711555, 'root', '2022-06-28 16:29:40', 6, 1),
(3, '1.2', 'insert role', 'SQL', 'V1.2__insert_role.sql', -555065487, 'root', '2022-06-28 16:29:40', 3, 1),
(4, '1.3', 'insert stop', 'SQL', 'V1.3__insert_stop.sql', -297623919, 'root', '2022-06-28 16:29:40', 3, 1),
(5, '1.4', 'insert trip', 'SQL', 'V1.4__insert_trip.sql', 0, 'root', '2022-06-28 16:29:40', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'ROLE_USER'),
(2, 'ROLE_ADMIN');

-- --------------------------------------------------------

--
-- Table structure for table `stop`
--

CREATE TABLE `stop` (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stop`
--

INSERT INTO `stop` (`id`, `code`, `detail`, `name`) VALUES
(1, '1-2', 'Teluk', 'Karang'),
(3, '1-3', 'Raja BasaI', 'Kedaton 1-3'),
(4, '1-2', 'Sukabumi', 'Sukarame 1-2'),
(5, '1-10', 'Tanjung Senang', 'Jati Agung 1-10'),
(6, 'MlG', 'Malang', 'Halte Malang'),
(8, 'BJG', 'Bojonegoro', 'Halte Bojonegoro'),
(9, 'JKT', 'Jakarta', 'Halte Blok M');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `id` bigint(20) NOT NULL,
  `cancellable` bit(1) DEFAULT NULL,
  `journey_date` varchar(255) DEFAULT NULL,
  `seat_number` int(11) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `trip_schedule_id` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`id`, `cancellable`, `journey_date`, `seat_number`, `user_id`, `trip_schedule_id`) VALUES
(1, b'1', '11-01-2022', 3, 1, 1),
(2, b'1', '19-12-2021', 9, 3, 3),
(3, b'1', '9-03-2022', 1, 4, 3),
(16, b'1', '15-06-2022', 25, 2, 3),
(17, b'1', '9-03-2022', 1, 4, 1),
(18, b'1', '12-05-2022', 5, 2, 2),
(21, b'1', '02-07-2022', 15, 1, 3),
(20, b'1', '20-12-2021', 10, 1, 1),
(22, b'1', 'string', 16, 1, 2),
(24, b'1', '02-07-2022', 15, 1, 1),
(25, b'1', '17-04-2022', 17, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `trip`
--

CREATE TABLE `trip` (
  `id` bigint(20) NOT NULL,
  `fare` int(11) NOT NULL,
  `journey_time` int(11) NOT NULL,
  `agency_id` bigint(20) DEFAULT NULL,
  `bus_id` bigint(20) DEFAULT NULL,
  `dest_stop_id` bigint(20) DEFAULT NULL,
  `source_stop_id` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trip`
--

INSERT INTO `trip` (`id`, `fare`, `journey_time`, `agency_id`, `bus_id`, `dest_stop_id`, `source_stop_id`) VALUES
(1, 500000, 4, 1, 2, 1, 1),
(2, 100000, 9, 1, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `trip_schedule`
--

CREATE TABLE `trip_schedule` (
  `id` bigint(20) NOT NULL,
  `available_seats` int(11) NOT NULL,
  `trip_date` varchar(255) DEFAULT NULL,
  `trip_id` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trip_schedule`
--

INSERT INTO `trip_schedule` (`id`, `available_seats`, `trip_date`, `trip_id`) VALUES
(1, 10, '05-01-2022', 1),
(2, 15, '23-10-2021', 2),
(3, 20, '20-10-2021', 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `first_name` varchar(120) DEFAULT NULL,
  `last_name` varchar(120) DEFAULT NULL,
  `mobile_number` varchar(120) DEFAULT NULL,
  `password` varchar(120) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `first_name`, `last_name`, `mobile_number`, `password`, `username`) VALUES
(1, 'aldira@gmail.com', 'Aldiransyah', 'Putra', '086765656565', '$2a$10$QzgscMOZN3CrIVnua545LOi1Cv.W1uwoMJhdGeU9H1WxHere9bmPi', 'aldirarizkyp'),
(2, 'messi@gmail.com', 'Lionel', 'Messi', '087766554433', '$2a$10$ATjMxBc/oK6s/Bf7bKxOreQTJR8BN6gcyV1NP0M7v54JiWRtNFmxe', 'lionelmessi'),
(3, 'admin@gmail.com', 'Aldiransyah Rizky', 'Putra', '087765646554', '$2a$10$74jsjP/LWWbrhZHMXDWp4OHZOq1DYKgGT57rKCYQO4f3v9Q/9nrzu', 'admin'),
(4, 'user@gmail.com', 'Kevin', 'DeBruyne', '0875677667567', '$2a$10$B7d8EDNY7Zzv.wuY7g8FW.Q09ySJlqrmfJ/ewJKFu9N6Ld27EniJ.', 'user'),
(6, 'aldira.putra@gmail.com', 'Aldira', 'Rizky', '087755665566', '$2a$10$WX2qvzfi4jESLDGjdImpdOX0ZYZsHQYHMEr609b4blQIw7YCx2cKS', 'aldira');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(1, 2),
(2, 1),
(3, 1),
(4, 1),
(6, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agency`
--
ALTER TABLE `agency`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK8y56hykf78k5u3wmutny52wcf` (`owner_user_id`);

--
-- Indexes for table `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK64nil2xxuhqde813s57dp1n9t` (`agency_id`);

--
-- Indexes for table `flyway_schema_history`
--
ALTER TABLE `flyway_schema_history`
  ADD PRIMARY KEY (`installed_rank`),
  ADD KEY `flyway_schema_history_s_idx` (`success`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stop`
--
ALTER TABLE `stop`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKdvt57mcco3ogsosi97odw563o` (`user_id`),
  ADD KEY `FKfhudhsxbslgtmbrbkd3uak4ha` (`trip_schedule_id`);

--
-- Indexes for table `trip`
--
ALTER TABLE `trip`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKab03gksoo5t3lo12ga3ixnykk` (`agency_id`),
  ADD KEY `FKptvi61dd1hao1yig3in0gvcjs` (`bus_id`),
  ADD KEY `FK1evbxrekvflflkfscj2i0fwv0` (`dest_stop_id`),
  ADD KEY `FK5ln8w8n974euslk976dh6x7k5` (`source_stop_id`);

--
-- Indexes for table `trip_schedule`
--
ALTER TABLE `trip_schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKaqjflucdvoypakmjxtb7n2mmm` (`trip_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKsb8bbouer5wak8vyiiy4pf2bx` (`username`),
  ADD UNIQUE KEY `UKob8kqyqqgmefl0aco34akdtpe` (`email`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `FKh8ciramu9cc9q3qcqiv4ue8a6` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agency`
--
ALTER TABLE `agency`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `bus`
--
ALTER TABLE `bus`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stop`
--
ALTER TABLE `stop`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `trip`
--
ALTER TABLE `trip`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `trip_schedule`
--
ALTER TABLE `trip_schedule`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
