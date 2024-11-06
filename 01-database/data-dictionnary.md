# Dictionnaire de données

| Nom de la table | Nom du champ | Type de données | Format de données | Définition du champs |
|---    |:-:    |:-:    |:-:    |--:    |
| Users | user_UUID | UUID | 8-4-4-4-12 | identifiant unique de l'utilisateur |
| Users | user_pseudo | varchar(50) | ALphanumérique, underscores acceptés | Pseudonyme de l'utilisateur |
| Users | username | varchar(50) | Alphabétique, tirets acceptés | Nom de l'utilisateur |
| Users | user_password | varchar(255) | string hashé | Mot de passe de l'utilisateur |
| Users | created_at | timestamptz | YYYY-MM-DD HH:MI:SS+TZ | Date de création de l'utilisateur |
|---    |:-:    |:-:    |:-:    |--:    |
| Orders | order_number | BIGINT | Numérique | Numéro de la commande |
| Orders | order_total_cost_ht | DECIMAL(10, 2) | Décimale à deux chiffres après la virgule | Coût total de la commande hors taxe |
| Orders | order_total_quantity | int | Numérique | Nombre total des produits de la commande |
| Orders | created_at | timestamptz | YYYY-MM-DD HH:MI:SS+TZ  | Date de création de la commande |
| Orders | deliver_atO | timez | YYYY-MM-DD+TZ  | Date de livraison de la commande |
|---    |:-:    |:-:    |:-:    |--:    |
| Products | product_UUID | (wip) | (wip) | (wip) |
| Products | product_name | (wip) | (wip) | (wip) |
| Products | product_description | (wip) | (wip) | (wip) |
| Products | product_price | (wip) | (wip) | (wip) |
| Products | product_quantity | (wip) | (wip) | (wip) |
| Products | created_at | (wip) | (wip) | (wip) |
| Products | updated_at | (wip) | (wip) | (wip) |