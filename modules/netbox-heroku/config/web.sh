#!/bin/bash

set -e -o pipefail

# Generate static openapi spec
python manage.py spectacular --file static/openapi.json

# Collect static files
python manage.py collectstatic --noinput

/opt/netbox/launch-netbox.sh
