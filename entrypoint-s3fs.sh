#!/bin/sh
set -e

if [ ! -r /dev/fuse ]; then
  echo "use '--privileged', please" > /dev/stderr
  exit 1
fi

if [ -z "$S3_URL" ]; then
  echo "undefined 'S3_URL'." > /dev/stderr
  exit 1
fi
if [ -z "$S3_USER" ]; then
  echo "undefined 'S3_USER'." > /dev/stderr
  exit 1
fi
if [ -z "$S3_PASSWORD" ]; then
  echo "undefined 'S3_PASSWORD'." > /dev/stderr
  exit 1
fi
if [ -z "$S3_BUCKETS" ]; then
  echo "undefined 'S3_BUCKETS'." > /dev/stderr
  exit 1
fi

echo "${S3_USER}:${S3_PASSWORD}" > /etc/passwd-s3fs && chmod 600 /etc/passwd-s3fs
echo $S3_BUCKETS | sed 's+,+\n+g' | xargs -i mount.sh {}
