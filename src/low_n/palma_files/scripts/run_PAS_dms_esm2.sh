#!/bin/bash
#SBATCH --partition=long
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=100G
#SBATCH --time=30:00:00

module load palma/2021a
module load GCC
module load OpenMPI
module load PyTorch
module load tqdm
module load CUDA

python scripts/esm_zero-shot.py \
	--model-location /scratch/tmp/ebeurer/esm/esm_weights/esm2_t48_15B_UR50D.pt \
	--sequence /scratch/tmp/ebeurer/esm/input_files/PAS_WT.txt \
	--dms-input /scratch/tmp/ebeurer/esm/input_files/PAS_dms.csv \
	--mutation-col mutation \
	--dms-output output_files/PAS_dms_esm2_mm.csv \
	--scoring-strategy masked-marginals \
	--offset-idx 1
