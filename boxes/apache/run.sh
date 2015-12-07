#!/bin/bash
docker run -d -p 80:80 -P -v $HOME/Workspace/www:/var/www --name apache mtrunkat/apache