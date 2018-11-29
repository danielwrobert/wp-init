# WP-Init

A set of WP-CLI commands I frequently run to start up a new WP project.

## Usage

Add this script to the directory you wish to install your WP project and run.

### Options

```
<PROJECT_DIRECTORY_NAME>
```

(Required)

The name of the directory where your root WordPress install is.

```
<DB_NAME>
```

(Optional)

The name of your database.

Default:

`<PROJECT_DIRECTORY_NAME>`

```
<SITE_URL>
```

(Optional)

The URL for your local development environment. Example: http://localhost.

Default:

http://<PROJECT_DIRECTORY_NAME>.test

```
<SITE_TITLE>
```

(Optional)

The title of your WordPress site.

Default:

"Just Another WordPress Site"

```
<USERNAME>
```

(Required)

Administrator's user name

```
<PASSWORD>
```

(Required)

Administrator's password

```
<USER_EMAIL>
```

(Required)

Administrator's email


### Examples

```
sh wp-init.sh <PROJECT_DIRECTORY_NAME> <SITE_TITLE> <USERNAME> <PASSWORD> <USER_EMAIL>
```

Note that if you have spaces in any of the above arguments, you need to wrap that argument in single quotes. The arguments must be passed in the order listed above.

For the time being, the directory name and the database name should be the same. This script assumes you can access your MySQL instance via `mysql -u root`. It works well in a Laravel Valet setup, for example. It also assumes you have [WP-CLI](https://developer.wordpress.org/cli/commands/) setup and configured.
