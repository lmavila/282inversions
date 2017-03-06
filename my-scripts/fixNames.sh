ls *PC*| grep NaN |awk -F '[.|:|" "]' '{print "mv "$1":"$2"\\ "$3"\\ "$4"\\ "$5".txt  "$2".pcs"}'
ls *PC* |awk -F '[.|:|" "]' '{print "mv "$1":"$2"."$3" "$4" "$5" "$2".pcs"}'
