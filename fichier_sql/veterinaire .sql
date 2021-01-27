-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le :  mer. 27 jan. 2021 à 13:15
-- Version du serveur :  5.7.26
-- Version de PHP :  7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `veterinaire`
--

-- --------------------------------------------------------

--
-- Structure de la table `animal`
--

CREATE TABLE `animal` (
  `idAnimal` int(10) UNSIGNED NOT NULL,
  `idProprietaire` int(10) UNSIGNED DEFAULT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `dateNaissance` date DEFAULT NULL,
  `dateDeces` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `chat`
--

CREATE TABLE `chat` (
  `idAnimal` int(10) UNSIGNED DEFAULT NULL,
  `idRace` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `chien`
--

CREATE TABLE `chien` (
  `idAnimal` int(10) UNSIGNED DEFAULT NULL,
  `idRace` int(10) UNSIGNED DEFAULT NULL,
  `poids` decimal(5,2) DEFAULT NULL,
  `taille` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `dossier`
--

CREATE TABLE `dossier` (
  `idDossier` int(10) UNSIGNED NOT NULL,
  `antecedents` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `effectuer`
--

CREATE TABLE `effectuer` (
  `idGarde` int(10) UNSIGNED DEFAULT NULL,
  `idVeterinaire` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `garde`
--

CREATE TABLE `garde` (
  `idGarde` int(10) UNSIGNED NOT NULL,
  `heureDebut` time DEFAULT NULL,
  `heureFin` time DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `horaire`
--

CREATE TABLE `horaire` (
  `idHoraire` int(10) UNSIGNED NOT NULL,
  `idVeterinaire` int(10) UNSIGNED DEFAULT NULL,
  `jour` date DEFAULT NULL,
  `heureDebut` time DEFAULT NULL,
  `heureFin` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `medicament`
--

CREATE TABLE `medicament` (
  `idMedicament` int(10) UNSIGNED NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `dosage` varchar(100) DEFAULT NULL,
  `indication` varchar(100) DEFAULT NULL,
  `effet secondaire` text,
  `laboratoire` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `prescrire`
--

CREATE TABLE `prescrire` (
  `idVisite` int(10) UNSIGNED DEFAULT NULL,
  `idMedicament` int(10) UNSIGNED DEFAULT NULL,
  `posologie` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `proprietaire`
--

CREATE TABLE `proprietaire` (
  `idProprietaire` int(10) UNSIGNED NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(80) DEFAULT NULL,
  `rue` varchar(100) DEFAULT NULL,
  `code postal` int(11) DEFAULT NULL,
  `ville` varchar(45) DEFAULT NULL,
  `telephone` int(11) DEFAULT NULL,
  `telephoneMobile` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Race_chat`
--

CREATE TABLE `Race_chat` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Race_chien`
--

CREATE TABLE `Race_chien` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `veterinaire`
--

CREATE TABLE `veterinaire` (
  `idVeterinaire` int(10) UNSIGNED NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `telephone` int(11) DEFAULT NULL,
  `telephoneMobile` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `visite`
--

CREATE TABLE `visite` (
  `idVisite` int(10) UNSIGNED NOT NULL,
  `idDossier` int(10) UNSIGNED DEFAULT NULL,
  `idAnimal` int(10) UNSIGNED DEFAULT NULL,
  `idVeterinaire` int(10) UNSIGNED DEFAULT NULL,
  `dateVisite` date DEFAULT NULL,
  `heureVisite` time DEFAULT NULL,
  `raison` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `animal`
--
ALTER TABLE `animal`
  ADD PRIMARY KEY (`idAnimal`),
  ADD KEY `fk_animal_proprietaire1_idx` (`idProprietaire`);

--
-- Index pour la table `chat`
--
ALTER TABLE `chat`
  ADD KEY `fk_chat_animal1_idx` (`idAnimal`),
  ADD KEY `fk_chat_Race_chat1_idx` (`idRace`);

--
-- Index pour la table `chien`
--
ALTER TABLE `chien`
  ADD KEY `fk_chien_animal1_idx` (`idAnimal`),
  ADD KEY `fk_chien_Race_chien1_idx` (`idRace`);

--
-- Index pour la table `dossier`
--
ALTER TABLE `dossier`
  ADD PRIMARY KEY (`idDossier`);

--
-- Index pour la table `effectuer`
--
ALTER TABLE `effectuer`
  ADD KEY `fk_effectuer_garde1_idx` (`idGarde`),
  ADD KEY `fk_effectuer_veterinaire1_idx` (`idVeterinaire`);

--
-- Index pour la table `garde`
--
ALTER TABLE `garde`
  ADD PRIMARY KEY (`idGarde`);

--
-- Index pour la table `horaire`
--
ALTER TABLE `horaire`
  ADD PRIMARY KEY (`idHoraire`),
  ADD KEY `fk_horaire_veterinaire1_idx` (`idVeterinaire`);

--
-- Index pour la table `medicament`
--
ALTER TABLE `medicament`
  ADD PRIMARY KEY (`idMedicament`);

--
-- Index pour la table `prescrire`
--
ALTER TABLE `prescrire`
  ADD KEY `fk_prescription_visite1_idx` (`idVisite`),
  ADD KEY `fk_prescription_medicament1_idx` (`idMedicament`);

--
-- Index pour la table `proprietaire`
--
ALTER TABLE `proprietaire`
  ADD PRIMARY KEY (`idProprietaire`);

--
-- Index pour la table `Race_chat`
--
ALTER TABLE `Race_chat`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Race_chien`
--
ALTER TABLE `Race_chien`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `veterinaire`
--
ALTER TABLE `veterinaire`
  ADD PRIMARY KEY (`idVeterinaire`);

--
-- Index pour la table `visite`
--
ALTER TABLE `visite`
  ADD PRIMARY KEY (`idVisite`),
  ADD KEY `fk_visite_dossier1_idx` (`idDossier`),
  ADD KEY `fk_visite_animal1_idx` (`idAnimal`),
  ADD KEY `fk_visite_veterinaire1_idx` (`idVeterinaire`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `animal`
--
ALTER TABLE `animal`
  MODIFY `idAnimal` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `dossier`
--
ALTER TABLE `dossier`
  MODIFY `idDossier` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `garde`
--
ALTER TABLE `garde`
  MODIFY `idGarde` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `horaire`
--
ALTER TABLE `horaire`
  MODIFY `idHoraire` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `medicament`
--
ALTER TABLE `medicament`
  MODIFY `idMedicament` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `proprietaire`
--
ALTER TABLE `proprietaire`
  MODIFY `idProprietaire` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Race_chat`
--
ALTER TABLE `Race_chat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Race_chien`
--
ALTER TABLE `Race_chien`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `veterinaire`
--
ALTER TABLE `veterinaire`
  MODIFY `idVeterinaire` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `visite`
--
ALTER TABLE `visite`
  MODIFY `idVisite` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `fk_animal_proprietaire1` FOREIGN KEY (`idProprietaire`) REFERENCES `proprietaire` (`idProprietaire`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `fk_chat_Race_chat1` FOREIGN KEY (`idRace`) REFERENCES `Race_chat` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_chat_animal1` FOREIGN KEY (`idAnimal`) REFERENCES `animal` (`idAnimal`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `chien`
--
ALTER TABLE `chien`
  ADD CONSTRAINT `fk_chien_Race_chien1` FOREIGN KEY (`idRace`) REFERENCES `Race_chien` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_chien_animal1` FOREIGN KEY (`idAnimal`) REFERENCES `animal` (`idAnimal`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `effectuer`
--
ALTER TABLE `effectuer`
  ADD CONSTRAINT `fk_effectuer_garde1` FOREIGN KEY (`idGarde`) REFERENCES `garde` (`idGarde`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_effectuer_veterinaire1` FOREIGN KEY (`idVeterinaire`) REFERENCES `veterinaire` (`idVeterinaire`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `horaire`
--
ALTER TABLE `horaire`
  ADD CONSTRAINT `fk_horaire_veterinaire1` FOREIGN KEY (`idVeterinaire`) REFERENCES `veterinaire` (`idVeterinaire`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `prescrire`
--
ALTER TABLE `prescrire`
  ADD CONSTRAINT `fk_prescription_medicament1` FOREIGN KEY (`idMedicament`) REFERENCES `medicament` (`idMedicament`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_prescription_visite1` FOREIGN KEY (`idVisite`) REFERENCES `visite` (`idVisite`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `visite`
--
ALTER TABLE `visite`
  ADD CONSTRAINT `fk_visite_animal1` FOREIGN KEY (`idAnimal`) REFERENCES `animal` (`idAnimal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_visite_dossier1` FOREIGN KEY (`idDossier`) REFERENCES `dossier` (`idDossier`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_visite_veterinaire1` FOREIGN KEY (`idVeterinaire`) REFERENCES `veterinaire` (`idVeterinaire`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
