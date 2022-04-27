-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2022 at 02:41 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `web-online`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `CatID` int(11) UNSIGNED NOT NULL,
  `CatName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`CatID`, `CatName`) VALUES
(1, 'Thiết bị số'),
(2, 'Thời trang'),
(3, 'Giày'),
(4, 'Gia dụng');

-- --------------------------------------------------------

--
-- Table structure for table `categoriesnext`
--

CREATE TABLE `categoriesnext` (
  `CatIDNext` int(11) UNSIGNED NOT NULL,
  `CatNextName` varchar(50) NOT NULL,
  `CatID` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categoriesnext`
--

INSERT INTO `categoriesnext` (`CatIDNext`, `CatNextName`, `CatID`) VALUES
(1, 'Điện thoại', 1),
(2, 'Máy tính bảng/Laptop', 1),
(3, 'Áo', 2),
(4, 'Quần', 2),
(5, 'Balo/Túi xách', 2),
(6, 'Giày thể thao', 3),
(7, 'Giày tây', 3),
(8, 'Đồ dùng nhà bếp', 4),
(9, 'Thiết bị gia đình', 4);

-- --------------------------------------------------------

--
-- Table structure for table `favorite`
--

CREATE TABLE `favorite` (
  `ProID` int(10) UNSIGNED NOT NULL,
  `username` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `favorite`
--

INSERT INTO `favorite` (`ProID`, `username`) VALUES
(2, '19127552'),
(4, 'thaothao');

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `ID` int(11) UNSIGNED NOT NULL,
  `ProID` int(11) UNSIGNED NOT NULL,
  `OrderID` int(11) NOT NULL,
  `Quantity` int(15) NOT NULL,
  `Price` int(15) NOT NULL,
  `Amount` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`ID`, `ProID`, `OrderID`, `Quantity`, `Price`, `Amount`) VALUES
