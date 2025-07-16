-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 16, 2025 lúc 07:58 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `tttn_final`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `buoi_hoc`
--

CREATE TABLE `buoi_hoc` (
  `ma_buoi_hoc` int(11) NOT NULL,
  `tiet_bat_dau` int(11) NOT NULL,
  `tiet_ket_thuc` int(11) NOT NULL,
  `gv_id` varchar(255) DEFAULT NULL,
  `ma_mon_hoc` varchar(255) NOT NULL,
  `ma_phong` varchar(255) NOT NULL,
  `ma_tham_gia` varchar(255) NOT NULL,
  `thu` varchar(255) NOT NULL,
  `type` varchar(20) DEFAULT 'regular' COMMENT 'regular|project',
  `ngay_bat_dau` date DEFAULT NULL,
  `ngay_ket_thuc` date DEFAULT NULL,
  `so_buoi` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `buoi_hoc`
--

INSERT INTO `buoi_hoc` (`ma_buoi_hoc`, `tiet_bat_dau`, `tiet_ket_thuc`, `gv_id`, `ma_mon_hoc`, `ma_phong`, `ma_tham_gia`, `thu`, `type`, `ngay_bat_dau`, `ngay_ket_thuc`, `so_buoi`) VALUES
(5, 1, 4, 'GV01', 'KT', 'P01', 'c1c1ba9dd7', 'Thu 4', 'regular', NULL, NULL, 1),
(6, 1, 4, 'GV01', 'KT', 'P01', '330ea2e3e5', 'Thu 3', 'regular', NULL, NULL, 1),
(7, 1, 4, 'GV01', 'KT', 'P01', 'e19627b70d', 'Thu 2', 'regular', '2025-05-27', '2025-06-27', 5),
(9, 5, 8, 'GV01', 'KT', 'P01', 'a6d1fcba2a', 'Thu 5', 'regular', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `diem_danh`
--

CREATE TABLE `diem_danh` (
  `ma_buoi_hoc` int(11) NOT NULL,
  `ma_diem_danh` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `expired_at` datetime(6) DEFAULT NULL,
  `thoi_gian_diem_danh` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `ma_nguoi_dung` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `diem_danh`
--

INSERT INTO `diem_danh` (`ma_buoi_hoc`, `ma_diem_danh`, `created_at`, `expired_at`, `thoi_gian_diem_danh`, `code`, `ma_nguoi_dung`) VALUES
(5, 2, '2025-06-07 01:16:33.423853', '2025-06-07 01:19:33.423853', NULL, '0cc93e', 'GV01'),
(5, 3, '2025-06-17 15:59:30.486236', '2025-06-17 16:02:30.486236', NULL, 'f497eb', 'GV01'),
(9, 4, '2025-06-17 16:00:58.714108', '2025-06-17 16:03:58.714108', NULL, '117375', 'GV01'),
(9, 5, '2025-06-17 16:01:48.259093', '2025-06-17 16:04:48.259093', NULL, '15108f', 'GV01'),
(6, 6, '2025-06-17 16:02:43.020857', '2025-06-17 16:05:43.020857', NULL, 'fd4c9c', 'GV01'),
(5, 7, '2025-06-17 16:04:16.107198', '2025-06-17 16:07:16.107198', NULL, '5a7394', 'GV01'),
(5, 8, '2025-06-17 16:04:56.428099', '2025-06-17 16:07:56.428099', NULL, 'd3922b', 'GV01'),
(5, 9, '2025-06-17 16:05:34.003588', '2025-06-17 16:08:34.003588', NULL, 'a06844', 'GV01'),
(5, 10, '2025-07-15 13:49:10.000000', '2025-07-15 13:52:10.000000', NULL, '7bdf0a', 'GV01'),
(5, 11, '2025-07-15 13:51:21.000000', '2025-07-15 13:54:21.000000', NULL, 'c5c647', 'GV01'),
(5, 12, '2025-07-16 10:57:37.000000', '2025-07-16 11:02:37.000000', NULL, 'd6a8ec', 'GV01'),
(5, 13, '2025-07-16 11:19:24.000000', '2025-07-16 11:24:24.000000', NULL, 'f7fa6c', 'GV01'),
(5, 14, '2025-07-16 11:28:41.000000', '2025-07-16 11:33:41.000000', NULL, 'f86076', 'GV01'),
(5, 15, '2025-07-16 11:32:39.000000', '2025-07-16 11:37:39.000000', NULL, '4cf285', 'GV01'),
(5, 16, '2025-07-16 11:46:55.000000', '2025-07-16 11:51:55.000000', NULL, '2c1a17', 'GV01'),
(5, 17, '2025-07-16 11:55:42.000000', '2025-07-16 12:00:42.000000', NULL, '4c8ed2', 'GV01'),
(5, 18, '2025-07-16 12:06:57.000000', '2025-07-16 12:11:57.000000', NULL, '4c51b6', 'GV01'),
(5, 19, '2025-07-16 12:09:57.000000', '2025-07-16 12:14:57.000000', NULL, '5e1cfc', 'GV01'),
(5, 20, '2025-07-16 12:10:29.000000', '2025-07-16 12:15:29.000000', NULL, 'f7d54c', 'GV01'),
(5, 21, '2025-07-16 12:16:15.000000', '2025-07-16 12:21:15.000000', NULL, '673a6e', 'GV01'),
(5, 22, '2025-07-16 12:17:10.000000', '2025-07-16 12:22:10.000000', NULL, '7f9500', 'GV01'),
(5, 23, '2025-07-16 13:00:13.000000', '2025-07-16 13:05:13.000000', NULL, '08ad7b', 'GV01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `diem_danh_sinh_vien`
--

CREATE TABLE `diem_danh_sinh_vien` (
  `diemdanh_id` int(11) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `time` datetime(6) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `diem_danh_sinh_vien`
--

INSERT INTO `diem_danh_sinh_vien` (`diemdanh_id`, `id`, `time`, `status`, `user_id`) VALUES
(4, 1, '2025-06-17 16:01:10.857498', 'Đúng giờ', 'DH123456'),
(11, 2, '2025-07-15 13:51:56.000000', 'Đúng giờ', 'DH00'),
(11, 3, '2025-07-15 13:52:42.000000', 'Đúng giờ', 'DH123456'),
(11, 4, '2025-07-15 13:58:05.000000', 'Trễ', 'DH52107697'),
(12, 5, '2025-07-16 10:58:36.000000', 'Đúng giờ', 'DH52108154'),
(12, 6, '2025-07-16 11:00:35.000000', 'Đúng giờ', 'DH00'),
(12, 7, '2025-07-16 11:01:58.000000', 'Trễ', 'DH123456'),
(12, 8, '2025-07-16 11:01:13.000000', 'Đúng giờ', 'DH52107697'),
(13, 9, '2025-07-16 11:22:04.000000', 'Đúng giờ', 'DH52108890'),
(13, 10, '2025-07-16 11:22:04.000000', 'Vắng', 'DH00'),
(13, 11, '2025-07-16 11:22:04.000000', 'Vắng', 'DH123456'),
(13, 12, '2025-07-16 11:22:04.000000', 'Vắng', 'DH52107697'),
(13, 13, '2025-07-16 11:22:04.000000', 'Vắng', 'DH52108154'),
(13, 14, '2025-07-16 11:23:32.000000', 'Trễ', 'DH52105312'),
(19, 15, '2025-07-16 12:09:57.000000', 'Vắng', 'DH00'),
(19, 16, '2025-07-16 12:09:57.000000', 'Vắng', 'DH123456'),
(19, 17, '2025-07-16 12:09:57.000000', 'Vắng', 'DH52107697'),
(19, 18, '2025-07-16 12:09:57.000000', 'Vắng', 'DH52108154'),
(19, 19, '2025-07-16 12:09:57.000000', 'Vắng', 'DH52105312'),
(19, 20, '2025-07-16 12:09:57.000000', 'Vắng', 'DH52108890'),
(20, 21, '2025-07-16 12:12:01.000000', 'Đúng giờ', 'DH00'),
(20, 22, '2025-07-16 12:12:50.000000', 'Đúng giờ', 'DH123456'),
(20, 23, '2025-07-16 12:13:13.000000', 'Đúng giờ', 'DH52107697'),
(20, 24, '2025-07-16 12:14:48.000000', 'Trễ', 'DH52108154'),
(20, 25, '2025-07-16 12:14:13.000000', 'Đúng giờ', 'DH52105312'),
(20, 26, '2025-07-16 12:10:29.000000', 'Vắng', 'DH52108890'),
(21, 27, '2025-07-16 12:16:15.000000', 'Vắng', 'DH00'),
(21, 28, '2025-07-16 12:16:15.000000', 'Vắng', 'DH123456'),
(21, 29, '2025-07-16 12:16:15.000000', 'Vắng', 'DH52107697'),
(21, 30, '2025-07-16 12:16:15.000000', 'Vắng', 'DH52108154'),
(21, 31, '2025-07-16 12:16:15.000000', 'Vắng', 'DH52105312'),
(21, 32, '2025-07-16 12:16:15.000000', 'Vắng', 'DH52108890'),
(22, 33, '2025-07-16 12:17:10.000000', 'Vắng', 'DH00'),
(22, 34, '2025-07-16 12:17:10.000000', 'Vắng', 'DH123456'),
(22, 35, '2025-07-16 12:17:10.000000', 'Vắng', 'DH52105312'),
(22, 36, '2025-07-16 12:17:10.000000', 'Vắng', 'DH52107697'),
(22, 37, '2025-07-16 12:17:10.000000', 'Vắng', 'DH52108154'),
(22, 38, '2025-07-16 12:17:10.000000', 'Vắng', 'DH52108890'),
(22, 39, '2025-07-16 12:19:15.000000', 'Đúng giờ', 'DH52110937'),
(23, 40, '2025-07-16 13:01:31.000000', 'Đúng giờ', 'DH00'),
(23, 41, '2025-07-16 13:02:41.000000', 'Đúng giờ', 'DH123456'),
(23, 42, '2025-07-16 13:00:13.000000', 'Vắng', 'DH52107697'),
(23, 43, '2025-07-16 13:00:13.000000', 'Vắng', 'DH52108154'),
(23, 44, '2025-07-16 13:00:13.000000', 'Vắng', 'DH52105312'),
(23, 45, '2025-07-16 13:00:13.000000', 'Vắng', 'DH52108890'),
(23, 46, '2025-07-16 13:00:13.000000', 'Vắng', 'DH52110937');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lop_do_an`
--

CREATE TABLE `lop_do_an` (
  `ma_lop_do_an` int(11) NOT NULL,
  `ghi_chu` text DEFAULT NULL,
  `gv_id` varchar(255) DEFAULT NULL,
  `ma_tham_gia` varchar(255) NOT NULL,
  `ten_lop_do_an` varchar(255) NOT NULL,
  `thoi_gian_bat_dau` date DEFAULT NULL,
  `thoi_gian_ket_thuc` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `lop_do_an`
--

INSERT INTO `lop_do_an` (`ma_lop_do_an`, `ghi_chu`, `gv_id`, `ma_tham_gia`, `ten_lop_do_an`, `thoi_gian_bat_dau`, `thoi_gian_ket_thuc`) VALUES
(1, 'Test từ Postman', 'GV001', '550b59c8e1', 'Lớp Đồ Án CNTT Test', '2024-09-01', '2024-12-15'),
(2, 'D21', 'GV01', '3565fe166a', 'Đồ án chuyên ngành', '2026-01-01', '2026-05-05'),
(3, 'D22-code c#', 'GV01', '14669c574b', 'Đồ Án Tin Học', '2025-03-02', '2025-05-04'),
(4, 'D23', 'GV01', '855ee043d8', 'Đồ an androi', '2025-01-01', '2026-01-01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lop_sinh_vien`
--

CREATE TABLE `lop_sinh_vien` (
  `ma_lop` varchar(255) NOT NULL,
  `ten_lop` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `lop_sinh_vien`
--

INSERT INTO `lop_sinh_vien` (`ma_lop`, `ten_lop`) VALUES
('D20_TH09', 'Tin hoc 09'),
('D21_TH05', 'D21_TH05'),
('D21_TH06', 'Tin hoc 06'),
('D21_TH07', 'Tin hoc 07'),
('GV', 'Giang Vien');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mon_hoc`
--

CREATE TABLE `mon_hoc` (
  `ma_mon_hoc` varchar(255) NOT NULL,
  `ten_mon_hoc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `mon_hoc`
--

INSERT INTO `mon_hoc` (`ma_mon_hoc`, `ten_mon_hoc`) VALUES
('DA', 'Đồ Án Tin Học'),
('DACN', 'Đồ Án Chuyên Ngành'),
('KT', 'Ky Thuat lap trinh'),
('KTLT', 'KY THUAT LAP TRINH'),
('LTW', 'Lap trinh mang'),
('NMLT', 'Nhap mon lap trinh 1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguoi_dung`
--

CREATE TABLE `nguoi_dung` (
  `email` varchar(255) DEFAULT NULL,
  `ma_lop` varchar(255) DEFAULT NULL,
  `ma_nguoi_dung` varchar(255) NOT NULL,
  `ma_tai_khoan` varchar(255) DEFAULT NULL,
  `sdt` varchar(255) DEFAULT NULL,
  `ten_nguoi_dung` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nguoi_dung`
--

INSERT INTO `nguoi_dung` (`email`, `ma_lop`, `ma_nguoi_dung`, `ma_tai_khoan`, `sdt`, `ten_nguoi_dung`) VALUES
('hao12398700@gmail.com', NULL, 'admin', '151f9bc2-f058-47f1-99b8-1f062ff52fed', '0945652311', 'admin'),
('hai@stu.edu.vn', 'D20_TH09', 'DH00', 'df45007f-f3ec-437f-9abe-78f592387b71', '0127736484', 'Hai'),
('thua@gmail.com', 'D20_TH09', 'DH123456', '2f7f648b-54da-4320-9094-74f980d0db14', '0374958373', 'Van Dinh Thuat'),
('DH52100015@student.stu.edu.vn', 'D21_TH06', 'DH52100015', 'fe51be66-9d8b-4a2b-9a75-b04a3174a39b', '09395419572', 'Hoàng Văn Đức'),
('DH52100018@student.stu.edu.vn', 'D21_TH06', 'DH52100018', 'e40b013b-42f1-405f-9143-3e9fabf5462f', '09755859950', 'Nguyễn Nguyên Thi'),
('DH52100077@student.stu.edu.vn', 'D21_TH06', 'DH52100077', '309c4831-e158-4125-8383-dedc1f495040', '09482075157', 'Chu Gia Quyền'),
('DH52100215@student.stu.edu.vn', 'D21_TH06', 'DH52100215', 'ab9317b7-a09c-498c-9f9d-9cf9ae02aac2', '09942959872', 'Hà Bảo Nguyên'),
('DH52100311@student.stu.edu.vn', 'D21_TH06', 'DH52100311', '643f7629-870d-43c7-9fb1-c4c65b3983d5', '09350606158', 'Đặng Ngọc Hiếu'),
('DH52100332@student.stu.edu.vn', 'D21_TH06', 'DH52100332', '9d155114-b601-4b22-9363-a912b4f1c25d', '09574289903', 'Trần Hoàng Phúc'),
('DH52100456@student.stu.edu.vn', 'D21_TH06', 'DH52100456', 'f67512a9-899a-43dd-b913-00a8a927a75f', '09519056516', 'Huỳnh Hoàng Hải'),
('DH52100514@student.stu.edu.vn', 'D21_TH06', 'DH52100514', '15ecacd3-6eff-47d0-8baf-39d7f96daf99', '09127280008', 'Trần Quốc Nam'),
('DH52100604@student.stu.edu.vn', 'D21_TH06', 'DH52100604', 'dae7eb31-50ed-45ea-bae2-31f2f3ce18bd', '09587436293', 'Phạm Quốc Thái'),
('DH52100999@student.stu.edu.vn', 'D21_TH06', 'DH52100999', 'b2831ab1-66e1-4586-b638-8bfc871811e4', '09991300043', 'Phạm Mạnh Tuấn'),
('DH52101584@student.stu.edu.vn', 'D21_TH06', 'DH52101584', '38fd91df-5b41-4da6-babc-452a1943ea88', '09784373244', 'Nguyễn Thị Anh Thư'),
('DH52101650@student.stu.edu.vn', 'D21_TH06', 'DH52101650', '7afe4398-e3ed-415f-bcf8-5c2045856c12', '09576243485', 'Châu Quang Nhật'),
('DH52101695@student.stu.edu.vn', 'D21_TH06', 'DH52101695', 'd496e0cb-687f-40bd-b58f-113856bcf6ee', '09925322541', 'Nguyễn Thị Khả Nhi'),
('DH52101717@student.stu.edu.vn', 'D21_TH06', 'DH52101717', 'b337e896-d9de-42c3-b0a3-210015464311', '09296582140', 'Lê Minh Hiếu'),
('DH52101914@student.stu.edu.vn', 'D21_TH06', 'DH52101914', 'b9ec94ec-9ef6-4619-be5f-f1c8e386d27a', '09172487801', 'Huỳnh Tấn Phát'),
('DH52102001@student.stu.edu.vn', 'D21_TH06', 'DH52102001', 'c2638ad5-3fac-4dbf-84b8-bba4f1fd0603', '09946107548', 'Phạm Anh Tuấn'),
('DH52102487@student.stu.edu.vn', 'D21_TH06', 'DH52102487', '1802b6cf-b6d3-4c2a-9c16-f3e511f8a88f', '09464825758', 'Nguyễn Thị Tử Vi'),
('DH52102720@student.stu.edu.vn', 'D21_TH06', 'DH52102720', '54f5dd5b-fbe3-4490-9b02-34b6a915cec4', '09247794831', 'Trần Nguyễn Bảo Uyên'),
('DH52102882@student.stu.edu.vn', 'D21_TH06', 'DH52102882', '14182e3e-2a17-42f7-ba83-0194675f3088', '09644117657', 'Bùi Thanh Hậu'),
('DH52102897@student.stu.edu.vn', 'D21_TH06', 'DH52102897', '764bbcb8-e86c-4d99-9f92-0efe0466dade', '09174699830', 'Phạm Đặng Thái Hưng'),
('DH52103039@student.stu.edu.vn', 'D21_TH06', 'DH52103039', '59057db1-bc7f-4ff4-b809-eb74acddefe3', '09902293307', 'Phạm Xuân Phú'),
('DH52103066@student.stu.edu.vn', 'D21_TH06', 'DH52103066', '45433850-d0e2-4cad-b0f1-23c0950f03ab', '09599541857', 'Đỗ Nguyễn Anh Khôi'),
('DH52103223@student.stu.edu.vn', 'D21_TH06', 'DH52103223', 'b6f5ee65-a79e-4354-9bcd-b33edbe054a0', '09941306437', 'Nguyễn Công Danh'),
('DH52103264@student.stu.edu.vn', 'D21_TH06', 'DH52103264', 'df9d858d-73c9-4401-b6cf-daa4296bda32', '09673458752', 'Ngô Tấn Hảo'),
('DH52103348@student.stu.edu.vn', 'D21_TH06', 'DH52103348', '1964f4d8-cacd-46f8-b48c-2cddedd16656', '09798504489', 'Nguyễn Phan Hoàng Đạt'),
('DH52103467@student.stu.edu.vn', 'D21_TH06', 'DH52103467', '99382e1e-8e41-4e06-993a-740e5c3784f9', '09303214512', 'Nguyễn Thành Minh'),
('DH52103588@student.stu.edu.vn', 'D21_TH06', 'DH52103588', '45861bf1-b912-488d-9b27-10514afdaed9', '09214050067', 'Nguyễn Đoàn Minh Hùng'),
('DH52103784@student.stu.edu.vn', 'D21_TH06', 'DH52103784', 'd680790a-0863-48d6-aedc-3fa7ab1603c4', '09387933060', 'Nguyễn Hữu Luân'),
('DH52103871@student.stu.edu.vn', 'D21_TH06', 'DH52103871', '2ffe959f-6822-4ca6-a05b-6217b1e4efa3', '09684630815', 'Phạm Minh Trị'),
('DH52103938@student.stu.edu.vn', 'D21_TH06', 'DH52103938', 'e6b4d2bf-a4b9-4290-8115-4257a760060c', '09356259596', 'Bùi Văn Anh Kiệt'),
('DH52104015@student.stu.edu.vn', 'D21_TH06', 'DH52104015', 'ec9a4e08-5f2f-457a-b9a3-5b4fe8c2415a', '09402373376', 'Nguyễn Huy Hoàng'),
('DH52104508@student.stu.edu.vn', 'D21_TH06', 'DH52104508', '902af8de-5341-4dd6-a097-7e85719bb49c', '09428277486', 'Trần Sô Ny'),
('DH52104582@student.stu.edu.vn', 'D21_TH06', 'DH52104582', '37fc2d55-d2e0-40ae-9a73-f48f3935eb56', '09613371376', 'Ngô Duy Tùng'),
('DH52104782@student.stu.edu.vn', 'D21_TH06', 'DH52104782', '135eb208-6607-497d-b52d-b5d0c9b5679f', '09537079873', 'Phan Thành Văn'),
('DH52104857@student.stu.edu.vn', 'D21_TH06', 'DH52104857', 'a3fbb060-a28b-468f-97bf-76af1ff3934d', '09270048398', 'Lê Thị Đa Lin'),
('DH52104938@student.stu.edu.vn', 'D21_TH06', 'DH52104938', '9a159323-e739-453b-9e7e-e79e2e6033cf', '09814754356', 'Nguyễn Vũ Luân'),
('DH52105057@student.stu.edu.vn', 'D21_TH06', 'DH52105057', '26fa0cb0-2df5-4f40-98a3-4977885b8c47', '09599966298', 'Lê Thị Mỹ Trinh'),
('DH52105154@student.stu.edu.vn', 'D21_TH06', 'DH52105154', 'cb39ddd5-0b1f-49a8-8056-f95ef90c38df', '09642409577', 'Nguyễn Tuấn Sang'),
('DH52105156@student.stu.edu.vn', 'D21_TH06', 'DH52105156', 'aa77c3e6-e276-47e5-ac72-45fa2d45d7c0', '09909467091', 'Lê Thanh Trung'),
('DH52105157@student.stu.edu.vn', 'D21_TH06', 'DH52105157', 'ed575d1c-bf17-47dc-b77f-62ae4c979692', '09312885737', 'Nguyễn Phú'),
('DH52105312@student.stu.edu.vn', 'D21_TH06', 'DH52105312', '06703145-ab9d-4bf3-9ffa-de33199eeef2', '09781800294', 'Trần Hà Xuân Thịnh'),
('DH52105342@student.stu.edu.vn', 'D21_TH06', 'DH52105342', 'dd801818-3937-4309-926b-5284e6fe018a', '09186260214', 'Trần Nguyễn Minh Quân'),
('DH52105346@student.stu.edu.vn', 'D21_TH06', 'DH52105346', 'b5792a3e-29ec-43f5-a80d-58674699c20c', '09605684796', 'Lê Nguyễn Thành Vũ'),
('DH52105686@student.stu.edu.vn', 'D21_TH06', 'DH52105686', '1a063d09-9730-403c-9709-ed68a7976499', '09409886896', 'Lâm Hoàng Đức'),
('DH52105753@student.stu.edu.vn', 'D21_TH06', 'DH52105753', '24be026a-f63b-48b0-9e4e-c9d10c8703c2', '09624667707', 'Nguyễn Hồ Minh Hiển'),
('DH52105768@student.stu.edu.vn', 'D21_TH06', 'DH52105768', 'f30cf643-01f1-43df-811a-20661b2bdaa8', '09279766048', 'Vương Văn Thắng'),
('DH52106083@student.stu.edu.vn', 'D21_TH06', 'DH52106083', 'e17da2ad-63cf-45de-ae9c-b1903a4a0c85', '09463949486', 'Lê Trung Phú'),
('DH52106169@student.stu.edu.vn', 'D21_TH06', 'DH52106169', 'd5c75073-b898-4173-9199-6afc023e5264', '09295487233', 'Phan Trường Giang'),
('DH52106187@student.stu.edu.vn', 'D21_TH06', 'DH52106187', '31fdbf67-7661-4dd4-9a61-c9baa3ff448e', '09938575396', 'Tạ Tương Hiếu'),
('DH52106328@student.stu.edu.vn', 'D21_TH06', 'DH52106328', 'f5d60068-301b-454e-9b0d-0fb1e0aa1f38', '09443993632', 'Lê Trung Hiếu'),
('DH52106342@student.stu.edu.vn', 'D21_TH06', 'DH52106342', 'bb82de8b-5692-4886-9ab3-cdc0ecc867ca', '09782110062', 'Trần Thị Ngọc Tuyền'),
('DH52106356@student.stu.edu.vn', 'D21_TH06', 'DH52106356', 'e442aeed-5a06-4ae5-9410-12d07f021f53', '09397149641', 'Phạm Nhựt Hào'),
('DH52106430@student.stu.edu.vn', 'D21_TH06', 'DH52106430', '4146944b-2fd5-4f12-89df-aefebf36c0cf', '09253084251', 'Nguyễn Trọng Phúc'),
('DH52106608@student.stu.edu.vn', 'D21_TH06', 'DH52106608', 'ca4a06d5-7843-47cf-9478-f1c746bfdef4', '09356160058', 'Đỗ Quang Vinh'),
('DH52106667@student.stu.edu.vn', 'D21_TH06', 'DH52106667', 'ca3dd25a-cb94-4421-a2a5-853cb1b1d038', '09370773560', 'Nguyễn Đình Thông'),
('DH52106696@student.stu.edu.vn', 'D21_TH06', 'DH52106696', 'fab89f3d-60c3-4c9e-939a-00232ba41527', '09604754652', 'Trần Đức Huy'),
('DH52106804@student.stu.edu.vn', 'D21_TH06', 'DH52106804', '5558e83f-6172-487c-9da7-3e938e9e50d2', '09295593328', 'Nguyễn Trường Giang'),
('DH52106873@student.stu.edu.vn', 'D21_TH06', 'DH52106873', 'fb5c761d-5d57-4c16-9643-72482eae74f5', '09370067395', 'Nguyễn Hoàng Quan'),
('DH52106969@student.stu.edu.vn', 'D21_TH06', 'DH52106969', '3e5058af-0b50-49f7-a23e-f53d523dd72f', '09925658741', 'Đỗ Thành Luân'),
('DH52106994@student.stu.edu.vn', 'D21_TH06', 'DH52106994', 'ae531327-40ce-4f58-93c7-37ae83d40898', '09555590572', 'Nguyễn Phạm Đăng Khoa'),
('DH52107035@student.stu.edu.vn', 'D21_TH06', 'DH52107035', '39a94a6a-1f60-41c7-b476-d3fdee8e2292', '09845102743', 'Lưu Tấn Sang'),
('DH52107203@student.stu.edu.vn', 'D21_TH06', 'DH52107203', '571f9d6d-f752-4391-a037-c576b6be6f32', '09972407312', 'Nguyễn Ngọc Thiện'),
('DH52107369@student.stu.edu.vn', 'D21_TH06', 'DH52107369', '6d6b46dc-1f85-4c2a-be8a-a015a1fb0f9d', '09809623485', 'Trần Thế Vũ'),
('DH52107607@student.stu.edu.vn', 'D21_TH06', 'DH52107607', '4ffdb51d-d537-4ea5-8ad4-2803fe29ed66', '09640951819', 'Lê Hoàng Công'),
('DH52107697@student.stu.edu.vn', 'D21_TH06', 'DH52107697', '005f8072-f2cb-4c39-92db-03d162e1e09d', '09694889534', 'Đinh Nguyễn Tuấn'),
('DH52107801@student.stu.edu.vn', 'D21_TH06', 'DH52107801', 'bda31aa7-187b-424b-af4d-e2aa76c5d376', '09998925486', 'Nguyễn Thanh Vân'),
('DH52107825@student.stu.edu.vn', 'D21_TH06', 'DH52107825', 'f7451b5f-0748-48b8-997c-b821b10ae97c', '09818993535', 'Nguyễn Huỳnh Đức'),
('DH52107880@student.stu.edu.vn', 'D21_TH06', 'DH52107880', '87b7e68d-136c-45de-86cf-a73994db2d05', '09593042740', 'Trần Hồ Minh Đức'),
('DH52108033@student.stu.edu.vn', 'D21_TH06', 'DH52108033', '831d4ca8-6d21-488b-abdc-b19ed70debd1', '09170545948', 'Võ Ngọc Tấn Tài'),
('DH52108154@student.stu.edu.vn', 'D21_TH06', 'DH52108154', '04c97dad-80f2-4d33-8254-14b9b6ca906c', '09677710628', 'Trần Tam Quý'),
('DH52108297@student.stu.edu.vn', 'D21_TH06', 'DH52108297', 'afc64419-43b2-4975-b235-7c7a94d9c6e2', '09398667413', 'Nguyễn Ngọc Yến Linh'),
('DH52108380@student.stu.edu.vn', 'D21_TH06', 'DH52108380', 'ef3277be-af35-4d98-8077-66bce6ede92e', '09497386536', 'Đoàn Thị Yến Bình'),
('DH52108402@student.stu.edu.vn', 'D21_TH06', 'DH52108402', '61893c56-bc4c-4354-baec-6f95ed3a34fa', '09418931491', 'Nguyễn Trung Hiếu'),
('DH52108453@student.stu.edu.vn', 'D21_TH06', 'DH52108453', 'c209aac5-6568-4ae7-9be3-776005a68ecc', '09536803708', 'Đinh Phạm Phú Khang'),
('DH52108517@student.stu.edu.vn', 'D21_TH06', 'DH52108517', '60fb4764-f3c9-4e5e-abf5-e575694347d5', '09228403300', 'Hoàng Hữu Lê Chinh'),
('truong@gmail.com', 'D21_TH06', 'DH52108548', 'f7709531-52c6-4a98-997b-575cf0b34e85', '0866783068', 'Nguyen Thanh Truong'),
('dh52108549@student.stu.edu.vn', 'D21_TH05', 'DH52108549', 'baa8ec02-a32a-42c8-b90e-10986224be08', '0226138575', 'DANG THANH HAI'),
('DH52108592@student.stu.edu.vn', 'D21_TH06', 'DH52108592', 'ef629cbd-a65b-41b3-8828-a565368a70a4', '09179985963', 'Huỳnh Khánh Linh'),
('dh52108640@student.stu.edu.vn', 'D21_TH06', 'DH52108640', '4dd95587-1a6e-4e92-83e0-b51e8e39e24e', '09819077540', 'Nguyễn Thanh Trường'),
('dh52108610@student.stu.edu.vn', NULL, 'DH52108641', 'd93906a9-4625-4a5e-8bbb-a0126dfb88a3', '9819077543', 'Hồ Đình Khả Trường'),
('DH52108711@student.stu.edu.vn', 'D21_TH06', 'DH52108711', 'e7694a7d-ae7c-4a9e-b4de-f42d400eb044', '09529831774', 'Đặng Gia Bảo'),
('DH52108834@student.stu.edu.vn', 'D21_TH06', 'DH52108834', '5bc3c551-3b67-4f30-97e7-93ec31d7b773', '09261352209', 'Huỳnh Tấn Tài'),
('DH52108890@student.stu.edu.vn', 'D21_TH06', 'DH52108890', '0a1833d9-eca6-43d4-91bf-abfef176d397', '09797338121', 'Phan Trường Huy'),
('DH52109046@student.stu.edu.vn', 'D21_TH06', 'DH52109046', '856fd3ad-c466-482a-a37a-66618f026a27', '09150102165', 'Trần Quang Tuấn'),
('DH52109270@student.stu.edu.vn', 'D21_TH06', 'DH52109270', '6a6a7e8b-aa2b-4184-86b7-7efa19fd5043', '09320756467', 'Phùng Kiến Phước'),
('DH52110660@student.stu.edu.vn', 'D21_TH06', 'DH52110660', '8dd8240b-7526-4fa0-88db-c23ffe839688', '09732566413', 'Nguyễn Chí Cường'),
('DH52110688@student.stu.edu.vn', 'D21_TH06', 'DH52110688', 'bb22d808-ffc2-487e-a531-ca72944f2d6e', '09403876582', 'Triệu Quốc Dũng'),
('DH52110694@student.stu.edu.vn', 'D21_TH06', 'DH52110694', 'e2d56f0b-1870-4592-a157-e78cf6f65f70', '09257490473', 'Đinh Ngọc Trần Duy'),
('DH52110854@student.stu.edu.vn', 'D21_TH06', 'DH52110854', '57335f6b-3146-4106-9933-80df2ad7ea42', '09197003988', 'Huỳnh Tích Hải'),
('DH52110937@student.stu.edu.vn', 'D21_TH06', 'DH52110937', '0c86d4f7-65b6-4274-85b6-beea362162d3', '09124756976', 'Nguyễn Thiện Hòa'),
('DH52110982@student.stu.edu.vn', 'D21_TH06', 'DH52110982', 'd93ad429-c928-4533-9c26-595a4060f3a1', '09469016463', 'Lê Mạnh Hùng'),
('DH52111033@student.stu.edu.vn', 'D21_TH06', 'DH52111033', '9cfa9577-a6e3-4db1-8d52-d0dc6e0f5fb9', '09178444915', 'Nguyễn Thành Huy'),
('DH52111111@student.stu.edu.vn', 'D21_TH06', 'DH52111111', '6925bdee-e243-462f-a077-072a067b53e6', '09778105937', 'Bùi Ngọc Duy Khánh'),
('DH52111162@student.stu.edu.vn', 'D21_TH06', 'DH52111162', 'f7ec9053-3d9d-428d-a9a9-e127fea6e8c3', '09136999722', 'Lê Trung Kiên'),
('DH52111167@student.stu.edu.vn', 'D21_TH06', 'DH52111167', 'aec25251-d8f2-4028-81a4-318d71ec8662', '09700714814', 'Nguyễn Trung Kiên'),
('DH52111247@student.stu.edu.vn', 'D21_TH06', 'DH52111247', '21547c04-dc5b-473f-b06e-9152bd29a104', '09188393562', 'Đinh Xuân Lộc'),
('DH52111288@student.stu.edu.vn', 'D21_TH06', 'DH52111288', '5e099fc6-4623-44dc-9ee6-da723d1c095a', '09401915468', 'Đỗ Danh Mạnh'),
('DH52111481@student.stu.edu.vn', 'D21_TH06', 'DH52111481', 'af615fa7-d7c7-40b7-8aba-51eee0dbed6f', '09975739062', 'Trương Quang Phát'),
('DH52111801@student.stu.edu.vn', 'D21_TH06', 'DH52111801', '446c6f2f-0c11-41c2-86bc-198e5766d874', '09499113065', 'Trần Đức Thiều'),
('DH52111824@student.stu.edu.vn', 'D21_TH06', 'DH52111824', '530d899d-cb68-4588-96cb-7be7fd14dc84', '09611097428', 'Đặng Trương Hoàng Thọ'),
('DH52111881@student.stu.edu.vn', 'D21_TH06', 'DH52111881', '2fe29745-d70c-4a3e-87e8-15c69ca28723', '09148385446', 'Trần Thủy Tiên'),
('DH52111903@student.stu.edu.vn', 'D21_TH06', 'DH52111903', '2664f10e-6ab4-47d6-a482-42ac33945f99', '09325406291', 'Nguyễn Kiều Minh Toàn'),
('DH52111919@student.stu.edu.vn', 'D21_TH06', 'DH52111919', '8f457244-d2ee-4ba1-8c87-bdbd009ea176', '09348953501', 'Trần Bảo Nam Trân'),
('DH52111925@student.stu.edu.vn', 'D21_TH06', 'DH52111925', 'd8edf3d3-feeb-4d67-9a3f-111ffdeab05a', '09912205328', 'Nguyễn Công Trí'),
('DH52111940@student.stu.edu.vn', 'D21_TH06', 'DH52111940', 'dc5fa4d0-0be8-4897-ad8c-94865f7674fd', '09695420616', 'Nguyễn Đăng Triển'),
('DH52111960@student.stu.edu.vn', 'D21_TH06', 'DH52111960', 'd05f0e84-2446-4c77-bc52-bc747f5bf287', '09159022432', 'Hà Tiến Trung'),
('DH52111969@student.stu.edu.vn', 'D21_TH06', 'DH52111969', 'cd313bf5-35d6-4eba-9227-2d00b2daba02', '09683663552', 'Trần Minh Trung'),
('DH52111990@student.stu.edu.vn', 'D21_TH06', 'DH52111990', '4ac0dae2-17ce-4d08-89df-2f240d49e8ca', '09376360835', 'Phan Thanh Tú'),
('DH52112869@student.stu.edu.vn', 'D21_TH06', 'DH52112869', '8a72094d-bddd-48c1-920f-385136785e02', '09425511588', 'Nguyễn Thị Tường Vy'),
('DH52112913@student.stu.edu.vn', 'D21_TH06', 'DH52112913', 'c6d726ab-951f-40a5-a549-a357cf76da8a', '09749033187', 'Phan Huỳnh Hoàng Lâm'),
('DH52113000@student.stu.edu.vn', 'D21_TH06', 'DH52113000', '44192938-c425-42ba-8bf0-d2b1110dc95b', '09698057907', 'Nguyễn Đinh Đồng'),
('DH52113196@student.stu.edu.vn', 'D21_TH06', 'DH52113196', 'cced0385-89dd-40dd-bb40-33f13cb7407b', '09524536035', 'Trần Đỗ Quốc Kiệt'),
('hai123@gmail.com', 'GV', 'GV01', '8aacbf13-69cd-474d-81d1-517a93be1d88', '0346847355', 'Dang Thanh Hai '),
('thuatvan1012@gmail.com', NULL, 'GV02', 'f424da08-24e7-45f3-821f-0de14de64181', '0896361875', 'Hồ Đình Khả'),
('nguyen.lan@example.com', 'D21_TH06', 'ND001', '1234', '0123456789', 'Nguyen Thi Lan'),
('danghai220503@gmail.com', 'D21_TH06', 'ND002', 'TK001', '0123456789', 'Nguyen Thi Lan');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguoi_tham_gia`
--

CREATE TABLE `nguoi_tham_gia` (
  `buoihoc_id` int(11) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `nguoidung_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nguoi_tham_gia`
--

INSERT INTO `nguoi_tham_gia` (`buoihoc_id`, `id`, `nguoidung_id`) VALUES
(5, 3, 'DH00'),
(6, 7, 'DH00'),
(5, 8, 'DH123456'),
(5, 9, 'DH52107697'),
(5, 10, 'DH52108154'),
(5, 11, 'DH52105312'),
(5, 12, 'DH52108890'),
(5, 13, 'DH52110937'),
(5, 14, 'DH52104782');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhom_do_an`
--

CREATE TABLE `nhom_do_an` (
  `ma_nhom` int(11) NOT NULL,
  `ghi_chu` text DEFAULT NULL,
  `ten_nhom` varchar(255) NOT NULL,
  `ma_lop_do_an` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `nhom_do_an`
--

INSERT INTO `nhom_do_an` (`ma_nhom`, `ghi_chu`, `ten_nhom`, `ma_lop_do_an`) VALUES
(1, 'Nhóm làm đồ án về hệ thống quản lý điểm danh', 'Nhóm Phát triển Web', 1),
(2, 'Nhóm làm đồ án về hệ thống quản lý điểm danh', 'Nhóm Phát triển Web', 1),
(4, 'Xây dựng website bán hàng', 'Nhóm 1', 2),
(5, 'làm website quản lí kí túc xá', 'Nhóm 2', 2),
(6, 'web', 'nhóm 1', 4),
(7, 'di động', 'Nhóm 2', 4),
(8, 'xây dụng ưngs  dụng khách sạn', 'nhóm 3', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nop_bai`
--

CREATE TABLE `nop_bai` (
  `ma_nop_bai` int(11) NOT NULL,
  `ma_tuan` int(11) NOT NULL,
  `ma_nguoi_dung` varchar(255) NOT NULL,
  `ten_file` varchar(255) NOT NULL,
  `duong_dan_file` varchar(255) NOT NULL,
  `kich_thuoc` bigint(20) DEFAULT NULL,
  `loai_file` varchar(100) DEFAULT NULL,
  `ngay_nop` datetime NOT NULL DEFAULT current_timestamp(),
  `ghi_chu_gv` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phong`
--

CREATE TABLE `phong` (
  `ma_phong` varchar(255) NOT NULL,
  `ten_phong` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `phong`
--

INSERT INTO `phong` (`ma_phong`, `ten_phong`) VALUES
('P01', 'Phong 1'),
('P02', 'Phong 2'),
('P03', 'Phong 3');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tai_khoan`
--

CREATE TABLE `tai_khoan` (
  `ma_tai_khoan` varchar(255) NOT NULL,
  `mat_khau` varchar(255) NOT NULL,
  `ten_tai_khoan` varchar(255) NOT NULL,
  `role` enum('admin','student','teacher') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tai_khoan`
--

INSERT INTO `tai_khoan` (`ma_tai_khoan`, `mat_khau`, `ten_tai_khoan`, `role`) VALUES
('005f8072-f2cb-4c39-92db-03d162e1e09d', '$2a$10$ceQMvdDtlcCY0c3H38uiF.6UtVGnS.DgPBWJlatyWk1TbazCueeZW', 'DH52107697', 'student'),
('04c97dad-80f2-4d33-8254-14b9b6ca906c', '$2a$10$CNS9nnlsNpNi4xVXjxw1HeO1z/g9RMiY5NUz6yddLhCHB2yxbNKh6', 'DH52108154', 'student'),
('06703145-ab9d-4bf3-9ffa-de33199eeef2', '$2a$10$IZZrSCp8bMzfz/YfPEgG8ek5wdL5koUc0sQvVMpJ//hu1ymMSWNKO', 'DH52105312', 'student'),
('0a1833d9-eca6-43d4-91bf-abfef176d397', '$2a$10$t.43CAtkqi9x91201KXc5.w1itPej/Xf.9x9gTq45Qn3RTG10QB6m', 'DH52108890', 'student'),
('0c86d4f7-65b6-4274-85b6-beea362162d3', '$2a$10$hWrplyLjlkL6vD7wsi6BlunLH8epBiWXGvr9CCKAidILjyjaWhrky', 'DH52110937', 'student'),
('1234', '$2a$10$X.lhuj27aTwEUo9kNiokxexwIEjoVzaUkKD.RROLuSHcqDbuy6IHq', 'nguyenvana', 'admin'),
('135eb208-6607-497d-b52d-b5d0c9b5679f', '$2a$10$et23qcVy6hZdwBPzodleru.CIR/iWOfQVxNDIQXOiYII3vPUhEd1y', 'DH52104782', 'student'),
('14182e3e-2a17-42f7-ba83-0194675f3088', '$2a$10$Fn7UdoMFHLMgyswujA8IiOCDi.QoneMe5OZaPEnIPV34EX6kr1KEy', 'DH52102882', 'student'),
('151f9bc2-f058-47f1-99b8-1f062ff52fed', '$2a$10$nWuNuupCjubBd2VIRxtQ3./pu8XxSo2b26aQGXMVJaogLPTGcxlUu', 'admin', 'admin'),
('15ecacd3-6eff-47d0-8baf-39d7f96daf99', '$2a$10$f4Bse.p/FZN8dm5s7Tl1l.rK2YW5UOjnJ/IzuSUFIogC4YAQUM4eS', 'DH52100514', 'student'),
('1802b6cf-b6d3-4c2a-9c16-f3e511f8a88f', '$2a$10$5E/6sXS9oLa.XtsSHBkdhedaoFtvGJfb32aNhjBVjg/yTvhh57NMW', 'DH52102487', 'student'),
('1964f4d8-cacd-46f8-b48c-2cddedd16656', '$2a$10$GRwaKNPS48IppOBUupa8CeBR3RiXR4JZdsQ.zIe9WmpLqys/VI/Fm', 'DH52103348', 'student'),
('1a063d09-9730-403c-9709-ed68a7976499', '$2a$10$Twj6dxxf9uQgVIWS0i3SZeTT7s5CeU7n.AB3jyzjZ3fhW4tlQLbzu', 'DH52105686', 'student'),
('21547c04-dc5b-473f-b06e-9152bd29a104', '$2a$10$q/sALqzF4QKaojYCkV/aN.eud3Q3.mU1la0NBcgO.wSV1CHoiBvW6', 'DH52111247', 'student'),
('24be026a-f63b-48b0-9e4e-c9d10c8703c2', '$2a$10$WDiLa/9Uu25a3dpPCCSy2OS8ekDuwzczJE9bKqyAdkt5Lhyoh/nU.', 'DH52105753', 'student'),
('2664f10e-6ab4-47d6-a482-42ac33945f99', '$2a$10$9peXT0caMHFkacybU4Gb1uj9ev.bu9Y2QGKLA17lVQUyAnp8GKHcO', 'DH52111903', 'student'),
('26fa0cb0-2df5-4f40-98a3-4977885b8c47', '$2a$10$gdRwXkUvig8sJH.7G/ToNecijR5hAeuyxWStkhIslbVY1LRyKezi2', 'DH52105057', 'student'),
('2f7f648b-54da-4320-9094-74f980d0db14', '$2a$10$.8sFwByLbOB6mL4C.RJqkOTjsIwevd4R1n2saCS8oluYmBZ5ibhJm', 'DH123456', 'student'),
('2fe29745-d70c-4a3e-87e8-15c69ca28723', '$2a$10$od37xBiHnjJ9yeYB92ZiNOfoOW38dCFIXTfV74fhbnGYOHizP5tB.', 'DH52111881', 'student'),
('2ffe959f-6822-4ca6-a05b-6217b1e4efa3', '$2a$10$s15ChrtiTVUjJI4pfH/qj.0gau87Ezcih6iACQHDG3Q9Jy1CCxTJO', 'DH52103871', 'student'),
('309c4831-e158-4125-8383-dedc1f495040', '$2a$10$TyDnqRo13KddH9EbSW3KP.YCPNMwXdp8XdtGumCCwQM18zJbtf/BG', 'DH52100077', 'student'),
('31fdbf67-7661-4dd4-9a61-c9baa3ff448e', '$2a$10$P/K5OnwpSMsvd3ZXPhfMruqfiLdUmUGRdX4vAyideX1/cQpHZBcUa', 'DH52106187', 'student'),
('37fc2d55-d2e0-40ae-9a73-f48f3935eb56', '$2a$10$itpE2YwIGouJaztfgarFQ.QL99879ENoOym92DOgTLpUu9lhU2Pau', 'DH52104582', 'student'),
('38fd91df-5b41-4da6-babc-452a1943ea88', '$2a$10$lkQJAJ63U5gw7DSaSvlpl.45Mge6RuBCBKpVAt59tP3AHl96tiSkK', 'DH52101584', 'student'),
('39a94a6a-1f60-41c7-b476-d3fdee8e2292', '$2a$10$LPY3ZSzb1cudIRtUJzNFpupOhEViZMtiyBtr7uZ8KZofbk5Tw51Su', 'DH52107035', 'student'),
('3e5058af-0b50-49f7-a23e-f53d523dd72f', '$2a$10$kLITzw0MsLMlpWRqrA/K/OLyU3ACXgtQlYq4WY5bGLSGqct.81fO.', 'DH52106969', 'student'),
('4146944b-2fd5-4f12-89df-aefebf36c0cf', '$2a$10$5W2Frh/xdaOKaEXjwqb8YOVTKl9TNnKQvkcbstXGHf5AXk9MPFp7W', 'DH52106430', 'student'),
('44192938-c425-42ba-8bf0-d2b1110dc95b', '$2a$10$CDZSx.Avm7OOLgyb2w5qYOYTBbyj3nhyDCRJ61evqXt5e5xVc/9RW', 'DH52113000', 'student'),
('446c6f2f-0c11-41c2-86bc-198e5766d874', '$2a$10$jq6UHCo/HjyPB8ThmaUvd.4tE.8.pCWXnvgbx/6LgCVbIapW.S6ge', 'DH52111801', 'student'),
('45433850-d0e2-4cad-b0f1-23c0950f03ab', '$2a$10$3qWlTHL5H7wy4Px6v55xwOi79d1TkgJxMwLPM.XQ6kHzL3.dbS4Ee', 'DH52103066', 'student'),
('45861bf1-b912-488d-9b27-10514afdaed9', '$2a$10$8xCcVYJBb8sPCWJFHK7D7e8T4kEonv8sNvxpIUHKhTdlcU0s7jy8e', 'DH52103588', 'student'),
('4ac0dae2-17ce-4d08-89df-2f240d49e8ca', '$2a$10$/RmyF6Vc0UWBxX8ZRypWa.yigRoFbfoV3drnGBn4ThuUkzJCMTb2a', 'DH52111990', 'student'),
('4dd95587-1a6e-4e92-83e0-b51e8e39e24e', '$2a$10$ql2tvfmgQDMJHUCeiGFGa..hBT2iSQ7Eb6aP664i6DeSCIIILk91S', 'DH52108640', 'student'),
('4ffdb51d-d537-4ea5-8ad4-2803fe29ed66', '$2a$10$NELyoJoqcaDkpJZOhzKZXew.Mi1.wtvxq5yDfph7aBd9UAR/ylFmi', 'DH52107607', 'student'),
('530d899d-cb68-4588-96cb-7be7fd14dc84', '$2a$10$DmkJ9lT1V8ci1shiLISxXu0dRK8zbP5ZnZqYlzZdE3ka8icQlUbPC', 'DH52111824', 'student'),
('54f5dd5b-fbe3-4490-9b02-34b6a915cec4', '$2a$10$owKS2GdI4pK4XsVtOjnPhOkKwpzTCqLMfrYv.RpqH7emNbPnATUlu', 'DH52102720', 'student'),
('5558e83f-6172-487c-9da7-3e938e9e50d2', '$2a$10$wXfkcRdi9ORFMznA/shHxubvqV17oTezLW2vLwh7WzGKXlqHVIpv.', 'DH52106804', 'student'),
('571f9d6d-f752-4391-a037-c576b6be6f32', '$2a$10$ZguktewIG.7r0bfe5jdSEeJ3dM24Lp87uyDR7jdr8NlXmalqjjTnS', 'DH52107203', 'student'),
('57335f6b-3146-4106-9933-80df2ad7ea42', '$2a$10$abBv50YbHyNqUSRjx072zOUjXPlFlRPXrWpReyoCR8U336YfglXKC', 'DH52110854', 'student'),
('59057db1-bc7f-4ff4-b809-eb74acddefe3', '$2a$10$n27e5zBrfOu9v8vikHGBZe98eGzCNyx8z7L2./2VMNS2flhgygSFW', 'DH52103039', 'student'),
('5bc3c551-3b67-4f30-97e7-93ec31d7b773', '$2a$10$oAlOvhv9rcBNV6Dm14ja7OtqqeQtD6ctOyVBrocMAXxZ9dHU8Evvu', 'DH52108834', 'student'),
('5e099fc6-4623-44dc-9ee6-da723d1c095a', '$2a$10$HQaqXOfu6KGNEIBINyPYxO0uL7eIKWqAR.uZF/ElKXtecaaxQnBwS', 'DH52111288', 'student'),
('60fb4764-f3c9-4e5e-abf5-e575694347d5', '$2a$10$a3VDeiEnakK5CzNWOUOm2.Kcb.K1x8KFTuZHmBgeP2.blhID6/NFa', 'DH52108517', 'student'),
('61893c56-bc4c-4354-baec-6f95ed3a34fa', '$2a$10$P3Bw/URJhHZ92pt.Xo03QuqtwJIoNC.reW1iTUEXjBSRTSvAlSwbC', 'DH52108402', 'student'),
('643f7629-870d-43c7-9fb1-c4c65b3983d5', '$2a$10$7XOZQFhnKDZs/2x5Limxh.K0lvGW2k.7WZxG/Pqja9csHONabAC7G', 'DH52100311', 'student'),
('6925bdee-e243-462f-a077-072a067b53e6', '$2a$10$Roxk2sfiZ.islJbdLi6deOnF63qIuY.7HbA4AWdvRmTdQST13E7Im', 'DH52111111', 'student'),
('6a6a7e8b-aa2b-4184-86b7-7efa19fd5043', '$2a$10$q9JZg89v4tS6z8qxGMb1/OPyUIKGtmmgYXnkoI.V5TrdhxtsKnwxO', 'DH52109270', 'student'),
('6d6b46dc-1f85-4c2a-be8a-a015a1fb0f9d', '$2a$10$5N2xOcEfp6Eq9RvTLqFezuzM8oaw4rQdA0EWwLbH8soseSFY6I2RC', 'DH52107369', 'student'),
('764bbcb8-e86c-4d99-9f92-0efe0466dade', '$2a$10$WXzE0fjUjXP.aRhsUBOGxuWDnhdB9zSGg.lZvGfy8Y19NjSgiDa7u', 'DH52102897', 'student'),
('7afe4398-e3ed-415f-bcf8-5c2045856c12', '$2a$10$z7VDxoHp99JIU0M/APn.teM648ySGWIFs.wcwSLmJPFE1mYYLh3Ym', 'DH52101650', 'student'),
('831d4ca8-6d21-488b-abdc-b19ed70debd1', '$2a$10$1UuwSqtKkwa7Tu/KgphnxOEhcB441sqGYKtPv0cFhWMtwQE2nvtIi', 'DH52108033', 'student'),
('856fd3ad-c466-482a-a37a-66618f026a27', '$2a$10$sJ7WHnAsi0QPL5bxrp0GV.MZy0K0Y/uBn3YLSVldnk0GjJBhMD8wO', 'DH52109046', 'student'),
('87b7e68d-136c-45de-86cf-a73994db2d05', '$2a$10$xL6n5DjZ2wjQZ2obcWnVKu9JBH1QYj3YMpY9VHHfP5Zy.OolaMTC.', 'DH52107880', 'student'),
('8a72094d-bddd-48c1-920f-385136785e02', '$2a$10$pv/sdEddCoacrHekMpyIwOVW1KXm7pBFBwJauWZvLvtPcKqzDdpSS', 'DH52112869', 'student'),
('8aacbf13-69cd-474d-81d1-517a93be1d88', '$2a$10$dSpK3YmGumEx5rf1Z2CIbuw/9z9AcL87COPjGbWiLSku4jx24qOP.', 'GV01', 'teacher'),
('8dd8240b-7526-4fa0-88db-c23ffe839688', '$2a$10$6.Mt98VEOqN23nALkzUWMOuwDQZmJAbqaBFcg5xtPwSzuYazt.bZK', 'DH52110660', 'student'),
('8f457244-d2ee-4ba1-8c87-bdbd009ea176', '$2a$10$RT1mMahJ5xIgZWifrEtYqO3dNLhU/SgBiIscbTyMh9RbM90GfCrIK', 'DH52111919', 'student'),
('902af8de-5341-4dd6-a097-7e85719bb49c', '$2a$10$0TUDFKlgi7GrZksQ/IsqxO16XmsLNF37kX98s8JfulNUdVWEBWzX6', 'DH52104508', 'student'),
('99382e1e-8e41-4e06-993a-740e5c3784f9', '$2a$10$Qs33xoE/OQiP3c4z1blGL.bx5kUVEK0U/hcB5HpO5UgUirjE83tYS', 'DH52103467', 'student'),
('9a159323-e739-453b-9e7e-e79e2e6033cf', '$2a$10$mjOo.l/.8xVWv97FwLWhF.Dw6flb4IUalC8jJzfjzRiYcNepkKl3a', 'DH52104938', 'student'),
('9cfa9577-a6e3-4db1-8d52-d0dc6e0f5fb9', '$2a$10$Lu9uaUn8QvRunHrbu6mF7em4HOz5yWZS0uyr1HQaSFl0VR2k4YogO', 'DH52111033', 'student'),
('9d155114-b601-4b22-9363-a912b4f1c25d', '$2a$10$487Tvj3queCISR8YjdiKROJE5iH0OkSoLdn1GygWN0Jaz2Vd9kZPi', 'DH52100332', 'student'),
('a3fbb060-a28b-468f-97bf-76af1ff3934d', '$2a$10$f154NB7eRR2ekijVp79v6emkFrm8FcWgDRNglKNaiTgDGf4ovLSX6', 'DH52104857', 'student'),
('aa77c3e6-e276-47e5-ac72-45fa2d45d7c0', '$2a$10$wAyJVCMpGRtaksji4.SCR.yEPgRezHtJpahMdZXxOyhGXKl9IMCLm', 'DH52105156', 'student'),
('ab9317b7-a09c-498c-9f9d-9cf9ae02aac2', '$2a$10$eMitB8Ozt3jAgN3TYpy1m.y.0wLVBEzLbGFeeFQxLTJshOAVBSg5S', 'DH52100215', 'student'),
('ae531327-40ce-4f58-93c7-37ae83d40898', '$2a$10$MU8RWXI/.j.alrGUwfGQ6.bYaPBrjLFSPk6dIwUYeJ90bXhj91N4W', 'DH52106994', 'student'),
('aec25251-d8f2-4028-81a4-318d71ec8662', '$2a$10$xJc3KpzIh3qKBadXdjC3rOv9c16pcUTn6c/o/h0uVuz7jvHXeYAkK', 'DH52111167', 'student'),
('af615fa7-d7c7-40b7-8aba-51eee0dbed6f', '$2a$10$vNlI4375Cul5BaG8XmHu4emgMVXoR8zr62ZgEaZydVryOJibhUynq', 'DH52111481', 'student'),
('afc64419-43b2-4975-b235-7c7a94d9c6e2', '$2a$10$PQBq8DJF/CNEMyeSp/jhFeNGA5DrUcsGlDT1DLogmzh9KgsY8wFaW', 'DH52108297', 'student'),
('b2831ab1-66e1-4586-b638-8bfc871811e4', '$2a$10$Q9CebRZ6cvgILIP/iW1lpes3sJrf8qKDgPrb1IL.hSUvSBPeNMDDe', 'DH52100999', 'student'),
('b337e896-d9de-42c3-b0a3-210015464311', '$2a$10$dHtmYctI21xKijalWhy6.uEkhFTR.2RlS26HjXLH/R.ErCMayVnVq', 'DH52101717', 'student'),
('b5792a3e-29ec-43f5-a80d-58674699c20c', '$2a$10$GuAU5gcEzJWrVbodd25G1uGTe4eAz4X0WkWnD2lyJxhRWdOyEIPmu', 'DH52105346', 'student'),
('b6f5ee65-a79e-4354-9bcd-b33edbe054a0', '$2a$10$k85Gr1DbXi9tSDkI3ml63O5U/pDEKZ1RsBlNbMaW5fQadkErDhKDq', 'DH52103223', 'student'),
('b9ec94ec-9ef6-4619-be5f-f1c8e386d27a', '$2a$10$eZoNNiZkJFSb61quM5bjyOOUcfOj8RW7Mc6UGeOsWMC8NG/5Ez/ja', 'DH52101914', 'student'),
('baa8ec02-a32a-42c8-b90e-10986224be08', '$2a$10$x3QvHvT1Z3vnai9LXZOMQecwWHu8C5r.KAFmy.LMf2R5AuvE8TcZ.', 'DH52108549', 'student'),
('bb22d808-ffc2-487e-a531-ca72944f2d6e', '$2a$10$ODwb0zmKYDEu3w4iMISz2e8NMACiHVa8v1YfqqXjMRAIO4WDqK/8W', 'DH52110688', 'student'),
('bb82de8b-5692-4886-9ab3-cdc0ecc867ca', '$2a$10$PaVO6YAlSuTVNNKL21ya1u0pJbzjk9wZAAvhoFsIY0bwsiY7lFMoC', 'DH52106342', 'student'),
('bda31aa7-187b-424b-af4d-e2aa76c5d376', '$2a$10$q/8u9ESQtqFTk/szQe3BCeOn9pBUI7ZTmCJKrD7.jcI3KllXJ64Ay', 'DH52107801', 'student'),
('c209aac5-6568-4ae7-9be3-776005a68ecc', '$2a$10$slzkEyXjcfcSrkya1HXyY.WmfRColsmHx8tL2wdIoAoJkBNmjb58O', 'DH52108453', 'student'),
('c2638ad5-3fac-4dbf-84b8-bba4f1fd0603', '$2a$10$ELbMGdThA5ZA.oN6s2NHW.IWgpXsIHFSOe4Vb1UDB143oAPb8T.NC', 'DH52102001', 'student'),
('c6d726ab-951f-40a5-a549-a357cf76da8a', '$2a$10$NAyMA7sCoFpQbRTqSerkBuMJ3y/a4IiVWaLXujQdT0AmvyUqJ8lEu', 'DH52112913', 'student'),
('ca3dd25a-cb94-4421-a2a5-853cb1b1d038', '$2a$10$t6phRThVgp1T0q8I9iRk/.YOPyaw18DB3yE/3EFy6Fu626BrKwng2', 'DH52106667', 'student'),
('ca4a06d5-7843-47cf-9478-f1c746bfdef4', '$2a$10$AjU52UoT1rwco.GNsQ2qyuApJZ5ueHQuUVE04EGkntjH1zHGuBrYW', 'DH52106608', 'student'),
('cb39ddd5-0b1f-49a8-8056-f95ef90c38df', '$2a$10$ty.tXRxKjewJbqCwbU7V3uODhZvSrUstBhiTeQsZrDcjJXZ8fvrTS', 'DH52105154', 'student'),
('cced0385-89dd-40dd-bb40-33f13cb7407b', '$2a$10$1ORbu4uq5qwPqQI7pEHX9uZedNvLpnmHxay5AwP1C9XI/2E7RjXQi', 'DH52113196', 'student'),
('cd313bf5-35d6-4eba-9227-2d00b2daba02', '$2a$10$CYMeCxpULdnCErO3bIB45u6eZnOJTYT43H03vWoUJnJKasRhu/BgW', 'DH52111969', 'student'),
('d05f0e84-2446-4c77-bc52-bc747f5bf287', '$2a$10$IJJcYOZy3ruxbLqtbKWKnu1h0oOvMqqz8vteldCQPQ9ZzXFDIbd0S', 'DH52111960', 'student'),
('d496e0cb-687f-40bd-b58f-113856bcf6ee', '$2a$10$Y5Ui/I.diU22s/MT3qCAL.GHGpne6E0UNfz0LzkUyWSNXN/zDnLwu', 'DH52101695', 'student'),
('d5c75073-b898-4173-9199-6afc023e5264', '$2a$10$SqD.Hz9J4oohSHUqfJ1ZL.fSEkKcMfVjycLqlU7LLUWxRHf4GxWui', 'DH52106169', 'student'),
('d680790a-0863-48d6-aedc-3fa7ab1603c4', '$2a$10$edikmIVQKPExDtnfDCmO5uYsXb2zRSy3aQ.q77ArIVB5c.o9oQ0Uu', 'DH52103784', 'student'),
('d8edf3d3-feeb-4d67-9a3f-111ffdeab05a', '$2a$10$DOXaUq4CktJg1USDXOmw1eP6AJNS0mLUmy34A5OqfuOH05Hej3jba', 'DH52111925', 'student'),
('d93906a9-4625-4a5e-8bbb-a0126dfb88a3', '$2a$10$AB7nTbm2ht.jvBwq6cnfZ.V0giWWj5N81p4nDD0gLF0Va/Yj6nBG.', 'DH52108641', 'student'),
('d93ad429-c928-4533-9c26-595a4060f3a1', '$2a$10$pfvZkXvGVTHSUGwKFkovf.Nyr3uAzZK7WKwWKXnnQgx3zVVTgP6SO', 'DH52110982', 'student'),
('dae7eb31-50ed-45ea-bae2-31f2f3ce18bd', '$2a$10$VX0dDNB1uopDEewlCdsOSuuZkNAQ5GdheTrnilVby86LUXDF091T6', 'DH52100604', 'student'),
('dc5fa4d0-0be8-4897-ad8c-94865f7674fd', '$2a$10$76nuVBR.gsqMl1L9vt1pOeM6gYhJ2.0r5b8L1rMVVINol8upeKl46', 'DH52111940', 'student'),
('dd801818-3937-4309-926b-5284e6fe018a', '$2a$10$G2PnQCS/IeIsEMmqsJL8yOnu2Oom7mvD/Rn4y8EBasbMWCMtRQ87K', 'DH52105342', 'student'),
('df45007f-f3ec-437f-9abe-78f592387b71', '$2a$10$x4LIXMDUMsQ1mMBSehUFvuJ2Q9BfXefCnGG3..Z3zbR2MurXS5swK', 'DH00', 'student'),
('df9d858d-73c9-4401-b6cf-daa4296bda32', '$2a$10$ycfxVSzkELCUctnI0Mj04.7KxQrziaNQWcwsODBM8NRQ18fZdxdSO', 'DH52103264', 'student'),
('e17da2ad-63cf-45de-ae9c-b1903a4a0c85', '$2a$10$yc9VIYMWwoy6R5inO6vVCO1iHLGirnTpO4G3qDOwsDGgptowUf3ym', 'DH52106083', 'student'),
('e2d56f0b-1870-4592-a157-e78cf6f65f70', '$2a$10$OH1Pt8AN/sTxyBWQWJ.X/OEyjTSdLkzRPmWTbG4ixWhSI7FJnFeSa', 'DH52110694', 'student'),
('e40b013b-42f1-405f-9143-3e9fabf5462f', '$2a$10$9h7Lxd.fhazH4hivckwzeeCCPIjf3xO8Oz8XZiLVPUYFLI6Hmymd6', 'DH52100018', 'student'),
('e442aeed-5a06-4ae5-9410-12d07f021f53', '$2a$10$uxmuJghv0jQbhdpAwVZQz.jf20QhpRu1y80AjhISXHf0y3zsvqbhq', 'DH52106356', 'student'),
('e6b4d2bf-a4b9-4290-8115-4257a760060c', '$2a$10$MelyNPNgwI2KJVwiZivQvuu6NxtcdYDds9SCD8SewabSTXkHc7eqa', 'DH52103938', 'student'),
('e7694a7d-ae7c-4a9e-b4de-f42d400eb044', '$2a$10$tIacCgz4cvj1xe6B2kmkeO6WiD7XGqIMlmTgYyvBr0leJUqy/DRva', 'DH52108711', 'student'),
('ec9a4e08-5f2f-457a-b9a3-5b4fe8c2415a', '$2a$10$YEcRagwtA2Anlc67BrPm/O72X.LUPXk8esf4DjgH5RVtS0SLn4QrO', 'DH52104015', 'student'),
('ed575d1c-bf17-47dc-b77f-62ae4c979692', '$2a$10$a04AlQQGiTIUKQpQJof8SO5CDzTawctBlkZUx3ixhamvAU/V9HtHC', 'DH52105157', 'student'),
('ef3277be-af35-4d98-8077-66bce6ede92e', '$2a$10$cM6eQyqEEdi9kk/RrmDyNOPBF43KzcWYqnIw1/bLc9/zpBsIxwc4G', 'DH52108380', 'student'),
('ef629cbd-a65b-41b3-8828-a565368a70a4', '$2a$10$Sskuy04NRusL./nIbXuaauwVhEEwaTIi/IvIfYn1xXKjLTla2lUNW', 'DH52108592', 'student'),
('f30cf643-01f1-43df-811a-20661b2bdaa8', '$2a$10$sWLQsfmxLI8pEBiE3/1xFe5yP2lY8xzlgQDayPpVDmGBINhb19EQi', 'DH52105768', 'student'),
('f424da08-24e7-45f3-821f-0de14de64181', '$2a$10$g/90WgtKjgH/oHtGII7joOhJG4DceOIVjBRaJhZsirI9M2T5csvAa', 'GV02', 'teacher'),
('f5d60068-301b-454e-9b0d-0fb1e0aa1f38', '$2a$10$hqINOO0ENWNRRNNKleSkSukKISplgC0qElpxHyUrQTZfawDMHEABC', 'DH52106328', 'student'),
('f67512a9-899a-43dd-b913-00a8a927a75f', '$2a$10$aCSSydAt5rcKP/BDhJPTYupvhyBiCv13sByN2CDuzNLqa0zR49vOO', 'DH52100456', 'student'),
('f7451b5f-0748-48b8-997c-b821b10ae97c', '$2a$10$BUa7SzUMIzeIucEHPKWlquNNqsdVoprp0Q0UrzIgrBzTNFMcTOPjG', 'DH52107825', 'student'),
('f7709531-52c6-4a98-997b-575cf0b34e85', '$2a$10$fTBO5nmio7ODNyKeMST15euRlxl1j66Aj4KHw76Z.zGeSlpl5RHEC', 'DH52108548', 'student'),
('f7ec9053-3d9d-428d-a9a9-e127fea6e8c3', '$2a$10$hLO1GF10n/UsdcyitVgs3eR/urZCwdnkmW9aWIW8o076CVj/Fgzoq', 'DH52111162', 'student'),
('fab89f3d-60c3-4c9e-939a-00232ba41527', '$2a$10$dYwVNgokSw1eElMqlMXPS.ybnvOav4lLWM0z6fI8.KzTmsxLxlTRa', 'DH52106696', 'student'),
('fb5c761d-5d57-4c16-9643-72482eae74f5', '$2a$10$1sZA2aadfhFJg6ulyrSPseOrBhKzd2Mxldm1nmU9TBmIji3R84gRG', 'DH52106873', 'student'),
('fe51be66-9d8b-4a2b-9a75-b04a3174a39b', '$2a$10$ZQFItwRGfWwtU3qcUbP8uuv7oztVui.XHTbwm1zPFX06M2V0jR.yS', 'DH52100015', 'student'),
('TK001', '$2a$10$TU9KfmMOXOZmj2JeCu354.PrAoNo0ZAjEwj7F1mQWRYTD8Tml6EVi', 'dangthanhhai', 'student');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tham_gia_lop_do_an`
--

CREATE TABLE `tham_gia_lop_do_an` (
  `id` bigint(20) NOT NULL,
  `ma_lop_do_an` int(11) NOT NULL,
  `ma_nguoi_dung` varchar(255) NOT NULL,
  `ma_nhom` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tham_gia_lop_do_an`
--

INSERT INTO `tham_gia_lop_do_an` (`id`, `ma_lop_do_an`, `ma_nguoi_dung`, `ma_nhom`) VALUES
(1, 1, 'DH00', NULL),
(2, 1, 'DH00', NULL),
(3, 2, 'DH123456', NULL),
(4, 1, 'DH123456', NULL),
(5, 3, 'DH123456', NULL),
(6, 2, 'DH00', NULL),
(7, 4, 'DH00', NULL),
(8, 4, 'DH52108548', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tuan_nop_bai`
--

CREATE TABLE `tuan_nop_bai` (
  `ma_tuan` int(11) NOT NULL,
  `ten_tuan` varchar(255) NOT NULL,
  `mo_ta` text DEFAULT NULL,
  `ngay_bat_dau` date NOT NULL,
  `ngay_ket_thuc` date NOT NULL,
  `trang_thai` varchar(50) DEFAULT 'active' COMMENT 'active|closed',
  `ma_nhom` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `tuan_nop_bai`
--

INSERT INTO `tuan_nop_bai` (`ma_tuan`, `ten_tuan`, `mo_ta`, `ngay_bat_dau`, `ngay_ket_thuc`, `trang_thai`, `ma_nhom`) VALUES
(8, 'Tuần 3 - Ôn tập 1', NULL, '2025-05-27', '2025-06-03', 'ACTIVE', 2),
(9, 'Tuần 3 - Ôn tập 1', NULL, '2025-05-27', '2025-06-03', 'ACTIVE', 1),
(10, 'Tuần 1', 'Nộp bài đồ án tuần đầu tiên', '2025-06-17', '2025-06-23', 'Đang diễn ra', 2),
(11, 'Tuần 1', 'Nộp bài đồ án tuần đầu tiên', '2025-06-17', '2025-06-23', 'Đang diễn ra', 4),
(12, 'Tuần 1', 'vẽ ERD', '2025-02-02', '2026-03-03', 'active', 7),
(13, 'tuần 1', 'vẽ ERD', '2025-02-02', '2026-03-03', 'ACTIVE', 6),
(14, 'tuần 1', 'demo', '2025-04-04', '2025-05-05', 'ACTIVE', 1),
(15, 'tuần 2', 'demo 22', '2025-06-06', '2025-08-08', 'active', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `buoi_hoc`
--
ALTER TABLE `buoi_hoc`
  ADD PRIMARY KEY (`ma_buoi_hoc`),
  ADD KEY `FKresnpp25ibokky9xcp7r9nn1e` (`ma_mon_hoc`),
  ADD KEY `FK1xu8i7qikw0dq270q1ejw8n27` (`ma_phong`);

--
-- Chỉ mục cho bảng `diem_danh`
--
ALTER TABLE `diem_danh`
  ADD PRIMARY KEY (`ma_diem_danh`),
  ADD KEY `FKn39tnia8bkst1qbvkosdx8lew` (`ma_buoi_hoc`),
  ADD KEY `FK56ahhb3iy1e50gim96jbaxyku` (`ma_nguoi_dung`);

--
-- Chỉ mục cho bảng `diem_danh_sinh_vien`
--
ALTER TABLE `diem_danh_sinh_vien`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKtflyllv7mahy2d1wxf18dncf9` (`diemdanh_id`),
  ADD KEY `FK5expuo5jtc2lkdw7n6wvngej8` (`user_id`);

--
-- Chỉ mục cho bảng `lop_do_an`
--
ALTER TABLE `lop_do_an`
  ADD PRIMARY KEY (`ma_lop_do_an`);

--
-- Chỉ mục cho bảng `lop_sinh_vien`
--
ALTER TABLE `lop_sinh_vien`
  ADD PRIMARY KEY (`ma_lop`);

--
-- Chỉ mục cho bảng `mon_hoc`
--
ALTER TABLE `mon_hoc`
  ADD PRIMARY KEY (`ma_mon_hoc`);

--
-- Chỉ mục cho bảng `nguoi_dung`
--
ALTER TABLE `nguoi_dung`
  ADD PRIMARY KEY (`ma_nguoi_dung`),
  ADD UNIQUE KEY `UKmajqh5g4djy2tp3p9dvr64brp` (`email`),
  ADD UNIQUE KEY `UKltruy9naf2a8dw4mteq44xufk` (`ma_tai_khoan`),
  ADD KEY `FK4kfboc7g5ory9apx9nntvvslw` (`ma_lop`);

--
-- Chỉ mục cho bảng `nguoi_tham_gia`
--
ALTER TABLE `nguoi_tham_gia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKs7m9d0kal9qtv80wssa9lp6gj` (`buoihoc_id`),
  ADD KEY `FKtojp2r3lsbk1ssso6oca99og9` (`nguoidung_id`);

--
-- Chỉ mục cho bảng `nhom_do_an`
--
ALTER TABLE `nhom_do_an`
  ADD PRIMARY KEY (`ma_nhom`),
  ADD KEY `FKo65pawfxu5m6rj1xotoctp8aw` (`ma_lop_do_an`);

--
-- Chỉ mục cho bảng `nop_bai`
--
ALTER TABLE `nop_bai`
  ADD PRIMARY KEY (`ma_nop_bai`),
  ADD KEY `fk_nopbai_tuan` (`ma_tuan`),
  ADD KEY `fk_nopbai_nguoidung` (`ma_nguoi_dung`);

--
-- Chỉ mục cho bảng `phong`
--
ALTER TABLE `phong`
  ADD PRIMARY KEY (`ma_phong`);

--
-- Chỉ mục cho bảng `tai_khoan`
--
ALTER TABLE `tai_khoan`
  ADD PRIMARY KEY (`ma_tai_khoan`);

--
-- Chỉ mục cho bảng `tham_gia_lop_do_an`
--
ALTER TABLE `tham_gia_lop_do_an`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKhbppfj1is8ppi1696pk8jyvwg` (`ma_nguoi_dung`),
  ADD KEY `FKhkcqf47d980oatx2g3by49k9u` (`ma_lop_do_an`),
  ADD KEY `FKf2st0tkrt8382q81nrrqwansg` (`ma_nhom`);

--
-- Chỉ mục cho bảng `tuan_nop_bai`
--
ALTER TABLE `tuan_nop_bai`
  ADD PRIMARY KEY (`ma_tuan`),
  ADD KEY `FKltr7r2ejek5l9awdyq5gg26qm` (`ma_nhom`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `buoi_hoc`
--
ALTER TABLE `buoi_hoc`
  MODIFY `ma_buoi_hoc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `diem_danh`
--
ALTER TABLE `diem_danh`
  MODIFY `ma_diem_danh` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `diem_danh_sinh_vien`
--
ALTER TABLE `diem_danh_sinh_vien`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT cho bảng `lop_do_an`
--
ALTER TABLE `lop_do_an`
  MODIFY `ma_lop_do_an` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `nguoi_tham_gia`
--
ALTER TABLE `nguoi_tham_gia`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `nhom_do_an`
--
ALTER TABLE `nhom_do_an`
  MODIFY `ma_nhom` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `nop_bai`
--
ALTER TABLE `nop_bai`
  MODIFY `ma_nop_bai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `tham_gia_lop_do_an`
--
ALTER TABLE `tham_gia_lop_do_an`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `tuan_nop_bai`
--
ALTER TABLE `tuan_nop_bai`
  MODIFY `ma_tuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `buoi_hoc`
--
ALTER TABLE `buoi_hoc`
  ADD CONSTRAINT `FK1xu8i7qikw0dq270q1ejw8n27` FOREIGN KEY (`ma_phong`) REFERENCES `phong` (`ma_phong`),
  ADD CONSTRAINT `FKresnpp25ibokky9xcp7r9nn1e` FOREIGN KEY (`ma_mon_hoc`) REFERENCES `mon_hoc` (`ma_mon_hoc`);

--
-- Các ràng buộc cho bảng `diem_danh`
--
ALTER TABLE `diem_danh`
  ADD CONSTRAINT `FK56ahhb3iy1e50gim96jbaxyku` FOREIGN KEY (`ma_nguoi_dung`) REFERENCES `nguoi_dung` (`ma_nguoi_dung`),
  ADD CONSTRAINT `FKn39tnia8bkst1qbvkosdx8lew` FOREIGN KEY (`ma_buoi_hoc`) REFERENCES `buoi_hoc` (`ma_buoi_hoc`);

--
-- Các ràng buộc cho bảng `diem_danh_sinh_vien`
--
ALTER TABLE `diem_danh_sinh_vien`
  ADD CONSTRAINT `FK5expuo5jtc2lkdw7n6wvngej8` FOREIGN KEY (`user_id`) REFERENCES `nguoi_dung` (`ma_nguoi_dung`),
  ADD CONSTRAINT `FKtflyllv7mahy2d1wxf18dncf9` FOREIGN KEY (`diemdanh_id`) REFERENCES `diem_danh` (`ma_diem_danh`);

--
-- Các ràng buộc cho bảng `nguoi_dung`
--
ALTER TABLE `nguoi_dung`
  ADD CONSTRAINT `FK4kfboc7g5ory9apx9nntvvslw` FOREIGN KEY (`ma_lop`) REFERENCES `lop_sinh_vien` (`ma_lop`),
  ADD CONSTRAINT `FKbrlqj8q133ly8l99xc05wf6sk` FOREIGN KEY (`ma_tai_khoan`) REFERENCES `tai_khoan` (`ma_tai_khoan`);

--
-- Các ràng buộc cho bảng `nguoi_tham_gia`
--
ALTER TABLE `nguoi_tham_gia`
  ADD CONSTRAINT `FKs7m9d0kal9qtv80wssa9lp6gj` FOREIGN KEY (`buoihoc_id`) REFERENCES `buoi_hoc` (`ma_buoi_hoc`),
  ADD CONSTRAINT `FKtojp2r3lsbk1ssso6oca99og9` FOREIGN KEY (`nguoidung_id`) REFERENCES `nguoi_dung` (`ma_nguoi_dung`);

--
-- Các ràng buộc cho bảng `nhom_do_an`
--
ALTER TABLE `nhom_do_an`
  ADD CONSTRAINT `FKo65pawfxu5m6rj1xotoctp8aw` FOREIGN KEY (`ma_lop_do_an`) REFERENCES `lop_do_an` (`ma_lop_do_an`);

--
-- Các ràng buộc cho bảng `nop_bai`
--
ALTER TABLE `nop_bai`
  ADD CONSTRAINT `fk_nopbai_nguoidung` FOREIGN KEY (`ma_nguoi_dung`) REFERENCES `nguoi_dung` (`ma_nguoi_dung`),
  ADD CONSTRAINT `fk_nopbai_tuan` FOREIGN KEY (`ma_tuan`) REFERENCES `tuan_nop_bai` (`ma_tuan`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `tham_gia_lop_do_an`
--
ALTER TABLE `tham_gia_lop_do_an`
  ADD CONSTRAINT `FKf2st0tkrt8382q81nrrqwansg` FOREIGN KEY (`ma_nhom`) REFERENCES `nhom_do_an` (`ma_nhom`),
  ADD CONSTRAINT `FKhbppfj1is8ppi1696pk8jyvwg` FOREIGN KEY (`ma_nguoi_dung`) REFERENCES `nguoi_dung` (`ma_nguoi_dung`),
  ADD CONSTRAINT `FKhkcqf47d980oatx2g3by49k9u` FOREIGN KEY (`ma_lop_do_an`) REFERENCES `lop_do_an` (`ma_lop_do_an`);

--
-- Các ràng buộc cho bảng `tuan_nop_bai`
--
ALTER TABLE `tuan_nop_bai`
  ADD CONSTRAINT `FKltr7r2ejek5l9awdyq5gg26qm` FOREIGN KEY (`ma_nhom`) REFERENCES `nhom_do_an` (`ma_nhom`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
