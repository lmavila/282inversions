#!/bin/bash -l
#SBATCH -D /home/lavila/projects/282inversions/WholeG
#SBATCH -J vcfmissing
#SBATCH -o /home/lavila/projects/282inversions/slurm-log/vcfmissing-stdout-%j.txt
#SBATCH -e /home/lavila/projects/282inversions/slurm-log/vcfmissing-stderr-%j.txt
module load vcftools/0.1.13
#vcftools --gzvcf set282_allchr.vcf.gz  --missing-indv --out all_chr_missing
vcftools --gzvcf set282_allchr_filtered.vcf.gz --missing-indv --out all_chr_filtered_missing

#sbatch -p bigmemm -t 08:00:00  --mem 500   slurm-scripts/run-vcfmissingness.sh

