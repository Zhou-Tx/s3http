FROM nginx:alpine

RUN apk add -U s3fs-fuse && sed -i 's@user  nginx@user  root@g' /etc/nginx/nginx.conf

COPY default.conf       /etc/nginx/conf.d/
COPY mount.sh           /sbin/
COPY entrypoint-s3fs.sh /docker-entrypoint.d/
