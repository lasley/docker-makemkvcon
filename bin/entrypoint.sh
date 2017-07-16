#!/bin/bash
# Thanks Camptocamp for the idea!
# http://www.camptocamp.com/en/actualite/flexible-docker-entrypoints-scripts/
set -e

dir=/entrypoint.d
if [ -d $dir ]; then
    run-parts --exit-on-error $dir
fi

if [ -n "$1" ]; then
    set -x
    exec "$@"
fi
