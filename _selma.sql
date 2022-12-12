-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 10 Des 2022 pada 17.20
-- Versi Server: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: ` selma`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bank`
--

CREATE TABLE IF NOT EXISTS `bank` (
`id_bank` int(11) NOT NULL,
  `bank` varchar(60) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `bank`
--

INSERT INTO `bank` (`id_bank`, `bank`, `created_at`, `created_by`, `updated_by`, `updated_at`) VALUES
(1, 'BRI', '2022-12-10 03:35:35', NULL, NULL, NULL),
(2, 'BCA', '2022-12-10 03:35:35', NULL, NULL, NULL),
(3, 'BNI', '2022-12-10 03:35:48', NULL, NULL, NULL),
(4, 'MANDIRI', '2022-12-10 03:35:48', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `fakultas`
--

CREATE TABLE IF NOT EXISTS `fakultas` (
`id_fakultas` int(11) NOT NULL,
  `id_perguruan_tinggi` int(11) NOT NULL DEFAULT '0',
  `nama_fakultas` varchar(255) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `fakultas`
--

INSERT INTO `fakultas` (`id_fakultas`, `id_perguruan_tinggi`, `nama_fakultas`, `created_at`, `created_by`, `updated_by`, `updated_at`) VALUES
(1, 1, 'Fakultas Ilmu Komputer', '2022-12-10 03:22:11', NULL, NULL, NULL),
(2, 1, 'Fakultas Ekonomi', '2022-12-10 03:22:50', NULL, NULL, NULL),
(3, 1, 'Fakultas Teknik', '2022-12-10 03:23:24', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jalur_masuk`
--

