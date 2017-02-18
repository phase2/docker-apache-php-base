# Outrigger Apache PHP Base

> Abstract base image for a PHP application server for Apache w/ PHP-FPM

[![](https://images.microbadger.com/badges/version/outrigger/apache-php-base.svg)](https://microbadger.com/images/outrigger/apache-php-base "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/outrigger/apache-php-base.svg)](https://microbadger.com/images/outrigger/apache-php-base "Get your own image badge on microbadger.com")

A base image for [outrigger/docker-apache-php](https://hub.docker.com/r/outrigger/apache-php).
Includes Apache and default VirtualHost configured with php-fpm proxy. Based on [outrigger/servicebase](https://hub.docker.com/r/outrigger/servicebase/)

Does not include the PHP runtime. Extends this to add your own, or use
[outrigger/apache-php](https://hub.docker.com/r/outrigger/apache-php).

For more documentation on how Outrigger images are constructed and how to work
with them, please [see the documentation](http://docs.outrigger.sh/en/latest/).

## Features

### Default VirtualHost

* **Socket:** 0.0.0.0:80
* **Server Name:** localhost
* **PHP-FPM proxy:** fcgi://localhost:9001
* **Docroot:** /var/www/html (configurable, see below)

Apache error and access logs are written to `/var/log/httpd`.

### Optional Xdebug integration

By choosing to set the PHP_XDEBUG environment variable to `"true"`, you may
enable Xdebug support. For details of the Xdebug configuration see the
[configuration template](./root/etc/confd/templates/xdebug.ini.tmpl).

The specific Xdebug settings are not configurable without overriding the Xdebug
template but should serve most use cases.

For more on using Xdebug with PHPStorm, see the [detailed Outrigger tutorial](http://docs.outrigger.sh/en/latest/common-tasks/using-xdebug-with-phpstorm/).

## Environment Variables

Outrigger images use Environment Variables and [confd](https://github.com/kelseyhightower/confd)
to "templatize" a number of Docker environment configurations. These templates are
processed on startup with environment variables passed in via the docker run
command-line or via your docker-compose manifest file. Here are the "tunable"
configurations offered by this image.

* `PROXY_TIMEOUT`: [`120`] Apache `ProxySet timeout` value for the php-fpm proxy.
* `PHP_MAX_EXECUTION_TIME`: [`60`] PHP `max_execution_time` value.
* `PHP_MAX_CHILDREN`: [`5`] Apache process manager `pm.max_children` value.
* `PHP_MEMORY_LIMIT`: [`256m`] PHP `memory_limit` value.
* `PHP_OPCACHE_MEMORY`: [`192`] PHP `opcache.memory_consumption` value.
* `PHP_XDEBUG`: [`"false"`|`"true"`] A string literal to enable PHP Xdebug.
  Defaults to `"false"`.
* `PHP_XHPROF`: [`"false"`|`"true"`] A string literal to enable PHP xhprof.
  Sets the `xhprof.output_dir` directive to /tmp when enabled. Only usable on
  PHP versions less than PHP 7. Defaults to `"false"`.
* `PHP_TIMEZONE`: [`UTC`] PHP `date.timezone` value.
* `PHP_POST_MAX_SIZE`: [`12M`] PHP `post_max_size` value.
* `PHP_UPLOAD_MAX_FILESIZE`: [`10M`] PHP `upload_max_filesize` value.
* `DOCROOT`: [`/var/www/html`] Apache document root.

## Security Reports

Please email outrigger@phase2technology.com with security concerns.

## Maintainers

[![Phase2 Logo](https://www.phase2technology.com/wp-content/uploads/2015/06/logo-retina.png)](https://www.phase2technology.com)
