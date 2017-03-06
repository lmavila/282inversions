#!/bin/bash -l
#SBATCH -D /home/lavila/projects/282inversions/50KB_windows/chr3/PCS/
#SBATCH -J getTasselPCS
#SBATCH -o /home/lavila/projects/282inversions/slurm-log/getTasselPCS_chr3-stdout-%j.log
#SBATCH -e /home/lavila/projects/282inversions/slurm-log/getTasselPCS_chr3-stderr-%j.log
/home/lavila/projects/282inversions/my-scripts/runTasselMDS.sh -l ../*.vcf

#sbatch -p bigmemm -t 12:00:00  --mem 10000   slurm-scripts/run-tasselPCS_chr3_50kb.sh 

