![logo](https://www.phase2technology.com/wp-content/uploads/2015/06/logo-retina.png)

# phase2/apache-php-base

The base image for Apache and PHP-fpm services. It exposes a running Apache+php-fpm service on port 80.

Based on [phase2/servicebase](https://hub.docker.com/r/phase2/servicebase/)

## Configuration Options
This image defines several environment variables that it uses when building the container. The default values can be overridden in your build by adding them to your docker-compose file.

- **PROXY_TIMEOUT**: Apache `ProxySet timeout` value for the php-fpm proxy. Defaults to _120_.
- **PHP_MAX_EXECUTION_TIME**: PHP `max_execution_time` value. Defaults to _60_.
- **PHP_MAX_CHILDREN**: Apache process manager `pm.max_children` value. Defaults to _5_.
- **PHP_MEMORY_LIMIT**: PHP `memory_limit` value. Defaults to _256m_.
- **PHP_OPCACHE_MEMORY**: PHP `opcache.memory_consumption` value. Defaults to _192_.
- **PHP_XDEBUG**: A boolean for enabling PHP xdebug. The individual xdebug parameters are not configurable but the defaults should serve most environments. Defaults to _false_.

	Static xdebug properties:

		xdebug.coverage_enable=0
		xdebug.default_enable=1
		xdebug.remote_enable=1
		xdebug.remote_connect_back=1
		xdebug.remote_host=localhost
		xdebug.remote_port=9000
		xdebug.remote_handler=dbgp
		xdebug.remote_log=/tmp/xdebug.log
		xdebug.remote_autostart=true
		xdebug.idekey="DEVTOOLS"
		xdebug.max_nesting_level=256

- **PHP_XHPROF**: A boolean for enabling PHP xhprof. Sets the `xhprof.output_dir` directive to /tmp when enabled. Defaults to _false_.
- **PHP_TIMEZONE**: PHP `date.timezone` value. Defaults to _UTC_.
- **PHP_POST_MAX_SIZE**: PHP `post_max_size` value. Defaults to _12M_.
- **PHP_UPLOAD_MAX_FILESIZE**: PHP `upload_max_filesize` value. Defaults to _10M_.
- **DOCROOT**: Apache document root. Defaults to _/var/www/html_.
