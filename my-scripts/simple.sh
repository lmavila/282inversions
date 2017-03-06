for OUTPUT  in $(find . | grep  DPP.log ) 
do
  tail -n 1  $OUTPUT 
done 
