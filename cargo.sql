-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 14, 2017 at 09:42 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cargo`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `checkDuplicateUser` (IN `uname` VARCHAR(255))  BEGIN
START TRANSACTION;
SELECT `UserName` FROM `user` WHERE `UserName` = uname;
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_addresses` ()  BEGIN
START TRANSACTION;
SELECT * FROM address;
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_cargos` ()  BEGIN
START TRANSACTION;
SELECT * FROM cargo;
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_couriers` ()  BEGIN
START TRANSACTION;
SELECT * FROM courier NATURAL JOIN Employee NATURAL JOIN Person;
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_customers` ()  BEGIN
START TRANSACTION;
SELECT * FROM customer NATURAL JOIN person;
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_deliverytypes` ()  BEGIN
START TRANSACTION;
SELECT * FROM deliverytype;
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_discounts` ()  BEGIN
START TRANSACTION;
SELECT * FROM discount;
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_drivers` ()  BEGIN
START TRANSACTION;
SELECT * FROM driver NATURAL JOIN Employee NATURAL JOIN Person;
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_feedbacks` ()  BEGIN
START TRANSACTION;
SELECT * FROM feedback 
INNER JOIN customer ON feedback.`FK_Customer_TCKN` = customer.`TCKN` 
INNER JOIN Person ON customer.`TCKN` = person.`TCKN`;
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_insurancecompanies` ()  BEGIN
START TRANSACTION;
SELECT * FROM insurancecompany;
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_insurances` ()  BEGIN
START TRANSACTION;
SELECT * FROM insurance;
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_insurancetypes` ()  NO SQL
SELECT * FROM insurancetype$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_insurancetype_insurancecompany` ()  NO SQL
SELECT * FROM insurancetypeinsurancecompany$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_insurance_cargo` ()  BEGIN
START TRANSACTION;
SELECT * FROM insurancecargo;
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_officers` ()  BEGIN
START TRANSACTION;
SELECT * FROM officer NATURAL JOIN Employee NATURAL JOIN Person;
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_packages` ()  BEGIN
START TRANSACTION;
SELECT * FROM package;
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_person_address` ()  NO SQL
SELECT * FROM personaddress$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_suboffices` ()  BEGIN
START TRANSACTION;
SELECT * FROM suboffice NATURAL JOIN office;
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_users` ()  BEGIN
START TRANSACTION;
SELECT * FROM `user`;
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_vehicles` ()  BEGIN
START TRANSACTION;
SELECT * FROM vehicle;
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_vehicletypes` ()  BEGIN
START TRANSACTION;
SELECT * FROM vehicletype ;
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_warehouses` ()  BEGIN
START TRANSACTION;
SELECT * FROM warehouse NATURAL JOIN office;
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_address` (IN `t` VARCHAR(255), IN `fa` VARCHAR(255))  BEGIN
START TRANSACTION;
INSERT INTO address (`Type`, `FullAddress`) VALUES(t, fa);
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_cargo` (IN `p` BIGINT(255), IN `dti` INT(11), IN `rtc` BIGINT(255), IN `stc` BIGINT(255), IN `ctc` BIGINT(255), IN `oid` INT(11), IN `did` INT(11))  BEGIN
START TRANSACTION;
INSERT INTO cargo (`Price`, `FK_DeliveryType_ID`, `FK_Reciever_TCKN`, `FK_Sender_TCKN`, `FK_Courier_TCKN`, `FK_Office_ID`, `FK_Discount_DiscountID`) VALUES(p, dti, rtc, stc, ctc, oid, dti);
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_courier` (IN `tc` BIGINT(255), IN `fn` VARCHAR(255), IN `ln` VARCHAR(255), IN `pn` BIGINT(255), IN `ssn2` BIGINT(255), IN `office` INT(255))  BEGIN
START TRANSACTION;
INSERT IGNORE INTO person (`TCKN`, `FirstName`, `LastName`, `PhoneNumber`) VALUES(tc, fn, ln, pn);
INSERT IGNORE INTO employee(`TCKN`, `SSN`, `FK_Office_OfficeID`) VALUES(tc, ssn2, office);
INSERT INTO courier(`TCKN`) VALUES(tc);
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_deliverytype` (IN `n` VARCHAR(255))  BEGIN
START TRANSACTION;
INSERT INTO deliverytype (`Name`) VALUES(n);
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_discount` (IN `p` TINYINT(4), IN `n` VARCHAR(255))  BEGIN
START TRANSACTION;
INSERT INTO discount (`Percentage`, `Name`) VALUES(p, n);
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_driver` (IN `tc` BIGINT(255), IN `fn` VARCHAR(255), IN `ln` VARCHAR(255), IN `pn` BIGINT(255), IN `ssn2` BIGINT(255), IN `office` INT(255), IN `carplate` INT(255))  BEGIN
START TRANSACTION;
INSERT IGNORE INTO person (`TCKN`, `FirstName`, `LastName`, `PhoneNumber`) VALUES(tc, fn, ln, pn);
INSERT IGNORE INTO employee(`TCKN`, `SSN`, `FK_Office_OfficeID`) VALUES(tc, ssn2, office);
INSERT INTO driver(`TCKN`, `FK_Driving_Plate`) VALUES(tc, carplate);
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_feedback` (IN `customertc` BIGINT(255), IN `s` TINYINT(4), IN `m` VARCHAR(255))  BEGIN
START TRANSACTION;
INSERT INTO feedback (`Score`, `Message`, `FK_Customer_TCKN`) VALUES(s, m, customertc);
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_insurance` (IN `companyid` BIGINT(255), IN `typeid` BIGINT(255))  BEGIN
START TRANSACTION;
INSERT INTO insurance (`FK_InsuranceCompany_ID`, `FK_InsuranceType_ID`) VALUES(companyid, typeid);
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_insurancecompany` (IN `n` VARCHAR(255))  BEGIN
START TRANSACTION;
INSERT INTO insurancecompany (`Name`) VALUES(n);
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_insurancetype` (IN `n` VARCHAR(255))  BEGIN
START TRANSACTION;
INSERT INTO insurancetype (`Name`) VALUES(n);
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_office` (IN `aid` VARCHAR(255))  BEGIN
START TRANSACTION;
INSERT INTO office (`FK_Address_ID`) VALUES(aid);
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_officer` (IN `tc` BIGINT(255), IN `fn` VARCHAR(255), IN `ln` VARCHAR(255), IN `pn` BIGINT(255), IN `ssn2` BIGINT(255), IN `office` INT(255))  BEGIN
START TRANSACTION;
INSERT IGNORE INTO person (`TCKN`, `FirstName`, `LastName`, `PhoneNumber`) VALUES(tc, fn, ln, pn);
INSERT IGNORE INTO employee(`TCKN`, `SSN`, `FK_Office_OfficeID`) VALUES(tc, ssn2, office);
INSERT INTO officer(`TCKN`) VALUES(tc);
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_package` (IN `b` VARCHAR(255), IN `cargoid` INT(11))  BEGIN
START TRANSACTION;
INSERT INTO package (`Barcode`, `FK_Cargo_CargoID`) VALUES(b, cargoid);
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_photo` (IN `p` VARCHAR(255))  BEGIN
START TRANSACTION;
INSERT INTO photo (`Path`) VALUES(p);
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_suboffice` (IN `addressid` INT(11))  BEGIN
START TRANSACTION;
INSERT INTO office(`FK_Address_ID`) VALUES(addressid);
INSERT INTO suboffice (`OfficeID`) VALUES(LAST_INSERT_ID());
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_user` (IN `uname` VARCHAR(255), IN `password` VARCHAR(255))  BEGIN
START TRANSACTION;
INSERT INTO `user` (`UserName`,`Password`) VALUES(uname,MD5(password));
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_vehicle` (IN `p` VARCHAR(255), IN `typeid` INT(11))  BEGIN
START TRANSACTION;
INSERT INTO vehicle(`Plate`, `FK_VehicleType_ID`) VALUES(p, typeid);
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_vehicletype` (IN `type` VARCHAR(255), IN `brand` VARCHAR(255), IN `model` VARCHAR(255))  BEGIN
START TRANSACTION;
INSERT INTO vehicletype(`TypeName`, `Brand`, `Model`) VALUES(type, brand, model);
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_warehouse` (IN `addressid` INT(11))  BEGIN
START TRANSACTION;
INSERT INTO office(`FK_Address_ID`) VALUES(addressid);
INSERT INTO warehouse (`OfficeID`) VALUES(LAST_INSERT_ID());
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `login` (IN `uname` VARCHAR(255), IN `pword` VARCHAR(255))  BEGIN
START TRANSACTION;
SELECT * FROM `user` WHERE `UserName` = uname AND `Password` = MD5(pword);
COMMIT;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `AddressID` int(11) NOT NULL,
  `Type` varchar(255) NOT NULL,
  `FullAddress` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`AddressID`, `Type`, `FullAddress`) VALUES
(1, 'Ev ', 'Mursel Uluc Mah'),
(2, 'Okul', 'Beytepe'),
(3, 'Ofis', 'Dikmen Cad.');

-- --------------------------------------------------------

--
-- Table structure for table `cargo`
--

CREATE TABLE `cargo` (
  `CargoID` int(11) NOT NULL,
  `Price` float NOT NULL,
  `isDelivered` tinyint(1) NOT NULL DEFAULT '0',
  `FK_DeliveryType_ID` int(11) NOT NULL,
  `FK_Reciever_TCKN` bigint(11) NOT NULL,
  `FK_Sender_TCKN` bigint(11) NOT NULL,
  `FK_Courier_TCKN` bigint(11) NOT NULL,
  `FK_Office_ID` int(11) NOT NULL,
  `FK_Discount_DiscountID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `courier`
