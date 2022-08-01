-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 01, 2022 at 02:33 AM
-- Server version: 10.5.13-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u759619020_fullstack_sms`
--

-- --------------------------------------------------------

--
-- Table structure for table `assigned_warehouses`
--

CREATE TABLE `assigned_warehouses` (
  `id` int(11) NOT NULL,
  `login_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assigned_warehouses`
--

INSERT INTO `assigned_warehouses` (`id`, `login_id`, `warehouse_id`) VALUES
(3, 71, 25);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `cat_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `cat_title`, `deleted`) VALUES
(125, 'Market', 1),
(148, 'Vegetables', 1),
(149, 'appsync.app.test@gmail.com', 1),
(150, 'Imported Goods', 1),
(151, 'Nestle India Limited', 1),
(152, 'Vardhman Traders', 1),
(153, 'Dabur India Ltd', 1),
(154, 'DS Spiseco', 1),
(155, 'Test', 1),
(156, 'Market', 0),
(157, 'toner', 0),
(158, 'maize', 1);

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` double NOT NULL DEFAULT 0,
  `tax` double NOT NULL DEFAULT 0,
  `deleted` tinyint(4) NOT NULL DEFAULT 0,
  `date` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inv_number` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `added_by` int(11) NOT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `name`, `mobile`, `discount`, `tax`, `deleted`, `date`, `inv_number`, `warehouse_id`, `added_by`, `remark`) VALUES
(1, '', '', 0, 0, 1, '29/03/2022', '20899MLAKK29032022', 25, 0, NULL),
(2, '', '', 0, 0, 1, '29/03/2022', '32669EHLMS29032022', 25, 0, NULL),
(3, 'Rohit Asawa', '7387191410', 180, 0, 1, '29/03/2022', '23414CWYDQ29032022', 25, 33, 'tedt'),
(4, 'Rohit Asawa', '7387191410', 100, 0, 1, '29/03/2022', '55976FQUDK29032022', 25, 33, 'test'),
(6, '', '', 0, 0, 1, '29/03/2022', '42543EWWYQ29032022', 25, 33, ''),
(7, 'Rohit Asawa', '7387191410', 50, 0, 0, '29/03/2022', '98770PTNBC29032022', 25, 33, 'test'),
(8, 'Rohit Asawa', '', 5, 0, 0, '29/03/2022', '90939KTTMB29032022', 25, 33, ''),
(9, 'Ramvilas Asawa', '7350090307', 0, 0, 0, '29/03/2022', '25666ZUITU29032022', 25, 33, ''),
(10, 'Rohit Asawa', '', 5, 0, 0, '29/03/2022', '67792ZQMDS29032022', 25, 33, ''),
(11, 'Rohit Asawa', '7387191410', 0, 0, 0, '30/03/2022', '38098SYRGW30032022', 26, 33, ''),
(12, 'Rohit Asawa', '7387191410', 0, 0, 0, '30/03/2022', '97178YITHD30032022', 26, 33, ''),
(13, '', '', 0, 0, 0, '30/03/2022', '14706FJCIL30032022', 26, 33, ''),
(15, '', '', 0, 0, 0, '30/03/2022', '93189WGSYW30032022', 25, 33, 'test'),
(16, '', '', 0, 0, 0, '30/03/2022', '01088QNXRO30032022', 25, 33, ''),
(17, 'Chiranjiv Enterprises', '9837250000', 0, 0, 0, '31/03/2022', '05702EYZNV31032022', 28, 33, ''),
(19, '', '', 5, 2, 0, '05/04/2022', '37541YTUEJ05042022', 28, 33, ''),
(21, 'Rohit Asawa', '7387191410', 0, 0, 0, '12/04/2022', '27862AUAFE12042022', 28, 33, ''),
(22, '', '', 0, 0, 0, '15/04/2022', '47846GCRAV15042022', 28, 33, ''),
(23, '', '', 0, 0, 0, '17/04/2022', '31750EMULN17042022', 28, 33, ''),
(24, 'Rohit Asawa', '7387191410', 20, 10, 0, '18/04/2022', '83865UUGHH18042022', 28, 33, ''),
(25, 'aaa', '1234', 12, 10, 0, '02/05/2022', '22416UBOLW02052022', 28, 33, ''),
(26, 'yogi', '11234', 0, 0, 0, '02/05/2022', '21374TDLBD02052022', 28, 33, ''),
(27, 'qq', '', 0, 11, 0, '03/05/2022', '93422FHSAV03052022', 28, 33, ''),
(28, 'Nazer Foods', '', 0, 0, 0, '01/06/2022', '52990RQCEG01062022', 35, 33, '1126'),
(29, '', '', 0, 0, 0, '03/06/2022', '43059SBBIC03062022', 35, 33, ''),
(30, 'Rohit Asawa', '7387191410', 0, 0, 0, '06/07/2022', '10810AEEHP06072022', 35, 33, 'testing'),
(31, 'dipak ', '8421718840', 1, 0, 0, '08/07/2022', '75504JTJTQ08072022', 36, 33, ''),
(32, '', '', 0, 0, 0, '09/07/2022', '61592VVEPW09072022', 36, 33, ''),
(33, '', '', 0, 0, 0, '09/07/2022', '05409KXNAA09072022', 36, 33, 'Suraj'),
(34, '', '', 0, 0, 0, '18/07/2022', '54376ANNXV18072022', 35, 33, 'test'),
(35, 'Rohit Asawa', '7387191410', 0, 0, 0, '18/07/2022', '68840FKBYB18072022', 35, 33, ''),
(36, 'Rohit Asawa', '7387191410', 0, 0, 0, '18/07/2022', '11333UVFLJ18072022', 35, 33, '');

