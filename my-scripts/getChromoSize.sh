for i in {1..10}; do
  echo "size in Mb for chr: "$i
  tail -n 1  ../282/c${i}_282_onHmp321.vcf | awk -e '{print int($2/1e6)}' 

done
