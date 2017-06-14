#!/bin/bash -l
#SBATCH -D /home/lavila/projects/282inversions/1MB_windows/
#SBATCH -J getTasselMDS
#SBATCH -o /home/lavila/projects/282inversions/slurm-log/getTasselMDS_chr3-stdout-%j.log
#SBATCH -e /home/lavila/projects/282inversions/slurm-log/getTasselMDS_chr3-stderr-%j.log
#SBATCH --array=1-242%20
CHR=4
cd chr$(echo $CHR)
mkdir PCS
cd PCS
TASK_ID=$SLURM_ARRAY_TASK_ID
module load jdk/1.8
 /home/lavila/projects/tassel-5-standalone/run_pipeline.pl -Xmx1g -vcf ../window_$(echo $TASK_ID).vcf  -DistanceMatrixPlugin -endPlugin -RemoveNaNFromDistanceMatrixPlugin -endPlugin -MultiDimensionalScalingPlugin -axes 5 -endPlugin -export 

#sbatch -p bigmemm -t 12:00:00  --mem 1000   slurm-scripts/MDSRunner/run-tasselMDS_chr4_1MB_array.sh






