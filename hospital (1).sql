-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2019 at 05:43 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `hospital` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `first_name`, `last_name`, `gender`, `email`, `is_staff`, `hospital`) VALUES
(10424296, '$2y$10$/qB8n9QnRLLCJIH0oysbh.xNFuT2Cdvwo30/c7bClKR.pcj8d/AFS', 'Carlington1', 'Juruvenge', '', 'cjuruvenge@gmail.com', 0, 'Harare Hospital'),
(10650878, '$2y$10$UHlG.4TynjfyikmGIBuIm./plQK37B4PySLh7jyYKKrwp7PzCSsre', 'John', 'Doe', 'Male', 'jdoe@gmail.com', 1, 'Parirenyatwa'),
(10891707, '$2y$10$f/w3PHn6GbYg9Uw8siSi7.NEpaTCGOAxLKRDdMKFPFXV2FDUUqpfm', 'Aaron', 'Mayendesa', '', 'amayendesa@gmail.com', 0, 'Chitungwiza Hospital'),
(10972892, '$2y$10$eSIec0OU6GZD2w9yEUYE9euckcmTpOcXF3NU3AzXQZb5EcvFj1upK', 'Millicent', 'Kabade', '', 'kabade@gmail.com', 0, 'Karanda');

-- --------------------------------------------------------

--
-- Table structure for table `med_history`
--

CREATE TABLE `med_history` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `description` text,
  `doctor` varchar(20) NOT NULL,
  `added_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `med_history`
--

INSERT INTO `med_history` (`id`, `patient_id`, `description`, `doctor`, `added_date`) VALUES
(10164527, 10687770, 'Flue', 'Mayendesa', '2019-11-04'),
(10344666, 10211705, 'headeahe', 'Zunza', '2019-11-04');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `id` int(11) NOT NULL,
  `id_no` varchar(20) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  `blood_type` varchar(30) NOT NULL,
  `address` text NOT NULL,
  `hospital` varchar(100) NOT NULL,
  `date_added` date NOT NULL,
  `nok_fname` varchar(100) NOT NULL,
  `nok_lname` varchar(30) NOT NULL,
  `nok_address` text NOT NULL,
  `nok_email` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`id`, `id_no`, `fname`, `lname`, `email`, `dob`, `blood_type`, `address`, `hospital`, `date_added`, `nok_fname`, `nok_lname`, `nok_address`, `nok_email`) VALUES
(10211705, '63-127E75', 'Jane ', 'Doe', 'Jndoe@gmail.com', '2018-01-09', 'AB', '		                 		3rd street\r\n		                 	', 'Karanda', '2019-11-04', 'Tom', 'Doe', '		                 		4th street\r\n		                 	', 'tdoe@gmail.com'),
(10687770, '63-128C80', 'John', 'Doe', 'jdoe@gmail.com', '2018-10-03', 'A', '		                 		1st street\r\n		                 	', 'Harare Hospital', '2019-11-04', 'Tom', 'Doe', '		                 		2nd street\r\n		                 	', 'tdoe@gmail.com'),
(10825778, '63-458C90', 'Tom', 'Doe', 'tdoe@gmail.com', '2019-11-01', 'A', '		                 		2nd street\r\n		                 	', 'Parirenyatwa', '2019-11-04', 'john', 'Doe', '		                 		1st street\r\n		                 	', 'jdoe@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `med_history`
--
ALTER TABLE `med_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_no` (`id_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10972893;

--
-- AUTO_INCREMENT for table `med_history`
--
ALTER TABLE `med_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10344667;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10825779;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `med_history`
--
ALTER TABLE `med_history`
  ADD CONSTRAINT `med_history_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
