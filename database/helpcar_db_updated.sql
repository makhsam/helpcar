-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.7.24 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table abdumalik_helpcar.admins
CREATE TABLE IF NOT EXISTS `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table abdumalik_helpcar.admins: ~0 rows (approximately)
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` (`id`, `username`, `password`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'admin', '5f4dcc3b5aa765d61d8327deb882cf99', 1, '2020-03-01 00:00:00', '2020-03-24 06:55:45');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;

-- Dumping structure for table abdumalik_helpcar.banners
CREATE TABLE IF NOT EXISTS `banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table abdumalik_helpcar.banners: ~0 rows (approximately)
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;

-- Dumping structure for table abdumalik_helpcar.cart
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `user_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table abdumalik_helpcar.cart: ~4 rows (approximately)
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;

-- Dumping structure for table abdumalik_helpcar.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table abdumalik_helpcar.categories: ~14 rows (approximately)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `parent_id`, `name`, `description`, `url`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 0, 'Avtomobil shinalari va disklari', 'Avtomobil shinalari va disklari', 'avtomobil-shinalari-va-disklari', 1, NULL, '2020-12-10 17:27:27', '2021-05-10 13:30:43'),
	(2, 1, 'Avtomobil shinalari', 'Avtomobil shinalari', 'avtomobil-shinalari', 1, NULL, '2020-12-10 17:28:54', '2021-05-10 13:32:12'),
	(3, 1, 'Avtomobil diskalari', 'Avtomobil diskalari', 'avtomobil-diskalari', 1, NULL, '2020-12-10 17:30:35', '2021-05-10 13:32:41'),
	(4, 0, 'Avtomobil filtrlari', 'Avtomobil filtrlari', 'avtomobil-filtrlari', 1, NULL, '2020-12-16 03:18:41', '2021-05-10 14:03:18'),
	(5, 4, 'Benzin filtrlari', 'Benzin filtrlari', 'benzin-filtrlari', 1, NULL, '2020-12-16 03:20:41', '2021-05-10 14:03:34'),
	(8, 0, 'Akkumulyatorlar', 'Avtomobil akkumulyatorlari', 'avtomobil-akkumulyatorlari', 1, NULL, '2020-12-16 03:53:16', '2021-05-10 14:08:09'),
	(10, 0, 'Avtomobil chixollari', 'Avtomobil chixollari', 'Avtomobilchixollari', 1, NULL, '2020-12-26 20:05:28', '2020-12-26 20:05:28'),
	(12, 10, 'Cobalt', 'Cobalt', 'Cobalt', 1, NULL, '2020-12-26 20:27:43', '2020-12-26 21:49:05'),
	(13, 10, 'Spark', 'Spark', 'Spark', 1, NULL, '2020-12-26 22:43:09', '2020-12-26 22:43:09'),
	(14, 10, 'Lacetti', 'Lacetti', 'Lacetti', 1, NULL, '2020-12-26 23:08:26', '2020-12-26 23:08:26'),
	(15, 10, 'Nexia 3', 'Nexia 3', 'Nexia3', 1, NULL, '2020-12-26 23:22:40', '2020-12-26 23:22:40'),
	(16, 10, 'Nexia 2 ', 'Nexia 2 ', 'Nexia2', 1, NULL, '2020-12-26 23:47:02', '2020-12-26 23:47:02'),
	(17, 10, 'Damas', 'Damas', 'Damas', 1, NULL, '2020-12-26 23:58:07', '2020-12-27 00:00:39'),
	(18, 4, 'Moy filtrlari', 'Moy filtrlari', 'moy-filtrlari', 1, NULL, '2021-05-10 14:02:31', '2021-05-10 14:02:31'),
	(19, 8, 'Barcha akkumulyatorlar', 'Barcha akkumulyatorlar', 'barcha-akkumulyatorlar', 1, NULL, '2021-05-10 14:10:34', '2021-05-10 14:10:34');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Dumping structure for table abdumalik_helpcar.countries
CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_code` varchar(2) NOT NULL DEFAULT '',
  `country_name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=248 DEFAULT CHARSET=utf8;

