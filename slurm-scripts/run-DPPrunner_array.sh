#!/bin/bash -l
#SBATCH -D /home/lavila/projects/282inversions/
#SBATCH -J DPPrunner
#SBATCH -o /home/lavila/projects/282inversions/slurm-log/DPPrunner-stdout-%j.txt
#SBATCH -e /home/lavila/projects/282inversions/slurm-log/DPPrunner-stderr-%j.txt
#SBATCH --array=1001-1010
sue=( 1 2 3 4 5 6 7 8 9 10 )
#task=${sue[$SLURM_ARRAY_TASK_ID]}
export R_LIBS="/home/lavila/R_libs"
export MYTASK=$SLURM_ARRAY_TASK_ID
R --vanilla< ~/projects/282inversions/my-scripts/windowDPP.R

#echo "${task}"
#sbatch -p bigmemm -t 12:00:00  --mem 500   slurm-scripts/run-DPPrunner_array.sh

