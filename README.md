# Base de données au bon deal

## Introduction
Ce dépôt en ligne contient les modèles de données Merise développés pour le site "Au Bon Deal", ainsi que les sauvegardes de la base de données. Il inclut également des propositions d’amélioration pour optimiser la structure et la gestion des données à l’avenir.

## Sommaire:
- [Fichiers de la base de données](./01-database/)
    - [Dictionnaire de données](./01-database/data-dictionnary.md)
    - [MCD](./01-database/mcd-au-bon-deal.png)
    - [MLD](./01-database/mld-au-bon-deal.png)
    - [Sauvegardes](./01-database/backup/)
- [Sécurité](./02-security/)
    - [RBAC](./02-security/RBAC.md)
    - [Politique de rétention](./02-security/RBAC.md)
    - [RGPD](./02-security/RGPD.md)
- [Règles de gestion](./03-managment-rules/managment-rules.md)
- [Benchmarks](./04-benchmarks/)
    - [Benchmark de la base de données](./04-benchmarks/database-benchmark.md)
- [Suggestions d'amélioration](./05-improvment-suggestions/improvment-suggestions.md)

## Merise
L'accronyme de Merise signifie Méthode d'étude et de réalisation informatique pour les systèmes d'entreprise. Elle est apparue en France à partir des années 1970. 

Le modèle Merise est une méthode de modélisation des systèmes d'information qui repose sur trois axes essentiels : cycle de vie, décision et abstraction. Ces axes permettent d’aborder la gestion des données sous différents angles. L'axe du cycle de vie s'intéresse à l’évolution des données depuis leur création jusqu’à leur maintenance. L'axe de décision concerne l’utilisation des données pour la prise de décision à différents niveaux (stratégique, tactique, opérationnel), tandis que l'axe d'abstraction définit les niveaux de détail des données, allant de la modélisation conceptuelle à la structure physique.

Dans cette méthode, les modèles tels que le MCD (Modèle Conceptuel de Données), le MLD (Modèle Logique de Données) et le MPD (Modèle Physique de Données) se situent à différents stades du processus de conception des bases de données. Le MCD définit les entités et leurs relations sans tenir compte des contraintes techniques, et représente un niveau élevé d’abstraction. Le MLD est plus détaillé et s'intéresse aux structures de données tout en restant indépendant des aspects physiques. Enfin, le MPD concerne la structure physique des données, optimisée pour un SGBD (Système de Gestion de Bases de Données). Ces trois modèles interagissent pour répondre aux besoins de modélisation en fonction du cycle de vie, des décisions à prendre et du niveau d'abstraction des données.

Ici pour notre base de données, MCD et MLD ont été modélisés.

source: [Jean-Guy SAYOUS, « Merise et le schéma directeur informatique », Bulletin des bibliothèques de France (BBF), 1994, n° 3, p. 68-71.](https://bbf.enssib.fr/consulter/bbf-1994-03-0068-002)