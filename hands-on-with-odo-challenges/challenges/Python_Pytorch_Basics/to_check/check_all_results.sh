#!/bin/bash

for file in pytorch_cnn*; do
	echo "searching $file" >> results.txt
	grep "Batch size:*" $file >> results.txt
	grep "Number of epochs:*" $file >> results.txt
	grep "Accuracy of the*" $file >> results.txt
	echo -e "\n" >> results.txt
done
