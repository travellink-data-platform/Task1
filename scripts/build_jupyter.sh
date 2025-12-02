#!/bin/bash
set -e

IMAGE_NAME="airflow"
IMAGE_TAG="latest"

GITHUB_USER="nutthapongkanna"
REGISTRY="ghcr.io"
FULL_IMAGE="$REGISTRY/$GITHUB_USER/$IMAGE_NAME:$IMAGE_TAG"

echo "🚀 Building Airflow image..."
docker build -t $IMAGE_NAME:$IMAGE_TAG -f docker/airflow/Dockerfile .

echo "🏷️ Tagging image as: $FULL_IMAGE"
docker tag $IMAGE_NAME:$IMAGE_TAG $FULL_IMAGE

echo "📤 Pushing image to GHCR..."
docker push $FULL_IMAGE

echo "✅ Done: $FULL_IMAGE"
