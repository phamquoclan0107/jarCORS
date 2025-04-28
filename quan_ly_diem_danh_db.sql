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


CREATE TABLE IF NOT EXISTS `tai_khoan` (
  `ma_tai_khoan` varchar(255) NOT NULL,
  `mat_khau` varchar(255) NOT NULL,
  `ten_tai_khoan` varchar(255) NOT NULL,
  `role` enum('admin','student','teacher') NOT NULL,
  PRIMARY KEY (`ma_tai_khoan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `tai_khoan` (`ma_tai_khoan`, `mat_khau`, `ten_tai_khoan`, `role`) VALUES
('1234', '$2a$10$X.lhuj27aTwEUo9kNiokxexwIEjoVzaUkKD.RROLuSHcqDbuy6IHq', 'nguyenvana', 'admin');



CREATE TABLE IF NOT EXISTS `lop_sinh_vien` (
  `ma_lop` varchar(255) NOT NULL,
  `ten_lop` varchar(255) NOT NULL,
  PRIMARY KEY (`ma_lop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `lop_sinh_vien` (`ma_lop`, `ten_lop`) VALUES
('GV', 'Giang Vien');

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `phong` (
  `ma_phong` varchar(255) NOT NULL,
  `ten_phong` varchar(255) NOT NULL,
  PRIMARY KEY (`ma_phong`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



INSERT INTO `phong` (`ma_phong`, `ten_phong`) VALUES
('P01', 'Phòng C801'),
('P02', 'Phòng C802'),
('P03', 'Phòng C803'),
('P04', 'Phòng C804'),
('P05', 'Phòng C805'),
('P06', 'Phòng C806'),
('P07', 'Phòng C807'),
('P08', 'Phòng C808'),
('P09', 'Phòng C701'),
('P010', 'Phòng C702'),
('P011', 'Phòng C703'),
('P012', 'Phòng C704'),
('P013', 'Phòng C705'),
('P014', 'Phòng C706'),
('P015', 'Phòng C707'),
('P016', 'Phòng C708');

CREATE TABLE IF NOT EXISTS `mon_hoc` (
  `ma_mon_hoc` varchar(255) NOT NULL,
  `ten_mon_hoc` varchar(255) NOT NULL,
  PRIMARY KEY (`ma_mon_hoc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



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
  KEY `FK1xu8i7qikw0dq270q1ejw8n27` (`ma_phong`),
  CONSTRAINT `FKresnpp25ibokky9xcp7r9nn1e` FOREIGN KEY (`ma_mon_hoc`) REFERENCES `mon_hoc` (`ma_mon_hoc`),
  CONSTRAINT `FK1xu8i7qikw0dq270q1ejw8n27` FOREIGN KEY (`ma_phong`) REFERENCES `phong` (`ma_phong`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------




-- --------------------------------------------------------


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
-- Constraints for table `buoi_hoc`

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
