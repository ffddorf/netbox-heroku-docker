#!/bin/bash

# Generate static openapi spec
python manage.py spectacular --file static/openapi.json

# Collect static files
python manage.py collectstatic --noinput

/opt/netbox/launch-netbox.sh
