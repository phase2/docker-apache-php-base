FROM phase2/servicebase

RUN yum -y update && \
    yum -y install \
      httpd \
      cronolog \
      centos-release-scl-rh

EXPOSE 80

COPY root /

VOLUME ["/var/log/httpd"]

ENV PROXY_TIMEOUT           120
ENV PHP_MAX_EXECUTION_TIME  30
ENV PHP_MAX_CHILDREN        5
ENV PHP_MEMORY_LIMIT        256m
ENV PHP_OPCACHE_MEMORY      192
ENV PHP_XDEBUG              false
ENV PHP_XHPROF              false
ENV PHP_TIMEZONE            UTC
ENV DOCROOT                 /var/www/html
