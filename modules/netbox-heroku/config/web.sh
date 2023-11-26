#!/bin/bash

set -e -o pipefail

# Generate static openapi spec
python manage.py spectacular --file static/openapi.json

# Collect static files
python manage.py collectstatic --noinput

# Patch nginx unit config to use Heroku port
jq '. + { listeners: { "*:\(env.PORT)": { pass: "routes/main" } } }' \
  < /etc/unit/nginx-unit.json \
  > /etc/unit/nginx-unit-heroku.json
export UNIT_CONFIG=/etc/unit/nginx-unit-heroku.json

/opt/netbox/launch-netbox.sh
