#!/bin/bash
set -e

IMAGE_NAME="airflow"
IMAGE_TAG="latest"
REGISTRY="ghcr.io"
USER_NAME="${GITHUB_USER}"

if [ -z "$USER_NAME" ]; then
    echo "❌ ERROR: GITHUB_USER not set"
    echo "set with: export GITHUB_USER=your-name"
    exit 1
fi

FULL_IMAGE="$REGISTRY/$USER_NAME/$IMAGE_NAME:$IMAGE_TAG"

echo "🚀  Building Airflow image..."
docker build -t "$IMAGE_NAME:$IMAGE_TAG" -f docker/airflow/Dockerfile .

echo "🏷️  Tagging image: $FULL_IMAGE"
docker tag "$IMAGE_NAME:$IMAGE_TAG" "$FULL_IMAGE"

echo "📤  Pushing image to GHCR..."
docker push "$FULL_IMAGE"

echo "✅  Done: $FULL_IMAGE"
