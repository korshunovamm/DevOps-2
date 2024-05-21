#!/bin/bash

kubectl create -f app-deployment.yaml
kubectl create -f fetcher-deployment.yaml
kubectl create -f cronjob.yaml


