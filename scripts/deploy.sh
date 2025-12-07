#!/bin/bash
set -e

NAMESPACE_AIRFLOW="airflow"
NAMESPACE_JUPYTER="jhub"

echo "🚀 Deploying Airflow..."
helm repo add apache-airflow https://airflow.apache.org
helm repo update apache-airflow

helm upgrade --install airflow apache-airflow/airflow \
  -n "$NAMESPACE_AIRFLOW" \
  --create-namespace \
  -f chart/airflow/values.yaml

echo "🚀 Deploying JupyterHub..."
helm repo add jupyterhub https://jupyterhub.github.io/helm-chart/
helm repo update jupyterhub

helm upgrade --install jhub jupyterhub/jupyterhub \
  -n "$NAMESPACE_JUPYTER" \
  --create-namespace \
  -f chart/jupyter/values.yaml

echo "✅ Deploy complete."
