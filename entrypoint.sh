#!/usr/bin/env ash

set -e

export TEMPLATES_DIR=${TEMPLATES_DIR:-/etc/templates}

if [ ! -d "$TEMPLATES_DIR" ]; then
  echo "Templates directory $TEMPLATES_DIR does not exist"
  exit 1
fi

gomplate \
    -t acme-challenge=/etc/fragments/acme-challenge.t \
    -t acme-certificate=/etc/fragments/acme-certificate.t \
    -t ssl-listen=/etc/fragments/ssl-listen.t \
    --input-dir "${TEMPLATES_DIR}" \
    --output-map='/etc/nginx/sites-enabled/{{ .in | strings.ReplaceAll ".conf.tmpl" ".conf" }}'

echo "Starting nginx ..."
exec "$@"
