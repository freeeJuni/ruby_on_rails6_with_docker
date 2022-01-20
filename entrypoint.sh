#!/bin/bash
set -e

rm -f /Users/lee-uijun/Development/Docker/ruby_on_rails6/myapp/tmp/pids/server.pid

exec "$@"
