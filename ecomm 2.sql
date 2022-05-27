-- phpMyAdmin SQL Dump
-- version 5.3.0-dev+20220507.f68a18df64
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2022 at 05:29 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecomm`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'parvathy@gmail.com', '$2y$10$GcOdGLZBSGRE7BXmb0k7Te9xWdT9QoWdj1bT6ZbDNlj2KI8ICbeN.', NULL, '2022-03-10 01:15:27');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_type` enum('Reg','Not-Reg') NOT NULL,
  `qty` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `category_image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Exotic vegetables', '1648739115.jpg', 1, '2022-03-10 22:49:31', '2022-04-04 02:55:16'),
(2, 'Vegetables', '1648739370.jpg', 1, '2022-03-11 01:47:10', '2022-03-31 09:39:30'),
(7, 'Fresh Cuts', '1648775860.png', 1, '2022-03-31 09:41:31', '2022-03-31 19:47:40'),
(8, 'Nutrition Chargers', '1648822182.jpg', 1, '2022-04-01 08:39:43', '2022-04-01 08:39:43');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `type` enum('Value','Per') NOT NULL,
  `min_order_amt` int(11) NOT NULL,
  `is_one_time` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `title`, `code`, `value`, `type`, `min_order_amt`, `is_one_time`, `status`, `updated_at`, `created_at`) VALUES
(1, 'JanCoupon', 'jan2021', '10', 'Value', 0, 1, 1, '2022-05-10 22:26:31', '2022-05-11 03:56:31'),
(2, 'FebCoupon', 'Feb2021', '3', 'Value', 0, 0, 1, '2022-05-10 22:26:46', '2022-05-11 03:56:46');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_verify` int(11) NOT NULL,
  `is_forgot_password` int(11) DEFAULT NULL,
  `rand_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `mobile`, `password`, `address`, `city`, `is_verify`, `is_forgot_password`, `rand_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'user', 'user@gmail.com', '9422587512', 'user@123', 'qwertyu', 'asdfgh', 0, 0, '', 1, NULL, '2022-03-23 08:36:15'),
