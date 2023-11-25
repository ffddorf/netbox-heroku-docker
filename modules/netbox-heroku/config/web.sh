#!/bin/bash

# Gather openapi spec
python manage.py generateschema static/openapi.json

# Collect static files
python manage.py collectstatic --noinput

/opt/netbox/launch-netbox.sh
