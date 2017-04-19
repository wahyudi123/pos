-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 26 Sep 2014 pada 13.33
-- Versi Server: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `inventory`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE IF NOT EXISTS `barang` (
  `barang_id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_barang` varchar(5) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  PRIMARY KEY (`barang_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`barang_id`, `kode_barang`, `kategori_id`, `nama_barang`, `harga`) VALUES
(18, 'BR001', 6, 'lumia 800', 1200000),
(19, 'BR002', 6, 'vandroid s5', 100000),
(20, 'BR003', 6, 'samsung galaxi x', 2000000),
(21, 'BR004', 6, 'sony', 3000000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_customer` varchar(5) NOT NULL,
  `nama_customer` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `telpon_customer` varchar(12) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`customer_id`, `kode_customer`, `nama_customer`, `alamat`, `telpon_customer`) VALUES
(1, 'CS001', 'p.cemerlang abdi', 'jl.sangkuriang no 43', '021876527'),
(2, 'CS002', 'pt.cipta adi kusuma', 'jl.kecamatan hilir no 456', '02121876563');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_barang`
--

CREATE TABLE IF NOT EXISTS `kategori_barang` (
  `kategori_id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(50) NOT NULL,
  PRIMARY KEY (`kategori_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data untuk tabel `kategori_barang`
--

INSERT INTO `kategori_barang` (`kategori_id`, `nama_kategori`) VALUES
(1, 'mie instan'),
(2, 'minyak'),
(6, 'handphone'),
(8, 'sepatu'),
(9, 'tas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `operator`
--

CREATE TABLE IF NOT EXISTS `operator` (
  `operator_id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_lengkap` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `last_login` date NOT NULL,
  `level` enum('penjualan','pembelian') NOT NULL,
  PRIMARY KEY (`operator_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data untuk tabel `operator`
--

INSERT INTO `operator` (`operator_id`, `nama_lengkap`, `username`, `password`, `last_login`, `level`) VALUES
(1, 'nuris akbar', 'nuris', '74d7273be4b0ddeac49bfa169b288c5b', '2014-09-26', 'penjualan'),
(2, 'wahyu safrizal', 'ida', '7f78f270e3e1129faf118ed92fdf54db', '2014-07-17', 'penjualan'),
(4, 'irma', 'irma', '76af47488ac4ecce7c29005f15cf7d0e', '0000-00-00', 'pembelian');

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier`
--

CREATE TABLE IF NOT EXISTS `supplier` (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_supplier` varchar(100) NOT NULL,
  `alamat_supplier` text NOT NULL,
  `telpon_supplier` varchar(12) NOT NULL,
  `kode_supplier` varchar(5) NOT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data untuk tabel `supplier`
--

INSERT INTO `supplier` (`supplier_id`, `nama_supplier`, `alamat_supplier`, `telpon_supplier`, `kode_supplier`) VALUES
(1, 'pt.angin ribut', 'jl.kosambi no 56', '082121098745', 'SP001'),
(2, 'pt.angkasa 1', 'jl.sangkuring no 422', '02121876563', 'SP002');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE IF NOT EXISTS `transaksi` (
  `transaksi_id` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal_transaksi` date NOT NULL,
  `operator_id` int(11) NOT NULL,
  PRIMARY KEY (`transaksi_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`transaksi_id`, `tanggal_transaksi`, `operator_id`) VALUES
(7, '2014-07-18', 1),
(6, '2014-07-17', 2),
(5, '2014-07-17', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_beli`
--

CREATE TABLE IF NOT EXISTS `transaksi_beli` (
  `transaksibeli_id` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` date NOT NULL,
  `supplier_id` int(11) NOT NULL,
  PRIMARY KEY (`transaksibeli_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data untuk tabel `transaksi_beli`
--

INSERT INTO `transaksi_beli` (`transaksibeli_id`, `tanggal`, `supplier_id`) VALUES
(1, '2014-09-26', 1),
(2, '2014-09-26', 1),
(3, '2014-09-26', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_beli_detail`
--

CREATE TABLE IF NOT EXISTS `transaksi_beli_detail` (
  `belidetail_id` int(11) NOT NULL AUTO_INCREMENT,
  `barang_id` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `transaksibeli_id` int(11) NOT NULL,
  `status` int(11) NOT NULL COMMENT '1= sudah diproses , 0 belum diproses',
  PRIMARY KEY (`belidetail_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data untuk tabel `transaksi_beli_detail`
--

INSERT INTO `transaksi_beli_detail` (`belidetail_id`, `barang_id`, `harga`, `qty`, `transaksibeli_id`, `status`) VALUES
(1, 18, 800000, 150, 1, 1),
(2, 18, 800000, 50, 1, 1),
(3, 19, 1200000, 500, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_detail`
--

CREATE TABLE IF NOT EXISTS `transaksi_detail` (
  `t_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `barang_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `transaksi_id` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `status` enum('0','1') NOT NULL COMMENT '1= sudah diproses , 0 belum diproses',
  PRIMARY KEY (`t_detail_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_jual`
--

CREATE TABLE IF NOT EXISTS `transaksi_jual` (
  `transaksi_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `tanggal_transaksi` date NOT NULL,
  `operator_id` int(11) NOT NULL,
  PRIMARY KEY (`transaksi_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data untuk tabel `transaksi_jual`
--

INSERT INTO `transaksi_jual` (`transaksi_id`, `customer_id`, `tanggal_transaksi`, `operator_id`) VALUES
(1, 1, '2014-09-26', 1),
(2, 2, '2014-09-26', 1),
(3, 2, '2014-09-26', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_jual_detail`
--

CREATE TABLE IF NOT EXISTS `transaksi_jual_detail` (
  `detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `barang_id` int(11) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `transaksi_id` int(11) NOT NULL,
  PRIMARY KEY (`detail_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data untuk tabel `transaksi_jual_detail`
--

INSERT INTO `transaksi_jual_detail` (`detail_id`, `barang_id`, `harga_jual`, `qty`, `status`, `transaksi_id`) VALUES
(1, 18, 1200000, 50, 1, 1),
(3, 19, 100000, 300, 1, 2);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
