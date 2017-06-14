#!/bin/bash -l
#SBATCH -D /home/lavila/projects/282inversions/WholeG
#SBATCH -J vcf_filtering
#SBATCH -o /home/lavila/projects/282inversions/slurm-log/vcf_filtering-stdout-%j.txt
#SBATCH -e /home/lavila/projects/282inversions/slurm-log/vcf_filtering-stderr-%j.txt
module load vcftools/0.1.13
#vcftools --vcf all_chr_282_filtered.vcf --chr 3 --from-bp 7000000  --to-bp 11000000 --indv 282set_NC298  --het  --out NC298_het 
#vcftools --vcf all_chr_282_filtered.vcf --chr 3  --missing-indv --out ch3_missing
vcftools --gzvcf set282_allchr.vcf.gz --min-alleles 2 --max-alleles 2 --max-missing 0.9 --recode -c | gzip -c > set282_allchr_filtered.vcf.gz
#sbatch -p bigmemm -t 16:00:00  --mem 500   slurm-scripts/run-vcf_filtering.sh

