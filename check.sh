#!/usr/bin/env bash

set -e

echo "===== StandardRB Linter ====="
bundle exec standardrb
echo "===== Fasterer Linter ====="
bundle exec fasterer
echo "===== RSpec tests ====="
bundle exec rspec -fd