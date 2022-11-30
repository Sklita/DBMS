-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3399:3399
-- Generation Time: Nov 30, 2022 at 11:32 AM
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
(1, 'Donate Excess Management System , opposite to Akshaya Super Market 571235																						', 'test@test.com', '9632587419');

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
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcontactusquery`
--

INSERT INTO `tblcontactusquery` (`id`, `name`, `EmailId`, `ContactNumber`, `Message`, `PostingDate`, `status`) VALUES
(8, 'priya', 'priya@gmail.com', '985632478', 'I want to volunteer and help people', '2022-11-23 10:33:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbldeletion`
--

CREATE TABLE `tbldeletion` (
  `ID` int(10) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `EmailId` varchar(250) DEFAULT NULL,
  `ContactNumber` bigint(10) DEFAULT NULL,
  `deletefor` varchar(250) DEFAULT NULL,
  `hideordelete` varchar(250) DEFAULT NULL,
  `Message` mediumtext DEFAULT NULL,
  `ApplyDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbldeletion`
--

INSERT INTO `tbldeletion` (`ID`, `name`, `EmailId`, `ContactNumber`, `deletefor`, `hideordelete`, `Message`, `ApplyDate`) VALUES
(8, 'priya', 'priya@gmail.com', 9312524698, 'Others', 'Hide', 'I BBB', '2022-11-30 10:24:27');

-- --------------------------------------------------------

--
-- Table structure for table `tbldonars`
--

CREATE TABLE `tbldonars` (
  `id` int(11) NOT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `MobileNumber` char(11) DEFAULT NULL,
  `EmailId` varchar(100) DEFAULT NULL,
  `Gender` varchar(20) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `DonationGroup` varchar(20) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Message` mediumtext DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(1) DEFAULT NULL,
  `Password` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbldonars`
--

INSERT INTO `tbldonars` (`id`, `FullName`, `MobileNumber`, `EmailId`, `Gender`, `Age`, `DonationGroup`, `Address`, `Message`, `PostingDate`, `status`, `Password`) VALUES
(6, 'Ashu Misra', '7797987981', 'ashu@gmail.com', 'Student Calculator ', 35, 'Gadgets', 'H-900, Ravinderpuri colony, Varanasi', ' Call me if Calculators are required I have 2 extra Calculators', '2022-05-17 12:43:41', 1, '202cb962ac59075b964b07152d234b70'),
(9, 'Test Demo', '9789797979', 'test@gmail.com', 'Mugs Vessels', 56, 'Vessels', 'Allahabad', ' gjhgjhgjhghjghj', '2022-05-21 06:09:08', 1, '202cb962ac59075b964b07152d234b70'),
(10, 'John Doe', '1236547890', 'johnd@gmail.com', 'Sports Shoes', 25, 'Footwear', 'A 5623 XYZ Street New Delhi', 'Footwear for needy sports students , new one of size 7', '2022-07-29 01:50:58', 1, 'f925916e2754e5e03f75dd58a5733251'),
(11, 'Amit Kumar', '1231231230', 'amitk@gmail.com', 'Notes', 26, 'Books', 'ABc Street Sector 20 Noida UP', 'Books for creating notes one dozen classmate books', '2022-08-02 01:22:52', 1, 'f925916e2754e5e03f75dd58a5733251'),
(12, 'Riya', '8523697413', 'riya@gmail.com', 'Sweaters ', 32, 'Clothes', 'saraswathipuram mysore', ' I would like to donate the Sweaters for old age homes.', '2022-11-17 03:53:33', 1, 'e7505d0ab0f63e08810f6000a5f37ae9'),
(15, 'Aishu', '9988776655', 'aishu@gmail.com', 'Engineering Mathemat', 26, 'Stationary', 'Mysore', ' I would like to donate books for needy ', '2022-11-21 16:01:44', 1, 'f598f436f5a2bb404404acd8568526fb'),
(16, 'ambani', '7856941239', 'ambani@gmail.com', 'Computers', 59, 'Gadgets', 'Mumbai', ' I want to help needy engineering students', '2022-11-23 11:15:02', 1, 'f454c7b96c33c5946d120e2e88330d52'),
(17, 'Alex', '9632145879', 'alex@gmail.com', 'Cooker and Grinder', 30, 'Vessels', 'Bengaluru', ' I want to donate the vessels for ashramas ', '2022-11-24 11:49:44', 1, 'b7e6124aeffd2498bdb4fb8c525c6ea3'),
(18, 'priya', '9856321479', 'priya@gmail.com', 'Notebook Navaneet 20', 26, 'Stationary', ' Srirampur Mysuru', ' I ant to Notebook Navaneet 200 pages 2 dozen books for needy students They are new books ', '2022-11-26 07:13:38', 0, 'cfb077657c9b746245f0e9106c0f7660'),
(19, 'Saniya', '7856491239', 'saniya@gmail.com', 'Sweaters for needy ', 28, 'Clothes', 'Mangalore', ' I want to donate clothes like sweaters and jackets for needy ', '2022-11-29 06:21:27', 1, 'a0260154fe07352e36d3a432df569ad9'),
(20, 'Bob', '1236547899', 'bob@gmail.com', 'Packed food ', 30, 'Food', 'Hubli', ' I want to donate packed food for needy ', '2022-11-29 06:25:24', 1, '5dda79243ec39dbdf6dd58b136149a08'),
(21, 'Mohan ', '7896541233', 'mohan@gmail.com', 'Clothes Like Pants a', 52, 'Clothes', 'Mangalore', ' ', '2022-11-30 07:08:37', 1, '1aa79deaf05f0fe00a5d46b88145db92');

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
(2, 'Why Become Donor', 'donor', '<span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat</span>'),
(3, 'About Us ', 'aboutus', '																				<div style=\"text-align: justify;\"><span style=\"font-size: 1em; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Welcome to the&nbsp;</span><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Donate Excess Management System</span><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 1em;\">&nbsp;donor management system.</span></div><div style=\"text-align: justify;\"><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat</span><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 1em;\"><br></span></div>\r\n										\r\n										');

-- --------------------------------------------------------

--
-- Table structure for table `tblrequirer`
--

CREATE TABLE `tblrequirer` (
  `ID` int(10) NOT NULL,
  `BloodDonarID` int(10) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `EmailId` varchar(250) DEFAULT NULL,
  `ContactNumber` bigint(10) DEFAULT NULL,
  `BloodRequirefor` varchar(250) DEFAULT NULL,
  `Message` mediumtext DEFAULT NULL,
  `ApplyDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblrequirer`
--

INSERT INTO `tblrequirer` (`ID`, `BloodDonarID`, `name`, `EmailId`, `ContactNumber`, `BloodRequirefor`, `Message`, `ApplyDate`) VALUES
(1, 6, 'Rakesh', 'rak@gmail.com', 7894561236, 'Father', 'Please help', '2022-05-17 11:57:24'),
(2, 3, 'Mukesh', 'muk@gmail.com', 5896231478, 'Others', 'Please help', '2022-05-17 11:58:48'),
(3, 6, 'Hitesh', 'hit@gmail.com', 1236547896, 'Brother', 'do the needful', '2022-05-17 12:02:12'),
(4, 10, 'Rahul Singh', 'rahk@gmail.com', 2536251425, 'Mother', 'Please help me', '2022-07-29 01:51:52'),
(5, 11, 'Anuj Kumar', 'ak@gmail.com', 8525232102, 'Others', 'Need blood on urgent basis', '2022-08-02 01:24:18'),
(6, 12, 'priya', 'priya@gmail.com', 5469871236, 'Mother', 'i REQUIRE THIS ', '2022-11-17 04:01:06'),
(7, 14, 'xyz', 'xyz@gmail.com', 9856321145, 'Others', 'I want for orphange', '2022-11-17 09:53:44'),
(8, 13, 'preethi', 'preethi@gamil.com', 3214569877, 'Mother', 'xyz', '2022-11-23 10:58:36'),
(9, 13, 'sahana', 'sahana@gmail.com', 2365987412, 'Orphanage', 'for orphans', '2022-11-23 11:11:02'),
(10, 17, 'sadana', 'sadana@gmail.com', 7896541239, 'Others', 'I want vessels to donate for neighbor\'s who require this ', '2022-11-24 12:05:58'),
(11, 18, 'sahana', 'sahana@gmail.com', 1236547891, 'Personal Usage', 'I want these books for my studies I\'m a student it would be helpful if you can give me this ', '2022-11-26 07:16:23');

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
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbldeletion`
--
ALTER TABLE `tbldeletion`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbldonars`
--
ALTER TABLE `tbldonars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tblgroup`
--
ALTER TABLE `tblgroup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tblpages`
--
ALTER TABLE `tblpages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tblrequirer`
--
ALTER TABLE `tblrequirer`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
