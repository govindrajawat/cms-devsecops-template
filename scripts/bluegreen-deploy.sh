#!/bin/bash
set -e
# Example blue/green deployment script for Docker Compose
# You can adapt this for Kubernetes as needed

ACTIVE=$(docker ps --filter "name=api-blue" --format '{{.Names}}')
if [ -z "$ACTIVE" ]; then
  COLOR=blue
  OLD_COLOR=green
else
  COLOR=green
  OLD_COLOR=blue
fi

echo "Deploying $COLOR stack..."
docker-compose -f docker-compose.yml -f docker-compose.$COLOR.yml up -d --build

echo "Switching traffic to $COLOR..."
# (In real use, update NGINX config or load balancer to point to new stack)

if docker ps --filter "name=api-$OLD_COLOR" --format '{{.Names}}' | grep -q .; then
  echo "Stopping old $OLD_COLOR stack..."
  docker-compose -f docker-compose.yml -f docker-compose.$OLD_COLOR.yml down
fi

echo "Blue/Green deployment complete." 