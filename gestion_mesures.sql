-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le :  ven. 03 mai 2019 à 09:32
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `gestion_mesures`
--
CREATE DATABASE IF NOT EXISTS `gestion_mesures` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `gestion_mesures`;

-- --------------------------------------------------------

--
-- Structure de la table `actionneur`
--

CREATE TABLE `actionneur` (
  `id_actionneur` int(11) NOT NULL,
  `nom` varchar(10) DEFAULT NULL,
  `type_actionneur` varchar(30) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `etat` varchar(10) DEFAULT 'OFF'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `actionneur`
--

INSERT INTO `actionneur` (`id_actionneur`, `nom`, `type_actionneur`, `description`, `etat`) VALUES
(1, 'vnc0', 'moteur', 'vnc0 : ventilation', 'OFF'),
(2, 'vnc2', 'moteur', 'vnc2 : ventilation', 'OFF'),
(3, 'rad1', 'graduateur', 'rad1 : chauffage', 'OFF'),
(4, 'rad2', 'graduateur', 'rad2 : chauffage', 'OFF'),
(5, 'rad3', 'graduateur', 'rad3 : chauffage', 'OFF'),
(6, 'rad4', 'graduateur', 'rad4 : chauffage', 'OFF'),
(7, 'volet1', 'moteur', 'volet1', 'OFF'),
(8, 'volet2', 'moteur', 'volet2', 'OFF'),
(9, 'volet3', 'moteur', 'volet3', 'OFF'),
(10, 'volets4-5', 'moteur', 'volets4-5', 'OFF'),
(11, 'volets6-7', 'moteur', 'volets6-7', 'OFF'),
(12, 'vnc1', 'moteur', 'Ventilation naturelle controlee', 'OFF');

-- --------------------------------------------------------

--
-- Structure de la table `actionneur2zone`
--

CREATE TABLE `actionneur2zone` (
  `id_actionneur` int(11) NOT NULL DEFAULT '0',
  `id_zone` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `actionneur2zone`
--

INSERT INTO `actionneur2zone` (`id_actionneur`, `id_zone`) VALUES
(1, 8),
(2, 9),
(3, 8),
(4, 9),
(4, 10),
(4, 11),
(7, 8),
(8, 9),
(9, 10),
(10, 13),
(10, 14),
(11, 11),
(11, 12);

-- --------------------------------------------------------

--
-- Structure de la table `capteur`
--

CREATE TABLE `capteur` (
  `id_capteur` int(11) NOT NULL,
  `nom` varchar(10) DEFAULT NULL,
  `id_zone` int(11) DEFAULT NULL,
  `type_capteur` varchar(30) DEFAULT NULL,
  `unite` varchar(5) DEFAULT NULL,
  `valmin` decimal(10,0) DEFAULT NULL,
  `valmax` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `capteur`
--

INSERT INTO `capteur` (`id_capteur`, `nom`, `id_zone`, `type_capteur`, `unite`, `valmin`, `valmax`) VALUES
(1, 'co213', 8, 'CO2', 'ppm', '300', '3000'),
(2, 'co214', 9, 'CO2', 'ppm', '300', '3000'),
(3, 'co215', 10, 'CO2', 'ppm', '300', '3000'),
(4, 'temp3', 14, 'temperature', 'degre', '6', '40'),
(5, 'temp210', 14, 'temperature', 'degre', '6', '40'),
(6, 'temp209', 13, 'temperature', 'degre', '6', '40'),
(7, 'temp214', 9, 'temperature', 'degre', '6', '40'),
(8, 'temp217', 12, 'temperature', 'degre', '6', '40'),
(9, 'temp215', 10, 'temperature', 'degre', '6', '40'),
(10, 'hygro210', 14, 'humidite', '%', '20', '100'),
(11, 'hygro209', 13, 'humidite', '%', '20', '100'),
(12, 'hygro217', 12, 'humidite', '%', '20', '100'),
(13, 'hygro214', 9, 'humidite', '%', '20', '100'),
(14, 'hygro215', 10, 'humidite', '%', '20', '100');

-- --------------------------------------------------------

--
-- Structure de la table `mesure`
--

CREATE TABLE `mesure` (
  `id_mesure` int(11) NOT NULL,
  `id_capteur` int(11) DEFAULT NULL,
  `instant` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `valeur` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `mesure`
--

INSERT INTO `mesure` (`id_mesure`, `id_capteur`, `instant`, `valeur`) VALUES
(1, 3, '2019-02-21 03:00:00', '820'),
(2, 3, '2019-02-21 07:00:00', '9000'),
(3, 3, '2019-02-20 23:00:00', '9800'),
(4, 14, '2019-02-21 03:00:00', '20'),
(5, 14, '2019-02-21 07:00:00', '35'),
(6, 2, '2019-02-21 03:00:00', '2500'),
(7, 2, '2019-02-21 07:00:00', '330'),
(8, 2, '2019-02-20 23:00:00', '830'),
(9, 14, '2019-02-19 23:00:00', '20'),
(10, 14, '2019-02-20 03:00:00', '35'),
(11, 2, '2019-02-20 07:00:00', '2500'),
(12, 2, '2019-02-20 11:00:00', '330'),
(13, 2, '2019-02-20 15:00:00', '830'),
(14, 14, '2019-02-20 19:00:00', '35'),
(15, 2, '2019-02-20 07:00:00', '2500'),
(16, 2, '2019-02-20 11:00:00', '330'),
(17, 9, '2019-02-20 15:00:00', '14'),
(18, 9, '2019-02-20 19:00:00', '14'),
(19, 7, '2019-02-20 07:00:00', '20'),
(20, 7, '2019-02-20 11:00:00', '25'),
(21, 7, '2019-02-20 15:00:00', '25'),
(22, 7, '2019-02-20 19:00:00', '33'),
(23, 7, '2019-02-20 03:00:00', '30'),
(24, 9, '2019-02-18 23:00:00', '12'),
(25, 9, '2019-02-19 03:00:00', '10'),
(26, 9, '2019-02-19 07:00:00', '10'),
(27, 9, '2019-02-19 11:00:00', '12'),
(28, 9, '2019-02-19 15:00:00', '25'),
(29, 9, '2019-02-19 19:00:00', '24'),
(30, 9, '2019-02-19 21:00:00', '52'),
(31, 9, '2019-02-19 22:00:00', '40'),
(32, 7, '2019-02-19 03:00:00', '18'),
(33, 7, '2019-02-19 07:00:00', '20'),
(34, 7, '2019-02-19 11:00:00', '30'),
(35, 7, '2019-02-19 15:00:00', '34'),
(36, 7, '2019-02-19 19:00:00', '20'),
(37, 14, '2019-02-18 23:00:00', '20'),
(38, 14, '2019-02-19 03:00:00', '40'),
(39, 2, '2019-02-19 07:00:00', '2500'),
(40, 2, '2019-02-19 11:00:00', '330'),
(41, 2, '2019-02-19 15:00:00', '830'),
(42, 14, '2019-02-19 19:00:00', '35'),
(43, 2, '2019-02-19 07:00:00', '2500'),
(44, 2, '2019-02-19 11:00:00', '330'),
(45, 9, '2019-02-18 07:00:00', '42'),
(46, 9, '2019-02-18 11:00:00', '25'),
(47, 9, '2019-02-18 19:00:00', '25'),
(48, 14, '2019-02-18 07:00:00', '20'),
(49, 14, '2019-02-18 09:00:00', '40'),
(50, 14, '2019-02-18 11:00:00', '80'),
(51, 13, '2019-02-18 13:00:00', '99'),
(52, 13, '2019-02-18 15:00:00', '75'),
(53, 3, '2019-02-18 11:00:00', '5000'),
(54, 3, '2019-02-18 13:00:00', '1500'),
(55, 3, '2019-02-18 15:00:00', '300'),
(56, 3, '2019-02-17 07:00:00', '820'),
(57, 3, '2019-02-17 11:00:00', '9000'),
(58, 3, '2019-02-17 13:00:00', '9800');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `moy_capt_zone`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `moy_capt_zone` (
);

-- --------------------------------------------------------

--
-- Structure de la table `zone`
--

CREATE TABLE `zone` (
  `id_zone` int(11) NOT NULL,
  `nom` varchar(10) DEFAULT NULL,
  `id_zone_container` int(11) DEFAULT NULL,
  `gpsX` decimal(10,0) DEFAULT NULL,
  `gpsY` decimal(10,0) DEFAULT NULL,
  `longueur` decimal(10,0) DEFAULT NULL,
  `largeur` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `zone`
--

INSERT INTO `zone` (`id_zone`, `nom`, `id_zone_container`, `gpsX`, `gpsY`, `longueur`, `largeur`) VALUES
(1, 'Polytech', NULL, NULL, NULL, NULL, NULL),
(2, 'A', 1, NULL, NULL, NULL, NULL),
(3, 'B', 1, NULL, NULL, NULL, NULL),
(4, 'C', 1, NULL, NULL, NULL, NULL),
(5, 'RDC', 2, NULL, NULL, NULL, NULL),
(6, 'Etage 1', 2, NULL, NULL, NULL, NULL),
(7, 'Etage 2', 2, NULL, NULL, NULL, NULL),
(8, 'C213', 7, NULL, NULL, NULL, NULL),
(9, 'C214', 7, NULL, NULL, NULL, NULL),
(10, 'C215', 7, NULL, NULL, NULL, NULL),
(11, 'C216', 7, NULL, NULL, NULL, NULL),
(12, 'C217', 7, NULL, NULL, NULL, NULL),
(13, 'C209', 7, NULL, NULL, NULL, NULL),
(14, 'C210', 7, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la vue `moy_capt_zone`
--
DROP TABLE IF EXISTS `moy_capt_zone`;

CREATE ALGORITHM=UNDEFINED DEFINER=`dupouyj`@`%` SQL SECURITY DEFINER VIEW `moy_capt_zone`  AS  select `c`.`id_capteur` AS `id_capt`,`c`.`nom` AS `capteur`,`z`.`id_zone` AS `id_zone`,`z`.`nom` AS `zone`,avg(`m`.`valeur`) AS `moyenne` from ((`capteur` `c` join `zone` `z` on((`c`.`id_zone` = `z`.`id_zone`))) join `mesure` `m` on((`c`.`id_capteur` = `m`.`id_capteur`))) group by `c`.`type_capteur`,`z`.`nom` ;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `actionneur`
--
ALTER TABLE `actionneur`
  ADD PRIMARY KEY (`id_actionneur`);

--
-- Index pour la table `actionneur2zone`
--
ALTER TABLE `actionneur2zone`
  ADD PRIMARY KEY (`id_actionneur`,`id_zone`);

--
-- Index pour la table `capteur`
--
ALTER TABLE `capteur`
  ADD PRIMARY KEY (`id_capteur`),
  ADD KEY `capteur` (`id_zone`);

--
-- Index pour la table `mesure`
--
ALTER TABLE `mesure`
  ADD PRIMARY KEY (`id_mesure`),
  ADD KEY `mesure` (`id_capteur`);

--
-- Index pour la table `zone`
--
ALTER TABLE `zone`
  ADD PRIMARY KEY (`id_zone`),
  ADD KEY `zone` (`id_zone_container`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `actionneur`
--
ALTER TABLE `actionneur`
  MODIFY `id_actionneur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `capteur`
--
ALTER TABLE `capteur`
  MODIFY `id_capteur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `mesure`
--
ALTER TABLE `mesure`
  MODIFY `id_mesure` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT pour la table `zone`
--
ALTER TABLE `zone`
  MODIFY `id_zone` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `actionneur2zone`
--
ALTER TABLE `actionneur2zone`
  ADD CONSTRAINT `actionneur2zone` FOREIGN KEY (`id_actionneur`) REFERENCES `actionneur` (`id_actionneur`);

--
-- Contraintes pour la table `capteur`
--
ALTER TABLE `capteur`
  ADD CONSTRAINT `capteur` FOREIGN KEY (`id_zone`) REFERENCES `zone` (`id_zone`);

--
-- Contraintes pour la table `mesure`
--
ALTER TABLE `mesure`
  ADD CONSTRAINT `mesure` FOREIGN KEY (`id_capteur`) REFERENCES `capteur` (`id_capteur`);

--
-- Contraintes pour la table `zone`
--
ALTER TABLE `zone`
  ADD CONSTRAINT `zone` FOREIGN KEY (`id_zone_container`) REFERENCES `zone` (`id_zone`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
