#!/bin/bash

currentdir=${PWD##*/}

echo "Downloading the latest version of WordPress..."
wp core download

echo "Creating a WordPress config file..."
read -p "Please enter the database name (default = ${currentdir}): " dbname
dbname=${dbname:-${currentdir}}
read -p "Please enter the database user (default = root): " dbuser
dbuser=${dbuser:-root}
wp config create --dbname=${dbname} --dbuser=${dbuser}

echo "Creating a new database for your project..."
wp db create

echo "Installing WordPress..."
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

echo "Project setup complete ... now get to work!"