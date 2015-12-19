#!/bin/bash
...
adduser --system --uid=$(stat -c %u .) "$owner"
echo "APACHE_RUN_USER=$owner" >> /etc/apache2/envvars
