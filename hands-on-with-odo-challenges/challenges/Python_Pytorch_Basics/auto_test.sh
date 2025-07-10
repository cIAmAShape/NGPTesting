#!/bin/bash

counter=0

while [ $counter -lt 50 ]; do
	job_count=$(($(squeue --me | wc -l) - 1))
	if [ "$job_count" -ge 3 ]; then
		echo "my job_count > 3, waiting... "
		echo $counter
		sleep 15 
	else
		echo "submitting new pytorch job to squeue"
		sbatch --export=NONE submit_cnn.sbatch
		((counter++))
		echo $counter
		echo "waiting for sake of staggered input..."
		sleep 1
	fi
done
echo "auto_test done. Moving files to to_check/ ..."
mv pytorch_cnn-* to_check
echo "Files moved. Exiting..."

