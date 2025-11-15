#!usr/bin/env bash
set -euo pipefail
docker rm -f registry jenkins||true
docker volume rm jenkins_data||true
echo "Teardown complete."

chmod +x scripts/*.sh