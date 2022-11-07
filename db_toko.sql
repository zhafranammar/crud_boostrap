-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2022 at 08:03 AM
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
-- Database: `db_toko`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_barang`
--

CREATE TABLE `tbl_barang` (
  `id_barang` char(4) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `harga` float DEFAULT NULL,
  `stok` smallint(3) DEFAULT NULL,
  `jenis` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_barang`
--

INSERT INTO `tbl_barang` (`id_barang`, `nama`, `harga`, `stok`, `jenis`) VALUES
('B001', 'Logitech', 400000, 10, 'Aksesoris'),
('B002', 'Kingston RAM DDR4 8GB', 530000, 5, 'Komponen Komputer'),
('B003', 'Kingston SSD 240GB', 490000, 6, 'Media Penyimpanan Data'),
('B004', 'Anti Virus Kaspersky', 50000, 15, 'Software'),
('B005', 'LED Monitor 24 inch', 0, 0, 'Aksesoris Komputer'),
('B006', 'USB Flash Drive 32GB', 120000, 9, 'Media Penyimpanan Data'),
('B007', 'Rexus Q20 Mouse', 55000, 4, 'Aksesoris Komputer'),
('B008', '2TB External Harddisk', 1000000, 1, 'Media Penyimpanan Data'),
('B009', 'Windows 10 License Key', 20000, 18, 'Software'),
('B010', 'Bracket Stand Laptop', 150000, 8, 'Aksesoris Komputer'),
('B011', 'Logitech C920 Webcam', 0, 2, 'Aksesoris Komputer'),
('B012', 'Microsoft Office 365', 95000, 12, 'Software'),
('B013', 'TP-LINK Router', 148000, 3, 'Jaringan'),
('B014', 'Cooling Pad', 115000, 10, 'Aksesoris Komputer'),
('B015', 'Modem Wifi', 630000, 8, 'Jaringan'),
('B016', 'In-ear Earphone', 299000, 10, 'Audio'),
('B017', 'Canon Printer', 0, 0, 'Printer'),
('B018', 'Logitech M331 Mouse', 200000, 14, 'Aksesoris Komputer'),
('B019', 'Barcode Scanner', 0, 11, 'Printer'),
('B020', 'Mechanical Keyboard', 3100000, 0, 'Aksesoris Komputer'),
('B021', 'Logitech K380 Keyboard', 400000, 10, 'Aksesoris Komputer');

--
-- Triggers `tbl_barang`
--
DELIMITER $$
CREATE TRIGGER `inkremenstok` BEFORE INSERT ON `tbl_barang` FOR EACH ROW SET NEW.stok = NEW.stok + 1
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` char(4) NOT NULL,
  `id_barang` char(4) NOT NULL,
  `jml_barang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_barang`, `jml_barang`) VALUES
('0001', 'B009', 4),
('0002', 'B015', 3),
('0003', 'B003', 1),
('0004', 'B018', 6),
('0006', 'B014', 2);

--
-- Triggers `transaksi`
--
DELIMITER $$
CREATE TRIGGER `updatestok` AFTER UPDATE ON `transaksi` FOR EACH ROW UPDATE tbl_barang
SET stok = stok + (NEW.jml_barang - OLD.jml_barang)
WHERE id_barang = NEW.id_barang
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_barang`
--
ALTER TABLE `tbl_barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `tbl_barang` (`id_barang`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
