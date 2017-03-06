#!/bin/bash -l
#SBATCH -D /home/lavila/projects/282inversions/100k_indexes
#SBATCH -J LIndexer
#SBATCH -o /home/lavila/projects/282inversions/slurm-log/LineIndexMaker-stdout-%j.txt
#SBATCH -e /home/lavila/projects/282inversions/slurm-log/LineIndexMaker-stderr-%j.txt
#SBATCH --array=0-9
sue=( 1 2 3 4 5 6 7 8 9 10 )
task=${sue[$SLURM_ARRAY_TASK_ID]}
~/projects/282inversions/my-scripts/line_index_maker.pl -i /home/lavila/projects/282inversions/282/c${task}_282_onHmp321.vcf -s 100000 -v  >c${task}_indexer_windows.txt 
#echo "${task}"
#sbatch -p bigmemm -t 08:00:00  --mem 10000   slurm-scripts/run-LineIndexMaker_array.sh

