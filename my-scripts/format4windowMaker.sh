
# use -c <windown number> as parameter
while [[ $# -gt 1 ]]
do
key="$1"

case $key in
    -c|--chromosome)
    CHR="$2"
    shift # past argument
    ;;
    *)
            # unknown option
    ;;
esac
shift # past argument or value
done


cat c${CHR}_indexer_windows.txt | awk -v my_chr=${CHR}  '{print "~/projects/282inversions/my-scripts/window_maker.sh -s "$2" -e "$3" -f ~/projects/282inversions/282/c"my_chr"_282_onHmp321.vcf > ~/projects/282inversions/100KB_windows/chr"my_chr"/c"my_chr"_win_"$1".vcf" }'
