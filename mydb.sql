-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2023 at 06:33 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add user', 7, 'add_user'),
(26, 'Can change user', 7, 'change_user'),
(27, 'Can delete user', 7, 'delete_user'),
(28, 'Can view user', 7, 'view_user'),
(29, 'Can add classroom', 8, 'add_classroom'),
(30, 'Can change classroom', 8, 'change_classroom'),
(31, 'Can delete classroom', 8, 'delete_classroom'),
(32, 'Can view classroom', 8, 'view_classroom'),
(33, 'Can add teacher', 9, 'add_teacher'),
(34, 'Can change teacher', 9, 'change_teacher'),
(35, 'Can delete teacher', 9, 'delete_teacher'),
(36, 'Can view teacher', 9, 'view_teacher'),
(37, 'Can add student', 10, 'add_student'),
(38, 'Can change student', 10, 'change_student'),
(39, 'Can delete student', 10, 'delete_student'),
(40, 'Can view student', 10, 'view_student'),
(41, 'Can add topic', 11, 'add_topic'),
(42, 'Can change topic', 11, 'change_topic'),
(43, 'Can delete topic', 11, 'delete_topic'),
(44, 'Can view topic', 11, 'view_topic'),
(45, 'Can add assignment', 12, 'add_assignment'),
(46, 'Can change assignment', 12, 'change_assignment'),
(47, 'Can delete assignment', 12, 'delete_assignment'),
(48, 'Can view assignment', 12, 'view_assignment'),
(49, 'Can add submission', 13, 'add_submission'),
(50, 'Can change submission', 13, 'change_submission'),
(51, 'Can delete submission', 13, 'delete_submission'),
(52, 'Can view submission', 13, 'view_submission');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$390000$aZVEQLE4K0fj5Hixszlrc6$R58jF/e+tWq2Jc1swJ0WHsLz5DuGn+lso0z1nVxSTfA=', '2023-02-25 16:58:21.602226', 1, 'pritesh_2564u', '', '', 'priteshumraniya2564@gmail.com', 1, 1, '2023-02-25 16:57:59.244794');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `classapp_assignment`
--

