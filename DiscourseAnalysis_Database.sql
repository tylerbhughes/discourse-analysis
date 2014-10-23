-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 24, 2014 at 12:46 AM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `discourseanalysis`
--
CREATE DATABASE IF NOT EXISTS `discourseanalysis` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `discourseanalysis`;

-- --------------------------------------------------------

--
-- Table structure for table `conjunctions`
--

DROP TABLE IF EXISTS `conjunctions`;
CREATE TABLE IF NOT EXISTS `conjunctions` (
  `conjunction` varchar(25) NOT NULL,
  `listName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `conjunctions`
--

INSERT INTO `conjunctions` (`conjunction`, `listName`) VALUES
('Default Conjunction List', 'ACCORDINGLY'),
('Default Conjunction List', 'ALSO'),
('Default Conjunction List', 'ALTHOUGH'),
('Default Conjunction List', 'AND'),
('Default Conjunction List', 'AS'),
('Default Conjunction List', 'AS A RESULT'),
('Default Conjunction List', 'AS LONG AS'),
('Default Conjunction List', 'AS SOON AS'),
('Default Conjunction List', 'AT THE SAME TIME AS'),
('Default Conjunction List', 'BECAUSE'),
('Default Conjunction List', 'BUT'),
('Default Conjunction List', 'BY THAT MEANS'),
('Default Conjunction List', 'BY THIS MEANS'),
('Default Conjunction List', 'CONSEQUENTLY'),
('Default Conjunction List', 'CONVERSELY'),
('Default Conjunction List', 'EITHER'),
('Default Conjunction List', 'ELSE'),
('Default Conjunction List', 'EVEN IF'),
('Default Conjunction List', 'EVEN THOUGH'),
('Default Conjunction List', 'EXCEPT IF'),
('Default Conjunction List', 'EXCEPT THAT'),
('Default Conjunction List', 'FOR'),
('Default Conjunction List', 'FOR THE PURPOSE THAT'),
('Default Conjunction List', 'FOR THIS REASON'),
('Default Conjunction List', 'HENCE'),
('Default Conjunction List', 'IF'),
('Default Conjunction List', 'IN AS MUCH AS'),
('Default Conjunction List', 'IN ORDER THAT'),
('Default Conjunction List', 'IN THAT MANNER'),
('Default Conjunction List', 'IN THIS MANNER'),
('Default Conjunction List', 'INASMUCH AS'),
('Default Conjunction List', 'INDEED'),
('Default Conjunction List', 'INSTEAD'),
('Default Conjunction List', 'JUST AS'),
('Default Conjunction List', 'LEST'),
('Default Conjunction List', 'LIKEWISE'),
('Default Conjunction List', 'MOREOVER'),
('Default Conjunction List', 'NEITHER'),
('Default Conjunction List', 'NEVERTHELESS'),
('Default Conjunction List', 'NOR'),
('Default Conjunction List', 'NOTWITHSTANDING'),
('Default Conjunction List', 'NOW'),
('Default Conjunction List', 'ON THE CONTRARY'),
('Default Conjunction List', 'ON THE OTHER HAND'),
('Default Conjunction List', 'ONLY'),
('Default Conjunction List', 'ONLY IF'),
('Default Conjunction List', 'OR'),
('Default Conjunction List', 'OR ELSE'),
('Default Conjunction List', 'OTHERWISE'),
('Default Conjunction List', 'SINCE'),
('Default Conjunction List', 'SO'),
('Default Conjunction List', 'SO THAT'),
('Default Conjunction List', 'STILL'),
('Default Conjunction List', 'SUCH THAT'),
('Default Conjunction List', 'THAN'),
('Default Conjunction List', 'THAT'),
('Default Conjunction List', 'THEN'),
('Default Conjunction List', 'THEREFORE'),
('Default Conjunction List', 'THOUGH'),
('Default Conjunction List', 'THUS'),
('Default Conjunction List', 'TILL'),
('Default Conjunction List', 'TO THE END THAT'),
('Default Conjunction List', 'UNLESS'),
('Default Conjunction List', 'UNTIL'),
('Default Conjunction List', 'WHEN'),
('Default Conjunction List', 'WHENEVER'),
('Default Conjunction List', 'WHERE'),
('Default Conjunction List', 'WHEREVER'),
('Default Conjunction List', 'WHETHER'),
('Default Conjunction List', 'WHILE'),
('Default Conjunction List', 'X'),
('Default Conjunction List', 'YET');

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
CREATE TABLE IF NOT EXISTS `files` (
  `owner` varchar(40) NOT NULL,
  `projectName` varchar(35) NOT NULL,
  `fileName` varchar(35) NOT NULL,
  `storedFileName` varchar(50) NOT NULL,
  `public` tinyint(1) NOT NULL DEFAULT '0',
  `lastUpdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `files`:
--   `owner`
--       `usersinfo` -> `username`
--

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`owner`, `projectName`, `fileName`, `storedFileName`, `public`, `lastUpdate`) VALUES
('admin', 'Luke - Full & Not Parsed', 'Luke (Full).txt', '1726454456b7d19ecb919490765.txt', 0, '2014-10-20 15:07:25'),
('admin', 'Luke - Full & Parsed', 'Luke (Full) Parsed.xml', '98765446df6614542184843041.txt', 0, '2014-10-21 17:34:14'),
('user', 'Luke - Short & Parsed', 'Luke (Short) Parsed.txt', '136295446e62cdb6ef585089036.txt', 0, '2014-10-21 18:03:08');

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
CREATE TABLE IF NOT EXISTS `permission` (
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(40) NOT NULL,
  `fileName` varchar(50) NOT NULL,
  `edit` tinyint(1) NOT NULL,
  `read` tinyint(1) NOT NULL,
  `delete` tinyint(1) NOT NULL,
  `add` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
CREATE TABLE IF NOT EXISTS `session` (
  `username` varchar(40) NOT NULL,
  `startTime` datetime NOT NULL,
  `endtime` datetime NOT NULL,
`sessionID` int(15) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`username`, `startTime`, `endtime`, `sessionID`) VALUES
('user', '2014-10-04 21:39:45', '2014-10-04 21:39:47', 1),
('user', '2014-10-20 22:16:34', '2014-10-20 22:19:05', 2),
('admin', '2014-10-20 22:19:22', '2014-10-20 22:19:44', 3),
('user', '2014-10-20 22:20:13', '2014-10-20 22:20:22', 4),
('user', '2014-10-20 23:06:06', '2014-10-20 23:06:15', 5),
('user', '2014-10-21 18:02:51', '2014-10-21 18:03:13', 6),
('admin', '2014-10-23 17:35:18', '2014-10-23 17:38:24', 7),
('admin', '2014-10-23 17:38:53', '2014-10-23 17:40:55', 8);

-- --------------------------------------------------------

--
-- Table structure for table `tempusersinfo`
--

DROP TABLE IF EXISTS `tempusersinfo`;
CREATE TABLE IF NOT EXISTS `tempusersinfo` (
  `confirm_code` varchar(65) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(75) NOT NULL,
  `name` varchar(50) NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `usersinfo`
--

DROP TABLE IF EXISTS `usersinfo`;
CREATE TABLE IF NOT EXISTS `usersinfo` (
  `username` varchar(40) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(75) NOT NULL,
  `name` varchar(50) NOT NULL,
  `firstName` varchar(25) NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usersinfo`
--

INSERT INTO `usersinfo` (`username`, `password`, `email`, `name`, `firstName`, `admin`) VALUES
('admin', '$2y$10$/gMa82nHTsYaqCKjvXvmhuVqylwoLLaH6UBLVMuBBPGIDGAf6glxu', 'admin@email.com', 'Administrator', 'Administrator', 1),
('user', '$2y$10$/gMa82nHTsYaqCKjvXvmhuVqylwoLLaH6UBLVMuBBPGIDGAf6glxu', 'user@gmail.com', 'John Doe', 'John', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `conjunctions`
--
ALTER TABLE `conjunctions`
 ADD PRIMARY KEY (`conjunction`,`listName`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
 ADD PRIMARY KEY (`owner`,`projectName`), ADD KEY `fk_owner` (`owner`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
 ADD PRIMARY KEY (`username`,`fileName`), ADD KEY `fk_filename` (`fileName`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
 ADD PRIMARY KEY (`sessionID`), ADD KEY `fk_username` (`username`);

--
-- Indexes for table `tempusersinfo`
--
ALTER TABLE `tempusersinfo`
 ADD PRIMARY KEY (`username`);

--
-- Indexes for table `usersinfo`
--
ALTER TABLE `usersinfo`
 ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `session`
--
ALTER TABLE `session`
MODIFY `sessionID` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `files`
--
ALTER TABLE `files`
ADD CONSTRAINT `fk_owner` FOREIGN KEY (`owner`) REFERENCES `usersinfo` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
