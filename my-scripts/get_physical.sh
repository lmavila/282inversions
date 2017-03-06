#usage:
#  ./get_physical -f <vcf_filename>
# that would send to standard output the chromosome and physical location of every line in the vcf excluding headers 
while [[ $# -gt 1 ]]
do
key="$1"

case $key in
    -f|--file)
    FILE_NAME="$2"
    shift # past argument
    ;;
    *)
            # unknown option
    ;;
esac
shift # past argument or value
done

#echo FILE NAME    = "${FILE_NAME}"
cat ${FILE_NAME} | grep '^[0-9]' | awk  '{print $1"\t"$2}'
