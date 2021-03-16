-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 17 mars 2021 à 00:16
-- Version du serveur :  10.4.14-MariaDB
-- Version de PHP : 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projetweddou`
--

-- --------------------------------------------------------

--
-- Structure de la table `struts2crud`
--

CREATE TABLE `struts2crud` (
  `uname` varchar(25) DEFAULT NULL,
  `uemail` varchar(50) NOT NULL,
  `upass` varchar(25) DEFAULT NULL,
  `udeg` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `struts2crud`
--

INSERT INTO `struts2crud` (`uname`, `uemail`, `upass`, `udeg`) VALUES
('Ahmed sid', 'Ahmed12@gmail.com', '123456', 'IT'),
('cheikh', 'cheikh1@gmail.com', '1234567', 'technicien reseaux'),
('cheikh Islam', 'cheikh@gmail.com', '123456', 'web designer'),
('Mariem', 'mariem@gmail.com', '123456', 'Journaliste'),
('Mohamed', 'Mohamed1@gmail.com', '1234567', 'java developper'),
('Mohamed', 'Mohamed@gmail.com', '12345678', 'php developper'),
('Salem', 'sale@gmail.com', '876354', 'php developer'),
('sidi', 'sidi@gmail.com', '12345678', 'java developper'),
('weddou', 'weddou@gmail.com', '12345678', 'Admin Systeme');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(20) NOT NULL,
  `UNAME` varchar(50) NOT NULL,
  `UPASS` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `UNAME`, `UPASS`) VALUES
(1, 'weddou', '123456');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `struts2crud`
--
ALTER TABLE `struts2crud`
  ADD PRIMARY KEY (`uemail`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