(3, 23, 0, 3, 5000000, 15000000),
(4, 1, 0, 1, 8000000, 8000000),
(5, 2, 0, 1, 10000000, 10000000),
(6, 3, 0, 1, 10000000, 10000000),
(7, 13, 0, 1, 17000000, 17000000),
(8, 1, 0, 2, 8000000, 16000000),
(9, 33, 0, 2, 5000000, 10000000),
(10, 34, 0, 1, 8000000, 8000000),
(11, 35, 0, 1, 9000000, 9000000),
(12, 1, 0, 1, 8000000, 8000000),
(13, 1, 0, 1, 8000000, 8000000),
(14, 2, 0, 1, 10000000, 10000000),
(15, 3, 0, 1, 10000000, 10000000),
(16, 56, 0, 1, 9000000, 9000000),
(17, 56, 0, 1, 9000000, 9000000),
(18, 23, 0, 1, 5000000, 5000000),
(19, 1, 13, 2, 8000000, 16000000),
(20, 2, 13, 1, 10000000, 10000000),
(21, 56, 14, 1, 9000000, 9000000),
(22, 57, 14, 1, 9000000, 9000000),
(23, 1, 16, 3, 8000000, 24000000),
(24, 2, 16, 1, 10000000, 10000000),
(25, 13, 17, 1, 17000000, 17000000);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) UNSIGNED NOT NULL,
  `UserID` int(11) NOT NULL,
  `OrderDate` datetime NOT NULL,
  `Total` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderID`, `UserID`, `OrderDate`, `Total`) VALUES
(1, 24, '2022-04-27 00:57:50', 15000000),
(2, 24, '2022-04-27 00:58:55', 15000000),
(3, 24, '2022-04-27 01:03:12', 43000000),
(4, 24, '2022-04-27 01:07:06', 43000000),
(5, 24, '2022-04-27 01:30:04', 17000000),
(6, 24, '2022-04-27 02:13:49', 16000000),
(7, 24, '2022-04-27 02:35:06', 27000000),
(8, 24, '2022-04-27 02:37:36', 8000000),
(9, 24, '2022-04-27 02:45:08', 9000000),
(10, 24, '2022-04-27 02:46:41', 9000000),
(11, 24, '2022-04-27 02:49:50', 5000000),
(12, 24, '2022-04-27 02:58:17', 18000000),
(13, 24, '2022-04-27 02:59:03', 26000000),
(14, 24, '2022-04-27 03:02:19', 18000000),
(15, 24, '2022-04-27 03:02:19', 0),
(16, 25, '2022-04-27 07:37:54', 34000000),
(17, 25, '2022-04-27 07:38:28', 17000000);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ProID` int(11) UNSIGNED NOT NULL,
  `ProName` varchar(50) NOT NULL,
  `Price` int(10) UNSIGNED NOT NULL,
  `Description` text NOT NULL,
  `CatIDNext` int(11) UNSIGNED NOT NULL,
  `Supplier` varchar(100) DEFAULT NULL,
  `isVerify` tinyint(1) NOT NULL DEFAULT 1,
  `DateEndDis` datetime DEFAULT NULL,
  `BuyerCount` int(100) NOT NULL DEFAULT 0,
  `LikeCount` int(50) NOT NULL DEFAULT 0,
  `Status` varchar(50) NOT NULL DEFAULT 'Còn hàng',
  `DateUpload` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProID`, `ProName`, `Price`, `Description`, `CatIDNext`, `Supplier`, `isVerify`, `DateEndDis`, `BuyerCount`, `LikeCount`, `Status`, `DateUpload`) VALUES
(1, 'REALME 8 Pro 8GB - 128GB', 8000000, '<p>Thương hiệu: Realme</p> <p>Xuất xứ: Trung Quốc</p> <p>Thời gian bảo h&agrave;nh: 12 Th&aacute;ng</p> <p>M&agrave;n h&igrave;nh: 6.4&quot;, FHD+, Super AMOLED, 1080 x 2400 Pixel</p> <p>Camera sau: 108.0 MP + 8.0 MP + 2.0 MP + 2.0 MP</p> <p>Camera trước: 16.0 MP</p> <p>CPU: 2 x Kryo 465 2.3 GHz + 6 x Kryo 465 1.8 GHz</p> <p>RAM: 8GB</p> <p>Bộ nhớ trong: 128GB</p>', 1, 'Shenzhen Eison Electronic Technology Co., Ltd.', 1, '2022-06-30 23:55:00', 100, 40, 'Còn hàng', '2022-04-25 01:17:21'),
(2, 'OPPO Reno6 5G', 10000000, '<p>Thương hiệu: Oppo</p> <p>Xuất xứ: Trung Quốc</p> <p>Thời gian bảo h&agrave;nh: 12 Th&aacute;ng</p> <p>M&agrave;n h&igrave;nh: 6.43&quot;, FHD+, AMOLED, 1080 x 2400 Pixel</p> <p>Camera sau: 64.0 MP + 8.0 MP + 2.0 MP</p> <p>Camera trước: 32.0 MP</p> <p>CPU: MediaTek Dimensity 900 5G</p> <p>RAM: 8GB</p> <p>Bộ nhớ trong: 128GB</p>', 1, 'Shenzhen Eison Electronic Technology Co., Ltd', 1, '2022-05-29 16:55:20', 200, 20, 'Còn hàng', '2022-04-25 01:17:21'),
(3, 'APPLE iPhone XR 128GB', 10000000, '<p>Thương hiệu: Apple</p> <p>Xuất xứ: Trung Quốc</p> <p>Thời gian bảo h&agrave;nh: 12 Th&aacute;ng</p> <p>M&agrave;n h&igrave;nh: 6.1&quot;, Liquid Retina HD, IPS LCD, 828 x 1792 Pixel</p> <p>Camera sau: 12.0 MP</p> <p>Camera trước: 7.0 MP</p> <p>CPU: A12 Bionic - 4 x 2.5 GHz Vortex + 4 x 1.6 GHz Tempest</p> <p>RAM: 3GB</p> <p>Bộ nhớ trong: 128GB</p>', 1, 'Foxconn', 1, '2022-05-28 16:55:20', 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(4, 'APPLE iPhone 12 Pro Max 128GB', 20000000, '<p>Thương hiệu: Apple</p> <p>Xuất xứ: Trung Quốc</p> <p>Thời gian bảo h&agrave;nh: 12 Th&aacute;ng</p> <p>M&agrave;n h&igrave;nh: 6.7&quot;, Super Retina XDR, OLED, 2778 x 1284 Pixel</p> <p>Camera sau: 12.0 MP + 12.0 MP + 12.0 MP</p> <p>Camera trước: 12.0 MP - CPU: A14 Bionic - 2 x Firestorm 3.1 GHz + 4 x Icestorm 1.8 GHz</p> <p>RAM: 6GB</p> <p>Bộ nhớ trong: 128GB</p>', 1, 'Foxconn', 1, '2022-05-27 16:55:20', 300, 10, 'Còn hàng', '2022-04-25 01:17:21'),
(5, 'SAMSUNG Galaxy Z Fold3 5G', 30000000, '<p>Thương hiệu: Samsung</p> <p>Xuất xứ: Việt Nam/Trung Quốc</p> <p>Thời gian bảo h&agrave;nh: 12 Th&aacute;ng</p> <p>M&agrave;n h&igrave;nh ch&iacute;nh: 7.6&rdquo;, M&agrave;n h&igrave;nh phụ: 6.2&rdquo;, HD+, Ch&iacute;nh: Dynamic AMOLED 2X, phụ: Dynamic AMOLED 2X, 1768 x 2208 Pixel</p> <p>Camera sau: 12.0 MP + 12.0 MP + 12.0 MP</p> <p>Camera trước: 12.0 MP</p> <p>CPU: Snapdragon 888</p> <p>RAM: 12GB</p> <p>Bộ nhớ trong: 256GB</p>', 1, 'Foxconn', 1, '2022-05-26 16:55:20', 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(6, 'XIAOMI Mi 11 5G', 11990000, '<p>Xiaomi Mi 11 một si&ecirc;u phẩm đến từ Xiaomi, m&aacute;y cho trải nghiệm hiệu năng h&agrave;ng đầu với vi xử l&yacute; Qualcomm Snapdragon 888, c&ugrave;ng loạt c&ocirc;ng nghệ đỉnh cao, khiến bất kỳ ai cũng sẽ cho&aacute;ng ngợp về smartphone n&agrave;y.</p> <ul> <li>M&agrave;n h&igrave;nh: AMOLED6.81&quot;Quad HD+ (2K+)</li> <li>Hệ điều h&agrave;nh: Android 11</li> <li>Camera sau: Ch&iacute;nh 108 MP &amp; Phụ 13 MP, 5 MP</li> <li>Camera trước: 20 MP</li> <li>Chip: Snapdragon 888</li> <li>RAM: 8 GB</li> <li>Bộ nhớ trong: 256 GB</li> <li>SIM: 2 Nano SIMHỗ trợ 5G</li> <li>Pin, Sạc: 4600 mAh55 W</li> <li>H&atilde;ng Xiaomi.</li> </ul>', 1, 'Xiaomi Inc', 1, '2022-05-25 16:55:20', 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(7, 'APPLE iPhone 11 64GB', 13990000, '<p>Th&ocirc;ng số sản phẩm</p> <ul> <li>M&agrave;n h&igrave;nh: IPS LCD6.1&quot;Liquid Retina</li> <li>Hệ điều h&agrave;nh: iOS 15</li> <li>Camera sau: 2 camera 12 MP</li> <li>Camera trước: 12 MP</li> <li>Chip: Apple A13 Bionic</li> <li>RAM: 4 GB</li> <li>Bộ nhớ trong: 64 GB</li> <li>SIM: 1 Nano SIM &amp; 1 eSIMHỗ trợ 4G</li> <li>Pin, Sạc: 3110 mAh18 W</li> </ul>', 1, 'Foxconn', 1, '2022-05-24 16:55:20', 400, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(8, 'XIAOMI Mi 11 5G 128GB', 8000000, '<p>Th&ocirc;ng số sản phẩm</p> <ul> <li>M&agrave;n h&igrave;nh: IPS LCD6.1&quot;Liquid Retina</li> <li>Hệ điều h&agrave;nh: iOS 15</li> <li>Camera sau: 2 camera 12 MP</li> <li>Camera trước: 12 MP</li> <li>Chip: Apple A13 Bionic</li> <li>RAM: 4 GB</li> <li>Bộ nhớ trong: 64 GB</li> <li>SIM: 1 Nano SIM &amp; 1 eSIMHỗ trợ 4G</li> <li>Pin, Sạc: 3110 mAh18 W</li> </ul>', 1, 'Xiaomi Inc', 1, '2022-05-24 16:55:20', 500, 110, 'Hết hàng', '2022-04-25 01:17:21'),
(9, 'SAMSUNG Galaxy A32', 30000000, '<p>Th&ocirc;ng tin sản phẩm</p> <ul> <li>M&agrave;n h&igrave;nh: Super AMOLED6.4&quot;Full HD+</li> <li>Hệ điều h&agrave;nh: Android 11</li> <li>Camera sau: Ch&iacute;nh 64 MP &amp; Phụ 8 MP, 5MP, 5MP</li> <li>Camera trước: 20 MP</li> <li>Chip: MediaTek Helio G80</li> <li>RAM: 6 GB</li> <li>Bộ nhớ trong: 128 GB</li> <li>SIM: 2 Nano SIMHỗ trợ 4G</li> <li>Pin, Sạc: 5000 mAh15 W</li> </ul>', 1, 'SAMSUNG', 1, '2022-05-22 16:55:20', 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(10, 'SAMSUNG Galaxy S21 Ultra 5G', 8000000, '<p>Sự đẳng cấp được Samsung gửi gắm th&ocirc;ng qua chiếc smartphone Galaxy S21 Ultra 5G với h&agrave;ng loạt sự n&acirc;ng cấp v&agrave; cải tiến kh&ocirc;ng chỉ ngoại h&igrave;nh b&ecirc;n ngo&agrave;i m&agrave; c&ograve;n sức mạnh b&ecirc;n trong, hứa hẹn đ&aacute;p ứng trọn vẹn nhu cầu ng&agrave;y c&agrave;ng cao của người d&ugrave;ng.</p> <p>Th&ocirc;ng số kĩ thuật:</p> <ul> <li>M&agrave;n h&igrave;nh: Dynamic AMOLED 2X6.8&quot;Quad HD+ (2K+)</li> <li>Hệ điều h&agrave;nh: Android 11</li> <li>Camera sau: Ch&iacute;nh 108 MP &amp; Phụ 12 MP, 10 MP, 10 MP</li> <li>Camera trước: 40 MP</li> <li>Chip: Exynos 2100</li> <li>RAM: 12 GB</li> <li>Bộ nhớ trong: 128 GB</li> <li>SIM: 2 Nano SIM hoặc 1 Nano SIM + 1 eSIMHỗ trợ 5G</li> <li>Pin, Sạc: 5000 mAh25 W</li> </ul>', 1, 'SAMSUNG', 1, '2022-04-29 03:56:53', 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(11, 'VIVO V23e', 10000000, '<p>Th&ocirc;ng tin sản phẩm</p> <ul> <li>M&agrave;n h&igrave;nh: AMOLED6.44&quot;Full HD+</li> <li>Hệ điều h&agrave;nh: Android 11</li> <li>Camera sau: Ch&iacute;nh 64 MP &amp; Phụ 8 MP, 2 MP</li> <li>Camera trước: 50 MP</li> <li>Chip: MediaTek Helio G96 8 nh&acirc;n</li> <li>RAM: 8 GB</li> <li>Bộ nhớ trong: 128 GB</li> <li>SIM: 2 Nano SIM (SIM 2 chung khe thẻ nhớ)Hỗ trợ 4G</li> <li>Pin, Sạc: 4050 mAh44 W</li> <li>H&atilde;ng: Vivo</li> </ul>', 1, 'VIVO', 1, '2022-04-30 03:58:18', 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(12, 'APPLE iPad Mini 6', 20000000, '<p>Thương hiệu: Apple</p> <p>Xuất xứ: Trung Quốc</p> <p>M&agrave;n h&igrave;nh: 8.3&quot; - Liquid Retina display - IPS</p> <p>Camera sau: 12MP</p> <p>Camera trước: 12MP</p> <p>CPU: Apple A15 Bionic</p> <p>RAM: 4GB</p> <p>Bộ nhớ trong: 64GB</p> <p>Hệ điều h&agrave;nh: iPadOS</p>', 1, 'Apple', 1, NULL, 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(13, 'DELL Gaming G15 5511', 17000000, '<p>CPU: Intel Core i5-11400H</p> <p>M&agrave;n h&igrave;nh: 15.6&quot; WVA (1920 x 1080,0), 120Hz</p> <p>RAM: 2 x 4GB DDR4 3200MHz</p> <p>Đồ họa: NVIDIA GeForce RTX 3050 4GB GDDR6 / Intel UHD Graphics</p> <p>Lưu trữ: 256GB SSD M.2 NVMe /</p> <p>Hệ điều h&agrave;nh: Windows 11 Home</p> <p>Pin: 3 cell - Pin liền</p> <p>Khối lượng: 2.8 kg</p>', 2, 'Dell', 1, '2022-05-16 14:23:36', 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(14, 'ASUS X415EA-EB640W', 9000000, '<p>CPU: Intel Core i5-1135G7</p> <p>M&agrave;n h&igrave;nh: 14&quot; IPS (1920 x 1080)</p> <p>RAM: 1 x 4GB Onboard DDR4</p> <p>Đồ họa: Intel Iris Xe Graphics</p> <p>Lưu trữ: 512GB SSD M.2 NVMe /</p> <p>Hệ điều h&agrave;nh: Windows 11 Home</p> <p>Pin: 2 cell 37 Wh Pin liền</p> <p>Khối lượng: 1.6 kg</p>', 2, 'Asus', 1, '2022-05-09 14:26:12', 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(15, 'ACER Nitro 5 AN515-52-51LW', 12990000, '<p>CPU: Intel Core i5-8300H ( 2.3 GHz - 4.0 GHz / 8MB / 4 nh&acirc;n, 8 lu&ocirc;̀ng )</p> <p>M&agrave;n h&igrave;nh: 15.6&quot; IPS ( 1920 x 1080 ) , kh&ocirc;ng cảm ứng</p> <p>RAM: 1 x 8GB DDR4 2666MHz</p> <p>Đồ họa: Intel UHD Graphics 630 / NVIDIA GeForce GTX 1050Ti 4GB GDDR5</p> <p>Lưu trữ: 128GB SSD M.2 SATA / 1TB HDD 5400RPM</p> <p>Hệ điều h&agrave;nh: Linux</p> <p>Pin: 4 cell 48 Wh Pin liền , khối lượng: 2.4 kg</p>', 2, 'Acer', 1, NULL, 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(16, 'LENOVO Yoga Slim 7', 17000000, '<p>CPU: Intel Core i7-1165G7</p> <p>M&agrave;n h&igrave;nh: 14&quot; IPS (1920 x 1080)</p> <p>RAM: 8GB Onboard DDR4 3200MHz</p> <p>Đồ họa: Intel Iris Xe Graphics</p> <p>Lưu trữ: 512GB SSD M.2 NVMe /</p> <p>Hệ điều h&agrave;nh: Windows 10 Home SL 64-bit</p> <p>Pin: 60 Wh Pin liền</p> <p>Khối lượng: 1.4 kg</p>', 2, 'Lenovo', 1, NULL, 600, 100, 'Còn hàng', '2022-04-25 01:17:21'),
(17, 'LENOVO Thinkpad X13', 24000000, '<p>Lenovo Thinkpad X13 20T2S01E00 l&agrave; chiếc laptop cao cấp được thiết kế đẹp mắt, hiện đại, nhỏ gọn với hiệu suất hoạt động v&agrave; t&iacute;nh bảo mật n&acirc;ng cao.&nbsp;N&oacute; c&oacute; khối lượng chỉ 1.2 kg, k&iacute;ch thước 31.19x21.7x1.65cm sử dụng vỏ nh&ocirc;m cao cấp mỏng, nhẹ v&agrave; rất chắc chắn. Với thiết kế n&agrave;y, ch&uacute;ng ta c&oacute; thể dễ d&agrave;ng đem theo mọi l&uacute;c mọi nơi, linh hoạt cho việc sử dụng.</p> <p>Th&ocirc;ng số kĩ thuật:</p> <ul> <li>CPU: Intel Core i5-10210U</li> <li>M&agrave;n h&igrave;nh: 13.3&quot; WVA (1920 x 1080)</li> <li>RAM: 1 x 8GB DDR4 2666MHz</li> <li>Đồ họa: Intel UHD Graphics</li> <li>Lưu trữ: 512GB SSD M.2 NVMe /</li> <li>Hệ điều h&agrave;nh: Windows 10 Pro 64-bit</li> <li>Pin: 6 cell 48 Wh Pin liền</li> <li>Khối lượng: 1.2 kg</li> </ul>', 2, 'Lenovo', 1, NULL, 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(18, 'MICROSOFT Surface Pro', 23290000, '<p>Th&ocirc;ng số kĩ thuật</p> <ul> <li>Part-number: QWT-00001</li> <li>M&agrave;u sắc: Bạc</li> <li>Th&ecirc;́ h&ecirc;̣ CPU: Core i3 , Intel Core thế hệ thứ 10</li> <li>CPU: Intel Core i3-1005G1 ( 1.2 GHz - 3.4 GHz / 4MB / 2 nh&acirc;n, 4 lu&ocirc;̀ng )</li> <li>Chip đ&ocirc;̀ họa: Intel UHD Graphics</li> <li>RAM: 4GB LPDDR4</li> <li>Màn hình: 12.3&quot; ( 2736 x 1824 ) cảm ứng , HD webcam</li> <li>Lưu trữ: 128GB SSD /</li> <li>Cổng kết nối: 1 x USB Type C , 1 x USB 3.0 , 1 x micro SD card slot</li> <li>K&ecirc;́t n&ocirc;́i kh&ocirc;ng d&acirc;y: WiFi 802.11ax (Wifi 6) , Bluetooth 5.0</li> <li>H&ecirc;̣ đi&ecirc;̀u hành: Windows 10</li> <li>Kích thước: 29.21 x 20.14 x 0.85 cm</li> <li>Pin: Pin liền</li> <li>Kh&ocirc;́i lượng: 0.8 kg</li> </ul>', 2, 'Microsoft', 1, NULL, 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(19, 'HP 340s G7 224L1PA', 13890000, '<p>Th&ocirc;ng số kỹ thuật</p> <ul> <li>CPU: Intel Core i3-1005G1</li> <li>M&agrave;n h&igrave;nh: 14&quot; IPS (1920 x 1080)</li> <li>RAM: 1 x 4GB DDR4 2666MHz</li> <li>Đồ họa: Intel UHD Graphics</li> <li>Lưu trữ: 512GB SSD M.2 NVMe /</li> <li>Hệ điều h&agrave;nh: Windows 10 Home SL 64-bit</li> <li>Pin: 3 cell 41 Wh Pin liền</li> <li>Khối lượng: 1.35 kg</li> </ul>', 2, 'HP', 1, '2022-05-18 14:37:26', 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(20, 'DELL Vostro 14 3405', 16190000, '<p>Th&ocirc;ng số kỹ thuật</p> <ul> <li>CPU: AMD Ryzen 5 3500U</li> <li>M&agrave;n h&igrave;nh: 14&quot; WVA (1920 x 1080)</li> <li>RAM: 1 x 4GB DDR4 2400MHz</li> <li>Đồ họa: AMD Radeon Vega 8 Graphics</li> <li>Lưu trữ: 256GB SSD M.2 NVMe /</li> <li>Hệ điều h&agrave;nh: Windows 10 Home SL 64-bit</li> <li>Pin: 3 cell 42 Wh Pin liền</li> <li>Khối lượng: 1.7 kg</li> </ul>', 2, 'Dell', 1, NULL, 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(21, 'ASUS ZenBook UX363EA-HP532T', 20999000, '<p>Th&ocirc;ng số sản phẩm</p> <ul> <li>CPU: Intel Core i5 1135G7</li> <li>RAM: 8GB</li> <li>Ổ cứng: 512GB SSD</li> <li>VGA: Onboard</li> <li>M&agrave;n h&igrave;nh: 13.3 FHD Cảm ứng</li> <li>HĐH: Win 10</li> <li>M&agrave;u: X&aacute;m</li> </ul>', 2, 'Asus', 1, NULL, 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(22, 'LENOVO IdeaPad Slim 5 Pro', 20999000, '<p>Th&ocirc;ng số sản phẩm</p> <ul> <li>CPU: AMD R5 5600U</li> <li>RAM: 16GB</li> <li>Ổ cứng: 512GB SSD</li> <li>VGA: Nvidia MX450 2GB</li> <li>M&agrave;n h&igrave;nh: 14 inch 2k</li> <li>HĐH: Win 10</li> <li>M&agrave;u: X&aacute;m</li> </ul>', 2, 'Lenovo', 1, NULL, 700, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(23, 'THOM BROWNE Grosgrain Oxford Shirt', 5000000, '<p>&Aacute;o sơ mi cổ điển vừa vặn bằng vải Oxford cotton m&agrave;u xanh nhạt với băng tay sọc grosgrain. N&uacute;t c&agrave;i ph&iacute;a trước, cổ &aacute;o c&oacute; điểm c&agrave;i c&uacute;c, t&uacute;i ngực c&oacute; miếng v&aacute;, &aacute;o d&agrave;i tay. Thẻ t&ecirc;n thương hiệu đ&iacute;nh tr&ecirc;n viền &aacute;o sơ mi. V&ograve;ng m&oacute;c treo lưng trung t&acirc;m.<br /> Chất liệu: 100% chất liệu cotton. Sản xuất tại Mỹ</p>', 3, 'THOM BROWNE ', 1, NULL, 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(24, 'AMI PARIS Funnel Neck Sweater', 400000, '<p>&Aacute;o len - len merino nỉ, oversize, dệt kim Ami de Coeur m&agrave;u đỏ, 100% sợi len Virgin.<br /> Chiều d&agrave;i lưng 67 cm (cỡ M)&nbsp;<br /> Giặt nhiệt độ thấp<br /> Kh&ocirc;ng tẩy, kh&ocirc;ng sấy kh&ocirc;<br /> Phơi nơi kh&ocirc; r&aacute;o<br /> B&agrave;n ủi nhiệt độ trung b&igrave;nh<br /> C&oacute; thể giặt kh&ocirc;<br /> &nbsp;</p>', 3, 'AMI', 1, '2022-05-09 14:44:53', 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(25, 'ALEXANDER MCQUEEN Rollneck Dove Sweater', 700000, '<p>Cổ cuộn bằng len cashmere m&agrave;u kem, cắt vừa vặn, &aacute;o liền quần với phần vai bu&ocirc;ng xuống c&oacute; họa tiết chim bồ c&acirc;u tương phản với c&aacute;c chi tiết th&ecirc;u. Ho&agrave;n thiện với cổ tay &aacute;o c&oacute; g&acirc;n v&agrave; viền &aacute;o.<br /> Chất liệu: 90% len, 10% len cashmere</p>', 3, 'ALEXANDER MCQUEEN', 1, '2022-05-02 14:45:56', 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(26, 'Supreme X The North Face S Logo Jacket', 4000000, '<p>Supreme đ&atilde; bỏ S Logo tập trung v&agrave;o The North Face Collaboration như một phần của bản ph&aacute;t h&agrave;nh FW20 Week 10 của họ. Chiếc &aacute;o kho&aacute;c Mountain Jacket c&oacute; logo chữ S m&agrave;u đen từ sự hợp t&aacute;c đ&atilde; thu h&uacute;t sự so s&aacute;nh với bộ đồ được mặc bởi si&ecirc;u anh h&ugrave;ng The Incredibles, Syndrome.</p> <p>Giống như bộ đồ của Syndrome trong phim, chiếc &aacute;o kho&aacute;c n&agrave;y c&oacute; Logo Supreme S lớn che gần hết phần b&ecirc;n tr&aacute;i của &aacute;o kho&aacute;c. Chiếc &aacute;o kho&aacute;c The North Face đặc biệt n&agrave;y được ph&aacute;t h&agrave;nh với ba m&agrave;u, cũng c&oacute; một m&agrave;u đỏ v&agrave; xanh l&aacute; c&acirc;y. The North Face&#39;s Mountain Jacket thường được khen ngợi v&igrave; thiết kế c&oacute; đường may ho&agrave;n to&agrave;n kh&ocirc;ng thấm nước. Chiếc &aacute;o kho&aacute;c The North Face S Logo Mountain Jacket m&agrave;u đen đ&atilde; được b&aacute;n ra v&agrave;o ng&agrave;y 30 th&aacute;ng 10 năm 2020.</p>', 3, 'Supreme', 1, NULL, 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(27, 'XLANGER Bowling Shirt', 600000, '<p>Th&agrave;nh phần ch&iacute;nh: 100% Rayon</p> <p>Sợi th&ecirc;u: 100% Polyester.</p>', 3, 'XLANGER', 1, NULL, 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(28, 'LACQUEMUS Le T-shirt Yelò layered top', 1000000, '<p>Được đặt t&ecirc;n l&agrave; La Montagne, bộ sưu tập AW21 của Jacquemus ủng hộ những h&igrave;nh b&oacute;ng đi&ecirc;u khắc v&agrave; giải tr&iacute;. Được k&eacute;o từ sợi b&ocirc;ng tinh khiết, chiếc &aacute;o ph&ocirc;ng Yel&ograve; n&agrave;y l&agrave; một v&iacute; dụ điển h&igrave;nh cho c&aacute;ch tiếp cận thời trang đ&oacute;, v&igrave; n&oacute; c&oacute; lớp phủ tay ngắn m&agrave;u đỏ v&agrave; phần đế m&agrave;u n&acirc;u.<br /> Điểm nổi bật: thiết kế hai t&ocirc;ng m&agrave;u đỏ / n&acirc;u, thiết kế xếp lớp, th&ecirc;u logo trước ngực, cổ tr&ograve;n, tay d&agrave;i, viền thẳng<br /> Th&agrave;nh phần: 100% cotton<br /> Hướng dẫn giặt: Giặt m&aacute;y</p>', 3, 'LACQUEMUS', 1, NULL, 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(29, 'BERLUTI Double Face Check Scritto Hoodie', 20000000, '<p>C&aacute;c t&iacute;nh năng b&ecirc;n ngo&agrave;i:</p> <ul> <li>&Aacute;o hoodie c&oacute; kh&oacute;a k&eacute;o bằng len hai mặt</li> <li>D&acirc;y da</li> <li>2 t&uacute;i ở mặt trước</li> <li>M&agrave;o da b&ecirc;</li> <li>T&iacute;nh năng b&ecirc;n trong</li> <li>Scritto v&agrave; kiểm tra jacquard</li> <li>M&ugrave;a đ&ocirc;ng 21</li> <li>Sản xuất tại &Yacute;</li> </ul> <p>Chất liệu: 100% len<br /> Hướng dẫn sử dụng: giặt kh&ocirc;</p>', 3, 'BERLUTI ', 1, NULL, 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(30, 'ALEXANDER MCQUEEN Dove Lace Print Shirt', 9000000, '<p>&Aacute;o sơ mi vải b&ocirc;ng trắng in h&igrave;nh Dove Lace. Sản phẩm ho&agrave;n thiện với một chiếc c&uacute;c &aacute;o trước v&agrave; cổ tay &aacute;o.<br /> Chất liệu: 100% cotton</p>', 3, 'ALEXANDER MCQUEEN', 1, NULL, 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(31, 'ALEXANDER MCQUEEN Illustration-style Shirt', 5000000, '<p>Điểm nổi bật: m&agrave;u trắng, in theo phong c&aacute;ch minh họa, c&agrave;i n&uacute;t ph&iacute;a trước, cổ &aacute;o cổ điển, tay &aacute;o ngắn v&agrave; viền thẳng<br /> Th&agrave;nh phần: 100% cotton</p>', 3, 'ALEXANDER MCQUEEN', 1, NULL, 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(32, 'ALEXANDER MCQUEEN 70s Collar Shirt', 4000000, '<p>&Aacute;o sơ mi poplin bằng cotton trắng với cổ &aacute;o nhọn của thập ni&ecirc;n 70 v&agrave; c&aacute;c chi tiết đường ống m&agrave;u đen tương phản. Đ&atilde; ho&agrave;n th&agrave;nh với một chiếc c&uacute;c &aacute;o trước v&agrave; cổ tay &aacute;o.<br /> Chất liệu: 100% cotton</p>', 3, 'ALEXANDER MCQUEEN', 1, '2022-05-02 15:02:16', 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(33, 'ALEXANDER MCQUEEN Selvedge Polo', 5000000, '<p>&Aacute;o sơ mi polo b&ocirc;ng đen với chi tiết xếp placket của Alexander McQueen Selvedge.<br /> Chất liệu: 100% cotton</p>', 4, 'ALEXANDER MCQUEEN', 1, NULL, 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(34, 'JACQUEMUS Le Pantalon Asao Brown', 8000000, '<p>Đặc điểm:</p> <ul> <li>Rộng v&agrave; vừa vặn</li> <li>C&aacute;c nếp gấp ph&iacute;a trước</li> <li>D&acirc;y thắt lưng tương phản k&eacute;o d&agrave;i</li> <li>D&acirc;y c&oacute; thể th&aacute;o rời ở dưới ch&acirc;n</li> <li>T&uacute;i thiết kế theo phong c&aacute;ch &Yacute;</li> <li>T&uacute;i c&oacute; đường ống ph&iacute;a sau</li> <li>Bay c&oacute; kh&oacute;a với n&uacute;t</li> </ul> <p>Người mẫu cao 187 cm v&agrave; mặc size 48<br /> Chất liệu: 100% chất liệu cotton<br /> Sản xuất tại Bungari</p>', 4, 'JACQUEMUS', 1, NULL, 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(35, 'ALEXANDER MCQUEEN Cavalry Twill Trousers', 9000000, '<p>Quần t&acirc;y c&oacute; chốt được thiết kế ri&ecirc;ng bằng vải ch&eacute;o m&agrave;u xanh tối m&agrave;u, với hai chi tiết xếp nếp v&agrave; đường viền ngược nhau. Quần c&oacute; hai t&uacute;i b&ecirc;n v&agrave; hai t&uacute;i sau.<br /> Chất liệu: 100% len</p>', 4, 'ALEXANDER MCQUEEN', 1, NULL, 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(36, 'ALEXANDER MCQUEEN Wide Leg Denim Trouser', 9000000, '<p>Quần jean denim ống rộng m&agrave;u xanh đậm c&oacute; chi tiết với đường kh&acirc;u m&agrave;u tương phản v&agrave; đường viền chồng ngược.<br /> Chất liệu: 100% cotton</p>', 4, 'ALEXANDER MCQUEEN', 1, NULL, 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(37, 'THOM BROWNE Camel Bear&Salmon Trouser', 9000000, '<p>Quần t&acirc;y mỏng vừa vặn c&oacute; th&ecirc;u h&igrave;nh động vật bằng vải b&ocirc;ng lạc đ&agrave; từ THOM BROWNE c&oacute; họa tiết th&ecirc;u, mấu v&ograve;ng grosgrain đặc trưng, ​​nếp gấp, viền chồng ngược, c&agrave;i n&uacute;t ẩn ph&iacute;a trước, hai t&uacute;i c&oacute; r&atilde;nh v&agrave; hai t&uacute;i c&agrave;i c&uacute;c ph&iacute;a sau.<br /> Thấp ống quần cạp thấp trong một nửa gấu thả v&agrave; c&aacute; hồi lấp đầy vải th&ecirc;u lạc đ&agrave; với c&aacute;c tab grosgrain sọc đồng thau c&oacute; n&uacute;t c&agrave;i ở eo. Đ&oacute;ng tab. T&uacute;i b&ecirc;n v&agrave; sau c&oacute; d&acirc;y. V&ograve;ng d&acirc;y grosgrain sọc đặc trưng ở eo sau. Tay &aacute;o cao.<br /> Chất liệu: 60% cotton, 40% Viscose<br /> Sản xuất tại &Yacute;</p>', 4, 'THOM BROWNE', 1, NULL, 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(38, 'MARK FAST Men Oversized Black Casual Pants', 3000000, '<p>MARKFAST Quần &acirc;u đen nam qu&aacute; khổ<br /> Quần jogger của Mark Fast theo phong c&aacute;ch thể thao nh&acirc;n quả. C&oacute; t&uacute;i b&ecirc;n v&agrave; huy hiệu th&ecirc;u đồ họa MF.<br /> Th&agrave;nh phần:<br /> VẢI: 100% POLYESTER<br /> Phương ph&aacute;p giặt:</p> <ul> <li>Giặt tay</li> <li>Nước lạnh hoặc dưới 40 &deg; C</li> <li>Kh&ocirc;ng sử dụng chất tẩy</li> <li>Phơi kh&ocirc;</li> <li>Sấy b&igrave;nh thường&nbsp;</li> </ul> <p>Lưu &yacute;: Kh&ocirc;ng cần giặt ri&ecirc;ng</p>', 4, 'MARK FAST', 1, NULL, 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(39, 'MARK FAST Women Jogger', 1800000, '<p>Thiết kế quần Jogger với chất liệu vải denim. Cạp chun v&agrave; viền thun co gi&atilde;n thoải m&aacute;i, ph&ugrave; hợp với c&aacute;c d&aacute;ng người kh&aacute;c nhau. Thiết kế miếng d&aacute;n m&agrave;u b&ecirc;n c&oacute; in chữ MF. Hiện đại v&agrave; thời trang, thể hiện phong c&aacute;ch c&aacute; nh&acirc;n ri&ecirc;ng biệt.<br /> Chất liệu: 100% COTTON</p>', 4, 'MARK FAST', 1, NULL, 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(40, 'STELLA MCCARTNEY Lacey Wool Pants', 7000000, '<p>M&agrave;u sắc: X&aacute;m tro</p> <p>Đặc điểm:</p> <ul> <li>Quần chắp v&aacute;</li> <li>Kh&oacute;a zip v&agrave; kh&oacute;a d&aacute;n được giấu k&iacute;n</li> <li>Thắt lưng đ&agrave;n hồi với kh&oacute;a d&aacute;n để c&oacute; thể điều chỉnh vừa vặn</li> <li>T&uacute;i zip nghi&ecirc;ng, chi tiết đường may</li> <li>K&eacute;o zip logo Stella McCartney</li> <li>Sản xuất tại: Hungary</li> <li>Chăm s&oacute;c: Sạch kh&ocirc;</li> <li>Th&agrave;nh phần: 100% len</li> <li>Được thiết kế để vừa vặn thoải m&aacute;i, vừa với k&iacute;ch thước</li> <li>Vải c&oacute; trọng lượng trung b&igrave;nh, kh&ocirc;ng co gi&atilde;n</li> </ul>', 4, 'STELLA MCCARTNEY', 1, NULL, 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(41, 'ANN DEMEULEMEESTER Cropped Tailored Trousers', 8000000, 'p>ANN DEMEULEMEESTER Quần t&acirc;y cắt may bằng len-crepe<br /> Quần t&acirc;y đen của Ann Demeulemeester được thiết kế ri&ecirc;ng ở &Yacute; từ len crepe đến phom d&aacute;ng vừa vặn với ch&acirc;n thẳng v&agrave; cổ tay &aacute;o được cắt x&eacute;n, đảo ngược.</p> <p>M&agrave;u sắc: M&agrave;u đen</p> <p>Chất liệu: 100% len nguy&ecirc;n sinh.</p> <p>Hướng dẫn giặt: Giặt kh&ocirc;</p> <p>Xuất xứ: &Yacute;<br /> &nbsp;</p>', 4, 'ANN DEMEULEMEESTER ', 1, NULL, 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(42, 'ANN DEMEULEMEESTER Vincent Fitted Trousers', 7000000, '<p>Ann Demeulemeester Vincent Quần t&acirc;y<br /> Quần t&acirc;y nam Vincent vừa vặn m&agrave;u đen, mang lại sự thoải m&aacute;i nhờ Gabardine - 100% Virgin Wool</p> <p>Sản xuất tại &Yacute;<br /> Người mẫu: cỡ ​​48<br /> Chiều cao: 188 cm<br /> V&ograve;ng eo: 69 cm<br /> V&ograve;ng h&ocirc;ng: 90 cm</p>', 4, 'ANN DEMEULEMEESTER', 1, '2022-05-12 16:13:31', 1000, 150, 'Còn hàng', '2022-04-25 01:17:21'),
(43, 'ALLSAINTS Frieda High-rise Denim Trousers', 1600000, '<p>Frieda đ&atilde; được l&agrave;m thủ c&ocirc;ng từ một loại vải nhẹ v&agrave; c&oacute; h&igrave;nh d&aacute;ng vừa vặn với phần ch&acirc;n thon, thẳng. Chi tiết t&uacute;i tr&ecirc;n ch&acirc;n ho&agrave;n thiện thẩm mỹ.</p> <p>Đặc điểm:</p> <ul> <li>Cao ốc</li> <li>Đ&oacute;ng zip</li> <li>Hai t&uacute;i trước</li> <li>Hai t&uacute;i sau</li> <li>Hai t&uacute;i b&ecirc;n</li> <li>Rộng co gi&atilde;n</li> <li>Ch&acirc;n thon</li> </ul>', 4, 'ALLSAINTS', 1, NULL, 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(45, 'THOM BROWNE Grey Camera Bag', 9000000, '<p>T&uacute;i m&aacute;y ảnh nhỏ bằng len Melton hai mặt m&agrave;u x&aacute;m trung b&igrave;nh với d&acirc;y đeo bằng vải sọc v&agrave; chi tiết 4 vạch ton-sur-ton. Đ&oacute;ng zip k&eacute;o, t&uacute;i zip ph&iacute;a trước, bảng t&ecirc;n ở mặt. C&aacute;c chi tiết da dạng hạt sỏi. Tab v&ograve;ng lặp grosgrain sọc đặc trưng ở mặt.<br /> 93% len, 5% Casmhere, 2% da b&ecirc;.</p> <p>Sản xuất tại &Yacute;</p>', 5, 'THOM BROWNE', 1, '2022-05-12 16:16:05', 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(46, 'LOUIS VUITTON Mini Eclipse Canvas', 8000000, '<p>Được tạo bởi Virgil Abloh cho triển l&atilde;m Xu&acirc;n-H&egrave; 2019, t&uacute;i Mini Soft Trunk được l&agrave;m từ vải canvas Monogram Eclipse v&agrave; c&oacute; d&acirc;y x&iacute;ch đen mờ bằng nhựa. Phụ kiện h&igrave;nh hộp nhưng trang nh&atilde; n&agrave;y gợi l&ecirc;n h&ograve;m kho b&aacute;u của ng&ocirc;i nh&agrave;. N&oacute; c&oacute; thể được đeo tr&ecirc;n vai hoặc mang ch&eacute;o.<br /> C&aacute;c t&iacute;nh năng chi tiết:</p> <ul> <li>18,5 x 13 x 8 cm (D&agrave;i x Cao x Rộng)</li> <li>Vải phủ Monogram Eclipse</li> <li>Dệt may l&oacute;t</li> <li>Da b&ograve; trang tr&iacute;</li> <li>Phần cứng đen mờ</li> <li>T&uacute;i c&oacute; kh&oacute;a k&eacute;o b&ecirc;n ngo&agrave;i</li> <li>B&ecirc;n trong t&uacute;i phẳng</li> <li>D&acirc;y đeo: Kh&ocirc;ng thể th&aacute;o rời, c&oacute; thể điều chỉnh</li> <li>Thả d&acirc;y đeo: 42.0 cm</li> <li>D&acirc;y đeo thả tối đa: 58,0 cm</li> </ul>', 5, 'LOUIS VUITTON', 1, NULL, 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(47, 'BERLUTI Ninorigami Canvas & Leather Clutch', 5000000, '<p>Sản xuất tại &Yacute;</p> <p>Line: ODYSSEE</p> <p>Lớp l&oacute;t bằng vải b&ocirc;ng đặc trưng của Venezia Da b&ecirc; (kh&ocirc;ng thể thay đổi lại) Chăm s&oacute;c da Venezia bắt đầu bằng việc loại bỏ bụi bẩn bằng c&aacute;ch sử dụng một tấm vải mềm, sau đ&oacute; l&agrave; một lớp da trong nu&ocirc;i dưỡng and bảo vệ da. Sau đ&oacute;, x&aacute;t mạnh bằng tay đ&aacute;nh b&oacute;ng để phục hồi b&oacute;ng ban đầu của da. Để l&agrave;m sạch Signature Canvas, ch&uacute;ng t&ocirc;i khuy&ecirc;n bạn n&ecirc;n sử dụng một miếng vải mềm, thấm một ch&uacute;t nước x&agrave; ph&ograve;ng, tr&aacute;nh c&aacute;c phần da. Kh&ocirc;ng bao giờ sử dụng m&ocirc;i trường. Ch&uacute;ng t&ocirc;i đề nghị bạn n&ecirc;n bảo vệ sản phẩm của m&igrave;nh từ ẩm độ v&agrave; tr&aacute;nh xa c&aacute;c nguồn nhiệt trực tiếp.</p>', 5, 'BERLUTI', 1, '2022-05-20 16:20:01', 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(48, 'BERLUTI Un Jour Mini Leather Briefcase', 5000000, '<p>D&ograve;ng: JOUR</p> <p>C&aacute;ch sử dụng:</p> <ul> <li>Cầm tay tay: hai tay cầm tr&ecirc;n c&ugrave;ng</li> <li>Tr&ecirc;n vai: d&acirc;y đeo vai nylon c&oacute; thể điều chỉnh v&agrave; th&aacute;o rời</li> </ul> <p>Đặc điểm:</p> <p>K&iacute;ch thước: Chiều cao: 27 cm, chiều rộng: 38 cm, độ d&agrave;y: 7 cm v&agrave; vừa với một m&aacute;y t&iacute;nh x&aacute;ch tay 15 inch.</p> <p>C&aacute;c t&iacute;nh năng b&ecirc;n ngo&agrave;i:</p> <ul> <li>Một ngăn c&oacute; kh&oacute;a k&eacute;o</li> <li>Một t&uacute;i trước c&oacute; kh&oacute;a k&eacute;o</li> <li>Một t&uacute;i sau phẳng với một t&uacute;i đựng điện thoại</li> <li>Đ&oacute;ng zip kim loại k&eacute;p</li> </ul> <p>C&aacute;c t&iacute;nh năng b&ecirc;n trong:</p> <ul> <li>Một t&uacute;i c&oacute; kh&oacute;a k&eacute;o</li> <li>Hai ống đựng b&uacute;t</li> <li>Một t&uacute;i điện thoại</li> <li>Đằng trước : Một t&uacute;i phẳng viền da, bao gồm d&acirc;y đeo</li> </ul> <p>Sản xuất tại &Yacute;</p>', 5, 'BERLUTI', 1, NULL, 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(49, 'FENDI Brown Fabric Belt Bag', 15000000, '<p>T&uacute;i thắt lưng c&oacute; kh&oacute;a k&eacute;o. Đai điều chỉnh. Được l&agrave;m bằng vải với họa tiết FF. Được t&ocirc; điểm bằng lớp phủ bằng da m&agrave;u tự nhi&ecirc;n. Đồ kim loại bằng paladi.<br /> Sản xuất tại &Yacute;<br /> Chiều d&agrave;i: 46, cm</p> <p>Chiều cao: 18 cm</p> <p>Chiều s&acirc;u: 9, cm</p> <p>Trọng lượng: 0,453 kg</p> <p>Th&agrave;nh phần: 45% Cotton, 40% Polyurethane, 15% Polyester, chất liệu 2: 100% Da b&ograve;, b&ecirc;n trong: 63% Cotton, 34% Polyester, 3% Acrylic, Ribb</p>', 5, 'FENDI ', 1, NULL, 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(56, 'THOM BROWNE Tech Runner Sneakers', 9000000, '\'<p>Những người theo đuổi giấc mơ mang gi&agrave;y thể thao. Được trang tr&iacute; bằng một v&ograve;ng grosgrain đặc trưng. <strong>Tech runner sneakers&nbsp;Thom Browne</strong> l&agrave; sự lựa chọn ho&agrave;n hảo để đảm bảo bạn lu&ocirc;n theo đuổi phong c&aacute;ch của m&igrave;nh. Thiết kế mũi gi&agrave;y tr&ograve;n, d&acirc;y buộc ph&iacute;a trước bằng ren, lưỡi trai in nổi thương hiệu, mặt tr&ecirc;n bằng lưới, c&aacute;c tấm da hỗn hợp v&agrave; đế cao su.</p> <p><u><strong>Th&agrave;nh phần:</strong></u></p> <ul> <li>Đế: Cao su 100%</li> <li>Lớp l&oacute;t: Da 100%</li> <li>B&ecirc;n ngo&agrave;i: Da hỗn hợp 100%, Nylon 100%</li> <li>Sản xuất tại &Yacute;</li> </ul>', 6, 'THOM BROWNE', 1, NULL, 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(57, 'PALLADIUM Pampa OX Organic Eucalyptus', 9000000, '<p>Một sản phẩm thiết yếu trong Bộ sưu tập th&acirc;n thiện với m&ocirc;i trường, những đ&ocirc;i ủng Pampa cổ thấp n&agrave;y cung cấp khả năng t&ugrave;y chỉnh v&agrave; t&iacute;nh bền vững. C&aacute;c th&agrave;nh phẩn hữu cơ c&oacute; thể th&aacute;o rời, sẽ giải th&iacute;ch sứ mệnh của n&oacute;, trong khi b&ocirc;ng hữu cơ 100% v&agrave; c&aacute;c đầu ren c&oacute; thể ph&acirc;n hủy sinh học kết hợp phong c&aacute;ch với đạo đức m&ocirc;i trường.</p> <p>Chất liệu:</p> <ul> <li>Vải 100% b&ocirc;ng hữu cơ,&nbsp;cotton 100% hữu cơ</li> <li>Đế: Cao su với 15% cao su t&aacute;i chế + Khu&ocirc;n cắt EVA</li> <li>T&ecirc;n thương hiệu được dệt ở l&ograve;ng v&agrave; g&oacute;t ch&acirc;n</li> <li>C&aacute;c chi tiết: khoen / ren tr&ograve;n bằng polyester t&aacute;i chế</li> </ul>', 6, '', 1, '2022-05-18 16:24:51', 800, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(58, 'MLB Chunky High Low New York Yankees', 8000000, '<p>Xuất hiện v&agrave;o cuối năm 2017 nhưng đến nay những đ&ocirc;i gi&agrave;y MLB mang phong c&aacute;ch Chunky Sneakers đ&atilde; trở th&agrave;nh cơn sốt v&agrave; tạo n&ecirc;n trending.</p> <p>Thương Hiệu: MLB-Korea. C&aacute;c thiết kế của thương hiệu n&agrave;y lu&ocirc;n mang đậm tinh thần thể thao đường phố v&agrave; c&oacute; t&iacute;nh ứng dụng cao, được truyền cảm hứng từ bộ m&ocirc;n b&oacute;ng ch&agrave;y. Một l&agrave;n s&oacute;ng tr&agrave;o lưu mới đ&atilde; được tạo ra từ sự kết hợp giữa b&oacute;ng ch&agrave;y v&agrave; thời trang.</p> <p>Chất liệu:&nbsp;</p> <ul> <li>Th&acirc;n: Da tổng hợp</li> <li>Đế: Cao su tổng hợp</li> <li>Đế giầy MLB Big Ball Chunky với 2 lớp d&iacute;nh liền với nhau c&ugrave;ng đường c&aacute;ch điệu mềm mại khiến ch&uacute;ng ta c&oacute; cảm gi&aacute;c như đ&ocirc;i gi&agrave;y c&oacute; 3 lớp đế. Nếu nh&igrave;n kỹ đế giầy, bạn sẽ nhận thấy họa tiết chữ MLB được c&aacute;ch điệu v&ocirc; c&ugrave;ng tinh tế.&nbsp;</li> <li>Điểm nhấn của những đ&ocirc;i MLB Big Ball Chunky l&agrave; họa tiết logo lớn của c&aacute;c đội b&oacute;ng ch&agrave;y Big Ball y&ecirc;u qu&yacute; của MLB.</li> </ul>', 6, 'MLB', 1, NULL, 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(59, 'ALEXANDER MCQUEEN Tread Slick Lace Up', 5000000, '<p>Gi&agrave;y thể thao đế thấp Tread Slick m&agrave;u trắng / vải cotton nhiều m&agrave;u của Alexander McQueen c&oacute; phần cổ tương phản, mũi gi&agrave;y tr&ograve;n, đ&iacute;nh ren ph&iacute;a trước, kh&oacute;a k&eacute;o ở g&oacute;t v&agrave; đế cao su chunky.<br /> C&oacute; nguồn gốc từ Savile Row, Alexander McQueen kết hợp di sản may đo của Anh với tinh thần nổi loạn r&otilde; rệt. Dưới sự quản l&yacute; của Sarah Burton - người đ&atilde; tạo ra tầm nh&igrave;n l&atilde;ng mạn của ri&ecirc;ng m&igrave;nh trong khi vẫn duy tr&igrave; một g&oacute;c cạnh khi&ecirc;u kh&iacute;ch - ng&ocirc;i nh&agrave; tiếp tục g&acirc;y ấn tượng với bộ trang phục kh&ocirc;ng lỗi, những bản in r&ugrave;ng rợn v&agrave; d&ograve;ng gi&agrave;y thể thao tuy&ecirc;n bố đặc trưng.</p> <p>Đặc điểm:</p> <ul> <li>G&oacute;t: 5,5 cm;</li> <li>Nền: 4 cm;</li> <li>B&ecirc;n ngo&agrave;i: 100% cotton, L&oacute;t: 100% da, Đế: 100% cao su</li> <li>Sản xuất tại &Yacute;</li> </ul>', 6, 'ALEXANDER MCQUEEN ', 1, NULL, 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(60, 'XVESSEL Sneaker Violet Paisley', 9000000, '<ul> <li>Thương hiệu: Xvessel</li> <li>Phong c&aacute;ch: Sneaker</li> <li>M&agrave;u sắc: Violet</li> <li>Sản xuất tại Trung Quốc</li> </ul> <p>Ra mắt v&agrave;o th&aacute;ng 12/2018, Xvessel l&agrave; thương hiệu thời trang của Van Ness Wu, người Đ&agrave;i Loan, Ng&ocirc; Kiến H&agrave;o, th&agrave;nh vi&ecirc;n nh&oacute;m F4 nổi tiếng một thời, l&agrave; tuổi thơ của nhiều thế hệ 8x 9x tại Việt Nam. Với thiết kế gi&agrave;y thể thao độc đ&aacute;o gợi nhớ đến c&aacute;c xu hướng như converse chuck taylor, gi&agrave;y Xvessel rất dễ mặc với mọi trang phục.</p> <p>Hiện tại, tr&agrave;o lưu Xvessel đ&atilde; lan sang c&aacute;c nước Ch&acirc;u &Aacute; như H&agrave;n Quốc, Nhật Bản, Trung Quốc v&agrave; nay l&agrave; Việt Nam.</p>', 6, 'XVESSEL', 1, NULL, 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(68, 'abc', 42143526, '<p>g&eacute;dzhs</p>', 1, NULL, 1, '2022-04-28 05:36:00', 0, 0, 'Còn hàng', '2022-04-27 05:37:05'),
(71, 'ALEXANDER MCQUEEN Hybrid Lace-Up Boot', 1000000, '<p>Gi&agrave;y cao cổ bằng da b&ecirc; m&agrave;u đen s&aacute;ng b&oacute;ng với chi tiết brogue v&agrave; đế cao su qu&aacute; khổ. Boot d&aacute;ng với h&igrave;nh tr&ograve;n mũi gi&agrave;y. Kết hợp với chữ k&yacute; Alexander McQueen tương phản tr&ecirc;n c&aacute;c tab dải băng.</p> <p>Chất liệu: 100% da b&ecirc;</p>', 6, 'ALEXANDER MCQUEEN', 1, '2022-04-28 15:41:18', 1000, 500, 'Còn hàng', '2022-04-13 15:41:18'),
(78, 'BERLUTI Alessandro Norwegian Oxford', 42328441, '<p>Đặc điểm:</p> <ul> <li>Oxford</li> <li>Type: Na Uy</li> <li>Da Venezia</li> <li>Một miếng da duy nhất</li> <li>Lớp l&oacute;t v&agrave; đế m&agrave;u tự nhi&ecirc;n</li> <li>Đế ngo&agrave;i d&agrave;y hơn Demesure th&ocirc;ng thường</li> <li>Thiết kế kh&acirc;u trang tr&iacute; ở phần g&oacute;t</li> </ul> <p>Chất lượng v&agrave; thiết lập:</p> <ul> <li>Da b&ecirc; Venezia -&nbsp;non-Patinable</li> <li>Qu&aacute; tr&igrave;nh chăm s&oacute;c đồ da của Venezia bắt đầu bằng việc loại bỏ bụi bẩn bằng c&aacute;ch sử dụng vải mềm, sau đ&oacute; l&agrave; b&ocirc;i s&aacute;p c&oacute; m&agrave;u ph&ugrave; hợp để nu&ocirc;i dưỡng v&agrave; bảo vệ đồ da. Sau đ&oacute; d&ugrave;ng găng tay đ&aacute;nh b&oacute;ng ch&agrave; x&aacute;t mạnh để l&agrave;m s&aacute;ng b&oacute;ng.</li> </ul>', 7, 'BERLUTI', 1, NULL, 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(79, 'BERLUTI Patchwork Scritto Oxford', 9000000, '<p>Đặc điểm:</p> <ul> <li>Kiểu Blake</li> <li>Gi&agrave;y ren ba lỗ</li> <li>Patchwork pha Scritto v&agrave; Venezia trơn b&oacute;ng</li> <li>Lớp l&oacute;t v&agrave; đế ngo&agrave;i m&agrave;u đen</li> <li>Đế ngo&agrave;i bằng da d&agrave;y</li> <li>Sản xuất tại &Yacute;</li> </ul> <p>Chất liệu &amp; Chăm s&oacute;c:</p> <ul> <li>Da b&ecirc; Venezia Scritto - Patinable</li> <li>Qu&aacute; tr&igrave;nh chăm s&oacute;c đồ da của Venezia bắt đầu bằng việc loại bỏ bụi bẩn bằng c&aacute;ch sử dụng vải mềm, sau đ&oacute; l&agrave; b&ocirc;i s&aacute;p c&oacute; m&agrave;u ph&ugrave; hợp để nu&ocirc;i dưỡng v&agrave; bảo vệ đồ da. Sau đ&oacute; d&ugrave;ng găng tay đ&aacute;nh b&oacute;ng ch&agrave; x&aacute;t mạnh để l&agrave;m s&aacute;ng b&oacute;ng.</li> </ul>', 7, 'BERLUTI', 1, NULL, 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(80, 'BERLUTI Alessandro MOGANO Oxford', 8000000, '<p>Đặc điểm:</p> <ul> <li>Da b&ecirc; Venezia</li> <li>Gi&agrave;y ren ba lỗ</li> <li>Gi&agrave;y da một mảnh</li> <li>L&oacute;t, đế v&agrave; gi&agrave;y c&oacute; độ tương phản</li> <li>Ho&agrave;n thiện của thợ đ&oacute;ng gi&agrave;y: cạnh đế tr&ograve;n sử dụng b&aacute;nh xe xoắn</li> <li>Chữ k&yacute; &#39;Berluti&#39; được l&agrave;m thủ c&ocirc;ng th&ecirc;m phần ho&agrave;n thiện trang nh&atilde; cho đế</li> <li>Kiến tr&uacute;c: Blake</li> <li>Sản xuất tại &Yacute;</li> </ul> <p>Chăm s&oacute;c:</p> <p>Qu&aacute; tr&igrave;nh chăm s&oacute;c đồ da của Venezia bắt đầu bằng việc loại bỏ bụi bẩn bằng c&aacute;ch sử dụng một miếng vải mềm, sau đ&oacute; l&agrave; d&ugrave;ng s&aacute;p da trong để nu&ocirc;i dưỡng v&agrave; bảo vệ đồ da. Sau đ&oacute;, ch&agrave; x&aacute;t mạnh bằng găng tay đ&aacute;nh b&oacute;ng để kh&ocirc;i phục độ b&oacute;ng ban đầu của da.</p>', 7, 'BERLUTI', 1, NULL, 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(81, 'BERLUTI Alessandro NERO LUCIDO Oxford', 5000000, '<p>Đặc điểm:</p> <ul> <li>Gi&agrave;y ren ba lỗ</li> <li>Gi&agrave;y da một mảnh</li> <li>Kiến tr&uacute;c: Blake</li> <li>Sản xuất tại &Yacute;</li> <li>Da b&ecirc; Venezia</li> </ul> <p>Chăm s&oacute;c:</p> <p>Qu&aacute; tr&igrave;nh chăm s&oacute;c đồ da của Venezia bắt đầu bằng việc loại bỏ bụi bẩn bằng c&aacute;ch sử dụng một miếng vải mềm, sau đ&oacute; l&agrave; d&ugrave;ng s&aacute;p da trong để nu&ocirc;i dưỡng v&agrave; bảo vệ đồ da. Sau đ&oacute;, ch&agrave; x&aacute;t mạnh bằng găng tay đ&aacute;nh b&oacute;ng để kh&ocirc;i phục độ b&oacute;ng ban đầu của da.</p>', 7, 'BERLUTI', 1, NULL, 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(89, 'Nồi cơm điện 1.8L Sunhouse', 9000000, '<p>Thương hiệu: Sunhouse</p> <p>Xuất xứ: Trung Quốc</p> <p>Dung t&iacute;ch thực: 1.8 l&iacute;t</p> <p>C&ocirc;ng suất: 700 W</p> <p>Chất liệu l&ograve;ng nồi: Hợp kim nh&ocirc;m phủ chống d&iacute;nh</p> <p>K&iacute;ch thước DxRxC (mm): 302 mm x 295 mm x 335 mm</p> <p>Trọng lượng: 2600 g</p>', 8, 'Sunhouse', 1, '2022-05-25 16:52:54', 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(90, 'Nồi cơm nắp gài Kangaroo 1.2L', 8000000, 'p>Thương hiệu: Kangaroo</p> <p>Xuất xứ: Trung Quốc</p> <p>Dung t&iacute;ch thực: 1.2 l&iacute;t</p> <p>C&ocirc;ng suất: 400 W</p> <p>Chất liệu l&ograve;ng nồi: Hợp kim phủ chống d&iacute;nh</p> <p>K&iacute;ch thước DxRxC (mm): 267 mm x 267 mm x 280 mm</p> <p>Trọng lượng: 2200g</p>', 8, 'Kangaroo', 1, NULL, 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(91, 'Nồi cơm điện tử Kangaroo 1.8L', 3000000, '<p>Thương hiệu: Kangaroo</p> <p>Xuất xứ: Trung Quốc</p> <p>Dung t&iacute;ch thực: 1.8 l&iacute;t</p> <p>C&ocirc;ng suất: 700 W</p> <p>Chất liệu l&ograve;ng nồi: Hợp kim nh&ocirc;m phủ chống d&iacute;nh</p> <p>K&iacute;ch thước DxRxC (mm): 310 mm x 310 mm x 330 mm</p> <p>Trọng lượng: 3200g</p>', 8, 'Kangaroo', 1, NULL, 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(92, 'Nồi cơm điện Toshiba RC-18JFM(H)VN', 8000000, '<p>Thương hiệu: Toshiba</p> <p>Xuất xứ: Trung Quốc</p> <p>Dung t&iacute;ch thực: 1.8 l&iacute;t</p> <p>C&ocirc;ng suất: 700 W</p> <p>Chất liệu l&ograve;ng nồi: Hợp kim phủ chống d&iacute;nh</p> <p>K&iacute;ch thước DxRxC (mm): 286 mm x 282 mm x 263 mm</p> <p>Trọng lượng: 2.7 kg</p>', 8, 'Toshiba', 1, NULL, 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(100, 'Quạt điều hòa Honeywell', 1600000, '<p>Thương hiệu của: Mỹ</p> <p>H&atilde;ng: Honeywell</p> <p>Phạm vi l&agrave;m m&aacute;t: Ph&ograve;ng 25 - 30 m&sup2;</p> <p>C&ocirc;ng suất: 230 W</p> <p>Tốc độ gi&oacute;: 4 mức gi&oacute;</p> <p>Chế độ gi&oacute;: Gi&oacute; thường</p> <p>Điều khiển: C&oacute; remote đi k&egrave;m N&uacute;t nhấn</p> <p>Độ ồn cao nhất: 60 dB</p> <p>B&igrave;nh nước: 20 l&iacute;t</p> <p>K&iacute;ch thước, khối lượng: Ngang 49 cm - Cao 84 cm - S&acirc;u 34 cm - 10.3 kg</p>', 9, 'Honeywell', 1, NULL, 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(101, 'Quạt điều hòa Sunhouse', 5000000, '<p>Thương hiệu của: Việt Nam</p> <p>H&atilde;ng: Sunhouse</p> <p>Phạm vi l&agrave;m m&aacute;t: Ph&ograve;ng 20 - 25 m&sup2;</p> <p>C&ocirc;ng suất: 120 W Tốc độ gi&oacute;: 8 mức gi&oacute;</p> <p>Chế độ gi&oacute;: Gi&oacute; tự nhi&ecirc;n, Gi&oacute; thường</p> <p>Điều khiển: Cảm ứng c&oacute; m&agrave;n h&igrave;nh hiển thị, C&oacute; remote đi k&egrave;m</p> <p>Độ ồn cao nhất: 60 dB</p> <p>B&igrave;nh nước: 13 l&iacute;t</p> <p>K&iacute;ch thước, khối lượng: Ngang 33 cm - Cao 98 cm - S&acirc;u 36 cm - 9.8 kg</p>', 9, 'Sunhouse', 1, NULL, 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(102, 'Quạt điều hòa Kangaroo', 9000000, '<p>Thương hiệu của: Việt Nam</p> <p>H&atilde;ng: Kangaroo.</p> <p>Phạm vi l&agrave;m m&aacute;t: Ph&ograve;ng 30 - 40 m&sup2;</p> <p>C&ocirc;ng suất: 180 W</p> <p>Tốc độ gi&oacute;: 3 mức gi&oacute;</p> <p>Điều khiển: N&uacute;m xoay, N&uacute;t nhấn</p> <p>Độ ồn cao nhất: 63 dB</p> <p>B&igrave;nh nước: 55 l&iacute;t</p> <p>Mức ti&ecirc;u thụ nước: Khoảng 3 - 4 l&iacute;t/giờ</p> <p>K&iacute;ch thước, khối lượng: Ngang 60 cm - Cao 117 cm - S&acirc;u 40 cm - 20.7 kg</p>', 9, 'Kangaroo', 1, NULL, 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(103, 'Quạt điều hoà Daikiosan', 5000000, 'Quạt điều hoà Daikiosan', 9, 'Daikiosan', 1, NULL, 0, 0, 'Còn hàng', '2022-04-25 01:17:21'),
(104, 'Máy lọc nước R.O Hydrogen Kangaroo', 5000000, '<p>Thương hiệu: Kangaroo</p> <p>Nơi sản xuất: Việt Nam</p> <p>Năm ra mắt: 2019</p> <p>K&iacute;ch thước, khối lượng: Ngang 42 cm - Cao 120.7 cm - S&acirc;u 42 cm - Nặng 27 kg</p> <p>Dung t&iacute;ch b&igrave;nh chứa: 8 l&iacute;t</p> <p>C&ocirc;ng nghệ lọc: Thẩm thấu ngược RO</p> <p>C&ocirc;ng suất lọc nước: 18 - 20 l&iacute;t/giờ</p> <p>C&ocirc;ng suất ti&ecirc;u thụ điện trung b&igrave;nh khoảng: 0.035 - 0.038 kW/h</p>', 9, 'Kangaroo', 1, NULL, 0, 0, 'Còn hàng', '2022-04-25 01:17:21');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `username` char(20) NOT NULL,
  `ProID` int(10) UNSIGNED NOT NULL,
  `time` datetime DEFAULT NULL,
  `comment` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`username`, `ProID`, `time`, `comment`) VALUES
('thaothao', 2, '2022-04-26 10:07:17', 'san pham tot'),
('thaothao', 2, '2022-04-26 10:25:43', 'abc'),
('thaothao', 2, '2022-04-26 10:26:01', 'abcdef'),
('thaothao', 2, '2022-04-26 00:00:00', 'gsdf'),
('thaothao', 2, NULL, 'thht'),
('thaothao', 2, '2022-04-26 00:00:00', 'dgxg'),
('thaothao', 2, '2022-04-26 04:36:30', 'h'),
('thaothao', 1, '2022-04-26 07:36:42', 'bdtr');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('M7k32bxFyKt4lnYxLNn4kAFlZSwUKhw4', 1651106353, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"auth\":true,\"registerUser\":\"thanhthaothaothao2@gmail.com\",\"username\":\"19127552\",\"retUrl\":\"http://localhost:3000/admin/upload\",\"authAccount\":{\"userId\":25,\"email\":\"thanhthaothaothao2@gmail.com\",\"username\":\"19127552\",\"name\":\"Thao Nguyen\",\"dob\":\"2000-03-29T17:00:00.000Z\",\"address\":\"135B,Tran Hung Dao, Q1,TPHCM\",\"banned\":0,\"otp\":0,\"role\":\"user\",\"isVerify\":1},\"cart\":[]}');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userId` int(10) UNSIGNED NOT NULL,
  `email` varchar(60) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` char(60) NOT NULL,
  `name` varchar(40) NOT NULL,
  `dob` date NOT NULL,
  `address` varchar(100) NOT NULL,
  `banned` tinyint(1) NOT NULL DEFAULT 0,
  `otp` smallint(6) NOT NULL,
  `role` varchar(10) NOT NULL DEFAULT 'user',
  `isVerify` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userId`, `email`, `username`, `password`, `name`, `dob`, `address`, `banned`, `otp`, `role`, `isVerify`) VALUES
