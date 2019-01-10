#!/bin/bash

YELLOW="\033[1;33m"
GREEN="\033[1;32m"
NOCOLOR="\033[0m"
currentdir=${PWD##*/}

echo "${YELLOW}Grabbing the latest version of WordPress...${NOCOLOR}"
wp core download

echo "${YELLOW}Creating a WordPress config file...${NOCOLOR}"
read -p "Please enter the database name (default = ${currentdir}): " dbname
dbname=${dbname:-${currentdir}}
read -p "Please enter the database user (default = root): " dbuser
dbuser=${dbuser:-root}
wp config create --dbname=${dbname} --dbuser=${dbuser}

echo "${YELLOW}Creating a new database for your project...${NOCOLOR}"
wp db create

echo "${YELLOW}Installing WordPress...${NOCOLOR}"
read -p "Please enter the local development URL (default = ${currentdir}.test): " devurl
devurl=${devurl:-${currentdir}.test}
read -p "Please enter the site title (default = ${currentdir}): " title
title=${title:-${currentdir}}
read -p "Please enter the admin username (default = admin): " username
username=${username:-admin}
read -p "Please enter the admin password (default = password): " userpass
userpass=${userpass:-password}
read -p "Please enter the admin email: " useremail
wp core install --url=${devurl} --title="${title}" --admin_user=${username} --admin_password=${userpass} --admin_email=${useremail}

echo "${GREEN}Project setup complete ... now get to work!${NOCOLOR}"