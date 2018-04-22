#!/bin/bash

sed -i -e "s/\[PHP_UPSTREAM\]/$PHP_UPSTREAM/g" /etc/apache2/conf-available/php.conf

/usr/sbin/apache2 -DFOREGROUND