--

CREATE TABLE `courier` (
  `TCKN` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `TCKN` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `deliverytype`
--

CREATE TABLE `deliverytype` (
  `DeliveryTypeID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `DiscountID` int(11) NOT NULL,
  `Percentage` tinyint(4) NOT NULL,
  `Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `TCKN` bigint(11) NOT NULL,
  `FK_Driving_Plate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `TCKN` bigint(11) NOT NULL,
  `SSN` int(11) NOT NULL,
  `FK_Office_OfficeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `FeedbackID` int(11) NOT NULL,
  `Score` tinyint(4) NOT NULL,
  `Message` varchar(255) NOT NULL,
  `FK_Customer_TCKN` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `insurance`
--

CREATE TABLE `insurance` (
  `InsuranceID` int(11) NOT NULL,
  `FK_InsuranceCompany_ID` int(11) NOT NULL,
  `FK_InsuranceType_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `insurancecargo`
--

CREATE TABLE `insurancecargo` (
  `InsuranceID` int(11) NOT NULL,
  `CargoID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `insurancecompany`
--

CREATE TABLE `insurancecompany` (
  `InsuranceCompanyID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `insurancetype`
--

CREATE TABLE `insurancetype` (
  `InsuranceTypeID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `insurancetypeinsurancecompany`
--

CREATE TABLE `insurancetypeinsurancecompany` (
  `InsuranceType_ID` int(11) NOT NULL,
  `InsuranceCompany_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `office`
--

CREATE TABLE `office` (
  `OfficeID` int(11) NOT NULL,
  `FK_Address_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `office`
--

INSERT INTO `office` (`OfficeID`, `FK_Address_ID`) VALUES
(1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `officer`
--

CREATE TABLE `officer` (
  `TCKN` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `Barcode` varchar(255) NOT NULL,
  `FK_Cargo_CargoID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `TCKN` bigint(11) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `PhoneNumber` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `personaddress`
--

CREATE TABLE `personaddress` (
  `Person_TCKN` bigint(11) NOT NULL,
  `FK_Address_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `photo`
--

CREATE TABLE `photo` (
  `PhotoID` int(11) NOT NULL,
  `Path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `suboffice`
--

CREATE TABLE `suboffice` (
  `OfficeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `suboffice`
--

INSERT INTO `suboffice` (`OfficeID`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserName` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Type` varchar(10) NOT NULL DEFAULT 'User'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserName`, `Password`, `Type`) VALUES
('a', '0cc175b9c0f1b6a831c399e269772661', 'Admin'),
('u', '7b774effe4a349c6dd82ad4f4f21d34c', 'User');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `Plate` varchar(255) NOT NULL,
  `FK_VehicleType_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`Plate`, `FK_VehicleType_ID`) VALUES
('4534512', 1),
('1234512', 2);

-- --------------------------------------------------------

--
-- Table structure for table `vehicletype`
--

CREATE TABLE `vehicletype` (
  `VehicleTypeID` int(11) NOT NULL,
  `TypeName` varchar(255) NOT NULL,
  `Brand` varchar(255) NOT NULL,
  `Model` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vehicletype`
--

INSERT INTO `vehicletype` (`VehicleTypeID`, `TypeName`, `Brand`, `Model`) VALUES
(1, 'Delivery', 'Ford', 'Transit'),
(2, 'Transfer', 'Volkswagen', 'Transporter');

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `OfficeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`AddressID`);

--
-- Indexes for table `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`CargoID`),
  ADD KEY `FK_DeliveryType_ID` (`FK_DeliveryType_ID`),
  ADD KEY `FK_Reciever_TCKN` (`FK_Reciever_TCKN`),
  ADD KEY `FK_Sender_TCKN` (`FK_Sender_TCKN`),
  ADD KEY `FK_Courier_TCKN` (`FK_Courier_TCKN`),
  ADD KEY `FK_Office_ID` (`FK_Office_ID`),
  ADD KEY `FK_Discount_DiscountID` (`FK_Discount_DiscountID`);

--
-- Indexes for table `courier`
--
ALTER TABLE `courier`
  ADD PRIMARY KEY (`TCKN`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`TCKN`);

--
-- Indexes for table `deliverytype`
--
ALTER TABLE `deliverytype`
  ADD PRIMARY KEY (`DeliveryTypeID`);

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`DiscountID`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`TCKN`),
  ADD KEY `FK_Driving_Plate` (`FK_Driving_Plate`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`TCKN`),
  ADD KEY `FK_Office_OfficeID` (`FK_Office_OfficeID`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`FeedbackID`),
  ADD KEY `FK_Customer_TCKN` (`FK_Customer_TCKN`),
  ADD KEY `FK_Customer_TCKN_2` (`FK_Customer_TCKN`);

--
-- Indexes for table `insurance`
--
ALTER TABLE `insurance`
  ADD PRIMARY KEY (`InsuranceID`),
  ADD KEY `FK_InsuranceCompany_ID` (`FK_InsuranceCompany_ID`),
  ADD KEY `FK_InsuranceType_ID` (`FK_InsuranceType_ID`);

--
-- Indexes for table `insurancecargo`
--
ALTER TABLE `insurancecargo`
  ADD KEY `CargoID` (`CargoID`),
  ADD KEY `InsuranceID` (`InsuranceID`);

--
-- Indexes for table `insurancecompany`
--
ALTER TABLE `insurancecompany`
  ADD PRIMARY KEY (`InsuranceCompanyID`);

--
-- Indexes for table `insurancetype`
--
ALTER TABLE `insurancetype`
  ADD PRIMARY KEY (`InsuranceTypeID`);

--
-- Indexes for table `insurancetypeinsurancecompany`
--
ALTER TABLE `insurancetypeinsurancecompany`
  ADD KEY `InsuranceType_ID` (`InsuranceType_ID`),
  ADD KEY `InsuranceCompany_ID` (`InsuranceCompany_ID`);

--
-- Indexes for table `office`
--
ALTER TABLE `office`
  ADD PRIMARY KEY (`OfficeID`),
  ADD KEY `FK_Address_ID` (`FK_Address_ID`);

--
-- Indexes for table `officer`
--
ALTER TABLE `officer`
  ADD PRIMARY KEY (`TCKN`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`Barcode`),
  ADD KEY `FK_Cargo_CargoID` (`FK_Cargo_CargoID`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`TCKN`);

--
-- Indexes for table `personaddress`
--
ALTER TABLE `personaddress`
  ADD KEY `Person_TCKN` (`Person_TCKN`),
  ADD KEY `FK_Address_ID` (`FK_Address_ID`),
  ADD KEY `FK_Address_ID_2` (`FK_Address_ID`);

--
-- Indexes for table `photo`
--
ALTER TABLE `photo`
  ADD PRIMARY KEY (`PhotoID`);

--
-- Indexes for table `suboffice`
--
ALTER TABLE `suboffice`
  ADD PRIMARY KEY (`OfficeID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserName`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`Plate`),
  ADD KEY `FK_VehicleType_ID` (`FK_VehicleType_ID`);

--
-- Indexes for table `vehicletype`
--
ALTER TABLE `vehicletype`
  ADD PRIMARY KEY (`VehicleTypeID`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`OfficeID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `AddressID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `cargo`
--
ALTER TABLE `cargo`
  MODIFY `CargoID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `deliverytype`
--
ALTER TABLE `deliverytype`
  MODIFY `DeliveryTypeID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `discount`
--
ALTER TABLE `discount`
  MODIFY `DiscountID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `driver`
--
ALTER TABLE `driver`
  MODIFY `TCKN` bigint(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `TCKN` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35216498;
--
-- AUTO_INCREMENT for table `office`
--
ALTER TABLE `office`
  MODIFY `OfficeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `TCKN` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2147483647;
--
-- AUTO_INCREMENT for table `photo`
--
ALTER TABLE `photo`
  MODIFY `PhotoID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vehicletype`
--
ALTER TABLE `vehicletype`
  MODIFY `VehicleTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `cargo`
--
ALTER TABLE `cargo`
  ADD CONSTRAINT `cargo_ibfk_1` FOREIGN KEY (`FK_DeliveryType_ID`) REFERENCES `deliverytype` (`DeliveryTypeID`),
  ADD CONSTRAINT `cargo_ibfk_10` FOREIGN KEY (`FK_Discount_DiscountID`) REFERENCES `discount` (`DiscountID`),
  ADD CONSTRAINT `cargo_ibfk_6` FOREIGN KEY (`FK_Office_ID`) REFERENCES `office` (`OfficeID`),
  ADD CONSTRAINT `cargo_ibfk_7` FOREIGN KEY (`FK_Reciever_TCKN`) REFERENCES `customer` (`TCKN`),
  ADD CONSTRAINT `cargo_ibfk_8` FOREIGN KEY (`FK_Sender_TCKN`) REFERENCES `customer` (`TCKN`),
  ADD CONSTRAINT `cargo_ibfk_9` FOREIGN KEY (`FK_Courier_TCKN`) REFERENCES `courier` (`TCKN`);

--
-- Constraints for table `courier`
--
ALTER TABLE `courier`
  ADD CONSTRAINT `courier_ibfk_1` FOREIGN KEY (`TCKN`) REFERENCES `employee` (`TCKN`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`TCKN`) REFERENCES `person` (`TCKN`);

--
-- Constraints for table `driver`
--
ALTER TABLE `driver`
  ADD CONSTRAINT `driver_ibfk_3` FOREIGN KEY (`TCKN`) REFERENCES `employee` (`TCKN`),
  ADD CONSTRAINT `driver_ibfk_4` FOREIGN KEY (`FK_Driving_Plate`) REFERENCES `vehicle` (`Plate`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`FK_Office_OfficeID`) REFERENCES `office` (`OfficeID`),
  ADD CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`TCKN`) REFERENCES `person` (`TCKN`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`FK_Customer_TCKN`) REFERENCES `customer` (`TCKN`);

--
-- Constraints for table `insurance`
--
ALTER TABLE `insurance`
  ADD CONSTRAINT `insurance_ibfk_1` FOREIGN KEY (`FK_InsuranceCompany_ID`) REFERENCES `insurancecompany` (`InsuranceCompanyID`),
  ADD CONSTRAINT `insurance_ibfk_2` FOREIGN KEY (`FK_InsuranceType_ID`) REFERENCES `insurancetype` (`InsuranceTypeID`);

--
-- Constraints for table `insurancecargo`
--
ALTER TABLE `insurancecargo`
  ADD CONSTRAINT `insurancecargo_ibfk_1` FOREIGN KEY (`CargoID`) REFERENCES `cargo` (`CargoID`),
  ADD CONSTRAINT `insurancecargo_ibfk_2` FOREIGN KEY (`InsuranceID`) REFERENCES `insurance` (`InsuranceID`);

--
-- Constraints for table `insurancetypeinsurancecompany`
--
ALTER TABLE `insurancetypeinsurancecompany`
  ADD CONSTRAINT `insurancetypeinsurancecompany_ibfk_1` FOREIGN KEY (`InsuranceType_ID`) REFERENCES `insurancetype` (`InsuranceTypeID`),
  ADD CONSTRAINT `insurancetypeinsurancecompany_ibfk_2` FOREIGN KEY (`InsuranceCompany_ID`) REFERENCES `insurancecompany` (`InsuranceCompanyID`);

--
-- Constraints for table `office`
--
ALTER TABLE `office`
  ADD CONSTRAINT `office_ibfk_1` FOREIGN KEY (`FK_Address_ID`) REFERENCES `address` (`AddressID`);

--
-- Constraints for table `officer`
--
ALTER TABLE `officer`
  ADD CONSTRAINT `officer_ibfk_1` FOREIGN KEY (`TCKN`) REFERENCES `employee` (`TCKN`);

--
-- Constraints for table `package`
--
ALTER TABLE `package`
  ADD CONSTRAINT `package_ibfk_1` FOREIGN KEY (`FK_Cargo_CargoID`) REFERENCES `cargo` (`CargoID`);

--
-- Constraints for table `personaddress`
--
ALTER TABLE `personaddress`
  ADD CONSTRAINT `personaddress_ibfk_2` FOREIGN KEY (`FK_Address_ID`) REFERENCES `address` (`AddressID`),
  ADD CONSTRAINT `personaddress_ibfk_3` FOREIGN KEY (`Person_TCKN`) REFERENCES `person` (`TCKN`);

--
-- Constraints for table `suboffice`
--
ALTER TABLE `suboffice`
  ADD CONSTRAINT `suboffice_ibfk_1` FOREIGN KEY (`OfficeID`) REFERENCES `office` (`OfficeID`);

--
-- Constraints for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD CONSTRAINT `vehicle_ibfk_1` FOREIGN KEY (`FK_VehicleType_ID`) REFERENCES `vehicletype` (`VehicleTypeID`);

--
-- Constraints for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD CONSTRAINT `warehouse_ibfk_1` FOREIGN KEY (`OfficeID`) REFERENCES `office` (`OfficeID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
