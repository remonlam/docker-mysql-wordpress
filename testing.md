docker run --detach --name mysql --env MYSQL_ROOT_PASSWORD=$ROOT_PASSWORD --env MYSQL_USER=wordpress --env MYSQL_PASSWORD=$WORDPRESS_PASSWORD --env MYSQL_DATABASE=wordpress --volume /Users/$USER/docker/mounts/mysql:/var/lib/mysql remonlam/docker-mysql

docker run --detach --name mysql --env MYSQL_ROOT_PASSWORD=$ROOT_PASSWORD --env MYSQL_USER=wordpress --env MYSQL_PASSWORD=$WORDPRESS_PASSWORD --env MYSQL_DATABASE=wordpress --volume /Users/$USER/docker/mounts/mysql:/var/lib/mysql mariadb

docker run --detach --publish 8081:80 --name wp-n1 --volume /Users/$USER/docker/mounts/wp:/var/www/html --link mysql:mysql --env WORDPRESS_DB_USER=wordpress --env WORDPRESS_DB_PASSWORD=$WORDPRESS_PASSWORD remonlam/docker-wordpress
docker run --detach --publish 8082:80 --name wp-n2 --volume /Users/$USER/docker/mounts/wp:/var/www/html --link mysql:mysql --env WORDPRESS_DB_USER=wordpress --env WORDPRESS_DB_PASSWORD=$WORDPRESS_PASSWORD remonlam/docker-wordpress
docker run --detach --publish 8083:80 --name wp-n3 --volume /Users/$USER/docker/mounts/wp:/var/www/html --link mysql:mysql --env WORDPRESS_DB_USER=wordpress --env WORDPRESS_DB_PASSWORD=$WORDPRESS_PASSWORD remonlam/docker-wordpress

docker run --detach --link wp-n1 --link wp-n2 --link wp-n3 --name haproxy --env STATS_AUTH="auth:auth" --env STATS_PORT=1936 --publish 80:80 --publish 1936:1936 tutum/haproxy
docker ps


docker exec -it [CONTAINER] bash -c "export TERM=xterm; exec bash"
