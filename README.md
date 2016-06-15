# docker-headphones

[![Build Status](https://travis-ci.org/b225ccc/docker-headphones.svg?branch=master)](https://travis-ci.org/b225ccc/docker-headphones)


Running:

~~~ sh
docker run \
  --name headphones \
  -v /etc/localtime:/etc/localtime:ro \
  -v /data/services/headphones/config:/config \
  -v /data/services/headphones/downloads:/downloads \ 
  -v /data/music:/music \
  -p 8181:8181 \
  b225ccc/docker-headphones:latest
~~~
