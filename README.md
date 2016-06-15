# docker-sickrage

[![Build Status](https://travis-ci.org/b225ccc/docker-sickrage.svg?branch=master)](https://travis-ci.org/b225ccc/docker-sickrage)


Running:

~~~ sh
docker run \
  --name sickrage \
  -v /etc/localtime:/etc/localtime:ro \
  -v /data/services/sickrage/config:/config \
  -v /data/services/sickrage/downloads:/downloads \ 
  -v /data/tv:/tv \
  -p 8081:8081 \
  b225ccc/docker-sickrage:latest
~~~
# docker-headphones
