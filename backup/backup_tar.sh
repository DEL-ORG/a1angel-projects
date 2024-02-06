#!/bin/bash

# aws configure information
AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION

# PostgreSQL database information
DB_HOST=$DB_HOST
DB_PORT=$DB_PORT
DB_NAME=$DB_NAME
DB_USER=$DB_USER
DB_PASSWORD=$DB_PASSWORD
BUCKET_NAME=$BUCKET_NAME

aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID && \
aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY && \
aws configure set default.region $AWS_DEFAULT_REGION && \
aws configure set output json   

# Backup directory
BACKUP_DIR="/a1angel-backup"

# Timestamp for the backup file
TIMESTAMP=$(date +"%Y%m%d%H%M%S")

# Backup file name
BACKUP_FILE="$BACKUP_DIR/${DB_NAME}_${TIMESTAMP}.sql"

# Create the backup
PGPASSWORD=$DB_PASSWORD pg_dump -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME > $BACKUP_FILE

# Check the exit status of pg_dump
if [ $? -eq 0 ]; then
    echo "Backup successful. Backup file is: $BACKUP_FILE"
else
    echo "Backup failed."
fi
# compress the file
tar czvf ${DB_NAME}*.tar.gz $BACKUP_FILE

# Copy file into s3 bucket
aws s3 cp *.tar.gz s3://$BUCKET_NAME



