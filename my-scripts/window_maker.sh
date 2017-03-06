#!/bin/bash
# usage:
#  ./window_maker -s 1 -e 100 -f <filename>
# that would send to standard output lines 1 to 100 from <filename>
while [[ $# -gt 1 ]]
do
key="$1"

case $key in
    -s|--start)
    START="$2"
    shift # past argument
    ;;
    -e|--end)
    END="$2"
    shift # past argument
    ;;
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

#adding 25 to skip the headers
let START=$START+25
let END=$END+26
#echo WINDOW START  = "${START}"
#echo WINDOW END    = "${END}"
#echo FILE NAME    = "${FILE_NAME}"
HEADER=$(head -n 25 $FILE_NAME)
echo "$HEADER"
sed -n "${END}q;${START},${END}p" ${FILE_NAME}

