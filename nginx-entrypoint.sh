#!/bin/bash

set -e

PROXY_CONF=/etc/nginx/conf.d/default.conf

if [ "$1" = "nginx" ]; then
  # Replace position holders in default.conf
  sed -i "s#{{SERVER_NAME}}#${SERVER_NAME}#g" ${PROXY_CONF}
  sed -i "s#{{CLIENT_MAX_BODY_SIZE}}#${CLIENT_MAX_BODY_SIZE}#g" ${PROXY_CONF}
  sed -i "s#{{LAM_HOST}}#${LAM_HOST}#g" ${PROXY_CONF}
  sed -i "s#{{SSP_HOST}}#${SSP_HOST}#g" ${PROXY_CONF}
fi

exec "$@"
