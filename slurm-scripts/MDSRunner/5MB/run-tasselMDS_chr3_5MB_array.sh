#!/bin/bash -l
#SBATCH -D /home/lavila/projects/282inversions/5MB_windows/
#SBATCH -J getTasselMDS
#SBATCH -o /home/lavila/projects/282inversions/slurm-log/getTasselMDS_chr3-stdout-%j.log
#SBATCH -e /home/lavila/projects/282inversions/slurm-log/getTasselMDS_chr3-stderr-%j.log
#SBATCH --array=45%20
CHR=3
cd chr$(echo $CHR)
mkdir PCS
cd PCS
TASK_ID=$SLURM_ARRAY_TASK_ID
module load jdk/1.8
 /home/lavila/projects/tassel-5-standalone/run_pipeline.pl -Xmx1g -vcf ../window_$(echo $TASK_ID).vcf  -DistanceMatrixPlugin -endPlugin -RemoveNaNFromDistanceMatrixPlugin -endPlugin -MultiDimensionalScalingPlugin -axes 5 -endPlugin -export 

#sbatch -p bigmemm -t 12:00:00  --mem 10G   slurm-scripts/MDSRunner/5MB/run-tasselMDS_chr3_5MB_array.sh






