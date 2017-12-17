#!/bin/bash

docker run -it -e ENABLE_KRB='true' -v /usr/local/repository:/usr/lib/repository --name maven -h maven.cloud.com --net cloud.com  sumit/maven:latest -d
