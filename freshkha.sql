-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th8 11, 2023 lúc 09:38 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `freshkha`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_menu`
--

CREATE TABLE `admin_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `permission` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_menu`
--

INSERT INTO `admin_menu` (`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `permission`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 'Dashboard', 'fa-bar-chart', '/', NULL, NULL, NULL),
(2, 0, 2, 'Admin', 'fa-tasks', '', NULL, NULL, NULL),
(3, 2, 3, 'Users', 'fa-users', 'auth/users', NULL, NULL, NULL),
(4, 2, 4, 'Roles', 'fa-user', 'auth/roles', NULL, NULL, NULL),
(5, 2, 5, 'Permission', 'fa-ban', 'auth/permissions', NULL, NULL, NULL),
(6, 2, 6, 'Menu', 'fa-bars', 'auth/menu', NULL, NULL, NULL),
(7, 2, 7, 'Operation log', 'fa-history', 'auth/logs', NULL, NULL, NULL),
(8, 0, 0, 'Product', 'fa-product-hunt', 'auth/products', '*', '2023-08-06 09:24:13', '2023-08-06 09:24:13'),
(9, 0, 0, 'Categories', 'fa-dedent', 'auth/categories', '*', '2023-08-06 09:25:19', '2023-08-06 09:25:19');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_operation_log`
--

CREATE TABLE `admin_operation_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `method` varchar(10) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `input` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_operation_log`
--

INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-08-06 09:13:52', '2023-08-06 09:13:52'),
(2, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 09:13:55', '2023-08-06 09:13:55'),
(3, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 09:14:01', '2023-08-06 09:14:01'),
(4, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-08-06 09:16:18', '2023-08-06 09:16:18'),
(5, 1, 'admin/demo/users', 'GET', '127.0.0.1', '[]', '2023-08-06 09:16:21', '2023-08-06 09:16:21'),
(6, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-08-06 09:23:40', '2023-08-06 09:23:40'),
(7, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 09:23:43', '2023-08-06 09:23:43'),
(8, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"Product\",\"icon\":\"fa-product-hunt\",\"uri\":\"auth\\/products\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"KzimEj5qOeyEtmOnbqifQDBXaGeDVqsq3uqnVUFR\"}', '2023-08-06 09:24:13', '2023-08-06 09:24:13'),
(9, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-06 09:24:14', '2023-08-06 09:24:14'),
(10, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-06 09:24:15', '2023-08-06 09:24:15'),
(11, 1, 'admin/auth/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 09:24:18', '2023-08-06 09:24:18'),
(12, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 09:24:21', '2023-08-06 09:24:21'),
(13, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 09:24:23', '2023-08-06 09:24:23'),
(14, 1, 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"Categories\",\"icon\":\"fa-dedent\",\"uri\":\"auth\\/categories\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"KzimEj5qOeyEtmOnbqifQDBXaGeDVqsq3uqnVUFR\"}', '2023-08-06 09:25:19', '2023-08-06 09:25:19'),
(15, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-06 09:25:20', '2023-08-06 09:25:20'),
(16, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-06 09:25:22', '2023-08-06 09:25:22'),
(17, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 09:25:51', '2023-08-06 09:25:51'),
(18, 1, 'admin/auth/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 09:26:52', '2023-08-06 09:26:52'),
(19, 1, 'admin/auth/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 09:26:54', '2023-08-06 09:26:54'),
(20, 1, 'admin/auth/categories', 'POST', '127.0.0.1', '{\"category_name\":\"Fruit\",\"warehouse\":\"A\",\"_token\":\"KzimEj5qOeyEtmOnbqifQDBXaGeDVqsq3uqnVUFR\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/categories\"}', '2023-08-06 09:27:11', '2023-08-06 09:27:11'),
(21, 1, 'admin/auth/categories', 'GET', '127.0.0.1', '[]', '2023-08-06 09:27:11', '2023-08-06 09:27:11'),
(22, 1, 'admin/auth/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 09:27:13', '2023-08-06 09:27:13'),
(23, 1, 'admin/auth/categories', 'POST', '127.0.0.1', '{\"category_name\":\"Vegetable\",\"warehouse\":\"B\",\"_token\":\"KzimEj5qOeyEtmOnbqifQDBXaGeDVqsq3uqnVUFR\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/categories\"}', '2023-08-06 09:27:21', '2023-08-06 09:27:21'),
(24, 1, 'admin/auth/categories', 'GET', '127.0.0.1', '[]', '2023-08-06 09:27:21', '2023-08-06 09:27:21'),
(25, 1, 'admin/auth/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 09:27:23', '2023-08-06 09:27:23'),
(26, 1, 'admin/auth/categories', 'POST', '127.0.0.1', '{\"category_name\":\"Bean\",\"warehouse\":\"C\",\"_token\":\"KzimEj5qOeyEtmOnbqifQDBXaGeDVqsq3uqnVUFR\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/categories\"}', '2023-08-06 09:27:26', '2023-08-06 09:27:26'),
(27, 1, 'admin/auth/categories', 'GET', '127.0.0.1', '[]', '2023-08-06 09:27:27', '2023-08-06 09:27:27'),
(28, 1, 'admin/auth/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 09:27:30', '2023-08-06 09:27:30'),
(29, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-08-06 18:51:53', '2023-08-06 18:51:53'),
(30, 1, 'admin/auth/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 18:51:57', '2023-08-06 18:51:57'),
(31, 1, 'admin/auth/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 18:52:02', '2023-08-06 18:52:02'),
(32, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-08-06 19:06:59', '2023-08-06 19:06:59'),
(33, 1, 'admin/auth/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 19:07:03', '2023-08-06 19:07:03'),
(34, 1, 'admin/auth/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 19:07:06', '2023-08-06 19:07:06'),
(35, 1, 'admin/auth/categories/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 19:07:09', '2023-08-06 19:07:09'),
(36, 1, 'admin/auth/categories', 'POST', '127.0.0.1', '{\"category_name\":\"Tubers\",\"warehouse\":\"D\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/categories\"}', '2023-08-06 19:07:44', '2023-08-06 19:07:44'),
(37, 1, 'admin/auth/categories', 'GET', '127.0.0.1', '[]', '2023-08-06 19:07:45', '2023-08-06 19:07:45'),
(38, 1, 'admin/auth/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 19:07:48', '2023-08-06 19:07:48'),
(39, 1, 'admin/auth/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 19:10:18', '2023-08-06 19:10:18'),
(40, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-08-06 19:10:36', '2023-08-06 19:10:36'),
(41, 1, 'admin/auth/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 19:10:39', '2023-08-06 19:10:39'),
(42, 1, 'admin/auth/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 19:10:41', '2023-08-06 19:10:41'),
(43, 1, 'admin/auth/products', 'POST', '127.0.0.1', '{\"name\":\"Banana\",\"categoryID\":\"1\",\"price\":\"15\",\"brief_description\":\"Banana\",\"details_description\":\"Banana from...\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/products\"}', '2023-08-06 19:11:42', '2023-08-06 19:11:42'),
(44, 1, 'admin/auth/products', 'GET', '127.0.0.1', '[]', '2023-08-06 19:11:42', '2023-08-06 19:11:42'),
(45, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"1\",\"_model\":\"App_Models_Product\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2023-08-06 19:15:59', '2023-08-06 19:15:59'),
(46, 1, 'admin/auth/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 19:16:00', '2023-08-06 19:16:00'),
(47, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-08-06 19:20:37', '2023-08-06 19:20:37'),
(48, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-08-06 19:22:25', '2023-08-06 19:22:25'),
(49, 1, 'admin/auth/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 19:22:28', '2023-08-06 19:22:28'),
(50, 1, 'admin/auth/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 19:22:30', '2023-08-06 19:22:30'),
(51, 1, 'admin/auth/products', 'POST', '127.0.0.1', '{\"name\":\"Banana\",\"categoryID\":\"1\",\"price\":\"15\",\"brief_description\":\"chuoi\",\"details_description\":\"banana from\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/products\"}', '2023-08-06 19:23:03', '2023-08-06 19:23:03'),
(52, 1, 'admin/auth/products', 'GET', '127.0.0.1', '[]', '2023-08-06 19:23:04', '2023-08-06 19:23:04'),
(53, 1, 'admin/auth/products', 'GET', '127.0.0.1', '[]', '2023-08-06 19:24:31', '2023-08-06 19:24:31'),
(54, 1, 'admin/auth/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 19:24:35', '2023-08-06 19:24:35'),
(55, 1, 'admin/auth/products', 'GET', '127.0.0.1', '[]', '2023-08-06 19:24:46', '2023-08-06 19:24:46'),
(56, 1, 'admin/auth/products', 'GET', '127.0.0.1', '[]', '2023-08-06 19:24:55', '2023-08-06 19:24:55'),
(57, 1, 'admin/auth/products', 'GET', '127.0.0.1', '[]', '2023-08-06 19:25:12', '2023-08-06 19:25:12'),
(58, 1, 'admin/auth/products', 'GET', '127.0.0.1', '[]', '2023-08-06 19:41:39', '2023-08-06 19:41:39'),
(59, 1, 'admin/auth/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 19:41:43', '2023-08-06 19:41:43'),
(60, 1, 'admin/auth/products', 'POST', '127.0.0.1', '{\"name\":\"Flum\",\"categoryID\":\"0\",\"price\":\"16\",\"brief_description\":\"man\",\"details_description\":\"man from....\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/products\"}', '2023-08-06 19:42:12', '2023-08-06 19:42:12'),
(61, 1, 'admin/auth/products/create', 'GET', '127.0.0.1', '[]', '2023-08-06 19:42:15', '2023-08-06 19:42:15'),
(62, 1, 'admin/auth/products', 'POST', '127.0.0.1', '{\"name\":\"Flum\",\"categoryID\":\"1\",\"price\":\"16\",\"brief_description\":\"man\",\"details_description\":\"man from....\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\"}', '2023-08-06 19:42:33', '2023-08-06 19:42:33'),
(63, 1, 'admin/auth/products', 'GET', '127.0.0.1', '[]', '2023-08-06 19:42:33', '2023-08-06 19:42:33'),
(64, 1, 'admin/auth/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 19:42:37', '2023-08-06 19:42:37'),
(65, 1, 'admin/auth/products', 'POST', '127.0.0.1', '{\"name\":\"Avocado\",\"categoryID\":\"1\",\"price\":\"20\",\"brief_description\":\"bo\",\"details_description\":\"bo\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/products\"}', '2023-08-06 19:42:59', '2023-08-06 19:42:59'),
(66, 1, 'admin/auth/products', 'GET', '127.0.0.1', '[]', '2023-08-06 19:42:59', '2023-08-06 19:42:59'),
(67, 1, 'admin/auth/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 19:43:08', '2023-08-06 19:43:08'),
(68, 1, 'admin/auth/products', 'POST', '127.0.0.1', '{\"name\":\"Lychee\",\"categoryID\":\"1\",\"price\":\"25\",\"brief_description\":\"Vai\",\"details_description\":\"Vai from Viet Nam\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/products\"}', '2023-08-06 19:45:19', '2023-08-06 19:45:19'),
(69, 1, 'admin/auth/products', 'GET', '127.0.0.1', '[]', '2023-08-06 19:45:19', '2023-08-06 19:45:19'),
(70, 1, 'admin/auth/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 19:45:24', '2023-08-06 19:45:24'),
(71, 1, 'admin/auth/products', 'POST', '127.0.0.1', '{\"name\":\"Orange\",\"categoryID\":\"1\",\"price\":\"17\",\"brief_description\":\"cam\",\"details_description\":\"cam from viet nam\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/products\"}', '2023-08-06 19:45:48', '2023-08-06 19:45:48'),
(72, 1, 'admin/auth/products', 'GET', '127.0.0.1', '[]', '2023-08-06 19:45:49', '2023-08-06 19:45:49'),
(73, 1, 'admin/auth/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 19:47:54', '2023-08-06 19:47:54'),
(74, 1, 'admin/auth/products', 'POST', '127.0.0.1', '{\"name\":\"Dragon Fruit\",\"categoryID\":\"1\",\"price\":\"16\",\"brief_description\":\"thanh long\",\"details_description\":\"thanh long from binh thuan\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/products\"}', '2023-08-06 19:48:22', '2023-08-06 19:48:22'),
(75, 1, 'admin/auth/products', 'GET', '127.0.0.1', '[]', '2023-08-06 19:48:23', '2023-08-06 19:48:23'),
(76, 1, 'admin/auth/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 19:48:25', '2023-08-06 19:48:25'),
(77, 1, 'admin/auth/products', 'POST', '127.0.0.1', '{\"name\":\"Apple\",\"categoryID\":\"1\",\"price\":\"20\",\"brief_description\":\"tao\",\"details_description\":\"tao den tu viet nam\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/products\"}', '2023-08-06 19:48:46', '2023-08-06 19:48:46'),
(78, 1, 'admin/auth/products', 'GET', '127.0.0.1', '[]', '2023-08-06 19:48:46', '2023-08-06 19:48:46'),
(79, 1, 'admin/auth/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 19:48:48', '2023-08-06 19:48:48'),
(80, 1, 'admin/auth/products', 'POST', '127.0.0.1', '{\"name\":\"Grape\",\"categoryID\":\"0\",\"price\":null,\"brief_description\":null,\"details_description\":null,\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/products\"}', '2023-08-06 19:49:03', '2023-08-06 19:49:03'),
(81, 1, 'admin/auth/products/create', 'GET', '127.0.0.1', '[]', '2023-08-06 19:49:04', '2023-08-06 19:49:04'),
(82, 1, 'admin/auth/products', 'POST', '127.0.0.1', '{\"name\":\"Grape\",\"categoryID\":\"1\",\"price\":\"20\",\"brief_description\":\"nho\",\"details_description\":\"nho\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\"}', '2023-08-06 19:49:19', '2023-08-06 19:49:19'),
(83, 1, 'admin/auth/products', 'GET', '127.0.0.1', '[]', '2023-08-06 19:49:20', '2023-08-06 19:49:20'),
(84, 1, 'admin/auth/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 19:49:27', '2023-08-06 19:49:27'),
(85, 1, 'admin/auth/products', 'POST', '127.0.0.1', '{\"name\":\"Madarin\",\"categoryID\":\"1\",\"price\":\"20\",\"brief_description\":\"quyt\",\"details_description\":\"quyt\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/products\"}', '2023-08-06 19:49:50', '2023-08-06 19:49:50'),
(86, 1, 'admin/auth/products', 'GET', '127.0.0.1', '[]', '2023-08-06 19:49:50', '2023-08-06 19:49:50'),
(87, 1, 'admin/auth/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 19:52:42', '2023-08-06 19:52:42'),
(88, 1, 'admin/auth/products', 'POST', '127.0.0.1', '{\"name\":\"Mango\",\"categoryID\":\"1\",\"price\":\"18\",\"brief_description\":\"xoai\",\"details_description\":\"xoai ngon vai\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/products\"}', '2023-08-06 19:53:07', '2023-08-06 19:53:07'),
(89, 1, 'admin/auth/products', 'GET', '127.0.0.1', '[]', '2023-08-06 19:53:08', '2023-08-06 19:53:08'),
(90, 1, 'admin/auth/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 19:53:11', '2023-08-06 19:53:11'),
(91, 1, 'admin/auth/products', 'POST', '127.0.0.1', '{\"name\":\"Papaya\",\"categoryID\":\"1\",\"price\":\"17\",\"brief_description\":\"du du\",\"details_description\":\"du du ph\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/products\"}', '2023-08-06 19:53:34', '2023-08-06 19:53:34'),
(92, 1, 'admin/auth/products', 'GET', '127.0.0.1', '[]', '2023-08-06 19:53:34', '2023-08-06 19:53:34'),
(93, 1, 'admin/auth/products/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 19:53:48', '2023-08-06 19:53:48'),
(94, 1, 'admin/auth/products/2', 'PUT', '127.0.0.1', '{\"name\":\"Banana\",\"categoryID\":\"1\",\"price\":\"15\",\"brief_description\":\"chuoi\",\"details_description\":\"banana from nha bin an\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/products\"}', '2023-08-06 19:53:56', '2023-08-06 19:53:56'),
(95, 1, 'admin/auth/products', 'GET', '127.0.0.1', '[]', '2023-08-06 19:53:57', '2023-08-06 19:53:57'),
(96, 1, 'admin/auth/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 19:54:42', '2023-08-06 19:54:42'),
(97, 1, 'admin/auth/products', 'POST', '127.0.0.1', '{\"name\":\"Peach\",\"categoryID\":\"1\",\"price\":\"19\",\"brief_description\":\"dao ngon\",\"details_description\":\"dao ngon\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/products\"}', '2023-08-06 19:55:04', '2023-08-06 19:55:04'),
(98, 1, 'admin/auth/products', 'GET', '127.0.0.1', '[]', '2023-08-06 19:55:05', '2023-08-06 19:55:05'),
(99, 1, 'admin/auth/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 19:55:07', '2023-08-06 19:55:07'),
(100, 1, 'admin/auth/products', 'POST', '127.0.0.1', '{\"name\":\"Pear\",\"categoryID\":\"1\",\"price\":\"15\",\"brief_description\":\"le ngon\",\"details_description\":\"le ngon v\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/products\"}', '2023-08-06 19:55:32', '2023-08-06 19:55:32'),
(101, 1, 'admin/auth/products', 'GET', '127.0.0.1', '[]', '2023-08-06 19:55:33', '2023-08-06 19:55:33'),
(102, 1, 'admin/auth/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 19:55:34', '2023-08-06 19:55:34'),
(103, 1, 'admin/auth/products', 'POST', '127.0.0.1', '{\"name\":\"Pineapple\",\"categoryID\":\"1\",\"price\":\"16\",\"brief_description\":\"dua ngon\",\"details_description\":\"dua ngon la chuyen khong\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/products\"}', '2023-08-06 19:55:56', '2023-08-06 19:55:56'),
(104, 1, 'admin/auth/products', 'GET', '127.0.0.1', '[]', '2023-08-06 19:55:57', '2023-08-06 19:55:57'),
(105, 1, 'admin/auth/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 19:55:59', '2023-08-06 19:55:59'),
(106, 1, 'admin/auth/products', 'POST', '127.0.0.1', '{\"name\":\"Pomegranate\",\"categoryID\":\"1\",\"price\":\"21\",\"brief_description\":\"luu\",\"details_description\":\"qua luu nay ngon\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/products\"}', '2023-08-06 19:56:23', '2023-08-06 19:56:23'),
(107, 1, 'admin/auth/products', 'GET', '127.0.0.1', '[]', '2023-08-06 19:56:24', '2023-08-06 19:56:24'),
(108, 1, 'admin/auth/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 20:03:14', '2023-08-06 20:03:14'),
(109, 1, 'admin/auth/products', 'POST', '127.0.0.1', '{\"name\":\"Rambutan\",\"categoryID\":\"1\",\"price\":\"17\",\"brief_description\":\"chom chom\",\"details_description\":\"chom chom den tu dau\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/products\"}', '2023-08-06 20:03:43', '2023-08-06 20:03:43'),
(110, 1, 'admin/auth/products', 'GET', '127.0.0.1', '[]', '2023-08-06 20:03:43', '2023-08-06 20:03:43'),
(111, 1, 'admin/auth/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 20:03:48', '2023-08-06 20:03:48'),
(112, 1, 'admin/auth/products', 'POST', '127.0.0.1', '{\"name\":\"Strawberry\",\"categoryID\":\"1\",\"price\":null,\"brief_description\":\"dau\",\"details_description\":\"dau tay\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/products\"}', '2023-08-06 20:04:07', '2023-08-06 20:04:07'),
(113, 1, 'admin/auth/products/create', 'GET', '127.0.0.1', '[]', '2023-08-06 20:04:08', '2023-08-06 20:04:08'),
(114, 1, 'admin/auth/products', 'POST', '127.0.0.1', '{\"name\":\"Strawberry\",\"categoryID\":\"1\",\"price\":\"25\",\"brief_description\":\"dau\",\"details_description\":\"dau tay\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\"}', '2023-08-06 20:04:18', '2023-08-06 20:04:18'),
(115, 1, 'admin/auth/products', 'GET', '127.0.0.1', '[]', '2023-08-06 20:04:19', '2023-08-06 20:04:19'),
(116, 1, 'admin/auth/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 20:21:51', '2023-08-06 20:21:51'),
(117, 1, 'admin/auth/products', 'POST', '127.0.0.1', '{\"name\":\"Bean-sprouts\",\"categoryID\":\"2\",\"price\":\"15\",\"brief_description\":\"gia do\",\"details_description\":\"gia do\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/products\"}', '2023-08-06 20:22:23', '2023-08-06 20:22:23'),
(118, 1, 'admin/auth/products', 'GET', '127.0.0.1', '[]', '2023-08-06 20:22:24', '2023-08-06 20:22:24'),
(119, 1, 'admin/auth/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 20:22:25', '2023-08-06 20:22:25'),
(120, 1, 'admin/auth/products', 'POST', '127.0.0.1', '{\"name\":\"Brocoli\",\"categoryID\":\"2\",\"price\":\"15\",\"brief_description\":\"bong cai\",\"details_description\":\"bong cai xanh\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/products\"}', '2023-08-06 20:22:43', '2023-08-06 20:22:43'),
(121, 1, 'admin/auth/products', 'GET', '127.0.0.1', '[]', '2023-08-06 20:22:43', '2023-08-06 20:22:43'),
(122, 1, 'admin/auth/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 20:22:45', '2023-08-06 20:22:45'),
(123, 1, 'admin/auth/products', 'POST', '127.0.0.1', '{\"name\":\"Cabbige\",\"categoryID\":\"2\",\"price\":\"15\",\"brief_description\":\"bap cai\",\"details_description\":\"bap cai nha bin\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/products\"}', '2023-08-06 20:23:03', '2023-08-06 20:23:03'),
(124, 1, 'admin/auth/products', 'GET', '127.0.0.1', '[]', '2023-08-06 20:23:03', '2023-08-06 20:23:03'),
(125, 1, 'admin/auth/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 20:23:05', '2023-08-06 20:23:05'),
(126, 1, 'admin/auth/products', 'POST', '127.0.0.1', '{\"name\":\"Cauliflower\",\"categoryID\":\"2\",\"price\":\"15\",\"brief_description\":\"trang\",\"details_description\":\"trang\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/products\"}', '2023-08-06 20:23:44', '2023-08-06 20:23:44'),
(127, 1, 'admin/auth/products', 'GET', '127.0.0.1', '[]', '2023-08-06 20:23:44', '2023-08-06 20:23:44'),
(128, 1, 'admin/auth/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 20:23:46', '2023-08-06 20:23:46'),
(129, 1, 'admin/auth/products', 'POST', '127.0.0.1', '{\"name\":\"Fish mint\",\"categoryID\":\"2\",\"price\":\"15\",\"brief_description\":\"rau nhiep c\",\"details_description\":\"rau nhiep ca nha bin\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/products\"}', '2023-08-06 20:24:12', '2023-08-06 20:24:12'),
(130, 1, 'admin/auth/products', 'GET', '127.0.0.1', '[]', '2023-08-06 20:24:13', '2023-08-06 20:24:13'),
(131, 1, 'admin/auth/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 20:24:15', '2023-08-06 20:24:15'),
(132, 1, 'admin/auth/products', 'POST', '127.0.0.1', '{\"name\":\"Lettuce\",\"categoryID\":\"2\",\"price\":\"15\",\"brief_description\":\"xa lach\",\"details_description\":\"xa lach nha bin\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/products\"}', '2023-08-06 20:24:33', '2023-08-06 20:24:33'),
(133, 1, 'admin/auth/products', 'GET', '127.0.0.1', '[]', '2023-08-06 20:24:34', '2023-08-06 20:24:34'),
(134, 1, 'admin/auth/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 20:24:36', '2023-08-06 20:24:36'),
(135, 1, 'admin/auth/products', 'POST', '127.0.0.1', '{\"name\":\"Water Glory Morning\",\"categoryID\":\"2\",\"price\":\"15\",\"brief_description\":\"rau mu\\u1ed1n\",\"details_description\":\"rau mu\\u1ed1n nahf bin\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/products\"}', '2023-08-06 20:25:03', '2023-08-06 20:25:03'),
(136, 1, 'admin/auth/products', 'GET', '127.0.0.1', '[]', '2023-08-06 20:25:04', '2023-08-06 20:25:04'),
(137, 1, 'admin/auth/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 20:30:57', '2023-08-06 20:30:57'),
(138, 1, 'admin/auth/categories/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 20:31:01', '2023-08-06 20:31:01'),
(139, 1, 'admin/auth/categories/3', 'PUT', '127.0.0.1', '{\"category_name\":\"Nut\",\"warehouse\":\"C\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/categories\"}', '2023-08-06 20:31:07', '2023-08-06 20:31:07'),
(140, 1, 'admin/auth/categories', 'GET', '127.0.0.1', '[]', '2023-08-06 20:31:07', '2023-08-06 20:31:07'),
(141, 1, 'admin/auth/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 20:31:12', '2023-08-06 20:31:12'),
(142, 1, 'admin/auth/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 20:38:19', '2023-08-06 20:38:19'),
(143, 1, 'admin/auth/products', 'POST', '127.0.0.1', '{\"name\":\"Almond\",\"categoryID\":\"3\",\"price\":\"20\",\"brief_description\":\"hanh nhan\",\"details_description\":\"hanh nhan nha lam\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/products\"}', '2023-08-06 20:38:44', '2023-08-06 20:38:44'),
(144, 1, 'admin/auth/products', 'GET', '127.0.0.1', '[]', '2023-08-06 20:38:45', '2023-08-06 20:38:45'),
(145, 1, 'admin/auth/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 20:38:46', '2023-08-06 20:38:46'),
(146, 1, 'admin/auth/products', 'POST', '127.0.0.1', '{\"name\":\"Cashew\",\"categoryID\":\"3\",\"price\":\"20\",\"brief_description\":\"hat dieu\",\"details_description\":\"hat dieu nha lam\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/products\"}', '2023-08-06 20:39:03', '2023-08-06 20:39:03'),
(147, 1, 'admin/auth/products', 'GET', '127.0.0.1', '[]', '2023-08-06 20:39:03', '2023-08-06 20:39:03'),
(148, 1, 'admin/auth/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 20:39:05', '2023-08-06 20:39:05'),
(149, 1, 'admin/auth/products', 'POST', '127.0.0.1', '{\"name\":\"Chestnut\",\"categoryID\":\"3\",\"price\":\"20\",\"brief_description\":\"hat de\",\"details_description\":\"hat de nha trong\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/products\"}', '2023-08-06 20:39:22', '2023-08-06 20:39:22'),
(150, 1, 'admin/auth/products', 'GET', '127.0.0.1', '[]', '2023-08-06 20:39:23', '2023-08-06 20:39:23'),
(151, 1, 'admin/auth/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 20:39:25', '2023-08-06 20:39:25'),
(152, 1, 'admin/auth/products', 'POST', '127.0.0.1', '{\"name\":\"Hazelnut\",\"categoryID\":\"3\",\"price\":null,\"brief_description\":\"hat ph\\u1ec9\",\"details_description\":\"h\\u1ea1t ph\\u1ec9 nh\\u00e0 tr\\u1ed3nng\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/products\"}', '2023-08-06 20:39:50', '2023-08-06 20:39:50'),
(153, 1, 'admin/auth/products/create', 'GET', '127.0.0.1', '[]', '2023-08-06 20:39:51', '2023-08-06 20:39:51'),
(154, 1, 'admin/auth/products', 'POST', '127.0.0.1', '{\"name\":\"Hazelnut\",\"categoryID\":\"3\",\"price\":\"20\",\"brief_description\":\"hat ph\\u1ec9\",\"details_description\":\"h\\u1ea1t ph\\u1ec9 nh\\u00e0 tr\\u1ed3nng\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\"}', '2023-08-06 20:40:01', '2023-08-06 20:40:01'),
(155, 1, 'admin/auth/products', 'GET', '127.0.0.1', '[]', '2023-08-06 20:40:01', '2023-08-06 20:40:01'),
(156, 1, 'admin/auth/products', 'GET', '127.0.0.1', '{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}', '2023-08-06 20:40:06', '2023-08-06 20:40:06'),
(157, 1, 'admin/auth/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 20:40:12', '2023-08-06 20:40:12'),
(158, 1, 'admin/auth/products', 'POST', '127.0.0.1', '{\"name\":\"Peanut\",\"categoryID\":\"3\",\"price\":\"20\",\"brief_description\":\"\\u0111\\u1eadu ph\\u1ed9ng\",\"details_description\":\"\\u0111\\u1eadu ph\\u1ed9ng nh\\u00e0 tr\\u1ed3ng\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/products?page=2\"}', '2023-08-06 20:40:35', '2023-08-06 20:40:35'),
(159, 1, 'admin/auth/products', 'GET', '127.0.0.1', '{\"page\":\"2\"}', '2023-08-06 20:40:35', '2023-08-06 20:40:35'),
(160, 1, 'admin/auth/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 20:40:38', '2023-08-06 20:40:38'),
(161, 1, 'admin/auth/products', 'POST', '127.0.0.1', '{\"name\":\"Pecan\",\"categoryID\":\"3\",\"price\":\"20\",\"brief_description\":\"h\\u1ea1t h\\u1ed3 \\u0111\\u00e0o\",\"details_description\":\"h\\u1ea1t h\\u1ed3 \\u0111\\u00e0o nh\\u00e0 l\\u00e0m\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/products?page=2\"}', '2023-08-06 20:41:06', '2023-08-06 20:41:06'),
(162, 1, 'admin/auth/products', 'GET', '127.0.0.1', '{\"page\":\"2\"}', '2023-08-06 20:41:07', '2023-08-06 20:41:07'),
(163, 1, 'admin/auth/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 20:41:09', '2023-08-06 20:41:09'),
(164, 1, 'admin/auth/products', 'POST', '127.0.0.1', '{\"name\":\"Pine nut\",\"categoryID\":\"3\",\"price\":\"20\",\"brief_description\":\"h\\u1ea1t th\\u00f4ng\",\"details_description\":\"h\\u1ea1t th\\u00f4ng\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/products?page=2\"}', '2023-08-06 20:41:29', '2023-08-06 20:41:29'),
(165, 1, 'admin/auth/products', 'GET', '127.0.0.1', '{\"page\":\"2\"}', '2023-08-06 20:41:30', '2023-08-06 20:41:30'),
(166, 1, 'admin/auth/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 20:41:31', '2023-08-06 20:41:31'),
(167, 1, 'admin/auth/products', 'POST', '127.0.0.1', '{\"name\":\"Pistachio\",\"categoryID\":\"3\",\"price\":\"20\",\"brief_description\":\"h\\u1ea1t d\\u1ebb c\\u01b0\\u1eddi\",\"details_description\":\"h\\u1ea1t d\\u1ebb c\\u01b0\\u1eddi\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/products?page=2\"}', '2023-08-06 20:41:53', '2023-08-06 20:41:53'),
(168, 1, 'admin/auth/products', 'GET', '127.0.0.1', '{\"page\":\"2\"}', '2023-08-06 20:41:54', '2023-08-06 20:41:54'),
(169, 1, 'admin/auth/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 20:41:55', '2023-08-06 20:41:55'),
(170, 1, 'admin/auth/products', 'POST', '127.0.0.1', '{\"name\":\"Pumpkin nut\",\"categoryID\":\"3\",\"price\":\"20\",\"brief_description\":\"hat bi ngo\",\"details_description\":\"hat bi ngo\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/products?page=2\"}', '2023-08-06 20:42:36', '2023-08-06 20:42:36'),
(171, 1, 'admin/auth/products', 'GET', '127.0.0.1', '{\"page\":\"2\"}', '2023-08-06 20:42:37', '2023-08-06 20:42:37'),
(172, 1, 'admin/auth/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 20:42:40', '2023-08-06 20:42:40'),
(173, 1, 'admin/auth/products', 'POST', '127.0.0.1', '{\"name\":\"Walnut\",\"categoryID\":\"3\",\"price\":\"20\",\"brief_description\":\"hat oc cho\",\"details_description\":\"hat oc cho\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/products?page=2\"}', '2023-08-06 20:42:56', '2023-08-06 20:42:56'),
(174, 1, 'admin/auth/products', 'GET', '127.0.0.1', '{\"page\":\"2\"}', '2023-08-06 20:42:57', '2023-08-06 20:42:57'),
(175, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-08-06 22:32:54', '2023-08-06 22:32:54'),
(176, 1, 'admin/auth/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 22:32:57', '2023-08-06 22:32:57'),
(177, 1, 'admin/auth/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"page\":\"2\"}', '2023-08-06 22:33:01', '2023-08-06 22:33:01'),
(178, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"29\",\"_model\":\"App_Models_Product\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2023-08-06 22:33:17', '2023-08-06 22:33:17'),
(179, 1, 'admin/auth/products', 'GET', '127.0.0.1', '{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}', '2023-08-06 22:33:17', '2023-08-06 22:33:17'),
(180, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_key\":\"30\",\"_model\":\"App_Models_Product\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2023-08-06 22:33:35', '2023-08-06 22:33:35'),
(181, 1, 'admin/auth/products', 'GET', '127.0.0.1', '{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}', '2023-08-06 22:33:35', '2023-08-06 22:33:35'),
(182, 1, 'admin/auth/products', 'GET', '127.0.0.1', '{\"page\":\"2\",\"_pjax\":\"#pjax-container\",\"per_page\":\"30\"}', '2023-08-06 22:34:25', '2023-08-06 22:34:25'),
(183, 1, 'admin/auth/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"per_page\":\"30\",\"page\":\"1\"}', '2023-08-06 22:34:37', '2023-08-06 22:34:37'),
(184, 1, 'admin/auth/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 22:34:51', '2023-08-06 22:34:51'),
(185, 1, 'admin/auth/products', 'POST', '127.0.0.1', '{\"name\":\"Chestnut\",\"categoryID\":\"3\",\"price\":\"15\",\"brief_description\":\"aa\",\"details_description\":\"aa\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/products?&per_page=30&page=1\"}', '2023-08-06 22:35:12', '2023-08-06 22:35:12'),
(186, 1, 'admin/auth/products', 'GET', '127.0.0.1', '{\"per_page\":\"30\",\"page\":\"1\"}', '2023-08-06 22:35:12', '2023-08-06 22:35:12'),
(187, 1, 'admin/auth/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 22:36:00', '2023-08-06 22:36:00'),
(188, 1, 'admin/auth/products', 'POST', '127.0.0.1', '{\"name\":\"Hazelnut\",\"categoryID\":\"3\",\"price\":\"15\",\"brief_description\":\"a\",\"details_description\":\"a\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/products?&per_page=30&page=1\"}', '2023-08-06 22:36:18', '2023-08-06 22:36:18'),
(189, 1, 'admin/auth/products', 'GET', '127.0.0.1', '{\"per_page\":\"30\",\"page\":\"1\"}', '2023-08-06 22:36:19', '2023-08-06 22:36:19'),
(190, 1, 'admin/auth/products', 'GET', '127.0.0.1', '{\"per_page\":\"30\",\"page\":\"2\",\"_pjax\":\"#pjax-container\"}', '2023-08-06 22:38:34', '2023-08-06 22:38:34'),
(191, 1, 'admin/auth/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 22:38:38', '2023-08-06 22:38:38'),
(192, 1, 'admin/auth/products', 'GET', '127.0.0.1', '{\"per_page\":\"30\",\"page\":\"2\",\"_pjax\":\"#pjax-container\"}', '2023-08-06 22:39:34', '2023-08-06 22:39:34'),
(193, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-08-06 22:43:52', '2023-08-06 22:43:52'),
(194, 1, 'admin/auth/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 22:43:55', '2023-08-06 22:43:55'),
(195, 1, 'admin/auth/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 22:43:59', '2023-08-06 22:43:59'),
(196, 1, 'admin/auth/products', 'POST', '127.0.0.1', '{\"name\":\"Chestnut 2\",\"categoryID\":\"3\",\"price\":null,\"brief_description\":\"a\",\"details_description\":\"a\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/products\"}', '2023-08-06 22:44:20', '2023-08-06 22:44:20'),
(197, 1, 'admin/auth/products/create', 'GET', '127.0.0.1', '[]', '2023-08-06 22:44:21', '2023-08-06 22:44:21'),
(198, 1, 'admin/auth/products', 'POST', '127.0.0.1', '{\"name\":\"Chestnut 2\",\"categoryID\":\"3\",\"price\":\"20\",\"brief_description\":\"a\",\"details_description\":\"a\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\"}', '2023-08-06 22:44:31', '2023-08-06 22:44:31'),
(199, 1, 'admin/auth/products', 'GET', '127.0.0.1', '[]', '2023-08-06 22:44:31', '2023-08-06 22:44:31'),
(200, 1, 'admin/auth/products/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 22:44:33', '2023-08-06 22:44:33'),
(201, 1, 'admin/auth/products', 'POST', '127.0.0.1', '{\"name\":\"Chestnut 3\",\"categoryID\":\"3\",\"price\":\"20\",\"brief_description\":\"a\",\"details_description\":\"a\",\"_token\":\"ZGLBYhZ1QhRvJTBaKhIAsqyp8H277jSlS6cvuYju\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/products\"}', '2023-08-06 22:44:51', '2023-08-06 22:44:51'),
(202, 1, 'admin/auth/products', 'GET', '127.0.0.1', '[]', '2023-08-06 22:44:52', '2023-08-06 22:44:52'),
(203, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-08-06 23:58:44', '2023-08-06 23:58:44'),
(204, 1, 'admin/auth/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-06 23:58:47', '2023-08-06 23:58:47'),
(205, 1, 'admin/auth/products', 'GET', '127.0.0.1', '[]', '2023-08-06 23:59:04', '2023-08-06 23:59:04'),
(206, 1, 'admin/auth/products', 'GET', '127.0.0.1', '[]', '2023-08-07 00:08:38', '2023-08-07 00:08:38'),
(207, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-08-07 02:27:38', '2023-08-07 02:27:38'),
(208, 1, 'admin/auth/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-07 02:27:41', '2023-08-07 02:27:41'),
(209, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-08-07 02:31:28', '2023-08-07 02:31:28'),
(210, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-08-07 02:31:28', '2023-08-07 02:31:28'),
(211, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-08-07 02:59:35', '2023-08-07 02:59:35'),
(212, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-07 02:59:40', '2023-08-07 02:59:40'),
(213, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-08-07 03:00:49', '2023-08-07 03:00:49'),
(214, 1, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2023-08-07 03:01:01', '2023-08-07 03:01:01'),
(215, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-08-07 03:01:02', '2023-08-07 03:01:02'),
(216, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-07 03:01:07', '2023-08-07 03:01:07'),
(217, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-07 03:01:09', '2023-08-07 03:01:09'),
(218, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-08-08 00:58:54', '2023-08-08 00:58:54'),
(219, 1, 'admin/auth/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-08 00:59:14', '2023-08-08 00:59:14'),
(220, 1, 'admin/auth/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-08 00:59:59', '2023-08-08 00:59:59'),
(221, 1, 'admin/auth/categories', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-08 01:00:16', '2023-08-08 01:00:16'),
(222, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-08 01:00:18', '2023-08-08 01:00:18'),
(223, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-08 01:00:21', '2023-08-08 01:00:21'),
(224, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-08 01:00:25', '2023-08-08 01:00:25'),
(225, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2023-08-08 01:00:55', '2023-08-08 01:00:55'),
(226, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-08 01:01:18', '2023-08-08 01:01:18'),
(227, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-08 01:01:31', '2023-08-08 01:01:31'),
(228, 1, 'admin/auth/roles', 'POST', '127.0.0.1', '{\"slug\":\"Bin\",\"name\":\"An\",\"permissions\":[\"1\",\"3\",null],\"_token\":\"LKlsJReO1drOcxwvOXAE1paWxDTUkQKzOQPfNilM\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/auth\\/roles\"}', '2023-08-08 01:01:58', '2023-08-08 01:01:58'),
(229, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2023-08-08 01:01:58', '2023-08-08 01:01:58'),
(230, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-08 01:02:08', '2023-08-08 01:02:08'),
(231, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-08-08 01:02:29', '2023-08-08 01:02:29'),
(232, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-08 01:02:32', '2023-08-08 01:02:32'),
(233, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-08 01:02:34', '2023-08-08 01:02:34'),
(234, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-08 01:02:36', '2023-08-08 01:02:36'),
(235, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-08 01:02:42', '2023-08-08 01:02:42'),
(236, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-08 01:04:41', '2023-08-08 01:04:41'),
(237, 1, 'admin/auth/roles/2', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-08 01:04:56', '2023-08-08 01:04:56'),
(238, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-08 01:05:06', '2023-08-08 01:05:06'),
(239, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-08 01:05:08', '2023-08-08 01:05:08'),
(240, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-08 01:05:20', '2023-08-08 01:05:20'),
(241, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-08 01:05:23', '2023-08-08 01:05:23'),
(242, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-08 01:05:25', '2023-08-08 01:05:25'),
(243, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-08 01:05:28', '2023-08-08 01:05:28'),
(244, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-08 01:05:38', '2023-08-08 01:05:38'),
(245, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-08 01:05:39', '2023-08-08 01:05:39'),
(246, 1, 'admin/auth/users/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-08 01:05:43', '2023-08-08 01:05:43'),
(247, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-08 01:05:54', '2023-08-08 01:05:54');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_permissions`
--

