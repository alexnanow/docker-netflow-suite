#!/bin/bash
set -e
echo "Initiating..."
until curl --output /dev/null --silent --head --fail "$ELK_URL"; do
  >&2 echo "ELK is unavailable - sleeping"
  sleep 5
done
>&2 echo "ELK is up"
source /usr/local/bin/flowcoll
