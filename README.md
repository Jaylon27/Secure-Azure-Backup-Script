 # Secure Azure Backup Script

This project provides a secure and automated way to back up financial data to Azure Blob Storage. It ensures that sensitive data is compressed, encrypted, and uploaded to the cloud, providing a reliable backup solution.

## Problem Being Solved

Backing up sensitive financial data is crucial for data recovery and security. Manual backup processes can be error-prone and time-consuming. This project automates the backup process, ensuring that data is securely encrypted and stored in Azure Blob Storage, reducing the risk of data loss and unauthorized access.

## Technology and Tools

The project uses the following technologies and tools:

- **Bash Script**: The main backup process is implemented in a Bash script (`backup_script.sh`), which handles compression, encryption, and uploading of data.
- **GnuPG (GPG)**: Used for encrypting the backup files with AES256 encryption to ensure data security.
- **Terraform**: Used for provisioning and managing the Azure infrastructure required for storing the backups.
- **Azure Blob Storage**: Cloud storage service from Microsoft Azure used to store the encrypted backup files.
