# Filename: Dockerfile

# Start from the stable scipy-notebook image
FROM jupyter/scipy-notebook:latest

# Switch to root to install system-wide packages
USER root

# Install PyTorch
RUN pip install --no-cache-dir torch

# Copy and install packages from requirements.txt
COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# Switch back to the non-privileged 'jovyan' user
USER jovyan