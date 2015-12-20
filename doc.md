# Running MySQL, WP and HAProxy in containers
#### VARIABLES
export ROOT_PASSWORD=P@ssw0rd123 <br>
export WORDPRESS_PASSWORD=P@ssw0rd123

#### STORAGE
MYSQL: /Users/remonlam/docker/mounts/testing1/mysql:/var/lib/mysql<br>
WORDPRESS: /Users/remonlam/docker/mounts/testing1/wwwdata:/var/www/html

#### CONTAINERS
MySQL: 1 container named "mysql"<br>
Wordpress: 3 containers named "wp-n1", "wp-n2" and "wp-n3" running on port 8081, 8082 and 8083<br>
HAProxy: 1 container named "haproxy" running on port 80 (external facing)<br>


## Setup the environment
#### Setup variables
ROOT_PASSWORD=P@ssw0rd123 <br>
WORDPRESS_PASSWORD=P@ssw0rd123

#### Create mountpoints for MySQL and Wordpress
mkdir -p /Users/$USER/docker/mounts/mysql/<br>
mkdir -p /Users/$USER/docker/mounts/wp/

#### Create the first (MySQL) container
docker run --detach \ <br>
  --name mysql \ <br>
  --env MYSQL_ROOT_PASSWORD=$ROOT_PASSWORD \ <br>
  --env MYSQL_USER=wordpress \ <br>
  --env MYSQL_PASSWORD=$WORDPRESS_PASSWORD \ <br>
  --env MYSQL_DATABASE=wordpress \ <br>
  --volume /Users/$USER/docker/mounts/mysql:/var/lib/mysql \ <br>
  mysql

##### Check if you can see any files in "/Users/$USER/docker/mounts/mysql"

#### Create the Wordpress (3x) containers
##### First container
docker run --detach \ <br>
  --publish 8081:80 \ <br>
  --name wp-n1 \ <br>
  --volume /Users/$USER/docker/mounts/wp:/var/www/html \ <br>
  --link mysql:mysql \ <br>
  --env WORDPRESS_DB_USER=wordpress \ <br>
  --env WORDPRESS_DB_PASSWORD=$WORDPRESS_PASSWORD \ <br>
  wordpress

##### Check if you can see any files in "/Users/$USER/docker/mounts/wp"

##### Second container
docker run --detach \ <br>
  --publish 8082:80 \ <br>
  --name wp-n2 \ <br>
  --volume /Users/$USER/docker/mounts/wp:/var/www/html \ <br>
  --link mysql:mysql \ <br>
  --env WORDPRESS_DB_USER=wordpress \ <br>
  --env WORDPRESS_DB_PASSWORD=$WORDPRESS_PASSWORD \ <br>
  wordpress

##### Third container
docker run --detach \ <br>
  --publish 8083:80 \ <br>
  --name wp-n3 \ <br>
  --volume /Users/$USER/docker/mounts/wp:/var/www/html \ <br>
  --link mysql:mysql \ <br>
  --env WORDPRESS_DB_USER=wordpress \ <br>
  --env WORDPRESS_DB_PASSWORD=$WORDPRESS_PASSWORD \ <br>
  wordpress

#### Create the HAProxy container
docker run --detach \ <br>
 --link wp-n1 \ <br>
 --link wp-n2 \ <br>
 --link wp-n3 \ <br>
 --name haproxy \ <br>
 --env STATS_AUTH="auth:auth" \ <br>
 --env STATS_PORT=1936 \ <br>
 --publish 80:80  \ <br>
 --publish 1936:1936 \ <br>
 tutum/haproxy