(2, 'ambady', 'ambady@gmail.com', '12345678', 'ambady', 'asdfghjkl', 'sdfgh', 0, 0, '', 1, NULL, NULL),
(22, 'Parvathy', 'paruchinnu1932@gmail.com', '8547358491', 'eyJpdiI6ImJiWFlicWdpTmR3Nk5tdUNoNFlrWEE9PSIsInZhbHVlIjoieUxCNVlJTUJCZlU4SWM0aURoNGtiZz09IiwibWFjIjoiMTMxZTM3Y2RjNjIzMjRmNWM0ODdlOTViZjE1Mzg1ZGFiY2QzZWIyYTAxOGY4YjhiOGJmZjc5MTlkZjcwOWQ4NyIsInRhZyI6IiJ9', 'omallooparampil', 'pamapdy', 1, 1, '735058428', 1, '2022-05-06 19:57:47', '2022-05-06 19:57:47'),
(28, 'Chinnu', 'parvthy0001@gmail.com', '9400508491', 'eyJpdiI6Imk4TUEvNTB5dVNWZFZsbmR2bjEzTFE9PSIsInZhbHVlIjoiRXFsT0tuQ0ZzTktRMHRqc2hUaWJ6Zz09IiwibWFjIjoiN2MxZmRhMDEyYTEyMmY3YzUzNWRlZTI1YTY5N2MxNzY1YWViMTg4MTJkM2Y3YjM1YjhjNzdlYWNjZGUyY2NiMiIsInRhZyI6IiJ9', NULL, NULL, 0, NULL, '251498130', 1, '2022-05-13 03:09:49', '2022-05-13 03:09:49');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2022_03_08_065501_create_admins_table', 1),
(3, '2022_03_09_034610_create_categories_table', 2),
(4, '2022_03_13_145605_create_products_table', 3),
(5, '2022_03_23_085456_create_customers_table', 4),
(6, '2022_03_31_092124_create_sellers_table', 5),
(7, '2022_04_08_084756_create_sellers_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customers_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `city` varchar(255) NOT NULL,
  `order_status` int(11) NOT NULL,
  `coupon_code` varchar(255) DEFAULT NULL,
  `coupon_value` int(11) DEFAULT NULL,
  `payment_type` enum('COD','Gateway') NOT NULL,
  `payment_id` varchar(50) DEFAULT NULL,
  `payment_status` varchar(255) NOT NULL,
  `txn_id` varchar(255) DEFAULT NULL,
  `track_details` text DEFAULT NULL,
  `total_amt` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customers_id`, `name`, `address`, `email`, `mobile`, `city`, `order_status`, `coupon_code`, `coupon_value`, `payment_type`, `payment_id`, `payment_status`, `txn_id`, `track_details`, `total_amt`, `added_on`) VALUES
(1, 22, 'Parvathy', 'omallooparampil', 'paruchinnu1932@gmail.com', '8547358491', 'pampady', 2, NULL, 0, 'Gateway', 'MOJO2512E05A87472593', 'Success', '7e60db1c4a584e4fa19bc2f080e2076d', 'On the way', 67, '2022-05-12 05:27:37'),
(2, 22, 'Parvathy', 'omallooparampil', 'paruchinnu1932@gmail.com', '8547358491', 'ktm', 3, NULL, 0, 'Gateway', 'MOJO2512D05A87472596', 'Success', '21ab5e947dcc4548bd321292594e31a3', 'Reached', 120, '2022-05-12 05:32:05'),
(3, 22, 'Parvathy', 'omallooparampil', 'paruchinnu1932@gmail.com', '8547358491', 'pampady', 1, 'Feb2021', 3, 'COD', NULL, 'Pending', NULL, NULL, 55, '2022-05-12 11:52:31'),
(4, 22, 'Parvathy', 'omallooparampil', 'paruchinnu1932@gmail.com', '8547358491', 'pamapdy', 1, NULL, 0, 'Gateway', 'MOJO2513M05A41013414', 'Success', '20b80d81a27946b384db8d7a95403956', NULL, 67, '2022-05-13 04:50:20'),
(5, 28, 'Chinnu', 'abc', 'parvthy0001@gmail.com', '9400508491', 'abc', 1, NULL, 0, 'Gateway', 'MOJO2513A05A41013489', 'Success', '587eaa6621424bafa4624f0ee73b135b', NULL, 67, '2022-05-13 08:52:04'),
(6, 22, 'Parvathy', 'omallooparampil', 'paruchinnu1932@gmail.com', '8547358491', 'pamapdy', 1, NULL, 0, 'Gateway', 'MOJO2514G05A83629486', 'Success', 'c014c263a0ea47dd8c3a2d8da07a339b', NULL, 90, '2022-05-14 05:16:44'),
(7, 22, 'Parvathy', 'omallooparampil', 'paruchinnu1932@gmail.com', '8547358491', 'pamapdy', 1, NULL, 0, 'Gateway', 'MOJO2514G05A83629487', 'Success', '4a4e9210f06143da9215be1ab2e9356a', NULL, 60, '2022-05-14 05:22:28'),
(8, 22, 'Parvathy', 'omallooparampil', 'paruchinnu1932@gmail.com', '8547358491', 'pamapdy', 1, NULL, 0, 'Gateway', 'MOJO2518J05A73942088', 'Success', '1bba172683a84dffa9d22e2bcad57aa3', NULL, 60, '2022-05-18 04:52:47'),
(9, 22, 'Parvathy', 'omallooparampil', 'paruchinnu1932@gmail.com', '8547358491', 'pamapdy', 1, NULL, 0, 'Gateway', 'MOJO2522R05A15903097', 'Success', '9a1626f3598649e8ab51062d0a3476f0', NULL, 90, '2022-05-22 01:38:22');

-- --------------------------------------------------------

--
-- Table structure for table `orders_details`
--

CREATE TABLE `orders_details` (
  `id` int(11) NOT NULL,
  `orders_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders_details`
--

INSERT INTO `orders_details` (`id`, `orders_id`, `product_id`, `price`, `qty`) VALUES
(1, 1, 4, 33, 2),
(2, 2, 2, 60, 2),
(3, 3, 5, 55, 1),
(4, 4, 4, 33, 2),
(5, 5, 4, 33, 2),
(6, 6, 6, 90, 1),
(7, 7, 3, 30, 2),
(8, 8, 2, 60, 1),
(9, 9, 6, 90, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders_status`
--

CREATE TABLE `orders_status` (
  `id` int(11) NOT NULL,
  `orders_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders_status`
--

INSERT INTO `orders_status` (`id`, `orders_status`) VALUES
(1, 'Placed'),
(2, 'On the way'),
(3, 'Delivered');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mrp` float NOT NULL,
  `price` float NOT NULL,
  `qty` int(11) NOT NULL,
  `lead_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_desc` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `keywords` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `desc`, `image`, `mrp`, `price`, `qty`, `lead_time`, `short_desc`, `keywords`, `is_featured`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 'Carrot', '\"  Highly nutritious & crunchy, our fresh Carrots are a must-have in your healthy diet! Purchase vegetables online through our vegetable store & you can get fresh Carrots delivered conveniently through our online vegetable delivery service!             \r\n Place carrots in a container with a lid and cover them completely in water. Keep container in the refrigerator.\"  \r\nStorage Method::\r\nStore the carrots in a bowl of water & refrigerate. Use within 3-4 days of storage.', '1651728332.jpg', 84, 45, 10, 'Within 1 day', '\"  Highly nutritious & crunchy, our fresh Carrots are a must-have in your healthy diet! Purchase vegetables online through our vegetable store & you can get fresh Carrots delivered conveniently through our online vegetable delivery service!             \r\n Place carrots in a container with a lid and cover completely in water. Keep container in the refrigerator.\"', '\"  Highly nutritious & crunchy, our fresh Carrots are a must-have in your healthy diet! Purchase vegetables online through our vegetable store & you can get fresh Carrots delivered conveniently through our online vegetable delivery service!             \r\n Place carrots in a container with a lid and cover them completely in water. Keep container in the refrigerator.\"  \r\nStorage Method::\r\nStore the carrots in a bowl of water & refrigerate. Use within 3-4 days of storage.', 0, 1, '2022-05-04 23:55:33', '2022-05-23 02:14:10'),
(2, 1, 'Broccoli', 'This member of the cruciferous family is packed with protein & a wide range of other essential nutrients. Broccolis are packed with antioxidants that help in reducing cell damage. Adding this healthy vegetable to your daily diet can help in reducing blood sugar levels, and cholesterol levels & reduce the risk of developing chronic diseases as well. Broccoli contains various bioactive compounds which help in reducing inflammation within the body. Eat it raw or cook it, this healthy addition to your diet will keep you vitalized for longer! Each 100g serving of Broccoli contains (Approx):  34 Calories, 0.4g Fat,  6.6g Carbs,  2.6g fiber,  2.8g Protein', '1651728584.jpg', 73.25, 60, 9, 'Within 2 days', 'This member of the cruciferous family is packed with protein & a wide range of other essential nutrients. Broccolis are packed with antioxidants that help in reducing cell damage. Adding this healthy vegetable to your daily diet can help in reducing blood sugar levels, and cholesterol levels & reduce the risk of developing chronic diseases as well. Broccoli contains various bioactive compounds which help in reducing inflammation within the body. Eat it raw or cook it, this healthy addition to your diet will keep you vitalized for longer! Each 100g serving of Broccoli contains (Approx):  34 Calories, 0.4g Fat,  6.6g Carbs,  2.6g fiber,  2.8g Protein', 'This member of the cruciferous family is packed with protein & a wide range of other essential nutrients. Broccolis are packed with antioxidants that help in reducing cell damage. Adding this healthy vegetable to your daily diet can help in reducing blood sugar levels, and cholesterol levels & reduce the risk of developing chronic diseases as well. Broccoli contains various bioactive compounds which help in reducing inflammation within the body. Eat it raw or cook it, this healthy addition to your diet will keep you vitalized for longer! Each 100g serving of Broccoli contains (Approx):  34 Calories, 0.4g Fat,  6.6g Carbs,  2.6g fiber,  2.8g Protein', 0, 1, '2022-05-04 23:59:44', '2022-05-23 02:15:08'),
(3, 2, 'Tomato', 'The versatile tomato is everybody\'s favorite!   \r\nGet healthy skin & get rid of bad cholesterol with this fresh vegetable from our online vegetable store. You can order fresh tomatoes from our vegetable store & we will deliver them to your doorstep through our online vegetable delivery service. Ideally, tomatoes should be kept at room temperature. Keep them refrigerated by storing them away from other produce & in a dry cloth or perforated plastic bag. Use within one week of storage. Perfectly ripe tomatoes should be kept on the counter away from sunlight. Make sure they\'re layered & are not touching one another, and stem side up.', '1652161054.jpg', 33.6, 30, 10, 'Within 1 day', 'The versatile tomato is everybody\'s favorite!   \r\nGet healthy skin & get rid of bad cholesterol with this fresh vegetable from our online vegetable store. You can order fresh tomatoes from our vegetable store & we will deliver them to your doorstep through our online vegetable delivery service. Ideally, tomatoes should be kept at room temperature. Keep them refrigerated by storing them away from other produce & in a dry cloth or perforated plastic bag. Use within one week of storage. Perfectly ripe tomatoes should be kept on the counter away from sunlight. Make sure they\'re layered & are not touching one another, and stem side up.', 'The versatile tomato is everybody\'s favorite!', 0, 1, '2022-05-10 00:07:34', '2022-05-23 02:15:39'),
(4, 1, 'Raddish', '\"Its a must-have in your diet for a healthy lifestyle due to its nutrient-rich properties. Radishes are extremely low in calories but offer a wide range of nutrients like vitamins, minerals & antioxidants. Regular consumption of Radish has numerous health benefits like reduced risk of diabetes, enhanced liver function & cardiovascular improvement. A half-cup of radish contains approximately 9 calories, 1g fat, 1g fiber, 2g carbohydrates, 1g sugar & 23g Sodium.  Order fresh Red Radish from our online fruit & vegetable store & get it delivered through our online vegetable delivery service.', '1652161442.jpg', 34.91, 33.25, 9, 'Within 1 day', '\"Its a must-have in your diet for a healthy lifestyle due to its nutrient-rich properties. Radishes are extremely low in calories but offer a wide range of nutrients like vitamins, minerals & antioxidants. Regular consumption of Radish has numerous health benefits like reduced risk of diabetes, enhanced liver function & cardiovascular improvement. A half-cup of radish contains approximately 9 calories, 1g fat, 1g fiber, 2g carbohydrates, 1g sugar & 23g Sodium.  Order fresh Red Radish from our online fruit & vegetable store & get it delivered through our online vegetable delivery service.', '\"Its a must-have in your diet for a healthy lifestyle due to its nutrient-rich properties.', 0, 1, '2022-05-10 00:14:02', '2022-05-23 02:16:18'),
(5, 7, 'Sambar Cuts', 'The best Sambar is made from the freshest ingredients & we\'re bringing just that to you! \r\n\r\nWith fresh Sambar Cuts from Farmers Fresh Zone, making tasty sambar got a whole lot easier. Our Sambar cut includes precisely chopped fresh vegetables that add flavor, crunch & freshness to your Sambar.Get fresh Sambar Cuts delivered to you through our online fruit & vegetable delivery service', '1652161731.jpg', 99, 55, 1, 'Today', 'The best Sambar is made from the freshest ingredients & we\'re bringing just that to you! \r\n\r\nWith fresh Sambar Cuts from Farmers Fresh Zone, making tasty sambar got a whole lot easier. Our Sambar cut includes precisely chopped fresh vegetables that add flavor, crunch & freshness to your Sambar.Get fresh Sambar Cuts delivered to you through our online fruit & vegetable delivery service', 'Get fresh Sambar Cuts delivered to you through our online fruit & vegetable delivery service', 0, 1, '2022-05-10 00:18:51', '2022-05-10 00:18:51'),
(6, 7, 'Vegetable Salad Cuts', 'Vegetables are packed with protein, fiber, minerals & other essential nutrients that are important for a healthy body. Hence, it\'s important to include fresh vegetables in your daily diet, in order to stay healthy & free from health complications.', '1652196524.jpg', 100, 90, 8, 'Within 1 day', 'Vegetables are packed with protein, fiber, minerals & other essential nutrients that are important for a healthy body. Hence, it\'s important to include fresh vegetables in your daily diet, in order to stay healthy & free from health complications.\r\n\r\nFarmers Fresh Zone is now introducing an easy way to include fresh vegetables in your daily diet. The fresh Vegetable Salad Cuts include different types of nutrient-rich vegetables that enrich your diet with the goodness of protein, fiber & minerals. This Salad kit is perfect for those looking to eat healthy & lose some weight. Eat it as it is or pair it up with your favorite salad dressing, there are so many ways to enjoy the taste of fresh vegetables', 'Vegetables are packed with protein, fiber, minerals & other essential nutrients that are important for a healthy body. Hence, it\'s important to include fresh vegetables in your daily diet, in order to stay healthy & free from health complications.', 0, 1, '2022-05-10 09:58:44', '2022-05-23 02:13:48');

-- --------------------------------------------------------

--
-- Table structure for table `product_review`
--

CREATE TABLE `product_review` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL,
  `rating` varchar(20) NOT NULL,
  `review` text NOT NULL,
  `status` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_review`
--

INSERT INTO `product_review` (`id`, `customer_id`, `products_id`, `rating`, `review`, `status`, `added_on`) VALUES
(1, 22, 4, 'Very Good', 'Fresh Vegetables', 1, '2022-05-16 05:39:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders_details`
--
ALTER TABLE `orders_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders_status`
--
ALTER TABLE `orders_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_review`
--
ALTER TABLE `product_review`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `orders_details`
--
ALTER TABLE `orders_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `orders_status`
--
ALTER TABLE `orders_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product_review`
--
ALTER TABLE `product_review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



