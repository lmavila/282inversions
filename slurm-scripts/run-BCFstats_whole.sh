#!/bin/bash -l
#SBATCH -D /home/lavila/projects/282inversions/WholeG/
#SBATCH -J bcfStats
#SBATCH -o /home/lavila/projects/282inversions/slurm-log/bcfstats_whole-stdout-%j.txt
#SBATCH -e /home/lavila/projects/282inversions/slurm-log/bcfstats_whole-stderr-%j.txt



module load bcftools/1.2  
bcftools stats -s - ./all_chr_282_filtered_no_outliers.vcf >wholeG_stats.txt

#sbatch -p bigmemm -t 12:00:00  --mem 10000   slurm-scripts/run-BCFstats_whole.sh
