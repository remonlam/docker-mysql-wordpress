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
