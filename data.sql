-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 11, 2024 at 12:54 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `enter_komputer`
--

-- --------------------------------------------------------

--
-- Table structure for table `detailpromo`
--

CREATE TABLE `detailpromo` (
  `dpr_id` int(11) NOT NULL,
  `prm_id` int(11) DEFAULT NULL,
  `vpr_id` int(11) DEFAULT NULL,
  `dpr_status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detailpromo`
--

INSERT INTO `detailpromo` (`dpr_id`, `prm_id`, `vpr_id`, `dpr_status`) VALUES
(1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `meja`
--

CREATE TABLE `meja` (
  `mej_id` int(11) NOT NULL,
  `mej_nama` varchar(255) DEFAULT NULL,
  `mej_status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `meja`
--

INSERT INTO `meja` (`mej_id`, `mej_nama`, `mej_status`) VALUES
(1, 'MEJA NO 1', 1),
(2, 'MEJA NO 2', 1),
(3, 'MEJA NO 3', 1);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `ord_id` int(11) NOT NULL,
  `meja_id` int(11) DEFAULT NULL,
  `ord_waktu` datetime DEFAULT NULL,
  `ord_total` decimal(10,2) DEFAULT NULL,
  `ord_status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`ord_id`, `meja_id`, `ord_waktu`, `ord_total`, `ord_status`) VALUES
(1, 1, '2024-08-03 14:00:00', '23000.00', 1),
(4, 1, '2024-08-04 12:45:27', '0.00', 1),
(5, 1, '2024-08-11 12:41:49', '0.00', 1),
(6, 1, '2024-08-11 17:11:44', '0.00', 1),
(7, 2, '2024-08-11 17:27:24', '0.00', 1),
(9, 2, '2024-08-11 17:30:58', '155000.00', 1),
(10, 2, '2024-08-11 17:33:26', '155000.00', 1),
(11, 2, '2024-08-11 17:35:27', '155000.00', 1),
(12, 2, '2024-08-11 17:41:03', '155000.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orderpromo`
--

CREATE TABLE `orderpromo` (
  `opr_id` int(11) NOT NULL,
  `ord_id` int(11) DEFAULT NULL,
  `prm_id` int(11) DEFAULT NULL,
  `opr_jumlah` int(11) NOT NULL,
  `opr_harga` decimal(10,2) DEFAULT NULL,
  `opr_status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderpromo`
--

INSERT INTO `orderpromo` (`opr_id`, `ord_id`, `prm_id`, `opr_jumlah`, `opr_harga`, `opr_status`) VALUES
(1, 1, 1, 1, '23000.00', 1),
(2, 7, 1, 5, '23000.00', 1),
(3, 9, 1, 5, '23000.00', 1),
(4, 10, 1, 5, '23000.00', 1),
(5, 11, 1, 5, '115000.00', 1),
(6, 12, 1, 5, '115000.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ordervariantproduct`
--

CREATE TABLE `ordervariantproduct` (
  `ovp_id` int(11) NOT NULL,
  `ord_id` int(11) DEFAULT NULL,
  `vpr_id` int(11) DEFAULT NULL,
  `ovp_jumlah` int(11) DEFAULT NULL,
  `ovp_harga` decimal(10,2) DEFAULT NULL,
  `ovp_status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ordervariantproduct`
--

INSERT INTO `ordervariantproduct` (`ovp_id`, `ord_id`, `vpr_id`, `ovp_jumlah`, `ovp_harga`, `ovp_status`) VALUES
(1, 1, 1, 1, '12000.00', 1),
(2, 1, 9, 1, '15000.00', 1),
(13, 6, 1, 2, '12000.00', 1),
(14, 7, 2, 4, '10000.00', 1),
(15, 9, 2, 4, '10000.00', 1),
(16, 10, 2, 4, '10000.00', 1),
(17, 11, 2, 4, '40000.00', 1),
(18, 12, 2, 4, '40000.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `pro_id` int(11) NOT NULL,
  `pro_nama` varchar(255) DEFAULT NULL,
  `pro_kategori` varchar(255) DEFAULT NULL,
  `pro_status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`pro_id`, `pro_nama`, `pro_kategori`, `pro_status`) VALUES
(1, 'Jeruk', 'Minuman', 1),
(2, 'Teh', 'Minuman', 1),
(3, 'Kopi', 'Minuman', 1),
(4, 'Extra Es Batu', 'Minuman', 1),
(5, 'Mie', 'Makanan', 1),
(6, 'Nasi Goreng', 'Makanan', 1);

-- --------------------------------------------------------

--
-- Table structure for table `promo`
--

CREATE TABLE `promo` (
  `prm_id` int(11) NOT NULL,
  `prm_nama` varchar(255) DEFAULT NULL,
  `prm_harga` decimal(10,2) DEFAULT NULL,
  `prm_status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `promo`
--

INSERT INTO `promo` (`prm_id`, `prm_nama`, `prm_harga`, `prm_status`) VALUES
(1, 'Nasi Goreng + Jeruk Dingin', '23000.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `variant`
--

CREATE TABLE `variant` (
  `var_id` int(11) NOT NULL,
  `var_kategori` varchar(255) DEFAULT NULL,
  `var_nama` varchar(255) DEFAULT NULL,
  `var_status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `variant`
--

INSERT INTO `variant` (`var_id`, `var_kategori`, `var_nama`, `var_status`) VALUES
(1, 'Minuman', 'Dingin', 1),
(2, 'Minuman', 'Panas', 1),
(3, 'Minuman', 'Manis', 1),
(4, 'Minuman', 'Tawar', 1),
(5, 'Makanan', 'Goreng', 1),
(6, 'Makanan', 'Kuah', 1);

-- --------------------------------------------------------

--
-- Table structure for table `variantproduct`
--

CREATE TABLE `variantproduct` (
  `vpr_id` int(11) NOT NULL,
  `var_id` int(11) DEFAULT NULL,
  `pro_id` int(11) DEFAULT NULL,
  `vpr_harga` decimal(10,2) DEFAULT NULL,
  `vpr_status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `variantproduct`
--

INSERT INTO `variantproduct` (`vpr_id`, `var_id`, `pro_id`, `vpr_harga`, `vpr_status`) VALUES
(1, 1, 1, '12000.00', 1),
(2, 2, 1, '10000.00', 1),
(3, 3, 2, '8000.00', 1),
(4, 4, 2, '5000.00', 1),
(5, 1, 3, '8000.00', 1),
(6, 2, 3, '6000.00', 1),
(7, 5, 5, '15000.00', 1),
(8, 6, 5, '15000.00', 1),
(9, NULL, 6, '15000.00', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detailpromo`
--
ALTER TABLE `detailpromo`
  ADD PRIMARY KEY (`dpr_id`),
  ADD KEY `prm_id` (`prm_id`),
  ADD KEY `vpr_id` (`vpr_id`);

--
-- Indexes for table `meja`
--
ALTER TABLE `meja`
  ADD PRIMARY KEY (`mej_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`ord_id`),
  ADD KEY `meja_id` (`meja_id`);

--
-- Indexes for table `orderpromo`
--
ALTER TABLE `orderpromo`
  ADD PRIMARY KEY (`opr_id`),
  ADD KEY `ord_id` (`ord_id`),
  ADD KEY `prm_id` (`prm_id`);

--
-- Indexes for table `ordervariantproduct`
--
ALTER TABLE `ordervariantproduct`
  ADD PRIMARY KEY (`ovp_id`),
  ADD KEY `ord_id` (`ord_id`),
  ADD KEY `vpr_id` (`vpr_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`pro_id`);

--
-- Indexes for table `promo`
--
ALTER TABLE `promo`
  ADD PRIMARY KEY (`prm_id`);

--
-- Indexes for table `variant`
--
ALTER TABLE `variant`
  ADD PRIMARY KEY (`var_id`);

--
-- Indexes for table `variantproduct`
--
ALTER TABLE `variantproduct`
  ADD PRIMARY KEY (`vpr_id`),
  ADD KEY `var_id` (`var_id`),
  ADD KEY `pro_id` (`pro_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detailpromo`
--
ALTER TABLE `detailpromo`
  MODIFY `dpr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `meja`
--
ALTER TABLE `meja`
  MODIFY `mej_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `ord_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orderpromo`
--
ALTER TABLE `orderpromo`
  MODIFY `opr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ordervariantproduct`
--
ALTER TABLE `ordervariantproduct`
  MODIFY `ovp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `pro_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `promo`
--
ALTER TABLE `promo`
  MODIFY `prm_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `variant`
--
ALTER TABLE `variant`
  MODIFY `var_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `variantproduct`
--
ALTER TABLE `variantproduct`
  MODIFY `vpr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detailpromo`
--
ALTER TABLE `detailpromo`
  ADD CONSTRAINT `detailpromo_ibfk_1` FOREIGN KEY (`prm_id`) REFERENCES `promo` (`prm_id`),
  ADD CONSTRAINT `detailpromo_ibfk_2` FOREIGN KEY (`vpr_id`) REFERENCES `variantproduct` (`vpr_id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`meja_id`) REFERENCES `meja` (`mej_id`);

--
-- Constraints for table `orderpromo`
--
ALTER TABLE `orderpromo`
  ADD CONSTRAINT `orderpromo_ibfk_1` FOREIGN KEY (`ord_id`) REFERENCES `order` (`ord_id`),
  ADD CONSTRAINT `orderpromo_ibfk_2` FOREIGN KEY (`prm_id`) REFERENCES `promo` (`prm_id`);

--
-- Constraints for table `ordervariantproduct`
--
ALTER TABLE `ordervariantproduct`
  ADD CONSTRAINT `ordervariantproduct_ibfk_1` FOREIGN KEY (`ord_id`) REFERENCES `order` (`ord_id`),
  ADD CONSTRAINT `ordervariantproduct_ibfk_2` FOREIGN KEY (`vpr_id`) REFERENCES `variantproduct` (`vpr_id`);

--
-- Constraints for table `variantproduct`
--
ALTER TABLE `variantproduct`
  ADD CONSTRAINT `variantproduct_ibfk_1` FOREIGN KEY (`var_id`) REFERENCES `variant` (`var_id`),
  ADD CONSTRAINT `variantproduct_ibfk_2` FOREIGN KEY (`pro_id`) REFERENCES `product` (`pro_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
