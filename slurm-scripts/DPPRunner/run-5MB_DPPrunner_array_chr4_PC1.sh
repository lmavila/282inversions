#!/bin/bash -l
#SBATCH -D /home/lavila/projects/282inversions/
#SBATCH -J DPPrunner
#SBATCH -o /home/lavila/projects/282inversions/slurm-log/DPPrunner-stdout-%j.txt
#SBATCH -e /home/lavila/projects/282inversions/slurm-log/DPPrunner-stderr-%j.txt
#SBATCH --array=13,34
#SBATCH --exclude=bigmem10
export R_LIBS="/home/lavila/R_libs"
export MYTASK=$SLURM_ARRAY_TASK_ID
export CHR=4
R --vanilla< ~/projects/282inversions/my-scripts/5MBwindowDPP_PC1.R
#loop for 1-49
#sbatch -p bigmemm -t 08:00:00  --mem 500   slurm-scripts/DPPRunner/run-5MB_DPPrunner_array_chr4_PC1.sh

