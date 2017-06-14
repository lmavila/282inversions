#!/bin/bash -l
#SBATCH -D /home/lavila/projects/282inversions/WholeG/
#SBATCH -J concat282
#SBATCH -o /home/lavila/projects/282inversions/slurm-log/concat282-stdout-%j.txt
#SBATCH -e /home/lavila/projects/282inversions/slurm-log/concat282-stderr-%j.txt

module load vcftools

vcf-concat ../282_7X/c1_282_corrected_onHmp321.vcf.gz  ../282_7X/c2_282_corrected_onHmp321.vcf.gz  ../282_7X/c3_282_corrected_onHmp321.vcf.gz \
 ../282_7X/c4_282_corrected_onHmp321.vcf.gz ../282_7X/c5_282_corrected_onHmp321.vcf.gz   ../282_7X/c6_282_corrected_onHmp321.vcf.gz \
  ../282_7X/c7_282_corrected_onHmp321.vcf.gz ../282_7X/c8_282_corrected_onHmp321.vcf.gz   ../282_7X/c9_282_corrected_onHmp321.vcf.gz \
  ../282_7X/c10_282_corrected_onHmp321.vcf.gz | gzip -c > set282_allchr.vcf.gz

#sbatch -p bigmemm -t 12:00:00  --mem 100   slurm-scripts/run-concat_282.sh

