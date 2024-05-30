-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 30 mai 2024 à 21:32
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `e2se`
--

-- --------------------------------------------------------

--
-- Structure de la table `classes`
--

CREATE TABLE `classes` (
  `Id_classe` int(11) NOT NULL,
  `nom_Classe` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `classes`
--

INSERT INTO `classes` (`Id_classe`, `nom_Classe`) VALUES
(1, 'MCO'),
(2, 'NDRC'),
(3, 'Classe 1 test');

-- --------------------------------------------------------

--
-- Structure de la table `consulte`
--

CREATE TABLE `consulte` (
  `id_utilisateur` int(11) NOT NULL,
  `Id_ressources` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `enseigne_`
--

CREATE TABLE `enseigne_` (
  `id_utilisateur` int(11) NOT NULL,
  `Id_classe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ressources`
--

CREATE TABLE `ressources` (
  `Id_ressources` int(11) NOT NULL,
  `titre` varchar(50) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `Contenu` varchar(255) DEFAULT NULL,
  `type_ressources` varchar(50) DEFAULT NULL,
  `id_utilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `ressources`
--

INSERT INTO `ressources` (`Id_ressources`, `titre`, `Description`, `Contenu`, `type_ressources`, `id_utilisateur`) VALUES
(1, 'Gestion des sous-domaines', 'comment gérer les domaines et sous-domaines sur hostinger ?', 'https://www.hostinger.fr/tutoriels/sous-domaine', 'Article', 2),
(2, 'gestion des dns ', 'Comment Utiliser l’Éditeur de Zone DNS d’Hostinger en 2024', 'https://www.hostinger.fr/tutoriels/editeur-zone-dns', 'Article', 6);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id_utilisateur` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `mot_de_passe` varchar(50) DEFAULT NULL,
  `niveau_de_permission` varchar(50) DEFAULT NULL,
  `Id_classe` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id_utilisateur`, `nom`, `prenom`, `email`, `mot_de_passe`, `niveau_de_permission`, `Id_classe`) VALUES
(1, 'Ferras', 'Daniel', 'Dferras@epdigital.fr', '123', '1', NULL),
(2, 'Admin', 'Admin', 'Adminadmin@gmail.com', '$2y$10$aa1UeiZF2ogP.f7jtWQbuOvYcOrlSeL4YXTQHFqgzc0', '0', NULL),
(3, 'Boudjemlal', 'Dounia Aïda ', 'Bdounia@gmail.com', '123', '2', 1),
(4, 'Jenvrin', 'Guillaume', 'Jguillaume@gmail.com', '123', '2', 2),
(5, 'Smatti', 'Manel', 'Msmatti@cesi-algerie.fr', '$2y$10$zYePacHaT2CseMwtGfSCU.egxgJAFhIvxNtLucESmRp', '1', NULL),
(6, 'admin2', 'admin2', 'admin2@gmail.com', '123', '0', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `wordpress`
--

CREATE TABLE `wordpress` (
  `id` int(11) NOT NULL,
  `port` int(11) DEFAULT NULL,
  `fqdnds` varchar(50) DEFAULT NULL,
  `login` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `id_utilisateur` int(11) NOT NULL,
  `Id_classe` int(11) NOT NULL,
  `id_utilisateur_1` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`Id_classe`);

--
-- Index pour la table `consulte`
--
ALTER TABLE `consulte`
  ADD PRIMARY KEY (`id_utilisateur`,`Id_ressources`),
  ADD KEY `Id_ressources` (`Id_ressources`);

--
-- Index pour la table `enseigne_`
--
ALTER TABLE `enseigne_`
  ADD PRIMARY KEY (`id_utilisateur`,`Id_classe`),
  ADD KEY `Id_classe` (`Id_classe`);

--
-- Index pour la table `ressources`
--
ALTER TABLE `ressources`
  ADD PRIMARY KEY (`Id_ressources`),
  ADD KEY `id_utilisateur` (`id_utilisateur`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id_utilisateur`),
  ADD KEY `Id_classe` (`Id_classe`);

--
-- Index pour la table `wordpress`
--
ALTER TABLE `wordpress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_utilisateur` (`id_utilisateur`),
  ADD KEY `Id_classe` (`Id_classe`),
  ADD KEY `id_utilisateur_1` (`id_utilisateur_1`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `classes`
--
ALTER TABLE `classes`
  MODIFY `Id_classe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `ressources`
--
ALTER TABLE `ressources`
  MODIFY `Id_ressources` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `consulte`
--
ALTER TABLE `consulte`
  ADD CONSTRAINT `consulte_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`),
  ADD CONSTRAINT `consulte_ibfk_2` FOREIGN KEY (`Id_ressources`) REFERENCES `ressources` (`Id_ressources`);

--
-- Contraintes pour la table `enseigne_`
--
ALTER TABLE `enseigne_`
  ADD CONSTRAINT `enseigne__ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`),
  ADD CONSTRAINT `enseigne__ibfk_2` FOREIGN KEY (`Id_classe`) REFERENCES `classes` (`Id_classe`);

--
-- Contraintes pour la table `ressources`
--
ALTER TABLE `ressources`
  ADD CONSTRAINT `ressources_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`);

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `utilisateur_ibfk_1` FOREIGN KEY (`Id_classe`) REFERENCES `classes` (`Id_classe`);

--
-- Contraintes pour la table `wordpress`
--
ALTER TABLE `wordpress`
  ADD CONSTRAINT `wordpress_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`),
  ADD CONSTRAINT `wordpress_ibfk_2` FOREIGN KEY (`Id_classe`) REFERENCES `classes` (`Id_classe`),
  ADD CONSTRAINT `wordpress_ibfk_3` FOREIGN KEY (`id_utilisateur_1`) REFERENCES `utilisateur` (`id_utilisateur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