-- Dumping data for table abdumalik_helpcar.countries: 0 rows
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` (`id`, `country_code`, `country_name`) VALUES
	(247, 'UZ', 'Uzbekistan');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;

-- Dumping structure for table abdumalik_helpcar.coupons
CREATE TABLE IF NOT EXISTS `coupons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `amount_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiry_date` date NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table abdumalik_helpcar.coupons: ~0 rows (approximately)
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
INSERT INTO `coupons` (`id`, `coupon_code`, `amount`, `amount_type`, `expiry_date`, `status`, `created_at`, `updated_at`) VALUES
	(1, '12345', 10, 'Percentage', '2021-12-25', 1, '2020-12-17 15:50:55', '2021-05-10 16:24:09');
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;

-- Dumping structure for table abdumalik_helpcar.delivery_addresses
CREATE TABLE IF NOT EXISTS `delivery_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table abdumalik_helpcar.delivery_addresses: ~3 rows (approximately)
/*!40000 ALTER TABLE `delivery_addresses` DISABLE KEYS */;
INSERT INTO `delivery_addresses` (`id`, `user_id`, `user_email`, `address`, `city`, `mobile`, `created_at`, `updated_at`) VALUES
	(4, 38, 'suratovabdumalik@gmail.com', 'Beruniy, 12, Tashkent', 'Tashkent', '+998998422754', '2021-05-10 16:16:06', '2021-05-10 16:57:01');
/*!40000 ALTER TABLE `delivery_addresses` ENABLE KEYS */;

-- Dumping structure for table abdumalik_helpcar.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table abdumalik_helpcar.migrations: ~8 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_11_06_083952_create_category_table', 2),
	(4, '2019_11_08_152332_create_products_table', 3),
	(5, '2019_11_11_111023_create_products_attributes_table', 4),
	(6, '2019_11_26_070355_create_cart_table', 5),
	(7, '2019_12_04_052141_create_coupons_table', 6),
	(8, '2020_03_28_150658_create_wish_list_table', 7);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table abdumalik_helpcar.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table abdumalik_helpcar.orders: ~5 rows (approximately)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`id`, `user_id`, `user_email`, `name`, `address`, `city`, `mobile`, `coupon_code`, `coupon_amount`, `order_status`, `payment_method`, `grand_total`, `created_at`, `updated_at`) VALUES
	(12, 38, 'suratovabdumalik@gmail.com', 'Abdumalik Suratov', 'Beruniy, 12, Tashkent', 'Tashkent', '+998998422754', '', 0, 'New', 'Payme', '1350000', '2021-05-10 16:17:19', '2021-05-10 16:17:19'),
	(13, 38, 'suratovabdumalik@gmail.com', 'Abdumalik Suratov', 'Beruniy, 12, Tashkent', 'Tashkent', '+998998422754', '12345', 53000, 'New', 'Payme', '477000', '2021-05-10 16:24:41', '2021-05-10 16:24:41'),
	(14, 38, 'suratovabdumalik@gmail.com', 'Abdumalik Suratov', 'Beruniy, 12, Tashkent', 'Tashkent', '+998998422754', '12345', 53000, 'New', 'Payme', '-53000', '2021-05-10 16:34:50', '2021-05-10 16:34:50'),
	(15, 38, 'suratovabdumalik@gmail.com', 'Abdumalik Suratov', 'Beruniy, 12, Tashkent', 'Tashkent', '+998998422754', '', 0, 'New', 'Payme', '550000', '2021-05-10 16:55:31', '2021-05-10 16:55:31'),
	(16, 38, 'suratovabdumalik@gmail.com', 'Abdumalik Suratov', 'Beruniy, 12, Tashkent', 'Tashkent', '+998998422754', '', 0, 'New', 'Payme', '1400000', '2021-05-10 16:57:38', '2021-05-10 16:57:38'),
	(17, 38, 'suratovabdumalik@gmail.com', 'Abdumalik Suratov', 'Beruniy, 12, Tashkent', 'Tashkent', '+998998422754', '', 0, 'New', 'Payme', '1400000', '2021-05-10 16:59:19', '2021-05-10 16:59:19');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Dumping structure for table abdumalik_helpcar.orders_products
CREATE TABLE IF NOT EXISTS `orders_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_qty` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table abdumalik_helpcar.orders_products: ~5 rows (approximately)
/*!40000 ALTER TABLE `orders_products` DISABLE KEYS */;
INSERT INTO `orders_products` (`id`, `order_id`, `user_id`, `product_id`, `product_name`, `product_price`, `product_qty`, `created_at`, `updated_at`) VALUES
	(17, 12, 38, 42, 'Batareya Gentry Turkiya 40A', '450000', 3, '2021-05-10 16:17:19', '2021-05-10 16:17:19'),
	(18, 13, 38, 35, 'Dunlop 285/60/18 shinalari', '530000', 1, '2021-05-10 16:24:41', '2021-05-10 16:24:41'),
	(19, 15, 38, 34, 'Kumho Solus 185 / 65R14 86T TA11 avtomobil shinalari', '550000', 1, '2021-05-10 16:55:31', '2021-05-10 16:55:31'),
	(20, 16, 38, 36, 'Nexen Roadian HTX RH5 245/60 R18 105H avtoshinalari', '1000000', 1, '2021-05-10 16:57:38', '2021-05-10 16:57:38'),
	(21, 16, 38, 31, 'Cobalt Avtotikan', '400000', 1, '2021-05-10 16:57:38', '2021-05-10 16:57:38');
/*!40000 ALTER TABLE `orders_products` ENABLE KEYS */;

-- Dumping structure for table abdumalik_helpcar.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table abdumalik_helpcar.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table abdumalik_helpcar.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table abdumalik_helpcar.products: ~8 rows (approximately)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `category_id`, `product_name`, `product_code`, `description`, `price`, `price_two`, `image`, `status`, `featured`, `new`, `popular`, `best`, `created_at`, `updated_at`) VALUES
	(25, 12, 'Cobalt Avtotikan', '', ' Avtotikan', '400000', '350000', '95803.jpg', 1, 1, 1, 1, 1, '2020-12-26 20:42:17', '2020-12-26 20:42:17'),
	(26, 13, 'Spark Avtotikan', '', 'Avtotikan', '400000', '350000', '15749.jpg', 1, 1, 1, 1, 0, '2020-12-26 22:51:09', '2020-12-26 22:51:09'),
	(27, 14, 'Lacetti vertu', '', 'Lacetti vertu', '400000', '350000', '44784.jpg', 1, 1, 1, 1, 1, '2020-12-26 23:14:08', '2020-12-26 23:14:08'),
	(28, 15, 'Nexia 3 . Yelkan . BMW', '', 'Nexia 3 . Yelkan . BMW', '400000', '350000', '64790.jpg', 1, 1, 1, 1, 1, '2020-12-26 23:26:17', '2020-12-26 23:40:40'),
	(29, 16, 'Nexia 2 Yelkan', '', 'Nexia 2 Yelkan', '400000', '350000', '18227.jpg', 1, 1, 1, 1, 1, '2020-12-26 23:52:53', '2020-12-26 23:52:53'),
	(30, 17, 'Damas yelkan', '', 'Damas yelkan', '550000', '500000', '82041.jpg', 1, 1, 1, 1, 1, '2020-12-27 00:02:18', '2020-12-27 00:02:18'),
	(31, 12, 'Cobalt Avtotikan', '', ' Avtotikan', '400000', '350000', '95803.jpg', 1, 1, 1, 1, 1, '2020-12-26 20:42:17', '2020-12-26 20:42:17'),
	(32, 13, 'Spark Avtotikan', '', 'Avtotikan', '400000', '350000', '15749.jpg', 1, 1, 1, 1, 0, '2020-12-26 22:51:09', '2020-12-26 22:51:09'),
	(33, 2, 'Michelin CrossClimate SUV 235/55 R17 103V XL shinalari', NULL, '-', '580000', '580000', '51796.png', 1, 1, 1, 1, 1, '2021-05-10 13:35:59', '2021-05-10 13:35:59'),
	(34, 2, 'Kumho Solus 185 / 65R14 86T TA11 avtomobil shinalari', NULL, '-', '550000', '540000', '17519.jpg', 1, 1, 1, 0, 0, '2021-05-10 13:38:01', '2021-05-10 13:38:01'),
	(35, 2, 'Dunlop 285/60/18 shinalari', NULL, '-', '530000', '525000', '79375.jpg', 1, 1, 1, 1, 1, '2021-05-10 13:39:57', '2021-05-10 13:39:57'),
	(36, 2, 'Nexen Roadian HTX RH5 245/60 R18 105H avtoshinalari', NULL, '-', '1000000', '1000000', '1021.jpg', 1, 1, 1, 1, 1, '2021-05-10 13:41:48', '2021-05-10 13:41:48'),
	(37, 3, 'Vossen 3-sonli qotishma avtomobil g\'ildiraklari', NULL, '-', '2868000', '2868000', '6003.jpg', 1, 0, 0, 1, 1, '2021-05-10 13:47:58', '2021-05-10 13:47:58'),
	(38, 3, 'Диски литые автомобильные Chevrolet R 18', NULL, '-', '2500000', '2500000', '24877.jpg', 1, 1, 0, 1, 1, '2021-05-10 13:51:17', '2021-05-10 13:51:17'),
	(39, 3, 'Avtomobil g\'ildiraklari 27', NULL, '-', '2390000', '2390000', '43913.jpg', 1, 1, 1, 1, 1, '2021-05-10 13:54:10', '2021-05-10 13:54:10'),
	(40, 3, 'Avtomobil g\'ildiraklari 38', NULL, '-', '6214000', '6214000', '24617.jpg', 1, 1, 1, 1, 1, '2021-05-10 13:55:53', '2021-05-10 13:55:53'),
	(41, 19, 'Batareya ISTA MAXCT 6CT 50AH (UKRAINE)', NULL, '-', '423788', '423788', '73583.png', 1, 1, 1, 1, 1, '2021-05-10 14:13:29', '2021-05-10 14:13:29'),
	(42, 19, 'Batareya Gentry Turkiya 40A', NULL, '-', '450000', '450000', '93877.jpg', 1, 1, 1, 1, 1, '2021-05-10 14:15:10', '2021-05-10 14:15:10'),
	(43, 19, 'Atlant Kitay 90A batareyasi', NULL, '-', '400000', '400000', '15881.jpg', 1, 1, 1, 1, 1, '2021-05-10 14:16:31', '2021-05-10 14:16:31'),
	(44, 19, 'Batareya Delkor DF60L', NULL, '-', '689000', '689000', '82058.jpg', 1, 1, 1, 1, 1, '2021-05-10 14:17:57', '2021-05-10 14:17:57'),
	(45, 5, 'Yoqilg\'i filtri Carstation', NULL, '-', '82000', '82000', '51110.jpg', 1, 1, 1, 1, 1, '2021-05-10 14:21:17', '2021-05-10 14:21:17'),
	(46, 5, 'Nexia (Janubiy Koreya) yonilg\'i filtri', NULL, '-', '25000', '25000', '81013.png', 1, 1, 1, 1, 1, '2021-05-10 14:24:00', '2021-05-10 14:24:00'),
	(47, 5, 'Yoqilg\'i filtri 31111-37300 ORIGINAL KOREYA', NULL, '-', '30000', '30000', '57549.jpg', 1, 1, 1, 1, 1, '2021-05-10 15:02:21', '2021-05-10 15:02:21'),
	(48, 5, 'Matiz, Lasetti, Nexia 3 (Janubiy Koreya) yoqilg\'i filtri', NULL, '-', '27560', '27560', '94769.png', 1, 1, 1, 1, 1, '2021-05-10 15:05:02', '2021-05-10 15:05:02'),
	(49, 18, 'Масляные фильтры Sampiyon', NULL, '-', '10000', '10000', '28418.jpg', 1, 1, 1, 1, 1, '2021-05-10 15:09:59', '2021-05-10 15:09:59'),
	(50, 18, 'Yog \'filtri 26320-27400 SANTAFE', NULL, '-', '12000', '12000', '66587.jpg', 1, 1, 1, 1, 1, '2021-05-10 15:11:03', '2021-05-10 15:11:03'),
	(51, 18, 'GM moy filtri', NULL, '-', '21200', '21200', '21164.jpg', 1, 1, 1, 1, 1, '2021-05-10 15:12:10', '2021-05-10 15:12:10'),
	(52, 18, 'Yoqilg\'i filtri MOBIS', NULL, '-', '14000', '14000', '56606.png', 1, 1, 1, 1, 1, '2021-05-10 15:13:19', '2021-05-10 15:13:19');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Dumping structure for table abdumalik_helpcar.products_attributes
CREATE TABLE IF NOT EXISTS `products_attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table abdumalik_helpcar.products_attributes: ~3 rows (approximately)
/*!40000 ALTER TABLE `products_attributes` DISABLE KEYS */;
INSERT INTO `products_attributes` (`id`, `product_id`, `name`, `description`, `created_at`, `updated_at`) VALUES
	(1, 25, 'brand', 'Cardinar', '2020-12-26 22:08:22', '2020-12-26 22:08:22'),
	(2, 26, 'brand', 'Cardinar', '2020-12-26 22:54:58', '2020-12-26 22:54:58'),
	(4, 27, 'brand', 'Cardinar', '2020-12-26 23:18:28', '2020-12-26 23:18:28');
