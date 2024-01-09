#!/bin/bash
set -e

# Railsサーバーが起動する前にDBが存在するか確認し、なければ作成
rails db:create || true

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"