CREATE TABLE `admin_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `http_method` varchar(255) DEFAULT NULL,
  `http_path` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_permissions`
--

INSERT INTO `admin_permissions` (`id`, `name`, `slug`, `http_method`, `http_path`, `created_at`, `updated_at`) VALUES
(1, 'All permission', '*', '', '*', NULL, NULL),
(2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL),
(3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL),
(4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL),
(5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'administrator', '2023-08-06 09:05:54', '2023-08-06 09:05:54'),
(2, 'An', 'Bin', '2023-08-08 01:01:58', '2023-08-08 01:01:58');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_role_menu`
--

CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_role_menu`
--

INSERT INTO `admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, NULL),
(1, 8, NULL, NULL),
(1, 9, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_role_permissions`
--

CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_role_permissions`
--

INSERT INTO `admin_role_permissions` (`role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL),
(2, 1, NULL, NULL),
(2, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_role_users`
--

CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_role_users`
--

INSERT INTO `admin_role_users` (`role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(190) NOT NULL,
  `password` varchar(60) NOT NULL,
  `name` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$gqaI5ImM.L4B.87g9PLeDeI6LmlwvpxosUJQDxEihbUFUthVBPPkS', 'Administrator', NULL, 'DqkJ6ghkrgk2lzYFBr5TWxnHZLnyNk9Kbo05hrQJSvO8U6UNIg3DmlQV1jFg', '2023-08-06 09:05:54', '2023-08-06 09:05:54');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_user_permissions`
--

CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `warehouse` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `warehouse`, `created_at`, `updated_at`) VALUES
(1, 'Fruit', 'A', '2023-08-06 09:27:11', '2023-08-06 09:27:11'),
(2, 'Vegetable', 'B', '2023-08-06 09:27:21', '2023-08-06 09:27:21'),
(3, 'Nut', 'C', '2023-08-06 09:27:27', '2023-08-06 20:31:07'),
(4, 'Tubers', 'D', '2023-08-06 19:07:44', '2023-08-06 19:07:44');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_08_05_073929_create_products_table', 1),
(6, '2023_08_05_073940_create_categories_table', 1),
(7, '2023_08_05_081148_create_categories_table', 2),
(8, '2023_08_05_081757_add_category_i_d_to_products_table', 3),
(9, '2023_08_05_082823_add_column_to_products_table', 4),
(10, '2023_08_06_115318_create_orders_table', 5),
(11, '2023_08_06_122134_create_order__details_table', 6),
(12, '2016_01_04_173148_create_admin_tables', 7);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userID` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `pay_method` varchar(255) NOT NULL,
  `total` int(5) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order__details`
--

CREATE TABLE `order__details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `orderID` bigint(20) UNSIGNED NOT NULL,
  `productID` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `categoryID` bigint(20) UNSIGNED NOT NULL,
  `price` double(8,2) NOT NULL,
  `img` varchar(255) NOT NULL,
  `brief_description` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `details_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `categoryID`, `price`, `img`, `brief_description`, `created_at`, `updated_at`, `details_description`) VALUES
