-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 23, 2019 at 12:41 AM
-- Server version: 10.4.11-MariaDB-1:10.4.11+maria~bionic
-- PHP Version: 7.2.24-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sila`
--

-- --------------------------------------------------------

--
-- Table structure for table `Brand`
--

CREATE TABLE `Brand` (
  `brand_id` int(10) UNSIGNED NOT NULL,
  `brand_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Brand`
--

INSERT INTO `Brand` (`brand_id`, `brand_name`) VALUES
(1, 'abv'),
(2, 'zxc');

-- --------------------------------------------------------

--
-- Table structure for table `Order`
--

CREATE TABLE `Order` (
  `order_id` int(10) UNSIGNED NOT NULL,
  `order_sum` decimal(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Order`
--

INSERT INTO `Order` (`order_id`, `order_sum`) VALUES
(1, '136.34'),
(2, '136.46'),
(3, '123.34');

-- --------------------------------------------------------

--
-- Table structure for table `Order_Item`
--

CREATE TABLE `Order_Item` (
  `item_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `model_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Order_Item`
--

INSERT INTO `Order_Item` (`item_id`, `order_id`, `model_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 2, 201),
(4, 1, 201),
(5, 3, 201);

-- --------------------------------------------------------

--
-- Table structure for table `Product`
--

CREATE TABLE `Product` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `brand_id` int(10) UNSIGNED NOT NULL,
  `product_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Product`
--

INSERT INTO `Product` (`product_id`, `brand_id`, `product_name`) VALUES
(1, 1, 'asdfg'),
(2, 1, 'zxcvb'),
(3, 2, 'asdfgasdf'),
(4, 2, 'zxcvbzxcvb'),
(201, 2, 'asdf-qwer-zxcv');

-- --------------------------------------------------------

--
-- Table structure for table `Product_Model`
--

CREATE TABLE `Product_Model` (
  `model_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `model_price` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Product_Model`
--

INSERT INTO `Product_Model` (`model_id`, `product_id`, `model_price`) VALUES
(1, 1, '13.00'),
(2, 2, '13.12'),
(3, 3, '13.12'),
(4, 3, '9.42'),
(5, 201, '9.42'),
(6, 201, '94.20'),
(7, 201, '13.99'),
(8, 201, '4.20'),
(9, 201, '23.99'),
(201, 4, '123.34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Brand`
--
ALTER TABLE `Brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `Order`
--
ALTER TABLE `Order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `Order_Item`
--
ALTER TABLE `Order_Item`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `model_id` (`model_id`);

--
-- Indexes for table `Product`
--
ALTER TABLE `Product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `brand_id` (`brand_id`);

--
-- Indexes for table `Product_Model`
--
ALTER TABLE `Product_Model`
  ADD PRIMARY KEY (`model_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Order_Item`
--
ALTER TABLE `Order_Item`
  ADD CONSTRAINT `Order_Item_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `Order` (`order_id`),
  ADD CONSTRAINT `Order_Item_ibfk_2` FOREIGN KEY (`model_id`) REFERENCES `Product_Model` (`model_id`);

--
-- Constraints for table `Product`
--
ALTER TABLE `Product`
  ADD CONSTRAINT `Product_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `Brand` (`brand_id`);

--
-- Constraints for table `Product_Model`
--
ALTER TABLE `Product_Model`
  ADD CONSTRAINT `Product_Model_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `Product` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

SELECT * FROM `Order`
INNER JOIN `Order_Item`
  ON `Order_Item`.`order_id` = `Order`.`order_id`
ORDER by `Order`.`order_sum`;

SELECT `Product_Model`.`model_price` AS `m_p`,
       `Product`.`product_name` AS `p_n`,
       `Brand`.`brand_name` AS `b_n`
FROM `Product_Model`
INNER JOIN `Product` ON `Product`.`product_id` = `Product_Model`.`product_id`
  INNER JOIN `Brand` ON `Brand`.`brand_id` = `Product`.`brand_id`
ORDER BY `p_n`, `m_p`;