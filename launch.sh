#!/bin/bash

kubectl create -f deployments/app-deployment.yaml
kubectl create -f deployments/cronjob.yaml


