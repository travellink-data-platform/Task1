# docker/jupyter/Dockerfile
# Jupyter image สำหรับ data scientist

FROM jupyter/base-notebook:latest

USER root

# ติดตั้ง system libs ที่จำเป็นถ้ามี
RUN apt-get update && apt-get install -y --no-install-recommends \
    tzdata && \
    rm -rf /var/lib/apt/lists/*

# copy requirements ของ jupyter
COPY requirements/jupyter.txt /requirements.txt

RUN pip install --no-cache-dir -r /requirements.txt

USER ${NB_USER}
