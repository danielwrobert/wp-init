# WP-Init

A set of WP-CLI commands w for starting up a new local WordPress environment.

## Usage

- Add this script to the directory you wish to install your WP project.
	- Technically, you can install it anywhere – just make sure you account for the location in the path to the `.sh` file when you execute the script in the next step!
- Execute the script via the `sh wp-init.sh` command.
- Follow the prompts!

## Requirements

This script assumes you have [WP-CLI](https://developer.wordpress.org/cli/commands/) setup and configured. If you want to install a WooCommerce environment with this script, you will also need to have the [woo-test-environment](https://github.com/nielslange/woo-test-environment) extension installed (you will be prompted during the installation).