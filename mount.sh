#!/bin/sh

if [ -z "$1" ]; then
  exit 0
fi

mkdir "/media/$1"
s3fs "$1" "/media/$1" \
-o use_path_request_style,ro \
-o url=${S3_URL}
