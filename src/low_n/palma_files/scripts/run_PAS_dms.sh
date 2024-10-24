#!/bin/bash
#SBATCH --partition=normal
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=40G
#SBATCH --time=20:00:00

module load palma/2021a
module load GCC
module load OpenMPI
module load PyTorch
module load tqdm
module load CUDA

python scripts/esm_zero-shot.py \
	--model-location /scratch/tmp/ebeurer/esm/esm_weights/esm1v_t33_650M_UR90S_1.pt /scratch/tmp/ebeurer/esm/esm_weights/esm1v_t33_650M_UR90S_2.pt /scratch/tmp/ebeurer/esm/esm_weights/esm1v_t33_650M_UR90S_3.pt /scratch/tmp/ebeurer/esm/esm_weights/esm1v_t33_650M_UR90S_4.pt /scratch/tmp/ebeurer/esm/esm_weights/esm1v_t33_650M_UR90S_5.pt \
	--sequence /scratch/tmp/ebeurer/esm/input_files/PAS_WT.txt \
	--dms-input /scratch/tmp/ebeurer/esm/input_files/PAS_dms.csv \
	--mutation-col mutation \
	--dms-output output_files/PAS_dms_esm1v_mm.csv \
	--scoring-strategy masked-marginals \
	--offset-idx 1
