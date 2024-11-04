#!/bin/bash

set -ex

python3.10 -m venv /opt/venv/tutorials
source /opt/venv/tutorials/bin/activate
pip install --upgrade pip
pip install -r ./requirements.txt
