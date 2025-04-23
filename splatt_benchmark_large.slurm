#!/bin/bash
#SBATCH --job-name=splatt
#SBATCH --output=./logs/splatt-%j.out
#SBATCH --error=./logs/splatt-%j.err
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=23:00:00
#SBATCH --mem=100G
#SBATCH --account=commit
#SBATCH --partition=lanka-v3
#SBATCH --qos=commit-main
#SBATCH --array=22-24

mkdir -p results_splatt
head -n $SLURM_ARRAY_TASK_ID files.txt\
       	| tail -n 1\
	| awk '{print $1}'\
       	| xargs -L 1 -I {} ./build/benchmark/read_splatt_benchmark {} 20 \
	>> ./results_splatt/$SLURM_ARRAY_TASK_ID.json
