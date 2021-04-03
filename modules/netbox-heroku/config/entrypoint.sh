#!/bin/bash

# Stop when an error occures
set -e

# Allows NetBox to be run as non-root users
#umask 002

# Load correct Python3 env
# shellcheck disable=SC1091
source /opt/netbox/venv/bin/activate

# Launch whatever is passed by docker
# (i.e. the RUN instruction in the Dockerfile)
#
# shellcheck disable=SC2068
exec $@
