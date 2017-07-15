-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 15, 2017 at 05:45 PM
-- Server version: 5.5.39
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `daib`
--

-- --------------------------------------------------------

--
-- Table structure for table `resi_new`
--

CREATE TABLE IF NOT EXISTS `resi_new` (
`id_resi` int(10) NOT NULL,
  `tgl` datetime NOT NULL,
  `id_barang` int(10) NOT NULL,
  `liter` int(2) NOT NULL,
  `galon` int(3) NOT NULL,
  `harga` int(10) NOT NULL,
  `sub` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin`
--

CREATE TABLE IF NOT EXISTS `tb_admin` (
`id_admin` int(10) NOT NULL,
  `nama_admin` varchar(20) NOT NULL,
  `username_admin` varchar(20) NOT NULL,
  `email_admin` varchar(20) NOT NULL,
  `alamat_admin` varchar(100) NOT NULL,
  `hp_admin` varchar(14) NOT NULL,
  `pass` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `tb_admin`
--

INSERT INTO `tb_admin` (`id_admin`, `nama_admin`, `username_admin`, `email_admin`, `alamat_admin`, `hp_admin`, `pass`) VALUES
(5, 'anggyka nuarry', 'anggyka', 'anggyka@gmail.com', 'jln.suprapto no.43 sampit', '+6281255461907', '$2y$10$kY2MELvIFJ5MHk1JMnyEWeklMZkbUrAPvp6qGVrTmgxxZrO9d4Lwe'),
(6, 'risa', 'risa12345', 'risa@gmail.com', 'jl. tartar tedampar', '+6285231158186', '$2y$10$2Q8YXW5MaEILM7e.Xd1FfuG9iscd3moYZNX.LEiGPqX.4d1bm3jY.');

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang_new`
--

CREATE TABLE IF NOT EXISTS `tb_barang_new` (
`id_barang` int(10) NOT NULL,
  `nama_barang` varchar(20) NOT NULL,
  `hrg_5` int(10) NOT NULL,
  `hrg_10` int(10) NOT NULL,
  `hrg_20` int(10) NOT NULL,
  `hrg_25` int(10) NOT NULL,
  `hrg_30` int(10) NOT NULL,
  `deskripsi` text NOT NULL,
  `gambar` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tb_barang_new`
--

INSERT INTO `tb_barang_new` (`id_barang`, `nama_barang`, `hrg_5`, `hrg_10`, `hrg_20`, `hrg_25`, `hrg_30`, `deskripsi`, `gambar`) VALUES
(1, 'OZON', 3000, 4000, 6000, 9000, 10000, '', ''),
(2, 'RO', 2000, 3000, 5000, 6000, 8000, '', ''),
(3, 'KONVENSIONAL', 1000, 2000, 3000, 4000, 5000, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tb_keluar`
--

CREATE TABLE IF NOT EXISTS `tb_keluar` (
  `kode_pengeluaran` char(10) NOT NULL,
  `jenis_pengeluaran` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_keluar`
--

INSERT INTO `tb_keluar` (`kode_pengeluaran`, `jenis_pengeluaran`) VALUES
('JD-01', 'Tutup Galon'),
('JD-02', 'Tisu Galon');

-- --------------------------------------------------------

--
-- Table structure for table `tb_keranjang_new`
--

CREATE TABLE IF NOT EXISTS `tb_keranjang_new` (
`id_keranjang` int(10) NOT NULL,
  `id_pelanggan` int(10) NOT NULL,
  `id_barang` int(10) NOT NULL,
  `harga_produk` int(10) NOT NULL,
  `qty_produk` int(255) NOT NULL,
  `tgl_produk` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pelanggan_new`
--

CREATE TABLE IF NOT EXISTS `tb_pelanggan_new` (
`id_pelanggan` int(10) NOT NULL,
  `nama_pelanggan` varchar(20) NOT NULL,
  `username_pelanggan` varchar(20) NOT NULL,
  `email_pelanggan` varchar(20) NOT NULL,
  `alamat_pelanggan` varchar(100) NOT NULL,
  `hp_pelanggan` varchar(14) NOT NULL,
  `pass` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `tb_pelanggan_new`
--

INSERT INTO `tb_pelanggan_new` (`id_pelanggan`, `nama_pelanggan`, `username_pelanggan`, `email_pelanggan`, `alamat_pelanggan`, `hp_pelanggan`, `pass`) VALUES
(2, 'anggyka', 'anggyka', 'anggyka@gmail.com', 'dadadadadad', '+6281255461907', '$2y$10$kY2MELvIFJ5MHk1JMnyEWeklMZkbUrAPvp6qGVrTmgxxZrO9d4Lwe'),
(4, 'risa', 'risa12345', 'risa@gmail.com', 'jl.tartar tedampar', '+6285231158186', '$2y$10$l6YxHPV1Sz/Ng4VUUWStceA0Xjh6.B./euJPmq/pz/oQSTYXdGc4m'),
(8, 'ulun', 'ulun12345', 'ulun@gmail.com', 'jhjahdaud', '+6285787231119', '$2y$10$QoHZBueD2HK/eU1VgKVElujf006LBi2S.GG0gkKdzVw2xRnSNr/Du');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pemesanan_new`
--

CREATE TABLE IF NOT EXISTS `tb_pemesanan_new` (
`id_pemesanan` int(10) NOT NULL,
  `tgl_pemesanan` datetime NOT NULL,
  `id_pelanggan` int(10) NOT NULL,
  `ozon` int(3) NOT NULL,
  `ro` int(3) NOT NULL,
  `conv` int(3) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `tb_pemesanan_new`
--

INSERT INTO `tb_pemesanan_new` (`id_pemesanan`, `tgl_pemesanan`, `id_pelanggan`, `ozon`, `ro`, `conv`, `status`) VALUES
(5, '2017-07-02 00:43:12', 2, 5, 4, 0, 'Selesai'),
(6, '2017-07-07 09:08:14', 2, 0, 2, 5, 'Selesai'),
(7, '2017-07-11 04:24:49', 4, 6, 6, 6, 'Selesai'),
(8, '2017-07-11 04:27:39', 2, 4, 4, 4, 'Belum Diproses'),
(9, '2017-07-11 05:06:18', 4, 4, 0, 0, 'Selesai');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengeluaran`
--

CREATE TABLE IF NOT EXISTS `tb_pengeluaran` (
`id_pengeluaran` int(10) NOT NULL,
  `tgl_k` datetime NOT NULL,
  `kode_pengeluaran` varchar(15) NOT NULL,
  `jumlah_k` int(3) NOT NULL,
  `harga_k` int(10) NOT NULL,
  `total_k` int(10) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tb_pengeluaran`
--

INSERT INTO `tb_pengeluaran` (`id_pengeluaran`, `tgl_k`, `kode_pengeluaran`, `jumlah_k`, `harga_k`, `total_k`) VALUES
(2, '2017-06-16 19:01:16', 'JD-01', 3, 50000, 150000),
(3, '2017-07-07 20:48:01', 'JD-01', 4, 100000, 400000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_penjualan_new`
--

CREATE TABLE IF NOT EXISTS `tb_penjualan_new` (
`id_penjualan` int(10) NOT NULL,
  `id_resi` int(10) NOT NULL,
  `id_transaksi` int(10) NOT NULL,
  `tgl` datetime NOT NULL,
  `id_barang` int(10) NOT NULL,
  `liter` int(2) NOT NULL,
  `galon` int(3) NOT NULL,
  `harga` int(10) NOT NULL,
  `sub` int(10) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `tb_penjualan_new`
--

INSERT INTO `tb_penjualan_new` (`id_penjualan`, `id_resi`, `id_transaksi`, `tgl`, `id_barang`, `liter`, `galon`, `harga`, `sub`) VALUES
(1, 1102616465, 1398277028, '2017-06-20 12:31:32', 3, 10, 3, 2000, 6000),
(2, 1145853037, 1398277028, '2017-06-20 12:31:51', 3, 25, 5, 4000, 20000),
(3, 1333103058, 1398277028, '2017-06-20 12:31:20', 1, 10, 23, 4000, 92000),
(4, 1037217240, 1242212401, '2017-06-20 12:32:40', 2, 5, 12, 2000, 24000),
(5, 1327721951, 1242212401, '2017-06-20 12:32:47', 2, 30, 21, 8000, 168000),
(6, 1333578598, 1242212401, '2017-06-20 12:32:33', 2, 20, 7, 5000, 35000),
(7, 1296949525, 1241799432, '2017-07-04 09:37:36', 2, 5, 4, 2000, 8000),
(8, 1314119012, 1022625679, '2017-07-11 10:13:14', 1, 5, 9, 3000, 27000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pesan_keluar`
--

CREATE TABLE IF NOT EXISTS `tb_pesan_keluar` (
`id_pesankeluar` int(11) NOT NULL,
  `process_id` varchar(50) NOT NULL,
  `nomortujuan` text NOT NULL,
  `pesan` text NOT NULL,
  `status` varchar(25) NOT NULL,
  `status_informasi` text NOT NULL,
  `waktu_kirim` datetime NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tb_pesan_keluar`
--

INSERT INTO `tb_pesan_keluar` (`id_pesankeluar`, `process_id`, `nomortujuan`, `pesan`, `status`, `status_informasi`, `waktu_kirim`) VALUES
(1, '596a384b04b37', '081295886962', 'test kirim sms', 'success', '', '2017-07-15 17:07:11'),
(2, '596a38618adf5', '0812958869622', 'test error', 'success', '', '2017-07-15 17:07:33'),
(3, '596a38802151c', '532761598789719236986876', 'test error 2', 'error', 'Nomor  532761598789719236986876 tidak sesuai format (kurang dari 10 karakter / lebih dari 13 karakter)', '2017-07-15 17:07:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `resi_new`
--
ALTER TABLE `resi_new`
 ADD PRIMARY KEY (`id_resi`);

--
-- Indexes for table `tb_admin`
--
ALTER TABLE `tb_admin`
 ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `tb_barang_new`
--
ALTER TABLE `tb_barang_new`
 ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `tb_keranjang_new`
--
ALTER TABLE `tb_keranjang_new`
 ADD PRIMARY KEY (`id_keranjang`);

--
-- Indexes for table `tb_pelanggan_new`
--
ALTER TABLE `tb_pelanggan_new`
 ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `tb_pemesanan_new`
--
ALTER TABLE `tb_pemesanan_new`
 ADD PRIMARY KEY (`id_pemesanan`);

--
-- Indexes for table `tb_pengeluaran`
--
ALTER TABLE `tb_pengeluaran`
 ADD PRIMARY KEY (`id_pengeluaran`);

--
-- Indexes for table `tb_penjualan_new`
--
ALTER TABLE `tb_penjualan_new`
 ADD PRIMARY KEY (`id_penjualan`), ADD KEY `id_resi` (`id_transaksi`);

--
-- Indexes for table `tb_pesan_keluar`
--
ALTER TABLE `tb_pesan_keluar`
 ADD PRIMARY KEY (`id_pesankeluar`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `resi_new`
--
ALTER TABLE `resi_new`
MODIFY `id_resi` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_admin`
--
ALTER TABLE `tb_admin`
MODIFY `id_admin` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tb_barang_new`
--
ALTER TABLE `tb_barang_new`
MODIFY `id_barang` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tb_keranjang_new`
--
ALTER TABLE `tb_keranjang_new`
MODIFY `id_keranjang` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_pelanggan_new`
--
ALTER TABLE `tb_pelanggan_new`
MODIFY `id_pelanggan` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tb_pemesanan_new`
--
ALTER TABLE `tb_pemesanan_new`
MODIFY `id_pemesanan` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tb_pengeluaran`
--
ALTER TABLE `tb_pengeluaran`
MODIFY `id_pengeluaran` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tb_penjualan_new`
--
ALTER TABLE `tb_penjualan_new`
MODIFY `id_penjualan` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tb_pesan_keluar`
--
ALTER TABLE `tb_pesan_keluar`
MODIFY `id_pesankeluar` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
