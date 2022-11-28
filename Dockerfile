FROM nginx:1.23-alpine

RUN apk add --no-cache gomplate tini && \
  rm /etc/nginx/conf.d/default.conf

COPY conf/nginx.conf /etc/nginx/
COPY includes /etc/nginx/includes
COPY entrypoint.sh /usr/bin/entrypoint.sh
COPY fragments /etc/nginx/fragments

RUN rm docker-entrypoint.sh && \
  rm -Rf docker-entrypoint.d && \
  mkdir /etc/nginx/sites-enabled

ENTRYPOINT ["/sbin/tini", "--", "/usr/bin/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
