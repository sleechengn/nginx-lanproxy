FROM nginx:latest
RUN rm -rf /etc/nginx/conf.d/*
ADD ./default.conf /etc/nginx/conf.d
