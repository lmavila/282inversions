#!/bin/bash -l
#SBATCH -D /home/lavila/projects/282inversions/WholeG
#SBATCH -J a_cool_job
#SBATCH -o /home/lavila/projects/282inversions/slurm-log/vcf_filtering-stdout-%j.log
#SBATCH -e /home/lavila/projects/282inversions/slurm-log/vcf_filtering-stderr-%j.log
module load vcftools/0.1.13

vcftools --vcf all_chr_282_filtered.vcf --remove-indv 282set_A659 --remove-indv 282set_CI28AGoodman-Buckler \
 --remove-indv 282set_CML238 --remove-indv 282set_CML321 --remove-indv 282set_EP1 \
 --remove-indv 282set_M14 --remove-indv 282set_Mo44 --remove-indv 282set_NC298 \
 --remove-indv 282set_W182B --recode --stdout > all_chr_282_filtered_no_outliers.vcf

#sbatch -p bigmemm -t 12:00:00  --mem 10000   slurm-scripts/run-VCF_filter_remove_outliers.sh 

