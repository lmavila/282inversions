#!/bin/bash -l
#SBATCH -D /home/lavila/projects/282inversions/1MB_windows/chr4/PCS/
#SBATCH -J getTasselMDS
#SBATCH -o /home/lavila/projects/282inversions/slurm-log/getTasselMDS_chr4-stdout-%j.log
#SBATCH -e /home/lavila/projects/282inversions/slurm-log/getTasselMDS_chr4-stderr-%j.log
#SBATCH --array=1-241
TASK_ID=$SLURM_ARRAY_TASK_ID
module load jdk/1.8
#/home/lavila/projects/282inversions/my-scripts/runTasselMDS.sh -l ../window_$TASK_ID.vcf
 /home/lavila/projects/tassel-5-standalone/run_pipeline.pl -Xmx1g -vcf ../window_$TASK_ID.vcf  -DistanceMatrixPlugin -endPlugin -RemoveNaNFromDistanceMatrixPlugin -endPlugin -MultiDimensionalScalingPlugin -axes 5 -endPlugin -export 

#sbatch -p bigmemm -t 12:00:00  --mem 10000   slurm-scripts/run-tasselMDS_chr4_1MB_array.sh






