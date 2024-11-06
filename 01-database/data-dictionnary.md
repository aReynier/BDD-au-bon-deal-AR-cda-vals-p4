# Dictionnaire de données

| Nom de la table | Nom du champ | Type de données | Contrainte | Format de données | Exemple de donnée | Définition du champs |
|--------|--------|--------|------|-----|-------|-----|
| Users | user_UUID | UUID | PRIMARY KEY, NOT NULL | 8-4-4-4-12 | a4b2c1d2-e5f6-4a7b-9c8d-ef1234567890 | identifiant unique de l'utilisateur |
| Users | user_pseudo | varchar(50) | UNIQUE, NOT NULL | Alphanumérique, underscores acceptés | cool_user123 | Pseudonyme de l'utilisateur |
| Users | username | varchar(50) | NOT NULL | Alphabétique, tirets acceptés | Jane Doe | Nom de l'utilisateur |
| Users | user_password | varchar(255) | NOT NULL | string hashé | $2b$12$eGd7gf87gf1Oqfd0x1j33iQ5r9X3VlvqTq9Xz12XpJ8Qw2 | Mot de passe de l'utilisateur |
| Users | created_at | timestamptz | NOT NULL, DEFAULT CURRENT_TIMESTAMP | YYYY-MM-DD HH:MI:SS+TZ | 2024-11-06 15:30:00+00 | Date de création de l'utilisateur |
|:-:    |:-:    |:-:    |:-:    |:-:    |:-:    |
| Orders | order_number | BIGINT | PRIMARY KEY, NOT NULL | Numérique | 8745632100123 | Numéro de la commande |
| Orders | order_total_cost_ht | DECIMAL(10, 2) | NOT NULL | Décimale à deux chiffres après la virgule | 19.99 | Coût total de la commande hors taxe |
| Orders | order_total_quantity | int | NOT NULL | Numérique | 150 | Nombre total des produits de la commande |
| Orders | created_at | timestamptz | NOT NULL, DEFAULT CURRENT_TIMESTAMP | YYYY-MM-DD HH:MI:SS+TZ  | 2024-11-06 15:30:00+00 | Date de création de la commande |
| Orders | deliver_atO | timez | NOT NULL | YYYY-MM-DD+TZ  | 2024-11-06+00 | Date de livraison de la commande |
|:-:    |:-:    |:-:    |:-:    |:-:    |:-:    |
| Products | product_UUID | UUID | PRIMARY KEY, NOT NULL | 8-4-4-4-12 | a4b2c1d2-e5f6-4a7b-9c8d-ef1234567890 | Identifiant unique du produit |
| Products | product_name | varchar(100) | NOT NULL | Alphanumerique, espaces, trets, slashs | Magnifique stylo next-gen | Nom du produit |
| Products | product_description | varchar(500) | | 	Alphanumérique, espaces, ponctuation | Un stylo AI powered parce que le futur  | Description du produit |
| Products | product_price | DECIMAL(10, 2) | NOT NULL | Décimale à deux chiffres après la virgule | 19.99 | Prix du produit |
| Products | product_quantity | int | NOT NULL | Numérique | 150 | Quantité de produit en stock |
| Products | created_at | timestampz | NOT NULL,DEFAULT CURRENT_TIMESTAMP | YYYY-MM-DD HH:MI:SS+TZ  | 2024-11-06 15:30:00+00 | Date d'ajout du produit |
| Products | updated_at | timestampz | NOT NULL, DEFAULT CURRENT_TIMESTAMP | YYYY-MM-DD HH:MI:SS+TZ  | 2024-11-06 15:30:00+00 |  Date de mise à jour du produit |