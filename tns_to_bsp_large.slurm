#!/bin/bash
#SBATCH --job-name=download-frostt-junickim
#SBATCH --output=./logs/slurm-juni-frostt-%j.out
#SBATCH --error=./logs/slurm-juni-frostt-%j.err
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=23:00:00
#SBATCH --mem=100G
#SBATCH --account=commit
#SBATCH --partition=lanka-v3
#SBATCH --qos=commit-main
#SBATCH --array=22-24

head -n $SLURM_ARRAY_TASK_ID files.txt | tail -n 1 | xargs -L 1 ../bsp_taco/build/benchmark/frostt_tns_bsp
