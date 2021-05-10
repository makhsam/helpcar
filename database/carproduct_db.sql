-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 08 2021 г., 13:55
-- Версия сервера: 5.6.43
-- Версия PHP: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- База данных: `carproduct_db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', '5f4dcc3b5aa765d61d8327deb882cf99', 1, '2020-03-01 00:00:00', '2020-03-24 13:55:45');

-- --------------------------------------------------------

--
-- Структура таблицы `banners`
--

CREATE TABLE `banners` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `cart`
--

CREATE TABLE `cart` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `user_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `cart`
--

INSERT INTO `cart` (`id`, `product_id`, `product_name`, `price`, `quantity`, `user_email`, `session_id`, `created_at`, `updated_at`) VALUES
(32, 29, 'Nexia 2 Yelkan', '400000', 1, 'admin@gmail.com', 'pB2Q1Yl7naaORgCPf0RRuJt0B7gupZN1wiUnhfOO', NULL, NULL),
(34, 27, 'Lacetti vertu', '400000', 1, 'infohelpcar@email.com', 'gowgeIPKraLtcpppY9Q3QjOVVmLEGKUApaTVRTQh', NULL, NULL),
(35, 26, 'Spark Avtotikan', '400000', 1, 'admiiiin@gmail.com', 'HYJJqOwg5rkIarssluFUtMlx8tRw7pAPX043fE8i', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`, `description`, `url`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 0, 'Avtomobil faralari va chiroqlari', 'Avtomobil faralari va chiroqlari', 'Avtomobilfaralarivachiroqlari', 1, NULL, '2020-12-11 01:27:27', '2020-12-11 01:27:27'),
(2, 1, 'Avtomobil faralari', 'Avtomobil faralari', 'Avtomobilfaralari', 1, NULL, '2020-12-11 01:28:54', '2020-12-16 11:19:19'),
(3, 1, 'Avtomobil chiroqlari', 'Avtomobil chiroqlari', 'Avtomobilchiroqlari', 1, NULL, '2020-12-11 01:30:35', '2020-12-16 11:19:34'),
(4, 0, 'Avtomobil filtrlari', 'Avtomobil filtrlari', 'Avtomobilfiltrlari', 1, NULL, '2020-12-16 11:18:41', '2020-12-16 11:18:41'),
(5, 4, 'Benzin filtrlari', 'Benzin filtrlari', 'Benzinfiltrlari', 1, NULL, '2020-12-16 11:20:41', '2020-12-16 11:20:41'),
(8, 0, 'Avtomobil shinalari', 'Avtomobil shinalari va disklari', 'Avtomobilshinalarivadisklari', 1, NULL, '2020-12-16 11:53:16', '2020-12-16 11:57:35'),
(9, 8, 'Mavsumiy shinalar', 'Mavsumiy shinalar', 'Mavsumiyshinalar', 1, NULL, '2020-12-16 11:54:29', '2020-12-16 11:54:29'),
(10, 0, 'Avtomobil chixollari', 'Avtomobil chixollari', 'Avtomobilchixollari', 1, NULL, '2020-12-27 04:05:28', '2020-12-27 04:05:28'),
(12, 10, 'Cobalt', 'Cobalt', 'Cobalt', 1, NULL, '2020-12-27 04:27:43', '2020-12-27 05:49:05'),
(13, 10, 'Spark', 'Spark', 'Spark', 1, NULL, '2020-12-27 06:43:09', '2020-12-27 06:43:09'),
(14, 10, 'Lacetti', 'Lacetti', 'Lacetti', 1, NULL, '2020-12-27 07:08:26', '2020-12-27 07:08:26'),
(15, 10, 'Nexia 3', 'Nexia 3', 'Nexia3', 1, NULL, '2020-12-27 07:22:40', '2020-12-27 07:22:40'),
(16, 10, 'Nexia 2 ', 'Nexia 2 ', 'Nexia2', 1, NULL, '2020-12-27 07:47:02', '2020-12-27 07:47:02'),
(17, 10, 'Damas', 'Damas', 'Damas', 1, NULL, '2020-12-27 07:58:07', '2020-12-27 08:00:39');

-- --------------------------------------------------------

--
-- Структура таблицы `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `country_code` varchar(2) NOT NULL DEFAULT '',
  `country_name` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `coupons`
--

CREATE TABLE `coupons` (
  `id` int(10) UNSIGNED NOT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `amount_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiry_date` date NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `coupons`
--

INSERT INTO `coupons` (`id`, `coupon_code`, `amount`, `amount_type`, `expiry_date`, `status`, `created_at`, `updated_at`) VALUES
(1, '12345', 10, 'Percentage', '2020-12-25', 1, '2020-12-17 23:50:55', '2020-12-18 02:46:03');

-- --------------------------------------------------------

--
-- Структура таблицы `delivery_addresses`
--

CREATE TABLE `delivery_addresses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `delivery_addresses`
--

INSERT INTO `delivery_addresses` (`id`, `user_id`, `user_email`, `address`, `city`, `mobile`, `created_at`, `updated_at`) VALUES
(1, 21, '+99999', 'samarqand', 'samarqand', '999999999', '2020-12-18 23:47:21', '2020-12-23 10:25:33'),
(2, 22, '+9989999999', 'samarqand', 'samarqand', '+99899999', '2020-12-19 06:10:11', '2020-12-19 09:04:32'),
(3, 34, '+999999999', 'Samarqand', 'samarqand', '999999999', '2020-12-26 08:56:52', '2020-12-26 09:06:21');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_11_06_083952_create_category_table', 2),
(4, '2019_11_08_152332_create_products_table', 3),
(5, '2019_11_11_111023_create_products_attributes_table', 4),
(6, '2019_11_26_070355_create_cart_table', 5),
(7, '2019_12_04_052141_create_coupons_table', 6),
(8, '2020_03_28_150658_create_wish_list_table', 7);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon_amount` float NOT NULL,
  `order_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `grand_total` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `user_email`, `name`, `address`, `city`, `mobile`, `coupon_code`, `coupon_amount`, `order_status`, `payment_method`, `grand_total`, `created_at`, `updated_at`) VALUES
(7, 21, '+99999', 'admin', 'samarqand', 'samarqand', '999999999', '12345', 15000, 'New', 'Payme', '135000', '2020-12-21 10:19:11', '2020-12-21 05:19:11'),
(8, 21, '+99999', 'admin', 'samarqand', 'samarqand', '999999999', '', 0, 'New', 'Payme', '150000', '2020-12-21 11:02:11', '2020-12-21 06:02:11'),
(9, 21, '+99999', 'admin', 'samarqand', 'samarqand', '999999999', '', 0, 'New', 'Payme', '150000', '2020-12-22 05:40:34', '2020-12-22 00:40:34'),
(10, 21, '+99999', 'admin', 'samarqand', 'samarqand', '999999999', '', 0, 'New', 'Payme', '150000', '2020-12-22 06:06:35', '2020-12-22 01:06:35'),
(11, 21, '+99999', 'admin', 'samarqand', 'samarqand', '999999999', '12345', 15000, 'New', 'Payme', '285000', '2020-12-23 15:25:54', '2020-12-23 10:25:54');

-- --------------------------------------------------------

--
-- Структура таблицы `orders_products`
--

CREATE TABLE `orders_products` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_qty` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `orders_products`
--

INSERT INTO `orders_products` (`id`, `order_id`, `user_id`, `product_id`, `product_name`, `product_price`, `product_qty`, `created_at`, `updated_at`) VALUES
(12, 7, 21, 20, 'Hyundai samosval uchun faralar chapga va o\'ngga', '150000', 1, '2020-12-21 10:19:12', '2020-12-21 05:19:12'),
(13, 8, 21, 2, 'Avtomobil yoritgichi BOSCH H7 Pure Light 12v 55w PX26d', '150000', 1, '2020-12-21 11:02:11', '2020-12-21 06:02:11'),
(14, 9, 21, 11, 'Hyundai samosval uchun faralar chapga va o\'ngga', '150000', 1, '2020-12-22 05:40:34', '2020-12-22 00:40:34'),
(15, 11, 21, 17, 'Hyundai samosval uchun faralar chapga va o\'ngga', '150000', 1, '2020-12-23 15:25:55', '2020-12-23 10:25:55'),
(16, 11, 21, 11, 'Hyundai samosval uchun faralar chapga va o\'ngga', '150000', 1, '2020-12-23 15:25:55', '2020-12-23 10:25:55');

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price_two` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `new` tinyint(1) NOT NULL DEFAULT '0',
  `popular` tinyint(1) NOT NULL DEFAULT '0',
  `best` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `category_id`, `product_name`, `description`, `price`, `price_two`, `image`, `status`, `featured`, `new`, `popular`, `best`, `created_at`, `updated_at`) VALUES
(25, 12, 'Cobalt Avtotikan', ' Avtotikan', '400000', '350000', '95803.jpg', 1, 1, 1, 1, 1, '2020-12-27 04:42:17', '2020-12-27 04:42:17'),
(26, 13, 'Spark Avtotikan', 'Avtotikan', '400000', '350000', '15749.jpg', 1, 1, 1, 1, 0, '2020-12-27 06:51:09', '2020-12-27 06:51:09'),
(27, 14, 'Lacetti vertu', 'Lacetti vertu', '400000', '350000', '44784.jpg', 1, 1, 1, 1, 1, '2020-12-27 07:14:08', '2020-12-27 07:14:08'),
(28, 15, 'Nexia 3 . Yelkan . BMW', 'Nexia 3 . Yelkan . BMW', '400000', '350000', '64790.jpg', 1, 1, 1, 1, 1, '2020-12-27 07:26:17', '2020-12-27 07:40:40'),
(29, 16, 'Nexia 2 Yelkan', 'Nexia 2 Yelkan', '400000', '350000', '18227.jpg', 1, 1, 1, 1, 1, '2020-12-27 07:52:53', '2020-12-27 07:52:53'),
(30, 17, 'Damas yelkan', 'Damas yelkan', '550000', '500000', '82041.jpg', 1, 1, 1, 1, 1, '2020-12-27 08:02:18', '2020-12-27 08:02:18'),
(31, 12, 'Cobalt Avtotikan', ' Avtotikan', '400000', '350000', '95803.jpg', 1, 1, 1, 1, 1, '2020-12-27 04:42:17', '2020-12-27 04:42:17'),
(32, 13, 'Spark Avtotikan', 'Avtotikan', '400000', '350000', '15749.jpg', 1, 1, 1, 1, 0, '2020-12-27 06:51:09', '2020-12-27 06:51:09');

-- --------------------------------------------------------

--
-- Структура таблицы `products_attributes`
--

CREATE TABLE `products_attributes` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `products_attributes`
--

INSERT INTO `products_attributes` (`id`, `product_id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 25, 'brand', 'Cardinar', '2020-12-27 06:08:22', '2020-12-27 06:08:22'),
(2, 26, 'brand', 'Cardinar', '2020-12-27 06:54:58', '2020-12-27 06:54:58'),
(4, 27, 'brand', 'Cardinar', '2020-12-27 07:18:28', '2020-12-27 07:18:28');

-- --------------------------------------------------------

--
-- Структура таблицы `products_images`
--

CREATE TABLE `products_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `products_images`
--

INSERT INTO `products_images` (`id`, `product_id`, `image`, `created_at`, `updated_at`) VALUES
(1, 8, '84944.jpg', '2020-12-17 07:23:18', '2020-12-17 02:23:18'),
(2, 8, '48474.jpg', '2020-12-17 07:23:48', '2020-12-17 02:23:48'),
(3, 25, '46629.jpg', '2020-12-27 09:43:25', '2020-12-27 04:43:25'),
(4, 25, '58455.jpg', '2020-12-27 09:43:27', '2020-12-27 04:43:27'),
(5, 25, '53392.jpg', '2020-12-27 09:43:29', '2020-12-27 04:43:29'),
(6, 26, '90581.jpg', '2020-12-27 12:03:01', '2020-12-27 07:03:01'),
(7, 26, '62309.jpg', '2020-12-27 12:03:03', '2020-12-27 07:03:03'),
(8, 27, '9883.jpg', '2020-12-27 12:16:38', '2020-12-27 07:16:38'),
(9, 27, '75469.jpg', '2020-12-27 12:16:42', '2020-12-27 07:16:42'),
(12, 28, '79343.jpg', '2020-12-27 12:38:35', '2020-12-27 07:38:35'),
(13, 28, '31721.jpg', '2020-12-27 12:38:37', '2020-12-27 07:38:37'),
(14, 28, '33578.jpg', '2020-12-27 12:38:39', '2020-12-27 07:38:39'),
(15, 29, '89886.jpg', '2020-12-27 12:54:06', '2020-12-27 07:54:06'),
(16, 29, '2131.jpg', '2020-12-27 12:54:08', '2020-12-27 07:54:08'),
(17, 29, '70941.jpg', '2020-12-27 12:54:10', '2020-12-27 07:54:10'),
(18, 30, '45654.jpg', '2020-12-27 13:03:36', '2020-12-27 08:03:36'),
(19, 30, '31508.jpg', '2020-12-27 13:03:38', '2020-12-27 08:03:38');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) DEFAULT '0',
  `status` tinyint(4) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `admin`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', NULL, '$2y$10$ZUzQzfXXkH/jVHG.ZYIlMuMiCQINxh4GnNwAhrKUK4PEM53n62ZFS', NULL, 1, 0, '2019-11-04 04:51:46', '2020-06-14 01:58:32'),
(21, 'admin', '+99999', NULL, '$2y$10$hLcRiX2SvmEPt84uzXkdve9xlFUQ07PziMWmB.vNXhvcLtVxTUHKC', NULL, 0, 0, '2020-12-18 05:34:13', '2020-12-18 05:34:13'),
(22, 'Admin', '+9989999999', NULL, '$2y$10$NwYbrtm4z8MNezmE6eVJw.eeIm4L7KEYD1cRzUpidjzIch/fXVhwe', NULL, 0, 0, '2020-12-19 04:32:50', '2020-12-19 04:32:50'),
(32, 'admin', 'admiin@gmail.com', NULL, '$2y$10$gccj0jHBKJkvyoY.RniGfum8uo9.C1ZdhuW0cCn/vbkKdm8MEpRYy', NULL, 0, 0, '2020-12-26 08:07:01', '2020-12-26 08:07:01'),
(34, 'admin', '+999999999', NULL, '$2y$10$8jwwa.9NRwkqHJqRw/S9wOg8dNUN9MrRHLAIWmpSuZo3vQ2qk4FaO', NULL, 0, 0, '2020-12-26 08:53:53', '2020-12-26 08:53:53'),
(35, 'Muxammadjon', 'infohelpcar@email.com', NULL, '$2y$10$5oF4gwBpASYauMB/B1q6HuXU3thwJt34avQzNX2.wEWAas1iE7C.O', NULL, 0, 0, '2020-12-28 06:06:28', '2020-12-28 06:06:28'),
(36, 'admin', 'admiiiin@gmail.com', NULL, '$2y$10$sgj.xOxjkSoY6VI91krezeLaegmmgpIbxl4Jl6qtwtPk6WrNKUFaW', NULL, 0, 0, '2021-01-08 05:00:17', '2021-01-08 05:00:17');

-- --------------------------------------------------------

--
-- Структура таблицы `wish_list`
--

CREATE TABLE `wish_list` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `user_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `wish_list`
--

INSERT INTO `wish_list` (`id`, `product_id`, `product_name`, `price`, `quantity`, `user_email`, `created_at`, `updated_at`) VALUES
(3, 29, 'Nexia 2 Yelkan', 400000.00, 1, 'infohelpcar@email.com', '2021-01-08 04:50:54', NULL),
(5, 27, 'Lacetti vertu', 400000.00, 1, 'admiiiin@gmail.com', '2021-01-08 05:01:32', NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `delivery_addresses`
--
ALTER TABLE `delivery_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders_products`
--
ALTER TABLE `orders_products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `products_attributes`
--
ALTER TABLE `products_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `products_images`
--
ALTER TABLE `products_images`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Индексы таблицы `wish_list`
--
ALTER TABLE `wish_list`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT для таблицы `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `delivery_addresses`
--
ALTER TABLE `delivery_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `orders_products`
--
ALTER TABLE `orders_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT для таблицы `products_attributes`
--
ALTER TABLE `products_attributes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `products_images`
--
ALTER TABLE `products_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT для таблицы `wish_list`
--
ALTER TABLE `wish_list`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;
