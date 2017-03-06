#!/bin/bash -l
#SBATCH -D /home/lavila/projects/282inversions/WholeG
#SBATCH -J a_cool_job
#SBATCH -o /home/lavila/projects/282inversions/slurm-log/vcf_filtering-stdout-%j.log
#SBATCH -e /home/lavila/projects/282inversions/slurm-log/vcf_filtering-stderr-%j.log
module load vcftools/0.1.13
#vcftools --vcf /home/lavila/projects/282inversions/282/c3_282_onHmp321.vcf --min-alleles 2 --max-alleles 2 --max-missing 0.95  --recode --stdout > c3_282_filtered.vcf
vcftools --vcf /home/lavila/projects/282inversions/282/c1_282_onHmp321.vcf --min-alleles 2 --max-alleles 2 --max-missing 0.95  --recode --stdout > c1_282_filtered.vcf
vcftools --vcf /home/lavila/projects/282inversions/282/c2_282_onHmp321.vcf --min-alleles 2 --max-alleles 2 --max-missing 0.95  --recode --stdout > c2_282_filtered.vcf
vcftools --vcf /home/lavila/projects/282inversions/282/c4_282_onHmp321.vcf --min-alleles 2 --max-alleles 2 --max-missing 0.95  --recode --stdout > c4_282_filtered.vcf
vcftools --vcf /home/lavila/projects/282inversions/282/c5_282_onHmp321.vcf --min-alleles 2 --max-alleles 2 --max-missing 0.95  --recode --stdout > c5_282_filtered.vcf
vcftools --vcf /home/lavila/projects/282inversions/282/c6_282_onHmp321.vcf --min-alleles 2 --max-alleles 2 --max-missing 0.95  --recode --stdout > c6_282_filtered.vcf
vcftools --vcf /home/lavila/projects/282inversions/282/c7_282_onHmp321.vcf --min-alleles 2 --max-alleles 2 --max-missing 0.95  --recode --stdout > c7_282_filtered.vcf
vcftools --vcf /home/lavila/projects/282inversions/282/c8_282_onHmp321.vcf --min-alleles 2 --max-alleles 2 --max-missing 0.95  --recode --stdout > c8_282_filtered.vcf
vcftools --vcf /home/lavila/projects/282inversions/282/c9_282_onHmp321.vcf --min-alleles 2 --max-alleles 2 --max-missing 0.95  --recode --stdout > c9_282_filtered.vcf
vcftools --vcf /home/lavila/projects/282inversions/282/c10_282_onHmp321.vcf --min-alleles 2 --max-alleles 2 --max-missing 0.95  --recode --stdout > c10_282_filtered.vcf

#sbatch -p bigmemm -t 12:00:00  --mem 10000   slurm-scripts/run-VCF_filter_chr3_whole.sh 

