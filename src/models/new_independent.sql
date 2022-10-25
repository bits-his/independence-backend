-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 25, 2022 at 06:22 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `new_independent`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `content` (IN `_query_type` VARCHAR(50), IN `_id` INT(5), IN `_user_id` INT(5), IN `_content_id` INT(5), IN `_clearance_concise` VARCHAR(50), IN `_culture` VARCHAR(20), IN `_presentable` VARCHAR(50), IN `_nationality` VARCHAR(30), IN `_status` VARCHAR(20), IN `_type` VARCHAR(20))  BEGIN
IF _query_type = 'CREATE' THEN
	INSERT INTO `content` (
    user_id ,
    content_id ,
    clearance_concise ,
    culture ,
    presentable ,
    nationality ,
    status ,
    type

    ) VALUES(
    _user_id ,
    _content_id ,
    _clearance_concise ,
    _culture ,
    _presentable ,
    _nationality ,
    _status ,
    _type    
    );
    
    ELSEIF _query_type = "UPDATE" THEN
  UPDATE content  SET user_id = _user_id,
    content_id = _content_id,
    clearance_concise = _clearance_concise,
    culture = _culture,
    presentable = _presentable,
    nationality = _nationality,
    status = _status,
    type = _type WHERE id = _id;
    
    ELSEIF _query_type = "SELECT-ALL" THEN
    SELECT *  FROM `content`;
    
    ELSEIF _query_type = "SELECT" THEN
    SELECT * FROM `content` WHERE id = _id;
    
    ELSEIF _query_type = "DELETE" THEN 
    DELETE FROM `content` WHERE id = _id;
    
    
    
END IF;


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `login_signup` (IN `_query_type` VARCHAR(50), IN `_id` INT(5), IN `_first_name` VARCHAR(30), IN `_last_name` VARCHAR(30), IN `_user_name` VARCHAR(30), IN `_email` VARCHAR(30), IN `_password` VARCHAR(20), IN `_role` VARCHAR(20), IN `_Status` VARCHAR(30))  BEGIN
IF _query_type = 'SIGNUP' THEN
	INSERT INTO `users` (
   id ,
    first_name ,
    last_name ,
    user_name ,
    email ,
    password ,
    role ,
    Status 

    ) VALUES(
   _id ,
    _first_name ,
    _last_name ,
    _user_name ,
    _email ,
    _password ,
    _role ,
    _Status 
    );
    
    ELSEIF _query_type = "LOGIN" THEN
    SELECT * FROM `users` WHERE   email=_email AND password=_password  ;
    
    ELSEIF _query_type = "DELETE" THEN
    DELETE FROM `users` WHERE id = _id;
    
    ELSEIF _query_type = "UPDATE" THEN
    UPDATE `users` 
    SET 
    id=_id,
    first_name = _first_name,
          last_name = _last_name,
          user_name = _user_name,
          email = _email,
          password = _password,
          role = _role ,
          status = _status
          WHERE id=_id;
         
         
          
          ELSEIF _query_type = "SELECT-ALL" THEN
          SELECT * FROM `users`; 

    
    
    
END IF;


END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_id` int(5) DEFAULT NULL,
  `clearance_concise` varchar(30) DEFAULT NULL,
  `nationality` varchar(20) DEFAULT NULL,
  `culture` varchar(20) DEFAULT NULL,
  `presentable` varchar(30) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `upload`
--

CREATE TABLE `upload` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tittle` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `video` blob NOT NULL,
  `link` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_no` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone_no`, `password`, `role`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 'musa', 'muhd', 'musa@gmail.com', '567890', '$2a$10$A9aBULts9JKYKHrfLt.8HO9GLHZlTrbfNz4RxVIplZYYBa6XxfxdK', 'judge', 'pending', '2022-10-25 15:23:11', '2022-10-25 15:23:11');

-- --------------------------------------------------------

--
-- Table structure for table `usersx`
--

CREATE TABLE `usersx` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_no` int(11) NOT NULL,
  `password` varchar(50) NOT NULL,
  `status` varchar(30) DEFAULT NULL,
  `role` varchar(30) DEFAULT NULL,
  `updatedAt` datetime NOT NULL,
  `createdAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usersx`
--

INSERT INTO `usersx` (`id`, `first_name`, `last_name`, `user_name`, `email`, `phone_no`, `password`, `status`, `role`, `updatedAt`, `createdAt`) VALUES
(1, 'abdulsalam', 'abubakar', '', 'abdulsalamabubakar2023@gmail.com', 81676776, '$2a$10$uCX7/g0tZwuF.p4IqkQ4J.RVbTHL22QBnuE8rZd5rg0', 'pending', 'judge', '2022-10-25 15:20:13', '2022-10-25 15:20:13'),
(2, 'musa', 'muhammad', '', 'musa@gmail.com', 9890, '$2a$10$xmqp7JSKK1e/YARS1.2AlepZsvUd7zO/DizvOFJwHpH', 'pending', 'judge', '2022-10-25 15:21:21', '2022-10-25 15:21:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `upload`
--
ALTER TABLE `upload`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usersx`
--
ALTER TABLE `usersx`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `content`
--
ALTER TABLE `content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `upload`
--
ALTER TABLE `upload`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `usersx`
--
ALTER TABLE `usersx`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `content`
--
ALTER TABLE `content`
  ADD CONSTRAINT `content_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `usersx` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `upload`
--
ALTER TABLE `upload`
  ADD CONSTRAINT `upload_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `usersx` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
