-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Mar 2024 pada 08.12
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_tokobuku`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `author`
--

CREATE TABLE `author` (
  `name` varchar(50) NOT NULL,
  `address` varchar(30) DEFAULT NULL,
  `url` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `book`
--

CREATE TABLE `book` (
  `ISBN` int(25) NOT NULL,
  `year` int(10) DEFAULT NULL,
  `title` varchar(30) DEFAULT NULL,
  `price` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `contains`
--

CREATE TABLE `contains` (
  `number` varchar(25) NOT NULL,
  `ISBN` int(25) DEFAULT NULL,
  `basketID` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `email` varchar(30) NOT NULL,
  `phone` int(25) DEFAULT NULL,
  `address` text,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `publisher`
--

CREATE TABLE `publisher` (
  `name` varchar(50) NOT NULL,
  `address` varchar(30) DEFAULT NULL,
  `phone` int(25) DEFAULT NULL,
  `url` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `publish_by`
--

CREATE TABLE `publish_by` (
  `id` int(5) NOT NULL,
  `name_publisher` varchar(30) DEFAULT NULL,
  `ISBN` int(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `shopping_basket`
--

CREATE TABLE `shopping_basket` (
  `basketID` int(5) NOT NULL,
  `number` varchar(25) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `stocks`
--

CREATE TABLE `stocks` (
  `number` int(25) NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `ISBN` int(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `warehouse`
--

CREATE TABLE `warehouse` (
  `code` varchar(5) NOT NULL,
  `phone` int(25) DEFAULT NULL,
  `address` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `written_by`
--

CREATE TABLE `written_by` (
  `id` int(5) NOT NULL,
  `name_author` varchar(30) DEFAULT NULL,
  `ISBN` int(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`name`);

--
-- Indeks untuk tabel `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`ISBN`);

--
-- Indeks untuk tabel `contains`
--
ALTER TABLE `contains`
  ADD PRIMARY KEY (`number`),
  ADD KEY `ISBN_cons` (`ISBN`),
  ADD KEY `basketID` (`basketID`);

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`name`);

--
-- Indeks untuk tabel `publish_by`
--
ALTER TABLE `publish_by`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name_publisher` (`name_publisher`),
  ADD KEY `ISBN` (`ISBN`);

--
-- Indeks untuk tabel `shopping_basket`
--
ALTER TABLE `shopping_basket`
  ADD PRIMARY KEY (`basketID`),
  ADD KEY `email` (`email`),
  ADD KEY `number` (`number`);

--
-- Indeks untuk tabel `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`number`),
  ADD KEY `ISBN_stock` (`ISBN`),
  ADD KEY `code` (`code`);

--
-- Indeks untuk tabel `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`code`);

--
-- Indeks untuk tabel `written_by`
--
ALTER TABLE `written_by`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name_author` (`name_author`),
  ADD KEY `ISBN_au` (`ISBN`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `contains`
--
ALTER TABLE `contains`
  ADD CONSTRAINT `ISBN_cons` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`),
  ADD CONSTRAINT `basketID` FOREIGN KEY (`basketID`) REFERENCES `shopping_basket` (`basketID`);

--
-- Ketidakleluasaan untuk tabel `publish_by`
--
ALTER TABLE `publish_by`
  ADD CONSTRAINT `ISBN` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`),
  ADD CONSTRAINT `name_publisher` FOREIGN KEY (`name_publisher`) REFERENCES `publisher` (`name`);

--
-- Ketidakleluasaan untuk tabel `shopping_basket`
--
ALTER TABLE `shopping_basket`
  ADD CONSTRAINT `email` FOREIGN KEY (`email`) REFERENCES `customer` (`email`),
  ADD CONSTRAINT `number` FOREIGN KEY (`number`) REFERENCES `contains` (`number`);

--
-- Ketidakleluasaan untuk tabel `stocks`
--
ALTER TABLE `stocks`
  ADD CONSTRAINT `ISBN_stock` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`),
  ADD CONSTRAINT `code` FOREIGN KEY (`code`) REFERENCES `warehouse` (`code`);

--
-- Ketidakleluasaan untuk tabel `written_by`
--
ALTER TABLE `written_by`
  ADD CONSTRAINT `ISBN_au` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`),
  ADD CONSTRAINT `name_author` FOREIGN KEY (`name_author`) REFERENCES `author` (`name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
