# use -c <windown number> as parameter
while [[ $# -gt 1 ]]
do
key="$1"

case $key in
    -l|--lsparams)
    LS_PARAMS="$2"
    shift # past argument
    ;;
    *)
            # unknown option
    ;;
esac
shift # past argument or value
done



module load jdk/1.8
#module load tassel/5
for INPUT_FILE_NAME in $(ls ../*.vcf ) 
do
 /home/lavila/projects/tassel-5-standalone/run_pipeline.pl -Xmx1g -vcf ${INPUT_FILE_NAME}  -DistanceMatrixPlugin -endPlugin -RemoveNaNFromDistanceMatrixPlugin -endPlugin -MultiDimensionalScalingPlugin -axes 5 -endPlugin -export 

done 