(25, 'thanhthaothaothao2@gmail.com', '19127552', '$2b$10$fzJpc8AyJ85njdEbJduuXuUcmP1jsAKZZcpOgkn.n2t8t4eH7GOQW', 'Thao Nguyen', '2000-03-30', '135B,Tran Hung Dao, Q1,TPHCM', 0, 0, 'user', 1),
(24, 'jennyjenny19020@gmail.com', 'thaothao', '$2b$10$x.ovnZRiIAwujbHr9DpDpePxnWL2IqYjVJ./zGrI4s6Im5mU69/Ze', 'Thanh Thao Nguyen', '2000-04-05', '135B,Tran Hung Dao, Q1,TPHCM', 0, 8368, 'admin', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`CatID`);
ALTER TABLE `categories` ADD FULLTEXT KEY `category` (`CatName`);
ALTER TABLE `categories` ADD FULLTEXT KEY `CatName` (`CatName`);

--
-- Indexes for table `categoriesnext`
--
ALTER TABLE `categoriesnext`
  ADD PRIMARY KEY (`CatIDNext`),
  ADD KEY `CatID` (`CatID`);

--
-- Indexes for table `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`ProID`,`username`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `oderdetails_ibfk_2` (`ProID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProID`),
  ADD KEY `products_ibfk_1` (`CatIDNext`);
ALTER TABLE `products` ADD FULLTEXT KEY `ProName` (`ProName`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categoriesnext`
--
ALTER TABLE `categoriesnext`
  MODIFY `CatIDNext` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ProID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categoriesnext`
--
ALTER TABLE `categoriesnext`
  ADD CONSTRAINT `categoriesnext_ibfk_1` FOREIGN KEY (`CatID`) REFERENCES `categories` (`CatID`);

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `oderdetails_ibfk_2` FOREIGN KEY (`ProID`) REFERENCES `products` (`ProID`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`CatIDNext`) REFERENCES `categoriesnext` (`CatIDNext`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
