#!/bin/bash
set -e
IMAGES=("nginx:alpine" "mcr.microsoft.com/dotnet/aspnet:6.0" "cubejs/cube:latest" "redis:alpine")
for IMAGE in "${IMAGES[@]}"; do
  echo "Scanning $IMAGE"
  trivy image --exit-code 1 --severity HIGH,CRITICAL $IMAGE
done 