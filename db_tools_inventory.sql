-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2024 at 08:03 PM
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
-- Database: `db_tools_inventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `id_category` int(11) NOT NULL,
  `category` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`id_category`, `category`) VALUES
(1, 'TOOL'),
(2, 'MATERIAL');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_permission`
--

CREATE TABLE `tbl_permission` (
  `id_permission` int(11) NOT NULL,
  `permission` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `tbl_permission`
--

INSERT INTO `tbl_permission` (`id_permission`, `permission`) VALUES
(1, 'ADMIN'),
(2, 'USER');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_person`
--

CREATE TABLE `tbl_person` (
  `id_person` int(11) NOT NULL,
  `person` varchar(100) NOT NULL,
  `id_permission` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `tbl_person`
--

INSERT INTO `tbl_person` (`id_person`, `person`, `id_permission`) VALUES
(1, 'Enrique', 2),
(3, 'Carlos', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tool`
--

CREATE TABLE `tbl_tool` (
  `id_tool` int(11) NOT NULL,
  `tool` varchar(150) NOT NULL,
  `id_category` int(11) NOT NULL,
  `in_inventory` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `tbl_tool`
--

INSERT INTO `tbl_tool` (`id_tool`, `tool`, `id_category`, `in_inventory`) VALUES
(1, 'TALADRO', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tool_rotation`
--

CREATE TABLE `tbl_tool_rotation` (
  `id_tool_rotation` int(11) NOT NULL,
  `id_person` int(11) NOT NULL,
  `id_tool` int(11) NOT NULL,
  `departure_time` datetime NOT NULL DEFAULT current_timestamp(),
  `entry_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `tbl_tool_rotation`
--

INSERT INTO `tbl_tool_rotation` (`id_tool_rotation`, `id_person`, `id_tool`, `departure_time`, `entry_time`) VALUES
(1, 3, 1, '2024-05-15 11:46:40', '2024-05-15 12:48:17'),
(2, 3, 1, '2024-05-15 11:49:49', '2024-05-15 12:47:41'),
(3, 3, 1, '2024-05-15 11:50:01', '2024-05-15 19:05:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`id_category`);

--
-- Indexes for table `tbl_permission`
--
ALTER TABLE `tbl_permission`
  ADD PRIMARY KEY (`id_permission`);

--
-- Indexes for table `tbl_person`
--
ALTER TABLE `tbl_person`
  ADD PRIMARY KEY (`id_person`) USING BTREE,
  ADD KEY `id_permission` (`id_permission`);

--
-- Indexes for table `tbl_tool`
--
ALTER TABLE `tbl_tool`
  ADD PRIMARY KEY (`id_tool`),
  ADD KEY `id_category` (`id_category`);

--
-- Indexes for table `tbl_tool_rotation`
--
ALTER TABLE `tbl_tool_rotation`
  ADD PRIMARY KEY (`id_tool_rotation`),
  ADD KEY `id_person` (`id_person`),
  ADD KEY `id_tool` (`id_tool`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_permission`
--
ALTER TABLE `tbl_permission`
  MODIFY `id_permission` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_person`
--
ALTER TABLE `tbl_person`
  MODIFY `id_person` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_tool`
--
ALTER TABLE `tbl_tool`
  MODIFY `id_tool` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_tool_rotation`
--
ALTER TABLE `tbl_tool_rotation`
  MODIFY `id_tool_rotation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_person`
--
ALTER TABLE `tbl_person`
  ADD CONSTRAINT `tbl_person_ibfk_1` FOREIGN KEY (`id_permission`) REFERENCES `tbl_permission` (`id_permission`);

--
-- Constraints for table `tbl_tool`
--
ALTER TABLE `tbl_tool`
  ADD CONSTRAINT `tbl_tool_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `tbl_category` (`id_category`);

--
-- Constraints for table `tbl_tool_rotation`
--
ALTER TABLE `tbl_tool_rotation`
  ADD CONSTRAINT `tbl_tool_rotation_ibfk_1` FOREIGN KEY (`id_person`) REFERENCES `tbl_person` (`id_person`),
  ADD CONSTRAINT `tbl_tool_rotation_ibfk_2` FOREIGN KEY (`id_tool`) REFERENCES `tbl_tool` (`id_tool`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
