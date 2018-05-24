-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 03, 2017 at 06:16 PM
-- Server version: 10.1.24-MariaDB
-- PHP Version: 7.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dvd`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cus_id` int(11) NOT NULL,
  `dvd_id` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `rent_date` date NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cus_id`, `dvd_id`, `firstname`, `lastname`, `rent_date`, `phone`, `address`) VALUES
(1, 5, 'Joanne J', 'Suarez', '2017-05-08', '580-387-6265', '292 Trainer Avenue\r\nTalbott, IL 61546'),
(2, 3, 'Sammie G.', 'McCluskey', '2017-06-07', '880-691-8213', '8661 Ritter Avenue\r\nRomeo, MI 38067'),
(3, 4, 'Rosa', 'Baker', '2017-06-22', '678-319-0857', '543 White Oak Drive\r\nUnion Star, MO 64494'),
(4, 2, 'David', 'Chacko', '2017-07-26', '517-925-8508', '3333 Hillcrest Circle\r\nCrystal, MN 55429'),
(5, 1, 'Timmy', 'Boatright', '2017-08-01', '210-437-8770', '2828 Grove Avenue\r\nStillwater, OK 74074');

-- --------------------------------------------------------

--
-- Table structure for table `dvd_detail`
--

CREATE TABLE `dvd_detail` (
  `dvd_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  `person_dvd_id` int(11) NOT NULL,
  `dvd_name` varchar(50) DEFAULT NULL,
  `rent_day` int(11) NOT NULL,
  `Release_date` date NOT NULL,
  `dvd_writer` varchar(50) NOT NULL,
  `dvd_songs` varchar(50) NOT NULL,
  `collection` varchar(50) NOT NULL,
  `time_duration` varchar(50) NOT NULL,
  `Awards` int(11) NOT NULL,
  `Award_year` int(11) NOT NULL,
  `certificate` varchar(255) NOT NULL,
  `rating` decimal(9,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dvd_detail`
--

INSERT INTO `dvd_detail` (`dvd_id`, `person_id`, `genre_id`, `person_dvd_id`, `dvd_name`, `rent_day`, `Release_date`, `dvd_writer`, `dvd_songs`, `collection`, `time_duration`, `Awards`, `Award_year`, `certificate`, `rating`) VALUES
(1, 1, 1, 1, 'The Hangover', 0, '2009-06-12', 'Scott Moore', '1', '$ 277,313,371 (USA)', '1h 40min', 7, 2010, '15', '7.80'),
(2, 2, 2, 2, 'Dunkirk', 0, '2017-07-21', 'Christopher Nolan', '2', '$104,641,608 (USA)', '1h 46min', 2, 2017, '12A', '8.50'),
(3, 3, 5, 3, 'Notebook', 0, '2004-06-25', 'Jeremy Leven', '2', '$64,286 (USA)', '2h 3min', 4, 2004, '12A', '7.90'),
(4, 4, 2, 4, 'The Dark Knight', 0, '2008-07-24', 'Christopher Nolan', '1', '$533,316,061 (USA)', '2h 32min', 151, 2009, '12', '9.00'),
(5, 5, 4, 5, 'Interstellar', 0, '2014-11-07', 'Christopher Nolan', '4', '$187,991,439', '2h 49min ', 41, 2014, '12A', '8.60');

-- --------------------------------------------------------

--
-- Table structure for table `dvd_genre`
--

CREATE TABLE `dvd_genre` (
  `dvd_genre_id` int(11) NOT NULL,
  `dvd_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dvd_genre`
--

INSERT INTO `dvd_genre` (`dvd_genre_id`, `dvd_id`, `genre_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 5),
(4, 4, 2),
(5, 5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `genre_id` int(11) NOT NULL,
  `dvd_genre_id` int(11) NOT NULL,
  `genre_type` varchar(50) NOT NULL,
  `movies` int(11) NOT NULL,
  `target_audience` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`genre_id`, `dvd_genre_id`, `genre_type`, `movies`, `target_audience`) VALUES
(1, 1, 'Comedy', 2, 'All'),
(2, 2, 'Action', 3, '16+'),
(3, 3, 'Horror', 1, '18+'),
(4, 4, 'Drama', 2, 'All'),
(5, 5, 'Romantic', 2, '18+');

-- --------------------------------------------------------

--
-- Table structure for table `movie_person`
--

