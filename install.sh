#!/bin/bash
# Install

# https://getcarina.com/docs/tutorials/wordpress-apache-mysql/

export ROOT_PASSWORD=P@ssw0rd123
export WORDPRESS_PASSWORD=P@ssw0rd123


# Initial run, creat database
docker run --detach \
  --name mysql \
  --env MYSQL_ROOT_PASSWORD=$ROOT_PASSWORD \
  --env MYSQL_USER=wordpress \
  --env MYSQL_PASSWORD=$WORDPRESS_PASSWORD \
  --env MYSQL_DATABASE=wordpress \
  --volume /Users/remonlam/docker/mounts/testing1/mysql:/var/lib/mysql \
  mysql

  /docker/mounts/mysql

# Run MySQL container with already created database located in mountpoint
docker run --detach \
  --name mysql \
  --env MYSQL_USER=wordpress \
  --env MYSQL_PASSWORD=$WORDPRESS_PASSWORD \
  --env MYSQL_DATABASE=wordpress \
  --volume /Users/remonlam/docker/mounts/testing1/mysql:/var/lib/mysql \
  mysql-osx


docker run --detach \
  --name mysql \
  --env MYSQL_USER=wordpress \
  --env MYSQL_PASSWORD=$WORDPRESS_PASSWORD \
  --env MYSQL_DATABASE=wordpress \
  --volume /Users/remonlam/docker/mounts/www1/mysql:/var/lib/mysql \
  mysql


## WORDPRESS
# Run wordpress container with mounts
docker run --detach \
  --publish 80:80 \
  --name wordpress \
  --volume /Users/remonlam/docker/mounts/testing1/wwwdata:/var/www/html \
  --link mysql:mysql \
  --env WORDPRESS_DB_USER=wordpress \
  --env WORDPRESS_DB_PASSWORD=$WORDPRESS_PASSWORD \
  wordpress


  docker run --detach \
    --publish 81:80 \
    --name wordpress-1 \
    --volume /Users/remonlam/docker/mounts/testing1/wwwdata:/var/www/html \
    --link mysql:mysql \
    --env WORDPRESS_DB_USER=wordpress \
    --env WORDPRESS_DB_PASSWORD=$WORDPRESS_PASSWORD \
    wordpress

    docker run --detach \
      --publish 82:80 \
      --name wordpress-2 \
      --volume /Users/remonlam/docker/mounts/testing1/wwwdata:/var/www/html \
      --link mysql:mysql \
      --env WORDPRESS_DB_USER=wordpress \
      --env WORDPRESS_DB_PASSWORD=$WORDPRESS_PASSWORD \
      wordpress

### haproxy
#
docker run -d -p 80:80 -p 1936:1936 --link wordpress-1 --link wordpress-2 tutum/haproxy
docker run -d --link wordpress-1 --link wordpress-2 -e STATS_AUTH="auth:auth" -e STATS_PORT=1936 -p 80:80 -p 1936:1936 tutum/haproxy


# Show running containers, there should be two of them runnint (mysql and wordpress).
docker ps

#####
# tar stuff
# create & extract
tar -cvf mytarfile.tgz mydir/
tar -xvf mytarfile.tgz

# wwwdata
--volume /Users/remonlam/docker/mounts/www1/html:/var/www/html
# dbdata
--volume /Users/remonlam/docker/mounts/www1/mysql:/var/lib/mysql



InnoDB: Operating system error number 13 in a file operation.
InnoDB: The error means mysqld does not have the access rights to the directory.
