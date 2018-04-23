#!/bin/bash

sed -i -e "s/\[PHP_UPSTREAM\]/$PHP_UPSTREAM/g" /etc/apache2/conf-available/php.conf

# Apache gets grumpy about PID files pre-existing
rm -f ${APACHE_PID_FILE}

/usr/sbin/apache2 -DFOREGROUND