CREATE TABLE `movie_person` (
  `person_id` int(11) NOT NULL,
  `dvd_id` int(11) NOT NULL,
  `person_dvd_id` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `sex` varchar(50) NOT NULL,
  `DOB` date NOT NULL,
  `Country` varchar(50) NOT NULL,
  `Type` varchar(50) NOT NULL,
  `bio` varchar(50) DEFAULT NULL,
  `movies` int(11) NOT NULL,
  `Hit_movie_name` varchar(50) NOT NULL,
  `genre_id` int(11) NOT NULL,
  `Awards` varchar(50) DEFAULT NULL,
  `experience` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movie_person`
--

INSERT INTO `movie_person` (`person_id`, `dvd_id`, `person_dvd_id`, `firstname`, `lastname`, `sex`, `DOB`, `Country`, `Type`, `bio`, `movies`, `Hit_movie_name`, `genre_id`, `Awards`, `experience`) VALUES
(1, 1, 1, 'Bradley', 'Cooper', 'Male', '1975-01-05', 'USA', 'Actor', NULL, 2, 'The Hangover', 1, 'Gold Derby Awards', 12),
(2, 2, 2, 'Aneurin', 'Barnard', 'Male', '1987-05-18', 'UK', 'Actor', NULL, 1, 'Dunkirk', 2, 'Ashland Independent Film Festival', 5),
(3, 3, 3, 'Rachel', 'McAdams', 'Female', '1987-11-17', 'Canada', 'Actress', NULL, 3, 'Notebook', 3, 'Gemini Awards', 13),
(4, 4, 4, 'Christian', 'Bale', 'Male', '1947-01-30', 'UK', 'Actor', NULL, 5, 'The Dark Knight', 2, 'Academy Awards, USA', 18),
(5, 5, 5, 'Anne', 'Hathaway', 'Female', '1982-11-12', 'USA', 'Actress', NULL, 10, 'Interstellar', 4, 'Golden Globes, USA', 14);

-- --------------------------------------------------------

--
-- Table structure for table `person_dvd`
--

CREATE TABLE `person_dvd` (
  `person_dvd_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `dvd_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `person_dvd`
--

INSERT INTO `person_dvd` (`person_dvd_id`, `person_id`, `dvd_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cus_id`),
  ADD KEY `FK_dvdd_id` (`dvd_id`);

--
-- Indexes for table `dvd_detail`
--
ALTER TABLE `dvd_detail`
  ADD PRIMARY KEY (`dvd_id`),
  ADD KEY `FK_person_id` (`person_id`),
  ADD KEY `FK_genree_id` (`genre_id`),
  ADD KEY `FK_person_dvd2_id` (`person_dvd_id`);

--
-- Indexes for table `dvd_genre`
--
ALTER TABLE `dvd_genre`
  ADD PRIMARY KEY (`dvd_genre_id`),
  ADD KEY `FK_dvvd_id` (`dvd_id`),
  ADD KEY `FK_genrre_id` (`genre_id`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`genre_id`);

--
-- Indexes for table `movie_person`
--
ALTER TABLE `movie_person`
  ADD PRIMARY KEY (`person_id`),
  ADD UNIQUE KEY `UC_person` (`person_id`),
  ADD KEY `FK_dvd_id` (`dvd_id`),
  ADD KEY `FK_dvvds_id` (`person_dvd_id`);

--
-- Indexes for table `person_dvd`
--
ALTER TABLE `person_dvd`
  ADD PRIMARY KEY (`person_dvd_id`),
  ADD KEY `FK_persons_id` (`person_id`),
  ADD KEY `FK_dvds_id` (`dvd_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `FK_dvdd_id` FOREIGN KEY (`dvd_id`) REFERENCES `dvd_detail` (`dvd_id`);

--
-- Constraints for table `dvd_detail`
--
ALTER TABLE `dvd_detail`
  ADD CONSTRAINT `FK_genree_id` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`genre_id`),
  ADD CONSTRAINT `FK_person_id` FOREIGN KEY (`person_id`) REFERENCES `movie_person` (`person_id`);

--
-- Constraints for table `dvd_genre`
--
ALTER TABLE `dvd_genre`
  ADD CONSTRAINT `FK_dvvd_id` FOREIGN KEY (`dvd_id`) REFERENCES `dvd_detail` (`dvd_id`),
  ADD CONSTRAINT `FK_genrre_id` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`genre_id`);

--
-- Constraints for table `person_dvd`
--
ALTER TABLE `person_dvd`
  ADD CONSTRAINT `FK_dvds_id` FOREIGN KEY (`dvd_id`) REFERENCES `dvd_detail` (`dvd_id`),
  ADD CONSTRAINT `FK_persons_id` FOREIGN KEY (`person_id`) REFERENCES `movie_person` (`person_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
