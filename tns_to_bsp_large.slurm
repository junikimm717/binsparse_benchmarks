#!/bin/bash
#SBATCH --job-name=frostt_to_bsp_jl
#SBATCH --output=./logs/frostt_to_bsp-%j.out
#SBATCH --error=./logs/frostt_to_bsp-%j.err
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=23:00:00
#SBATCH --mem=100G
#SBATCH --account=commit
#SBATCH --partition=lanka-v3
#SBATCH --qos=commit-main
#SBATCH --array=22-22

head -n $SLURM_ARRAY_TASK_ID files.txt | tail -n 1 | awk '{print $1, $2}' | xargs -n 2 sh -c './build/bin/julia ./build/bsp_taco/benchmark/frostt_tns_bsp.jl "$0" "$1" csf'
head -n $SLURM_ARRAY_TASK_ID files.txt | tail -n 1 | awk '{print $1, $3}' | xargs -n 2 sh -c './build/bin/julia ./build/bsp_taco/benchmark/frostt_tns_bsp.jl "$0" "$1" coo'
