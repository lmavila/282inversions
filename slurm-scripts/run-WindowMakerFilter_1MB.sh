#!/bin/bash -l
#SBATCH -D /home/lavila/projects/282inversions/1MB_windows/chr9
#SBATCH -J WMakerFilter
#SBATCH -o /home/lavila/projects/282inversions/slurm-log/WMakerFilter-stdout-%j.txt
#SBATCH -e /home/lavila/projects/282inversions/slurm-log/WMakerFilter-stderr-%j.txt
#SBATCH --array=1-156


# might consider in the future to use --remove-indels to keep only SNP although possible made by tassel when perofrmin MDS

TASK_ID=$SLURM_ARRAY_TASK_ID
module load vcftools/0.1.13
CHR=9
WINDOW_SIZE=1000000
let "end=$TASK_ID*$WINDOW_SIZE"
let "start=($TASK_ID-1)*$WINDOW_SIZE+1"

vcftools --vcf ../../282/c${CHR}_282_onHmp321.vcf --chr $CHR --from-bp $start --to-bp $end --min-alleles 2 --max-alleles 2 --max-missing 0.9 \
 --remove-indv 282set_A659 --remove-indv 282set_CI28AGoodman-Buckler \
 --remove-indv 282set_CML238 --remove-indv 282set_CML321 --remove-indv 282set_EP1 \
 --remove-indv 282set_M14 --remove-indv 282set_Mo44 --remove-indv 282set_NC298 \
 --remove-indv 282set_W182B  --recode --stdout >window_$TASK_ID.vcf
#echo -e "$TASK_ID\t3\t$start\t$end">>index.txt
printf "%s\t%s\t%s\t%s\n" $TASK_ID $CHR  $start $end >>index.txt

#sbatch -p serial  -t 01:00:00  --mem 500   slurm-scripts/run-WindowMakerFilter_1MB.sh

