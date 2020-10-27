#!/usr/bin/env bash
cd /Applications/
for i in */;
do
	# if [[ $i == "Adobe "* ]];
	if [[ $i == "Util"* ]];
	then
		# echo "Inside: $i"
		cd /Applications/"$i"
		for j in */;
		do
			if [[ $j == *.app* ]];
			then
				echo "$j: " $(mdls "$j" | grep "Version" )
			# else
				# echo "$j doesn't seem to be an app"
			fi
		done
	fi
done
