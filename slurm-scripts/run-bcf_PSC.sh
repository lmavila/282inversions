#!/bin/bash -l
#SBATCH -D /home/lavila/projects/282inversions/1MB_windows/chr3/PSC_report
#SBATCH -J bcfPSC
#SBATCH -o /home/lavila/projects/282inversions/slurm-log/bcfPSC-stdout-%j.txt
#SBATCH -e /home/lavila/projects/282inversions/slurm-log/bcfPSC-stderr-%j.txt




module load bcftools/1.2  
for INPUT_FILE_NAME in $(ls ../*.vcf ) 
do
  PREFIX=$(echo $INPUT_FILE_NAME |awk -F "[ / | .]" '{print $4}')
  bcftools stats -s - ${INPUT_FILE_NAME} | grep PSC  >${PREFIX}.PSC
done 

#sbatch -p serial -t 02:00:00  --mem 10000   slurm-scripts/run-bcf_PSC.sh 

