-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 11, 2021 at 02:00 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `CatId` int(11) NOT NULL,
  `CategoryName` varchar(255) CHARACTER SET latin1 NOT NULL,
  `image` varchar(300) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`CatId`, `CategoryName`, `image`) VALUES
(3, 'Meat', 'meat.jpg'),
(4, 'Fruits', 'fruit.jpg'),
(5, 'Vegetables', 'vegetables-1.jpg'),
(6, 'Cooking Oil', 'oil.png'),
(7, 'Milk', 'milk.png'),
(8, 'Beverages', 'beverages.jpg'),
(9, 'Flour', 'flour.png'),
(10, 'Snacks', 'snacks.jpg'),
(11, 'Spices', 'spice.png');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `C_Name` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `username` varchar(50) CHARACTER SET latin1 NOT NULL,
  `C_Phone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `C_Cnic` varchar(13) CHARACTER SET latin1 DEFAULT NULL,
  `C_Debtcard` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `Address` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `C_Pass` varchar(8) CHARACTER SET latin1 DEFAULT NULL,
  `Status` varchar(5) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `C_Name`, `username`, `C_Phone`, `C_Cnic`, `C_Debtcard`, `Address`, `C_Pass`, `Status`) VALUES
(1, 'Abdul Samad', 'root', '00000000000000000', '0000000000', 'nill', 'nill', 'toor', 'Activ');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `Customer_Id` int(11) NOT NULL,
  `OrderDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `Customer_Id`, `OrderDate`) VALUES
(1, 1, '2020-02-02'),
(2, 1, '2020-02-02'),
(3, 1, '2020-02-11'),
(4, 1, '2020-02-11'),
(5, 1, '2020-02-11'),
(6, 1, '2020-02-11'),
(7, 1, '2020-02-11'),
(8, 1, '2020-02-11'),
(9, 1, '2020-02-11'),
(10, 1, '2020-02-18'),
(11, 1, '2021-06-11');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`) VALUES
(1, 1, 3),
(2, 2, 2),
(3, 3, 2),
(4, 3, 3),
(5, 4, 3),
(6, 4, 2),
(7, 5, 3),
(8, 5, 2),
(9, 6, 3),
(10, 6, 2),
(11, 7, 3),
(12, 7, 2),
(13, 8, 7),
(14, 8, 32),
(15, 9, 8),
(16, 9, 24),
(17, 9, 21),
(18, 10, 14),
(19, 11, 19);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `CategoryId` int(11) NOT NULL,
  `Product_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `Product_SPrice` int(20) NOT NULL,
  `Product_BPrice` varchar(20) CHARACTER SET latin1 NOT NULL,
  `Product_Qty` int(20) NOT NULL,
  `min_qty` int(11) NOT NULL,
  `Shipment_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `CategoryId`, `Product_name`, `Product_SPrice`, `Product_BPrice`, `Product_Qty`, `min_qty`, `Shipment_Date`) VALUES
(2, 6, 'Dalda', 560, '510', 300, 10, '2020-02-02'),
(3, 8, 'Pepsi', 650, '570', 400, 201, '2020-02-01'),
(4, 6, 'habib', 570, '520', 300, 10, '2020-02-02'),
(5, 6, 'meezan', 600, '520', 300, 10, '2020-02-02'),
(6, 6, 'sufi', 580, '520', 300, 10, '2020-02-02'),
(7, 3, 'chicken', 170, '120', 300, 10, '2020-02-02'),
(8, 3, 'beef', 270, '220', 300, 10, '2020-02-02'),
(9, 3, 'mutton', 370, '320', 300, 10, '2020-02-02'),
(10, 3, 'salmon', 470, '420', 300, 10, '2020-02-02'),
(11, 3, 'tuna', 570, '520', 300, 10, '2020-02-02'),
(12, 4, 'apple', 120, '100', 300, 10, '2020-02-02'),
(13, 4, 'banana', 70, '40', 300, 10, '2020-02-02'),
(14, 4, 'grapes', 170, '120', 300, 10, '2020-02-02'),
(15, 4, 'mango', 270, '220', 300, 10, '2020-02-02'),
(16, 5, 'green chilli', 120, '100', 300, 10, '2020-02-02'),
(17, 5, 'onion', 100, '80', 300, 10, '2020-02-02'),
(18, 5, 'potato', 220, '200', 300, 10, '2020-02-02'),
(19, 7, 'cow milk', 1000, '950', 300, 10, '2020-02-02'),
(20, 7, 'camel milk', 1500, '1400', 300, 10, '2020-02-02'),
(21, 7, 'goat milk', 1300, '1200', 300, 10, '2020-02-02'),
(22, 8, 'dew', 650, '570', 300, 10, '2020-02-02'),
(23, 8, 'miranda', 650, '570', 300, 10, '2020-02-02'),
(24, 8, 'red bull', 1000, '950', 300, 10, '2020-02-02'),
(25, 9, 'wheat flour', 650, '570', 300, 10, '2020-02-02'),
(26, 9, 'maida', 550, '470', 300, 10, '2020-02-02'),
(27, 9, 'soji', 850, '770', 300, 10, '2020-02-02'),
(28, 10, 'snickers', 1500, '1370', 300, 10, '2020-02-02'),
(29, 10, 'cadbury', 650, '570', 300, 10, '2020-02-02'),
(30, 10, 'perk', 650, '570', 300, 10, '2020-02-02'),
(31, 10, 'lays', 750, '670', 300, 10, '2020-02-02'),
(32, 11, 'chilli flakes', 500, '370', 300, 10, '2020-02-02'),
(33, 11, 'red chilli powder', 600, '470', 300, 10, '2020-02-02'),
(34, 11, 'cardamom', 330, '300', 300, 10, '2020-02-02'),
(35, 11, 'Cinnamon ', 400, '370', 300, 10, '2020-02-02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CatId`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Customer_Id` (`Customer_Id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat` (`CategoryId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `CatId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`Customer_Id`) REFERENCES `customer` (`id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`CategoryId`) REFERENCES `category` (`CatId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
