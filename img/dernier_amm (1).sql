-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 26 Juillet 2022 à 17:35
-- Version du serveur :  10.1.19-MariaDB
-- Version de PHP :  7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `dernier_amm`
--

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

CREATE TABLE `fournisseur` (
  `id_fournisseur` int(11) NOT NULL,
  `nom_fournisseur` varchar(25) DEFAULT NULL,
  `addesse_fournisseur` varchar(250) DEFAULT NULL,
  `mail_fournisseur` varchar(50) NOT NULL,
  `telephone_fournisseur` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `t_article`
--

CREATE TABLE `t_article` (
  `code_aricle` varchar(25) NOT NULL,
  `poids_article` float NOT NULL,
  `prix_unitaire` float NOT NULL,
  `tennaire` int(11) DEFAULT NULL,
  `id_etat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `t_besion`
--

CREATE TABLE `t_besion` (
  `id_besion` int(11) NOT NULL,
  `quantite_besoin` int(11) DEFAULT NULL,
  `date_besoin` date DEFAULT NULL,
  `id_cleint` int(11) NOT NULL,
  `code_aricle` varchar(25) DEFAULT NULL,
  `code_aricle_T_article` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `t_caisse`
--

CREATE TABLE `t_caisse` (
  `id_caisse` int(11) NOT NULL,
  `chiffre_affaire` float DEFAULT NULL,
  `date_caisse` datetime DEFAULT NULL,
  `date_soustrer` datetime DEFAULT NULL,
  `id_depanse` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `t_clients`
--

CREATE TABLE `t_clients` (
  `id_cleint` int(11) NOT NULL,
  `reference_client` varchar(25) NOT NULL,
  `nom_client` varchar(25) NOT NULL,
  `addresse_client` varchar(250) DEFAULT NULL,
  `mail_client` char(50) DEFAULT NULL,
  `telephone_client` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `t_commandes`
--

CREATE TABLE `t_commandes` (
  `id_commande` int(11) NOT NULL,
  `quantite_commande` int(11) DEFAULT NULL,
  `date_commande` date DEFAULT NULL,
  `id_fournisseur` int(11) NOT NULL,
  `id_detail_command` int(11) DEFAULT NULL,
  `id_magazine` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `t_depanse`
--

CREATE TABLE `t_depanse` (
  `id_depanse` int(11) NOT NULL,
  `motif` text,
  `montant` decimal(15,3) DEFAULT NULL,
  `date_denpanse` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `t_detail_command`
--

CREATE TABLE `t_detail_command` (
  `id_detail_command` int(11) NOT NULL,
  `quantiteAlivrer` int(11) DEFAULT NULL,
  `id_entrer` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `t_entrees`
--

CREATE TABLE `t_entrees` (
  `id_entrer` int(11) NOT NULL,
  `date_entrer` date DEFAULT NULL,
  `quantite_entrer` int(11) DEFAULT NULL,
  `solde_quantiter` int(11) DEFAULT NULL,
  `id_fournisseur` int(11) NOT NULL,
  `code_aricle` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `t_etat`
--

CREATE TABLE `t_etat` (
  `id_etat` int(11) NOT NULL,
  `libelle` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `t_facture_versement`
--

CREATE TABLE `t_facture_versement` (
  `id_facture_versement` int(11) NOT NULL,
  `id_versement` int(11) DEFAULT NULL,
  `id_sortie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `t_magaziner`
--

CREATE TABLE `t_magaziner` (
  `id_magazine` varchar(25) NOT NULL,
  `nom_magazine` varchar(25) DEFAULT NULL,
  `prenom_magazine` varchar(25) DEFAULT NULL,
  `sexe_magazine` varchar(25) DEFAULT NULL,
  `qualification_magazine` varchar(25) DEFAULT NULL,
  `id_depanse` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `t_mode_reglement`
--

CREATE TABLE `t_mode_reglement` (
  `id_mode_reglement` int(11) NOT NULL,
  `description` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `t_mode_reglement`
--

INSERT INTO `t_mode_reglement` (`id_mode_reglement`, `description`) VALUES
(1, 'mpsa');

-- --------------------------------------------------------

--
-- Structure de la table `t_sortis`
--

CREATE TABLE `t_sortis` (
  `id_sortie` int(11) NOT NULL,
  `date_sortie` date NOT NULL,
  `quantite_sortie` int(11) DEFAULT NULL,
  `code_aricle` varchar(25) DEFAULT NULL,
  `id_cleint` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `t_sotock`
--

CREATE TABLE `t_sotock` (
  `quantite_en_stock` int(11) DEFAULT NULL,
  `emplecementArticle` varchar(25) DEFAULT NULL,
  `code_aricle` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `t_versement`
--

CREATE TABLE `t_versement` (
  `id_versement` int(11) NOT NULL,
  `Data_payement` date DEFAULT NULL,
  `montant` decimal(15,3) DEFAULT NULL,
  `id_mode_reglement` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  ADD PRIMARY KEY (`id_fournisseur`),
  ADD UNIQUE KEY `mail_fournisseur` (`mail_fournisseur`);

--
-- Index pour la table `t_article`
--
ALTER TABLE `t_article`
  ADD PRIMARY KEY (`code_aricle`),
  ADD KEY `FK_T_article_id_etat` (`id_etat`);

--
-- Index pour la table `t_besion`
--
ALTER TABLE `t_besion`
  ADD PRIMARY KEY (`id_besion`),
  ADD KEY `FK_T_besion_id_cleint` (`id_cleint`),
  ADD KEY `FK_T_besion_code_aricle` (`code_aricle`),
  ADD KEY `FK_T_besion_code_aricle_T_article` (`code_aricle_T_article`);

--
-- Index pour la table `t_caisse`
--
ALTER TABLE `t_caisse`
  ADD PRIMARY KEY (`id_caisse`),
  ADD KEY `FK_T_caisse_id_depanse` (`id_depanse`);

--
-- Index pour la table `t_clients`
--
ALTER TABLE `t_clients`
  ADD PRIMARY KEY (`id_cleint`),
  ADD UNIQUE KEY `reference_client` (`reference_client`,`mail_client`,`telephone_client`);

--
-- Index pour la table `t_commandes`
--
ALTER TABLE `t_commandes`
  ADD PRIMARY KEY (`id_commande`),
  ADD KEY `FK_T_commandes_id_fournisseur` (`id_fournisseur`),
  ADD KEY `FK_T_commandes_id_detail_command` (`id_detail_command`),
  ADD KEY `FK_T_commandes_id_magazine` (`id_magazine`);

--
-- Index pour la table `t_depanse`
--
ALTER TABLE `t_depanse`
  ADD PRIMARY KEY (`id_depanse`);

--
-- Index pour la table `t_detail_command`
--
ALTER TABLE `t_detail_command`
  ADD PRIMARY KEY (`id_detail_command`),
  ADD KEY `FK_T_detail_command_id_entrer` (`id_entrer`);

--
-- Index pour la table `t_entrees`
--
ALTER TABLE `t_entrees`
  ADD PRIMARY KEY (`id_entrer`),
  ADD KEY `FK_T_entrees_id_fournisseur` (`id_fournisseur`),
  ADD KEY `FK_T_entrees_code_aricle` (`code_aricle`);

--
-- Index pour la table `t_etat`
--
ALTER TABLE `t_etat`
  ADD PRIMARY KEY (`id_etat`);

--
-- Index pour la table `t_facture_versement`
--
ALTER TABLE `t_facture_versement`
  ADD PRIMARY KEY (`id_facture_versement`),
  ADD KEY `FK_T_facture_versement_id_versement` (`id_versement`),
  ADD KEY `FK_T_facture_versement_id_sortie` (`id_sortie`);

--
-- Index pour la table `t_magaziner`
--
ALTER TABLE `t_magaziner`
  ADD PRIMARY KEY (`id_magazine`),
  ADD KEY `FK_T_magaziner_id_depanse` (`id_depanse`);

--
-- Index pour la table `t_mode_reglement`
--
ALTER TABLE `t_mode_reglement`
  ADD PRIMARY KEY (`id_mode_reglement`);

--
-- Index pour la table `t_sortis`
--
ALTER TABLE `t_sortis`
  ADD PRIMARY KEY (`id_sortie`),
  ADD KEY `FK_T_sortis_code_aricle` (`code_aricle`),
  ADD KEY `FK_T_sortis_id_cleint` (`id_cleint`);

--
-- Index pour la table `t_sotock`
--
ALTER TABLE `t_sotock`
  ADD PRIMARY KEY (`code_aricle`);

--
-- Index pour la table `t_versement`
--
ALTER TABLE `t_versement`
  ADD PRIMARY KEY (`id_versement`),
  ADD KEY `FK_T_versement_id_mode_reglement` (`id_mode_reglement`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  MODIFY `id_fournisseur` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `t_besion`
--
ALTER TABLE `t_besion`
  MODIFY `id_besion` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `t_caisse`
--
ALTER TABLE `t_caisse`
  MODIFY `id_caisse` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `t_clients`
--
ALTER TABLE `t_clients`
  MODIFY `id_cleint` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `t_commandes`
--
ALTER TABLE `t_commandes`
  MODIFY `id_commande` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `t_depanse`
--
ALTER TABLE `t_depanse`
  MODIFY `id_depanse` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `t_detail_command`
--
ALTER TABLE `t_detail_command`
  MODIFY `id_detail_command` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `t_entrees`
--
ALTER TABLE `t_entrees`
  MODIFY `id_entrer` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `t_etat`
--
ALTER TABLE `t_etat`
  MODIFY `id_etat` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `t_facture_versement`
--
ALTER TABLE `t_facture_versement`
  MODIFY `id_facture_versement` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `t_mode_reglement`
--
ALTER TABLE `t_mode_reglement`
  MODIFY `id_mode_reglement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `t_sortis`
--
ALTER TABLE `t_sortis`
  MODIFY `id_sortie` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `t_versement`
--
ALTER TABLE `t_versement`
  MODIFY `id_versement` int(11) NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `t_article`
--
ALTER TABLE `t_article`
  ADD CONSTRAINT `FK_T_article_id_etat` FOREIGN KEY (`id_etat`) REFERENCES `t_etat` (`id_etat`);

--
-- Contraintes pour la table `t_besion`
--
ALTER TABLE `t_besion`
  ADD CONSTRAINT `FK_T_besion_code_aricle` FOREIGN KEY (`code_aricle`) REFERENCES `t_article` (`code_aricle`),
  ADD CONSTRAINT `FK_T_besion_code_aricle_T_article` FOREIGN KEY (`code_aricle_T_article`) REFERENCES `t_article` (`code_aricle`),
  ADD CONSTRAINT `FK_T_besion_id_cleint` FOREIGN KEY (`id_cleint`) REFERENCES `t_clients` (`id_cleint`);

--
-- Contraintes pour la table `t_caisse`
--
ALTER TABLE `t_caisse`
  ADD CONSTRAINT `FK_T_caisse_id_depanse` FOREIGN KEY (`id_depanse`) REFERENCES `t_depanse` (`id_depanse`);

--
-- Contraintes pour la table `t_commandes`
--
ALTER TABLE `t_commandes`
  ADD CONSTRAINT `FK_T_commandes_id_detail_command` FOREIGN KEY (`id_detail_command`) REFERENCES `t_detail_command` (`id_detail_command`),
  ADD CONSTRAINT `FK_T_commandes_id_fournisseur` FOREIGN KEY (`id_fournisseur`) REFERENCES `fournisseur` (`id_fournisseur`),
  ADD CONSTRAINT `FK_T_commandes_id_magazine` FOREIGN KEY (`id_magazine`) REFERENCES `t_magaziner` (`id_magazine`);

--
-- Contraintes pour la table `t_detail_command`
--
ALTER TABLE `t_detail_command`
  ADD CONSTRAINT `FK_T_detail_command_id_entrer` FOREIGN KEY (`id_entrer`) REFERENCES `t_entrees` (`id_entrer`);

--
-- Contraintes pour la table `t_entrees`
--
ALTER TABLE `t_entrees`
  ADD CONSTRAINT `FK_T_entrees_code_aricle` FOREIGN KEY (`code_aricle`) REFERENCES `t_article` (`code_aricle`),
  ADD CONSTRAINT `FK_T_entrees_id_fournisseur` FOREIGN KEY (`id_fournisseur`) REFERENCES `fournisseur` (`id_fournisseur`);

--
-- Contraintes pour la table `t_facture_versement`
--
ALTER TABLE `t_facture_versement`
  ADD CONSTRAINT `FK_T_facture_versement_id_sortie` FOREIGN KEY (`id_sortie`) REFERENCES `t_sortis` (`id_sortie`),
  ADD CONSTRAINT `FK_T_facture_versement_id_versement` FOREIGN KEY (`id_versement`) REFERENCES `t_versement` (`id_versement`);

--
-- Contraintes pour la table `t_magaziner`
--
ALTER TABLE `t_magaziner`
  ADD CONSTRAINT `FK_T_magaziner_id_depanse` FOREIGN KEY (`id_depanse`) REFERENCES `t_depanse` (`id_depanse`);

--
-- Contraintes pour la table `t_sortis`
--
ALTER TABLE `t_sortis`
  ADD CONSTRAINT `FK_T_sortis_code_aricle` FOREIGN KEY (`code_aricle`) REFERENCES `t_article` (`code_aricle`),
  ADD CONSTRAINT `FK_T_sortis_id_cleint` FOREIGN KEY (`id_cleint`) REFERENCES `t_clients` (`id_cleint`);

--
-- Contraintes pour la table `t_sotock`
--
ALTER TABLE `t_sotock`
  ADD CONSTRAINT `FK_T_sotock_code_aricle` FOREIGN KEY (`code_aricle`) REFERENCES `t_article` (`code_aricle`);

--
-- Contraintes pour la table `t_versement`
--
ALTER TABLE `t_versement`
  ADD CONSTRAINT `FK_T_versement_id_mode_reglement` FOREIGN KEY (`id_mode_reglement`) REFERENCES `t_mode_reglement` (`id_mode_reglement`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
