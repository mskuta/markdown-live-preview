FROM node:bookworm-slim AS build
RUN apt-get update \
 && apt-get install --assume-yes --no-install-recommends \
    make \
 && apt-get clean \
 && rm --recursive /var/lib/apt/lists/*
WORKDIR /usr/local/src/markdown-live-preview
COPY . .
RUN make setup; make build

FROM debian:bookworm-slim
RUN apt-get update \
 && apt-get install --assume-yes --no-install-recommends \
    apache2 \
 && apt-get clean \
 && rm --recursive /var/lib/apt/lists/*
COPY --from=build /usr/local/src/markdown-live-preview/dist/ /var/www/html/
CMD ["/usr/sbin/apache2ctl","-DFOREGROUND"]
EXPOSE 80/tcp

