#!/bin/bash -l
#SBATCH -D /home/lavila/projects/282inversions/
#SBATCH -J getPCS
#SBATCH -o /home/lavila/projects/282inversions/slurm-log/getPCS_chr3-stdout-%j.log
#SBATCH -e /home/lavila/projects/282inversions/slurm-log/getPCS_chr3-stderr-%j.log
 R --no-save < /home/lavila/projects/282inversions/my-scripts/get_pcs_from_vcf.R

#sbatch -p bigmemm -t 16:00:00  --mem 10000   slurm-scripts/run-getPCS_chr3.sh

