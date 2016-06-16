#!/bin/bash

# Exit on first error
set -e

# Handle environment variables
#LOG_LEVEL=${LOG_LEVEL:-"error"}

# Environment setup

# check for directories and files

if [ ! -f /config/config.ini ]; then
  touch /config/config.ini
  echo "[General]" >> /config/config.ini
  echo "http_host = 0.0.0.0" >> /config/config.ini
  chown headphones:nogroup /config/config.ini
fi

# terminate on fail with exec
exec /usr/bin/supervisord
