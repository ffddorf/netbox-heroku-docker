#!/bin/bash

# This script exists because of:
# https://github.com/heroku/terraform-provider-heroku/issues/272

TAR=tar
# Use gnu tar on macOS
if command -v gtar &> /dev/null; then
  TAR=gtar
fi

# ensure the hash of the archive does not change
# when made from the same contents
export GZIP=--no-name
$TAR --gzip --create \
  --sort=name --owner=root:0 --group=root:0 --mtime='UTC 2019-01-01' \
  --file=modules/netbox-heroku/config.tar.gz \
  --directory=modules/netbox-heroku/config "."
