#!/bin/bash
#SBATCH -A TRN039
#SBATCH -J qlsa
#SBATCH -o "%x_%j".out
#SBATCH -N 1
#SBATCH -p batch
#SBATCH -t 00:10:00

# Only necessary if submitting this job script like: sbatch --export=NONE ... (recommended)
# Do NOT include this line when submitting without --export=NONE
unset SLURM_EXPORT_ENV

# Set proxy settings so compute nodes can reach internet (required when using a real device)
export all_proxy=socks://proxy.ccs.ornl.gov:3128/
export ftp_proxy=ftp://proxy.ccs.ornl.gov:3128/
export http_proxy=http://proxy.ccs.ornl.gov:3128/
export https_proxy=http://proxy.ccs.ornl.gov:3128/
export no_proxy='localhost,127.0.0.0/8,*.ccs.ornl.gov'

module load miniforge3
source activate /gpfs/wolf2/olcf/stf007/world-shared/9b8/crashcourse_envs/qlsa-solver

shot_count=200

# HHL circuit generator
while [ $shot_count -le 20000 ]; do
	#HHL circuit
	#srun -N1 -n1 -c1 python circuit_HHL.py -case sample-tridiag -casefile input_vars.yaml --savedata
	
	#Simulator srun
	#srun -N1 -n1 -c2 python solver.py -case sample-tridiag -casefile input_vars.yaml -s $shot_count -backtyp ideal --savedata
	
	# Run on emulator
	#srun -N1 -n1 -c2 python solver.py -case sample-tridiag -casefile input_vars.yaml -s $shot_count -backtyp real-iqm -backmet fake_garnet --savedata

	# Run on real device
	#source keys.sh
	srun -N1 -n1 -c2 python solver.py -case sample-tridiag -casefile input_vars.yaml -s $shot_count -backtyp real-iqm -backmet emerald --savedata
	#DONT FORGET TO CHANGE THE BACKMET TO WHATEVER HARDWARE IT"S RUNNING ON	

	echo "Moving to next batch"
	echo "\n"
	echo "$shot_count"
	echo "\n"
	shot_count=$((shot_count+400))

done
# Run on emulator
#srun -N1 -n1 -c2 python solver.py -case sample-tridiag -casefile input_vars.yaml -s 1000 -backtyp real-iqm -backmet fake_garnet --savedata

# Run on real device
#source keys.sh
#srun -N1 -n1 -c2 python solver.py -case sample-tridiag -casefile input_vars.yaml -s 1000 -backtyp real-iqm -backmet garnet --savedata
