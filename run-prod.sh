#!/bin/bash

if [ -z "$PORT" ]; then
  export PORT=80;
fi

echo "nginx listening on the port: $PORT";

envsubst '${PORT}' </opt/app/nginx/sites-available/default.tpl.conf >/etc/nginx/sites-available/default.conf

sh /start.sh
