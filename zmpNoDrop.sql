-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 25, 2025 at 04:16 PM
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
-- Database: `test`
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
  `gv_id` varchar(255) DEFAULT NULL,
  `ma_mon_hoc` varchar(255) NOT NULL,
  `ma_phong` varchar(255) NOT NULL,
  `ma_tham_gia` varchar(255) NOT NULL,
  PRIMARY KEY (`ma_buoi_hoc`),
  KEY `FKresnpp25ibokky9xcp7r9nn1e` (`ma_mon_hoc`),
  KEY `FK1xu8i7qikw0dq270q1ejw8n27` (`ma_phong`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buoi_hoc`
--

INSERT INTO `buoi_hoc` (`ma_buoi_hoc`, `ngay_hoc`, `tiet_bat_dau`, `tiet_ket_thuc`, `gv_id`, `ma_mon_hoc`, `ma_phong`, `ma_tham_gia`) VALUES
(1, '2025-04-24', 1, 3, 'GV001', 'CSC101', 'P101', 'CNTT01'),
(2, '2025-04-24', 4, 6, 'GV002', 'CSC201', 'P102', 'CNTT01'),
(3, '2025-04-25', 1, 3, 'GV001', 'CSC301', 'P201', 'CNTT02'),
(4, '2025-04-25', 4, 6, 'GV002', 'CSC401', 'P202', 'KTPM01');

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
  PRIMARY KEY (`ma_diem_danh`),
  KEY `FKn39tnia8bkst1qbvkosdx8lew` (`ma_buoi_hoc`),
  KEY `FK56ahhb3iy1e50gim96jbaxyku` (`ma_nguoi_dung`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `diem_danh`
--

INSERT INTO `diem_danh` (`ma_buoi_hoc`, `ma_diem_danh`, `thoi_gian_diem_danh`, `ma_nguoi_dung`, `phuong_thuc`, `trang_thai`) VALUES
(1, 1, '2025-04-24 08:05:00.000000', 'SV001', 'qr_code', 'present'),
(1, 2, '2025-04-24 08:15:00.000000', 'SV002', 'qr_code', 'late'),
(2, 3, '2025-04-24 13:00:00.000000', 'SV001', 'manual', 'present'),
(2, 4, NULL, 'SV002', 'manual', 'absent'),
(3, 5, '2025-04-25 08:10:00.000000', 'SV003', 'qr_code', 'present'),
(4, 6, '2025-04-25 13:05:00.000000', 'SV004', 'qr_code', 'present');

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
('CNTT01', 'Công nghệ thông tin K01'),
('CNTT02', 'Công nghệ thông tin K02'),
('D21_TH06', 'CNTT 6'),
('KTPM01', 'Kỹ thuật phần mềm K01'),
('MMT01', 'Mạng máy tính K01');

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

INSERT INTO `mon_hoc` (`ma_mon_hoc`, `ten_mon_hoc`) VALUES
('CSC101', 'Nhập môn lập trình'),
('CSC201', 'Cơ sở dữ liệu'),
('CSC301', 'Kỹ thuật phần mềm'),
('CSC401', 'Trí tuệ nhân tạo'),
('CSC501', 'Mạng máy tính');

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

INSERT INTO `nguoi_dung` (`email`, `ma_lop`, `ma_nguoi_dung`, `ma_tai_khoan`, `sdt`, `ten_nguoi_dung`) VALUES
('admin@example.com', NULL, 'AD001', 'admin001', '0999999999', 'Admin User'),
('DH52100015@student.stu.edu.vn', 'D21_TH06', 'DH52100015', 'DH52100015', '09395419572', 'Hoàng Văn Đức'),
('DH52100018@student.stu.edu.vn', 'D21_TH06', 'DH52100018', 'DH52100018', '09755859950', 'Nguyễn Nguyên Thi'),
('DH52100077@student.stu.edu.vn', 'D21_TH06', 'DH52100077', 'DH52100077', '09482075157', 'Chu Gia Quyền'),
('DH52100215@student.stu.edu.vn', 'D21_TH06', 'DH52100215', 'DH52100215', '09942959872', 'Hà Bảo Nguyên'),
('DH52100311@student.stu.edu.vn', 'D21_TH06', 'DH52100311', 'DH52100311', '09350606158', 'Đặng Ngọc Hiếu'),
('DH52100332@student.stu.edu.vn', 'D21_TH06', 'DH52100332', 'DH52100332', '09574289903', 'Trần Hoàng Phúc'),
('DH52100456@student.stu.edu.vn', 'D21_TH06', 'DH52100456', 'DH52100456', '09519056516', 'Huỳnh Hoàng Hải'),
('DH52100514@student.stu.edu.vn', 'D21_TH06', 'DH52100514', 'DH52100514', '09127280008', 'Trần Quốc Nam'),
('DH52100604@student.stu.edu.vn', 'D21_TH06', 'DH52100604', 'DH52100604', '09587436293', 'Phạm Quốc Thái'),
('DH52100999@student.stu.edu.vn', 'D21_TH06', 'DH52100999', 'DH52100999', '09991300043', 'Phạm Mạnh Tuấn'),
('DH52101584@student.stu.edu.vn', 'D21_TH06', 'DH52101584', 'DH52101584', '09784373244', 'Nguyễn Thị Anh Thư'),
('DH52101650@student.stu.edu.vn', 'D21_TH06', 'DH52101650', 'DH52101650', '09576243485', 'Châu Quang Nhật'),
('DH52101695@student.stu.edu.vn', 'D21_TH06', 'DH52101695', 'DH52101695', '09925322541', 'Nguyễn Thị Khả Nhi'),
('DH52101717@student.stu.edu.vn', 'D21_TH06', 'DH52101717', 'DH52101717', '09296582140', 'Lê Minh Hiếu'),
('DH52101914@student.stu.edu.vn', 'D21_TH06', 'DH52101914', 'DH52101914', '09172487801', 'Huỳnh Tấn Phát'),
('DH52102001@student.stu.edu.vn', 'D21_TH06', 'DH52102001', 'DH52102001', '09946107548', 'Phạm Anh Tuấn'),
('DH52102487@student.stu.edu.vn', 'D21_TH06', 'DH52102487', 'DH52102487', '09464825758', 'Nguyễn Thị Tử Vi'),
('DH52102720@student.stu.edu.vn', 'D21_TH06', 'DH52102720', 'DH52102720', '09247794831', 'Trần Nguyễn Bảo Uyên'),
('DH52102882@student.stu.edu.vn', 'D21_TH06', 'DH52102882', 'DH52102882', '09644117657', 'Bùi Thanh Hậu'),
('DH52102897@student.stu.edu.vn', 'D21_TH06', 'DH52102897', 'DH52102897', '09174699830', 'Phạm Đặng Thái Hưng'),
('DH52103039@student.stu.edu.vn', 'D21_TH06', 'DH52103039', 'DH52103039', '09902293307', 'Phạm Xuân Phú'),
('DH52103066@student.stu.edu.vn', 'D21_TH06', 'DH52103066', 'DH52103066', '09599541857', 'Đỗ Nguyễn Anh Khôi'),
('DH52103223@student.stu.edu.vn', 'D21_TH06', 'DH52103223', 'DH52103223', '09941306437', 'Nguyễn Công Danh'),
('DH52103264@student.stu.edu.vn', 'D21_TH06', 'DH52103264', 'DH52103264', '09673458752', 'Ngô Tấn Hảo'),
('DH52103348@student.stu.edu.vn', 'D21_TH06', 'DH52103348', 'DH52103348', '09798504489', 'Nguyễn Phan Hoàng Đạt'),
('DH52103467@student.stu.edu.vn', 'D21_TH06', 'DH52103467', 'DH52103467', '09303214512', 'Nguyễn Thành Minh'),
('DH52103588@student.stu.edu.vn', 'D21_TH06', 'DH52103588', 'DH52103588', '09214050067', 'Nguyễn Đoàn Minh Hùng'),
('DH52103784@student.stu.edu.vn', 'D21_TH06', 'DH52103784', 'DH52103784', '09387933060', 'Nguyễn Hữu Luân'),
('DH52103871@student.stu.edu.vn', 'D21_TH06', 'DH52103871', 'DH52103871', '09684630815', 'Phạm Minh Trị'),
('DH52103938@student.stu.edu.vn', 'D21_TH06', 'DH52103938', 'DH52103938', '09356259596', 'Bùi Văn Anh Kiệt'),
('DH52104015@student.stu.edu.vn', 'D21_TH06', 'DH52104015', 'DH52104015', '09402373376', 'Nguyễn Huy Hoàng'),
('DH52104508@student.stu.edu.vn', 'D21_TH06', 'DH52104508', 'DH52104508', '09428277486', 'Trần Sô Ny'),
('DH52104582@student.stu.edu.vn', 'D21_TH06', 'DH52104582', 'DH52104582', '09613371376', 'Ngô Duy Tùng'),
('DH52104782@student.stu.edu.vn', 'D21_TH06', 'DH52104782', 'DH52104782', '09537079873', 'Phan Thành Văn'),
('DH52104857@student.stu.edu.vn', 'D21_TH06', 'DH52104857', 'DH52104857', '09270048398', 'Lê Thị Đa Lin'),
('DH52104938@student.stu.edu.vn', 'D21_TH06', 'DH52104938', 'DH52104938', '09814754356', 'Nguyễn Vũ Luân'),
('DH52105057@student.stu.edu.vn', 'D21_TH06', 'DH52105057', 'DH52105057', '09599966298', 'Lê Thị Mỹ Trinh'),
('DH52105154@student.stu.edu.vn', 'D21_TH06', 'DH52105154', 'DH52105154', '09642409577', 'Nguyễn Tuấn Sang'),
('DH52105156@student.stu.edu.vn', 'D21_TH06', 'DH52105156', 'DH52105156', '09909467091', 'Lê Thanh Trung'),
('DH52105157@student.stu.edu.vn', 'D21_TH06', 'DH52105157', 'DH52105157', '09312885737', 'Nguyễn Phú'),
('DH52105312@student.stu.edu.vn', 'D21_TH06', 'DH52105312', 'DH52105312', '09781800294', 'Trần Hà Xuân Thịnh'),
('DH52105342@student.stu.edu.vn', 'D21_TH06', 'DH52105342', 'DH52105342', '09186260214', 'Trần Nguyễn Minh Quân'),
('DH52105346@student.stu.edu.vn', 'D21_TH06', 'DH52105346', 'DH52105346', '09605684796', 'Lê Nguyễn Thành Vũ'),
('DH52105686@student.stu.edu.vn', 'D21_TH06', 'DH52105686', 'DH52105686', '09409886896', 'Lâm Hoàng Đức'),
('DH52105753@student.stu.edu.vn', 'D21_TH06', 'DH52105753', 'DH52105753', '09624667707', 'Nguyễn Hồ Minh Hiển'),
('DH52105768@student.stu.edu.vn', 'D21_TH06', 'DH52105768', 'DH52105768', '09279766048', 'Vương Văn Thắng'),
('DH52106083@student.stu.edu.vn', 'D21_TH06', 'DH52106083', 'DH52106083', '09463949486', 'Lê Trung Phú'),
('DH52106169@student.stu.edu.vn', 'D21_TH06', 'DH52106169', 'DH52106169', '09295487233', 'Phan Trường Giang'),
('DH52106187@student.stu.edu.vn', 'D21_TH06', 'DH52106187', 'DH52106187', '09938575396', 'Tạ Tương Hiếu'),
('DH52106328@student.stu.edu.vn', 'D21_TH06', 'DH52106328', 'DH52106328', '09443993632', 'Lê Trung Hiếu'),
('DH52106342@student.stu.edu.vn', 'D21_TH06', 'DH52106342', 'DH52106342', '09782110062', 'Trần Thị Ngọc Tuyền'),
('DH52106356@student.stu.edu.vn', 'D21_TH06', 'DH52106356', 'DH52106356', '09397149641', 'Phạm Nhựt Hào'),
('DH52106430@student.stu.edu.vn', 'D21_TH06', 'DH52106430', 'DH52106430', '09253084251', 'Nguyễn Trọng Phúc'),
('DH52106608@student.stu.edu.vn', 'D21_TH06', 'DH52106608', 'DH52106608', '09356160058', 'Đỗ Quang Vinh'),
('DH52106667@student.stu.edu.vn', 'D21_TH06', 'DH52106667', 'DH52106667', '09370773560', 'Nguyễn Đình Thông'),
('DH52106696@student.stu.edu.vn', 'D21_TH06', 'DH52106696', 'DH52106696', '09604754652', 'Trần Đức Huy'),
('DH52106804@student.stu.edu.vn', 'D21_TH06', 'DH52106804', 'DH52106804', '09295593328', 'Nguyễn Trường Giang'),
('DH52106873@student.stu.edu.vn', 'D21_TH06', 'DH52106873', 'DH52106873', '09370067395', 'Nguyễn Hoàng Quan'),
('DH52106969@student.stu.edu.vn', 'D21_TH06', 'DH52106969', 'DH52106969', '09925658741', 'Đỗ Thành Luân'),
('DH52106994@student.stu.edu.vn', 'D21_TH06', 'DH52106994', 'DH52106994', '09555590572', 'Nguyễn Phạm Đăng Khoa'),
('DH52107035@student.stu.edu.vn', 'D21_TH06', 'DH52107035', 'DH52107035', '09845102743', 'Lưu Tấn Sang'),
('DH52107203@student.stu.edu.vn', 'D21_TH06', 'DH52107203', 'DH52107203', '09972407312', 'Nguyễn Ngọc Thiện'),
('DH52107369@student.stu.edu.vn', 'D21_TH06', 'DH52107369', 'DH52107369', '09809623485', 'Trần Thế Vũ'),
('DH52107607@student.stu.edu.vn', 'D21_TH06', 'DH52107607', 'DH52107607', '09640951819', 'Lê Hoàng Công'),
('DH52107697@student.stu.edu.vn', 'D21_TH06', 'DH52107697', 'DH52107697', '09694889534', 'Đinh Nguyễn Tuấn'),
('DH52107801@student.stu.edu.vn', 'D21_TH06', 'DH52107801', 'DH52107801', '09998925486', 'Nguyễn Thanh Vân'),
('DH52107825@student.stu.edu.vn', 'D21_TH06', 'DH52107825', 'DH52107825', '09818993535', 'Nguyễn Huỳnh Đức'),
('DH52107880@student.stu.edu.vn', 'D21_TH06', 'DH52107880', 'DH52107880', '09593042740', 'Trần Hồ Minh Đức'),
('DH52108033@student.stu.edu.vn', 'D21_TH06', 'DH52108033', 'DH52108033', '09170545948', 'Võ Ngọc Tấn Tài'),
('DH52108154@student.stu.edu.vn', 'D21_TH06', 'DH52108154', 'DH52108154', '09677710628', 'Trần Tam Quý'),
('DH52108297@student.stu.edu.vn', 'D21_TH06', 'DH52108297', 'DH52108297', '09398667413', 'Nguyễn Ngọc Yến Linh'),
('DH52108380@student.stu.edu.vn', 'D21_TH06', 'DH52108380', 'DH52108380', '09497386536', 'Đoàn Thị Yến Bình'),
('DH52108402@student.stu.edu.vn', 'D21_TH06', 'DH52108402', 'DH52108402', '09418931491', 'Nguyễn Trung Hiếu'),
('DH52108453@student.stu.edu.vn', 'D21_TH06', 'DH52108453', 'DH52108453', '09536803708', 'Đinh Phạm Phú Khang'),
('DH52108517@student.stu.edu.vn', 'D21_TH06', 'DH52108517', 'DH52108517', '09228403300', 'Hoàng Hữu Lê Chinh'),
('DH52108592@student.stu.edu.vn', 'D21_TH06', 'DH52108592', 'DH52108592', '09179985963', 'Huỳnh Khánh Linh'),
('dh52108640@student.stu.edu.vn', 'D21_TH06', 'DH52108640', 'DH52108640', '09819077540', 'Nguyễn Thanh Trường'),
('dh52108610@student.stu.edu.vn', NULL, 'DH52108641', 'DH52108641', '9819077543', 'Hồ Đình Khả Trường'),
('DH52108711@student.stu.edu.vn', 'D21_TH06', 'DH52108711', 'DH52108711', '09529831774', 'Đặng Gia Bảo'),
('DH52108834@student.stu.edu.vn', 'D21_TH06', 'DH52108834', 'DH52108834', '09261352209', 'Huỳnh Tấn Tài'),
('DH52108890@student.stu.edu.vn', 'D21_TH06', 'DH52108890', 'DH52108890', '09797338121', 'Phan Trường Huy'),
('DH52109046@student.stu.edu.vn', 'D21_TH06', 'DH52109046', 'DH52109046', '09150102165', 'Trần Quang Tuấn'),
('DH52109270@student.stu.edu.vn', 'D21_TH06', 'DH52109270', 'DH52109270', '09320756467', 'Phùng Kiến Phước'),
('DH52110660@student.stu.edu.vn', 'D21_TH06', 'DH52110660', 'DH52110660', '09732566413', 'Nguyễn Chí Cường'),
('DH52110688@student.stu.edu.vn', 'D21_TH06', 'DH52110688', 'DH52110688', '09403876582', 'Triệu Quốc Dũng'),
('DH52110694@student.stu.edu.vn', 'D21_TH06', 'DH52110694', 'DH52110694', '09257490473', 'Đinh Ngọc Trần Duy'),
('DH52110854@student.stu.edu.vn', 'D21_TH06', 'DH52110854', 'DH52110854', '09197003988', 'Huỳnh Tích Hải'),
('DH52110937@student.stu.edu.vn', 'D21_TH06', 'DH52110937', 'DH52110937', '09124756976', 'Nguyễn Thiện Hòa'),
('DH52110982@student.stu.edu.vn', 'D21_TH06', 'DH52110982', 'DH52110982', '09469016463', 'Lê Mạnh Hùng'),
('DH52111033@student.stu.edu.vn', 'D21_TH06', 'DH52111033', 'DH52111033', '09178444915', 'Nguyễn Thành Huy'),
('DH52111111@student.stu.edu.vn', 'D21_TH06', 'DH52111111', 'DH52111111', '09778105937', 'Bùi Ngọc Duy Khánh'),
('DH52111162@student.stu.edu.vn', 'D21_TH06', 'DH52111162', 'DH52111162', '09136999722', 'Lê Trung Kiên'),
('DH52111167@student.stu.edu.vn', 'D21_TH06', 'DH52111167', 'DH52111167', '09700714814', 'Nguyễn Trung Kiên'),
('DH52111247@student.stu.edu.vn', 'D21_TH06', 'DH52111247', 'DH52111247', '09188393562', 'Đinh Xuân Lộc'),
('DH52111288@student.stu.edu.vn', 'D21_TH06', 'DH52111288', 'DH52111288', '09401915468', 'Đỗ Danh Mạnh'),
('DH52111481@student.stu.edu.vn', 'D21_TH06', 'DH52111481', 'DH52111481', '09975739062', 'Trương Quang Phát'),
('DH52111801@student.stu.edu.vn', 'D21_TH06', 'DH52111801', 'DH52111801', '09499113065', 'Trần Đức Thiều'),
('DH52111824@student.stu.edu.vn', 'D21_TH06', 'DH52111824', 'DH52111824', '09611097428', 'Đặng Trương Hoàng Thọ'),
('DH52111881@student.stu.edu.vn', 'D21_TH06', 'DH52111881', 'DH52111881', '09148385446', 'Trần Thủy Tiên'),
('DH52111903@student.stu.edu.vn', 'D21_TH06', 'DH52111903', 'DH52111903', '09325406291', 'Nguyễn Kiều Minh Toàn'),
('DH52111919@student.stu.edu.vn', 'D21_TH06', 'DH52111919', 'DH52111919', '09348953501', 'Trần Bảo Nam Trân'),
('DH52111925@student.stu.edu.vn', 'D21_TH06', 'DH52111925', 'DH52111925', '09912205328', 'Nguyễn Công Trí'),
('DH52111940@student.stu.edu.vn', 'D21_TH06', 'DH52111940', 'DH52111940', '09695420616', 'Nguyễn Đăng Triển'),
('DH52111960@student.stu.edu.vn', 'D21_TH06', 'DH52111960', 'DH52111960', '09159022432', 'Hà Tiến Trung'),
('DH52111969@student.stu.edu.vn', 'D21_TH06', 'DH52111969', 'DH52111969', '09683663552', 'Trần Minh Trung'),
('DH52111990@student.stu.edu.vn', 'D21_TH06', 'DH52111990', 'DH52111990', '09376360835', 'Phan Thanh Tú'),
('DH52112869@student.stu.edu.vn', 'D21_TH06', 'DH52112869', 'DH52112869', '09425511588', 'Nguyễn Thị Tường Vy'),
('DH52112913@student.stu.edu.vn', 'D21_TH06', 'DH52112913', 'DH52112913', '09749033187', 'Phan Huỳnh Hoàng Lâm'),
('DH52113000@student.stu.edu.vn', 'D21_TH06', 'DH52113000', 'DH52113000', '09698057907', 'Nguyễn Đinh Đồng'),
('DH52113196@student.stu.edu.vn', 'D21_TH06', 'DH52113196', 'DH52113196', '09524536035', 'Trần Đỗ Quốc Kiệt'),
('nguyenvana@example.com', NULL, 'GV001', 'gv001', '0901234567', 'Nguyễn Văn A'),
('tranthib@example.com', NULL, 'GV002', 'gv002', '0912345678', 'Trần Thị B'),
('levanc@example.com', 'CNTT01', 'SV001', 'sv001', '0923456789', 'Lê Văn C'),
('phamthid@example.com', 'CNTT01', 'SV002', 'sv002', '0934567890', 'Phạm Thị D'),
('hoangvane@example.com', 'CNTT02', 'SV003', 'sv003', '0945678901', 'Hoàng Văn E'),
('nguyenthif@example.com', 'KTPM01', 'SV004', 'sv004', '0956789012', 'Nguyễn Thị F');

-- --------------------------------------------------------

--
-- Table structure for table `nguoi_tham_gia`
--

CREATE TABLE IF NOT EXISTS `nguoi_tham_gia` (
  `buoihoc_id` int DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nguoidung_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKs7m9d0kal9qtv80wssa9lp6gj` (`buoihoc_id`),
  KEY `FKtojp2r3lsbk1ssso6oca99og9` (`nguoidung_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nguoi_tham_gia`
--

INSERT INTO `nguoi_tham_gia` (`buoihoc_id`, `id`, `nguoidung_id`) VALUES
(1, 1, 'SV001'),
(1, 2, 'SV002'),
(2, 3, 'SV001'),
(2, 4, 'SV002'),
(3, 5, 'SV003'),
(4, 6, 'SV004');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_token`
--

CREATE TABLE IF NOT EXISTS `password_reset_token` (
  `expiry_date` datetime(6) NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ma_nguoi_dung` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKmh4yfbouef35fax1q90ycsc5g` (`ma_nguoi_dung`),
  UNIQUE KEY `UKg0guo4k8krgpwuagos61oc06j` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
('P101', 'Phòng học 101'),
('P102', 'Phòng học 102'),
('P201', 'Phòng học 201'),
('P202', 'Phòng học 202');

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
('admin001', '$2a$10$xVfD7zYF.Y9ZONmOOJni8eWruQS0jtl0zN1zOk9jwR0OVVw0F0U22', 'admin', 'admin'),
('DH52100015', '$2a$10$1OT3J34yh/Z.UtmsVNyFfOn2Iv4UJ3TewdIdc2RQrzmrEG05ONWlC', 'DH52100015', 'student'),
('DH52100018', '$2a$10$/QuBW390Exg2xK0haL5Jve9ftDaxz1dApO/KLluRDDxmXIfrs5T8q', 'DH52100018', 'student'),
('DH52100077', '$2a$10$awOXFD2kEF4avhMKXnrO1OrtsoFuTtzxozqeYiuK3HCzXAEpyAdV6', 'DH52100077', 'student'),
('DH52100215', '$2a$10$55nvoO0d2NN.57eJYjD8suOs5lmEbHcEozZsQ3gjbod0Jwek6Xn0K', 'DH52100215', 'student'),
('DH52100311', '$2a$10$a80RsCdGSuQ7r.p/y7xhaelFl0HBVbJUkOQohurvHKjhmvaMZkQeu', 'DH52100311', 'student'),
('DH52100332', '$2a$10$IjgeuEwBOu2KShxH8BbhzeRMs/1unZxQgguDJumMLLnmPusXaTzna', 'DH52100332', 'student'),
('DH52100456', '$2a$10$0VT5bmqeNNZ5DWmfhyjvLujL2jMFWU6OoTrV1KL.0GGKngA.uHv1i', 'DH52100456', 'student'),
('DH52100514', '$2a$10$yF6OSFE5ZV2ssY5Ks8pNGuvN9RFbDk7dvswiJMPKmKojODvjelBp.', 'DH52100514', 'student'),
('DH52100604', '$2a$10$XJPGotsuC39EqNuJWxQwrOWcpmRyZ3gEnk7HBBG3H3z2/Rah.eJ/2', 'DH52100604', 'student'),
('DH52100999', '$2a$10$SxC8CumWJnOU3.4B0aopV.3QJn8s/2sYTZPxRc21Rk1XFT/XYyv3S', 'DH52100999', 'student'),
('DH52101584', '$2a$10$CdJ2oWCNMZ9MNgTumOJnMOXH1emrPTnQ6IVa3eFHwjBmbt4mdUTue', 'DH52101584', 'student'),
('DH52101650', '$2a$10$Uu7vKthIMFaTYckDc4QgoevHDGAssXCoPOSm/dTjPM2xGvPXNnWl6', 'DH52101650', 'student'),
('DH52101695', '$2a$10$iIYLLt4ajqpgFyoUc8OYF.A3G3akN0EITWJRA7PELjGixLLrWn.zu', 'DH52101695', 'student'),
('DH52101717', '$2a$10$/Mzh3534hV6w6d51w0P1Y.prVNEgKGbMI6.f3J04L6NPLukO1FGra', 'DH52101717', 'student'),
('DH52101914', '$2a$10$F5ge70.DfmI.ZXiuXxO8WOa4A9qaJrN7B/vwYF0draelD42tYlxdu', 'DH52101914', 'student'),
('DH52102001', '$2a$10$vmU9MRxwlTnJ0DJ9u4ckcuD3rLjv/sQCQdwhLQFDi0hXQY2XyoCoq', 'DH52102001', 'student'),
('DH52102487', '$2a$10$JLOXGnmqHTckNBJHzx1cWOjTucOXhW8LzrRYPE5rfD3yv5CS6HYvO', 'DH52102487', 'student'),
('DH52102720', '$2a$10$A6KdJuan0Y8mKzlOTF4OluWBqTyCNhzxh4g247wykX6tfgJK0cqCu', 'DH52102720', 'student'),
('DH52102882', '$2a$10$adoTu4TUuGTVyJt0A4muKe/x2aVCvHsdwZS6m2vdF9Ek/j8OMk8kq', 'DH52102882', 'student'),
('DH52102897', '$2a$10$OAxEvBb93fxrA3n.Pyzxe.EiJxoSGA11zTbsmeow9Y9IRRUXF5.dO', 'DH52102897', 'student'),
('DH52103039', '$2a$10$HJIkNE2rprKNKzCZGSgFb.TcI5lDcjag2zJHuywWFk4ROXFwFTIXK', 'DH52103039', 'student'),
('DH52103066', '$2a$10$1W1gxE6f89KkwUNL6p1j6.Ph87NVhfvohAVsQc41IXGxejO4PvgkC', 'DH52103066', 'student'),
('DH52103223', '$2a$10$01a.3vbpbzR3AwGEY8feBuly4P64z78/Tu0W72oPO5wNFVD5ZJP/y', 'DH52103223', 'student'),
('DH52103264', '$2a$10$vXPIdUhD0jqlaPGz4dccbeVJYlvLYRcFIk8rbIplzaPI1S5IIo7sm', 'DH52103264', 'student'),
('DH52103348', '$2a$10$u2dc2ZtB9hf.pL5Ri4a/F.FeVXoHnj/1MI8vyBtuqENKRztHf0lxW', 'DH52103348', 'student'),
('DH52103467', '$2a$10$5CeK9Na5nJylncUnFGuN5.EIiq/MCkjdURbvgw4pd0B24.t/gAOM2', 'DH52103467', 'student'),
('DH52103588', '$2a$10$QB6ijyVKlsWKimslPO9SzOSuhr9o.SXGSWfiW.YA7QLwViJaLTBVC', 'DH52103588', 'student'),
('DH52103784', '$2a$10$Rpt2Tz.n1UQyPhPSYM/S4eo5Mun6Q2YAChzLYYE7xEZXKDq1k90im', 'DH52103784', 'student'),
('DH52103871', '$2a$10$VAjOee1ybSRUS0p83C2.gOoUQgdPFFdzk04nrFitOeDrBsOnUEZzK', 'DH52103871', 'student'),
('DH52103938', '$2a$10$.oBp0vJVQnjqUIdUsnuWH.gNyWyEDXv53vuFRuMHK29VXnZgWVS2u', 'DH52103938', 'student'),
('DH52104015', '$2a$10$MnylrlDmbjxrpRT1ueW01eOciSkQFPWwkedpnNAjKWT236iPev4da', 'DH52104015', 'student'),
('DH52104508', '$2a$10$5EEjHL/AuanLQ3ofAsTIee4568.24ZrfuNLPVoOmoQGVTJwablCJe', 'DH52104508', 'student'),
('DH52104582', '$2a$10$eBltoV6yavn7pjXH6ljRZ.tl4THgvAkgSNE..6ekEySwYiUdWPIuC', 'DH52104582', 'student'),
('DH52104782', '$2a$10$Ivn1JPxketjUQJPHV/82e.yQHFb3GgwKPBwBUPc8UHI1WHrOFbQjS', 'DH52104782', 'student'),
('DH52104857', '$2a$10$2TvSfLs3bgNB4JQfwvX/3.dGxjPA3Cfhd703FVAwt601/2IoahW6O', 'DH52104857', 'student'),
('DH52104938', '$2a$10$GfkYAYDtUwivuN889jtjJuOjLptOpDcFslb.Vbcs4hO5/nkm60DVm', 'DH52104938', 'student'),
('DH52105057', '$2a$10$NotjaiJ200L4PyOtjza.XObraYDY0Baq/OT1610OcLbASm1E7UyiG', 'DH52105057', 'student'),
('DH52105154', '$2a$10$IQrZHRhPqBwzUYsK6SBZLu0kQWY70BbnpMtT0QT.Bt2xpKNGZgJZa', 'DH52105154', 'student'),
('DH52105156', '$2a$10$s8RLhg7.smGfZoUhSZ/CUepkS7lqVxFE3DZv2GzhqvS3YqSxLlVge', 'DH52105156', 'student'),
('DH52105157', '$2a$10$NuVwFYs3ZwD.QdydCn0nA.Rfe2Hy.b3WaHeq3ozfdbNUizPx4q0cq', 'DH52105157', 'student'),
('DH52105312', '$2a$10$LX5sQOlPA23J.UPMZC0UXertbM2wPhrzO5UV5BAqUXxo0VHTNBtfq', 'DH52105312', 'student'),
('DH52105342', '$2a$10$VRCeQXjrzBWmbqo4VyD2A.PsTP1ApeD1UQ.gJ9ocbH4EK1KopOZbW', 'DH52105342', 'student'),
('DH52105346', '$2a$10$3gfo6gvBOYD.Pvdo/nPJNOwyiiUgKon2/ip8M39JPIwfINoRVZLG6', 'DH52105346', 'student'),
('DH52105686', '$2a$10$oQR2QqTHW5EaE/s6YQto/OBg9YJg9zyWzGnSnqBetLJmHgOUkIkIO', 'DH52105686', 'student'),
('DH52105753', '$2a$10$LXNwZQylceSQAZx8JF6aj.fCIx8jiuuJlQRbv.O84SSB4t4/85SlK', 'DH52105753', 'student'),
('DH52105768', '$2a$10$orcLy9jngB7SWKD8AnnKQ.8bbYiHo3iTh6KOxb41zMFFoQ6Q/7pwi', 'DH52105768', 'student'),
('DH52106083', '$2a$10$wPYnB7NZwPCJiZdNfvfY9e4UOMHr4BdXqQeCZb4jnjzcpsPMX6u3e', 'DH52106083', 'student'),
('DH52106169', '$2a$10$Nypj6Z52CLDhEdz7p1TA9OeQukVo6kVJYBR6DvGSRhLVgIwQ4OIu6', 'DH52106169', 'student'),
('DH52106187', '$2a$10$bXSm9U4/MLG1WLpbbVh6JO5b/ny5D9Kdp5s4rGKUdCMhfIPn5w.LO', 'DH52106187', 'student'),
('DH52106328', '$2a$10$MaY/kmvMnPnrYYcF0ZGDYuNEFGSSgJH01VXnNlfyeh/82gm35Sh6C', 'DH52106328', 'student'),
('DH52106342', '$2a$10$gsGodz5obkNVXqv.CYtO5eBF8F0OH8YT.M6TYw34pV.u8gTRCBC86', 'DH52106342', 'student'),
('DH52106356', '$2a$10$3Vp2m75QwWjNgcSOzfsjKOu0Nu.Gz/0xqDfPiolgojp4IvtW6qLbO', 'DH52106356', 'student'),
('DH52106430', '$2a$10$O.bS5FZjOXecNa6CAtKI0OXGaC24yvWrEGex5YWVrLwo03HV3aMn2', 'DH52106430', 'student'),
('DH52106608', '$2a$10$0DOpCR7pvDj5QoPJt0xOaOfwE9o4kD8d4x3e2/kWoAqZefvAMKD9m', 'DH52106608', 'student'),
('DH52106667', '$2a$10$hSW0ZfeiTCr/ATZc8Sk1H.DjwxS0N8xihXQzBGuCETLCWFnLxC826', 'DH52106667', 'student'),
('DH52106696', '$2a$10$P5x9MIjxcNGadk8e46K1qe2MSr.3ZK/QZf91lKgcHOTUbq/w4pfY.', 'DH52106696', 'student'),
('DH52106804', '$2a$10$FB5U0Jqa7dXxpP3XBP1HqOUsBkFM4h5gRoGU9z2gkas4Zr8SWvySG', 'DH52106804', 'student'),
('DH52106873', '$2a$10$Evl8XJjypSJcqNgsVqiUB.xdPBI/Xr37BdKUArkYQIgHFHAlmonVG', 'DH52106873', 'student'),
('DH52106969', '$2a$10$gRphIPKTGHOlfatK5fnUMOtaWCzHSR.hWh6JAwpr6IKpvlcDBdzfG', 'DH52106969', 'student'),
('DH52106994', '$2a$10$/l.n2nLkI8sRwYhnkQrW6e9eiT/3ZOK3cJUxUHAADgOWR/hdM9xHG', 'DH52106994', 'student'),
('DH52107035', '$2a$10$tvgP/iJsfxalXrnBcpVqoeurfAfNO9TKv2sziQxnJf/ZZzMTayvh6', 'DH52107035', 'student'),
('DH52107203', '$2a$10$U3NxsNn2kZbtTx3kXWQiyONhzFVasEUhLwuID.R.CYpiMaxC63vYK', 'DH52107203', 'student'),
('DH52107369', '$2a$10$EObQSSeOHPbjQ7jy9IpVa.q7j.sYqsNO8debBcKp4.PrPyG.p5sia', 'DH52107369', 'student'),
('DH52107607', '$2a$10$JAJKBXp43fOn06OUY7lFhuBCD96lUwIEQ5rZAWEhd2CkiGvrprgBC', 'DH52107607', 'student'),
('DH52107697', '$2a$10$XmYo1VKz5kbfHecjU/jR6eDoubWArnP4hzUtyoyI3wA8pfdDvNzOu', 'DH52107697', 'student'),
('DH52107801', '$2a$10$2DaYpTh2oq9Dgcz6UsKiq.uiokLeXMtGb3LEq3h0R1h2i.ml4C5m6', 'DH52107801', 'student'),
('DH52107825', '$2a$10$.go9GZOk3UPhtJOyMvdpse7n0CgvWU2ijslXFfLeda6KONaPtgBmS', 'DH52107825', 'student'),
('DH52107880', '$2a$10$HHkHSEULxIMT5ktpMX72Leh1RxJo9xhk6aVm4tzY6OGhyWvX9hLHe', 'DH52107880', 'student'),
('DH52108033', '$2a$10$3MJ3g4aJX1JKeSc1nFQUZOGvi11P.CHY7wPeMMfdQbauH1aqni2Xa', 'DH52108033', 'student'),
('DH52108154', '$2a$10$1z8S8zPyD6aCzKEXkF7e/uZU6InNfvR4UWOE6yi0l8uh4uJ09X8Gm', 'DH52108154', 'student'),
('DH52108297', '$2a$10$TyEZwfzO7UL2ogFlXWoHreIBtPea8YrXXTjudNamO0Fhasqtg.nOa', 'DH52108297', 'student'),
('DH52108380', '$2a$10$zoKo.JFNq3dyQqx6RD.F/en5/7l.waNBq7BROkXnFxHwoWAwOadQq', 'DH52108380', 'student'),
('DH52108402', '$2a$10$98qkj3LlfUwyX0Xf.nZDkucwqgdUVYZZtYfZmt.4KB15mjaezoRV.', 'DH52108402', 'student'),
('DH52108453', '$2a$10$ednkIlMoBhrHv1f1CLxYXeBm29tysGhoZyTQMTI28mnMjdVPadchG', 'DH52108453', 'student'),
('DH52108517', '$2a$10$AFmtYqKFoXVjgFsuwFaK9uCRqHiz72p27j8Zo/sxPhAyWp8Wm7wJy', 'DH52108517', 'student'),
('DH52108592', '$2a$10$GCMHm.NJoOggn8TZnJlCeO4IDKRbh.OohK43obE29wBNbLgCPKRxq', 'DH52108592', 'student'),
('DH52108640', '$2a$10$0jE2KWf.PGNc7No2N5MqEOHmjLmb10s3o2czwQL8vv07b9Uhe8OFe', 'DH52108640', 'student'),
('DH52108641', '$2a$10$lxUpOaBpSwop2gJvl0Ci4eQ21uLd5GsMZIxisTaLo4ZaAcW9yl4pC', 'DH52108641', 'student'),
('DH52108711', '$2a$10$aWeZex6doOQ6Rlv3wQNTmu7Cc702ctOEqfusBKboVoHnFODRuBWDS', 'DH52108711', 'student'),
('DH52108834', '$2a$10$3NKJOTX1YLT4IGGsH75U5uRfAC7WwpH.CTQT7CFuHo6rtzkgC1VmO', 'DH52108834', 'student'),
('DH52108890', '$2a$10$B9BFcO4v3qjRQZ4Ax6npuOj60nHPdlkuFBp76XZt2RCQg2DkKUTN6', 'DH52108890', 'student'),
('DH52109046', '$2a$10$Mb1DciYyRN/qJ20jMLitC.x8m.BlNnwb9ImKWP7CsMzLqD80aDqfy', 'DH52109046', 'student'),
('DH52109270', '$2a$10$.vXmYPjZcMt0DBEoIui7yuzUWY8vHvh9WaVAdDyhtoFHXnw0NUiXO', 'DH52109270', 'student'),
('DH52110660', '$2a$10$WX5bp1mYR3I2ZS364Zi34.3k2R.YuMD0fvOwtEaqNjDOxxV2DbSiO', 'DH52110660', 'student'),
('DH52110688', '$2a$10$Vl8FrKPWiqOtOQ4mghn1K.tJo6MmEPYR9sidL7ImJCiMextcj.OIm', 'DH52110688', 'student'),
('DH52110694', '$2a$10$ESq/yDyRF0ijIhxS1aHWzeeRrcChQwfsZJqgOlr/eBX.F3zjVyOWm', 'DH52110694', 'student'),
('DH52110854', '$2a$10$M5IeDn/Wfp0gsxAdGi/rtOrDFCpZ4W/ddiIEmjwyseHNhCEaVT002', 'DH52110854', 'student'),
('DH52110937', '$2a$10$Wg18Vey7595zg3Kt4Kbh6ullBqTZ.tvrQfbsiDbXbMrZQOn5yY.3K', 'DH52110937', 'student'),
('DH52110982', '$2a$10$tfBtndCZ.afpqOw3Gni5w.VymOKRPRfjZ62CCvSS7vHTjnFEpMyZG', 'DH52110982', 'student'),
('DH52111033', '$2a$10$w3LgZ4Lnw8f3m6LyCbH1zOUld3tj22bELyqMl9Efd.DxVyrD6Y5ay', 'DH52111033', 'student'),
('DH52111111', '$2a$10$Dea3z3LZ768TvmcSzosd/egryKwW2N3x87n07pzW/Jv2DknfRkxQi', 'DH52111111', 'student'),
('DH52111162', '$2a$10$.jrtMgeNzUHjFDHJ0tn32uUdN2IKH3.gMsH9A4Ov/SsWWKlgD9Nt2', 'DH52111162', 'student'),
('DH52111167', '$2a$10$31ZqCwm1D5alk84sRS5cPO2XdQxPKF5TlVTJ4JrOSLOY9gl9kvgkS', 'DH52111167', 'student'),
('DH52111247', '$2a$10$/J5DaTz7r7K6a25QgohOFu9Aha4EYKs9sjXHtWyzQybShXBd72VRe', 'DH52111247', 'student'),
('DH52111288', '$2a$10$dMdCKaZitEWrfW83Iu3vue59r4ZKSOgKpjyjruTjA98tWZXIKqxR.', 'DH52111288', 'student'),
('DH52111481', '$2a$10$4AGD/oyPSWhkRLszPBcReODle6u2o4jegRM3/fbkRC3EgoBHEx4hS', 'DH52111481', 'student'),
('DH52111801', '$2a$10$99i6mZSRH0bV727qd0wcquY2b/VoWYMNt90MBtq7WeLbP1TZ05JqO', 'DH52111801', 'student'),
('DH52111824', '$2a$10$UR1bsN/JOFJGG5QfNPAeTOWQo/4MLJPBzxIR3R53DbJYfrozWWjRK', 'DH52111824', 'student'),
('DH52111881', '$2a$10$P7t6uMaxmaLsuxRGc//Tf.FtEhDQQ.S6V4MfJcIDPCoBpT0tOu4K2', 'DH52111881', 'student'),
('DH52111903', '$2a$10$XSTRDUGp9jjULyu6JieVgeOrHeP038ql6STRhHpALPxFf0RAyy4Oi', 'DH52111903', 'student'),
('DH52111919', '$2a$10$g7YfEBVdcEm7lI7MwF8.iuksH9TEZOyLYUdUX8rdxhjmqQONunO7e', 'DH52111919', 'student'),
('DH52111925', '$2a$10$G8Kx3hjXKgoRGyQjJyCMJ.lPvbMxfRrDEh62br87jtmGc.ccjiD3.', 'DH52111925', 'student'),
('DH52111940', '$2a$10$wDnPGW7zAmfx5UK/cmy9E.jOaGasPXDHl0MuxCFgYib6y5QLPQqIm', 'DH52111940', 'student'),
('DH52111960', '$2a$10$Jo2eyAgxegMcx3s3MJ2HG.0zJSnvCd71KjRCvwjqJuVtjRdNJgpae', 'DH52111960', 'student'),
('DH52111969', '$2a$10$E/dtwN/9TVWKaZHlcnd8w.1RpDY7O8zPaIhbRhEdi.iwsOWHXtHUm', 'DH52111969', 'student'),
('DH52111990', '$2a$10$cjABGhNgfdanJDSHzb8JpO8HTZqnteR1SIzmixOx.IMGS2hwd7Ig.', 'DH52111990', 'student'),
('DH52112869', '$2a$10$jSXYUTg.QVcbW6Ww1edFOODdgkmo3HFYQn/VpscrLk78SHSVZMi6y', 'DH52112869', 'student'),
('DH52112913', '$2a$10$ypBb7AkRj4xfnxdhlF08..fIpsrxsg9AjNWrVmmTRe9XtqiLAWp4C', 'DH52112913', 'student'),
('DH52113000', '$2a$10$vItPpyDpYYzAgB0ocRP11eFvbutJnvSlYfFpWKmET5SdEUaYjIeY6', 'DH52113000', 'student'),
('DH52113196', '$2a$10$gyK.obMKJX9y3fj.xWHr7OKsLs3zVYRJS.yAeuB/Jn1WvfMTFumFy', 'DH52113196', 'student'),
('gv001', '$2a$10$xVfD7zYF.Y9ZONmOOJni8eWruQS0jtl0zN1zOk9jwR0OVVw0F0U22', 'nguyenvanA', 'teacher'),
('gv002', '$2a$10$xVfD7zYF.Y9ZONmOOJni8eWruQS0jtl0zN1zOk9jwR0OVVw0F0U22', 'tranthiB', 'teacher'),
('sv001', '$2a$10$xVfD7zYF.Y9ZONmOOJni8eWruQS0jtl0zN1zOk9jwR0OVVw0F0U22', 'levanC', 'student'),
('sv002', '$2a$10$xVfD7zYF.Y9ZONmOOJni8eWruQS0jtl0zN1zOk9jwR0OVVw0F0U22', 'phamthiD', 'student'),
('sv003', '$2a$10$xVfD7zYF.Y9ZONmOOJni8eWruQS0jtl0zN1zOk9jwR0OVVw0F0U22', 'hoangvanE', 'student'),
('sv004', '$2a$10$xVfD7zYF.Y9ZONmOOJni8eWruQS0jtl0zN1zOk9jwR0OVVw0F0U22', 'nguyenthiF', 'student');

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
-- Constraints for table `nguoi_dung`
--
ALTER TABLE `nguoi_dung`
  ADD CONSTRAINT `FK4kfboc7g5ory9apx9nntvvslw` FOREIGN KEY (`ma_lop`) REFERENCES `lop_sinh_vien` (`ma_lop`),
  ADD CONSTRAINT `FKbrlqj8q133ly8l99xc05wf6sk` FOREIGN KEY (`ma_tai_khoan`) REFERENCES `tai_khoan` (`ma_tai_khoan`);

--
-- Constraints for table `nguoi_tham_gia`
--
ALTER TABLE `nguoi_tham_gia`
  ADD CONSTRAINT `FKs7m9d0kal9qtv80wssa9lp6gj` FOREIGN KEY (`buoihoc_id`) REFERENCES `buoi_hoc` (`ma_buoi_hoc`),
  ADD CONSTRAINT `FKtojp2r3lsbk1ssso6oca99og9` FOREIGN KEY (`nguoidung_id`) REFERENCES `nguoi_dung` (`ma_nguoi_dung`);

--
-- Constraints for table `password_reset_token`
--
ALTER TABLE `password_reset_token`
  ADD CONSTRAINT `FK7bqwkenm7l6a7dwux3ro513su` FOREIGN KEY (`ma_nguoi_dung`) REFERENCES `nguoi_dung` (`ma_nguoi_dung`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
