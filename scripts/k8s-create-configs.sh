#!/bin/bash
set -e
kubectl create configmap nginx-config --from-file=nginx/nginx.conf --dry-run=client -o yaml | kubectl apply -f -
kubectl create configmap nginx-proxy --from-file=nginx/proxy.conf --dry-run=client -o yaml | kubectl apply -f -
kubectl create configmap nginx-mime --from-file=nginx/mime.types --dry-run=client -o yaml | kubectl apply -f -
kubectl create secret generic nginx-ssl --from-file=nginx/ssl/ --dry-run=client -o yaml | kubectl apply -f -
echo "Kubernetes ConfigMaps and Secret created/updated."