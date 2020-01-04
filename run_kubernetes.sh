#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=geepee2017/cheers2019


# Step 2
# Run the Docker Hub container with kubernetes
#kubectl apply -f ./deployment.yml
kubectl create deployment my-kubeproj-app --image=geepee2017/cheers2019:project4
# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl expose deployment my-kubeproj-app --type="NodePort" --port=8000 --target-port=5001
