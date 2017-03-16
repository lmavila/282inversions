#!/bin/bash -l
#SBATCH -D /home/lavila/projects/282inversions/WholeG/
#SBATCH -J vcfhetWhole
#SBATCH -o /home/lavila/projects/282inversions/slurm-log/vcfhet_whole-stdout-%j.txt
#SBATCH -e /home/lavila/projects/282inversions/slurm-log/vcfhet_whole-stderr-%j.txt



vcftools --vcf ./all_chr_282_filtered_no_outliers.vcf  --het --out vcf_het_report-whole_no_outliers 

#sbatch -p bigmemm -t 12:00:00  --mem 10000   slurm-scripts/run-vcfhet_whole.sh
