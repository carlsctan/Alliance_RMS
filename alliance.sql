-- phpMyAdmin SQL Dump
-- version 4.2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 30, 2014 at 12:34 PM
-- Server version: 5.6.17-log
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `alliance`
--

-- --------------------------------------------------------

--
-- Table structure for table `effort`
--

CREATE TABLE IF NOT EXISTS `effort` (
`effort_id` int(11) NOT NULL,
  `mem_id` int(11) DEFAULT NULL,
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
  `year` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `effort`
--

INSERT INTO `effort` (`effort_id`, `mem_id`, `jan`, `feb`, `mar`, `apr`, `may`, `jun`, `jul`, `aug`, `sep`, `oct`, `nov`, `dec`, `year`) VALUES
(1, 1, 0, 0.25, 0.5, 0.75, 1, 0, 0.25, 0.5, 0.75, 1, 1, 1, 2014),
(2, 2, 0, 0.25, 0.5, 0.75, 1, 1, 1, 0.5, 0.25, 1, 1, 0, 2014),
(3, 3, 0.25, 1, 0, 0, 0.5, 0, 0.25, 0, 0.75, 0.5, 1, 1, 2014),
(6, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 6, 0.25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2014),
(8, 7, 0.25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2014),
(9, 7, 0, 0.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2015),
(10, 8, 0, 0.5, 0.5, 0.5, 0, 0, 0, 0, 0, 0, 0, 0, 2014);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
`EmpIDNum` int(8) NOT NULL,
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
  `NRIBatch` int(8) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`EmpIDNum`, `FirstName`, `MiddleName`, `LastName`, `BusinessUnit`, `DateHired`, `YearsITIndustry`, `CollegeSchool1`, `CollegeSchool2`, `CollegeCourse1`, `CollegeCourse2`, `CollegeYear`, `JobTitles`, `NRIBatch`) VALUES
(1, 'Ma.Nelle', 'C', 'Yap', 'JPIndependent', '2014-05-27', 0, '', '', '', '', 0, '', 0),
(2, 'Jay', 'A', 'Balunan', 'Local', '2014-05-14', 0, '', '', '', '', 0, '', 0),
(3, 'John Wilbert', 'N', 'Lim', 'Alliance', '2014-05-14', 0, '', '', '', '', 0, '', 0),
(4, 'Carl', 'S', 'Tan', 'JPIndependent', '2014-05-21', 0, '', '', '', '', 0, '', 0),
(5, 'Michael', 'V', 'Ymbong', 'ROW', '2014-05-21', 0, '', '', '', '', 0, '', 0),
(6, 'TEST', 'TEST', 'TSET', 'JPIndependent', '2014-05-15', 2, 'TEST', 'TEST', '', '', 4, '', 0),
(7, 'TESTing', 'TEST', 'TEST', 'Alliance', '2014-05-07', 1, 'ASD', 'asd', '', '', 2, '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee_gen`
--

CREATE TABLE IF NOT EXISTS `employee_gen` (
`empgen_id` int(11) NOT NULL,
  `emp_id` int(8) NOT NULL,
  `effortgen_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `employee_gen`
--

INSERT INTO `employee_gen` (`empgen_id`, `emp_id`, `effortgen_id`) VALUES
(1, 1, 1),
(2, 2, 3),
(3, 3, 2),
(4, 4, 3),
(5, 5, 1),
(6, 7, 6),
(7, 6, 6);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE IF NOT EXISTS `member` (
`mem_id` int(11) NOT NULL,
  `emp_id` int(8) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`mem_id`, `emp_id`) VALUES
(1, 1),
(3, 1),
(6, 1),
(7, 1),
(2, 2),
(4, 2),
(5, 3),
(8, 6);

-- --------------------------------------------------------

--
-- Table structure for table `memlist`
--

CREATE TABLE IF NOT EXISTS `memlist` (
`memlist_id` int(11) NOT NULL,
  `mem_id` int(8) NOT NULL,
  `proj_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `memlist`
--

INSERT INTO `memlist` (`memlist_id`, `mem_id`, `proj_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 6, 3),
(5, 7, 4),
(6, 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE IF NOT EXISTS `project` (
`project_id` int(11) NOT NULL,
  `project_name` varchar(60) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` varchar(60) NOT NULL,
  `business_unit` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`project_id`, `project_name`, `start_date`, `end_date`, `status`, `business_unit`, `type`) VALUES
(1, 'Login Security', '2013-11-18', '2014-05-07', 'ongoing', NULL, NULL),
(2, 'Alliance ISMIS', '2014-02-02', '2014-08-08', 'closed', NULL, NULL),
(3, 'Alliance RMS', '2014-05-14', '2014-09-18', 'ongoing', NULL, NULL),
(4, 'Project Outlook', '2014-05-28', '2015-03-06', 'closed', NULL, NULL),
(5, 'Resource', '2014-05-02', '2013-09-19', 'ongoing', 'local', 'project based');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `effort`
--
ALTER TABLE `effort`
 ADD PRIMARY KEY (`effort_id`), ADD KEY `mem_id` (`mem_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
 ADD PRIMARY KEY (`EmpIDNum`);

--
-- Indexes for table `employee_gen`
--
ALTER TABLE `employee_gen`
 ADD PRIMARY KEY (`empgen_id`), ADD KEY `emp_id` (`emp_id`), ADD KEY `effortgen_id` (`effortgen_id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
 ADD PRIMARY KEY (`mem_id`), ADD KEY `emp_id` (`emp_id`);

--
-- Indexes for table `memlist`
--
ALTER TABLE `memlist`
 ADD PRIMARY KEY (`memlist_id`), ADD KEY `mem_id` (`mem_id`), ADD KEY `proj_id` (`proj_id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
 ADD PRIMARY KEY (`project_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `effort`
--
ALTER TABLE `effort`
MODIFY `effort_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
MODIFY `EmpIDNum` int(8) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `employee_gen`
--
ALTER TABLE `employee_gen`
MODIFY `empgen_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
MODIFY `mem_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `memlist`
--
ALTER TABLE `memlist`
MODIFY `memlist_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
MODIFY `project_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
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
