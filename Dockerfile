FROM nvcr.io/nvidia/cuda:11.7.0-cudnn8-devel-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive

# Install dependencies
COPY apt_install.txt .
RUN apt-get update && apt-get install -y --no-install-recommends `cat apt_install.txt` && rm -rf /var/lib/apt/lists/*

# Config pip
RUN ln -sf /usr/bin/python3 /usr/bin/python

# Upgrade pip, install py libs
RUN pip3 install --upgrade pip

# Python packages
COPY requirements.txt .
RUN pip3 install -r requirements.txt --upgrade

# Additional install