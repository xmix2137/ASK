#!/bin/bash

### CONFIGURATION 
VERSION=${VERSION:-'v10.11.15'}
APP_URL="https://github.com/JakubZajas/computer-programming-4-2024/releases/download/${VERSION}/app.jar"
APP_NAME=${APP_NAME:-"ecommerce"}

DEST=/opt/${APP_NAME}
USERNAME=${APP_NAME}

### SYSTEM UPGRADE
dnf update && dnf upgrade

### Java dependencies
dnf install -y -q java-17-amazon-corretto

#DIR and USER
mkdir -p ${DEST}
adduser ${USERNAME} || true

curl -L -o ${DEST}/app.jar ${APP_URL}
chown -R ${USERNAME}:${USERNAME} ${DEST}

# TEMPLATING
systemd_config="""
[Unit]
Description=${APP_NAME}
After=network-online.target

[Service]
Type=simple
User=${USERNAME}
ExecStart=/usr/bin/java -jar -Dserver.port=8080 ${DEST}/app.jar
Restart=always

[Install]
WantedBy=multi-user.target
"""
echo "$systemd_config" > /etc/systemd/system/${APP_NAME}.service
systemctl daemon-reload
systemctl start ${APP_NAME}
systemctl enable ${APP_NAME}

# echo "java -jar -Dserver.port=8080 /opt/ecommerce/app.jar"