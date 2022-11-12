FROM debian:11-slim
RUN apt-get update && \
    apt-get --yes install --no-install-recommends apache2 && \
    apt-get clean
COPY ./public /var/www/html/
CMD ["/usr/sbin/apache2ctl","-DFOREGROUND"]
EXPOSE 80/tcp