/*!40000 ALTER TABLE `products_attributes` ENABLE KEYS */;

-- Dumping structure for table abdumalik_helpcar.products_images
CREATE TABLE IF NOT EXISTS `products_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- Dumping data for table abdumalik_helpcar.products_images: ~17 rows (approximately)
/*!40000 ALTER TABLE `products_images` DISABLE KEYS */;
INSERT INTO `products_images` (`id`, `product_id`, `image`, `created_at`, `updated_at`) VALUES
	(1, 8, '84944.jpg', '2020-12-17 07:23:18', '2020-12-16 18:23:18'),
	(2, 8, '48474.jpg', '2020-12-17 07:23:48', '2020-12-16 18:23:48'),
	(3, 25, '46629.jpg', '2020-12-27 09:43:25', '2020-12-26 20:43:25'),
	(4, 25, '58455.jpg', '2020-12-27 09:43:27', '2020-12-26 20:43:27'),
	(5, 25, '53392.jpg', '2020-12-27 09:43:29', '2020-12-26 20:43:29'),
	(6, 26, '90581.jpg', '2020-12-27 12:03:01', '2020-12-26 23:03:01'),
	(7, 26, '62309.jpg', '2020-12-27 12:03:03', '2020-12-26 23:03:03'),
	(8, 27, '9883.jpg', '2020-12-27 12:16:38', '2020-12-26 23:16:38'),
	(9, 27, '75469.jpg', '2020-12-27 12:16:42', '2020-12-26 23:16:42'),
	(12, 28, '79343.jpg', '2020-12-27 12:38:35', '2020-12-26 23:38:35'),
	(13, 28, '31721.jpg', '2020-12-27 12:38:37', '2020-12-26 23:38:37'),
	(14, 28, '33578.jpg', '2020-12-27 12:38:39', '2020-12-26 23:38:39'),
	(15, 29, '89886.jpg', '2020-12-27 12:54:06', '2020-12-26 23:54:06'),
	(16, 29, '2131.jpg', '2020-12-27 12:54:08', '2020-12-26 23:54:08'),
	(17, 29, '70941.jpg', '2020-12-27 12:54:10', '2020-12-26 23:54:10'),
	(18, 30, '45654.jpg', '2020-12-27 13:03:36', '2020-12-27 00:03:36'),
	(19, 30, '31508.jpg', '2020-12-27 13:03:38', '2020-12-27 00:03:38');
/*!40000 ALTER TABLE `products_images` ENABLE KEYS */;

-- Dumping structure for table abdumalik_helpcar.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) DEFAULT '0',
  `status` tinyint(4) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table abdumalik_helpcar.users: ~8 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `admin`, `status`, `created_at`, `updated_at`) VALUES
	(38, 'Abdumalik Suratov', 'suratovabdumalik@gmail.com', NULL, '$2y$10$mXomWtJReodTTstrL3.u5.5iXZohnYDisSsdN27vPSeCRDWPb3GRK', NULL, 0, 0, '2021-05-10 11:59:54', '2021-05-10 12:37:33');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table abdumalik_helpcar.wish_list
CREATE TABLE IF NOT EXISTS `wish_list` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `user_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table abdumalik_helpcar.wish_list: ~2 rows (approximately)
/*!40000 ALTER TABLE `wish_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `wish_list` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
