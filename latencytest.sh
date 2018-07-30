#!/bin/bash
#
# C: Fahad Ahammed
# WEB: https://fahadahammed.com
#
# Change iplist array according to your need with similar pattern and then run it.
# array of host list sort them with latency.
#
#

iplist=(
'Google 8.8.8.8'
'Twitter twitter.com'
)

echo "You will have the average latency from this list of hosts or websites:- "
echo "......................................................................"

file1="/tmp/f34rfsdflatency.txt"
file2="/tmp/f34rfsdflatency2.txt"

if [ -f $file1 ] ; then
    rm $file1
fi


for each in "${iplist[@]}";
do
	ip=$(echo $each | awk '{print $2}');
	loc=$(echo $each | awk '{print $1}');
	echo $loc;
	latency=$(ping -c 5 $ip | tail -1| awk '{print $4}' | cut -d '/' -f 2);
	if [ ! -z "$latency" ];
	then
		echo $loc $latency >> $file1;
	fi
done

echo -e "\n"

cat $file1 | sort -k2 >> $file2
if [ -f $file1 ] ; then
    rm $file1
fi
mv $file2 $file1
cat $file1
if [ -f $file1 ] ; then
    rm $file1
fi
