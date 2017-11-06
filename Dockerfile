From node:9
COPY ./web1.js /var/www/web1.js
WORKDIR /var/www
CMD ["/usr/local/bin/node", "web1.js"]