(2, 'Banana', 1, 15.00, 'images/Banana.png', 'chuoi', '2023-08-06 19:23:03', '2023-08-06 19:53:56', 'banana from nha bin an'),
(4, 'Flum', 1, 16.00, 'images/9b7defc76b9dd382a2b3be02a3b269d4.png', 'man', '2023-08-06 19:42:33', '2023-08-06 19:42:33', 'man from....'),
(5, 'Avocado', 1, 20.00, 'images/avocado.png', 'bo', '2023-08-06 19:42:59', '2023-08-06 19:42:59', 'bo'),
(6, 'Lychee', 1, 25.00, 'images/lychee.png', 'Vai', '2023-08-06 19:45:19', '2023-08-06 19:45:19', 'Vai from Viet Nam'),
(7, 'Orange', 1, 17.00, 'images/6.png', 'cam', '2023-08-06 19:45:48', '2023-08-06 19:45:48', 'cam from viet nam'),
(8, 'Dragon Fruit', 1, 16.00, 'images/8.png', 'thanh long', '2023-08-06 19:48:22', '2023-08-06 19:48:22', 'thanh long from binh thuan'),
(9, 'Apple', 1, 20.00, 'images/9.png', 'tao', '2023-08-06 19:48:46', '2023-08-06 19:48:46', 'tao den tu viet nam'),
(10, 'Grape', 1, 20.00, 'images/ab9cd3dda72d2995c08dc18cc0f096a1.png', 'nho', '2023-08-06 19:49:19', '2023-08-06 19:49:19', 'nho'),
(11, 'Madarin', 1, 20.00, 'images/mandarin.png', 'quyt', '2023-08-06 19:49:50', '2023-08-06 19:49:50', 'quyt'),
(12, 'Mango', 1, 18.00, 'images/mango.png', 'xoai', '2023-08-06 19:53:07', '2023-08-06 19:53:07', 'xoai ngon vai'),
(13, 'Papaya', 1, 17.00, 'images/papaya.png', 'du du', '2023-08-06 19:53:34', '2023-08-06 19:53:34', 'du du ph'),
(14, 'Peach', 1, 19.00, 'images/peach.png', 'dao ngon', '2023-08-06 19:55:04', '2023-08-06 19:55:04', 'dao ngon'),
(15, 'Pear', 1, 15.00, 'images/pear.png', 'le ngon', '2023-08-06 19:55:32', '2023-08-06 19:55:32', 'le ngon v'),
(16, 'Pineapple', 1, 16.00, 'images/pineapple.png', 'dua ngon', '2023-08-06 19:55:57', '2023-08-06 19:55:57', 'dua ngon la chuyen khong'),
(17, 'Pomegranate', 1, 21.00, 'images/pomegranate.png', 'luu', '2023-08-06 19:56:23', '2023-08-06 19:56:23', 'qua luu nay ngon'),
(18, 'Rambutan', 1, 17.00, 'images/rambutan.png', 'chom chom', '2023-08-06 20:03:43', '2023-08-06 20:03:43', 'chom chom den tu dau'),
(19, 'Strawberry', 1, 25.00, 'images/33c59ab3d1d3e568812a41ca88ba2c22.png', 'dau', '2023-08-06 20:04:19', '2023-08-06 20:04:19', 'dau tay'),
(20, 'Bean-sprouts', 2, 15.00, 'images/bean-sprouts.png', 'gia do', '2023-08-06 20:22:23', '2023-08-06 20:22:23', 'gia do'),
(21, 'Brocoli', 2, 15.00, 'images/brocoli.png', 'bong cai', '2023-08-06 20:22:43', '2023-08-06 20:22:43', 'bong cai xanh'),
(22, 'Cabbige', 2, 15.00, 'images/cabbige.png', 'bap cai', '2023-08-06 20:23:03', '2023-08-06 20:23:03', 'bap cai nha bin'),
(23, 'Cauliflower', 2, 15.00, 'images/cauliflower.png', 'trang', '2023-08-06 20:23:44', '2023-08-06 20:23:44', 'trang'),
(24, 'Fish mint', 2, 15.00, 'images/fish mint.png', 'rau nhiep c', '2023-08-06 20:24:12', '2023-08-06 20:24:12', 'rau nhiep ca nha bin'),
(25, 'Lettuce', 2, 15.00, 'images/lettuce.png', 'xa lach', '2023-08-06 20:24:33', '2023-08-06 20:24:33', 'xa lach nha bin'),
(26, 'Water Glory Morning', 2, 15.00, 'images/water morning glory.png', 'rau muốn', '2023-08-06 20:25:03', '2023-08-06 20:25:03', 'rau muốn nahf bin'),
(27, 'Almond', 3, 20.00, 'images/almond.png', 'hanh nhan', '2023-08-06 20:38:44', '2023-08-06 20:38:44', 'hanh nhan nha lam'),
(28, 'Cashew', 3, 20.00, 'images/Cashew.png', 'hat dieu', '2023-08-06 20:39:03', '2023-08-06 20:39:03', 'hat dieu nha lam'),
(31, 'Peanut', 3, 20.00, 'images/Peanut.png', 'đậu phộng', '2023-08-06 20:40:35', '2023-08-06 20:40:35', 'đậu phộng nhà trồng'),
(32, 'Pecan', 3, 20.00, 'images/Pecan.png', 'hạt hồ đào', '2023-08-06 20:41:06', '2023-08-06 20:41:06', 'hạt hồ đào nhà làm'),
(33, 'Pine nut', 3, 20.00, 'images/pine nut.png', 'hạt thông', '2023-08-06 20:41:29', '2023-08-06 20:41:29', 'hạt thông'),
(34, 'Pistachio', 3, 20.00, 'images/pistachio.png', 'hạt dẻ cười', '2023-08-06 20:41:53', '2023-08-06 20:41:53', 'hạt dẻ cười'),
(35, 'Pumpkin nut', 3, 20.00, 'images/Pumkinp Nut.png', 'hat bi ngo', '2023-08-06 20:42:36', '2023-08-06 20:42:36', 'hat bi ngo'),
(36, 'Walnut', 3, 20.00, 'images/walnut.png', 'hat oc cho', '2023-08-06 20:42:56', '2023-08-06 20:42:56', 'hat oc cho'),
(37, 'Chestnut', 3, 15.00, 'images/6950f6ef0c1137c3a8a32cee6d19b263.png', 'aa', '2023-08-06 22:35:12', '2023-08-06 22:35:12', 'aa'),
(38, 'Hazelnut', 3, 15.00, 'images/4c040f30e13bc268c7d4d32ac1058056.png', 'a', '2023-08-06 22:36:18', '2023-08-06 22:36:18', 'a'),
(39, 'Chestnut 2', 3, 20.00, 'images/39494cb0121d22ff61b5121261a4e431.png', 'a', '2023-08-06 22:44:31', '2023-08-06 22:44:31', 'a'),
(40, 'Chestnut 3', 3, 20.00, 'images/7f38866dd79ae816ee7699d5f3a30777.png', 'a', '2023-08-06 22:44:51', '2023-08-06 22:44:51', 'a');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `gender`, `phone_number`, `address`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Hồ Viết An', 'binan1155@gmail.com', NULL, '$2y$10$O.Fo09fOeWyjkqe1fAzV2ejU8s.XNijz.255X64fy87evEZaKOSjS', NULL, NULL, NULL, NULL, '2023-08-05 18:54:37', '2023-08-05 18:54:37');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin_menu`
--
ALTER TABLE `admin_menu`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_operation_log_user_id_index` (`user_id`);

--
-- Chỉ mục cho bảng `admin_permissions`
--
ALTER TABLE `admin_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_permissions_name_unique` (`name`),
  ADD UNIQUE KEY `admin_permissions_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_roles_name_unique` (`name`),
  ADD UNIQUE KEY `admin_roles_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `admin_role_menu`
