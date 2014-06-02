-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2014 at 11:16 AM
-- Server version: 5.6.11
-- PHP Version: 5.5.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `alliance`
--
CREATE DATABASE IF NOT EXISTS `alliance` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `alliance`;

-- --------------------------------------------------------

--
-- Table structure for table `effort`
--

CREATE TABLE IF NOT EXISTS `effort` (
  `effort_id` int(11) NOT NULL AUTO_INCREMENT,
  `mem_id` int(11) NOT NULL,
  `jan` float NOT NULL DEFAULT '0',
  `feb` float NOT NULL DEFAULT '0',
  `mar` float NOT NULL DEFAULT '0',
  `apr` float NOT NULL DEFAULT '0',
  `may` float NOT NULL DEFAULT '0',
  `jun` float NOT NULL DEFAULT '0',
  `jul` float NOT NULL DEFAULT '0',
  `aug` float DEFAULT '0',
  `sep` float NOT NULL DEFAULT '0',
  `oct` float NOT NULL DEFAULT '0',
  `nov` float NOT NULL DEFAULT '0',
  `dec` float NOT NULL DEFAULT '0',
  `year` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`effort_id`),
  KEY `mem_id` (`mem_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=61 ;

--
-- Dumping data for table `effort`
--

INSERT INTO `effort` (`effort_id`, `mem_id`, `jan`, `feb`, `mar`, `apr`, `may`, `jun`, `jul`, `aug`, `sep`, `oct`, `nov`, `dec`, `year`) VALUES
(1, 1, 0, 0.25, 0.5, 0.75, 1, 0, 0.25, 0.5, 0.75, 1, 1, 1, 2014),
(2, 2, 0, 0.25, 0.5, 0.75, 1, 1, 1, 0.5, 0.25, 1, 1, 0, 2014),
(3, 3, 0.25, 1, 0, 0, 0.5, 0, 0.25, 0, 0.75, 0.5, 1, 1, 2014),
(4, 1, 2.3, 4.4, 4.4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 1, 6.2, 4.4, 4.4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, 4, 7.2, 7.2, 7.2, 7.2, 7.2, 7.2, 7.2, 7.2, 7.2, 7.2, 7.2, 7.2, 7),
(7, 16, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7),
(8, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2014),
(9, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2014),
(10, 14, 0.25, 0.25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2014),
(11, 20, 0.75, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2014),
(12, 21, 0.25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2014),
(13, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2014),
(14, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2014),
(15, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2014),
(16, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2014),
(17, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2014),
(18, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2014),
(19, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2014),
(20, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2014),
(21, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2013),
(22, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2014),
(23, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2014),
(24, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2013),
(25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2013),
(26, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2014),
(27, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2013),
(28, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2014),
(29, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2014),
(30, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2014),
(31, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2013),
(32, 5, 0, 0.75, 1, 0, 0, 0, 0, 0, 0, 0.75, 0.75, 0, 2013),
(33, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2014),
(34, 10, 0.25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.25, 2014),
(35, 17, 0.25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.25, 2014),
(36, 17, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2014),
(37, 17, 0, 1, 1, 0.75, 0, 0, 0, 0, 0, 0, 0, 0, 2014),
(38, 28, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2014),
(39, 20, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2014),
(40, 6, 0.75, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2014),
(41, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2014),
(42, 26, 0.75, 0, 1, 0, 0.75, 0, 0, 0, 0, 0, 0.5, 0, 2014),
(43, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2014),
(44, 32, 0.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2014),
(45, 33, 0.5, 0.5, 0, 0, 0, 0, 0, 0, 0, 0, 0.5, 0, 2014),
(46, 33, 0.5, 0.5, 0, 0, 0, 0, 0, 0, 0, 0, 0.5, 0, 2014),
(47, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2013),
(48, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2013),
(49, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.25, 2014),
(50, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.25, 2014),
(51, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2014),
(52, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2014),
(53, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.5, 2014),
(54, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.5, 2014),
(55, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.25, 2014),
(56, 28, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 2014),
(57, 13, 0, 1, 0.5, 0.75, 0.5, 0.25, 1, 0.25, 0, 0, 0, 0, 2014),
(58, 13, 0, 1, 0.5, 0.75, 0.5, 0.25, 1, 0.25, 0, 0, 0, 0, 2014),
(59, 13, 0, 1, 0.5, 0.75, 0.5, 0.25, 1, 0.25, 0, 0, 0, 0, 2014),
(60, 24, 0, 0.5, 0.75, 0.5, 0.5, 0.25, 0.25, 0.5, 0, 0, 0, 0, 2014);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `EmpIDNum` int(8) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(60) NOT NULL,
  `MiddleName` varchar(60) NOT NULL,
  `LastName` varchar(60) NOT NULL,
  `BusinessUnit` enum('Local','JPIndependent','Alliance','ROW') NOT NULL,
  `DateHired` date NOT NULL,
  `YearsITIndustry` int(8) NOT NULL,
  `CollegeSchool1` varchar(60) NOT NULL,
  `CollegeSchool2` varchar(60) NOT NULL,
  `CollegeCourse1` varchar(60) NOT NULL,
  `CollegeCourse2` varchar(60) NOT NULL,
  `CollegeYear` int(8) NOT NULL,
  `JobTitles` varchar(60) NOT NULL,
  `NRIBatch` int(8) NOT NULL,
  PRIMARY KEY (`EmpIDNum`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`EmpIDNum`, `FirstName`, `MiddleName`, `LastName`, `BusinessUnit`, `DateHired`, `YearsITIndustry`, `CollegeSchool1`, `CollegeSchool2`, `CollegeCourse1`, `CollegeCourse2`, `CollegeYear`, `JobTitles`, `NRIBatch`) VALUES
(1, 'Ma.Nelle', 'C', 'Yap', 'Local', '2014-05-27', 0, '', '', '', '', 0, '', 0),
(2, 'Jay', 'A', 'Balunan', 'Local', '2014-05-14', 0, '', '', '', '', 0, '', 0),
(3, 'John Wilbert', 'N', 'Lim', 'Local', '2014-05-14', 0, '', '', '', '', 0, '', 0),
(4, 'Carl', 'S', 'Tan', 'Local', '2014-05-21', 0, '', '', '', '', 0, '', 0),
(5, 'Michael', 'V', 'Ymbong', 'Local', '2014-05-21', 0, '', '', '', '', 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `employee_gen`
--

CREATE TABLE IF NOT EXISTS `employee_gen` (
  `empgen_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) NOT NULL,
  `effortgen_id` int(11) NOT NULL,
  PRIMARY KEY (`empgen_id`),
  KEY `emp_id` (`emp_id`),
  KEY `effortgen_id` (`effortgen_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gen_effort`
--

CREATE TABLE IF NOT EXISTS `gen_effort` (
  `gen_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `jan` float NOT NULL DEFAULT '0',
  `feb` float NOT NULL DEFAULT '0',
  `mar` float NOT NULL DEFAULT '0',
  `apr` float NOT NULL DEFAULT '0',
  `may` float NOT NULL DEFAULT '0',
  `jun` float NOT NULL DEFAULT '0',
  `jul` float NOT NULL DEFAULT '0',
  `aug` float NOT NULL DEFAULT '0',
  `sep` float NOT NULL DEFAULT '0',
  `oct` float NOT NULL DEFAULT '0',
  `nov` float NOT NULL DEFAULT '0',
  `dec` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`gen_id`),
  KEY `emp_id` (`emp_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `gen_effort`
--

INSERT INTO `gen_effort` (`gen_id`, `emp_id`, `year`, `jan`, `feb`, `mar`, `apr`, `may`, `jun`, `jul`, `aug`, `sep`, `oct`, `nov`, `dec`) VALUES
(1, 3, 2013, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 3, 2014, 10, 11, 1, 0.75, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 1, 2014, 2, 0, 1, 0, 0.75, 0, 0, 0, 0, 0, 0.5, 3.5),
(4, 2, 2014, 2.25, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 4, 2014, 0, 3, 1.5, 2.25, 1.5, 0.75, 3, 0.75, 0, 0, 0, 0),
(6, 5, 2014, 1, 1.5, 0.75, 0.5, 0.5, 0.25, 0.25, 0.5, 0, 0, 1, 0.5),
(7, 1, 2013, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE IF NOT EXISTS `member` (
  `mem_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) NOT NULL,
  PRIMARY KEY (`mem_id`),
  KEY `emp_id` (`emp_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`mem_id`, `emp_id`) VALUES
(1, 1),
(3, 1),
(10, 1),
(11, 1),
(14, 1),
(15, 1),
(20, 1),
(21, 1),
(26, 1),
(2, 2),
(4, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(19, 2),
(27, 2),
(28, 2),
(32, 2),
(5, 3),
(12, 3),
(17, 3),
(22, 3),
(23, 3),
(13, 4),
(18, 4),
(25, 4),
(31, 4),
(16, 5),
(24, 5),
(29, 5),
(30, 5),
(33, 5);

-- --------------------------------------------------------

--
-- Table structure for table `memlist`
--

CREATE TABLE IF NOT EXISTS `memlist` (
  `memlist_id` int(11) NOT NULL AUTO_INCREMENT,
  `mem_id` int(11) NOT NULL,
  `proj_id` int(11) NOT NULL,
  PRIMARY KEY (`memlist_id`),
  KEY `mem_id` (`mem_id`),
  KEY `proj_id` (`proj_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=78 ;

--
-- Dumping data for table `memlist`
--

INSERT INTO `memlist` (`memlist_id`, `mem_id`, `proj_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 3, 1),
(6, 5, 1),
(7, 3, 4),
(8, 3, 4),
(19, 3, 1),
(22, 3, 1),
(50, 6, 5),
(51, 7, 5),
(52, 8, 5),
(53, 9, 5),
(54, 10, 5),
(55, 11, 5),
(56, 12, 2),
(57, 13, 2),
(58, 14, 5),
(59, 15, 2),
(60, 16, 5),
(61, 17, 5),
(62, 18, 5),
(63, 19, 5),
(64, 20, 3),
(65, 21, 3),
(66, 22, 4),
(67, 23, 3),
(68, 24, 2),
(69, 25, 1),
(70, 26, 6),
(71, 27, 3),
(72, 28, 2),
(73, 29, 3),
(74, 30, 1),
(75, 31, 6),
(76, 32, 6),
(77, 33, 6);

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE IF NOT EXISTS `project` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(60) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `business_unit` varchar(60) NOT NULL,
  `type` varchar(60) NOT NULL,
  `status` varchar(60) NOT NULL,
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`project_id`, `project_name`, `start_date`, `end_date`, `business_unit`, `type`, `status`) VALUES
(1, 'Login Security', '2013-11-18', '2014-05-07', '', 'T&M', 'ongoing'),
(2, 'Alliance ISMIS', '2014-02-02', '2014-08-08', '', 'project based', 'closed'),
(3, 'Alliance RMS', '2014-05-14', '2014-09-18', '', 'T&M', 'ongoing'),
(4, 'Project Outlook', '2014-05-28', '2015-03-06', '', 'project based', 'closed'),
(5, 'asdas', '2014-05-10', '2014-05-16', 'local', 'project based', 'ongoing'),
(6, 'AA', '2014-05-10', '2014-05-17', 'local', 'project based', 'ongoing');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `effort`
--
ALTER TABLE `effort`
  ADD CONSTRAINT `mem_eff` FOREIGN KEY (`mem_id`) REFERENCES `member` (`mem_id`);

--
-- Constraints for table `employee_gen`
--
ALTER TABLE `employee_gen`
  ADD CONSTRAINT `effortgen_effort` FOREIGN KEY (`effortgen_id`) REFERENCES `effort` (`effort_id`),
  ADD CONSTRAINT `emp_empgen` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`EmpIDNum`);

--
-- Constraints for table `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `emp_member` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`EmpIDNum`);

--
-- Constraints for table `memlist`
--
ALTER TABLE `memlist`
  ADD CONSTRAINT `mem_memlist` FOREIGN KEY (`mem_id`) REFERENCES `member` (`mem_id`),
  ADD CONSTRAINT `proj_memlist` FOREIGN KEY (`proj_id`) REFERENCES `project` (`project_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
