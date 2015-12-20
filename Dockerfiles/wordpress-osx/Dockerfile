FROM wordpress
MAINTAINER Remon Lam <remon.lam@virtualclouds.info>

COPY ./osx-write-vol-wp.sh /
RUN chmod 755 /osx-write-vol-wp.sh

ENTRYPOINT ["/osx-write-vol-wp.sh"]
