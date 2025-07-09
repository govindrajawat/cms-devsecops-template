#!/bin/bash
set -e
kubectl delete -k k8s/ || true
kubectl delete configmap nginx-config nginx-proxy nginx-mime || true
kubectl delete secret nginx-ssl || true
echo "Kubernetes resources and configs cleaned up."