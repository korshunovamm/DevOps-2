#!/bin/bash

# Set Up Docker Environment
eval $(minikube docker-env)

# Build Docker images
docker build -t app:latest -f Dockerfile.app .
docker build -t fetcher:latest -f Dockerfile.fetcher .

kubectl create -f app-deployment.yaml
kubectl create -f fetcher-deployment.yaml
