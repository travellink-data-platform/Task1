#!/bin/bash
set -e
echo "Deploy airflow"
helm upgrade --install airflow apache-airflow/airflow \
  --namespace airflow \
  -f ../chart/airflow/values.yaml 

echo "🚀 Deploying JupyterHub..."
helm upgrade --install jhub jupyterhub/jupyterhub \
  --namespace jhub \
  --create-namespace \
  -f ../chart/jupyter/values.yaml

echo "🎉 Done!"
