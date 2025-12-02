# ใช้ base image ทางการของ Airflow
FROM apache/airflow:2.9.3-python3.10

USER root

# Install git (ต้องใช้ clone repo)
RUN apt-get update && apt-get install -y --no-install-recommends git && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Clone repo (ใช้ token หรือ public repo)
RUN git clone https://github.com/travellink-data-platform/Task1.gi /opt/task1

# Install dependencies from requirements
RUN pip install --no-cache-dir -r /opt/task1/requirements/airflow.txt

# Change back to airflow user
USER airflow
