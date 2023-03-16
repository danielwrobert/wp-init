#!/bin/bash

YELLOW="\033[1;33m"
GREEN="\033[1;32m"
NOCOLOR="\033[0m"
currentdir=${PWD##*/}
currentuser=$(id -un)
woocommerce=false

echo "${YELLOW}Grabbing the latest version of WordPress...${NOCOLOR}"
wp core download

echo "${YELLOW}Creating a WordPress config file...${NOCOLOR}"
read -p "Please enter the database name (default = ${currentdir}): " dbname
dbname=${dbname:-${currentdir}}
read -p "Please enter the database user (default = ${currentuser}): " dbuser
dbuser=${dbuser:-${currentuser}}
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
read -p "Please enter the admin email (default = daniel.robert@automattic.com): " useremail
useremail=${useremail:-daniel.robert@automattic.com}
wp core install --url=${devurl} --title="${title}" --admin_user=${username} --admin_password=${userpass} --admin_email=${useremail}

# The following WooCommerce items rely on the WP-CLI ext: https://github.com/nielslange/woo-test-environment.
read -p "Is this a WooCommerce project? [Y/n] " -n 1

if [[ $REPLY =~ ^[Yy]$ ]]; then
	woocommerce=true
fi

if [[ $woocommerce == true ]]; then
	# Check if the WP-CLI command is installed.
	wp woo-test-environment &>/dev/null
	if [ $? -ne 0 ]; then
		echo "${YELLOW}You must have the woo-test-environment command installed. Installing...${NOCOLOR}"
		wp package install git@github.com:nielslange/woo-test-environment.git
	fi
	echo "${YELLOW}Setting up WooCommerce...${NOCOLOR}"
	wp woo-test-environment setup
fi

echo "${GREEN}Project setup complete ... now get to work!${NOCOLOR}"