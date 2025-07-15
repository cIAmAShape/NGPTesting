#!/bin/bash

counter=0

while [ $counter -lt 100 ]; do
	job_count=$(($(squeue --me | wc -l) - 1))
	if [ "$job_count" -ge 4 ]; then
		echo "my job_count > 4, waiting... "
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
sleep 1200
mv pytorch_cnn-* to_check
echo "Files moved. Exiting..."

