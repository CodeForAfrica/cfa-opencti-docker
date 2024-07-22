FROM nginx:1.26.0-bookworm

RUN rm /etc/nginx/conf.d/default.conf
COPY templates/nginx.conf.template /etc/nginx/templates
