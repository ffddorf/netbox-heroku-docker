#!/bin/bash

# Stop when an error occurs
set -e

source /opt/netbox/venv/bin/activate

echo "⚙️ Applying database migrations"
./manage.py migrate --no-input
echo "⚙️ Running trace_paths"
./manage.py trace_paths --no-input
echo "⚙️ Removing stale content types"
./manage.py remove_stale_contenttypes --no-input
echo "⚙️ Removing expired user sessions"
./manage.py clearsessions
echo "⚙️ Building search index (lazy)"
./manage.py reindex --lazy
