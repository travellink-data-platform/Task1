#!/bin/bash

helm upgrade --install airflow apache-airflow/airflow \
  --namespace airflow \
  -f charts/airflow/values.yaml

helm upgrade --install jhub jupyterhub/jupyterhub \
  --namespace jhub \
  -f charts/jupyter/values.yaml