CREATE TABLE `classapp_assignment` (
  `id` bigint(20) NOT NULL,
  `title` varchar(30) NOT NULL,
  `description` longtext NOT NULL,
  `points` int(11) NOT NULL,
  `assigned` date NOT NULL,
  `due` datetime(6) DEFAULT NULL,
  `classroom_id` bigint(20) NOT NULL,
  `slug` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `classapp_assignment`
--

INSERT INTO `classapp_assignment` (`id`, `title`, `description`, `points`, `assigned`, `due`, `classroom_id`, `slug`) VALUES
(1, 'lab 1', 'make DFD', 100, '2023-03-13', '2023-03-13 21:08:00.000000', 9, NULL),
(2, 'lab 1', 'make DFD', 100, '2023-03-13', '2023-03-13 21:08:00.000000', 9, NULL),
(3, 'Lab 2', 'make diagrams', 5, '2023-03-14', '2023-03-25 23:59:00.000000', 9, 'lab-2'),
(7, 'lab1', 'write c++ code', 10, '2023-03-17', '2023-03-17 23:59:00.000000', 9, 'lab1'),
(8, 'Lab3', 'write code for n queen\'s problem', 5, '2023-03-29', '2023-03-30 23:59:00.000000', 9, 'lab3'),
(9, 'Lab1', 'write code for making change and 0/1 knapsack problem', 20, '2023-03-29', '2023-04-25 23:59:00.000000', 11, 'lab1'),
(10, 'Lab2', 'write code for MFD problem', 10, '2023-03-29', '2023-03-29 11:29:00.000000', 11, 'lab2'),
(11, 'lab3', 'perform testing', 10, '2023-03-29', '2023-03-29 11:37:00.000000', 11, 'lab3'),
(12, 'lab4', 'write c++ code', 5, '2023-03-29', '2023-03-29 11:51:00.000000', 11, 'lab4'),
(13, 'lab1', 'write given notes', 5, '2023-03-29', '2023-03-29 13:58:00.000000', 12, 'lab1'),
(14, 'lab2', 'make diagrams', 5, '2023-03-30', '2023-03-30 10:30:00.000000', 12, 'lab2'),
(15, 'lab3', 'do the given work5', 5, '2023-03-30', '2023-03-30 17:37:00.000000', 12, 'lab3'),
(16, 'Lab1', 'Introduction to Django, write hello world program in django', 10, '2023-04-06', '2023-04-06 23:59:00.000000', 13, 'lab1');

-- --------------------------------------------------------

--
-- Table structure for table `classapp_classroom`
--

CREATE TABLE `classapp_classroom` (
  `id` bigint(20) NOT NULL,
  `class_name` varchar(50) NOT NULL,
  `room` varchar(20) NOT NULL,
  `subject_name` longtext NOT NULL,
  `join_code` varchar(7) NOT NULL,
  `owner_id` varchar(20) NOT NULL,
  `section` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `classapp_classroom`
--

INSERT INTO `classapp_classroom` (`id`, `class_name`, `room`, `subject_name`, `join_code`, `owner_id`, `section`) VALUES
(1, 'myclass', 'b', 'pps', 'bulmvbr', 'pritesh', 'one'),
(3, 'Myclass', 'B', 'PPS', 'idoifkb', 'jayesh', 'One'),
(4, 'Myclass', 'B', 'PPS', 'qcixgdl', 'jayesh', 'One'),
(5, 'Myclass', 'B', 'PPS', 'gtaynxl', 'jayesh', 'One'),
(6, 'Myclass', 'B', 'PPS', 'onbvfuz', 'jayesh', 'One'),
(7, 'Myclass', 'B', 'Physics', 'yzripbj', 'jayesh', 'two'),
(8, 'Myclass', 'c', 'math', 'ujkxiso', 'jayesh', 'h'),
(9, 'Physics Class', 'B', 'Physics', 'kotnxsv', 'pritesh', 'B'),
(10, 'Myclass', 'B', 'PPS', 'vavbcce', 'pritesh', 'One'),
(11, 'DAA_class', 'B', 'DAA', 'aaiymoy', 'pritesh', 'second'),
(12, 'chemistry_class', 'B', 'chemistry', 'bsxxroq', 'pritesh', 'one'),
(13, 'SP_class', 'One', 'Software Project', 'zbyqxjf', 'pritesh', 'B');

-- --------------------------------------------------------

--
-- Table structure for table `classapp_student`
--

CREATE TABLE `classapp_student` (
  `id` bigint(20) NOT NULL,
  `classroom_id` bigint(20) NOT NULL,
  `username_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `classapp_student`
--

INSERT INTO `classapp_student` (`id`, `classroom_id`, `username_id`) VALUES
(1, 9, 'jayesh'),
(2, 11, 'jayesh'),
(3, 12, 'jayesh'),
(4, 3, 'pritesh'),
(5, 11, 'jay'),
(6, 13, 'yash');

-- --------------------------------------------------------

--
-- Table structure for table `classapp_submission`
--

CREATE TABLE `classapp_submission` (
  `id` bigint(20) NOT NULL,
  `file` varchar(100) DEFAULT NULL,
  `assignment_id` bigint(20) NOT NULL,
  `username_id` varchar(20) NOT NULL,
  `submission_time` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `classapp_submission`
--

INSERT INTO `classapp_submission` (`id`, `file`, `assignment_id`, `username_id`, `submission_time`) VALUES
(1, '', 13, 'jayesh', NULL),
(2, '', 13, 'jayesh', NULL),
(3, '', 13, 'jayesh', NULL),
(4, '', 13, 'jayesh', NULL),
(5, '', 13, 'jayesh', NULL),
(6, '', 13, 'jayesh', NULL),
(7, '', 14, 'jayesh', NULL),
(8, '', 14, 'jayesh', NULL),
(9, '', 15, 'jayesh', NULL),
(10, 'submissions/SEP_Project.pdf', 15, 'jayesh', NULL),
(11, 'submissions/CE147_SEPP_LAB11.pdf', 15, 'jayesh', NULL),
(12, 'submissions/CE147_SEPP_LAB11_uH2ucb0.pdf', 15, 'jayesh', NULL),
(13, 'submissions/SEP_Project_qbYIgX3.pdf', 9, 'jayesh', NULL),
(14, 'submissions/SEP_Project_09sUBAC.pdf', 15, 'jayesh', NULL),
(15, 'submissions/11-Software_Testing-1.pdf', 12, 'jayesh', '2023-04-01 06:26:02.054200'),
(16, 'submissions/django_lab1.pdf', 16, 'yash', '2023-04-06 15:53:46.376840');

-- --------------------------------------------------------

--
-- Table structure for table `classapp_teacher`
--

CREATE TABLE `classapp_teacher` (
  `id` bigint(20) NOT NULL,
  `classroom_id` bigint(20) NOT NULL,
  `username_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `classapp_teacher`
--

INSERT INTO `classapp_teacher` (`id`, `classroom_id`, `username_id`) VALUES
(1, 7, 'jayesh'),
(2, 8, 'jayesh'),
(3, 9, 'pritesh'),
(4, 10, 'pritesh'),
(5, 11, 'pritesh'),
(6, 12, 'pritesh'),
(7, 13, 'pritesh');

-- --------------------------------------------------------

--
-- Table structure for table `classapp_topic`
--

CREATE TABLE `classapp_topic` (
  `id` bigint(20) NOT NULL,
  `assignment_id` bigint(20) DEFAULT NULL,
  `files` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `classapp_topic`
--

INSERT INTO `classapp_topic` (`id`, `assignment_id`, `files`) VALUES
(1, 12, 'documents/selenium_testing.docx'),
(2, 13, 'media/selenium_testing.docx'),
(3, 14, 'media/SEP_Project.pdf'),
(4, 15, 'media/SEP_Project_x8hWJau.pdf'),
(5, 16, 'media/Django_Framwework.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `classapp_user`
--

CREATE TABLE `classapp_user` (
  `username` varchar(20) NOT NULL,
  `p_name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `classapp_user`
--

INSERT INTO `classapp_user` (`username`, `p_name`, `email`, `password`) VALUES
('jay', 'Jay', 'jay@gmail.com', 'jay'),
('jayesh', 'Jayeshbhai', 'jayesh@gmail.com', 'jayesh'),
('pritesh', 'Pritesh', 'pritesh@gmail.com', 'pritesh'),
('yash', 'Yash', 'yash@gmail.com', 'yash');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(12, 'classapp', 'assignment'),
(8, 'classapp', 'classroom'),
(10, 'classapp', 'student'),
(13, 'classapp', 'submission'),
(9, 'classapp', 'teacher'),
(11, 'classapp', 'topic'),
(7, 'classapp', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-02-25 16:46:42.045903'),
(2, 'auth', '0001_initial', '2023-02-25 16:46:42.292549'),
(3, 'admin', '0001_initial', '2023-02-25 16:46:42.373366'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-02-25 16:46:42.398525'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-02-25 16:46:42.415187'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-02-25 16:46:42.464008'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-02-25 16:46:42.504989'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-02-25 16:46:42.521391'),
(9, 'auth', '0004_alter_user_username_opts', '2023-02-25 16:46:42.529455'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-02-25 16:46:42.564945'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-02-25 16:46:42.571118'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-02-25 16:46:42.587633'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-02-25 16:46:42.604030'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-02-25 16:46:42.630464'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-02-25 16:46:42.645726'),
(16, 'auth', '0011_update_proxy_permissions', '2023-02-25 16:46:42.654244'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-02-25 16:46:42.680158'),
(18, 'classapp', '0001_initial', '2023-02-25 16:46:42.697259'),
(19, 'sessions', '0001_initial', '2023-02-25 16:46:42.726086'),
(20, 'classapp', '0002_rename_usename_user_username', '2023-02-26 11:30:41.511293'),
(21, 'classapp', '0003_rename_name_user_p_name_alter_user_table', '2023-02-28 15:59:41.521400'),
(22, 'classapp', '0004_alter_user_email', '2023-03-02 16:41:03.385748'),
(23, 'classapp', '0005_class', '2023-03-03 05:30:49.375184'),
(24, 'classapp', '0006_classroom_student_teacher_delete_class', '2023-03-03 05:30:49.678662'),
(25, 'classapp', '0007_classroom_section', '2023-03-03 05:56:25.240334'),
(26, 'classapp', '0008_rename_username_classroom_owner_and_more', '2023-03-03 06:22:57.047686'),
(27, 'classapp', '0009_alter_classroom_owner', '2023-03-03 06:33:52.765436'),
(28, 'classapp', '0010_alter_classroom_owner', '2023-03-03 06:36:29.113296'),
(29, 'classapp', '0011_topic_assignment', '2023-03-13 12:56:40.070198'),
(30, 'classapp', '0012_assignment_slug', '2023-03-14 13:02:24.848955'),
(31, 'classapp', '0013_assignment_files', '2023-03-28 17:01:19.802477'),
(32, 'classapp', '0014_remove_assignment_files_remove_topic_classroom_and_more', '2023-03-29 05:09:56.502759'),
(33, 'classapp', '0015_alter_topic_files', '2023-03-29 06:48:04.272627'),
(34, 'classapp', '0016_alter_assignment_table_alter_student_table_and_more', '2023-03-29 10:32:34.737081'),
(35, 'classapp', '0017_submission', '2023-03-30 09:34:30.627908'),
(36, 'classapp', '0018_alter_submission_file_alter_submission_table', '2023-03-30 12:03:48.102840'),
(37, 'classapp', '0019_submission_submission_time', '2023-03-31 05:19:52.062450');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('50wzhxyb2u4tr7o82cfl1b8rjkiffm69', 'e30:1piUEx:K1bD3yrBTjm8_SnY4bg7G0uCq6Fm-B_jtV9T1u8HcIg', '2023-04-15 05:57:27.605438'),
('tcujuz3ostqc008wu985uxejm08qbhtb', '.eJxVjsEKgzAQRP8l5xISTXTtqfTeb5BNsjFajWD0UEr_vQl4aGFZmJ2Zx75Zj8ce-iPR1o-OXZlkl9-bQfukWAw3YRxWbte4b6PhJcJPN_HH6mi-n9k_QMAUctto7WqQgJXweasWydiWmsYiCfB5PLS1d6BMR7WCSqHSwjjVSfBSU4bSguOcURO-KIXbUGR-Z2GfL1ImQUI:1pkRzB:DLWkE79rDlAPhDITi970kwXgZQjcEFKq7MkpxFV01JI', '2023-04-20 15:57:17.343319');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `classapp_assignment`
--
ALTER TABLE `classapp_assignment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `classapp_assignment_classroom_id_688ea20b_fk_classapp_` (`classroom_id`),
  ADD KEY `classapp_assignment_slug_8b7251fb` (`slug`);

--
-- Indexes for table `classapp_classroom`
--
ALTER TABLE `classapp_classroom`
  ADD PRIMARY KEY (`id`),
  ADD KEY `classapp_classroom_owner_id_2cb2c00f_fk_classapp_user_username` (`owner_id`);

--
-- Indexes for table `classapp_student`
--
ALTER TABLE `classapp_student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `classapp_student_classroom_id_1a692375_fk_classapp_classroom_id` (`classroom_id`),
  ADD KEY `classapp_student_username_id_48936529_fk_classapp_user_username` (`username_id`);

--
-- Indexes for table `classapp_submission`
--
ALTER TABLE `classapp_submission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `classapp_submission_assignment_id_af1c6572_fk_classapp_` (`assignment_id`),
  ADD KEY `classapp_submission_username_id_0bb5c6a2_fk_classapp_` (`username_id`);

--
-- Indexes for table `classapp_teacher`
--
ALTER TABLE `classapp_teacher`
  ADD PRIMARY KEY (`id`),
  ADD KEY `classapp_teacher_classroom_id_4405533a_fk_classapp_classroom_id` (`classroom_id`),
  ADD KEY `classapp_teacher_username_id_c2408067_fk_classapp_user_username` (`username_id`);

--
-- Indexes for table `classapp_topic`
--
ALTER TABLE `classapp_topic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `classapp_topic_assignment_id_c4344cc2_fk_classapp_assignment_id` (`assignment_id`);

--
-- Indexes for table `classapp_user`
--
ALTER TABLE `classapp_user`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `classapp_user_email_00db7439_uniq` (`email`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `classapp_assignment`
--
ALTER TABLE `classapp_assignment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `classapp_classroom`
--
ALTER TABLE `classapp_classroom`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `classapp_student`
--
ALTER TABLE `classapp_student`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `classapp_submission`
--
ALTER TABLE `classapp_submission`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `classapp_teacher`
--
ALTER TABLE `classapp_teacher`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `classapp_topic`
--
ALTER TABLE `classapp_topic`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `classapp_assignment`
--
ALTER TABLE `classapp_assignment`
  ADD CONSTRAINT `classapp_assignment_classroom_id_688ea20b_fk_classapp_` FOREIGN KEY (`classroom_id`) REFERENCES `classapp_classroom` (`id`);

--
-- Constraints for table `classapp_classroom`
--
ALTER TABLE `classapp_classroom`
  ADD CONSTRAINT `classapp_classroom_owner_id_2cb2c00f_fk_classapp_user_username` FOREIGN KEY (`owner_id`) REFERENCES `classapp_user` (`username`);

--
-- Constraints for table `classapp_student`
--
ALTER TABLE `classapp_student`
  ADD CONSTRAINT `classapp_student_classroom_id_1a692375_fk_classapp_classroom_id` FOREIGN KEY (`classroom_id`) REFERENCES `classapp_classroom` (`id`),
  ADD CONSTRAINT `classapp_student_username_id_48936529_fk_classapp_user_username` FOREIGN KEY (`username_id`) REFERENCES `classapp_user` (`username`);

--
-- Constraints for table `classapp_submission`
--
ALTER TABLE `classapp_submission`
  ADD CONSTRAINT `classapp_submission_assignment_id_af1c6572_fk_classapp_` FOREIGN KEY (`assignment_id`) REFERENCES `classapp_assignment` (`id`),
  ADD CONSTRAINT `classapp_submission_username_id_0bb5c6a2_fk_classapp_` FOREIGN KEY (`username_id`) REFERENCES `classapp_user` (`username`);

--
-- Constraints for table `classapp_teacher`
--
ALTER TABLE `classapp_teacher`
  ADD CONSTRAINT `classapp_teacher_classroom_id_4405533a_fk_classapp_classroom_id` FOREIGN KEY (`classroom_id`) REFERENCES `classapp_classroom` (`id`),
  ADD CONSTRAINT `classapp_teacher_username_id_c2408067_fk_classapp_user_username` FOREIGN KEY (`username_id`) REFERENCES `classapp_user` (`username`);

--
-- Constraints for table `classapp_topic`
--
ALTER TABLE `classapp_topic`
  ADD CONSTRAINT `classapp_topic_assignment_id_c4344cc2_fk_classapp_assignment_id` FOREIGN KEY (`assignment_id`) REFERENCES `classapp_assignment` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
