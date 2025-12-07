#!/bin/bash
set -e

IMAGE_NAME="jupyter"
IMAGE_TAG="latest"
REGISTRY="ghcr.io"
USER_NAME="${GITHUB_USER}"

if [ -z "$USER_NAME" ]; then
  echo "❌ ERROR: GITHUB_USER not set"
  echo "   export GITHUB_USER=your-github-username"
  exit 1
fi

FULL_IMAGE="$REGISTRY/$USER_NAME/$IMAGE_NAME:$IMAGE_TAG"

echo "🚀 Building Jupyter image: $FULL_IMAGE"

docker build \
  -t "$IMAGE_NAME:$IMAGE_TAG" \
  -f docker/jupyter/Dockerfile .

echo "🏷️ Tagging..."
docker tag "$IMAGE_NAME:$IMAGE_TAG" "$FULL_IMAGE"

echo "📤 Pushing to GHCR..."
docker push "$FULL_IMAGE"

echo "✅ Done: $FULL_IMAGE"
