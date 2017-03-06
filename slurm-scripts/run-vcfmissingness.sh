#!/bin/bash -l
#SBATCH -D /home/lavila/projects/282inversions/WholeG
#SBATCH -J vcfmissing
#SBATCH -o /home/lavila/projects/282inversions/slurm-log/vcfmissing-stdout-%j.txt
#SBATCH -e /home/lavila/projects/282inversions/slurm-log/vcfmissing-stderr-%j.txt
module load vcftools/0.1.13
#vcftools --vcf all_chr_282_filtered.vcf --chr 3 --from-bp 7000000  --to-bp 11000000 --indv 282set_NC298  --het  --out NC298_het 
vcftools --vcf all_chr_282_filtered.vcf --chr 3  --missing-indv --out ch3_missing
#sbatch -p serial -t 02:00:00  --mem 500   slurm-scripts/run-vcfmissingness.sh

