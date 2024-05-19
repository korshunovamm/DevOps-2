#!/bin/bash

# Set Up Docker Environment
eval $(minikube docker-env)

# Build Docker images
docker build -t app:latest -f Dockerfile.app .
docker build -t fetcher:latest -f Dockerfile.fetcher .

kubectl create -f app-deployment.yaml
kubectl create -f fetcher-deployment.yaml

minikube tunnel

# Load Docker images into Kubernetes
#minikube image load fetcher:latest --image-pull-policy=Never
#minikube image load app:latest --image-pull-policy=Never
#
## Apply Kubernetes manifests
#kubectl apply -f app-deployment.yaml
#kubectl apply -f fetcher-deployment.yaml
