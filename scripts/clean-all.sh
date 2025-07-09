#!/bin/bash
set -e
docker-compose down -v --remove-orphans
docker system prune -af
rm -rf nginx/ssl/selfsigned.*
echo "Local Docker and SSL cleaned up."