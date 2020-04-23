#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=idreeskun/project-ml-svc

# Step 2
# Run the Docker Hub container with kubernetes
# kubectl run --image=$dockerpath udacity-pro-ml --port=80
kubectl run udacity-ml-svc --generator=run-pod/v1  --image=$dockerpath --port=80 --labels app=udacity-ml-svc


# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward udacity-ml-svc 80:80


