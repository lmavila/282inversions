#!/bin/bash -l
#SBATCH -D /home/lavila/projects/282inversions/50KB_windows
#SBATCH -J WMakerFilter
#SBATCH -o /home/lavila/projects/282inversions/slurm-log/WMakerFilter-stdout-%j.txt
#SBATCH -e /home/lavila/projects/282inversions/slurm-log/WMakerFilter-stderr-%j.txt
#SBATCH --array=1000-2000


TASK_ID=$SLURM_ARRAY_TASK_ID
module load vcftools/0.1.13
WINDOW_SIZE=50000
let "end=$TASK_ID*$WINDOW_SIZE"
let "start=($TASK_ID-1)*$WINDOW_SIZE+1"

vcftools --vcf ../282/c3_282_onHmp321.vcf --chr 3 --from-bp $start --to-bp $end --min-alleles 2 --max-alleles 2 --max-missing 0.9 --remove-indv 282set_NC298  --recode --stdout >window_$TASK_ID.vcf
#echo -e "$TASK_ID\t3\t$start\t$end">>index.txt
printf "%s\t3\t%s\t%s\n" $TASK_ID $start $end >>index.txt

#sbatch -p bigmemm  -t 01:00:00  --mem 500   slurm-scripts/run-WindowMakerFilter_50KB.sh

