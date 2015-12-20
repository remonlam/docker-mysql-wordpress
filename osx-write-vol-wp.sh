#!/bin/bash
set -e

# Script to workaround docker-machine/boot2docker OSX host volume issues: https://github.com/docker-library/mysql/issues/99

echo '* Working around permission errors locally by making sure that "www-data" uses the same uid and gid as the host volume'
TARGET_UID=$(stat -c "%u" /var/www/html)
echo '-- Setting www-data user to use uid '$TARGET_UID
usermod -o -u $TARGET_UID www-data || true
TARGET_GID=$(stat -c "%g" /var/www/html)
echo '-- Setting www-data group to use gid '$TARGET_GID
groupmod -o -g $TARGET_GID www-data || true
echo
echo '* Starting www-data'
chown -R www-data:root /var/www/html/
#/entrypoint.sh
/entrypoint.sh apache2-foreground
