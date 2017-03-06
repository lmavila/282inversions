#!/bin/bash -l
#SBATCH -D /home/lavila/projects/282inversions/WholeG
#SBATCH -J a_cool_job
#SBATCH -o /home/lavila/projects/282inversions/slurm-log/vcf_filtering-stdout-%j.log
#SBATCH -e /home/lavila/projects/282inversions/slurm-log/vcf_filtering-stderr-%j.log
module load vcftools/0.1.13

vcftools --vcf all_chr_282_filtered.vcf --remove-indv  282set_NC298  --recode --stdout > all_chr_282_filtered_298OUT.vcf

#sbatch -p bigmemm -t 12:00:00  --mem 10000   slurm-scripts/run-VCF_filter_remNC298_whole.sh 

