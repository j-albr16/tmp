#!/bin/bash
 
#SBATCH --cpus-per-task=3
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --partition=gpuexpress
#SBATCH --gres=gpu:2
#SBATCH --time=1:00:00
 
#SBATCH --job-name=evotuning-test
#SBATCH --output=test.dat
#SBATCH --mail-type=ALL
#SBATCH --mail-user=j_albr16@uni-muenster.de

# load modules with available GPU support (this is an example, modify to your needs!)
ml palma/2022a
ml foss/2022a
ml CUDA/11.7.0
ml GCCcore/11.3.0
ml Python/3.10.4

export LOWN_PROJECTS_PATH=/scratch/tmp/j_albr16/low-n
export LOWN_CURRENT_PROJECT=pas

PROJECT_DIR=/home/j/j_albr16/low-n-fitness-model

# install requirements
python3 -m venv $PROJECT_DIR/venv
. $PROJECT_DIR/venv/bin/activate
pip install -r $PROJECT_DIR/requirements.txt

# upgrade pip
pip install --upgrade pip

# run the application
cd $PROJECT_DIR

echo "No LORA"

# memory check without lora
python3 app.py evotune --model facebook/esm2_t6_8M_UR50D --epochs 2 --batch-size 2 --tokenizer facebook/esm2_t6_8M_UR50D --take 0.01 
python3 app.py evotune --model facebook/esm2_t6_8M_UR50D --epochs 2 --batch-size 4 --tokenizer facebook/esm2_t6_8M_UR50D --take 0.01 
python3 app.py evotune --model facebook/esm2_t6_8M_UR50D --epochs 2 --batch-size 8 --tokenizer facebook/esm2_t6_8M_UR50D --take 0.01 

echo "With LORA"

# memory check with lora
python3 app.py evotune --model facebook/esm2_t6_8M_UR50D --epochs 2 --batch-size 2 --tokenizer facebook/esm2_t6_8M_UR50D --take 0.01  --lora
python3 app.py evotune --model facebook/esm2_t6_8M_UR50D --epochs 2 --batch-size 4 --tokenizer facebook/esm2_t6_8M_UR50D --take 0.01  --lora
python3 app.py evotune --model facebook/esm2_t6_8M_UR50D --epochs 2 --batch-size 8 --tokenizer facebook/esm2_t6_8M_UR50D --take 0.01  --lora
                
                
