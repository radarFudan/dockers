# FROM nvcr.io/nvidia/cuda:11.4.0-cudnn8-devel-ubuntu20.04
FROM nvidia/cuda:11.7.1-cudnn8-devel-ubuntu20.04
# FROM nvcr.io/nvidia/cuda:11.8.0-cudnn8-devel-ubuntu20.04
# FROM nvcr.io/nvidia/cuda:12.0.1-cudnn8-devel-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive

# Install dependencies
COPY apt_install.txt .
RUN apt-get update && apt-get install -y --no-install-recommends `cat apt_install.txt` && rm -rf /var/lib/apt/lists/*

# Config pip
RUN ln -sf /usr/bin/python3.9 /usr/bin/python3
RUN ln -sf /usr/bin/python3 /usr/bin/python

# Upgrade pip, install py libs
RUN pip3 install --upgrade pip

# Python packages
COPY requirements.txt .
RUN pip3 install -r requirements.txt --upgrade

# Additional install
COPY requirements_S5.txt .
RUN pip3 install -r requirements_S5.txt --upgrade

# JAX
RUN pip install --upgrade "jax[cuda11_local]" -f https://storage.googleapis.com/jax-releases/jax_cuda_releases.html

# cudnn from 8.5 to 8.9
RUN pip install nvidia-cudnn-cu11==8.9.2.26 wandb tensorflow==2.12.0 datasets

# Job script
COPY run_S5.sh .
