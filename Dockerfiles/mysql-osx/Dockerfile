FROM mysql
MAINTAINER Remon Lam <remon.lam@virtualclouds.info>

#ENV MYSQL_ROOT_PASSWORD password
#ENV MYSQL_PASSWORD password
#ENV MYSQL_DATABASE wordpress

# this need to stay the same for script to work
ENV MYSQL_USER mysql

COPY ./osx-start-db.sh /
RUN chmod 755 /osx-start-db.sh

ENTRYPOINT ["/osx-start-db.sh"]
