#!/bin/bash
 
#SBATCH --cpus-per-task=3
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --partition=gpuhgx
#SBATCH --gres=gpu:1
#SBATCH --time=167:00:00
 
#SBATCH --job-name=evotuning-test
#SBATCH --output=output.dat
#SBATCH --mail-type=ALL
#SBATCH --mail-user=j_albr16@uni-muenster.de
 
# load modules with available GPU support (this is an example, modify to your needs!)
ml palma/2022a
ml foss/2022a
ml CUDA/11.7.0
ml GCCore/11.3.0
ml Python/3.10.4

# set up your environment (this is an example, modify to your needs!)
PROJECT_DIR=/home/j/j_albr16/low-n-fitness-model
DATA_DIR=/scratch/tmp/j_albr16/low-n/run1
RUN1_DIR=/scratch/tmp/j_albr16/low-n/run1

# requirements
python3 -m venv $PROJECT_DIR/venv
. $PROJECT_DIR/venv/bin/activate
pip install -r $PROJECT_DIR/requirements.txt

# run your application
cd $PROJECT_DIR/evotuning
python3 train.py  --data $RUN1_DIR/evotune.csv \
                    --batch_size 2 \
                    --output_dir $RUN1_DIR \
		    --model $RUN1_DIR/checkpoint-94491 \
                    --epochs 15 \
                    --target_fasta target.fasta \
                    --take 1.0 \
                    --eval epoch
    
