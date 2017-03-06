#!/bin/bash -l
#SBATCH -D /home/lavila/projects/282inversions/
#SBATCH -J WindowMaker
#SBATCH -o /home/lavila/projects/282inversions/slurm-log/WindowMaker-stdout-%j.txt
#SBATCH -e /home/lavila/projects/282inversions/slurm-log/WindowMaker-stderr-%j.txt
#R --no-save < profiling/Verbose.R
~/projects/282inversions/my-scripts/window_maker.sh -s 1 -e 10000 -f /home/lavila/projects/282inversions/282/c1_282_onHmp321.vcf >salida_1.sal
~/projects/282inversions/my-scripts/window_maker.sh -s 10001 -e 20000 -f /home/lavila/projects/282inversions/282/c1_282_onHmp321.vcf >salida_2.sal

#sbatch -p bigmemm -t 02:00:00  --mem 10000   slurm-scripts/run-WindowMaker.sh

