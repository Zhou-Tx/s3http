#!/bin/sh

if [ -z "$1" ]; then
  exit 0
fi

mkdir -p "/data/$1"
s3fs "$1" "/data/$1" \
-o use_path_request_style \
-o url=${S3_URL} \
-o umask=377
