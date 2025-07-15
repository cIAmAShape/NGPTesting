#!/bin/bash

best_score=0
best_file="string"

for file in pytorch_cnn*; do
	echo "searching $file" >> results.txt
	grep "Batch size:*" $file >> results.txt
	grep "Number of epochs:*" $file >> results.txt
	grep "Accuracy of the*" $file >> results.txt
	temp_score=$(grep "Accuracy of the network: [0-9]" $file | grep -o '[0-9][0-9].[0-9][0-9]' | tr -d '.')
	int_temp_score=$(( temp_score + 0 ))
	
	if [ $int_temp_score -gt $best_score ]; then
		best_score=$int_temp_score
		best_file=$file
	fi 


	grep "Execution time of training*" $file >> results.txt
	echo -e "\n" >> results.txt
done
echo "Top run: $best_file" >> results.txt
best_score="${best_score:0:2}.${best_score:2:2}"
echo "Accuracy of top run: $best_score %" >> results.txt
echo -e "\n" >> results.txt

