# Benchmark entre Postgres et MySQL
## benchmark
## Benchmark entre PostgreSQL et MySQL

| **Critères**                                              | **PostgreSQL**                                             | **MySQL**                                                 |
|-----------------------------------------------------------|------------------------------------------------------------|----------------------------------------------------------|
| **Propriété**                                             | Open source, avec plus de 700 contributeurs actifs          | Open source, mais propriété d'Oracle                     |
| **Conformité aux standards**                              | Conforme aux standards ANSI SQL [(1)](#ansi-sql)                            | Conforme aux standards ANSI SQL                          |
| **Intégration avec les langages de programmation**         | Bien intégré avec les principales librairies des langages de programmation | Bien intégré avec les principales librairies des langages de programmation |
| **Performance en lecture/écriture**                       | Meilleure performance en opérations de lecture/écriture complexes | Plus performant en lecture seule                          |
| **Contrôle de concurrence**                               | Utilise le contrôle de concurrence multi-version (MVCC), ce qui permet une gestion parallèle des requêtes sans verrous de lecture/écriture | Utilise des verrous de lecture/écriture pour les opérations parallèles |
| **Parallélisme des requêtes**                             | Supporte le parallélisme des requêtes sans verrouillage | Nécessite des verrous pour gérer les opérations en parallèle |
| **Techniques d'indexation et partitionnement**            | Offre des techniques avancées d'indexation et de partitionnement | Moins de flexibilité dans les techniques d'indexation et de partitionnement |
| **Consommation de ressources**                            | Consomme plus de ressources pour des tâches équivalentes   | Utilise moins de ressources pour des tâches équivalentes  |
| **Complexité des requêtes**                               | Permet des requêtes plus complexes (supporte les jointures avancées, les sous-requêtes, etc.) | Moins de possibilités pour les requêtes complexes         |
| **Support des formats de données**                        | En tant qu'ORDBMS [(2)](#ordbms), il prend en charge les types JSON, XML, et autres types de données complexes | SGBD [(3)](#sgbd) relationnel, Ne prend en charge que des types de données relationnels standard |
| **Cas d'usage recommandé**                                | Idéal pour des applications entreprises complexes nécessitant des écritures fréquentes et des opérations avancées | Mieux adapté pour des projets simples, des prototypes, ou des applications avec peu d'utilisateurs |
| **Gestion des connexions**                                | Chaque connexion est un nouveau processus, offrant ainsi une isolation complète | Chaque connexion est gérée par un thread, ce qui peut être plus léger mais moins isolé |
| **Résilience en cas de crash**                            | Les crashs affectent uniquement le processus concerné, garantissant une meilleure résilience | Un crash peut entraîner l'arrêt complet de la base de données |
| **Support des transactions ACID** [(4)](#acid)                         | Excellente prise en charge des transactions ACID avec un contrôle stricte de la consistance | Supporte les transactions ACID, mais avec des garanties moindres |
| **Tolérance aux erreurs**                                 | Très rigoureux, avec une gestion stricte des erreurs et des transactions | Plus tolérant aux erreurs, mais avec un risque plus élevé de perte de données |

### ANSI SQL
ANSI SQL (American National Standards Institute Structured Query Language) est une norme définissant le langage de requête utilisé pour gérer et manipuler des bases de données relationnelles. Elle spécifie la syntaxe et les règles pour les opérations telles que la sélection, l'insertion, la mise à jour et la suppression de données, garantissant ainsi l'interopérabilité entre différents systèmes de gestion de bases de données.

### ORDBMS
ORDBMS (Object-Relational Database Management System) : Un ORDBMS est un système de gestion de bases de données qui combine des fonctionnalités relationnelles classiques avec des capacités orientées objet. Il permet de gérer des données sous forme de tables tout en prenant en charge des types de données complexes comme les objets, les tableaux ou les types définis par l'utilisateur.

### SGBD
SGBD (Système de Gestion de Base de Données) : Un SGBD est un logiciel permettant de créer, gérer et manipuler des bases de données. Il permet de stocker, organiser et récupérer des données de manière efficace tout en garantissant leur intégrité et leur sécurité. Les SGBD peuvent être relationnels (RDBMS) ou orientés objet (ORDBMS).

### ACID
ACID est un acronyme pour Atomicité, Cohérence, Isolation et Durabilité. Les bases de données ACID privilégient la cohérence des données : si une erreur survient pendant une transaction, toute la transaction échoue pour garantir que les données restent dans un état cohérent. En revanche, les bases de données BASE (Basically Available, Soft state, Eventually consistent) privilégient la disponibilité plutôt que la cohérence immédiate. Cela signifie que même si une transaction échoue ou si des données incohérentes sont temporairement accessibles, le système continue à fonctionner et la cohérence est atteinte progressivement, souvent après un délai.

## Conclusion

PostgreSQL est le choix idéal pour des applications complexes et exigeantes. Grâce à son support complet des transactions ACID, son contrôle de concurrence sans verrous, et sa capacité à gérer des requêtes et des données complexes, il surpasse MySQL dans des environnements à forte charge et nécessitant des opérations avancées. Sa résilience face aux crashs et sa robustesse en font une option plus fiable pour des applications critiques. Si vous avez besoin de performances élevées, de flexibilité et de fiabilité, PostgreSQL est le meilleur choix.