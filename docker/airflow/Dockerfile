FROM apache/airflow:3.0.2

# install system deps (if needed)
USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
    tzdata && \
    rm -rf /var/lib/apt/lists/*

COPY requirements/airflow.txt /requirements.txt

# switch user
USER airflow

# install python libs as airflow user with constraint
RUN pip install --no-cache-dir -r /requirements.txt

# (optional) copy dags
# COPY dags/ /opt/airflow/dags/
