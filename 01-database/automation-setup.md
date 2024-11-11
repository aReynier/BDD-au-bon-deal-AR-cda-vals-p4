# Notice d'installation de la tâche cron pour les backup automatisés

## Préparer le script de sauvegarde
Créer un fichier de script avec pour extension .sh et y mettre le script suivant:
```
DB_NAME="nom_db"
DB_USER="nom_admin_db"
BACKUP_DIR="chemin/dossier_script_backup/"
DATE=$(date +\%Y-\%m-\%d_\%H-\%M-\%S)
BACKUP_FILE="${BACKUP_DIR}/backup_${DB_NAME}_${DATE}.sql"
PASSWORD="mot_de_passe"

# S'assurer que le dossier d'accueil existe et dispose des droits de permission en écriture
mkdir -p "$BACKUP_DIR"
chmod u+w "$BACKUP_DIR"

# Lancer pg_dump pour le backup
PGPASSWORD=$PASSWORD pg_dump -U $DB_USER -d $DB_NAME -F p > $BACKUP_FILE

# Message de succès
echo "Backup created successfully: $BACKUP_FILE"
```

## Droits d'éxécution

Dans le temrinal, ajouter la commande suivante pour donner les droits d'éxecution:
```Terminal
chmod +x chemin/dossier_script_backup/script.sh
```

## Configurer la tâche Cron

Ensuite pour créer la tâche Cron, ouvrir l'éditeur dans le terminal:
```Terminal
crontab -e
```

Ajouter la ligne suivante pour exécuter le script chaque jour Ã  3h du matin :
```Terminal
0 3 * * * /chemin/dossier_script_backup/script.sh
```