CREATE TABLE IF NOT EXISTS `jalur_masuk` (
`id_jalur` int(11) NOT NULL,
  `nama_jalur` varchar(255) NOT NULL,
  `is_tes` enum('1','0') NOT NULL,
  `is_mandiri` enum('1','0') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jalur_masuk`
--

INSERT INTO `jalur_masuk` (`id_jalur`, `nama_jalur`, `is_tes`, `is_mandiri`, `created_at`, `created_by`, `updated_by`, `updated_at`) VALUES
(1, 'JALUR SNMPTN', '0', '0', '2022-12-10 03:34:01', NULL, NULL, NULL),
(2, 'JALUR MANDIRI TES', '1', '1', '2022-12-10 03:34:01', NULL, NULL, NULL),
(3, 'JALUR MANDIRI PRESTASI', '0', '1', '2022-12-10 03:34:33', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pendaftar`
--

CREATE TABLE IF NOT EXISTS `pendaftar` (
`id_pendaftar` int(11) NOT NULL,
  `id_jalur` int(11) NOT NULL,
  `no_pendaftar` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `nisn` varchar(15) DEFAULT NULL,
  `nik` varchar(20) DEFAULT NULL,
  `tempat_lahir` varchar(60) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  `id_prodi1` int(11) NOT NULL,
  `id_prodi2` int(11) DEFAULT NULL,
  `nominal_bayar` decimal(12,2) DEFAULT NULL,
  `id_bank` int(11) DEFAULT NULL,
  `is_bayar` enum('1','0') NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pendaftar_prestasi`
--

CREATE TABLE IF NOT EXISTS `pendaftar_prestasi` (
`id` int(11) NOT NULL,
  `id_pendaftar` int(11) NOT NULL DEFAULT '0',
  `tingkat_prestasi` enum('NASIONAL','INTERNASIONAL') NOT NULL,
  `nama_prestasi` varchar(255) NOT NULL,
  `tahun` int(11) NOT NULL,
  `url_dokumen` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `perguruan_tinggi`
--

CREATE TABLE IF NOT EXISTS `perguruan_tinggi` (
`id_perguruan_tinggi` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `perguruan_tinggi`
--

INSERT INTO `perguruan_tinggi` (`id_perguruan_tinggi`, `nama`, `created_at`, `created_by`, `updated_by`, `updated_at`) VALUES
(1, 'AMD Academy', '2022-12-10 03:21:01', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `prodi`
--

CREATE TABLE IF NOT EXISTS `prodi` (
`id_prodi` int(11) NOT NULL,
  `id_fakultas` int(11) NOT NULL,
  `nama_prodi` varchar(255) NOT NULL DEFAULT '0',
  `jenjang` enum('S2','S1') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `prodi`
--

INSERT INTO `prodi` (`id_prodi`, `id_fakultas`, `nama_prodi`, `jenjang`, `created_at`, `created_by`, `updated_by`, `updated_at`) VALUES
(1, 1, 'Teknik Informatika', 'S1', '2022-12-10 03:25:12', NULL, NULL, NULL),
(2, 1, 'Sistem Informasi', 'S1', '2022-12-10 03:25:12', NULL, NULL, NULL),
(3, 1, 'Teknologi Informasi', 'S1', '2022-12-10 03:27:07', NULL, NULL, NULL),
(4, 1, 'Ilmu Komputer', 'S2', '2022-12-10 03:27:07', NULL, NULL, NULL),
(5, 2, 'Ekonomi Pembangunan', 'S1', '2022-12-10 03:27:54', NULL, NULL, NULL),
(6, 2, 'Ekonomi Perbankan', 'S1', '2022-12-10 03:27:54', NULL, NULL, NULL),
(7, 2, 'Akuntansi', 'S1', '2022-12-10 03:28:33', NULL, NULL, NULL),
(8, 3, 'Teknik Elektro', 'S1', '2022-12-10 03:28:33', NULL, NULL, NULL),
(9, 3, 'Teknik Sipil', 'S1', '2022-12-10 03:29:13', NULL, NULL, NULL),
(10, 3, 'Teknik Arsitektur', 'S1', '2022-12-10 03:29:13', NULL, NULL, NULL),
(11, 1, 'Teknik Komputer', 'S1', '2022-12-10 03:31:26', NULL, NULL, NULL),
(12, 2, 'Ilmu Ekonomi', 'S2', '2022-12-10 03:31:26', NULL, NULL, NULL),
(13, 3, 'Teknik Sipil', 'S2', '2022-12-10 03:31:41', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
 ADD PRIMARY KEY (`id_bank`);

--
-- Indexes for table `fakultas`
--
ALTER TABLE `fakultas`
 ADD PRIMARY KEY (`id_fakultas`), ADD KEY `id_perguruan_tinggi` (`id_perguruan_tinggi`);

--
-- Indexes for table `jalur_masuk`
--
ALTER TABLE `jalur_masuk`
 ADD PRIMARY KEY (`id_jalur`);

--
-- Indexes for table `pendaftar`
--
ALTER TABLE `pendaftar`
 ADD PRIMARY KEY (`id_pendaftar`), ADD KEY `id_jalur` (`id_jalur`), ADD KEY `id_bank` (`id_bank`), ADD KEY `id_prodi1` (`id_prodi1`), ADD KEY `id_prodi2` (`id_prodi2`), ADD KEY `id_prodi2_2` (`id_prodi2`);

--
-- Indexes for table `pendaftar_prestasi`
--
ALTER TABLE `pendaftar_prestasi`
 ADD PRIMARY KEY (`id`), ADD KEY `id_pendaftar` (`id_pendaftar`);

--
-- Indexes for table `perguruan_tinggi`
--
ALTER TABLE `perguruan_tinggi`
 ADD PRIMARY KEY (`id_perguruan_tinggi`);

--
-- Indexes for table `prodi`
--
ALTER TABLE `prodi`
 ADD PRIMARY KEY (`id_prodi`), ADD KEY `id_fakultas` (`id_fakultas`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bank`
--
ALTER TABLE `bank`
MODIFY `id_bank` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `fakultas`
--
ALTER TABLE `fakultas`
MODIFY `id_fakultas` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `jalur_masuk`
--
ALTER TABLE `jalur_masuk`
MODIFY `id_jalur` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `pendaftar`
--
ALTER TABLE `pendaftar`
MODIFY `id_pendaftar` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pendaftar_prestasi`
--
ALTER TABLE `pendaftar_prestasi`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `perguruan_tinggi`
--
ALTER TABLE `perguruan_tinggi`
MODIFY `id_perguruan_tinggi` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `prodi`
--
ALTER TABLE `prodi`
MODIFY `id_prodi` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `fakultas`
--
ALTER TABLE `fakultas`
ADD CONSTRAINT `fakultas_ibfk_1` FOREIGN KEY (`id_perguruan_tinggi`) REFERENCES `perguruan_tinggi` (`id_perguruan_tinggi`);

--
-- Ketidakleluasaan untuk tabel `pendaftar`
--
ALTER TABLE `pendaftar`
ADD CONSTRAINT `pendaftar_ibfk_1` FOREIGN KEY (`id_jalur`) REFERENCES `jalur_masuk` (`id_jalur`),
ADD CONSTRAINT `pendaftar_ibfk_2` FOREIGN KEY (`id_bank`) REFERENCES `bank` (`id_bank`),
ADD CONSTRAINT `pendaftar_ibfk_3` FOREIGN KEY (`id_prodi1`) REFERENCES `prodi` (`id_prodi`),
ADD CONSTRAINT `pendaftar_ibfk_4` FOREIGN KEY (`id_prodi2`) REFERENCES `prodi` (`id_prodi`);

--
-- Ketidakleluasaan untuk tabel `pendaftar_prestasi`
--
ALTER TABLE `pendaftar_prestasi`
ADD CONSTRAINT `pendaftar_prestasi_ibfk_1` FOREIGN KEY (`id_pendaftar`) REFERENCES `pendaftar` (`id_pendaftar`);

--
-- Ketidakleluasaan untuk tabel `prodi`
--
ALTER TABLE `prodi`
ADD CONSTRAINT `prodi_ibfk_1` FOREIGN KEY (`id_fakultas`) REFERENCES `fakultas` (`id_fakultas`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
