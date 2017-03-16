#!/bin/bash -l
#SBATCH -D /home/lavila/projects/282inversions/WholeG/hetReports
#SBATCH -J vcfhet
#SBATCH -o /home/lavila/projects/282inversions/slurm-log/vcfhet-stdout-%j.txt
#SBATCH -e /home/lavila/projects/282inversions/slurm-log/vcfhet-stderr-%j.txt
#SBATCH --array=1-232


TASK_ID=$SLURM_ARRAY_TASK_ID

WINDOW_SIZE=1000000
let "END=$TASK_ID*$WINDOW_SIZE"
let "START=($TASK_ID-1)*$WINDOW_SIZE+1"

vcftools --vcf ../all_chr_282_filtered_no_outliers.vcf --chr 3 --from-bp $START  --to-bp $END --het --out chr3_window_$TASK_ID 

#sbatch -p serial -t 02:00:00  --mem 500   slurm-scripts/run-vcfhet.sh

