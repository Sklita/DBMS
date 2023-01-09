-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3399:3399
-- Generation Time: Jan 09, 2023 at 05:48 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bbdms`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `in_donor` (IN `fullname` VARCHAR(100), IN `mobile` CHAR(11), IN `email` VARCHAR(100), IN `age` INT(11), IN `donation` VARCHAR(20), IN `donationgroup` VARCHAR(20), IN `address` VARCHAR(255), IN `message` MEDIUMTEXT, IN `status` INT(1), IN `password` VARCHAR(250), IN `pathless` VARCHAR(400))   BEGIN
	INSERT INTO  tbldonars(FullName,MobileNumber,EmailId,Age,Donation,DonationGroup,Address,Message,status,Password,pathless) VALUES(fullname,mobile,email,age,donation,donationgroup,address,message,status,password,pathless);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `dis_don`
-- (See below for the actual view)
--
CREATE TABLE `dis_don` (
`id` int(11)
,`FullName` varchar(100)
,`MobileNumber` char(11)
,`EmailId` varchar(100)
,`Age` int(11)
,`Donation` varchar(20)
,`DonationGroup` varchar(20)
,`Address` varchar(255)
,`Message` mediumtext
,`status` int(1)
,`PostingDate` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `donar_det`
-- (See below for the actual view)
--
CREATE TABLE `donar_det` (
`id` int(11)
,`FullName` varchar(100)
,`MobileNumber` char(11)
,`EmailId` varchar(100)
,`Donation` varchar(20)
,`DonationGroup` varchar(20)
,`Address` varchar(255)
,`Message` mediumtext
,`status` int(1)
,`PostingDate` timestamp
,`pathless` varchar(400)
);

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `ID` int(10) NOT NULL,
  `AdminName` varchar(120) DEFAULT NULL,
  `UserName` varchar(120) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `Password` varchar(200) DEFAULT NULL,
  `AdminRegdate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`ID`, `AdminName`, `UserName`, `MobileNumber`, `Email`, `Password`, `AdminRegdate`) VALUES
(1, 'Admin', 'admin', 8979555558, 'admin@gmail.com', 'f925916e2754e5e03f75dd58a5733251', '2022-07-28 04:36:52');

-- --------------------------------------------------------

--
-- Table structure for table `tblcontactusinfo`
--

