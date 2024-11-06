# Dictionnaire de données

| Nom de la table | Nom du champ | Type de données | Format de données | Définition du champs |
|---    |:-:    |:-:    |:-:    |--:    |
| Users | user_UUID | UUID | 8-4-4-4-12 | identifiant unique de l'utilisateur |
| Users | user_pseudo | varchar(50) | ALphanumérique, underscores acceptés | Pseudonyme de l'utilisateur |
| Users | username | varchar(50) | Alphabétique, tirets acceptés | Nom de l'utilisateur |
| Users | user_password | varchar(255) | string hashé | Moe de passe de l'utilisateur |
| Users | created_at | timestamptz | YYYY-MM-DD HH:MI:SS+TZ | Date de création de l'utilisateur |
|---    |:-:    |:-:    |:-:    |--:    |
| Orders | order_number | (wip) | (wip) | (wip) |
| Orders | order_total_cost_ht | (wip) | (wip) | (wip) |
| Orders | order_total_quantity | (wip) | (wip) | (wip) |
| Orders | created_at | (wip) | (wip) | (wip) |
| Orders | deliver_atO | (wip) | (wip) | (wip) |
|---    |:-:    |:-:    |:-:    |--:    |
| Products | product_UUID | (wip) | (wip) | (wip) |
| Products | product_name | (wip) | (wip) | (wip) |
| Products | product_description | (wip) | (wip) | (wip) |
| Products | product_price | (wip) | (wip) | (wip) |
| Products | product_quantity | (wip) | (wip) | (wip) |
| Products | created_at | (wip) | (wip) | (wip) |
| Products | updated_at | (wip) | (wip) | (wip) |