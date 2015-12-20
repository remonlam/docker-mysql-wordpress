# Running MySQL, WP and HAProxy in containers
### VARIABLES
export ROOT_PASSWORD=P@ssw0rd123 <br>
export WORDPRESS_PASSWORD=P@ssw0rd123


### STORAGE
MYSQL: /Users/remonlam/docker/mounts/testing1/mysql:/var/lib/mysql<br>
WORDPRESS: /Users/remonlam/docker/mounts/testing1/wwwdata:/var/www/html


### CONTAINERS
MySQL: 1 container named "mysql"<br>
Wordpress: 3 containers named "wp-n0", "wp-n1" and "wp-n2" running on port 8081, 8082 and 8083<br>
HAProxy: 1 container named "haproxy" running on port 80 (external facing)


## Setup the environment

### Setup variables
ROOT_PASSWORD=P@ssw0rd123 <br>
WORDPRESS_PASSWORD=P@ssw0rd123

### Create mountpoints for MySQL and Wordpress
mkdir -p /Users/$USER/docker/mounts/mysql/<br>
mkdir -p /Users/$USER/docker/mounts/wp/

### Create the first (MySQL) container
docker run --detach \
  --name mysql \
  --env MYSQL_ROOT_PASSWORD=$ROOT_PASSWORD \
  --env MYSQL_USER=wordpress \
  --env MYSQL_PASSWORD=$WORDPRESS_PASSWORD \
  --env MYSQL_DATABASE=wordpress \
  --volume /Users/remonlam/docker/mounts/testing1/mysql:/var/lib/mysql \
  mysql
