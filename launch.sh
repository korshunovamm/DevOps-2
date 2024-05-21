#!/bin/bash

git clone https://github.com/prometheus-operator/kube-prometheus.git
kubectl apply --server-side -f kube-prometheus/manifests/setup
kubectl apply -f kube-prometheus/manifests/

curl -L https://istio.io/downloadIstio | sh -
export PATH="$PATH:$PWD/istio-1.21.2/bin"
istioctl install -y --set profile=demo --set meshConfig.outboundTrafficPolicy.mode=REGISTRY_ONLY
kubectl label namespace default istio-injection=enabled

kubectl create -f deployments/app-deployment.yaml
kubectl create -f deployments/fetcher-deployment.yaml
kubectl create -f deployments/cronjob.yaml
kubectl create -f deployments/gateway.yaml
kubectl create -f deployments/virtual-service.yaml
kubectl create -f deployments/service-entry.yaml
kubectl create -f deployments/exporter-deployment.yaml
kubectl create -f deployments//exporter-service.yaml
kubectl create -f deployments//exporter-servicemonitor.yaml

