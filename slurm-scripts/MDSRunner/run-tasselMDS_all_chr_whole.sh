#!/bin/bash -l
#SBATCH -D /home/lavila/projects/282inversions/WholeG
#SBATCH -J getTasselMDS
#SBATCH -o /home/lavila/projects/282inversions/slurm-log/getTasselMDS_all_chr-stdout-%j.log
#SBATCH -e /home/lavila/projects/282inversions/slurm-log/getTasselMDS_all_chr-stderr-%j.log
module load jdk/1.8
 /home/lavila/projects/tassel-5-standalone/run_pipeline.pl -Xmx120g -vcf set282_allchr_filtered.vcf.gz  -DistanceMatrixPlugin -endPlugin -RemoveNaNFromDistanceMatrixPlugin -endPlugin -MultiDimensionalScalingPlugin -axes 5 -endPlugin -export 
# /home/lavila/projects/tassel-5-standalone/run_pipeline.pl -Xmx10g -vcf  all_chr_282_filtered.vcf -MultiDimensionalScalingPlugin -axes 5 -endPlugin -export 


#sbatch -p bigmemm -t 12:00:00  --mem 150G   slurm-scripts/MDSRunner/run-tasselMDS_all_chr_whole.sh 

