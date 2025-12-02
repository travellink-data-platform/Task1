#!/bin/bash

# Stop on errors
set -e

# Variables
IMAGE_NAME="airflow"
IMAGE_TAG="latest"
REGISTRY="asia.gcr.io"
PROJECT_ID="$GCP_PROJECT"   # export GCP_PROJECT ก่อนใช้

FULL_IMAGE="$REGISTRY/$PROJECT_ID/$IMAGE_NAME:$IMAGE_TAG"

echo "🚀 Building Airflow image..."
docker build -t $IMAGE_NAME:$IMAGE_TAG -f docker/airflow/Dockerfile .

echo "🏷️ Tagging image as: $FULL_IMAGE"
docker tag $IMAGE_NAME:$IMAGE_TAG $FULL_IMAGE

echo "📤 Pushing image to registry..."
docker push $FULL_IMAGE

echo "✅ Done: $FULL_IMAGE"
