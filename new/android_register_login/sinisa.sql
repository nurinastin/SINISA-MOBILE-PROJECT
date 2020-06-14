-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 28, 2020 at 04:18 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sinisa`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` varchar(5) NOT NULL,
  `nama_barang` varchar(20) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  `gambar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `harga`, `stok`, `gambar`) VALUES
('SA001', 'Traktor', 100000, 5, 'Traktor.jpg'),
('SA002', 'Penggiling Padi', 100000, 5, 'penggilingpadi.jpg'),
('SA003', 'Penggembur Tanah', 100000, 5, 'penggemburtanah.jpg'),
('SA004', 'Penyedot Air', 50000, 5, 'penyedotair.jpg'),
('SA005', 'Penyemprot Hama', 25000, 5, 'penyemprot.jpg'),
('SA006', 'Cangkul', 5000, 10, 'category4.png'),
('SA007', 'Halo', 10000, 2, 'coba.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `penyuluhan`
--

CREATE TABLE `penyuluhan` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `nama_instansi` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL,
  `tanggal_input` date NOT NULL,
  `tanggal_output` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penyuluhan`
--

INSERT INTO `penyuluhan` (`id`, `nama`, `nama_instansi`, `status`, `tanggal_input`, `tanggal_output`) VALUES
(7, 'nina', 'joss', '', '2020-01-10', '2020-01-17'),
(8, 'jbyt', 'uigrd', '', '2020-01-10', '2020-02-01'),
(10, 'nana', 'jojo', '', '2020-01-11', '2020-01-31'),
(11, 'nira', 'lululu', '', '2020-01-11', '2020-01-30'),
(12, 'wow', 'hmm', '', '2020-01-11', '2020-01-26'),
(13, 'harum', 'huuuhh', '', '2020-01-11', '2020-01-25'),
(14, 'Nurinda', 'loala', '', '2020-01-12', '2020-02-19'),
(15, '', '', '', '2020-01-12', '2020-09-16'),
(16, '', '', '', '2020-01-12', '2020-01-19'),
(17, '', '', '', '2020-01-12', '2020-12-18'),
(19, '', '', '', '0000-00-00', '0000-00-00'),
(20, 'faizal', 'POLIJE', '', '2020-01-12', '2020-01-21'),
(21, 'dewi', 'daramuda', '', '2020-01-12', '2020-02-22');

-- --------------------------------------------------------

--
-- Table structure for table `sewa`
--

CREATE TABLE `sewa` (
  `nik` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `no_telepon` varchar(14) NOT NULL,
  `nama_barang` varchar(20) NOT NULL,
  `id_barang` varchar(5) NOT NULL,
  `tanggal_sewa` date NOT NULL,
  `tanggal_kembali` date NOT NULL,
  `jumlah_hari` int(11) NOT NULL,
  `harga_sewa` int(11) NOT NULL,
  `asal` varchar(30) NOT NULL,
  `alamat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sewa`
--

INSERT INTO `sewa` (`nik`, `nama`, `no_telepon`, `nama_barang`, `id_barang`, `tanggal_sewa`, `tanggal_kembali`, `jumlah_hari`, `harga_sewa`, `asal`, `alamat`) VALUES
('', '', '', 'Penggembur Tanah', 'SA003', '0000-00-00', '0000-00-00', 0, 0, '', ''),
('093487389457', 'Willy Arief', '082141862950', 'Traktor', 'SA001', '2020-01-28', '2020-01-30', 2, 200000, 'Surabaya', 'Sedati'),
('123456789088', '123123', '123123', 'Penggembur Tanah', 'SA003', '2020-01-27', '2020-01-29', 2, 200000, 'Probolinggo', 'Jl. A. Yani 20'),
('44100', 'Putri Budiasih', '085330184600', 'Penggembur Tanah', 'SA003', '2020-01-27', '2020-01-30', 3, 300000, 'Surabaya', 'Sidoarjo, Indonesia'),
('sadgjahsd', 'asdahsdg', 'asdjaghsdjk', 'Traktor', 'SA001', '2020-01-27', '2020-01-30', 3, 300000, 'asd', 'asdasd');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nik` varchar(20) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `level` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nik`, `nama`, `alamat`, `username`, `password`, `level`) VALUES
(1, '12345678910', 'nurin', 'Jember', 'nurin', 'nurin123', 'admin'),
(2, '112233445566', 'puput', 'Probolinggo', 'puput', 'puput123', 'user'),
(4, '234567891112', 'kanisa', 'JEMBER', 'kanisa', 'kanisa123', 'user'),
(5, '123456789088', 'abdul', 'jember ', 'abdul', 'abdul123', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `penyuluhan`
--
ALTER TABLE `penyuluhan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sewa`
--
ALTER TABLE `sewa`
  ADD PRIMARY KEY (`nik`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `penyuluhan`
--
ALTER TABLE `penyuluhan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
