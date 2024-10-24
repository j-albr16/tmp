#!/bin/bash
 
#SBATCH --cpus-per-task=3
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --partition=gpua100
#SBATCH --gres=gpu:4
#SBATCH --time=160:00:00
 
#SBATCH --job-name=gfp-evotuning-smal
#SBATCH --output=gfp.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=j_albr16@uni-muenster.de

# load modules with available GPU support (this is an example, modify to your needs!)
ml palma/2022a
ml foss/2022a
ml CUDA/11.7.0
ml GCCcore/11.3.0
ml Python/3.10.4

export LOWN_PROJECTS_PATH=/scratch/tmp/j_albr16/low-n
export LOWN_CURRENT_PROJECT=gfp

PROJECT_DIR=/home/j/j_albr16/low-n-fitness-model

# install requirements
python3 -m venv $PROJECT_DIR/venv
. $PROJECT_DIR/venv/bin/activate
pip install -r $PROJECT_DIR/requirements.txt

# upgrade pip
pip install --upgrade pip

# run the application
cd $PROJECT_DIR

python3 app.py evotune --model "facebook/esm2_t30_150M_UR50D" --epochs 60 --batch-size 128 --tokenizer "facebook/esm2_t33_650M_UR50D" --save-total-limit 30 --lora --take 1.0 --run small 
                        


 
