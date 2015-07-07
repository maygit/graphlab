
if [ $# -eq 0  ]; then
echo "please input the path"
exit -1
fi

str=gl_merge_"`date +%s`".txt
#echo $str
#echo $1
cat $1 > ~/mzjdata/tmp_result.txt
#cat ~/mzjdata/tmp_result.txt | sort -n -k 2 > ~/mzjdata/$str
if [ $# -eq 2  ]; then
echo "Pagerank: write to tmp file"
str=$2"`date +%s`".txt
#head -n 10 ~/mzjdata/gl_merge_"$str".txt
cat ~/mzjdata/tmp_result.txt | sort -t"," -k2nr,2 > ~/mzjdata/$str
head -n 10 ~/mzjdata/$str

else
echo "WCC: write to tmp file"
str=$2"`date +%s`".txt
#echo -e "\e[1;31m This is red text \e[0m"

cat ~/mzjdata/tmp_result.txt | sort -t"," -k1n,1 > ~/mzjdata/$str
echo -e "\e[0;32m total components count: \e[0m"

#cat ~/mzjdata/$str | awk -F ',' '{print $2}' | uniq -c | wc -l
cat ~/mzjdata/$str | sort -t"," -k2n,2 |awk -F ',' '{print $2}'|uniq -c | wc -l

topn=20
echo -e "\e[0;32m top $topn components \e[0m"
echo "size  comp_id"

#cat ~/mzjdata/$str | awk -F ',' '{print $2}' | uniq -c | head -n $topn
cat ~/mzjdata/$str | sort -t"," -k2n,2 |awk -F ',' '{print $2}' |uniq -c | head -n $topn
fi
rm ~/mzjdata/tmp_result.txt
