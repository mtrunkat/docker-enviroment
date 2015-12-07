#!/bin/bash
docker run -d -p 6379:6379 -P -v `pwd`/../../volumes/redis:/data --name redis mtrunkat/redis