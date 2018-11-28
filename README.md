# WP-Init

A set of WP-CLI commands I frequently run to start up a new WP project.

## Usage

Add this script to the directory you wish to install your WP project and run the following command:

```
sh wp-init.sh <PROJECT DIRECTORY NAME> <SITE TITLE> <USERNAME> <PASSWORD> <USER EMAIL>
```

Note that if you have spaces in any of the above arguments, you need to wrap that argument in single quotes. The arguments must be passed in the order listed above.

For the time being, the directory name and the database name should be the same. This script assumes you can access your MySQL instance via `mysql -u root`. It works well in a Laravel Valet setup, for example. It also assumes you have [WP-CLI](https://developer.wordpress.org/cli/commands/) setup and configured.
