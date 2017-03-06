#!/bin/bash -l
#SBATCH -D /home/lavila/projects/282inversions/100KB_windows/chr3/filtered/
#SBATCH -J FilterVCF
#SBATCH -o /home/lavila/projects/282inversions/slurm-log/FilterVCF-stdout-%j.txt
#SBATCH -e /home/lavila/projects/282inversions/slurm-log/FilterVCF-stderr-%j.txt
module load vcftools/0.1.13
~/projects/282inversions/my-scripts/filterMissing.sh

#sbatch -p bigmemm -t 06:00:00  --mem 10000   slurm-scripts/run-FilterVCF.sh

