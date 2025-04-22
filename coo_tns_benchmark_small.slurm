#!/bin/bash
#SBATCH --job-name=tns_benchmark_small
#SBATCH --output=./logs/slurm-juni-frostt-%j.out
#SBATCH --error=./logs/slurm-juni-frostt-%j.err
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=23:00:00
#SBATCH --mem=100G
#SBATCH --account=commit
#SBATCH --partition=lanka-v3
#SBATCH --qos=commit-main
#SBATCH --array=1-21

mkdir -p results_tns
head -n $SLURM_ARRAY_TASK_ID files.txt\
       	| tail -n 1\
	| awk '{print $1}'\
       	| xargs -L 1 -I {} ../bsp_taco/build/benchmark/read_tns_benchmark {} 20 coo \
	>> ./results_tns/$SLURM_ARRAY_TASK_ID.json
