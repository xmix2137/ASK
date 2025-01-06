#!/bin/bash

NAME=$(whoami)

echo "Hello ${NAME}"

### CONFIGURATION 
REPOSITORY="https://github.com/jkanclerz/computer-programming-4-2024"
APP_NAME=${APP_NAME:-"ecommerce"}
VERSION=main
TMP_DEST=/tmp/${APP_NAME}

DEST=/opt/${APP_NAME}
USERNAME=${APP_NAME}

OS_DEPENDENCIES="git mc cowsay tree"

### SYSTEM UPGRADE

dnf update && dnf upgrade
### Install git and os dependencies
dnf install ${OS_DEPENDENCIES} -y -q

#Sync repo 
rm -rf ${ECOMMERCE_TMP_DEST} || true
git clone ${REPOSITORY} -b ${VERSION} ${TMP_DEST}

### Java dependencies
dnf install -y -q java-17-amazon-corretto maven-local-amazon-corretto17

### Build package
cd ${TMP_DEST} && mvn package -DskipTests

mkdir -p ${DEST}
adduser ${USERNAME}

mv ${TMP_DEST}/target/*.jar ${DEST}/app.jar
chown -R ${USERNAME}:${USERNAME} ${DEST}


echo "java -jar -Dserver.port=8080 /opt/ecommerce/app.jar"