#!/bin/bash

if [ ! -f /config/config.ini ]; then
  touch /config/config.ini
  echo "[General]" >> /config/config.ini
  echo "http_host = 0.0.0.0" >> /config/config.ini
fi

exit 0
