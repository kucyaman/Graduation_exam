#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

bundle install
bundle exec rake assets:clean
bundle exec rake assets:precompile
DISABLE_DATABASE_ENVIRONMENT_CHECK=1 rake db:migrate:reset
# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"