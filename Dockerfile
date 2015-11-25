FROM ubuntu:trusty
MAINTAINER Sawyer LIN

RUN echo 'First Docker file'

RUN apt-get update && \
    apt-get install --yes nginx && \
    rm -rf /var/lib/apt/lists/*

RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80 443

ADD dev.conf /etc/ngnix/conf.d/

ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]
