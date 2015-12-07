#!/bin/bash
docker run -d -p 3306:3306 -P -v `pwd`/../../volumes/mysql:/var/lib/mysql --name mysql mtrunkat/mysql