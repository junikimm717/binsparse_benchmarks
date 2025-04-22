#!/bin/bash
#SBATCH --job-name=bsp_csf
#SBATCH --output=./logs/bsp_csf-%j.out
#SBATCH --error=./logs/bsp_csf-%j.err
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=23:00:00
#SBATCH --mem=100G
#SBATCH --account=commit
#SBATCH --partition=lanka-v3
#SBATCH --qos=commit-main
#SBATCH --array=1-21

mkdir -p results_bsp
head -n $SLURM_ARRAY_TASK_ID files.txt\
       	| tail -n 1\
	| awk '{print $2}'\
       	| xargs -L 1 -I {} ./build/benchmark/read_bsp_benchmark {} 20 \
	>> ./results_bsp/csf_$SLURM_ARRAY_TASK_ID.json