-- --------------------------------------------------------

--
-- Table structure for table `logins`
--

CREATE TABLE `logins` (
  `id` int(15) NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `transactions_b` tinyint(4) NOT NULL DEFAULT 0,
  `products_b` tinyint(4) NOT NULL DEFAULT 0,
  `logins_b` tinyint(4) NOT NULL DEFAULT 0,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'User',
  `inward_b` tinyint(4) NOT NULL DEFAULT 1,
  `outward_b` tinyint(4) NOT NULL DEFAULT 1,
  `deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `logins`
--

INSERT INTO `logins` (`id`, `email`, `code`, `role`, `status`, `transactions_b`, `products_b`, `logins_b`, `name`, `inward_b`, `outward_b`, `deleted`) VALUES
(0, 'devlopers.developers@gmail.com', '28987', 'admin', 1, 1, 0, 1, 'MF', 1, 1, 1),
(33, 'rohit.asawa21@gmail.com', '5524', 'admin', 1, 1, 1, 1, 'Demo Account', 1, 1, 1),
(66, 'okcoding21@gmail.com', '14512', 'staff', 1, 0, 1, 1, 'Okcoding', 1, 1, 1),
(71, 'ai.appsync@gmail.com', '51792', 'staff', 1, 1, 1, 1, 'Demo Account ', 1, 1, 1),
(72, 'devlopers.developers@gmail.com', '72413', 'staff', 1, 1, 1, 0, 'tes', 1, 1, 1),
(73, 'nirajchandak09@gmail.com', '85622', 'admin', 1, 1, 1, 1, 'niraj', 1, 1, 1),
(74, 'rohit.asawa21@gmail.com', '08916', 'admin', 1, 1, 1, 1, 'Demo', 1, 1, 1),
(75, 'uisufian@gmail.com', '15860', 'staff', 0, 1, 1, 1, 'manik', 1, 1, 1),
(76, 'okcoding21@gmail.com', '43276', 'admin', 1, 1, 1, 1, 'test', 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(20) NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock_level` double NOT NULL DEFAULT 0,
  `category_id` int(18) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT 0,
  `unit` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double NOT NULL DEFAULT 0,
  `unique_id` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `stock_level`, `category_id`, `supplier_id`, `deleted`, `unit`, `price`, `unique_id`) VALUES
