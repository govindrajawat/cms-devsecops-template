#!/bin/bash
echo "Running Trivy vulnerability scanner..."

for image in $(docker-compose config | awk '{if ($1 == "image:") print $2}'); do
    echo "Scanning $image"
    trivy image --exit-code 1 --severity CRITICAL $image
    if [ $? -ne 0 ]; then
        echo "Critical vulnerabilities found in $image"
        exit 1
    fi
done

echo "Trivy scan completed successfully"