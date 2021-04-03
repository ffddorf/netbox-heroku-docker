#!/bin/sh

# Stop when an error occurs
set -e

exec /opt/netbox/venv/bin/python /opt/netbox/netbox/manage.py migrate
