#!/usr/bin/env bash
cd /Applications
subfolder="" # if empty it will check Applications folder + 1 level deep
for i in */;
do
	if [[ $subfolder == "" ]];
	then
		if [[ $i == *.app* ]];
		then
			echo "/Applications/$i: " $(mdls "$i" | grep "Version" )
		elif [[ $i != *.app* ]];
		then
			cd /Applications/"$i"
			for j in */;
			do
				if [[ $j == *.app* ]];
				then
					echo "/Applications/$i/$j: " $(mdls "$j" | grep "Version" )
				fi
			done
		fi
	elif [[ $i == "$subfolder"* ]];
	then
		cd /Applications/"$i"
		for j in */;
		do
			if [[ $j == *.app* ]];
			then
				echo "$j: " $(mdls "$j" | grep "Version" )
			fi
		done
	fi
done