(6, 'Parachute Hair Oil', 10, 125, 47, 1, 'Pcs', 33, '8901200100038'),
(7, 'Kelloggs Corn Flakes', 10, 125, 47, 1, 'Pack', 92, '9660055791136678'),
(8, 'Dabur Res Toothpaste 200g + 100g', 15, 125, 47, 1, 'Pcs', 110, '8345199268377265'),
(9, 'HJBAHSDB\r\n', 15, 125, 47, 1, 'Pcs', 110, '834519926dsds8377265'),
(10, 'Moti Gulab', 0, 125, 0, 1, 'Pcs', 35, '8901030824678'),
(11, 'Desi Ghee', 0, 125, 0, 1, 'Pcs', 136, '8998050902318'),
(12, 'Fena Mahabar', 0, 125, 0, 1, 'Pcs', 10, '8901190103392'),
(13, 'ParleG 10rs', 0, 125, 0, 1, 'Pcs', 10, '8901719119194'),
(14, 'Balsamic Vinegar', 1, 150, 47, 1, 'Pack', 0, ''),
(15, 'Oyester Sauce', 1, 150, 47, 1, 'Pack', 0, ''),
(16, 'Maggi 60gm', 15, 150, 47, 1, 'Pack', 0, ''),
(17, 'Haldi Powder 1kg', 3, 154, 49, 1, 'Bags', 0, ''),
(18, 'Dhania Powder 1 Kg', 3, 154, 49, 1, 'Bags', 0, ''),
(19, 'Kitchen King 100gm', 1, 154, 49, 1, 'Case', 0, ''),
(20, 'Kashmiri Mirch 100gm', 1, 154, 49, 1, 'Case', 0, ''),
(21, 'Mix fruit 1ltr ×12', 5, 154, 50, 1, 'Case', 0, ''),
(22, 'Pomigranate 1 Ltr ×12', 5, 154, 50, 1, 'Case', 0, ''),
(23, 'Tomato Puree 850gm×24', 2, 154, 51, 1, 'Case', 0, ''),
(24, 'button Mashroom 850gm', 2, 154, 51, 1, 'Case', 0, ''),
(25, 'Everyday DW 1kg ×12', 1, 154, 48, 1, 'Case', 0, ''),
(26, 'V-BELT', 50, 125, 47, 1, 'Pcs', 0, ''),
(27, 'ParleG', 10, 156, 51, 0, 'Pcs', 10, ''),
(28, 'CHICKEN MARKET', 0, 156, 55, 0, 'Pcs', 250, ''),
(29, 'Havsol Barcode Scanner', 10, 156, 51, 1, 'Pcs', 1, 'SC-760/210828982'),
(30, 'Havsol', 0, 156, 53, 1, 'Pcs', 0, 'SC-760/210828982'),
(31, 'testp', 0, 156, 0, 1, 'Case', 0, '1234'),
(32, 'Toor', 0, 158, 55, 1, 'Bags', 6500, ''),
(33, 'Sugar', 0, 157, 55, 0, 'Kg', 30, ''),
(34, 'Soyabeen oil', 0, 157, 55, 0, 'Ltr', 85, ''),
(35, 'Tur Dal', 0, 157, 55, 0, 'Kg', 45, ''),
(36, 'Parachute oil Bottle', 0, 157, 55, 0, 'Pcs', 32, ''),
(37, 'Butter Small Pk', 0, 157, 55, 0, 'Pcs', 55, ''),
(38, 'Chilly powder small', 0, 157, 55, 0, 'Pack', 35, '');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `version` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int(2) NOT NULL,
  `server_expiery_date` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version_code` int(11) NOT NULL,
  `app_opened` int(11) NOT NULL,
  `shop_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_gstin` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_numbers` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`status`, `version`, `id`, `server_expiery_date`, `version_code`, `app_opened`, `shop_description`, `shop_name`, `shop_address`, `shop_gstin`, `shop_numbers`) VALUES
(1, '2.2', 1, '09/03/2023', 27, 0, 'General stores', 'Suraj Stores', 'Pune, Maharashtra, India', 'NA', '1234567890');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `title`, `description`, `deleted`) VALUES
(46, 'Local Purchase', 'testing', 1),
(47, 'Local Purchases', 'testing', 1),
(48, 'Nestle India Limited', '', 1),
(49, 'DS Spiseco', '', 1),
(50, 'Dabur India Limited', '', 1),
(51, 'Vardhman Traders', '', 1),
(52, 'Local Suppliers', 'testing done', 1),
(53, 'Havsol', '', 1),
(54, 'Bajaj', 'Kichha', 1),
(55, '8 Ounces', 'kawaguchi', 0);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(20) NOT NULL,
  `product_id` int(20) NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'in',
  `qnt` double NOT NULL DEFAULT 0,
  `date` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_id` int(5) NOT NULL DEFAULT 1,
  `warehouse_id` int(18) NOT NULL DEFAULT 1,
  `inv_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `product_id`, `type`, `qnt`, `date`, `remark`, `login_id`, `warehouse_id`, `inv_number`) VALUES