CREATE TABLE `tblcontactusinfo` (
  `id` int(11) NOT NULL,
  `Address` tinytext DEFAULT NULL,
  `EmailId` varchar(255) DEFAULT NULL,
  `ContactNo` char(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcontactusinfo`
--

INSERT INTO `tblcontactusinfo` (`id`, `Address`, `EmailId`, `ContactNo`) VALUES
(1, 'Donate Excess Management System , opposite to Akshaya Super Market 571235																						', 'donation@gmail.com', '9632587419');

-- --------------------------------------------------------

--
-- Table structure for table `tblcontactusquery`
--

CREATE TABLE `tblcontactusquery` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `EmailId` varchar(120) DEFAULT NULL,
  `ContactNumber` char(11) DEFAULT NULL,
  `Message` longtext DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcontactusquery`
--

INSERT INTO `tblcontactusquery` (`id`, `name`, `EmailId`, `ContactNumber`, `Message`, `PostingDate`, `status`) VALUES
(11, 'Sahana', 'sahana@gmail.com', '2365897412', 'I want to help people ', '2022-12-21 09:22:04', 1),
(12, 'Aditya ', 'aditya@gmail.com', '876549125', 'I would like to help people by volunteering with organization ', '2022-12-22 06:56:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbldeletion`
--

CREATE TABLE `tbldeletion` (
  `ID` int(10) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `EmailId` varchar(250) DEFAULT NULL,
  `ContactNumber` bigint(10) DEFAULT NULL,
  `deletefor` varchar(250) DEFAULT NULL,
  `hideordelete` varchar(250) DEFAULT NULL,
  `Message` mediumtext DEFAULT NULL,
  `ApplyDate` timestamp NULL DEFAULT current_timestamp(),
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbldeletion`
--

INSERT INTO `tbldeletion` (`ID`, `name`, `EmailId`, `ContactNumber`, `deletefor`, `hideordelete`, `Message`, `ApplyDate`, `status`) VALUES
(17, 'Alan', 'alan@gmail.com', 7896541223, 'No more Donation Available', 'DeleteMyAccount', 'mskskjs', '2022-12-15 11:56:37', 0),
(18, 'Alex', 'alex@gmail.com', 7899655441, 'Others', 'DeleteMyAccount', 'kskjk', '2022-12-15 12:30:57', 0),
(19, 'Bob', 'bob@gmail.com', 7896541223, 'Donated', 'DeleteMyAccount', 'kkkkkkk', '2022-12-15 13:04:43', 1),
(20, 'walter', 'walter@gmail.com', 7896541239, 'No more Donation Available', 'unhideMyaccount', 'fdfgfgh', '2023-01-09 16:42:31', 0);

--
-- Triggers `tbldeletion`
--
DELIMITER $$
CREATE TRIGGER `deletion` AFTER DELETE ON `tbldeletion` FOR EACH ROW DELETE FROM tbldonars WHERE FullName=OLD.name
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `up_profile` AFTER UPDATE ON `tbldeletion` FOR EACH ROW UPDATE tbldonars SET tbldonars.status=new.status where tbldonars.FullName=new.name
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbldonars`
--

CREATE TABLE `tbldonars` (
  `id` int(11) NOT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `MobileNumber` char(11) DEFAULT NULL,
  `EmailId` varchar(100) DEFAULT NULL,
  `Donation` varchar(20) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `DonationGroup` varchar(20) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Message` mediumtext DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(1) DEFAULT NULL,
  `Password` varchar(250) DEFAULT NULL,
  `pathless` varchar(400) NOT NULL DEFAULT 'donor.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbldonars`
--

INSERT INTO `tbldonars` (`id`, `FullName`, `MobileNumber`, `EmailId`, `Donation`, `Age`, `DonationGroup`, `Address`, `Message`, `PostingDate`, `status`, `Password`, `pathless`) VALUES
(6, 'Ashu Misra', '7797987981', 'ashu@gmail.com', 'Student Calculator ', 35, 'Gadgets', 'H-900, Ravinderpuri colony, Varanasi', ' Call me if Calculators are required I have 2 extra Calculators', '2022-05-17 12:43:41', 0, '202cb962ac59075b964b07152d234b70', 'donor.jpg'),
(11, 'Amit Kumar', '1231231230', 'amitk@gmail.com', 'Notes', 26, 'Books', 'ABc Street Sector 20 Noida UP', 'Books for creating notes one dozen classmate books', '2022-08-02 01:22:52', 1, 'f925916e2754e5e03f75dd58a5733251', 'th.jpg'),
(12, 'Riya', '8523697413', 'riya@gmail.com', 'Sweaters ', 32, 'Clothes', 'saraswathipuram mysore', ' I would like to donate the Sweaters for old age homes.', '2022-11-17 03:53:33', 1, 'e7505d0ab0f63e08810f6000a5f37ae9', 'donor.jpg'),
(15, 'Aishu', '9988776655', 'aishu@gmail.com', 'BE Math Text', 26, 'Stationary', 'Mysore', ' I would like to donate engineering mathematics m1,2,3,4 books for needy ', '2022-11-21 16:01:44', 1, 'f598f436f5a2bb404404acd8568526fb', '1.jpeg'),
(16, 'ambani', '7856941239', 'ambani@gmail.com', 'Computers', 59, 'Gadgets', 'Mumbai', ' I want to help needy engineering students', '2022-11-23 11:15:02', 1, 'f454c7b96c33c5946d120e2e88330d52', 'donor.jpg'),
(17, 'Alex', '9632145879', 'alex@gmail.com', 'Cooker and Grinder', 30, 'Vessels', 'Bengaluru', ' I want to donate the vessels for ashramas ', '2022-11-24 11:49:44', 0, 'b7e6124aeffd2498bdb4fb8c525c6ea3', 'donor.jpg'),
(19, 'Saniya', '7856491239', 'saniya@gmail.com', 'Sweaters for needy ', 28, 'Clothes', 'Mangalore', ' I want to donate clothes like sweaters and jackets for needy ', '2022-11-29 06:21:27', 1, 'a0260154fe07352e36d3a432df569ad9', 'don.jpg'),
(20, 'Bob', '1236547899', 'bob@gmail.com', 'Packed food ', 30, 'Food', 'Hubli Karnataka ', ' I want to donate packed food for needy ', '2022-11-29 06:25:24', 1, '5dda79243ec39dbdf6dd58b136149a08', 'donor.jpg'),
(28, 'Alan', '9874563321', 'alan@gmail.com', 'Sweaters ', 33, 'Clothes', 'Kuvempunagar mysore ', ' I want to donate sweaters to needy ', '2022-12-15 11:55:22', 0, '0541c626be6852ab369f571e974a7b30', 'donor.jpg'),
(29, 'Ramya', '9865471236', 'ramya@gmail.com', 'Blankets ', 36, 'Clothes', 'Banashankari Bangalore', ' I want to donate Blankets for needy ', '2023-01-02 15:39:33', 1, '40799c8e6e6abfffc45c40e5b3766bbb', 'donor.jpg'),
(30, 'Catherine ', '7896541236', 'catherine@gmail.com', 'Sweaters', 26, 'Clothes', 'JP nagar Mysore', ' I want to for needy ', '2023-01-03 04:56:20', 1, '541fa46ad074a573ca5e20bb4938c951', 'donor.jpg'),
(32, 'Daisy ', '8563214799', 'daisy@gmail.com', 'Preservable Food Ite', 35, 'Food', 'BEML Layout Srirampura Mysore', ' I would like to donate food items like biscuits , cookies which can preserved for needy ', '2023-01-04 06:58:33', 1, '264d54b1a203a5e5f29d4f6a34d85406', 'donor.jpg'),
(33, 'veena', '5987455666', 'veena@gmail.com', 'Food Groceries ', 55, 'Food', 'saraswathipuram mysore', ' iofjdhg ffhyrhyyjhjj', '2023-01-05 09:58:36', 1, 'ea0ae65534382b9c10df88bb15bb09a7', 'donor.jpg'),
(34, 'Meena', '7896541221', 'meena@gmail.com', 'Blankets ', 32, 'Clothes', 'Mumbai', ' hnffggffgnvfhm', '2023-01-05 10:10:56', 1, 'd2a853ab54c012a838d15888284f3aa0', 'donor.jpg'),
(36, 'Irani', '7845123698', 'irani@gmail.com', 'Jackets', 32, 'Clothes', 'JP nagar Mysore', ' gshkuhisxddhxil', '2023-01-05 11:07:32', 1, '4424379e29872eb53b15f42c02509986', 'donor.jpg'),
(37, 'Lavina ', '9874563327', 'lavina@gmail.com', 'Vessels', 27, 'Vessels', 'Kuvempunagar mysore ', ' i want to donate to needy ', '2023-01-06 07:22:22', 1, '9ee39afad73fcf4eb014397adfea4c04', 'donor.jpg'),
(38, 'lidiya', '9874563328', 'lidiya@123', 'Books', 26, 'Stationary', 'Kuvempunagar mysore ', ' i want to donate to needy', '2023-01-06 07:38:49', 1, 'e553e6255db879149ffd885bed674f36', 'donor.jpg'),
(39, 'pearl', '9874563326', 'pearl@gmail.com', 'Computer ', 23, 'Gadgets', 'Moodbire Mangalore', ' I want to donate to needy', '2023-01-06 07:42:41', 1, '02a0a6727211b3d98acccda63a2dedde', 'donor.jpg'),
(40, 'Prishal', '9874563355', 'prishal@gmail.com', 'Tablets', 20, 'Gadgets', 'Moodbire Mangalore', ' I want to donate for needy ', '2023-01-06 07:48:24', 1, 'dcea04dd5c7087e66705459bc39cae12', 'donor.jpg'),
(41, 'wilson', '6789456999', 'wilson@gmail.com', 'blankets', 28, 'Clothes', 'Kuvempunagar mysore ', ' i iiiooo', '2023-01-06 08:34:09', 1, 'fae48cf6ed26dafe2437a28660d87448', 'donor.jpg'),
(42, 'Esthela', '9874563789', 'esthela@gmail.com', 'Tshirts', 59, 'Clothes', 'Kuvempunagar mysore ', ' i want to donate to needy ', '2023-01-07 08:54:41', 1, '8c0b4ec133fa0bb40ad649b242cd184a', 'donor.jpg'),
(43, 'sanjana', '9874563445', 'sanjana@gmail.com', 'Sweaters ', 23, 'Clothes', 'Kuvempunagar mysore ', ' i jsjksk', '2023-01-07 09:27:47', 1, '70d8a10e2de6384a70dd67ab812f089d', 'donor.jpg'),
(44, 'Reshu', '6789456988', 'reshu@gmail.com', 'Computer ', 26, 'Gadgets', 'Kuvempunagar mysore ', ' bbkjb', '2023-01-07 10:00:36', 1, 'bce4a030c154a06b7ea0e2dfd581ff1a', 'Cartoon-DP-Boy-2.jpeg'),
(45, 'walter', '9874563326', 'walter@gmail.com', 'Note Book', 20, 'Stationary', 'BEML Mysore', 'I want to donate for needy students ', '2023-01-07 10:47:01', 0, '146511e738d09f93d3729a07fbcb3158', 'donor.jpg'),
(46, 'reena', '9874563328', 'reena@gmail.com', 'footwear', 55, 'Footwear', 'BEML Mysore', ' fsdxf', '2023-01-07 11:01:50', 1, 'aea66b01fcdd00b37c56865f3e788a8b', 'donor.jpg'),
(47, 'praveen', '8563214799', 'praveen@gmail.com', 'School shoe', 32, 'Footwear', 'Raja Rajeshwari Nagar Bangalore', ' iftgfgfgf', '2023-01-08 13:13:36', 1, 'e16505be66870f2c0a5a58d282d82d63', 'profile boy.jpg'),
(48, 'Preema', '8794563225', 'preema@gmail.com', 'Sarees ', 32, 'Clothes', 'Gokulam Mysore', ' I want to donate sarees for needy women ', '2023-01-08 13:17:06', 1, 'f0b6af22cccef0d0032a6d885d5715eb', 'profile women.jpg'),
(49, 'violet', '9758463256', 'violet@gmail.com', 'Food Groceries ', 30, 'Food', 'Gokulam Mysore', ' hkxkhjxsf', '2023-01-08 13:20:23', 1, '07c6ad753e8e2f5458e35908f57c2bee', 'girl.jpg');

--
-- Triggers `tbldonars`
--
DELIMITER $$
CREATE TRIGGER `deldon` AFTER DELETE ON `tbldonars` FOR EACH ROW DELETE FROM tblrequirer WHERE tblrequirer.DonarID=OLD.id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tblgroup`
--

CREATE TABLE `tblgroup` (
  `id` int(11) NOT NULL,
  `DonationGroup` varchar(20) DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblgroup`
--

INSERT INTO `tblgroup` (`id`, `DonationGroup`, `PostingDate`) VALUES
(8, 'Food', '2022-11-17 03:34:30'),
(9, 'Gadgets', '2022-11-17 03:34:37'),
(10, 'Stationary', '2022-11-17 03:34:46'),
(11, 'Vessels', '2022-11-17 03:34:54'),
(12, 'Footwear', '2022-11-17 03:35:03'),
(13, 'Clothes', '2022-11-17 03:35:28');

-- --------------------------------------------------------

--
-- Table structure for table `tblpages`
--

CREATE TABLE `tblpages` (
  `id` int(11) NOT NULL,
  `PageName` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT '',
  `detail` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblpages`
--

INSERT INTO `tblpages` (`id`, `PageName`, `type`, `detail`) VALUES
(2, 'Why Become Volunteer', 'Volunteer', '																				<span style=\"color: rgb(0, 0, 0); font-family: &quot;Nunito Sans&quot;, sans-serif; font-size: 18px;\">Volunteering means giving your time and abilities to aid others (usually a nonprofit organization) without the want of financial compensation. Put simply, volunteering is a service to your community.</span><div><span style=\"color: rgb(0, 0, 0); font-family: &quot;Nunito Sans&quot;, sans-serif; font-size: 18px;\"><br></span></div><div><span style=\"color: rgb(0, 0, 0); font-family: &quot;Nunito Sans&quot;, sans-serif; font-size: 18px;\">Your Gains...<br></span><div><span style=\"color: rgb(0, 0, 0); font-family: &quot;Nunito Sans&quot;, sans-serif; font-size: 18px;\"><br></span><div><div style=\"\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Nunito Sans&quot;, sans-serif; font-size: 18px;\">Meet New People and Build Community</span></div><div style=\"\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Nunito Sans&quot;, sans-serif; font-size: 18px;\">Gain Knowledge and Understanding of Other Ways of Life</span></div><div style=\"\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Nunito Sans&quot;, sans-serif; font-size: 18px;\">Gain a Sense of Purpose and Become Happier</span></div><div style=\"\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Nunito Sans&quot;, sans-serif; font-size: 18px;\">Boost Your Self-Esteem</span></div><div style=\"\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Nunito Sans&quot;, sans-serif; font-size: 18px;\">Accrue the Health Benefits of Volunteering</span></div><div style=\"\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Nunito Sans&quot;, sans-serif; font-size: 18px;\"><br></span></div><div style=\"color: rgb(0, 0, 0); font-family: &quot;Nunito Sans&quot;, sans-serif; font-size: 18px;\"><br></div><div><h3 style=\"box-sizing: inherit; font-size: 27.5px; font-weight: 600; color: rgb(13, 140, 151); font-family: &quot;Open Sans Condensed&quot;; line-height: 1.2; margin-top: 8px !important; margin-bottom: 15px !important;\"><br></h3></div><div><br></div>\r\n										\r\n										</div></div></div>'),
(3, 'About Us ', 'aboutus', '																														<div style=\"text-align: justify;\"><span style=\"font-size: 1em; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">&nbsp; &nbsp; &nbsp;<span style=\"font-weight: bold;\"> Welcome to the&nbsp;</span></span><span style=\"font-weight: bold;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Donate Excess Management System</span><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 1em;\">&nbsp;donor management system.</span></span></div><div style=\"text-align: justify;\"><p class=\"MsoNormal\" style=\"margin: 0cm 21.6pt 8pt 13.5pt; line-height: 150%;\"><span lang=\"EN-US\" style=\"font-size:12.0pt;line-height:150%;font-family:&quot;Times New Roman&quot;,serif\">“Donation\r\nManagement” is the online information and donor seeker connectivity provider\r\nwebsite that lets you know about the number of donors, donation type, location\r\nof the donor at the tip of the needy one. <o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"margin: 0cm 21.6pt 8pt 13.5pt; line-height: 150%;\"><span lang=\"EN-US\" style=\"font-size:12.0pt;line-height:150%;font-family:&quot;Times New Roman&quot;,serif\">Any\r\nseekers can easily search for the particular donation based on donor name,\r\nlocation, donation categories, donation group and location put together.<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"margin: 0cm 21.6pt 8pt 13.5pt; line-height: 150%;\"><span lang=\"EN-US\" style=\"font-size:12.0pt;line-height:150%;font-family:&quot;Times New Roman&quot;,serif\">The\r\nrequirer can directly send the request to the donor without middle man and\r\nadmin can directly accesses all details about donor, manage pages of website.&nbsp;<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin: 0cm 21.6pt 8pt 13.5pt; line-height: 150%;\"><span lang=\"EN-US\" style=\"font-size:12.0pt;line-height:150%;font-family:&quot;Times New Roman&quot;,serif\"><img src=\"https://3.files.edl.io/a42c/20/01/08/212738-6bffe973-3738-4299-8f07-f9ee554d2e05.jpg\" alt=\"Something went wrong\" align=\"none\"><br></span></p></div><div style=\"text-align: justify;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 1em;\"><br></span></div><div style=\"text-align: justify;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 1em;\"><br></span></div>\r\n										\r\n										\r\n										');

-- --------------------------------------------------------

--
-- Table structure for table `tblrequirer`
--

CREATE TABLE `tblrequirer` (
  `ID` int(10) NOT NULL,
  `DonarID` int(10) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `EmailId` varchar(250) DEFAULT NULL,
  `ContactNumber` bigint(10) DEFAULT NULL,
  `Requirefor` varchar(250) DEFAULT NULL,
  `Message` mediumtext DEFAULT NULL,
  `ApplyDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblrequirer`
--

INSERT INTO `tblrequirer` (`ID`, `DonarID`, `name`, `EmailId`, `ContactNumber`, `Requirefor`, `Message`, `ApplyDate`) VALUES
(7, 14, 'xyz', 'xyz@gmail.com', 9856321145, 'Others', 'I want for orphange', '2022-11-17 09:53:44'),
(9, 13, 'sahana', 'sahana@gmail.com', 2365987412, 'Orphanage', 'for orphans', '2022-11-23 11:11:02'),
(10, 17, 'sadana', 'sadana@gmail.com', 7896541239, 'Others', 'I want vessels to donate for neighbor\'s who require this ', '2022-11-24 12:05:58'),
(11, 18, 'sahana', 'sahana@gmail.com', 1236547891, 'Personal Usage', 'I want these books for my studies I\'m a student it would be helpful if you can give me this ', '2022-11-26 07:16:23'),
(12, 26, 'susheela', 'susheela@gmail.com', 1236547888, 'Personal Usage', 'I need this please ', '2022-12-10 05:47:49'),
(14, 12, 'preethi', 'preethi@gamil.com', 78965412336, 'Others', 'I want This ', '2022-12-11 04:39:33'),
(15, 20, 'leena', 'leena@gmail.com', 1487523699, 'Personal Usage', 'mmmmm', '2022-12-17 05:27:15'),
(17, 20, 'harshitha ', 'harshitha@gmail.com', 8456328791, 'Needy Ones', 'i want this for people who work for construction ', '2023-01-02 14:38:39');

-- --------------------------------------------------------

--
-- Structure for view `dis_don`
--
DROP TABLE IF EXISTS `dis_don`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dis_don`  AS SELECT `tbldonars`.`id` AS `id`, `tbldonars`.`FullName` AS `FullName`, `tbldonars`.`MobileNumber` AS `MobileNumber`, `tbldonars`.`EmailId` AS `EmailId`, `tbldonars`.`Age` AS `Age`, `tbldonars`.`Donation` AS `Donation`, `tbldonars`.`DonationGroup` AS `DonationGroup`, `tbldonars`.`Address` AS `Address`, `tbldonars`.`Message` AS `Message`, `tbldonars`.`status` AS `status`, `tbldonars`.`PostingDate` AS `PostingDate` FROM `tbldonars``tbldonars`  ;

-- --------------------------------------------------------

--
-- Structure for view `donar_det`
--
DROP TABLE IF EXISTS `donar_det`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `donar_det`  AS SELECT `tbldonars`.`id` AS `id`, `tbldonars`.`FullName` AS `FullName`, `tbldonars`.`MobileNumber` AS `MobileNumber`, `tbldonars`.`EmailId` AS `EmailId`, `tbldonars`.`Donation` AS `Donation`, `tbldonars`.`DonationGroup` AS `DonationGroup`, `tbldonars`.`Address` AS `Address`, `tbldonars`.`Message` AS `Message`, `tbldonars`.`status` AS `status`, `tbldonars`.`PostingDate` AS `PostingDate`, `tbldonars`.`pathless` AS `pathless` FROM `tbldonars``tbldonars`  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblcontactusinfo`
--
ALTER TABLE `tblcontactusinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcontactusquery`
--
ALTER TABLE `tblcontactusquery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbldeletion`
--
ALTER TABLE `tbldeletion`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbldonars`
--
ALTER TABLE `tbldonars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblgroup`
--
ALTER TABLE `tblgroup`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `DonationGroup` (`DonationGroup`);

--
-- Indexes for table `tblpages`
--
ALTER TABLE `tblpages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblrequirer`
--
ALTER TABLE `tblrequirer`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblcontactusinfo`
--
ALTER TABLE `tblcontactusinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblcontactusquery`
--
ALTER TABLE `tblcontactusquery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbldeletion`
--
ALTER TABLE `tbldeletion`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tbldonars`
--
ALTER TABLE `tbldonars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `tblgroup`
--
ALTER TABLE `tblgroup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tblpages`
--
ALTER TABLE `tblpages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tblrequirer`
--
ALTER TABLE `tblrequirer`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`root`@`localhost` EVENT `event_name` ON SCHEDULE EVERY 1 DAY STARTS '2023-01-03 14:13:36' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
UPDATE tbldonars set STATUS=0 where DonationGroup='Food' and PostingDate-NOW()>15;
END$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
