#!/bin/bash -l
#SBATCH -D /home/lavila/projects/282inversions/
#SBATCH -J DPPrunner
#SBATCH -o /home/lavila/projects/282inversions/slurm-log/DPPrunner-stdout-%j.txt
#SBATCH -e /home/lavila/projects/282inversions/slurm-log/DPPrunner-stderr-%j.txt
#SBATCH --array=101-200
#task=${sue[$SLURM_ARRAY_TASK_ID]}
export R_LIBS="/home/lavila/R_libs"
export MYTASK=$SLURM_ARRAY_TASK_ID
R --vanilla< ~/projects/282inversions/my-scripts/1MBwindowDPP.R

#echo "${task}"
#sbatch -p serial -t 08:00:00  --mem 500   slurm-scripts/run-1MB_DPPrunner_array_2.sh

