#!/bin/bash
docker exec docker_mongodb_1 sh -c 'exec mongodump --host 127.0.0.1 --port 27017 --db db_name  --authenticationDatabase admin --username root --password rootpass  --gzip --archive' > /backup/dump_`date "+%Y-%m-%d"`.gz

s3cmd put /backup/dump_`date "+%Y-%m-%d"`.gz s3://youbucket/mongodb/
rm -rf /backup/dump_`date "+%Y-%m-%d"`.gz