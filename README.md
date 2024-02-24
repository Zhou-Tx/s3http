# S3HTTP

Transfer S3 service to http service.

## Core middleware

- s3fs-fuse

```bash
# apk add -U s3fs-fuse
s3fs ${bucket_name} ${local_path} \
-o use_path_request_style \
-o url=${url} \
-o umask=377
```

## Getting Started

Start with command (*Example*):

```bash
docker run -d \
  --restart=always \
  --name=s3http \
  --privileged \
  -p '8000:80' \
  -e 'S3_URL=http://192.168.1.1:9000' \
  -e 'S3_USER=admin' \
  -e 'S3_PASSWORD=admin' \
  -e 'S3_BUCKETS=bucket1,bucket2' \
  repigeons/s3http
```

### Environment variables

|variable   |type  |required|description|example|
|:---------:|:----:|:------:|:---------:|:-----:|
|S3_URL     |string|true    |s3 url address.|http://127.0.0.1:9000|
|S3_USER    |string|true    |a user having access to the buckets.|admin|
|S3_PASSWORD|string|true    |the password of the user.||
|S3_BUCKETS |string|true    |buckets name list ( split with ',' ) |bucket1,bucket2|
