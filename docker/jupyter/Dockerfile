# Base image
FROM jupyter/base-notebook:python-3.10

USER root

# Install git
RUN apt-get update && apt-get install -y --no-install-recommends git && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Clone repo
RUN git clone https://github.com/travellink-data-platform/Task1.git /opt/task1

# Install dependencies
RUN pip install --no-cache-dir -r /opt/task1/requirements/jupyter.txt

USER $NB_UID
