FROM nginx:alpine-slim

RUN apk add -U s3fs-fuse

COPY default.conf   /etc/nginx/conf.d/
COPY mount.sh       /sbin/
COPY mount-s3fs.sh  /docker-entrypoint.d/
