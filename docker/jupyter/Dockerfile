FROM jupyter/base-notebook:python-3.10

USER root

COPY requirements/jupyter.txt /tmp/requirements.txt

# Install build deps only if required by packages
RUN pip install --no-cache-dir --user -r /tmp/requirements.txt && \
    rm -f /tmp/requirements.txt

USER $NB_UID
