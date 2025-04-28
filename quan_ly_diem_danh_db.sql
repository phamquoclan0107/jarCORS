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

--INSERT INTO `buoi_hoc` (`ma_buoi_hoc`, `ngay_hoc`, `tiet_bat_dau`, `tiet_ket_thuc`, `ma_mon_hoc`, `ma_phong`, `ma_tham_gia`, `gv_id`) VALUES
--(5, '2025-04-19', 5, 9, 'KT', 'P02', '7f7674f811', 'ND003'),
--(14, '2025-04-24', 5, 8, 'LTW', 'P02', '2789b60b4c', 'ND003'),
--(15, '2025-04-26', 2, 6, 'LTW', 'P02', '162902c504', 'GV05'),
--(16, '2025-04-27', 4, 8, 'KTLT', 'P03', 'd220b8a19f', 'GV01');

-- --------------------------------------------------------

--
-- Table structure for table `diem_danh`
--


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

--INSERT INTO `diem_danh` (`ma_buoi_hoc`, `ma_diem_danh`, `thoi_gian_diem_danh`, `ma_nguoi_dung`, `phuong_thuc`, `trang_thai`, `code`, `created_at`, `expired_at`) VALUES
--(5, 1, NULL, 'ND003', 'manual', 'absent', 'ce82c6', '2025-04-26 05:48:57.000000', '2025-04-26 03:30:00.000000'),
--(5, 2, NULL, 'ND003', 'manual', 'absent', '6151b9', '2025-04-26 05:50:16.000000', '2025-04-26 03:30:00.000000'),
--(5, 3, NULL, 'ND003', 'manual', 'absent', 'd3d8fb', '2025-04-26 05:50:20.000000', '2025-04-26 03:30:00.000000'),
--(14, 4, NULL, 'ND003', 'manual', 'absent', '2dae5a', '2025-04-26 05:58:18.000000', '2025-04-25 23:03:18.000000'),
--(14, 5, NULL, 'ND003', 'manual', 'absent', '386084', '2025-04-26 06:01:06.000000', '2025-04-25 23:06:06.000000'),
--(14, 6, NULL, 'ND003', 'manual', 'absent', 'b232ea', '2025-04-26 06:08:07.000000', '2025-04-25 23:13:07.000000'),
--(14, 7, NULL, 'ND003', 'manual', 'absent', '06478e', '2025-04-26 06:08:41.000000', '2025-04-25 23:13:41.000000'),
--(14, 8, NULL, 'ND003', 'manual', 'absent', '80126a', '2025-04-26 06:31:31.000000', '2025-04-25 23:36:31.000000'),
--(14, 9, NULL, 'ND003', 'manual', 'absent', '7f9fbf', '2025-04-26 07:51:24.000000', '2025-04-26 07:56:24.000000'),
--(14, 10, NULL, 'ND003', 'manual', 'absent', 'faa51c', '2025-04-26 09:35:26.000000', '2025-04-26 09:40:26.000000'),
--(14, 11, NULL, 'ND003', 'manual', 'absent', '255f7e', '2025-04-26 09:37:05.000000', '2025-04-26 09:42:05.000000'),
--(14, 12, NULL, 'ND003', 'manual', 'absent', '080b24', '2025-04-26 10:09:41.000000', '2025-04-26 10:14:41.000000'),
--(14, 13, NULL, 'ND003', 'manual', 'absent', '3f9087', '2025-04-26 10:20:31.000000', '2025-04-26 10:25:31.000000'),
--(14, 14, NULL, 'ND003', 'manual', 'absent', '55fdd6', '2025-04-26 10:30:06.000000', '2025-04-26 10:35:06.000000'),
--(15, 15, NULL, 'GV05', 'manual', 'absent', 'e7305a', '2025-04-26 10:39:39.000000', '2025-04-26 10:44:39.000000'),
--(15, 16, NULL, 'GV05', 'manual', 'absent', '4175ff', '2025-04-26 11:04:34.000000', '2025-04-26 11:09:34.000000'),
--(16, 17, NULL, 'GV01', 'manual', 'absent', '3f5601', '2025-04-27 09:45:54.000000', '2025-04-27 09:50:54.000000'),
--(15, 18, NULL, 'GV05', 'manual', 'absent', 'fa5d59', '2025-04-27 12:32:36.621987', '2025-04-27 12:37:36.621987');

-- --------------------------------------------------------

--
-- Table structure for table `diem_danh_sinh_vien`
--


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



-- --------------------------------------------------------

--
-- Table structure for table `lop_sinh_vien`
--


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


CREATE TABLE IF NOT EXISTS `mon_hoc` (
  `ma_mon_hoc` varchar(255) NOT NULL,
  `ten_mon_hoc` varchar(255) NOT NULL,
  PRIMARY KEY (`ma_mon_hoc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mon_hoc`
--



-- --------------------------------------------------------

--
-- Table structure for table `nguoi_dung`
--


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



-- --------------------------------------------------------

--
-- Table structure for table `nguoi_tham_gia`
--


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


-- --------------------------------------------------------

--
-- Table structure for table `phong`
--


CREATE TABLE IF NOT EXISTS `phong` (
  `ma_phong` varchar(255) NOT NULL,
  `ten_phong` varchar(255) NOT NULL,
  PRIMARY KEY (`ma_phong`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `phong`
--

INSERT INTO `phong` (`ma_phong`, `ten_phong`) VALUES
('P01', 'Phòng C801'),
('P02', 'Phòng C802'),
('P03', 'Phòng C803');
('P04', 'Phòng C804');
('P05', 'Phòng C805');
('P06', 'Phòng C806');
('P07', 'Phòng C807');
('P08', 'Phòng C808');
('P09', 'Phòng C701');
('P010', 'Phòng C702'),
('P011', 'Phòng C703');
('P012', 'Phòng C704');
('P013', 'Phòng C705');
('P014', 'Phòng C706');
('P015', 'Phòng C707');
('P016', 'Phòng C708');

-- --------------------------------------------------------

--
-- Table structure for table `tai_khoan`
--


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
('1234', '$2a$10$X.lhuj27aTwEUo9kNiokxexwIEjoVzaUkKD.RROLuSHcqDbuy6IHq', 'nguyenvana', 'admin')


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
