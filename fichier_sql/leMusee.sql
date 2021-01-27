-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le :  mer. 27 jan. 2021 à 13:17
-- Version du serveur :  5.7.26
-- Version de PHP :  7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `leMusee`
--

-- --------------------------------------------------------

--
-- Structure de la table `artiste`
--

CREATE TABLE `artiste` (
  `idArtiste` int(10) UNSIGNED NOT NULL,
  `idNationalite` int(10) UNSIGNED DEFAULT NULL,
  `nomArtiste` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `dateNaissance` date DEFAULT NULL,
  `dateDeces` date DEFAULT NULL,
  `descriptionArtiste` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `auteur`
--

CREATE TABLE `auteur` (
  `idOeuvre` int(10) UNSIGNED DEFAULT NULL,
  `idArtiste` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `courantartistique`
--

CREATE TABLE `courantartistique` (
  `idCourant` int(10) UNSIGNED NOT NULL,
  `nomCourant` varchar(100) DEFAULT NULL,
  `debut` datetime DEFAULT NULL,
  `fin` datetime DEFAULT NULL,
  `descriptionCourant` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `exemplaire`
--

CREATE TABLE `exemplaire` (
  `idOeuvre` int(10) UNSIGNED DEFAULT NULL,
  `idMusee` int(10) UNSIGNED DEFAULT NULL,
  `numero` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

CREATE TABLE `matiere` (
  `idMat` int(10) UNSIGNED NOT NULL,
  `nomMat` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `musee`
--

CREATE TABLE `musee` (
  `idMusee` int(10) UNSIGNED NOT NULL,
  `idVille` int(10) UNSIGNED DEFAULT NULL,
  `nomMusee` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `nationalite`
--

CREATE TABLE `nationalite` (
  `idNationalite` int(10) UNSIGNED NOT NULL,
  `nomNationalite` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `oeuvre`
--

CREATE TABLE `oeuvre` (
  `idOeuvre` int(10) UNSIGNED NOT NULL,
  `idType` int(10) UNSIGNED DEFAULT NULL,
  `idMat` int(10) UNSIGNED DEFAULT NULL,
  `idCourant` int(10) UNSIGNED DEFAULT NULL,
  `titre` varchar(150) DEFAULT NULL,
  `annee` year(4) DEFAULT NULL,
  `dimension` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `participe`
--

CREATE TABLE `participe` (
  `idCourant` int(10) UNSIGNED DEFAULT NULL,
  `idArtiste` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

CREATE TABLE `type` (
  `idType` int(10) UNSIGNED NOT NULL,
  `nomType` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

CREATE TABLE `ville` (
  `idVille` int(10) UNSIGNED NOT NULL,
  `nomVille` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `artiste`
--
ALTER TABLE `artiste`
  ADD PRIMARY KEY (`idArtiste`),
  ADD KEY `fk_artiste_nationalite1_idx` (`idNationalite`);

--
-- Index pour la table `auteur`
--
ALTER TABLE `auteur`
  ADD KEY `fk_auteur_oeuvre1_idx` (`idOeuvre`),
  ADD KEY `fk_auteur_artiste1_idx` (`idArtiste`);

--
-- Index pour la table `courantartistique`
--
ALTER TABLE `courantartistique`
  ADD PRIMARY KEY (`idCourant`);

--
-- Index pour la table `exemplaire`
--
ALTER TABLE `exemplaire`
  ADD KEY `fk_exemplaire_musee1_idx` (`idMusee`),
  ADD KEY `fk_exemplaire_oeuvre1_idx` (`idOeuvre`);

--
-- Index pour la table `matiere`
--
ALTER TABLE `matiere`
  ADD PRIMARY KEY (`idMat`);

--
-- Index pour la table `musee`
--
ALTER TABLE `musee`
  ADD PRIMARY KEY (`idMusee`),
  ADD KEY `fk_musee_ville1_idx` (`idVille`);

--
-- Index pour la table `nationalite`
--
ALTER TABLE `nationalite`
  ADD PRIMARY KEY (`idNationalite`);

--
-- Index pour la table `oeuvre`
--
ALTER TABLE `oeuvre`
  ADD PRIMARY KEY (`idOeuvre`),
  ADD KEY `fk_oeuvre_type1_idx` (`idType`),
  ADD KEY `fk_oeuvre_matiere1_idx` (`idMat`),
  ADD KEY `fk_oeuvre_courantartistique1_idx` (`idCourant`);

--
-- Index pour la table `participe`
--
ALTER TABLE `participe`
  ADD KEY `fk_participe_courantartistique1_idx` (`idCourant`),
  ADD KEY `fk_participe_artiste1_idx` (`idArtiste`);

--
-- Index pour la table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`idType`);

--
-- Index pour la table `ville`
--
ALTER TABLE `ville`
  ADD PRIMARY KEY (`idVille`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `artiste`
--
ALTER TABLE `artiste`
  MODIFY `idArtiste` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `courantartistique`
--
ALTER TABLE `courantartistique`
  MODIFY `idCourant` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `matiere`
--
ALTER TABLE `matiere`
  MODIFY `idMat` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `musee`
--
ALTER TABLE `musee`
  MODIFY `idMusee` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `nationalite`
--
ALTER TABLE `nationalite`
  MODIFY `idNationalite` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `oeuvre`
--
ALTER TABLE `oeuvre`
  MODIFY `idOeuvre` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `type`
--
ALTER TABLE `type`
  MODIFY `idType` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ville`
--
ALTER TABLE `ville`
  MODIFY `idVille` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `artiste`
--
ALTER TABLE `artiste`
  ADD CONSTRAINT `fk_artiste_nationalite1` FOREIGN KEY (`idNationalite`) REFERENCES `nationalite` (`idNationalite`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `auteur`
--
ALTER TABLE `auteur`
  ADD CONSTRAINT `fk_auteur_artiste1` FOREIGN KEY (`idArtiste`) REFERENCES `artiste` (`idArtiste`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_auteur_oeuvre1` FOREIGN KEY (`idOeuvre`) REFERENCES `oeuvre` (`idOeuvre`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `exemplaire`
--
ALTER TABLE `exemplaire`
  ADD CONSTRAINT `fk_exemplaire_musee1` FOREIGN KEY (`idMusee`) REFERENCES `musee` (`idMusee`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_exemplaire_oeuvre1` FOREIGN KEY (`idOeuvre`) REFERENCES `oeuvre` (`idOeuvre`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `musee`
--
ALTER TABLE `musee`
  ADD CONSTRAINT `fk_musee_ville1` FOREIGN KEY (`idVille`) REFERENCES `ville` (`idVille`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `oeuvre`
--
ALTER TABLE `oeuvre`
  ADD CONSTRAINT `fk_oeuvre_courantartistique1` FOREIGN KEY (`idCourant`) REFERENCES `courantartistique` (`idCourant`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_oeuvre_matiere1` FOREIGN KEY (`idMat`) REFERENCES `matiere` (`idMat`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_oeuvre_type1` FOREIGN KEY (`idType`) REFERENCES `type` (`idType`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `participe`
--
ALTER TABLE `participe`
  ADD CONSTRAINT `fk_participe_artiste1` FOREIGN KEY (`idArtiste`) REFERENCES `artiste` (`idArtiste`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_participe_courantartistique1` FOREIGN KEY (`idCourant`) REFERENCES `courantartistique` (`idCourant`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
