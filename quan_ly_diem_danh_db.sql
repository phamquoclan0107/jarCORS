-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 27, 2025 at 12:53 PM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quan_ly_diem_danh_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `buoi_hoc`
--

DROP TABLE IF EXISTS `buoi_hoc`;
CREATE TABLE IF NOT EXISTS `buoi_hoc` (
  `ma_buoi_hoc` int NOT NULL AUTO_INCREMENT,
  `ngay_hoc` date NOT NULL,
  `tiet_bat_dau` int NOT NULL,
  `tiet_ket_thuc` int NOT NULL,
  `ma_mon_hoc` varchar(255) NOT NULL,
  `ma_phong` varchar(255) NOT NULL,
  `ma_tham_gia` varchar(255) DEFAULT NULL,
  `gv_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ma_buoi_hoc`),
  KEY `FKresnpp25ibokky9xcp7r9nn1e` (`ma_mon_hoc`),
  KEY `FK1xu8i7qikw0dq270q1ejw8n27` (`ma_phong`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buoi_hoc`
--

INSERT INTO `buoi_hoc` (`ma_buoi_hoc`, `ngay_hoc`, `tiet_bat_dau`, `tiet_ket_thuc`, `ma_mon_hoc`, `ma_phong`, `ma_tham_gia`, `gv_id`) VALUES
(5, '2025-04-19', 5, 9, 'KT', 'P02', '7f7674f811', 'ND003'),
(14, '2025-04-24', 5, 8, 'LTW', 'P02', '2789b60b4c', 'ND003'),
(15, '2025-04-26', 2, 6, 'LTW', 'P02', '162902c504', 'GV05'),
(16, '2025-04-27', 4, 8, 'KTLT', 'P03', 'd220b8a19f', 'GV01');

-- --------------------------------------------------------

--
-- Table structure for table `diem_danh`
--

DROP TABLE IF EXISTS `diem_danh`;
CREATE TABLE IF NOT EXISTS `diem_danh` (
  `ma_buoi_hoc` int NOT NULL,
  `ma_diem_danh` int NOT NULL AUTO_INCREMENT,
  `thoi_gian_diem_danh` datetime(6) DEFAULT NULL,
  `ma_nguoi_dung` varchar(255) NOT NULL,
  `phuong_thuc` enum('manual','qr_code') NOT NULL,
  `trang_thai` enum('absent','late','present') NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `expired_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`ma_diem_danh`),
  KEY `FKn39tnia8bkst1qbvkosdx8lew` (`ma_buoi_hoc`),
  KEY `FK56ahhb3iy1e50gim96jbaxyku` (`ma_nguoi_dung`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `diem_danh`
--

INSERT INTO `diem_danh` (`ma_buoi_hoc`, `ma_diem_danh`, `thoi_gian_diem_danh`, `ma_nguoi_dung`, `phuong_thuc`, `trang_thai`, `code`, `created_at`, `expired_at`) VALUES
(5, 1, NULL, 'ND003', 'manual', 'absent', 'ce82c6', '2025-04-26 05:48:57.000000', '2025-04-26 03:30:00.000000'),
(5, 2, NULL, 'ND003', 'manual', 'absent', '6151b9', '2025-04-26 05:50:16.000000', '2025-04-26 03:30:00.000000'),
(5, 3, NULL, 'ND003', 'manual', 'absent', 'd3d8fb', '2025-04-26 05:50:20.000000', '2025-04-26 03:30:00.000000'),
(14, 4, NULL, 'ND003', 'manual', 'absent', '2dae5a', '2025-04-26 05:58:18.000000', '2025-04-25 23:03:18.000000'),
(14, 5, NULL, 'ND003', 'manual', 'absent', '386084', '2025-04-26 06:01:06.000000', '2025-04-25 23:06:06.000000'),
(14, 6, NULL, 'ND003', 'manual', 'absent', 'b232ea', '2025-04-26 06:08:07.000000', '2025-04-25 23:13:07.000000'),
(14, 7, NULL, 'ND003', 'manual', 'absent', '06478e', '2025-04-26 06:08:41.000000', '2025-04-25 23:13:41.000000'),
(14, 8, NULL, 'ND003', 'manual', 'absent', '80126a', '2025-04-26 06:31:31.000000', '2025-04-25 23:36:31.000000'),
(14, 9, NULL, 'ND003', 'manual', 'absent', '7f9fbf', '2025-04-26 07:51:24.000000', '2025-04-26 07:56:24.000000'),
(14, 10, NULL, 'ND003', 'manual', 'absent', 'faa51c', '2025-04-26 09:35:26.000000', '2025-04-26 09:40:26.000000'),
(14, 11, NULL, 'ND003', 'manual', 'absent', '255f7e', '2025-04-26 09:37:05.000000', '2025-04-26 09:42:05.000000'),
(14, 12, NULL, 'ND003', 'manual', 'absent', '080b24', '2025-04-26 10:09:41.000000', '2025-04-26 10:14:41.000000'),
(14, 13, NULL, 'ND003', 'manual', 'absent', '3f9087', '2025-04-26 10:20:31.000000', '2025-04-26 10:25:31.000000'),
(14, 14, NULL, 'ND003', 'manual', 'absent', '55fdd6', '2025-04-26 10:30:06.000000', '2025-04-26 10:35:06.000000'),
(15, 15, NULL, 'GV05', 'manual', 'absent', 'e7305a', '2025-04-26 10:39:39.000000', '2025-04-26 10:44:39.000000'),
(15, 16, NULL, 'GV05', 'manual', 'absent', '4175ff', '2025-04-26 11:04:34.000000', '2025-04-26 11:09:34.000000'),
(16, 17, NULL, 'GV01', 'manual', 'absent', '3f5601', '2025-04-27 09:45:54.000000', '2025-04-27 09:50:54.000000'),
(15, 18, NULL, 'GV05', 'manual', 'absent', 'fa5d59', '2025-04-27 12:32:36.621987', '2025-04-27 12:37:36.621987');

-- --------------------------------------------------------

--
-- Table structure for table `diem_danh_sinh_vien`
--

DROP TABLE IF EXISTS `diem_danh_sinh_vien`;
CREATE TABLE IF NOT EXISTS `diem_danh_sinh_vien` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `time` datetime(6) DEFAULT NULL,
  `diemdanh_id` int DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKtflyllv7mahy2d1wxf18dncf9` (`diemdanh_id`),
  KEY `FK5expuo5jtc2lkdw7n6wvngej8` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `diem_danh_sinh_vien`
--

INSERT INTO `diem_danh_sinh_vien` (`id`, `time`, `diemdanh_id`, `user_id`, `status`) VALUES
(1, '2025-04-25 23:32:00.000000', 8, 'DH52108548', NULL),
(2, '2025-04-25 23:32:53.000000', 8, 'DH52108548', NULL),
(3, '2025-04-25 23:34:48.000000', 8, 'DH52108548', NULL),
(4, '2025-04-26 00:58:55.000000', 9, 'DH52108549', 'Dung gio'),
(5, '2025-04-26 00:58:58.000000', 9, 'DH52108549', 'Dung gio'),
(6, '2025-04-26 00:59:00.000000', 9, 'DH52108549', 'Dung gio'),
(7, '2025-04-26 00:59:02.000000', 9, 'DH52108549', 'Dung gio'),
(8, '2025-04-26 00:59:10.000000', 9, 'DH52108549', 'Dung gio'),
(9, '2025-04-26 00:59:14.000000', 9, 'DH52108549', 'Dung gio'),
(10, '2025-04-26 00:59:30.000000', 9, 'DH52108549', 'Dung gio'),
(11, '2025-04-26 01:06:12.000000', 9, 'DH52108549', 'Dung gio'),
(12, '2025-04-26 01:06:19.000000', 9, 'DH52108549', 'Dung gio'),
(13, '2025-04-26 01:06:21.000000', 9, 'DH52108549', 'Dung gio'),
(14, '2025-04-26 01:06:22.000000', 9, 'DH52108549', 'Dung gio'),
(15, '2025-04-26 01:08:08.000000', 9, 'DH52108549', 'Dung gio'),
(16, '2025-04-26 01:08:10.000000', 9, 'DH52108549', 'Dung gio'),
(17, '2025-04-26 01:08:18.000000', 9, 'DH52108549', 'Dung gio'),
(18, '2025-04-26 01:12:37.000000', 9, 'DH52108548', 'Dung gio'),
(19, '2025-04-26 01:16:42.000000', 9, 'DH52108548', 'Dung gio'),
(20, '2025-04-26 01:16:45.000000', 9, 'DH52108548', 'Dung gio'),
(21, '2025-04-26 01:20:49.000000', 9, 'DH52108548', 'Dung gio'),
(22, '2025-04-26 01:20:50.000000', 9, 'DH52108548', 'Dung gio'),
(23, '2025-04-26 01:20:50.000000', 9, 'DH52108548', 'Dung gio'),
(24, '2025-04-26 01:20:51.000000', 9, 'DH52108548', 'Dung gio'),
(25, '2025-04-26 01:20:51.000000', 9, 'DH52108548', 'Dung gio'),
(26, '2025-04-26 01:20:52.000000', 9, 'DH52108548', 'Dung gio'),
(27, '2025-04-26 01:20:52.000000', 9, 'DH52108548', 'Dung gio'),
(28, '2025-04-26 01:20:53.000000', 9, 'DH52108548', 'Dung gio'),
(29, '2025-04-26 01:28:57.000000', 9, 'DH52108548', 'Dung gio'),
(30, '2025-04-26 01:28:58.000000', 9, 'DH52108548', 'Dung gio'),
(31, '2025-04-26 01:30:32.000000', 9, 'DH52108548', 'Dung gio'),
(32, '2025-04-26 02:37:38.000000', 11, 'DH52108549', 'Dung gio'),
(33, '2025-04-26 02:37:38.000000', 11, 'DH52108549', 'Dung gio'),
(34, '2025-04-26 02:37:39.000000', 11, 'DH52108549', 'Dung gio'),
(35, '2025-04-26 02:37:39.000000', 11, 'DH52108549', 'Dung gio'),
(36, '2025-04-26 02:37:40.000000', 11, 'DH52108549', 'Dung gio'),
(37, '2025-04-26 02:37:40.000000', 11, 'DH52108549', 'Dung gio'),
(38, '2025-04-26 02:37:41.000000', 11, 'DH52108549', 'Dung gio'),
(39, '2025-04-26 02:37:42.000000', 11, 'DH52108549', 'Dung gio'),
(40, '2025-04-26 02:37:42.000000', 11, 'DH52108549', 'Dung gio'),
(41, '2025-04-26 02:37:43.000000', 11, 'DH52108549', 'Dung gio'),
(42, '2025-04-26 02:40:51.000000', 11, 'DH52108549', 'Dung gio'),
(43, '2025-04-26 02:40:51.000000', 11, 'DH52108549', 'Dung gio'),
(44, '2025-04-26 02:40:52.000000', 11, 'DH52108549', 'Dung gio'),
(45, '2025-04-26 02:40:52.000000', 11, 'DH52108549', 'Dung gio'),
(46, '2025-04-26 02:40:53.000000', 11, 'DH52108549', 'Dung gio'),
(47, '2025-04-26 02:40:54.000000', 11, 'DH52108549', 'Dung gio'),
(48, '2025-04-26 02:40:54.000000', 11, 'DH52108549', 'Dung gio'),
(49, '2025-04-26 02:40:55.000000', 11, 'DH52108549', 'Dung gio'),
(50, '2025-04-26 02:40:55.000000', 11, 'DH52108549', 'Dung gio'),
(51, '2025-04-26 02:40:56.000000', 11, 'DH52108549', 'Dung gio'),
(52, '2025-04-26 02:40:56.000000', 11, 'DH52108549', 'Dung gio'),
(53, '2025-04-26 02:40:57.000000', 11, 'DH52108549', 'Dung gio'),
(54, '2025-04-26 02:40:58.000000', 11, 'DH52108549', 'Dung gio'),
(55, '2025-04-26 02:40:58.000000', 11, 'DH52108549', 'Dung gio'),
(56, '2025-04-26 02:40:59.000000', 11, 'DH52108549', 'Dung gio'),
(57, '2025-04-26 02:40:59.000000', 11, 'DH52108549', 'Dung gio'),
(58, '2025-04-26 02:41:00.000000', 11, 'DH52108549', 'Dung gio'),
(59, '2025-04-26 02:41:00.000000', 11, 'DH52108549', 'Dung gio'),
(60, '2025-04-26 02:41:01.000000', 11, 'DH52108549', 'Dung gio'),
(61, '2025-04-26 02:41:02.000000', 11, 'DH52108549', 'Dung gio'),
(62, '2025-04-26 02:41:02.000000', 11, 'DH52108549', 'Dung gio'),
(63, '2025-04-26 02:44:07.000000', 11, 'DH52108549', 'Dung gio'),
(64, '2025-04-26 02:44:08.000000', 11, 'DH52108549', 'Dung gio'),
(65, '2025-04-26 02:44:08.000000', 11, 'DH52108549', 'Dung gio'),
(66, '2025-04-26 02:44:09.000000', 11, 'DH52108549', 'Dung gio'),
(67, '2025-04-26 02:44:10.000000', 11, 'DH52108549', 'Dung gio'),
(68, '2025-04-26 02:44:10.000000', 11, 'DH52108549', 'Dung gio'),
(69, '2025-04-26 02:44:11.000000', 11, 'DH52108549', 'Dung gio'),
(70, '2025-04-26 02:44:11.000000', 11, 'DH52108549', 'Dung gio'),
(71, '2025-04-26 02:44:12.000000', 11, 'DH52108549', 'Dung gio'),
(72, '2025-04-26 02:44:12.000000', 11, 'DH52108549', 'Dung gio'),
(73, '2025-04-26 02:44:13.000000', 11, 'DH52108549', 'Dung gio'),
(74, '2025-04-26 02:44:13.000000', 11, 'DH52108549', 'Dung gio'),
(75, '2025-04-26 02:45:44.000000', 11, 'DH52108549', 'Dung gio'),
(76, '2025-04-26 02:45:45.000000', 11, 'DH52108549', 'Dung gio'),
(77, '2025-04-26 02:45:45.000000', 11, 'DH52108549', 'Dung gio'),
(78, '2025-04-26 02:45:46.000000', 11, 'DH52108549', 'Dung gio'),
(79, '2025-04-26 02:45:46.000000', 11, 'DH52108549', 'Dung gio'),
(80, '2025-04-26 02:45:47.000000', 11, 'DH52108549', 'Dung gio'),
(81, '2025-04-26 02:45:47.000000', 11, 'DH52108549', 'Dung gio'),
(82, '2025-04-26 02:45:48.000000', 11, 'DH52108549', 'Dung gio'),
(83, '2025-04-26 02:45:49.000000', 11, 'DH52108549', 'Dung gio'),
(84, '2025-04-26 02:45:49.000000', 11, 'DH52108549', 'Dung gio'),
(85, '2025-04-26 02:56:04.000000', 11, 'DH52108548', 'Dung gio'),
(86, '2025-04-26 10:21:13.000000', 13, 'ND003', 'Dung gio'),
(87, '2025-04-26 10:26:34.000000', 13, 'DH52108549', 'Dung gio'),
(88, '2025-04-26 10:28:27.000000', 12, 'DH52108548', 'Dung gio'),
(89, '2025-04-26 10:30:11.000000', 14, 'DH52108548', 'Dung gio'),
(90, '2025-04-26 03:42:15.000000', 15, 'DH52108548', 'Dung gio'),
(91, '2025-04-26 03:43:13.000000', 15, 'DH52108549', 'Dung gio'),
(92, '2025-04-26 03:43:13.000000', 15, 'DH52108549', 'Dung gio'),
(93, '2025-04-26 03:43:14.000000', 15, 'DH52108549', 'Dung gio'),
(94, '2025-04-26 03:43:15.000000', 15, 'DH52108549', 'Dung gio'),
(95, '2025-04-26 03:43:15.000000', 15, 'DH52108549', 'Dung gio'),
(96, '2025-04-26 03:43:16.000000', 15, 'DH52108549', 'Dung gio'),
(97, '2025-04-26 03:43:16.000000', 15, 'DH52108549', 'Dung gio'),
(98, '2025-04-26 03:43:17.000000', 15, 'DH52108549', 'Dung gio'),
(99, '2025-04-26 03:43:17.000000', 15, 'DH52108549', 'Dung gio'),
(100, '2025-04-27 09:46:20.000000', 17, 'DH52108548', 'Dung gio'),
(101, '2025-04-27 02:49:04.000000', 17, 'DH52108549', 'Dung gio'),
(102, '2025-04-27 02:49:04.000000', 17, 'DH52108549', 'Dung gio'),
(103, '2025-04-27 02:49:05.000000', 17, 'DH52108549', 'Dung gio'),
(104, '2025-04-27 02:49:06.000000', 17, 'DH52108549', 'Dung gio'),
(105, '2025-04-27 02:49:06.000000', 17, 'DH52108549', 'Dung gio'),
(106, '2025-04-27 02:49:07.000000', 17, 'DH52108549', 'Dung gio'),
(107, '2025-04-27 02:49:07.000000', 17, 'DH52108549', 'Dung gio'),
(108, '2025-04-27 02:49:08.000000', 17, 'DH52108549', 'Dung gio'),
(109, '2025-04-27 02:49:08.000000', 17, 'DH52108549', 'Dung gio');

-- --------------------------------------------------------

--
-- Table structure for table `lop_sinh_vien`
--

DROP TABLE IF EXISTS `lop_sinh_vien`;
CREATE TABLE IF NOT EXISTS `lop_sinh_vien` (
  `ma_lop` varchar(255) NOT NULL,
  `ten_lop` varchar(255) NOT NULL,
  PRIMARY KEY (`ma_lop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lop_sinh_vien`
--

INSERT INTO `lop_sinh_vien` (`ma_lop`, `ten_lop`) VALUES
('D20_TH09', 'Tin hoc 09'),
('D21_TH06', 'Tin hoc 06'),
('D21_TH07', 'Tin hoc 07'),
('GV', 'Giang Vien');

-- --------------------------------------------------------

--
-- Table structure for table `mon_hoc`
--

DROP TABLE IF EXISTS `mon_hoc`;
CREATE TABLE IF NOT EXISTS `mon_hoc` (
  `ma_mon_hoc` varchar(255) NOT NULL,
  `ten_mon_hoc` varchar(255) NOT NULL,
  PRIMARY KEY (`ma_mon_hoc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mon_hoc`
--

INSERT INTO `mon_hoc` (`ma_mon_hoc`, `ten_mon_hoc`) VALUES
('CTDL&GT', 'Cau truc du lieu va giai thuat'),
('KT', 'Ky Thuat lap trinh'),
('KTLT', 'KY THUAT LAP TRINH'),
('LTW', 'Lap trinh mang'),
('NMLT', 'Nhap mon lap trinh 1');

-- --------------------------------------------------------

--
-- Table structure for table `nguoi_dung`
--

DROP TABLE IF EXISTS `nguoi_dung`;
CREATE TABLE IF NOT EXISTS `nguoi_dung` (
  `email` varchar(255) DEFAULT NULL,
  `ma_lop` varchar(255) DEFAULT NULL,
  `ma_nguoi_dung` varchar(255) NOT NULL,
  `ma_tai_khoan` varchar(255) DEFAULT NULL,
  `sdt` varchar(255) DEFAULT NULL,
  `ten_nguoi_dung` varchar(255) NOT NULL,
  PRIMARY KEY (`ma_nguoi_dung`),
  UNIQUE KEY `UKmajqh5g4djy2tp3p9dvr64brp` (`email`),
  UNIQUE KEY `UKltruy9naf2a8dw4mteq44xufk` (`ma_tai_khoan`),
  KEY `FK4kfboc7g5ory9apx9nntvvslw` (`ma_lop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nguoi_dung`
--

INSERT INTO `nguoi_dung` (`email`, `ma_lop`, `ma_nguoi_dung`, `ma_tai_khoan`, `sdt`, `ten_nguoi_dung`) VALUES
('hai@stu.edu.vn', 'D20_TH09', 'DH00', 'df45007f-f3ec-437f-9abe-78f592387b71', '0127736484', 'Hai'),
('thua@gmail.com', 'D20_TH09', 'DH123456', '2f7f648b-54da-4320-9094-74f980d0db14', '0374958373', 'Van Dinh Thuat'),
('truong@gmail.com', 'D21_TH06', 'DH52108548', 'f7709531-52c6-4a98-997b-575cf0b34e85', '0866783068', 'Nguyen Thanh Truong'),
('dh52108549@student.stu.edu.vn', 'D21_TH06', 'DH52108549', 'baa8ec02-a32a-42c8-b90e-10986224be08', '0226138575', 'Dang Thanh Hai'),
('ha12i@gmail.com', 'GV', 'GV01', '8aacbf13-69cd-474d-81d1-517a93be1d88', '0346847355', 'Dang Thanh Hai'),
('dangthanhhai55555@gmail.com', 'GV', 'GV05', 'c52868f7-3762-4262-a21b-26e0823a541f', '0866782055', 'Dang Hai'),
('nguyen.lan@example.com', 'D21_TH06', 'ND001', '1234', '0123456789', 'Nguyen Thi Lan'),
('danghai220503@gmail.com', 'D21_TH06', 'ND002', 'TK001', '0123456789', 'Nguyen Thi Lan'),
('danghai22052003@gmail.com', 'GV', 'ND003', 'TK002', '0123456729', 'Nguyen Thi Lann');

-- --------------------------------------------------------

--
-- Table structure for table `nguoi_tham_gia`
--

DROP TABLE IF EXISTS `nguoi_tham_gia`;
CREATE TABLE IF NOT EXISTS `nguoi_tham_gia` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_buoihoc` int DEFAULT NULL,
  `id_nguoidung` varchar(255) DEFAULT NULL,
  `buoihoc_id` int DEFAULT NULL,
  `nguoidung_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK87aqkpabi7bfukgu2jyh2bgcm` (`id_buoihoc`),
  KEY `FK92kd0sjnal4olirs2r6mqgply` (`id_nguoidung`),
  KEY `FKs7m9d0kal9qtv80wssa9lp6gj` (`buoihoc_id`),
  KEY `FKtojp2r3lsbk1ssso6oca99og9` (`nguoidung_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nguoi_tham_gia`
--

INSERT INTO `nguoi_tham_gia` (`id`, `id_buoihoc`, `id_nguoidung`, `buoihoc_id`, `nguoidung_id`) VALUES
(15, NULL, NULL, 14, 'DH52108549'),
(16, NULL, NULL, 14, 'DH52108548'),
(18, NULL, NULL, 5, 'DH52108548'),
(20, NULL, NULL, 14, 'DH52108548'),
(21, NULL, NULL, 14, 'DH52108548'),
(22, NULL, NULL, 15, 'DH52108549'),
(23, NULL, NULL, 16, 'DH52108548'),
(24, NULL, NULL, 16, 'DH52108549');

-- --------------------------------------------------------

--
-- Table structure for table `phong`
--

DROP TABLE IF EXISTS `phong`;
CREATE TABLE IF NOT EXISTS `phong` (
  `ma_phong` varchar(255) NOT NULL,
  `ten_phong` varchar(255) NOT NULL,
  PRIMARY KEY (`ma_phong`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `phong`
--

INSERT INTO `phong` (`ma_phong`, `ten_phong`) VALUES
('P01', 'PhÃ²ng 1'),
('P02', 'PhÃ²ng 2'),
('P03', 'PhÃ²ng 3');

-- --------------------------------------------------------

--
-- Table structure for table `tai_khoan`
--

DROP TABLE IF EXISTS `tai_khoan`;
CREATE TABLE IF NOT EXISTS `tai_khoan` (
  `ma_tai_khoan` varchar(255) NOT NULL,
  `mat_khau` varchar(255) NOT NULL,
  `ten_tai_khoan` varchar(255) NOT NULL,
  `role` enum('admin','student','teacher') NOT NULL,
  PRIMARY KEY (`ma_tai_khoan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tai_khoan`
--

INSERT INTO `tai_khoan` (`ma_tai_khoan`, `mat_khau`, `ten_tai_khoan`, `role`) VALUES
('1234', '$2a$10$X.lhuj27aTwEUo9kNiokxexwIEjoVzaUkKD.RROLuSHcqDbuy6IHq', 'nguyenvana', 'admin'),
('2f7f648b-54da-4320-9094-74f980d0db14', '$2a$10$.8sFwByLbOB6mL4C.RJqkOTjsIwevd4R1n2saCS8oluYmBZ5ibhJm', 'DH123456', 'student'),
('8aacbf13-69cd-474d-81d1-517a93be1d88', '$2a$10$dSpK3YmGumEx5rf1Z2CIbuw/9z9AcL87COPjGbWiLSku4jx24qOP.', 'GV01', 'teacher'),
('baa8ec02-a32a-42c8-b90e-10986224be08', '$2a$10$x3QvHvT1Z3vnai9LXZOMQecwWHu8C5r.KAFmy.LMf2R5AuvE8TcZ.', 'DH52108549', 'student'),
('c52868f7-3762-4262-a21b-26e0823a541f', '$2a$10$NwPJyAhmqW/a27y8B/bjSe/BjZ7lUuPVnCuOI2mxcQA3tURF.j8r2', 'GV05', 'teacher'),
('df45007f-f3ec-437f-9abe-78f592387b71', '$2a$10$x4LIXMDUMsQ1mMBSehUFvuJ2Q9BfXefCnGG3..Z3zbR2MurXS5swK', 'DH00', 'student'),
('f7709531-52c6-4a98-997b-575cf0b34e85', '$2a$10$fTBO5nmio7ODNyKeMST15euRlxl1j66Aj4KHw76Z.zGeSlpl5RHEC', 'DH52108548', 'student'),
('TK001', '$2a$10$TU9KfmMOXOZmj2JeCu354.PrAoNo0ZAjEwj7F1mQWRYTD8Tml6EVi', 'dangthanhhai', 'student'),
('TK002', '$2a$10$wWL5JhA9AnvFcHewuAiyI.lE2geP6yUQ0sMg82kX/GE2jlsB4OI0G', 'hai', 'teacher');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buoi_hoc`
--
ALTER TABLE `buoi_hoc`
  ADD CONSTRAINT `FK1xu8i7qikw0dq270q1ejw8n27` FOREIGN KEY (`ma_phong`) REFERENCES `phong` (`ma_phong`),
  ADD CONSTRAINT `FKresnpp25ibokky9xcp7r9nn1e` FOREIGN KEY (`ma_mon_hoc`) REFERENCES `mon_hoc` (`ma_mon_hoc`);

--
-- Constraints for table `diem_danh`
--
ALTER TABLE `diem_danh`
  ADD CONSTRAINT `FK56ahhb3iy1e50gim96jbaxyku` FOREIGN KEY (`ma_nguoi_dung`) REFERENCES `nguoi_dung` (`ma_nguoi_dung`),
  ADD CONSTRAINT `FKn39tnia8bkst1qbvkosdx8lew` FOREIGN KEY (`ma_buoi_hoc`) REFERENCES `buoi_hoc` (`ma_buoi_hoc`);

--
-- Constraints for table `diem_danh_sinh_vien`
--
ALTER TABLE `diem_danh_sinh_vien`
  ADD CONSTRAINT `FK5expuo5jtc2lkdw7n6wvngej8` FOREIGN KEY (`user_id`) REFERENCES `nguoi_dung` (`ma_nguoi_dung`),
  ADD CONSTRAINT `FKtflyllv7mahy2d1wxf18dncf9` FOREIGN KEY (`diemdanh_id`) REFERENCES `diem_danh` (`ma_diem_danh`);

--
-- Constraints for table `nguoi_dung`
--
ALTER TABLE `nguoi_dung`
  ADD CONSTRAINT `FK4kfboc7g5ory9apx9nntvvslw` FOREIGN KEY (`ma_lop`) REFERENCES `lop_sinh_vien` (`ma_lop`),
  ADD CONSTRAINT `FKbrlqj8q133ly8l99xc05wf6sk` FOREIGN KEY (`ma_tai_khoan`) REFERENCES `tai_khoan` (`ma_tai_khoan`);

--
-- Constraints for table `nguoi_tham_gia`
--
ALTER TABLE `nguoi_tham_gia`
  ADD CONSTRAINT `FK87aqkpabi7bfukgu2jyh2bgcm` FOREIGN KEY (`id_buoihoc`) REFERENCES `buoi_hoc` (`ma_buoi_hoc`),
  ADD CONSTRAINT `FK92kd0sjnal4olirs2r6mqgply` FOREIGN KEY (`id_nguoidung`) REFERENCES `nguoi_dung` (`ma_nguoi_dung`),
  ADD CONSTRAINT `FKs7m9d0kal9qtv80wssa9lp6gj` FOREIGN KEY (`buoihoc_id`) REFERENCES `buoi_hoc` (`ma_buoi_hoc`),
  ADD CONSTRAINT `FKtojp2r3lsbk1ssso6oca99og9` FOREIGN KEY (`nguoidung_id`) REFERENCES `nguoi_dung` (`ma_nguoi_dung`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
