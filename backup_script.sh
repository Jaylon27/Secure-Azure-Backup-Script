#!/bin/bash

BACKUP_DIR="/home/jaylon/Documents/financial_data"
TIMESTAMP=$(date +%m%d%H%M)
BACKUP_FILE="financial_data_$TIMESTAMP.tar.gz"
ENCRYPTED_FILE="$BACKUP_FILE.gpg"

# Create a compressed archive
tar czvf $BACKUP_FILE -C $BACKUP_DIR client_records reports tax_documents
if [ $? -ne 0 ]; then
    echo "Error: Compression failed." >> backup.log
    exit 1
fi

# Encrypt the archive
gpg --symmetric --cipher-algo AES256 --output $ENCRYPTED_FILE $BACKUP_FILE
if [ $? -ne 0 ]; then
    echo "Error: Encryption failed." >> backup.log
    exit 1
fi

# Upload the encrypted archive to Azure
az storage blob upload --account-name azurebackscriptstorage --container-name azurebackscript-container --name $ENCRYPTED_FILE --file $ENCRYPTED_FILE
if [ $? -ne 0 ]; then
    echo "Error: Upload to Azure failed." >> backup.log
    exit 1
fi

echo "Backup completed successfully at $(date)" >> backup.log

