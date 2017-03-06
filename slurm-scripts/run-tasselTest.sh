#!/bin/bash -l
#SBATCH -D /home/lavila/projects/282inversions/50KB_windows/chr3/TEST/
#SBATCH -J tasselTest
#SBATCH -o /home/lavila/projects/282inversions/slurm-log/TasselTest-stdout-%j.log
#SBATCH -e /home/lavila/projects/282inversions/slurm-log/TasselTest-stderr-%j.log
/home/lavila/projects/282inversions/50KB_windows/chr3/TEST/tasselLine.sh

#sbatch -p bigmemm -t 1:00:00  --mem 10000   slurm-scripts/run-tasselTest.sh 