--
ALTER TABLE `admin_role_menu`
  ADD KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`);

--
-- Chỉ mục cho bảng `admin_role_permissions`
--
ALTER TABLE `admin_role_permissions`
  ADD KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`);

--
-- Chỉ mục cho bảng `admin_role_users`
--
ALTER TABLE `admin_role_users`
  ADD KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`);

--
-- Chỉ mục cho bảng `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_users_username_unique` (`username`);

--
-- Chỉ mục cho bảng `admin_user_permissions`
--
ALTER TABLE `admin_user_permissions`
  ADD KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_userid_foreign` (`userID`);

--
-- Chỉ mục cho bảng `order__details`
--
ALTER TABLE `order__details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order__details_orderid_foreign` (`orderID`),
  ADD KEY `order__details_productid_foreign` (`productID`);

--
-- Chỉ mục cho bảng `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_categoryid_foreign` (`categoryID`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin_menu`
--
ALTER TABLE `admin_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=248;

--
-- AUTO_INCREMENT cho bảng `admin_permissions`
--
ALTER TABLE `admin_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `order__details`
--
ALTER TABLE `order__details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_userid_foreign` FOREIGN KEY (`userID`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `order__details`
--
ALTER TABLE `order__details`
  ADD CONSTRAINT `order__details_orderid_foreign` FOREIGN KEY (`orderID`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order__details_productid_foreign` FOREIGN KEY (`productID`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_categoryid_foreign` FOREIGN KEY (`categoryID`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
