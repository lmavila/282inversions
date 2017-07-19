#!/bin/bash -l
#SBATCH -D /home/lavila/projects/282inversions/5MB_windows/
#SBATCH -J WMakerFilter
#SBATCH -o /home/lavila/projects/282inversions/slurm-log/WMakerFilter-stdout-%j.txt
#SBATCH -e /home/lavila/projects/282inversions/slurm-log/WMakerFilter-stderr-%j.txt
#SBATCH --array=1-49%20

#242 / 5 = 48.4
# might consider in the future to use --remove-indels to keep only SNP although possible made by tassel when perofrmin MDS

TASK_ID=$SLURM_ARRAY_TASK_ID
module load vcftools/0.1.13
CHR=4
WINDOW_SIZE=5000000
WINDOW_INCREMENT=5000000
let "start=($TASK_ID-1)*$WINDOW_INCREMENT+1"
let "end=$TASK_ID*$WINDOW_SIZE"
mkdir chr$CHR
cd chr$CHR
vcftools --gzvcf ../../282_7X/c${CHR}_282_corrected_onHmp321.vcf.gz  --chr $CHR --from-bp $start --to-bp $end --min-alleles 2 --max-alleles 2 --max-missing 0.9 \
 --remove-indv 282set_A554 --remove-indv 282set_B104 \
 --remove-indv 282set_CML238 --remove-indv 282set_CML341 --remove-indv 282set_E2558W \
 --remove-indv 282set_Mo44 --remove-indv 282set_SD44 --remove-indv 282set_Va14 \
  --recode --stdout >window_$TASK_ID.vcf
#echo -e "$TASK_ID\t3\t$start\t$end">>index.txt
printf "%s\t%s\t%s\t%s\n" $TASK_ID $CHR  $start $end >>chr$(echo $CHR)_index.txt

#sbatch -p bigmemm  -t 03:00:00  --mem 500   slurm-scripts/windowMaker/run-WindowMakerFilter_5MB_chr4.sh

