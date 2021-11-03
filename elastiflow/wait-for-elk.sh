#!/bin/bash
set -e
echo "Initiating..."
until curl --output /dev/null --silent --head --fail "$ELK_URL"; do
  >&2 echo "ELK ainda esta - aguardando 5s"
  sleep 5
done
>&2 echo "ELK esta up!"
/usr/local/bin/flowcoll