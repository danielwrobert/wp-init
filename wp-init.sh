#!/bin/bash

echo "Downloading the latest version of WordPress..."
wp core download

echo "Creating a WordPress config file..."
wp config create --dbname=$1 --dbuser=root

echo "Creating a new database for your project..."
wp db create

echo "Installing WordPress..."
wp core install --url=$1.test --title="$2" --admin_user=$3 --admin_password=$4 --admin_email=$5

echo "Project setup complete ... now get to work!"