FROM mysql
MAINTAINER Ian Edington "IanEdington@gmail.com"

ENV MYSQL_ROOT_PASSWORD password
ENV MYSQL_PASSWORD password
ENV MYSQL_DATABASE wordpress

# this need to stay the same for script to work
ENV MYSQL_USER mysql

COPY ./localdb-run.sh /
RUN chmod 755 /localdb-run.sh

ENTRYPOINT ["/localdb-run.sh"]
