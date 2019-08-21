#!/usr/bin/env bash

sudo yum install -y git wget
sudo yum update -y
sudo yum clean all
git clone https://github.com/dbarajassolano/u18fest.git

# Miniconda
mkdir -p ~/.conda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
bash ~/miniconda.sh -b -p $HOME/miniconda

# Set up the environment
source ~/miniconda/bin/activate root
conda create -n u18fest_env numpy=1.15.* gxx_linux-64
conda activate u18fest_env
conda install pymc3 jupyter

# Configure Jupyter
jupyter notebook --generate-config
echo "c.NotebookApp.token = ''" >> ~/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.password = ''" >> ~/.jupyter/jupyter_notebook_config.py

# Wrap up
conda deactivate
sync