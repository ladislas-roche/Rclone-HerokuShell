#!/bin/bash

if [[ -n $RCLONE_CONFIG ]]; then
	echo "Rclone config detected"
     mkdir /usr/src/app/.config && mkdir /usr/src/app/.config/rclone && cd /usr/src/app/.config/rclone && wget $RCLONE_CONFIG
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
