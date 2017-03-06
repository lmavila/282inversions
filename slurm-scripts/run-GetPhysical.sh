#!/bin/bash -l
#SBATCH -D /home/lavila/projects/282inversions/
#SBATCH -J GetPhysical
#SBATCH -o /home/lavila/projects/282inversions/slurm-log/GetPhysical-stdout-%j.txt
#SBATCH -e /home/lavila/projects/282inversions/slurm-log/GetPhysical-stderr-%j.txt
~/projects/282inversions/my-scripts/get_physical.sh -s -f /home/lavila/projects/282inversions/282/c1_282_onHmp321.vcf > c1_physical.txt 

#sbatch -p bigmemm -t 02:00:00  --mem 10000   slurm-scripts/run-GetPhysical.sh

