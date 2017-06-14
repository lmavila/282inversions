#!/bin/bash -l
#SBATCH -D /home/lavila/projects/282inversions/WholeG
#SBATCH -J bcftools_stats
#SBATCH -o /home/lavila/projects/282inversions/slurm-log/bcfstats-stdout-%j.txt
#SBATCH -e /home/lavila/projects/282inversions/slurm-log/bcfstats-stderr-%j.txt
module load bcftools/1.2
bcftools stats -s - set282_allchr_filtered.vcf.gz | grep PSC  > wholeG.PSC

#sbatch -p bigmemm -t 08:00:00  --mem 500   slurm-scripts/run-bcftools_stats.sh

