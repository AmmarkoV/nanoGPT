#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"

python3 -m venv venv
source venv/bin/activate
python3 -m pip install --upgrade pip 
python3 -m pip install torch torchvision numpy --extra-index-url https://download.pytorch.org/whl/cu116
python3 -m pip install transformers datasets tiktoken wandb tqdm


cd data/openwebtext
python3 prepare.py


python train.py
