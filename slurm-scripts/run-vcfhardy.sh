#!/bin/bash -l
#SBATCH -D /home/lavila/projects/282inversions/WholeG
#SBATCH -J vcfhardy
#SBATCH -o /home/lavila/projects/282inversions/slurm-log/vcfhardy-stdout-%j.txt
#SBATCH -e /home/lavila/projects/282inversions/slurm-log/vcfhardy-stderr-%j.txt
vcftools --vcf all_chr_282_filtered.vcf --chr 3 --hardy
#sbatch -p serial -t 02:00:00  --mem 500   slurm-scripts/run-vcfhardy.sh

