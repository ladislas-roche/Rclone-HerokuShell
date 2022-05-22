#!/bin/bash

if [[ -n $RCLONE_CONFIG_BASE_URL ]]; then
	echo "Rclone config detected"
     mkdir /app/.config && mkdir /app/.config/rclone && wget -O /app/.config/rclone/rclone.conf $RCLONE_CONFIG_BASE_URL
fi

if [[ -n $BOT_TOKEN && -n $OWNER_ID ]]; then
	echo "Bot token and owner ID detected"
	python3 config.py
fi

if [[ -n $ACCOUNTS_FOLDER_LINK ]]; then
	echo "accounts.zip detected"
    wget $ACCOUNTS_FOLDER_LINK && unzip accounts.zip -d accounts && rm *.zip
fi

echo "SETUP COMPLETED"

npm start
