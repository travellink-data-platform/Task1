#!/bin/bash
set -e

IMAGE_NAME="airflow"
IMAGE_TAG="latest"
REGISTRY="ghcr.io"

# ต้อง set env นี้ไว้ก่อน เช่น export GITHUB_USER=nutthapongkanna
USER_NAME="${GITHUB_USER}"

if [ -z "$USER_NAME" ]; then
  echo "❌ ERROR: GITHUB_USER not set"
  echo "   export GITHUB_USER=your-github-username"
  exit 1
fi

FULL_IMAGE="$REGISTRY/$USER_NAME/$IMAGE_NAME:$IMAGE_TAG"

echo "🚀 Building Airflow image: $FULL_IMAGE"

docker build \
  -t "$IMAGE_NAME:$IMAGE_TAG" \
  -f docker/airflow/Dockerfile .

echo "🏷️ Tagging..."
docker tag "$IMAGE_NAME:$IMAGE_TAG" "$FULL_IMAGE"

echo "📤 Pushing to GHCR..."
docker push "$FULL_IMAGE"

echo "✅ Done: $FULL_IMAGE"
