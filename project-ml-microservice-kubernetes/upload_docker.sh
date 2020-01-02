#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath=geepee2017/cheers2019

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
docker tag myproject geepee2017/cheers2019:project4
# Step 3:
# Push image to a docker repository
docker push geepee2017/cheers2019:project4
