-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 03, 2024 at 01:25 PM
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
-- Database: `red-zone`
--

-- --------------------------------------------------------

--
-- Table structure for table `atm`
--

CREATE TABLE `atm` (
  `ID` int(11) NOT NULL,
  `X` float NOT NULL,
  `Y` float NOT NULL,
  `Z` float NOT NULL,
  `RY` float NOT NULL,
  `RX` float NOT NULL,
  `RZ` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `atm`
--

INSERT INTO `atm` (`ID`, `X`, `Y`, `Z`, `RY`, `RX`, `RZ`) VALUES
(1, 1286.62, -1326.57, 13.2517, -2.7, -3.7, -101.6),
(2, 1329.38, -988.039, 33.5473, -0.4, -0.5, 86.5);

-- --------------------------------------------------------

--
-- Table structure for table `bans`
--

CREATE TABLE `bans` (
  `ID` int(11) NOT NULL,
  `Userid` int(11) NOT NULL,
  `Name` varchar(24) NOT NULL DEFAULT 'None',
  `Permanent` int(11) NOT NULL,
  `Reason` varchar(40) NOT NULL DEFAULT 'None',
  `ByBanned` varchar(24) NOT NULL,
  `Time` int(11) NOT NULL,
  `IP` varchar(16) NOT NULL DEFAULT 'none',
  `date` varchar(30) NOT NULL DEFAULT 'none',
  `days` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bussines`
--

CREATE TABLE `bussines` (
  `ID` int(11) NOT NULL,
  `Userid` int(11) NOT NULL,
  `Owned` int(11) NOT NULL,
  `Fee` int(11) NOT NULL,
  `Static` int(11) NOT NULL,
  `Value` int(11) NOT NULL,
  `OldValue` int(11) NOT NULL,
  `Status` int(11) NOT NULL,
  `Balance` int(11) NOT NULL,
  `EnterPosX` float NOT NULL,
  `EnterPosY` float NOT NULL,
  `EnterPosZ` float NOT NULL,
  `ExitPosX` float NOT NULL,
  `ExitPosY` float NOT NULL,
  `ExitPosZ` float NOT NULL,
  `Interior` int(11) NOT NULL,
  `VirtualWorld` int(11) NOT NULL,
  `Type` int(11) NOT NULL,
  `Level` int(11) NOT NULL,
  `Owner` varchar(24) NOT NULL DEFAULT 'The State',
  `Description` varchar(32) NOT NULL DEFAULT 'Bizz'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `bussines`
--

INSERT INTO `bussines` (`ID`, `Userid`, `Owned`, `Fee`, `Static`, `Value`, `OldValue`, `Status`, `Balance`, `EnterPosX`, `EnterPosY`, `EnterPosZ`, `ExitPosX`, `ExitPosY`, `ExitPosZ`, `Interior`, `VirtualWorld`, `Type`, `Level`, `Owner`, `Description`) VALUES
(1, 237, 1, 250, 0, 0, 100000000, 0, 32001, 1330.23, -982.876, 33.8966, 502.043, -68.4343, 998.758, 11, 41, 15, 10, 'Mario', 'Unknown'),
(2, 0, 0, 0, 0, 0, 0, 0, 0, 2196.92, 1677.15, 12.3672, 2305.07, -15.9066, 26.7422, 0, 43, 1, 10, 'The State', 'Bank'),
(3, 0, 0, 0, 0, 0, 0, 0, 0, 2556.93, 2065.38, 11.0995, 285.676, -86.3199, 1001.52, 4, 44, 2, 7, 'The State', 'Gun Shop'),
(4, 0, 0, 0, 0, 0, 0, 0, 550200, 2017.25, 1916.39, 12.3423, 493.397, -24.8437, 1000.68, 17, 45, 3, 5, 'The State', 'Club'),
(5, 0, 0, 0, 0, 0, 0, 0, 8500, 1087.68, -922.483, 43.3906, -100.354, -25.0326, 1000.72, 3, 46, 4, 5, 'The State', 'Sex Shop'),
(6, 0, 0, 0, 0, 0, 0, 0, 22300, 1712.92, 912.774, 10.8203, -25.9517, -187.761, 1003.55, 17, 47, 5, 7, 'The State', '24/7'),
(7, 77, 1, 1000, 0, 0, 0, 0, 941500, 2194.94, 1991, 12.2969, -25.9517, -187.761, 1003.55, 17, 48, 5, 7, 'Andrewaky', '24/7 SEVEN'),
(8, 0, 0, 0, 0, 0, 0, 0, 84730, 1657.04, 1733.27, 10.8281, 204.344, -168.86, 1000.52, 14, 49, 6, 7, 'The State', 'Binco'),
(9, 0, 0, 0, 0, 0, 0, 0, 86525, 1872.25, 2071.99, 11.0625, 363.04, -75.3009, 1001.51, 10, 50, 7, 10, 'The State', 'Burger'),
(10, 0, 0, 0, 1, 0, 0, 0, 0, 2079.45, 2046.17, 11.0579, 0, 0, 0, 0, 51, 9, 15, 'The State', 'CNN'),
(11, 80, 1, 200, 1, 0, 0, 0, 4400, 1967.7, 2158.25, 10.8203, 0, 0, 0, 0, 52, 11, 5, 'HPQ123', 'PNS'),
(12, 0, 0, 0, 1, 0, 0, 0, 864, 2107.04, 914.77, 10.8203, 0, 0, 0, 0, 53, 10, 7, 'The State', 'Gas Station'),
(13, 0, 0, 0, 0, 0, 0, 0, 975, 2638.79, 1849.78, 11.0234, 372.286, -133.524, 1001.49, 5, 54, 12, 5, 'The State', 'Pizza'),
(14, 0, 0, 0, 1, 0, 0, 0, 0, 2168.01, 1405.91, 10.8203, 0, 0, 0, 0, 55, 13, 7, 'The State', 'Rent Car'),
(15, 261, 1, 200, 1, 0, 0, 0, 0, 1310.07, -1366.91, 13.5109, 0, 0, 0, 0, 56, 14, 15, 'Pant1limon', 'Salut'),
(16, 0, 0, 0, 1, 0, 0, 0, 108, 2196.93, 2482.73, 10.8203, 0, 0, 0, 0, 57, 10, 7, 'The State', 'Gas Station'),
(17, 0, 0, 0, 0, 0, 0, 0, 137250, 1199.31, -918.423, 43.1207, 363.04, -75.3009, 1001.51, 10, 58, 7, 10, 'The State', 'Burger'),
(18, 0, 0, 0, 1, 0, 0, 0, 0, 1034.83, -1028.18, 32.1016, 0, 0, 0, 0, 59, 11, 7, 'The State', 'PNS'),
(19, 0, 0, 0, 1, 0, 0, 0, 0, 491.448, -1734.67, 11.2388, 0, 0, 0, 0, 60, 11, 7, 'The State', 'PNS'),
(20, 0, 0, 0, 0, 0, 0, 0, 30400, 1836.73, -1682.41, 13.3355, 493.397, -24.8437, 1000.68, 17, 61, 3, 7, 'The State', 'Club'),
(21, 0, 0, 0, 0, 0, 0, 0, 0, 1022.5, -1121.42, 23.8701, 2019.07, 1017.8, 996.936, 10, 62, 8, 10, 'The State', 'Casino'),
(22, 0, 0, 0, 0, 0, 0, 0, 10600, 2105.26, -1806.49, 13.5547, 372.286, -133.524, 1001.49, 5, 63, 12, 5, 'The State', 'Pizza'),
(23, 0, 0, 0, 0, 0, 0, 0, 4850, 1456.55, -1137.81, 23.9588, 204.344, -168.86, 1000.52, 14, 64, 6, 5, 'The State', 'Binco'),
(24, 0, 0, 0, 1, 0, 0, 0, 900, 996.208, -937.896, 42.3281, 0, 0, 0, 0, 65, 10, 7, 'The State', 'Gas Station'),
(25, 0, 0, 0, 0, 0, 0, 0, 0, 1791.68, -1163.51, 23.8281, 285.676, -86.3199, 1001.52, 4, 66, 2, 7, 'The State', 'Gun Shop'),
(26, 0, 0, 0, 0, 0, 0, 0, 0, 1467.34, -1010.22, 26.8438, 2305.07, -15.9066, 26.7422, 0, 67, 1, 7, 'The State', 'Bank'),
(27, 0, 0, 0, 0, 0, 0, 0, 209500, 1315.58, -897.681, 39.5781, -25.9517, -187.761, 1003.55, 17, 68, 5, 5, 'The State', '24/7'),
(28, 0, 0, 0, 0, 0, 0, 0, 6800, 1833.56, -1842.55, 13.5781, -25.9517, -187.761, 1003.55, 17, 69, 5, 5, 'The State', '24/7'),
(29, 0, 0, 0, 1, 0, 0, 0, 0, 559.319, -1290.35, 17.2482, 0, 0, 0, 0, 70, 13, 5, 'The State', 'Rent Car'),
(30, 0, 0, 0, 0, 0, 0, 0, 69760, 2101.89, 2257.4, 11.0234, 204.344, -168.86, 1000.52, 14, 71, 6, 10, 'The State', 'Binco'),
(31, 0, 0, 0, 0, 0, 0, 0, 0, 172.873, 1176.94, 14.7578, 363.04, -75.3009, 1001.51, 10, 72, 7, 7, 'The State', 'Burger');

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `ID` int(11) NOT NULL,
  `Owner` varchar(24) NOT NULL DEFAULT 'None',
  `License` varchar(24) DEFAULT 'None',
  `Userid` int(11) NOT NULL,
  `Model` int(11) NOT NULL,
  `Color1` int(11) NOT NULL,
  `Color2` int(11) NOT NULL,
  `Fuel` int(11) NOT NULL,
  `PosX` float NOT NULL,
  `PosY` float NOT NULL,
  `PosZ` float NOT NULL,
  `PosR` float NOT NULL,
  `Virtual` int(11) NOT NULL,
  `Days` int(11) NOT NULL,
  `Health` int(11) NOT NULL DEFAULT 999,
  `Odometer` float NOT NULL,
  `Points` int(11) NOT NULL,
  `Status` int(11) NOT NULL,
  `Price` int(11) NOT NULL,
  `Insurance` int(11) NOT NULL,
  `Rainbow` int(11) NOT NULL,
  `Components` varchar(20) NOT NULL DEFAULT '0 0 0 0',
  `Mod` varchar(50) NOT NULL DEFAULT '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0',
  `LastPosX` int(11) NOT NULL,
  `LastPosY` int(11) NOT NULL,
  `LastPosZ` int(11) NOT NULL,
  `LastPosR` int(11) NOT NULL,
  `Text` varchar(30) NOT NULL,
  `VipColor` varchar(10) NOT NULL DEFAULT 'FFFFFF',
  `VipPos` varchar(50) NOT NULL DEFAULT '0.0 0.0 0.0 0.0 0.0 0.0',
  `VipStatus` int(11) NOT NULL,
  `Premium` int(11) NOT NULL,
  `Paintjob` int(11) NOT NULL DEFAULT 3,
  `Left` int(11) NOT NULL,
  `Neon` int(11) NOT NULL,
  `idd` int(11) NOT NULL DEFAULT -1,
  `NeonStatus` int(11) NOT NULL,
  `Stage` int(11) NOT NULL,
  `NeonObj` varchar(32) NOT NULL DEFAULT '-1|-1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_log`
--

CREATE TABLE `chat_log` (
  `ID` int(11) NOT NULL,
  `date` varchar(30) NOT NULL,
  `Userid` int(11) NOT NULL,
  `Name` varchar(24) NOT NULL DEFAULT 'none',
  `text` varchar(256) NOT NULL DEFAULT 'none'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clans`
--

CREATE TABLE `clans` (
  `ID` int(11) NOT NULL,
  `Name` varchar(25) NOT NULL,
  `Tag` varchar(10) NOT NULL,
  `Color` varchar(10) NOT NULL DEFAULT 'FFFFFF',
  `Members` int(11) NOT NULL DEFAULT 25,
  `Safebox` int(11) NOT NULL,
  `PP` int(11) NOT NULL,
  `Time` int(11) NOT NULL,
  `RankName1` varchar(25) NOT NULL DEFAULT 'Rank 1',
  `RankName2` varchar(25) NOT NULL DEFAULT 'Rank 2',
  `RankName3` varchar(25) NOT NULL DEFAULT 'Rank 3',
  `RankName4` varchar(25) NOT NULL DEFAULT 'Rank 4',
  `RankName5` varchar(25) NOT NULL DEFAULT 'Rank 5',
  `RankName6` varchar(25) NOT NULL DEFAULT 'Rank 6',
  `RankName7` varchar(25) NOT NULL DEFAULT 'Rank 7',
  `RankColor1` varchar(10) NOT NULL DEFAULT 'FFFFFF',
  `RankColor2` varchar(10) NOT NULL DEFAULT 'FFFFFF',
  `RankColor3` varchar(10) NOT NULL DEFAULT 'FFFFFF',
  `RankColor4` varchar(10) NOT NULL DEFAULT 'FFFFFF',
  `RankColor5` varchar(10) NOT NULL DEFAULT 'FFFFFF',
  `RankColor6` varchar(10) NOT NULL DEFAULT 'FFFFFF',
  `RankColor7` varchar(10) NOT NULL DEFAULT 'FFFFFF',
  `ChatColor` varchar(10) NOT NULL DEFAULT 'FFFFFF',
  `ClanMotd` varchar(84) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clanvehicles`
--

CREATE TABLE `clanvehicles` (
  `ID` int(11) NOT NULL,
  `Model` int(11) NOT NULL,
  `Color1` int(11) NOT NULL,
  `Color2` int(11) NOT NULL,
  `ClanID` int(11) NOT NULL,
  `X` int(11) NOT NULL,
  `Y` int(11) NOT NULL,
  `Z` int(11) NOT NULL,
  `R` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `commands`
--

CREATE TABLE `commands` (
  `ID` int(11) NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT 'None'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `commands`
--

INSERT INTO `commands` (`ID`, `name`) VALUES
(15, 'mute'),
(33, 'warn'),
(45, 'setadmin'),
(50, 'editbiz'),
(53, 'kick'),
(55, 'skick'),
(57, 'ban');

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `ID` int(11) NOT NULL,
  `Username` text NOT NULL,
  `UsernameR` text NOT NULL,
  `Type` int(11) NOT NULL,
  `Reason` int(11) NOT NULL,
  `Proofs` text NOT NULL,
  `Details` text NOT NULL,
  `Status` int(11) NOT NULL DEFAULT 0,
  `Message` varchar(255) NOT NULL DEFAULT '',
  `Date` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `complaints-comments`
--

CREATE TABLE `complaints-comments` (
  `ID` int(11) NOT NULL,
  `Username` text NOT NULL,
  `Text` text NOT NULL,
  `Date` int(11) NOT NULL,
  `ComplaintID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dsvehicle`
--

CREATE TABLE `dsvehicle` (
  `ID` int(11) NOT NULL,
  `Model` int(11) NOT NULL,
  `Price` int(11) NOT NULL,
  `Stock` int(11) NOT NULL,
  `PremiumPoints` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `dsvehicle`
--

INSERT INTO `dsvehicle` (`ID`, `Model`, `Price`, `Stock`, `PremiumPoints`) VALUES
(1, 510, 250000, 24, 0),
(2, 541, 7499999, 0, 0),
(4, 411, -589934593, 0, 0),
(5, 506, 4500000, 1, 0),
(6, 415, 6799999, 10, 0),
(7, 560, 7199999, 0, 0),
(8, 589, 1880000, 29, 0),
(9, 439, 5500000, 27, 0),
(10, 522, 7499999, 0, 0),
(11, 451, 7300000, 0, 0),
(12, 402, 6499999, 9, 0),
(13, 562, 6100000, 9, 0),
(14, 575, 1000000, 29, 0),
(15, 559, 6359999, 9, 0),
(16, 477, 5800000, 12, 0),
(17, 495, 5699000, 14, 0),
(18, 521, 5199000, 11, 0),
(19, 471, 950000, 26, 0),
(20, 480, 4099000, 21, 0),
(21, 558, 4900000, 28, 0),
(22, 565, 4300000, 26, 0),
(23, 579, 3999999, 3, 0),
(24, 602, 3700000, 8, 0),
(25, 468, 3499999, 6, 0),
(26, 412, 3250000, 7, 0),
(27, 445, 3000000, 9, 0),
(28, 533, 2300000, 10, 0),
(29, 587, 2100000, 28, 0),
(30, 405, 2800000, 10, 0),
(31, 536, 2500000, 9, 0),
(32, 489, 2000000, 27, 0),
(33, 475, 1900000, 29, 0),
(34, 463, 1499999, 2, 0),
(35, 603, 1550000, 26, 0),
(36, 426, 1750000, 8, 0),
(38, 586, 1810000, 8, 0),
(39, 534, 1300000, 5, 0),
(40, 555, 1180000, 10, 0),
(41, 554, 1100000, 28, 0),
(42, 518, 1290000, 9, 0),
(43, 576, 350000, 30, 0),
(44, 535, 1050000, 30, 0),
(45, 496, 1000000, 7, 0),
(46, 567, 1000000, 7, 0),
(47, 566, 1000000, 10, 0),
(48, 507, 1000000, 29, 0),
(49, 540, 1000000, 28, 0),
(50, 561, 1000000, 28, 0),
(51, 434, 1000000, 28, 0),
(52, 492, 1000000, 10, 0),
(53, 545, 1000000, 29, 0),
(54, 600, 1000000, 8, 0),
(55, 549, 1000000, 9, 0),
(56, 580, 1000000, 8, 0),
(57, 542, 1000000, 9, 0),
(58, 529, 1000000, 10, 0),
(59, 419, 1000000, 8, 0),
(60, 585, 1000000, 10, 0),
(61, 516, 1000000, 8, 0),
(62, 400, 1000000, 7, 0),
(63, 551, 1000000, 10, 0),
(64, 508, 1000000, 9, 0),
(65, 500, 1000000, 9, 0),
(66, 527, 1000000, 7, 0),
(67, 458, 1000000, 9, 0),
(68, 482, 800000, 7, 0),
(69, 422, 900000, 9, 0),
(70, 491, 850000, 30, 0),
(71, 517, 750000, 9, 0),
(72, 547, 750000, 10, 0),
(73, 526, 700000, 10, 0),
(74, 436, 700000, 9, 0),
(75, 550, 700000, 10, 0),
(76, 459, 650000, 9, 0),
(77, 546, 650000, 29, 0),
(78, 410, 650000, 30, 0),
(79, 474, 600000, 29, 0),
(80, 401, 600000, 27, 0),
(81, 466, 650000, 29, 0),
(82, 467, 550000, 30, 0),
(83, 479, 450000, 28, 0),
(84, 478, 400000, 27, 0),
(85, 543, 350000, 29, 0),
(86, 418, 300000, 30, 0),
(87, 483, 250000, 30, 0),
(88, 413, 550000, 28, 0),
(89, 440, 100000, 26, 0),
(90, 404, 100000, 25, 0),
(91, 499, 100000, 28, 0),
(92, 462, 150000, 93, 0),
(93, 509, 50000, 24, 0),
(95, 444, 0, 0, 3000),
(96, 494, 0, 5, 1200),
(97, 502, 0, 0, 1200),
(99, 487, 0, 7, 1000),
(100, 437, 0, 10, 800),
(102, 469, 0, 0, 750),
(103, 528, 0, 0, 600),
(104, 411, 7999999, 31, 0);

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `ID` int(11) NOT NULL,
  `Name` varchar(24) NOT NULL DEFAULT 'None',
  `Text` varchar(128) NOT NULL DEFAULT 'None',
  `Date` varchar(30) NOT NULL DEFAULT 'Unknown',
  `Activ` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `factions`
--

CREATE TABLE `factions` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `EnterPosX` float NOT NULL,
  `EnterPosY` float NOT NULL,
  `EnterPosZ` float NOT NULL,
  `ExitPosX` float NOT NULL,
  `ExitPosY` float NOT NULL,
  `ExitPosZ` float NOT NULL,
  `Color` varchar(11) NOT NULL,
  `MaxMembers` int(11) NOT NULL,
  `Level` int(11) NOT NULL,
  `Balance` int(11) NOT NULL,
  `Status` int(11) NOT NULL,
  `VirtualWorld` int(11) NOT NULL,
  `Interior` int(11) NOT NULL,
  `Members` int(11) NOT NULL,
  `Leader` varchar(24) NOT NULL DEFAULT 'None',
  `Rank1` varchar(50) NOT NULL DEFAULT 'Rank 1',
  `Rank2` varchar(50) NOT NULL DEFAULT 'Rank 2',
  `Rank3` varchar(50) NOT NULL DEFAULT 'Rank 3',
  `Rank4` varchar(50) NOT NULL DEFAULT 'Rank 4',
  `Rank5` varchar(50) NOT NULL DEFAULT 'Rank 5',
  `Rank6` varchar(50) NOT NULL DEFAULT 'Rank 6',
  `Rank7` varchar(50) NOT NULL DEFAULT 'Rank 7',
  `Skins` varchar(40) NOT NULL DEFAULT '0|0|0|0|0|0',
  `RaportRank1` varchar(24) NOT NULL DEFAULT '0|0|0',
  `RaportRank2` varchar(24) NOT NULL DEFAULT '0|0|0',
  `RaportRank3` varchar(24) NOT NULL DEFAULT '0|0|0',
  `RaportRank4` varchar(24) NOT NULL DEFAULT '0|0|0',
  `RaportRank5` varchar(24) NOT NULL DEFAULT '0|0|0',
  `RaportRank6` varchar(24) NOT NULL DEFAULT '0|0|0',
  `RaportRank7` varchar(24) NOT NULL DEFAULT '0|0|0',
  `Applcation` int(11) NOT NULL,
  `Motd` varchar(128) NOT NULL DEFAULT 'None'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `factions`
--

INSERT INTO `factions` (`ID`, `Name`, `EnterPosX`, `EnterPosY`, `EnterPosZ`, `ExitPosX`, `ExitPosY`, `ExitPosZ`, `Color`, `MaxMembers`, `Level`, `Balance`, `Status`, `VirtualWorld`, `Interior`, `Members`, `Leader`, `Rank1`, `Rank2`, `Rank3`, `Rank4`, `Rank5`, `Rank6`, `Rank7`, `Skins`, `RaportRank1`, `RaportRank2`, `RaportRank3`, `RaportRank4`, `RaportRank5`, `RaportRank6`, `RaportRank7`, `Applcation`, `Motd`) VALUES
(1, 'LV Police Departament', 2287.02, 2432.12, 10.8203, 246.333, 107.841, 1003.22, '2E2EFE', 15, 7, 0, 0, 1, 10, 30, 'MentoSanXD3', 'Officer (1)', 'Detective (2)', 'Sergeant (3)', 'Lieutenant (4)', 'Captain (5)', 'Assisant Chief (6)', 'Chief (7)', '71|284|280|288|283|265|265', '30|10|15', '25|20|15', '25|25|15', '15|15|15', '10|10|15', '0', '10', 1, 'test'),
(2, 'LS Police Departament', 1555.13, -1675.58, 16.1953, 289, 167, 1007, '0101DF', 15, 5, 0, 0, 2, 3, 20, 'Ionalinc', 'Officer (1)', 'Detective (2)', 'Sergeant (3)', 'Lieutenant (4)', 'Captain (5)', 'Assistant Chief (6)', 'Chief (7)', '71|284|280|288|283|265|265', '30|13|0', '30|20|15', '25|13|0', '20|13|0', '10|5|0', '0|0|0', '0|0|0', 1, 're'),
(3, 'Verdant Family', 1122.71, -2037.01, 69.8942, 967, -53, 1001, '656565', 15, 5, 0, 1, 3, 3, 21, 'Penalti', 'Rank 1', 'Rank 2', 'Rank 3', 'Rank 4', 'Rank 5', 'Rank 6', 'Mafia', '117|118|118|208|208|120|120', '0|0|0', '0|0|0', '0|0|0', '0|0|0', '0|0|0', '0|0|0', '0|0|0', 0, 'None'),
(4, 'Los Aztecas', 1456.58, 2773.41, 10.8203, -2637, 1403, 906, '2ECCFA', 15, 5, 0, 1, 4, 3, 9, 'EdeN.adv', 'Rank 1', 'Rank 2', 'Rank 3', 'Rank 4', 'Rank 5', 'Rank 6', 'Rank 7', '114|115|115|116|116|113', '0|0|0', '0|0|0', '0|0|0', '0|0|0', '0|0|0', '0|0|0', '0|0|0', 0, '.'),
(5, 'Taxi Company', 937.52, 1733.17, 8.85156, 1700.96, -1667.95, 20.2188, 'FFFF00', 15, 5, 0, 1, 5, 18, 13, 'IDownKnow', 'Trainee (1)', 'Taxi Rookie (2)', 'Cabbie (3)', 'Dispatcher (4)', 'Shift Supervisor (5)', 'Company Manager (6)', 'Company Owner (7)', '255|255|255|253|253|61', '60|0|0', '50|0|0', '40|0|0', '20|0|0', '10|0|0', '0|0|0', '10', 1, 'None'),
(6, 'Paramedics', 1607.38, 1815.51, 10.8203, 1494.38, 1303.86, 1093.29, 'FA5858', 15, 7, 0, 1, 6, 3, 14, '.KuazaKuaza', 'Rank 1', 'Rank 2', 'Rank 3', 'Rank 4', 'Rank 5', 'Rank 6', 'Rank 7', '276|275|278|274|70|228', '40|0|0', '35|0|0', '30|0|0', '25|0|0', '20|0|0', '5|0|0', '3|0|0', 0, 'test'),
(7, 'School Instructors', 1165.45, 1346.19, 10.9219, 1494.41, 1303.8, 1093.29, '82FA58', 15, 7, 0, 1, 8, 3, 6, 'sladerino', '[1] Invatacel', '[2] Instructor', '[3] Incepator', '[4] Advanced', '[5] Expert', '[6] Co-Lider', '[7] Director', '153|60|60|240|240|171', '50|0|0', '40|0|0', '30|0|0', '15|0|0', '10|0|0', '0|0|0', '20|0|0', 0, 'None'),
(8, 'The Ballas', 1455.71, 751.095, 11.0234, -2636.69, 1402.77, 906.461, 'DA65FF', 15, 5, 0, 0, 9, 3, 17, 'IbrahimovicAdv', 'Rank 1', 'Rank 2', 'Rank 3', 'Rank 4', 'Rank 5', 'Rank 6', 'Rank 7', '104|102|102|185|185|296', '0|0|0', '0|0|0', '0|0|0', '0|0|0', '0|0|0', '0|0|0', '0|0|0', 1, 'None'),
(9, 'Hitman Agency', 1081.01, -345.411, 73.984, 2324.44, -1149.2, 1050.71, 'B82525', 15, 7, 0, 0, 10, 12, 7, 'Healtic', 'Rank 1', 'Rank 2', 'Rank 3', 'Rank 4', 'Rank 5', 'Rank 6', 'Rank 7', '186|118|118|240|240|294', '20|0|0', '20|0|0', '15|0|0', '10|0|0', '5|0|0', '5|0|0', '10', 0, 'None'),
(10, 'News Reporters', -329.71, 1537.04, 76.6117, 1701, -1668, 20, 'FFABFC', 15, 7, 0, 1, 11, 18, 6, 'Ceausescu', 'Rank 1', 'Rank 2', 'Rank 3', 'Rank 4', 'Rank 5', 'Rank 6', 'Rank 7', '188|17|17|187|187|147', '60|0|0', '50|0|0', '40|0|0', '30|0|0', '20|0|0', '0|0|0', '10|10|0', 0, 'doom'),
(11, 'National Guard', 200.408, 1869.47, 13.147, 246.38, 107.571, 1003.22, '1E388B', 15, 7, 0, 1, 12, 10, 11, 'HPQ123', 'Private', 'Rank 2', 'Rank 3', 'Rank 4', 'Rank 5', 'Rank 6', 'Rank 7', '285|287|287|287|287|179', '25|0|0', '25|0|0', '20|0|0', '15|0|0', '10|0|0', '0|0|0', '0|0|0', 1, 'salut'),
(12, 'Grove Street Family', 2495.38, -1691.14, 14.7656, 2545, -1305, 1055, '33C847', 15, 5, 0, 1, 13, 2, 14, 'Penalti', 'Rank 1', 'Rank 2', 'Rank 3', 'Rank 4', 'Rank 5', 'Rank 6', 'Rank 7', '106|106|269|269|269|270', '0|0|0', '0|0|0', '0|0|0', '0|0|0', '0|0|0', '0|0|0', '0|0|0', 0, 'Bine ati venit! Grove Street Power!');

-- --------------------------------------------------------

--
-- Table structure for table `faction_apply`
--

CREATE TABLE `faction_apply` (
  `ID` int(11) NOT NULL,
  `FactionID` int(11) NOT NULL,
  `Username` text NOT NULL,
  `Status` int(11) NOT NULL,
  `I1` text NOT NULL,
  `I2` text NOT NULL,
  `I4` text NOT NULL,
  `I5` text NOT NULL,
  `I6` text NOT NULL,
  `I7` text NOT NULL,
  `I8` text NOT NULL,
  `I9` text NOT NULL,
  `I10` text NOT NULL,
  `I11` text NOT NULL,
  `I12` text NOT NULL,
  `I13` text NOT NULL,
  `I14` text NOT NULL,
  `I15` text NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Raspuns` varchar(1024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faction_logs`
--

CREATE TABLE `faction_logs` (
  `ID` int(11) NOT NULL,
  `text` varchar(256) NOT NULL,
  `Userid` int(11) NOT NULL,
  `ByUserid` int(11) NOT NULL,
  `time` varchar(100) NOT NULL DEFAULT '1999-1-1 10:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faction_questions`
--

CREATE TABLE `faction_questions` (
  `ID` int(11) NOT NULL,
  `FactionID` int(11) NOT NULL,
  `Q1` varchar(1024) NOT NULL,
  `Q2` varchar(1024) NOT NULL,
  `Q3` varchar(1024) NOT NULL,
  `Q4` varchar(1024) NOT NULL,
  `Q5` varchar(1024) NOT NULL,
  `Q6` varchar(1024) NOT NULL,
  `Q7` varchar(1024) NOT NULL,
  `Q8` varchar(1024) NOT NULL,
  `Q9` varchar(1024) NOT NULL,
  `Q10` varchar(1024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faction_questions`
--

INSERT INTO `faction_questions` (`ID`, `FactionID`, `Q1`, `Q2`, `Q3`, `Q4`, `Q5`, `Q6`, `Q7`, `Q8`, `Q9`, `Q10`) VALUES
(1, 1, 'Intrebare 1', 'Intrebare 2', 'Intrebare 3', 'Intrebare 4', 'Intrebare 5', 'Intrebare 6', 'Intrebare 7', 'Intrebare 8', 'Intrebare 9', 'Intrebare 10');

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

CREATE TABLE `friends` (
  `ID` int(11) NOT NULL,
  `AddBy` int(11) NOT NULL,
  `ByStatus` int(11) NOT NULL,
  `ByName` varchar(24) NOT NULL,
  `Name` varchar(24) NOT NULL,
  `Userid` int(11) NOT NULL,
  `Status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `helper_applications`
--

CREATE TABLE `helper_applications` (
  `ID` int(11) NOT NULL,
  `Name` varchar(512) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Status` int(11) NOT NULL,
  `Likes` int(11) NOT NULL,
  `Dislikes` int(11) NOT NULL,
  `A1` varchar(1024) NOT NULL,
  `A2` varchar(1024) NOT NULL,
  `A3` varchar(1024) NOT NULL,
  `A4` varchar(1024) NOT NULL,
  `A5` varchar(1024) NOT NULL,
  `A6` varchar(1024) NOT NULL,
  `A7` varchar(1024) NOT NULL,
  `A8` varchar(1024) NOT NULL,
  `A9` varchar(1024) NOT NULL,
  `A10` varchar(1024) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Raspuns` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `houses`
--

CREATE TABLE `houses` (
  `ID` int(11) NOT NULL,
  `Userid` int(11) NOT NULL,
  `Owned` int(11) NOT NULL,
  `Rented` int(11) NOT NULL,
  `Value` int(11) NOT NULL,
  `OldValue` int(11) NOT NULL,
  `Status` int(11) NOT NULL,
  `Balance` int(11) NOT NULL,
  `EnterPosX` float NOT NULL,
  `EnterPosY` float NOT NULL,
  `EnterPosZ` float NOT NULL,
  `ExitPosX` float NOT NULL,
  `ExitPosY` float NOT NULL,
  `ExitPosZ` float NOT NULL,
  `Interior` int(11) NOT NULL,
  `VirtualWorld` int(11) NOT NULL,
  `Size` int(11) NOT NULL,
  `Level` int(11) NOT NULL,
  `Owner` varchar(24) NOT NULL DEFAULT 'The State',
  `Description` varchar(32) NOT NULL DEFAULT 'House',
  `Radio` int(11) NOT NULL,
  `AleaPos` varchar(50) NOT NULL,
  `Alea` int(11) NOT NULL,
  `xPC` float NOT NULL,
  `yPC` float NOT NULL,
  `zPC` float NOT NULL,
  `rPC` float NOT NULL,
  `PC` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `houses`
--

INSERT INTO `houses` (`ID`, `Userid`, `Owned`, `Rented`, `Value`, `OldValue`, `Status`, `Balance`, `EnterPosX`, `EnterPosY`, `EnterPosZ`, `ExitPosX`, `ExitPosY`, `ExitPosZ`, `Interior`, `VirtualWorld`, `Size`, `Level`, `Owner`, `Description`, `Radio`, `AleaPos`, `Alea`, `xPC`, `yPC`, `zPC`, `rPC`, `PC`) VALUES
(1, 80, 1, 0, 0, 0, 1, 0, 1845.72, 741.249, 11.4609, 2496.01, -1692.4, 1014.74, 3, 57, 2, 7, 'HPQ123', 'House', 0, '1852.630981, 735.295654, 11.009616, 269.235077', 1, 2493.75, -1700.17, 1018.35, 0, 1),
(2, 261, 1, 0, 0, 0, 0, 0, 2168.97, 772.24, 11.4609, -283.974, 1471.13, 1084.38, 15, 58, 2, 7, 'Pant1limon', 're', 0, '2161.767822, 777.896912, 10.985431, 89.126190', 1, 0, 0, 0, 0, 0),
(3, 0, 0, 0, 0, 0, 0, 0, 2317.16, 690.353, 11.4609, 2317.95, -1026.17, 1050.22, 9, 59, 2, 7, 'The State', 'House', 0, '2309.839111, 697.059814, 11.029841, 0.001466', 1, 0, 0, 0, 0, 0),
(4, 0, 0, 0, 0, 0, 0, 0, 2238.84, 1285.75, 10.8203, 234.203, 1064.15, 1084.21, 6, 60, 3, 7, 'The State', 'House', 0, '2209.491699, 1286.728638, 10.547396, 273.761780', 1, 0, 0, 0, 0, 0),
(5, 260, 1, 0, 0, 0, 0, 0, 2007.1, 1167.44, 10.8203, 225.662, 1022.08, 1084.02, 7, 61, 3, 7, 'akkaru', 'House', 0, '2037.332886, 1162.392212, 10.470804, 179.934448', 1, 0, 0, 0, 0, 0),
(6, 0, 0, 0, 0, 0, 0, 0, 1951.84, 1342.93, 15.3746, 225.662, 1022.08, 1084.02, 7, 62, 3, 7, 'The State', 'House', 0, '2037.615723, 1335.699707, 10.470620, 182.033508', 1, 0, 0, 0, 0, 0),
(7, 0, 0, 0, 0, 0, 0, 0, 1030.81, 1848.04, 11.4683, 2496.02, -1692.68, 1014.74, 3, 63, 2, 7, 'The State', 'House', 0, '1022.867004, 1840.572144, 10.956926, 90.584442', 1, 0, 0, 0, 0, 0),
(8, 0, 0, 0, 0, 0, 0, 0, 1274.14, 2522.5, 10.8203, 234.203, 1064.15, 1084.21, 6, 64, 3, 7, 'The State', 'House', 0, '1275.738403, 2529.961182, 10.549140, 272.031036', 1, 0, 0, 0, 0, 0),
(9, 0, 0, 0, 0, 0, 0, 0, 1629.27, 972.097, 10.8203, 234.203, 1064.15, 1084.21, 6, 65, 3, 7, 'The State', 'House', 0, '1652.441162, 988.674561, 10.506532, -0.000000', 1, 0, 0, 0, 0, 0),
(10, 284, 1, 0, 0, 0, 0, 0, 2581.29, 1060.55, 11.7828, 2365.34, -1134.84, 1050.88, 8, 66, 2, 7, 'Vallentiin', 'House', 0, '2577.578857, 1068.201416, 10.470856, 269.442200', 1, 2370.63, -1126.12, 1050.8, 0, 1),
(11, 0, 0, 0, 0, 0, 0, 0, 2013.23, 730.36, 11.4531, 447.325, 1397.58, 1084.3, 2, 67, 2, 7, 'The State', 'House', 0, '2005.738525, 735.378906, 11.073255, 0.116371', 1, 0, 0, 0, 0, 0),
(12, 0, 0, 0, 0, 0, 0, 0, 2257.65, 736.11, 11.4609, 83.0025, 1322.85, 1083.87, 9, 68, 2, 7, 'The State', 'House', 0, '2264.074707, 726.759827, 10.852048, 0.117499', 1, 0, 0, 0, 0, 0),
(13, 0, 0, 0, 0, 0, 0, 0, 983.973, 1978.36, 11.4683, 2282.79, -1139.4, 1050.9, 11, 69, 1, 7, 'The State', 'House', 0, '991.883118, 1985.557007, 10.961615, 269.169739', 1, 0, 0, 0, 0, 0),
(14, 0, 0, 0, 0, 0, 0, 0, 1497.03, -687.892, 95.5633, 225.662, 1022.08, 1084.02, 7, 70, 3, 7, 'The State', 'House', 0, '1515.754028, -694.631714, 94.477074, 91.792862', 1, 0, 0, 0, 0, 0),
(15, 260, 1, 0, 0, 0, 0, 0, 1468.55, -906.038, 54.8359, 2196.03, -1204.38, 1049.02, 6, 71, 2, 7, 'akkaru', 'House', 0, '1458.272095, -903.426514, 54.539410, 0.124088', 1, 0, 0, 0, 0, 0),
(16, 0, 0, 0, 0, 0, 0, 0, 1332.12, -633.277, 109.135, 234.203, 1064.15, 1084.21, 6, 72, 3, 10, 'The State', 'House', 0, '1317.758301, -641.296021, 108.861984, 16.877525', 1, 0, 0, 0, 0, 0),
(17, 0, 0, 0, 0, 0, 0, 0, 1298.26, -798.017, 84.1406, 225.662, 1022.08, 1084.02, 7, 73, 3, 10, 'The State', 'House', 0, '1246.647339, -805.807983, 83.867477, 177.782730', 1, 0, 0, 0, 0, 0),
(18, 0, 0, 0, 0, 0, 0, 0, 1093.92, -807.138, 107.419, 225.662, 1022.08, 1084.02, 7, 74, 3, 10, 'The State', 'House', 0, '1077.081421, -790.982422, 101.876671, 352.846039', 1, 0, 0, 0, 0, 0),
(19, 0, 0, 0, 0, 0, 0, 0, 980.492, -677.261, 121.976, 234.203, 1064.15, 1084.21, 6, 75, 3, 10, 'The State', 'House', 0, '1005.677979, -661.401428, 120.874649, 37.143402', 1, 0, 0, 0, 0, 0),
(20, 0, 0, 0, 0, 0, 0, 0, 254.403, -1367.16, 53.1094, 234.203, 1064.15, 1084.21, 6, 76, 3, 7, 'The State', 'House', 0, '251.957458, -1358.740112, 52.836468, 299.824463', 1, 0, 0, 0, 0, 0),
(21, 0, 0, 0, 0, 0, 0, 0, 827.845, -857.972, 70.3308, 260.882, 1237.96, 1084.26, 9, 77, 2, 7, 'The State', 'House', 0, '829.570007, -852.158997, 69.652107, 200.114655', 1, 0, 0, 0, 0, 0),
(22, 0, 0, 0, 0, 0, 0, 0, 315.873, -1769.43, 4.62254, 225.662, 1022.08, 1084.02, 7, 78, 3, 7, 'The State', 'House', 0, '314.947601, -1809.020630, 4.209615, 1.605316', 1, 0, 0, 0, 0, 0),
(23, 0, 0, 0, 0, 0, 0, 0, 942.999, -1742.57, 13.5546, 225.662, 1022.08, 1084.02, 7, 79, 3, 15, 'The State', 'House', 0, '934.600891, -1755.747559, 13.273421, 177.531372', 1, 0, 0, 0, 0, 0),
(24, 256, 1, 0, 0, 0, 0, 0, 1382.15, -1088.75, 28.2129, 234.203, 1064.15, 1084.21, 6, 80, 3, 5, 'Hektor', 'House', 0, '1368.869263, -1085.223877, 24.453999, 347.502930', 1, 0, 0, 0, 0, 0),
(25, 0, 0, 0, 0, 0, 0, 0, 2346.63, 736.638, 11.4683, -283.974, 1471.13, 1084.38, 15, 81, 2, 5, 'The State', 'House', 0, '2353.895264, 730.134460, 11.055981, 184.663239', 1, 0, 0, 0, 0, 0),
(26, 0, 0, 0, 0, 0, 0, 0, 1309.29, 1931.32, 11.4609, -283.974, 1471.13, 1084.38, 15, 82, 2, 5, 'The State', 'House', 0, '1313.778442, 1937.561890, 11.076325, 1.673894', 1, 0, 0, 0, 0, 0),
(27, 0, 0, 0, 0, 0, 0, 0, 2153.73, -1243.8, 25.3672, 24.068, 1340.55, 1084.38, 10, 83, 2, 5, 'The State', 'House', 0, '2148.302979, -1237.494873, 24.185322, 0.477249', 1, 0, 0, 0, 0, 0),
(28, 0, 0, 0, 0, 0, 0, 0, 300.299, -1154.51, 81.3908, 234.203, 1064.15, 1084.21, 6, 84, 3, 15, 'The State', 'House', 0, '288.423523, -1157.082642, 80.677719, 227.676422', 1, 0, 0, 0, 0, 0),
(29, 129, 1, 0, 0, 0, 0, 1111, -683.928, 939.541, 13.6328, 1260.94, -785.457, 1091.91, 5, 29, 3, 25, 'MihaiBeSt', '{00ffff} mihai best', 0, '-704.716125, 969.594543, 12.267922, 183.852661', 1, 1264.3, -781.728, 1091.91, 0, 1),
(30, 0, 0, 0, 0, 0, 0, 0, 3665.14, -761.863, 10.8219, 1260.94, -785.431, 1091.91, 5, 30, 3, 25, 'The State', 'House', 0, '-710.726013, 969.024475, 12.187190, 176.513687', 1, 0, 0, 0, 0, 0),
(36, 0, 0, 0, 0, 0, 0, 0, 1654.04, -1655.69, 22.5156, -2636.63, 1403.23, 906.461, 3, 36, 3, 7, 'The State', 'House', 0, '1668.825317, -1702.197876, 15.377533, 90.466721', 1, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ip_emails`
--

CREATE TABLE `ip_emails` (
  `ID` int(11) NOT NULL,
  `name` varchar(24) NOT NULL DEFAULT 'none',
  `email` varchar(64) NOT NULL DEFAULT 'none',
  `userid` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `code` varchar(128) NOT NULL DEFAULT 'none'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ip_panel`
--

CREATE TABLE `ip_panel` (
  `ID` int(11) NOT NULL,
  `name` varchar(24) NOT NULL,
  `email` varchar(65) NOT NULL,
  `userid` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `code` varchar(300) NOT NULL,
  `IP` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `ID` int(11) NOT NULL,
  `Price` int(11) NOT NULL,
  `Owned` int(11) NOT NULL,
  `Level` int(11) NOT NULL,
  `Userid` int(11) NOT NULL,
  `Pay` varchar(40) NOT NULL DEFAULT '0|0',
  `Vehicles` varchar(40) NOT NULL DEFAULT '400|400|400|400|400|400',
  `Position` varchar(30) NOT NULL DEFAULT '0.0|0.0|0.0',
  `Owner` varchar(24) NOT NULL DEFAULT 'None',
  `Name` varchar(32) NOT NULL DEFAULT 'None',
  `WorkPlace` varchar(50) NOT NULL DEFAULT '0.0|0.0|0.0',
  `WorkStatus` int(11) NOT NULL,
  `VehiclePos` varchar(50) NOT NULL DEFAULT '0.0|0.0|0.0|0.0',
  `Balance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`ID`, `Price`, `Owned`, `Level`, `Userid`, `Pay`, `Vehicles`, `Position`, `Owner`, `Name`, `WorkPlace`, `WorkStatus`, `VehiclePos`, `Balance`) VALUES
(1, 0, 2, 1, 0, '0|0', '400|400|400|400|400|400', '1836.412842|2095.969482|10.843', '...Cobra', 'Detectiv', '0.0|0.0|0.0', 0, '0.0|0.0|0.0', 0),
(2, 1, 9, 1, 0, '1000|1500', '400|400|400|400|400|400', '1646.386841|607.214478|7.78125', 'PericolRPG', 'Fisher', '0.0|0.0|0.0', 0, '0.0|0.0|0.0', 40839733),
(3, 0, 3, 1, 0, '1300|1800', '448|448|448|463|521|461', '2124.592773|-1787.628418|13.55', 'None', 'Pizza Boy', '2115.2249|-1778.9928|13.3900', 1, '2115.5796|-1763.1467|12.9960|9.4385', -263465115),
(4, 0, 0, 1, 0, '0|0', '531|531|531|531|532|532', '-95.1886|25.6349|3.1172', 'None', 'Farmer', '-96.9252|70.3023|3.1172', 1, '-96.9252|70.3023|3.1172|75.9730', 5115206),
(5, 0, 0, 1, 0, '0|0', '408|408|408|408|408|408', '1353.229736|1162.277100|10.820', 'None', 'Garbageman', '1360.5538|1158.8777|10.8203', 1, '1345.8733|1171.1538|10.4767|272.0213', 2502949),
(6, 0, 101, 1, 0, '11|15', '514|514|514|515|515|515', '-189.519562|-313.015961|2.4296', 'GICULET', 'Trucker', '-161.0811|-304.3283|1.4297', 1, '-157.6868|-340.4835|1.5800|128.7975', 4815807),
(7, 0, 0, 3, 0, '0|0', '400|521|521|522|522|411', '2814.765381|973.500061|10.7500', 'None', 'Arms Dealer', '2811.7686|962.7692|10.7500', 1, '1934.7452|171.2171|37.0054|70.0812', 0),
(8, 0, 0, 3, 0, '0|0', '0|0|0|0|0|0', '-1095.9630|-1627.5272|76.3672', 'None', 'Drugs Dealer', '0|0|0', 0, '0|0|0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `leader_applications`
--

CREATE TABLE `leader_applications` (
  `ID` int(11) NOT NULL,
  `Name` varchar(1024) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Status` int(11) NOT NULL,
  `FactionID` int(11) NOT NULL,
  `Likes` int(11) NOT NULL,
  `Dislikes` int(11) NOT NULL,
  `A1` varchar(1024) NOT NULL,
  `A2` varchar(1024) NOT NULL,
  `A3` varchar(1024) NOT NULL,
  `A4` varchar(1024) NOT NULL,
  `A5` varchar(1024) NOT NULL,
  `A6` varchar(1024) NOT NULL,
  `A7` varchar(1024) NOT NULL,
  `A8` varchar(1024) NOT NULL,
  `A9` varchar(1024) NOT NULL,
  `A10` varchar(1024) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Raspuns` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `market`
--

CREATE TABLE `market` (
  `ID` int(11) NOT NULL,
  `Model` int(11) NOT NULL,
  `Userid` int(11) NOT NULL,
  `Price` int(11) NOT NULL,
  `Type` int(11) NOT NULL,
  `Owner` varchar(24) NOT NULL,
  `Title` varchar(80) NOT NULL,
  `Description` varchar(180) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `panel_actions`
--

CREATE TABLE `panel_actions` (
  `ID` int(11) NOT NULL,
  `Userid` int(11) NOT NULL,
  `Type` int(11) NOT NULL,
  `Value` int(11) NOT NULL,
  `Admin` int(11) NOT NULL,
  `Name` varchar(24) NOT NULL,
  `AdminName` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `panel_applications`
--

CREATE TABLE `panel_applications` (
  `id` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `UserName` varchar(32) NOT NULL,
  `FactionID` int(11) NOT NULL,
  `Answers` text NOT NULL,
  `Questions` int(11) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT current_timestamp(),
  `ActionBy` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `panel_checkemail`
--

CREATE TABLE `panel_checkemail` (
  `ChangeMailKey` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `panel_complaints`
--

CREATE TABLE `panel_complaints` (
  `id` int(11) NOT NULL,
  `byID` int(11) NOT NULL,
  `forID` int(11) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT current_timestamp(),
  `Title` varchar(50) DEFAULT NULL,
  `Precizari` text NOT NULL,
  `Dovezi` text NOT NULL,
  `Type` int(3) NOT NULL,
  `groupID` int(3) NOT NULL,
  `Status` int(11) NOT NULL,
  `Hide` int(11) NOT NULL,
  `IP` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `panel_donations`
--

CREATE TABLE `panel_donations` (
  `ID` int(11) NOT NULL,
  `Username` varchar(32) NOT NULL,
  `Message` text NOT NULL,
  `Amount` int(11) NOT NULL,
  `CreatedAt` varchar(64) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT current_timestamp(),
  `Activated` int(11) NOT NULL,
  `ActivatedOn` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `panel_donations_logs`
--

CREATE TABLE `panel_donations_logs` (
  `ID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `UserName` varchar(32) NOT NULL,
  `Log` text NOT NULL,
  `Date` timestamp NOT NULL DEFAULT current_timestamp(),
  `IP` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `panel_functions`
--

CREATE TABLE `panel_functions` (
  `funcID` int(11) NOT NULL,
  `funcPlayerID` int(13) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `panel_functions`
--

INSERT INTO `panel_functions` (`funcID`, `funcPlayerID`, `id`) VALUES
(12, 257, 9);

-- --------------------------------------------------------

--
-- Table structure for table `panel_logs`
--

CREATE TABLE `panel_logs` (
  `logID` int(11) NOT NULL,
  `logText` varchar(256) NOT NULL,
  `logBy` int(11) NOT NULL,
  `logIP` varchar(256) NOT NULL,
  `logDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `panel_news`
--

CREATE TABLE `panel_news` (
  `id` int(11) NOT NULL,
  `text` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `admin` int(11) NOT NULL,
  `title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `panel_notifications`
--

CREATE TABLE `panel_notifications` (
  `ID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `UserName` varchar(32) NOT NULL,
  `Notification` text NOT NULL,
  `FromID` int(11) NOT NULL,
  `FromName` varchar(32) NOT NULL,
  `Seen` int(11) NOT NULL,
  `Link` text NOT NULL,
  `Date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `panel_questions`
--

CREATE TABLE `panel_questions` (
  `id` int(11) NOT NULL,
  `question` text NOT NULL,
  `factionid` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `panel_quests`
--

CREATE TABLE `panel_quests` (
  `ID` int(11) NOT NULL,
  `Title` text NOT NULL,
  `Presentation` text NOT NULL,
  `Duration` text NOT NULL,
  `Date` timestamp NOT NULL DEFAULT current_timestamp(),
  `Admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `panel_recovery`
--

CREATE TABLE `panel_recovery` (
  `RecoverKey` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `panel_reply_complaints`
--

CREATE TABLE `panel_reply_complaints` (
  `replyID` int(11) NOT NULL,
  `replyComplaintID` int(11) NOT NULL,
  `replyPlayerID` int(11) NOT NULL,
  `replyText` text NOT NULL,
  `replyDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `panel_reply_tickets`
--

CREATE TABLE `panel_reply_tickets` (
  `replyID` int(11) NOT NULL,
  `replyTicketID` int(11) NOT NULL,
  `replyPlayerID` int(11) NOT NULL,
  `replyText` text NOT NULL,
  `replyDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `panel_reply_unbans`
--

CREATE TABLE `panel_reply_unbans` (
  `replyID` int(11) NOT NULL,
  `replyUnbanID` int(11) NOT NULL,
  `replyPlayerID` int(11) NOT NULL,
  `replyText` text NOT NULL,
  `replyDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `panel_restrict`
--

CREATE TABLE `panel_restrict` (
  `ID` int(11) NOT NULL,
  `PlayerName` varchar(20) NOT NULL,
  `AdminName` varchar(20) NOT NULL,
  `Reason` text NOT NULL,
  `Time` int(15) NOT NULL,
  `Days` int(11) NOT NULL,
  `Permanent` int(11) NOT NULL,
  `BanTimeDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `panel_settings`
--

CREATE TABLE `panel_settings` (
  `ID` int(11) NOT NULL,
  `IPLoginVerify` int(11) NOT NULL,
  `Maintenance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `panel_settings`
--

INSERT INTO `panel_settings` (`ID`, `IPLoginVerify`, `Maintenance`) VALUES
(1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `panel_shop`
--

CREATE TABLE `panel_shop` (
  `itemID` int(11) NOT NULL,
  `itemName` text NOT NULL,
  `itemPrice` text NOT NULL,
  `itemText` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `panel_suspend`
--

CREATE TABLE `panel_suspend` (
  `spID` int(11) NOT NULL,
  `spAdmin` int(11) NOT NULL,
  `spPlayer` int(11) NOT NULL,
  `spReason` varchar(125) NOT NULL,
  `spDays` int(50) NOT NULL,
  `spDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `panel_tickets`
--

CREATE TABLE `panel_tickets` (
  `ticketID` int(11) NOT NULL,
  `ticketPlayerID` int(13) NOT NULL,
  `ticketType` int(11) NOT NULL,
  `ticketPriority` int(11) NOT NULL,
  `ticketText` text NOT NULL,
  `ticketOwner` int(11) NOT NULL,
  `ticketStatus` int(2) NOT NULL,
  `ticketHide` int(11) NOT NULL DEFAULT 0,
  `ticketIP` varchar(256) NOT NULL,
  `ticketDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `panel_topics`
--

CREATE TABLE `panel_topics` (
  `id` int(11) NOT NULL,
  `Topic` text NOT NULL,
  `Date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `panel_unbans`
--

CREATE TABLE `panel_unbans` (
  `ID` int(11) NOT NULL,
  `PlayerID` int(11) NOT NULL,
  `Dovezi` text NOT NULL,
  `Precizari` text NOT NULL,
  `Status` int(11) NOT NULL DEFAULT 0,
  `IP` varchar(256) NOT NULL,
  `Hide` int(11) NOT NULL DEFAULT 0,
  `Date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `panel_updates`
--

CREATE TABLE `panel_updates` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `text` text NOT NULL,
  `textshort` varchar(300) NOT NULL,
  `admin` varchar(512) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `panel_videos`
--

CREATE TABLE `panel_videos` (
  `ID` int(11) NOT NULL,
  `Link` varchar(2048) NOT NULL,
  `aprobat` int(11) NOT NULL DEFAULT 0,
  `youtuber` varchar(512) NOT NULL,
  `aprobatde` varchar(512) NOT NULL,
  `data` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `panel_videos`
--

INSERT INTO `panel_videos` (`ID`, `Link`, `aprobat`, `youtuber`, `aprobatde`, `data`) VALUES
(1, 'https://www.youtube.com/embed/eqDDLp4BplU', 1, 'MihaiAdv', 'Gabi', '2021-11-28 16:37:39'),
(2, 'https://www.youtube.com/embed/eqDDLp4BplU', 1, 'MihaiAdv', 'Gabi', '2021-11-28 16:37:39');

-- --------------------------------------------------------

--
-- Table structure for table `panel_youtubers`
--

CREATE TABLE `panel_youtubers` (
  `ID` int(11) NOT NULL,
  `Link` text NOT NULL,
  `aprobat` int(11) NOT NULL DEFAULT 0,
  `youtuber` int(11) NOT NULL,
  `aprobatde` int(11) NOT NULL,
  `data` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `safezone`
--

CREATE TABLE `safezone` (
  `ID` int(11) NOT NULL,
  `Raza` int(11) NOT NULL,
  `X` float NOT NULL,
  `Y` float NOT NULL,
  `Z` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `safezone`
--

INSERT INTO `safezone` (`ID`, `Raza`, `X`, `Y`, `Z`) VALUES
(1, 50, 1628.66, 607.193, 7.50638),
(2, 20, 1677.55, 620.843, 10.8203),
(3, 300, 1691.88, 1447.86, 10.7652),
(4, 100, 1540.08, -1674.67, 13.5499),
(5, 50, 1836.3, 2095.97, 10.8458),
(6, 50, 2109.08, -1791.78, 18.2807),
(7, 150, -120.361, 53.7931, 3.11719),
(8, 50, 1359.62, 1160.59, 10.8203),
(9, 80, -175.163, -306.424, 1.42188),
(10, 100, 2817.46, 933.514, 10.9766),
(11, 200, -1060.15, -1648.95, 76.7993),
(12, 150, 2294.2, 2451.15, 10.8203),
(13, 70, 965.812, 1733.38, 8.64844),
(14, 100, 1608.14, 1835.33, 10.9452),
(15, 50, 1162.81, 1352.78, 14.5703),
(16, 100, 1067.73, -319.959, 73.9922),
(17, 100, -327.579, 1552.08, 75.5601),
(18, 150, 200.231, 1884.39, 17.6481),
(19, 50, 1329.16, -982.944, 33.8966),
(20, 50, 1467.35, -1012.55, 26.8438),
(21, 50, 1310.19, -1372.47, 13.6023),
(22, 80, 2068.43, 2065.01, 11.5705),
(23, 50, 2199.25, 1990.31, 16.738),
(24, 25, 2101.89, 2257.37, 11.0234),
(25, 50, 2016.97, 1916.43, 12.3424),
(26, 100, 2195.72, 1677.27, 12.3672),
(27, 25, 1707.83, 919.594, 10.8203),
(28, 100, 1091.2, 1074.6, 10.8608),
(29, 50, 1093.44, 1075.88, 10.8608),
(30, 70, 837.823, -2063.65, 12.8672);

-- --------------------------------------------------------

--
-- Table structure for table `security`
--

CREATE TABLE `security` (
  `ID` int(11) NOT NULL,
  `code` varchar(65) NOT NULL,
  `name` varchar(25) NOT NULL,
  `Userid` int(11) NOT NULL,
  `Email` varchar(30) NOT NULL DEFAULT 'none',
  `Valid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seif`
--

CREATE TABLE `seif` (
  `ID` int(11) NOT NULL,
  `Faction` int(11) NOT NULL,
  `Materials` int(11) NOT NULL,
  `Drugs` int(11) NOT NULL,
  `X` float NOT NULL,
  `Y` float NOT NULL,
  `Z` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `server`
--

CREATE TABLE `server` (
  `ID` int(11) NOT NULL,
  `Name` varchar(150) NOT NULL DEFAULT 'none',
  `Password` varchar(50) NOT NULL DEFAULT '0',
  `Systems` varchar(40) NOT NULL DEFAULT '0|0|0|0|0',
  `Activ` int(11) NOT NULL,
  `MaxJobGoal` int(11) NOT NULL,
  `JobGoal` int(11) NOT NULL,
  `MaxPJobGoal` int(11) NOT NULL,
  `chapter` int(11) NOT NULL DEFAULT 1,
  `bpTime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `server`
--

INSERT INTO `server` (`ID`, `Name`, `Password`, `Systems`, `Activ`, `MaxJobGoal`, `JobGoal`, `MaxPJobGoal`, `chapter`, `bpTime`) VALUES
(1, 'Akyy RPG | Beta Session', 'akyybeta', '0|0|0|0|0|0|1|0|0|0|0|0|0|0', 0, 25000000, 7579, 8000, 1, 1646514843);

-- --------------------------------------------------------

--
-- Table structure for table `servervehicle`
--

CREATE TABLE `servervehicle` (
  `ID` int(11) NOT NULL,
  `Model` int(11) NOT NULL,
  `Color1` int(11) NOT NULL,
  `Color2` int(11) NOT NULL,
  `X` float NOT NULL,
  `Y` float NOT NULL,
  `Z` float NOT NULL,
  `R` float NOT NULL,
  `Faction` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `servervehicle`
--

INSERT INTO `servervehicle` (`ID`, `Model`, `Color1`, `Color2`, `X`, `Y`, `Z`, `R`, `Faction`) VALUES
(35, 521, 0, 0, 1132.49, -2051.06, 68.5785, 269.284, 3),
(36, 405, 0, 0, 1250.37, -2045.88, 59.6648, 268.685, 3),
(37, 487, 0, 0, 1117.24, -2036.93, 78.4043, 271.714, 3),
(38, 405, 0, 0, 1280.26, -2036.54, 58.9057, 359.855, 3),
(39, 405, 0, 0, 1274.13, -2046.77, 58.9794, 268.414, 3),
(40, 579, 0, 0, 1251.68, -2006.81, 59.6848, 90.7159, 3),
(41, 579, 0, 0, 1280.14, -2012, 58.8638, 180.68, 3),
(42, 560, 0, 0, 1242.4, -2026.72, 59.6655, 180.075, 3),
(43, 579, 0, 3, 1242.5, -2014.73, 59.887, 180.322, 3),
(44, 545, 0, 0, 1280.29, -2024.28, 58.7896, 2.09025, 3),
(45, 487, 3, 3, 2571.29, 2312.77, 18, 199.979, 3),
(46, 521, 0, 0, 1132.48, -2025.5, 68.5707, 268.73, 3),
(47, 409, 0, 0, 1267.65, -2006.98, 59.0932, 270.366, 3),
(73, 426, 155, 155, 1489.47, 2842.95, 10.5672, 358.089, 4),
(74, 426, 155, 155, 1470.31, 2843.79, 10.5635, 0.106531, 4),
(75, 521, 155, 155, 1483.35, 2770.82, 10.3538, 86.3279, 4),
(76, 426, 155, 155, 1479.77, 2843.48, 10.5683, 359.842, 4),
(77, 560, 155, 155, 1463.92, 2755.94, 10.4484, 201.656, 4),
(78, 521, 155, 181, 1459.23, 2782.95, 10.391, 268.872, 4),
(79, 579, 155, 181, 1482.02, 2741.27, 10.6736, 259.681, 4),
(80, 579, 155, 181, 1495.38, 2743.28, 10.6747, 295.269, 4),
(83, 518, 155, 181, 1466.52, 2795.7, 10.4135, 151.372, 4),
(84, 487, 155, 155, 1448.8, 2824.75, 10.9863, 270.849, 4),
(86, 409, 155, 155, 1487.08, 2877.61, 10.6225, 180.571, 4),
(87, 521, 155, 155, 1484, 2776.75, 10.3901, 87.9383, 4),
(88, 521, 155, 155, 1459.56, 2762.84, 10.3843, 273.153, 4),
(89, 521, 147, 147, 1457.58, 740.152, 10.5925, 90.6104, 8),
(90, 551, 147, 147, 1414.09, 781.448, 10.621, 270.052, 8),
(91, 551, 147, 147, 1414.01, 774.922, 10.621, 268.41, 8),
(92, 551, 147, 147, 1414.07, 768.533, 10.621, 268.752, 8),
(93, 579, 147, 147, 1413.76, 762.3, 10.754, 269.882, 8),
(94, 579, 147, 147, 1413.59, 755.915, 10.752, 269.41, 8),
(95, 579, 147, 147, 1413.54, 749.466, 10.752, 269.954, 8),
(96, 521, 147, 147, 1457.69, 737.632, 10.5924, 90.793, 8),
(97, 487, 147, 147, 1429.56, 789.264, 11.016, 176.598, 8),
(98, 409, 147, 147, 1454.91, 770.471, 10.62, 89.308, 8),
(99, 521, 147, 147, 1457.39, 766.884, 10.5929, 91.0688, 8),
(106, 521, 0, 0, 1132.45, -2022.23, 68.5701, 269.193, 3),
(107, 521, 0, 0, 1132.38, -2047.09, 68.5782, 268.118, 3),
(108, 521, 147, 147, 1455.2, 761.616, 10.5937, 87.6761, 8),
(126, 521, 128, 128, 2491.76, -1686.63, 13.0834, 0.380131, 12),
(127, 521, 128, 128, 2497.37, -1686.52, 13.0347, 3.53432, 12),
(128, 560, 128, 128, 2507.2, -1684.58, 13.2591, 46.3639, 12),
(129, 518, 128, 128, 2473.65, -1695.62, 13.1871, 0.125814, 12),
(130, 579, 128, 128, 2517.18, -1664.56, 13.9285, 95.8823, 12),
(131, 579, 128, 128, 2506.37, -1650.6, 13.6456, 135.116, 12),
(132, 579, 128, 128, 2516.4, -1672.01, 13.8282, 63.0945, 12),
(133, 409, 128, 128, 2477.04, -1653.24, 13.1943, 90.6297, 12),
(134, 521, 128, 128, 2499.85, -1686.36, 13.0532, 6.44265, 12),
(135, 521, 128, 128, 2489.47, -1686.6, 13.0784, 358.531, 12),
(138, 510, 3, 3, 1697.25, 1364.91, 10.3489, 355.34, 0),
(139, 510, 3, 3, 1689.34, 1369.95, 10.3325, 302.14, 0),
(140, 510, 3, 3, 1701.84, 1364.57, 10.3541, 1.18596, 0),
(141, 510, 3, 3, 1684.34, 1378.37, 10.347, 304.819, 0),
(142, 510, 3, 3, 1711.67, 1363.97, 10.3508, 357.631, 0),
(143, 510, 3, 3, 1704.99, 1364.16, 10.3574, 0.489118, 0),
(144, 510, 3, 3, 1687, 1374.08, 10.3417, 305.488, 0),
(145, 510, 3, 3, 2402.16, 83.626, 26.092, 99.663, 0),
(146, 510, 3, 3, 1708.13, 1363.97, 10.361, 355.087, 0),
(149, 557, 211, 222, 2141.97, -75.162, 3.007, 32.223, 0),
(150, 411, 1, 1, 2343.51, 1518.72, 29.7583, 180.663, 0),
(151, 411, 1, 1, -1676.11, -167.366, 14.148, 42.88, 0),
(170, 462, 1, 1, 1710.27, 1527.86, 10.3539, 183.597, 0),
(171, 462, 1, 1, 1705.41, 1527.35, 10.3525, 178.877, 0),
(172, 462, 1, 1, 1699.08, 1527.23, 10.3572, 178.359, 0),
(173, 462, 1, 1, 1691.22, 1523.55, 10.3596, 244.933, 0),
(174, 462, 1, 1, 1688.44, 1519.3, 10.3663, 235.65, 0),
(175, 462, 1, 1, 1685.67, 1514.98, 10.3661, 231.367, 0),
(176, 444, 227, 221, -2345.12, -1604.95, 484.033, 250.679, 0),
(177, 444, 227, 221, -2350.55, -1619.54, 484.026, 250.822, 0),
(178, 487, 4, 9, 1540.69, 1699.43, 10.9971, 86.2014, 0),
(179, 487, 4, 9, 1541.34, 1718.99, 11.0081, 88.4577, 0),
(180, 487, 28, 4, 1543.53, 1739.57, 10.9971, 89.0607, 0),
(181, 487, 1, 1, 1931.4, -2649.67, 13.7969, 2.83815, 0),
(182, 487, 1, 1, 1947.54, -2648.74, 13.5469, 2.77298, 0),
(183, 593, 1, 1, 1331.01, 1565.21, 11.2801, 273.219, 0),
(184, 593, 1, 1, 1329.14, 1587.91, 11.2793, 277.182, 0),
(185, 487, 1, 1, 1963.33, -2647.49, 13.725, 5.19538, 0),
(186, 513, 5, 41, 1327.64, 1606.62, 11.3723, 270.762, 0),
(187, 513, 23, 23, 1857.76, -2630.66, 14.1006, 6.13626, 0),
(188, 513, 23, 23, 1832.13, -2632.27, 14.0995, 358.232, 0),
(189, 519, 1, 1, 1279.68, 1324.18, 11.7381, 268.011, 0),
(190, 513, 23, 23, 1811.81, -2632.63, 14.1018, 355.494, 0),
(191, 519, 1, 1, 1278.11, 1361.72, 11.7315, 269.617, 0),
(192, 519, 1, 1, 1463.9, -2493.89, 14.4939, 270.524, 0),
(193, 577, 1, 1, 1584.14, 1190.01, 10.7284, 183.29, 0),
(194, 519, 1, 1, 1475.32, -2593.1, 14.4657, 269.523, 0),
(195, 547, 3, 9, 981.777, -918.453, 41.4697, 272.915, 0),
(196, 457, 1, 1, 1854.3, -2396.17, 13.1815, 184.618, 0),
(197, 457, 1, 1, 1689.22, -2443.37, 13.2188, 183.864, 0),
(198, 400, 48, 91, 1174.33, -915.222, 43.4215, 273.17, 0),
(199, 457, 1, 1, 1690.36, -2633.21, 13.2055, 355.445, 0),
(200, 400, 44, 1, 1279.67, -1538.37, 13.6347, 270.775, 0),
(201, 457, 1, 1, 2132.02, -2558.64, 13.1642, 77.9354, 0),
(202, 426, 2, 2, 1938.72, -2089.82, 13.3052, 269.605, 0),
(203, 424, 58, 15, 451.292, -1809.01, 5.32891, 180.976, 0),
(204, 434, 1, 1, 1911.19, -1775.15, 13.3531, 1.35987, 0),
(205, 424, 31, 54, 438.42, -1809.5, 5.32797, 183.745, 0),
(206, 434, 1, 1, 1793.92, -1186.64, 23.8869, 83.2793, 0),
(207, 551, 1, 1, 1573.29, -1037.51, 23.7109, 323.151, 0),
(208, 466, 48, 81, 1616.68, -1123.62, 23.6481, 269.946, 0),
(209, 410, 3, 5, 1066.24, -1306.01, 13.0376, 359.781, 0),
(210, 431, 1, 1, 600.198, -1508.9, 15.2066, 273.672, 0),
(211, 400, 86, 4, 2039.25, 1585.8, 10.7642, 181.218, 0),
(212, 410, 8, 4, 2103.54, 2089.07, 10.5078, 90.0406, 0),
(213, 466, 1, 1, 2181.74, 1821.53, 10.5622, 180.807, 0),
(214, 410, 8, 4, 2009.96, 2456.44, 10.4759, 90.6233, 0),
(216, 410, 1, 1, 2303.69, 1430.29, 42.473, 271.083, 0),
(217, 439, 58, 14, 2204.57, 939.46, 10.7161, 180.014, 0),
(218, 461, 23, 23, 2561.93, 2195.88, 10.4016, 184.316, 0),
(219, 491, 25, 1, 1664.96, 1040, 10.5766, 0.593802, 0),
(220, 538, 11, 11, 1705.74, -1955.86, 13.5391, 258.603, 0),
(221, 473, 1, 1, 1633.36, 571.454, -0.148139, 87.448, 0),
(222, 473, 1, 1, 1622.92, 571.477, -0.260344, 86.185, 0),
(223, 473, 1, 1, 719.597, -1690.24, -0.384179, 181.047, 0),
(224, 473, 1, 1, 719.629, -1703.77, -0.274827, 181.287, 0),
(225, 473, 1, 1, 719.202, -1640.62, -0.222769, 183.385, 0),
(226, 454, 1, 1, 907.528, -1934.81, 0.315487, 101.07, 0),
(227, 522, 1, 1, 1063.45, -1763.6, 12.9573, 269.752, 0),
(228, 426, 1, 1, 1098.24, -1763.85, 13.0942, 89.0447, 0),
(229, 510, 1, 1, 1945.23, -1370.66, 18.1857, 91.5346, 0),
(230, 510, 1, 1, 1945.27, -1375.64, 18.1856, 91.8104, 0),
(231, 510, 1, 1, 1863.83, -1398.38, 13.0867, 257.859, 0),
(234, 510, 5, 4, 1946.66, -1365.07, 18.1857, 89.9064, 0),
(235, 510, 5, 4, 1921.12, -1415.28, 13.1779, 272.135, 0),
(236, 510, 5, 4, 1916.24, -1437.57, 13.1639, 97.2333, 0),
(237, 400, 4, 9, 1287.97, -1018.61, 31.3574, 180.5, 0),
(240, 510, 21, 5, 1947.19, -1365.68, 18.1854, 91.2644, 0),
(241, 446, 58, 94, 142.134, -1809.89, -1.1138, 183.122, 0),
(242, 400, 45, 91, 2352.06, 1433.67, 10.9155, 90.229, 0),
(243, 547, 57, 19, 2588.16, 2046.28, 10.5558, 90.5982, 0),
(244, 487, 49, 13, 2094.32, 2414.97, 74.8421, 269.338, 0),
(245, 400, 95, 8, 1990.97, 1751.3, 19.0263, 180.534, 0),
(246, 410, 49, 51, 2534.28, 919.784, 10.4829, 90.9402, 0),
(247, 410, 49, 51, 2452.18, 1629.23, 10.4736, 0.722562, 0),
(248, 580, 49, 51, 2852.99, 1358.22, 10.6059, 88.8153, 0),
(249, 439, 48, 8, 1987.62, 1751.42, 12.6393, 179.923, 0),
(250, 522, 48, 84, 2669.2, 2749.39, 10.4017, 89.7399, 0),
(251, 466, 48, 84, 1673.04, 1316.53, 10.5622, 179.022, 0);

-- --------------------------------------------------------

--
-- Table structure for table `server_actions`
--

CREATE TABLE `server_actions` (
  `ID` int(11) NOT NULL,
  `Action` int(11) NOT NULL,
  `Userid` int(11) NOT NULL,
  `Amount` int(11) NOT NULL,
  `playerid` int(11) NOT NULL DEFAULT -1,
  `ByPanel` varchar(24) NOT NULL DEFAULT 'None',
  `Reason` varchar(64) NOT NULL DEFAULT 'None',
  `AmountStr` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff_applications`
--

CREATE TABLE `staff_applications` (
  `ID` int(11) NOT NULL,
  `MinLevel` int(11) NOT NULL,
  `MinHours` int(11) NOT NULL,
  `Type` int(11) NOT NULL,
  `Q1` varchar(1024) NOT NULL,
  `Q2` varchar(1024) NOT NULL,
  `Q3` varchar(1024) NOT NULL,
  `Q4` varchar(1024) NOT NULL,
  `Q5` varchar(1024) NOT NULL,
  `Q6` varchar(1024) NOT NULL,
  `Q7` varchar(1024) NOT NULL,
  `Q8` varchar(1024) NOT NULL,
  `Q9` varchar(1024) NOT NULL,
  `Q10` varchar(1024) NOT NULL,
  `Active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff_security`
--

CREATE TABLE `staff_security` (
  `ID` int(11) NOT NULL,
  `Userid` int(11) NOT NULL,
  `Key` varchar(144) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `svf`
--

CREATE TABLE `svf` (
  `ID` int(11) NOT NULL,
  `Model` varchar(50) NOT NULL DEFAULT '-1|-1|-1|-1|-1|-1|-1|-1|-1|-1',
  `X` float NOT NULL,
  `Y` float NOT NULL,
  `Z` float NOT NULL,
  `Color1` varchar(50) NOT NULL DEFAULT '1|1|1|1|1|1|1|1|1|1',
  `Color2` varchar(50) NOT NULL DEFAULT '1|1|1|1|1|1|1|1|1|1',
  `Rank` varchar(50) NOT NULL DEFAULT '1|1|1|1|1|1|1|1|1|1',
  `Stock` varchar(50) NOT NULL DEFAULT '0|0|0|0|0|0|0|0|0|0',
  `Faction` int(11) NOT NULL,
  `vX` float NOT NULL,
  `vY` float NOT NULL,
  `vZ` float NOT NULL,
  `vR` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `svf`
--

INSERT INTO `svf` (`ID`, `Model`, `X`, `Y`, `Z`, `Color1`, `Color2`, `Rank`, `Stock`, `Faction`, `vX`, `vY`, `vZ`, `vR`) VALUES
(1, '598|523|599|411|522|497|-1|-1|-1|-1', 2337.18, 2459, 14.9742, '0|0|0|1|0|0|0|0|0|0', '1|1|1|0|1|1|1|1|1|1', '1|1|1|3|3|4|1|1|1|1', '10|5|3|2|2|2|1|0|0|0', 1, 2311.91, 2450.51, 10.5474, 178.901),
(2, '596|523|599|411|522|497|-1|-1|-1|-1	', 1561.08, -1620.28, 13.5469, '0|0|0|1|0|0|0|0|0|0', '1|1|1|0|1|1|1|1|1|1', '1|1|1|3|3|4|1|1|1|1', '10|5|3|2|2|2|1|0|0|0', 2, 1567.4, -1627.47, 13.1099, 90.5636),
(3, '438|426|560|487|-1|-1|-1|-1|-1|-1', 984.903, 1733.23, 8.65488, '6|6|6|6|1|1|1|1|1|1', '6|6|6|1|1|1|1|1|1|1', '1|1|3|4|1|1|1|1|1|1', '10|10|5|1|0|0|0|0|0|0', 5, 951.467, 1751.09, 8.3537, 271.097),
(4, '416|599|563|-1|-1|-1|-1|-1|-1|-1', 1599.67, 1815.63, 10.8203, '3|3|1|1|1|1|1|1|1|1', '1|1|1|1|1|1|1|1|1|1', '1|2|3|1|1|1|1|1|1|1', '10|5|2|0|0|0|0|0|0|0', 6, 1605.33, 1851.12, 10.9527, 179.859),
(6, '551|560|487|-1|-1|-1|-1|-1|-1|-1', 1172.64, 1364.11, 10.8125, '191|191|191|1|1|1|1|1|1|1', '191|191|191|1|1|1|1|1|1|1', '1|2|3|1|1|1|1|1|1|1', '15|5|5|0|0|0|0|0|0|0', 7, 1174.28, 1370.8, 10.5253, 271.488),
(7, '469|487|402|560|521|-1|-1|-1|-1|-1', 1059.64, -345.897, 73.9922, '181|181|181|181|181|1|1|1|1|1', '181|181|181|181|181|1|1|1|1|1', '1|3|1|3|2|1|1|1|1|1', '15|5|10|5|5|0|0|0|0|0', 9, 1041.37, -355.912, 73.7192, 89.9106),
(8, '582|488|-1|-1|-1|-1|-1|-1|-1|-1', -311.926, 1539.23, 75.5625, '1|1|1|1|1|1|1|1|1|1', '220|220|1|1|1|1|1|1|1|1', '1|3|1|1|1|1|1|1|1|1', '15|5|0|0|0|0|0|0|0|0', 10, -327.247, 1515.66, 75.4165, 0.397137),
(9, '598|470|522|425|433|-1|-1|-1|-1|-1', 207.041, 1921.3, 17.6406, '0|0|0|1|0|0|0|0|0|0', '1|1|1|0|1|1|1|1|1|1', '1|1|2|3|2|1|1|1|1|1', '10|5|2|2|2|0|0|0|0|0', 11, 177.668, 1917.15, 17.7636, 89.9955);

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `ID` int(11) NOT NULL,
  `Status` int(11) NOT NULL,
  `Username` text NOT NULL,
  `Type` int(11) NOT NULL,
  `Priority` text NOT NULL,
  `Description` text NOT NULL,
  `Date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `turfs`
--

CREATE TABLE `turfs` (
  `ID` int(11) NOT NULL,
  `MinX` float NOT NULL,
  `MinY` float NOT NULL,
  `MaxX` float NOT NULL,
  `MaxY` float NOT NULL,
  `Team` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `turfs`
--

INSERT INTO `turfs` (`ID`, `MinX`, `MinY`, `MaxX`, `MaxY`, `Team`) VALUES
(1, 2487, 2516.5, 2909, 2887.5, 8),
(2, 2487, 2142.5, 2909, 2513.5, 8),
(3, 2487, 1771.5, 2909, 2142.5, 8),
(4, 2487, 1400.5, 2909, 1771.5, 8),
(5, 2487, 1029.5, 2909, 1400.5, 8),
(6, 2486, 586.5, 2909, 1029.5, 8),
(7, 2064, 593.5, 2487, 1036.5, 8),
(8, 1641, 593.5, 2064, 1036.5, 8),
(9, 1218, 593.5, 1641, 1036.5, 8),
(10, 1218, 1036.5, 1641, 1479.5, 8),
(11, 794, 1025.5, 1218, 1479.5, 4),
(12, 794, 1479.5, 1218, 1933.5, 4),
(13, 794, 1933.5, 1218, 2387.5, 4),
(14, 1217, 1479.5, 1641, 1933.5, 4),
(15, 1218, 1933.5, 1642, 2387.5, 4),
(16, 1641, 1933.5, 2065, 2387.5, 4),
(17, 1641, 1479.5, 2065, 1933.5, 4),
(18, 1641, 1036.5, 2064, 1479.5, 8),
(19, 2064, 1036.5, 2487, 1479.5, 8),
(20, 2064, 1479.5, 2487, 1922.5, 4),
(21, 2064, 1922.5, 2487, 2365.5, 4),
(22, 2064, 2360.5, 2487, 2884.5, 4),
(23, 1642, 2384.5, 2065, 2884.5, 4),
(24, 1218, 2387.5, 1641, 2887.5, 4),
(25, 2531.95, -1400.47, 2953.95, -1029.47, 12),
(26, 2531.95, -1769.47, 2953.95, -1398.47, 12),
(27, 2532.95, -2141.47, 2954.95, -1770.47, 12),
(28, 2532.94, -2513.47, 2954.94, -2142.47, 12),
(29, 2110.94, -2513.47, 2532.94, -2142.47, 12),
(30, 1687.92, -2779.46, 2109.92, -2408.46, 12),
(31, 1265.92, -2779.46, 1687.92, -2408.46, 12),
(32, 1265.92, -2407.46, 1687.92, -2036.46, 3),
(33, 2108.95, -2142.47, 2533.95, -1770.47, 12),
(34, 2108.95, -1771.47, 2532.95, -1398.47, 12),
(35, 2108.95, -1398.47, 2530.95, -1027.47, 12),
(36, 1687.92, -2407.46, 2109.92, -2036.46, 12),
(37, 951.906, -2426.46, 1264.91, -2036.46, 3),
(38, 842.922, -2036.46, 1264.92, -1665.46, 3),
(39, 1264.94, -2037.47, 1686.94, -1666.47, 3),
(40, 20.9062, -1314.45, 419.906, -945.445, 3),
(41, 417.898, -1338.46, 839.898, -952.457, 3),
(42, 1685.88, -1204.43, 2109.88, -831.434, 12),
(43, 1686.94, -2037.47, 2108.94, -1666.47, 12),
(44, 1261.89, -1202.43, 1683.89, -831.435, 3),
(45, 839.898, -1202.44, 1261.9, -831.443, 3),
(46, 417.898, -1688.42, 840.898, -1339.42, 3),
(47, 420.912, -2059.43, 842.912, -1688.43, 3),
(48, 1686.95, -1664.44, 2108.95, -1204.44, 12),
(49, 17.8976, -1688.44, 417.898, -1314.44, 3),
(50, 1262.92, -1666.45, 1686.92, -1202.45, 3),
(51, 839.906, -1665.45, 1263.91, -1201.45, 3),
(52, 19.9005, -2060.43, 419.901, -1689, 3);

-- --------------------------------------------------------

--
-- Table structure for table `unban-panel`
--

CREATE TABLE `unban-panel` (
  `ID` int(11) NOT NULL,
  `Now` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `updates`
--

CREATE TABLE `updates` (
  `ID` int(11) NOT NULL,
  `text` varchar(200) NOT NULL,
  `byAdmin` varchar(24) NOT NULL,
  `For` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `password` varchar(65) NOT NULL DEFAULT 'none',
  `name` varchar(24) NOT NULL DEFAULT 'none',
  `Level` int(11) NOT NULL DEFAULT 1,
  `Admin` int(11) NOT NULL,
  `Model` int(11) NOT NULL DEFAULT 250,
  `Language` int(11) NOT NULL,
  `Email` varchar(48) NOT NULL DEFAULT 'None',
  `PremiumPoints` int(11) NOT NULL,
  `Slot` int(11) NOT NULL DEFAULT 2,
  `Hidden` int(11) NOT NULL,
  `House` int(11) NOT NULL DEFAULT -1,
  `Bussines` int(11) NOT NULL DEFAULT -1,
  `Rentroom` int(11) NOT NULL DEFAULT -1,
  `Spawnchange` int(11) NOT NULL,
  `Status` int(11) NOT NULL,
  `Phone` int(11) NOT NULL,
  `Credit` int(11) NOT NULL,
  `PhoneBook` int(11) NOT NULL,
  `JobSkill` varchar(50) NOT NULL DEFAULT '1|1|1|1|1|1|1|1|1|1|1|1|1|1|1',
  `JobSkillPoints` varchar(50) NOT NULL DEFAULT '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0',
  `Job` int(11) NOT NULL,
  `Experience` int(11) NOT NULL,
  `RegisterDate` varchar(50) NOT NULL DEFAULT 'None',
  `Connected` int(11) NOT NULL,
  `DriveLicense` int(11) NOT NULL DEFAULT -1,
  `Warn` int(11) NOT NULL,
  `Premium` int(11) NOT NULL,
  `Tutorial` int(11) NOT NULL,
  `Member` int(11) NOT NULL,
  `Rank` int(11) NOT NULL,
  `Hud` varchar(50) NOT NULL DEFAULT '0|0|0',
  `Color` int(11) NOT NULL,
  `VIP` int(11) NOT NULL,
  `Helper` int(11) NOT NULL,
  `TotalHelps` int(11) NOT NULL,
  `TodayHelps` int(11) NOT NULL,
  `TotalReports` int(11) NOT NULL,
  `TodayReports` int(11) NOT NULL,
  `LastOn` varchar(50) NOT NULL DEFAULT 'None',
  `Skins` varchar(150) NOT NULL DEFAULT '250|-1|-1|-1|-1|-1|-1|-1|-1|-1|-1|-1|-1|-1|-1|-1|-1|-1|-1|-1|-1|-1|-1|-1|-1|-1|-1|-1|-1|-1',
  `Money` varchar(30) NOT NULL DEFAULT '50000',
  `Bank` varchar(30) NOT NULL DEFAULT '10000',
  `Clan` int(11) NOT NULL DEFAULT 0,
  `ClanRank` int(11) NOT NULL DEFAULT 1,
  `ClanTag` int(11) NOT NULL DEFAULT 2,
  `ClanMoney` int(11) NOT NULL,
  `ClanWarns` int(11) NOT NULL,
  `ClanDays` int(11) NOT NULL,
  `Mute` int(11) NOT NULL,
  `Wanted` int(11) NOT NULL,
  `Jail` int(11) NOT NULL,
  `PIN` int(11) NOT NULL,
  `FWarn` int(11) NOT NULL,
  `Days` int(11) NOT NULL,
  `Referral` int(11) NOT NULL,
  `Age` int(11) NOT NULL,
  `Mats` int(11) NOT NULL,
  `Neon` varchar(50) NOT NULL DEFAULT '0|0|0|0|0|0',
  `WTalkie` int(11) NOT NULL,
  `Freq` int(11) NOT NULL,
  `Crime` varchar(34) NOT NULL,
  `CrimeReport` varchar(24) NOT NULL,
  `IP` varchar(16) NOT NULL DEFAULT 'None',
  `Punish` int(11) NOT NULL,
  `Raport` varchar(50) NOT NULL DEFAULT '0|0|0|0',
  `RaportExpire` int(11) NOT NULL,
  `FlyLicense` int(11) NOT NULL DEFAULT -1,
  `BoatLicense` int(11) NOT NULL DEFAULT -1,
  `WeaponLicense` int(11) NOT NULL DEFAULT -1,
  `FlySuspend` int(11) NOT NULL DEFAULT -1,
  `WeaponSuspend` int(11) NOT NULL DEFAULT -1,
  `BoatSuspend` int(11) NOT NULL DEFAULT -1,
  `Rainbow` int(11) NOT NULL,
  `PhoneStatus` int(11) NOT NULL,
  `Missions` varchar(50) NOT NULL DEFAULT '0|0|0|0|0|0|0|0|0',
  `DailyQuest` int(11) NOT NULL,
  `GiftPoints` int(11) NOT NULL,
  `RobExp` int(11) NOT NULL,
  `PetLevel` int(11) NOT NULL DEFAULT 1,
  `PetExp` int(11) NOT NULL DEFAULT 0,
  `PetStatus` int(11) NOT NULL DEFAULT 1,
  `PetName` varchar(30) NOT NULL,
  `Pet` int(11) NOT NULL DEFAULT 0,
  `Crates` varchar(50) NOT NULL DEFAULT '0|0|0|0|0|0|0',
  `JobOwner` int(11) NOT NULL,
  `Drugs` int(11) NOT NULL,
  `DrivingSuspend` int(11) NOT NULL DEFAULT -1,
  `Gender` int(11) NOT NULL,
  `Quest` varchar(70) NOT NULL DEFAULT '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0',
  `AccountBlocked` int(11) NOT NULL DEFAULT -1,
  `Drink` float NOT NULL,
  `Hunger` float NOT NULL,
  `Items` varchar(300) NOT NULL DEFAULT '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0',
  `Backpack` float NOT NULL DEFAULT 0,
  `FWorks` int(11) NOT NULL,
  `JailType` int(11) NOT NULL,
  `ItemsType` varchar(250) NOT NULL DEFAULT '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0',
  `ItemSlotType` varchar(128) NOT NULL DEFAULT '-1|-1|-1|-1|-1|-1|-1|-1|-1|-1|-1|-1|-1|-1|-1|-1|-1|-1|-1|-1|-1|-1|-1|-1|-1|-1|-1|-1|-1|-1|',
  `panelStyle` int(11) NOT NULL,
  `FP` int(11) NOT NULL,
  `panelclass` varchar(24) NOT NULL DEFAULT 'none',
  `forumID` int(11) NOT NULL,
  `AdminWarn` int(11) NOT NULL,
  `LeaderWarn` int(11) NOT NULL,
  `HelperWarn` int(11) NOT NULL,
  `YouTube` int(11) NOT NULL,
  `quests` varchar(128) NOT NULL DEFAULT '0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0',
  `Attached` varchar(50) NOT NULL DEFAULT '-1|-1|-1|-1',
  `HavePet` tinyint(1) NOT NULL,
  `ServerPoints` int(11) NOT NULL,
  `JobGoal` int(11) NOT NULL,
  `vouchers` varchar(144) NOT NULL DEFAULT '0 0 0 0 0 0 0 0 0 0',
  `guns` varchar(144) NOT NULL DEFAULT '0 0 0 0 0',
  `BPExp` int(11) NOT NULL,
  `GoldPass` int(11) NOT NULL,
  `Tier` int(11) NOT NULL,
  `missions_bp` varchar(128) DEFAULT '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0',
  `JobBoost` int(11) NOT NULL,
  `JobProcent` int(11) NOT NULL,
  `bp_claimed` varchar(144) NOT NULL DEFAULT '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0',
  `Tog` varchar(144) NOT NULL DEFAULT '1 1 1 1 1 1 1 1 0 0 0 0 0 0 0',
  `Playing` int(11) NOT NULL,
  `WeekPlaying` int(11) NOT NULL,
  `Note` varchar(1024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `atm`
--
ALTER TABLE `atm`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `bans`
--
ALTER TABLE `bans`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `bussines`
--
ALTER TABLE `bussines`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `chat_log`
--
ALTER TABLE `chat_log`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `clans`
--
ALTER TABLE `clans`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `clanvehicles`
--
ALTER TABLE `clanvehicles`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `commands`
--
ALTER TABLE `commands`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `dsvehicle`
--
ALTER TABLE `dsvehicle`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `factions`
--
ALTER TABLE `factions`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `faction_apply`
--
ALTER TABLE `faction_apply`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `faction_logs`
--
ALTER TABLE `faction_logs`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `faction_questions`
--
ALTER TABLE `faction_questions`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `friends`
--
ALTER TABLE `friends`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `helper_applications`
--
ALTER TABLE `helper_applications`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `houses`
--
ALTER TABLE `houses`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ip_emails`
--
ALTER TABLE `ip_emails`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ip_panel`
--
ALTER TABLE `ip_panel`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `leader_applications`
--
ALTER TABLE `leader_applications`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `market`
--
ALTER TABLE `market`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `panel_actions`
--
ALTER TABLE `panel_actions`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `panel_applications`
--
ALTER TABLE `panel_applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `panel_complaints`
--
ALTER TABLE `panel_complaints`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `panel_functions`
--
ALTER TABLE `panel_functions`
  ADD PRIMARY KEY (`funcID`);

--
-- Indexes for table `panel_logs`
--
ALTER TABLE `panel_logs`
  ADD PRIMARY KEY (`logID`);

--
-- Indexes for table `panel_questions`
--
ALTER TABLE `panel_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `panel_reply_complaints`
--
ALTER TABLE `panel_reply_complaints`
  ADD PRIMARY KEY (`replyID`);

--
-- Indexes for table `panel_reply_tickets`
--
ALTER TABLE `panel_reply_tickets`
  ADD PRIMARY KEY (`replyID`);

--
-- Indexes for table `panel_reply_unbans`
--
ALTER TABLE `panel_reply_unbans`
  ADD PRIMARY KEY (`replyID`);

--
-- Indexes for table `panel_settings`
--
ALTER TABLE `panel_settings`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `panel_shop`
--
ALTER TABLE `panel_shop`
  ADD PRIMARY KEY (`itemID`);

--
-- Indexes for table `panel_suspend`
--
ALTER TABLE `panel_suspend`
  ADD PRIMARY KEY (`spID`);

--
-- Indexes for table `panel_tickets`
--
ALTER TABLE `panel_tickets`
  ADD PRIMARY KEY (`ticketID`);

--
-- Indexes for table `panel_topics`
--
ALTER TABLE `panel_topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `panel_unbans`
--
ALTER TABLE `panel_unbans`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `panel_updates`
--
ALTER TABLE `panel_updates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `panel_videos`
--
ALTER TABLE `panel_videos`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `safezone`
--
ALTER TABLE `safezone`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `security`
--
ALTER TABLE `security`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `seif`
--
ALTER TABLE `seif`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `servervehicle`
--
ALTER TABLE `servervehicle`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `server_actions`
--
ALTER TABLE `server_actions`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `staff_applications`
--
ALTER TABLE `staff_applications`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `staff_security`
--
ALTER TABLE `staff_security`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `svf`
--
ALTER TABLE `svf`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `turfs`
--
ALTER TABLE `turfs`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `updates`
--
ALTER TABLE `updates`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `atm`
--
ALTER TABLE `atm`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bans`
--
ALTER TABLE `bans`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bussines`
--
ALTER TABLE `bussines`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_log`
--
ALTER TABLE `chat_log`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clans`
--
ALTER TABLE `clans`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clanvehicles`
--
ALTER TABLE `clanvehicles`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `commands`
--
ALTER TABLE `commands`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `dsvehicle`
--
ALTER TABLE `dsvehicle`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `factions`
--
ALTER TABLE `factions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `faction_apply`
--
ALTER TABLE `faction_apply`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faction_logs`
--
ALTER TABLE `faction_logs`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faction_questions`
--
ALTER TABLE `faction_questions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `friends`
--
ALTER TABLE `friends`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `helper_applications`
--
ALTER TABLE `helper_applications`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `houses`
--
ALTER TABLE `houses`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `ip_emails`
--
ALTER TABLE `ip_emails`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ip_panel`
--
ALTER TABLE `ip_panel`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `leader_applications`
--
ALTER TABLE `leader_applications`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `market`
--
ALTER TABLE `market`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `panel_actions`
--
ALTER TABLE `panel_actions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `panel_applications`
--
ALTER TABLE `panel_applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `panel_complaints`
--
ALTER TABLE `panel_complaints`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `panel_functions`
--
ALTER TABLE `panel_functions`
  MODIFY `funcID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `panel_logs`
--
ALTER TABLE `panel_logs`
  MODIFY `logID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `panel_questions`
--
ALTER TABLE `panel_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `panel_reply_complaints`
--
ALTER TABLE `panel_reply_complaints`
  MODIFY `replyID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `panel_reply_tickets`
--
ALTER TABLE `panel_reply_tickets`
  MODIFY `replyID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `panel_reply_unbans`
--
ALTER TABLE `panel_reply_unbans`
  MODIFY `replyID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `panel_shop`
--
ALTER TABLE `panel_shop`
  MODIFY `itemID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `panel_suspend`
--
ALTER TABLE `panel_suspend`
  MODIFY `spID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `panel_tickets`
--
ALTER TABLE `panel_tickets`
  MODIFY `ticketID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `panel_unbans`
--
ALTER TABLE `panel_unbans`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `panel_updates`
--
ALTER TABLE `panel_updates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `panel_videos`
--
ALTER TABLE `panel_videos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `safezone`
--
ALTER TABLE `safezone`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `security`
--
ALTER TABLE `security`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seif`
--
ALTER TABLE `seif`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `servervehicle`
--
ALTER TABLE `servervehicle`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;

--
-- AUTO_INCREMENT for table `server_actions`
--
ALTER TABLE `server_actions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `staff_applications`
--
ALTER TABLE `staff_applications`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_security`
--
ALTER TABLE `staff_security`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `svf`
--
ALTER TABLE `svf`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `turfs`
--
ALTER TABLE `turfs`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `updates`
--
ALTER TABLE `updates`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
