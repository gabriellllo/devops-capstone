#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=gabriellllo/demoudacity

# Step 2
# Run the Docker Hub container with kubernetes
# docker pull $dockerpath:v1
kubectl run --image=$dockerpath:v1  demoudacity --port=80

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward deployment/demoudacity 8000:80
