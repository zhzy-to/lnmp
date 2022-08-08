# nginx 示例文件
FROM nginx:1.21.3-alpine

ADD conf.d/vhost.conf /etc/nginx/conf.d/default.conf