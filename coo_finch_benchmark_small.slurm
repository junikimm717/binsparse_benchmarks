#!/bin/bash
#SBATCH --job-name=finch_coo
#SBATCH --output=./logs/finch_coo-%j.out
#SBATCH --error=./logs/finch_coo-%j.err
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=23:00:00
#SBATCH --mem=100G
#SBATCH --account=commit
#SBATCH --partition=lanka-v3
#SBATCH --qos=commit-main
#SBATCH --array=1-21

mkdir -p results_finch
head -n $SLURM_ARRAY_TASK_ID files.txt\
       	| tail -n 1\
	| awk '{print $3}'\
       	| xargs -L 1 -I {} ./build/bin/julia ./build/benchmark/read_bsp_benchmark.jl {} 21 \
	>> ./results_finch/coo_$SLURM_ARRAY_TASK_ID.json

head -n $SLURM_ARRAY_TASK_ID files.txt\
       	| tail -n 1\
	| awk '{print $3}'\
	| sed "s/coo/coo-uncomp/g"\
       	| xargs -L 1 -I {} ./build/bin/julia ./build/benchmark/read_bsp_benchmark.jl {} 21 \
	>> ./results_finch/uncomp_coo_$SLURM_ARRAY_TASK_ID.json