(1, 1, 'in', 398, '29/03/2022', 'tedting', 33, 25, NULL),
(2, 5, 'in', 180, '29/03/2022', 'testing', 33, 25, NULL),
(3, 4, 'in', 250, '29/03/2022', 'testing', 33, 25, NULL),
(4, 3, 'in', 684, '29/03/2022', 'testing', 33, 25, NULL),
(5, 2, 'in', 159, '29/03/2022', 'testing', 33, 25, NULL),
(6, 1, 'in', 380, '29/03/2022', 'testing', 33, 25, NULL),
(7, 5, 'out', 8, '29/03/2022', 'test', 33, 25, NULL),
(8, 4, 'out', 5, '29/03/2022', 'test', 33, 25, NULL),
(9, 3, 'out', 69, '29/03/2022', 'test', 33, 25, NULL),
(10, 2, 'out', 47, '29/03/2022', 'test', 33, 25, NULL),
(11, 1, 'out', 8, '29/03/2022', 'test', 33, 25, NULL),
(12, 5, 'out', 2, '29/03/2022', 'trsting', 33, 25, NULL),
(13, 4, 'out', 5, '29/03/2022', 'trsting', 33, 25, NULL),
(14, 3, 'out', 5, '29/03/2022', 'trsting', 33, 25, NULL),
(15, 2, 'out', 2, '29/03/2022', 'trsting', 33, 25, NULL),
(16, 1, 'out', 10, '29/03/2022', 'trsting', 33, 25, NULL),
(17, 5, 'out', 6, '29/03/2022', 'test', 33, 25, NULL),
(18, 4, 'out', 4, '29/03/2022', 'test', 33, 25, NULL),
(19, 5, 'out', 4, '29/03/2022', 'tedt', 33, 25, NULL),
(20, 4, 'out', 6, '29/03/2022', 'tedt', 33, 25, NULL),
(21, 3, 'out', 5, '29/03/2022', 'tedt', 33, 25, NULL),
(22, 2, 'out', 2, '29/03/2022', 'tedt', 33, 25, NULL),
(23, 1, 'out', 6, '29/03/2022', 'tedt', 33, 25, NULL),
(24, 5, 'out', 6, '29/03/2022', 'test', 33, 25, NULL),
(32, 8, 'in', 158, '29/03/2022', 'test ', 33, 25, '26486TEWPR29032022'),
(33, 7, 'in', 345, '29/03/2022', 'test ', 33, 25, '26486TEWPR29032022'),
(34, 6, 'in', 128, '29/03/2022', 'test ', 33, 25, '26486TEWPR29032022'),
(35, 6, 'out', 8, '29/03/2022', 'test', 33, 25, '98770PTNBC29032022'),
(36, 8, 'out', 8, '29/03/2022', 'test', 33, 25, '98770PTNBC29032022'),
(37, 7, 'out', 5, '29/03/2022', 'test', 33, 25, '98770PTNBC29032022'),
(38, 8, 'out', 1, '29/03/2022', '', 33, 25, '90939KTTMB29032022'),
(39, 7, 'out', 1, '29/03/2022', '', 33, 25, '90939KTTMB29032022'),
(40, 6, 'out', 1, '29/03/2022', '', 33, 25, '90939KTTMB29032022'),
(41, 10, 'in', 100, '29/03/2022', '', 33, 25, '25666ZUITU29032022'),
(42, 13, 'in', 100, '29/03/2022', '', 33, 25, '25666ZUITU29032022'),
(43, 12, 'in', 100, '29/03/2022', '', 33, 25, '25666ZUITU29032022'),
(44, 11, 'in', 100, '29/03/2022', '', 33, 25, '25666ZUITU29032022'),
(45, 11, 'in', 1, '29/03/2022', '', 33, 25, '25666ZUITU29032022'),
(46, 13, 'in', 1, '29/03/2022', '', 33, 25, '25666ZUITU29032022'),
(47, 12, 'in', 1, '29/03/2022', '', 33, 25, '25666ZUITU29032022'),
(48, 10, 'in', 1, '29/03/2022', '', 33, 25, '25666ZUITU29032022'),
(49, 10, 'out', 1, '29/03/2022', '', 33, 25, '25666ZUITU29032022'),
(50, 12, 'out', 1, '29/03/2022', '', 33, 25, '25666ZUITU29032022'),
(51, 13, 'out', 1, '29/03/2022', '', 33, 25, '25666ZUITU29032022'),
(52, 11, 'out', 1, '29/03/2022', '', 33, 25, '25666ZUITU29032022'),
(53, 13, 'out', 1, '29/03/2022', '', 33, 25, '67792ZQMDS29032022'),
(54, 12, 'out', 1, '29/03/2022', '', 33, 25, '67792ZQMDS29032022'),
(55, 10, 'out', 1, '29/03/2022', '', 33, 25, '67792ZQMDS29032022'),
(56, 11, 'out', 1, '29/03/2022', '', 33, 25, '67792ZQMDS29032022'),
(57, 11, 'in', 10, '30/03/2022', '', 33, 26, '67792ZQMDS29032023'),
(58, 11, 'out', 4, '30/03/2022', '', 33, 26, '67792ZQMDS29032023'),
(59, 6, 'in', 100, '30/03/2022', 'tedt', 33, 26, '06116KADEJ30032022'),
(60, 7, 'in', 150, '30/03/2022', 'tedt', 33, 26, '06116KADEJ30032022'),
(61, 8, 'in', 198, '30/03/2022', 'tedt', 33, 26, '06116KADEJ30032022'),
(62, 8, 'out', 1, '30/03/2022', 'test', 33, 26, '06116KADEJ30032022'),
(63, 7, 'out', 1, '30/03/2022', 'test', 33, 26, '06116KADEJ30032022'),
(64, 6, 'out', 1, '30/03/2022', 'test', 33, 26, '06116KADEJ30032022'),
(65, 8, 'out', 1, '30/03/2022', '', 33, 26, '38098SYRGW30032022'),
(66, 7, 'out', 1, '30/03/2022', '', 33, 26, '38098SYRGW30032022'),
(67, 6, 'out', 1, '30/03/2022', '', 33, 26, '38098SYRGW30032022'),
(68, 8, 'out', 1, '30/03/2022', '', 33, 26, '97178YITHD30032022'),
(69, 7, 'out', 1, '30/03/2022', '', 33, 26, '97178YITHD30032022'),
(70, 6, 'out', 1, '30/03/2022', '', 33, 26, '97178YITHD30032022'),
(71, 8, 'out', 1, '30/03/2022', '', 33, 26, '97178YITHD30032022'),
(72, 7, 'out', 1, '30/03/2022', '', 33, 26, '97178YITHD30032022'),
(73, 6, 'out', 1, '30/03/2022', '', 33, 26, '97178YITHD30032022'),
(74, 13, 'in', 100, '30/03/2022', '', 33, 26, '14706FJCIL30032022'),
(75, 13, 'out', 1, '30/03/2022', '', 33, 26, '14706FJCIL30032022'),
(77, 13, 'out', 1, '29/03/2022', 'appsync.app.test@gmail.com', 33, 26, '93587EDDWD29032022'),
(80, 13, 'in', 12, '30/03/2022', 'Stock Shifting', 33, 28, 'StockShifting in'),
(81, 13, 'out', 12, '30/03/2022', 'Stock Shifting', 33, 25, 'StockShifting out'),
(82, 10, 'in', 9, '30/03/2022', 'Stock Shifting', 33, 28, 'StockShifting in'),
(83, 10, 'out', 9, '30/03/2022', 'Stock Shifting', 33, 25, 'StockShifting out'),
(84, 12, 'in', 9, '30/03/2022', 'Stock Shifting', 33, 28, 'StockShifting in'),
(85, 12, 'out', 9, '30/03/2022', 'Stock Shifting', 33, 25, 'StockShifting out'),
(86, 6, 'out', 1, '30/03/2022', 'test', 33, 25, '93189WGSYW30032022'),
(87, 13, 'out', 1, '30/03/2022', '', 33, 25, '01088QNXRO30032022'),
(88, 12, 'out', 1, '30/03/2022', '', 33, 25, '01088QNXRO30032022'),
(89, 11, 'out', 1, '30/03/2022', '', 33, 25, '01088QNXRO30032022'),
(90, 10, 'out', 1, '30/03/2022', '', 33, 25, '01088QNXRO30032022'),
(91, 25, 'in', 5, '31/03/2022', '', 33, 28, '06332ZSOWI31032022'),
(92, 24, 'in', 10, '31/03/2022', '', 33, 28, '06332ZSOWI31032022'),
(93, 23, 'in', 10, '31/03/2022', '', 33, 28, '06332ZSOWI31032022'),
(94, 22, 'in', 10, '31/03/2022', '', 33, 28, '06332ZSOWI31032022'),
(95, 21, 'in', 15, '31/03/2022', '', 33, 28, '06332ZSOWI31032022'),
(96, 20, 'in', 5, '31/03/2022', '', 33, 28, '06332ZSOWI31032022'),
(97, 19, 'in', 10, '31/03/2022', '', 33, 28, '06332ZSOWI31032022'),
(98, 18, 'in', 10, '31/03/2022', '', 33, 28, '06332ZSOWI31032022'),
(99, 17, 'in', 10, '31/03/2022', '', 33, 28, '06332ZSOWI31032022'),
(100, 25, 'out', 2, '31/03/2022', '', 33, 28, '05702EYZNV31032022'),
(101, 24, 'out', 2, '31/03/2022', '', 33, 28, '05702EYZNV31032022'),
(102, 23, 'out', 5, '31/03/2022', '', 33, 28, '05702EYZNV31032022'),
(103, 22, 'out', 8, '31/03/2022', '', 33, 28, '05702EYZNV31032022'),
(104, 21, 'out', 5, '31/03/2022', '', 33, 28, '05702EYZNV31032022'),
(105, 20, 'out', 2, '31/03/2022', '', 33, 28, '05702EYZNV31032022'),
(106, 19, 'out', 3, '31/03/2022', '', 33, 28, '05702EYZNV31032022'),
(107, 18, 'out', 3, '31/03/2022', '', 33, 28, '05702EYZNV31032022'),
(108, 17, 'out', 4, '31/03/2022', '', 33, 28, '05702EYZNV31032022'),
(109, 8, 'out', 140, '31/03/2022', '', 33, 25, '87742QTSCZ31032022'),
(110, 7, 'out', 332, '31/03/2022', '', 33, 25, '86606ZSNUT31032022'),
(111, 13, 'in', 2, '01/04/2022', '', 33, 28, '57010QVAJQ01042022'),
(112, 11, 'in', 1, '01/04/2022', '', 33, 28, '57010QVAJQ01042022'),
(113, 7, 'in', 8, '01/04/2022', '', 33, 28, '57010QVAJQ01042022'),
(114, 6, 'in', 1, '01/04/2022', '', 33, 28, '57010QVAJQ01042022'),
(115, 11, 'out', 1, '02/04/2022', '', 33, 25, '53819MOSDW02042022'),
(116, 13, 'out', 1, '05/04/2022', '', 33, 28, '37541YTUEJ05042022'),
(117, 13, 'out', 1, '06/04/2022', '', 73, 28, '84855PBJBY06042022'),
(118, 13, 'out', 1, '06/04/2022', '', 73, 28, '99779MKERO06042022'),
(119, 13, 'in', 100, '07/04/2022', '', 33, 28, '86409KSYVV07042022'),
(120, 12, 'in', 100, '07/04/2022', '', 33, 28, '86409KSYVV07042022'),
(121, 11, 'in', 100, '07/04/2022', '', 33, 28, '86409KSYVV07042022'),
(122, 7, 'in', 100, '07/04/2022', '', 33, 28, '86409KSYVV07042022'),
(123, 11, 'in', 1, '07/04/2022', 'Stock Shifting', 33, 25, 'StockShifting in'),
(124, 11, 'out', 1, '07/04/2022', 'Stock Shifting', 33, 28, 'StockShifting out'),
(125, 25, 'in', 10, '08/04/2022', 'testing ', 33, 28, '22368VROXC08042022'),
(126, 24, 'in', 60, '08/04/2022', 'testing ', 33, 28, '22368VROXC08042022'),
(127, 23, 'in', 35, '08/04/2022', 'testing ', 33, 28, '22368VROXC08042022'),
(128, 22, 'in', 18, '08/04/2022', 'testing ', 33, 28, '22368VROXC08042022'),
(129, 19, 'in', 74, '08/04/2022', 'testing ', 33, 28, '22368VROXC08042022'),
(130, 16, 'in', 100, '09/04/2022', '', 33, 28, '29454MAXKS09042022'),
(131, 15, 'in', 150, '09/04/2022', '', 33, 28, '29454MAXKS09042022'),
(132, 14, 'in', 130, '09/04/2022', '', 33, 28, '29454MAXKS09042022'),
(133, 13, 'out', 1, '12/04/2022', '', 33, 28, '27862AUAFE12042022'),
(134, 12, 'out', 1, '12/04/2022', '', 33, 28, '27862AUAFE12042022'),
(135, 11, 'out', 1, '12/04/2022', '', 33, 28, '27862AUAFE12042022'),
(136, 10, 'out', 1, '12/04/2022', '', 33, 28, '27862AUAFE12042022'),
(137, 7, 'out', 1, '12/04/2022', '', 33, 28, '27862AUAFE12042022'),
(138, 13, 'in', 1, '12/04/2022', '', 73, 25, '58033FHXVZ12042022'),
(139, 13, 'in', 1, '12/04/2022', '', 73, 25, '35248JFUVX12042022'),
(140, 13, 'out', 1, '12/04/2022', '', 73, 25, '88478PFIYG12042022'),
(141, 25, 'out', 1, '15/04/2022', '', 33, 28, '47846GCRAV15042022'),
(142, 24, 'out', 1, '15/04/2022', '', 33, 28, '47846GCRAV15042022'),
(143, 23, 'out', 1, '15/04/2022', '', 33, 28, '47846GCRAV15042022'),
(144, 26, 'in', 100, '17/04/2022', '', 33, 28, '28320QKYNS17042022'),
(145, 16, 'out', 1, '17/04/2022', '', 33, 28, '31750EMULN17042022'),
(146, 15, 'out', 1, '17/04/2022', '', 33, 28, '31750EMULN17042022'),
(147, 14, 'out', 1, '17/04/2022', '', 33, 28, '31750EMULN17042022'),
(148, 22, 'in', 50, '17/04/2022', 'Stock Shifting', 33, 25, 'StockShifting in'),
(150, 26, 'out', 1, '18/04/2022', '', 33, 28, '83865UUGHH18042022'),
(151, 13, 'out', 1, '18/04/2022', '', 33, 28, '83865UUGHH18042022'),
(152, 12, 'out', 1, '18/04/2022', '', 33, 28, '83865UUGHH18042022'),
(153, 10, 'in', 2, '18/04/2022', 'Stock Shifting', 33, 25, 'StockShifting in'),
(154, 10, 'out', 2, '18/04/2022', 'Stock Shifting', 33, 28, 'StockShifting out'),
(155, 28, 'in', 10, '02/05/2022', '', 33, 28, '22416UBOLW02052022'),
(156, 28, 'out', 1, '02/05/2022', '', 33, 28, '22416UBOLW02052022'),
(157, 30, 'in', 10, '02/05/2022', '', 33, 28, '21374TDLBD02052022'),
(158, 30, 'out', 1, '02/05/2022', '', 33, 28, '21374TDLBD02052022'),
(159, 30, 'in', 1, '03/05/2022', 'bill 123', 33, 28, '48977PBDPH03052022'),
(160, 30, 'in', 1, '03/05/2022', 'b2346', 33, 28, '66510XWOFH03052022'),
(161, 28, 'in', 1, '03/05/2022', 'b2346', 33, 28, '66510XWOFH03052022'),
(162, 27, 'in', 1, '03/05/2022', 'b2346', 33, 28, '66510XWOFH03052022'),
(163, 31, 'in', 11, '03/05/2022', '', 33, 28, '35124ZSUDY03052022'),
(164, 31, 'out', 1, '03/05/2022', '', 33, 28, '93422FHSAV03052022'),
(165, 30, 'out', 1, '03/05/2022', '', 33, 28, '93422FHSAV03052022'),
(166, 27, 'in', 1, '31/05/2022', '', 33, 35, '92110GOYZY31052022'),
(169, 28, 'in', 100, '01/06/2022', '', 33, 35, '52990RQCEG01062022'),
(170, 27, 'in', 100, '01/06/2022', '', 33, 35, '52990RQCEG01062022'),
(171, 28, 'out', 50, '01/06/2022', '1126', 33, 35, '52990RQCEG01062022'),
(172, 27, 'out', 50, '01/06/2022', '1126', 33, 35, '52990RQCEG01062022'),
(173, 28, 'out', 1, '02/06/2022', 'testing', 33, 35, '62364SIARR02062022'),
(174, 27, 'out', 1, '02/06/2022', 'testing', 33, 35, '62364SIARR02062022'),
(175, 27, 'out', 1, '02/06/2022', '', 33, 35, '12541OCYNZ02062022'),
(176, 28, 'out', 1, '02/06/2022', '', 33, 35, '12541OCYNZ02062022'),
(177, 28, 'out', 1, '03/06/2022', '', 33, 35, '43059SBBIC03062022'),
(178, 27, 'out', 1, '03/06/2022', '', 33, 35, '43059SBBIC03062022'),
(179, 28, 'in', 1, '06/07/2022', 'testing', 33, 35, '24655JRYLK06072022'),
(180, 27, 'in', 1, '06/07/2022', 'testing', 33, 35, '24655JRYLK06072022'),
(181, 28, 'out', 1, '06/07/2022', 'testing', 33, 35, '10810AEEHP06072022'),
(182, 27, 'out', 1, '06/07/2022', 'testing', 33, 35, '10810AEEHP06072022'),
(183, 32, 'in', 200, '08/07/2022', '', 33, 36, '75504JTJTQ08072022'),
(184, 32, 'out', 20, '26/08/2022', '', 33, 36, '75504JTJTQ08072022'),
(185, 27, 'in', 10, '09/07/2022', '', 33, 36, '58948QGOWB09072022'),
(186, 28, 'in', 5, '09/07/2022', '', 33, 36, '58948QGOWB09072022'),
(187, 28, 'out', 1, '09/07/2022', '', 33, 36, '61592VVEPW09072022'),
(188, 27, 'out', 1, '09/07/2022', '', 33, 36, '61592VVEPW09072022'),
(189, 28, 'out', 1, '09/07/2022', 'Suraj', 33, 36, '05409KXNAA09072022'),
(190, 27, 'out', 1, '09/07/2022', 'Suraj', 33, 36, '05409KXNAA09072022'),
(191, 28, 'out', 1, '18/07/2022', 'test', 33, 35, '54376ANNXV18072022'),
(192, 27, 'out', 1, '18/07/2022', 'test', 33, 35, '54376ANNXV18072022'),
(193, 38, 'in', 100, '18/07/2022', '', 33, 35, '81400XFLQL18072022'),
(194, 37, 'in', 100, '18/07/2022', '', 33, 35, '81400XFLQL18072022'),
(195, 36, 'in', 100, '18/07/2022', '', 33, 35, '81400XFLQL18072022'),
(196, 35, 'in', 100, '18/07/2022', '', 33, 35, '81400XFLQL18072022'),
(197, 34, 'in', 100, '18/07/2022', '', 33, 35, '81400XFLQL18072022'),
(198, 33, 'in', 100, '18/07/2022', '', 33, 35, '81400XFLQL18072022'),
(199, 38, 'out', 1, '18/07/2022', '', 33, 35, '68840FKBYB18072022'),
(200, 37, 'out', 1, '18/07/2022', '', 33, 35, '68840FKBYB18072022'),
(201, 36, 'out', 1, '18/07/2022', '', 33, 35, '68840FKBYB18072022'),
(202, 35, 'out', 1, '18/07/2022', '', 33, 35, '68840FKBYB18072022'),
(203, 34, 'out', 1, '18/07/2022', '', 33, 35, '68840FKBYB18072022'),
(204, 38, 'out', 1, '18/07/2022', '', 33, 35, '11333UVFLJ18072022'),
(205, 37, 'out', 1, '18/07/2022', '', 33, 35, '11333UVFLJ18072022'),
(206, 36, 'out', 1, '18/07/2022', '', 33, 35, '11333UVFLJ18072022'),
(207, 35, 'out', 1, '18/07/2022', '', 33, 35, '11333UVFLJ18072022'),
(208, 34, 'out', 1, '18/07/2022', '', 33, 35, '11333UVFLJ18072022'),
(209, 35, 'out', 28.5, '22/07/2022', 'ghh', 33, 35, '88321KMPWY22072022');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` int(11) NOT NULL,
  `title` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `title`, `deleted`) VALUES
(17, 'Kg', 0),
(18, 'Pack', 0),
(19, 'Ltr', 0),
(20, 'Pcs', 0),
(21, 'Bags', 0),
(22, 'Case', 0);

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE `warehouses` (
  `id` int(18) NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`id`, `title`, `description`, `deleted`) VALUES
(19, 'Mumbai+Warehouses', 'Laptops+Warehouse', 1),
(25, 'JNP GDN', 'testing', 1),
(26, 'JNP 2', 'testing', 1),
(27, 'Raw Warehouse', 'testing', 1),
(28, 'JNP 3', '', 1),
(29, 'Test warehouse', 'testing done', 1),
(30, 'HN', '', 1),
(31, '1780', '', 1),
(32, '1766 A', '', 1),
(33, '1766 B', '', 1),
(34, '1770', '', 1),
(35, 'Ground Floor', '2nd Factory', 0),
(36, 'Firstt Floor', '1st Factory', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assigned_warehouses`
--
ALTER TABLE `assigned_warehouses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title_index` (`cat_title`(768));

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `inv_number` (`inv_number`),
  ADD KEY `mobile_index` (`mobile`(768)),
  ADD KEY `name_index` (`name`(768)),
  ADD KEY `date_index` (`date`);

--
-- Indexes for table `logins`
--
ALTER TABLE `logins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_index` (`email`),
  ADD KEY `id_index` (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title_index` (`title`(768)),
  ADD KEY `uniqu_index` (`unique_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title_index` (`title`(768));

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_index` (`product_id`),
  ADD KEY `date_index` (`date`),
  ADD KEY `userid_index` (`login_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title_index` (`title`);

--
-- Indexes for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title_index` (`title`(768));

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assigned_warehouses`
--
ALTER TABLE `assigned_warehouses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `logins`
--
ALTER TABLE `logins`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
