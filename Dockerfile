FROM debian:12-slim
RUN apt-get update \
 && apt-get install --assume-yes --no-install-recommends \
    apache2 \
 && apt-get clean \
 && rm --recursive /var/lib/apt/lists/*
COPY ./public /var/www/html/
CMD ["/usr/sbin/apache2ctl","-DFOREGROUND"]
EXPOSE 80/tcp
