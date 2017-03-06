#excludes sites with more than 10% missing and 
for INPUT_FILE_NAME in $(ls ../*.vcf ) 
do
 NAME=$(echo $INPUT_FILE_NAME|awk -F '[.|/]' '{print $4  } ')
 OUT_NAME=$NAME"_filtered.vcf"
  vcftools --vcf $INPUT_FILE_NAME --min-alleles 2 --max-alleles 2 --max-missing 0.9 --recode --stdout > ${OUT_NAME} 
done 


