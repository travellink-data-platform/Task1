FROM apache/airflow:2.9.3-python3.10

USER airflow

COPY requirements/airflow.txt /opt/requirements.txt

RUN pip install --no-cache-dir -r /opt/requirements.txt
