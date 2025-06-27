#!/bin/sh

if [ "$NODE_ENV" = "development" ]; then
    npm install --no-optional --verbose
fi

exec "$@"