#!/bin/bash -l
#SBATCH -D /group/jrigrp/Share/genotypes/282_7X
#SBATCH -J 282Downloader
#SBATCH -o /home/lavila/projects/282inversions/slurm-log/282Downloader-stdout-%j.txt
#SBATCH -e /home/lavila/projects/282inversions/slurm-log/282Downloader-%j.txt
for OUTPUT  in $(ils /iplant/home/shared/panzea/hapmap3/hmp321/unimputed/282_libs_2015/ |tail -21) 
do
 # tail -n 1  $OUTPUT 
  echo  iget /iplant/home/shared/panzea/hapmap3/hmp321/unimputed/282_libs_2015/$OUTPUT
done 

#sbatch -p bigmemm -t 06:00:00  --mem 10000   slurm-scripts/run-282Downloader.sh

