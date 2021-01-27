-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le :  mer. 27 jan. 2021 à 13:16
-- Version du serveur :  5.7.26
-- Version de PHP :  7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `blibliotheque`
--

-- --------------------------------------------------------

--
-- Structure de la table `auteur`
--

CREATE TABLE `auteur` (
  `idAuteur` int(10) UNSIGNED NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `caracterise`
--

CREATE TABLE `caracterise` (
  `idOuvrage` int(10) UNSIGNED DEFAULT NULL,
  `idMot` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `ecrit`
--

CREATE TABLE `ecrit` (
  `idAuteur` int(10) UNSIGNED DEFAULT NULL,
  `idOuvrage` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `editeur`
--

CREATE TABLE `editeur` (
  `idEditeur` int(10) UNSIGNED NOT NULL,
  `nomEditeur` varchar(50) DEFAULT NULL,
  `adresseEditeur` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `emprunte`
--

CREATE TABLE `emprunte` (
  `idEmprunteur` int(10) UNSIGNED DEFAULT NULL,
  `idExemplaire` int(10) UNSIGNED DEFAULT NULL,
  `dateEmprunt` date DEFAULT NULL,
  `dateRetour` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `emprunteur`
--

CREATE TABLE `emprunteur` (
  `idEmprunteur` int(10) UNSIGNED NOT NULL,
  `nomEmprunteur` varchar(50) DEFAULT NULL,
  `adresseEmprunteur` varchar(100) DEFAULT NULL,
  `telephone` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `exemplaire`
--

CREATE TABLE `exemplaire` (
  `idExemplaire` int(10) UNSIGNED NOT NULL,
  `idOuvrage` int(10) UNSIGNED DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `dateAchat` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `motcle`
--

CREATE TABLE `motcle` (
  `idMot` int(10) UNSIGNED NOT NULL,
  `mot` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `ouvrage`
--

CREATE TABLE `ouvrage` (
  `idOuvrage` int(10) UNSIGNED NOT NULL,
  `idEditeur` int(10) UNSIGNED DEFAULT NULL,
  `titre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `auteur`
--
ALTER TABLE `auteur`
  ADD PRIMARY KEY (`idAuteur`);

--
-- Index pour la table `caracterise`
--
ALTER TABLE `caracterise`
  ADD KEY `fk_caracterise_ouvrage1_idx` (`idOuvrage`),
  ADD KEY `fk_caracterise_motcle1_idx` (`idMot`);

--
-- Index pour la table `ecrit`
--
ALTER TABLE `ecrit`
  ADD KEY `fk_ecrit_auteur1_idx` (`idAuteur`),
  ADD KEY `fk_ecrit_ouvrage1_idx` (`idOuvrage`);

--
-- Index pour la table `editeur`
--
ALTER TABLE `editeur`
  ADD PRIMARY KEY (`idEditeur`);

--
-- Index pour la table `emprunte`
--
ALTER TABLE `emprunte`
  ADD KEY `fk_emprunte_emprunteur_idx` (`idEmprunteur`),
  ADD KEY `fk_emprunte_exemplaire1_idx` (`idExemplaire`);

--
-- Index pour la table `emprunteur`
--
ALTER TABLE `emprunteur`
  ADD PRIMARY KEY (`idEmprunteur`);

--
-- Index pour la table `exemplaire`
--
ALTER TABLE `exemplaire`
  ADD PRIMARY KEY (`idExemplaire`),
  ADD KEY `fk_exemplaire_ouvrage1_idx` (`idOuvrage`);

--
-- Index pour la table `motcle`
--
ALTER TABLE `motcle`
  ADD PRIMARY KEY (`idMot`);

--
-- Index pour la table `ouvrage`
--
ALTER TABLE `ouvrage`
  ADD PRIMARY KEY (`idOuvrage`),
  ADD KEY `fk_ouvrage_editeur1_idx` (`idEditeur`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `auteur`
--
ALTER TABLE `auteur`
  MODIFY `idAuteur` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `editeur`
--
ALTER TABLE `editeur`
  MODIFY `idEditeur` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `emprunteur`
--
ALTER TABLE `emprunteur`
  MODIFY `idEmprunteur` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `exemplaire`
--
ALTER TABLE `exemplaire`
  MODIFY `idExemplaire` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `motcle`
--
ALTER TABLE `motcle`
  MODIFY `idMot` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ouvrage`
--
ALTER TABLE `ouvrage`
  MODIFY `idOuvrage` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `caracterise`
--
ALTER TABLE `caracterise`
  ADD CONSTRAINT `fk_caracterise_motcle1` FOREIGN KEY (`idMot`) REFERENCES `motcle` (`idMot`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_caracterise_ouvrage1` FOREIGN KEY (`idOuvrage`) REFERENCES `ouvrage` (`idOuvrage`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `ecrit`
--
ALTER TABLE `ecrit`
  ADD CONSTRAINT `fk_ecrit_auteur1` FOREIGN KEY (`idAuteur`) REFERENCES `auteur` (`idAuteur`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ecrit_ouvrage1` FOREIGN KEY (`idOuvrage`) REFERENCES `ouvrage` (`idOuvrage`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `emprunte`
--
ALTER TABLE `emprunte`
  ADD CONSTRAINT `fk_emprunte_emprunteur` FOREIGN KEY (`idEmprunteur`) REFERENCES `emprunteur` (`idEmprunteur`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_emprunte_exemplaire1` FOREIGN KEY (`idExemplaire`) REFERENCES `exemplaire` (`idExemplaire`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `exemplaire`
--
ALTER TABLE `exemplaire`
  ADD CONSTRAINT `fk_exemplaire_ouvrage1` FOREIGN KEY (`idOuvrage`) REFERENCES `ouvrage` (`idOuvrage`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `ouvrage`
--
ALTER TABLE `ouvrage`
  ADD CONSTRAINT `fk_ouvrage_editeur1` FOREIGN KEY (`idEditeur`) REFERENCES `editeur` (`idEditeur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
