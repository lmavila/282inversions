#!/bin/bash -l
#SBATCH -D /home/lavila/projects/282inversions/WholeG
#SBATCH -J FilterVCF
#SBATCH -o /home/lavila/projects/282inversions/slurm-log/FilterVCF_2-stdout-%j.txt
#SBATCH -e /home/lavila/projects/282inversions/slurm-log/FilterVCF_2_stderr-%j.txt
module load vcftools/0.1.13
vcftools --vcf all_chr_282_filtered.vcf --min-alleles 2 --max-alleles 2 --max-missing 0.9 --chr 3 --from-bp 80000000 --to-bp 90000000    --recode --stdout  > filtered_region.vcf
#sbatch -p serial -t 06:00:00  --mem 1000   slurm-scripts/run-FilterVCF_2.sh

