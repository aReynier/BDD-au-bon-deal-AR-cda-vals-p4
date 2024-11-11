export DB_NAME="bon_deal_db"
export DB_USER="admin_bon_deal"
export BACKUP_DIR="."
export DATE=$(date +\%Y-\%m-\%d_\%H-\%M-\%S) 

echo "DB_NAME: ${DB_NAME}"
echo "DB_USER: ${DB_USER}"
echo "BACKUP_DIR: ${BACKUP_DIR}"
echo "BACKUP_FILE: ${BACKUP_FILE}"
echo "DATE: ${DATE}"