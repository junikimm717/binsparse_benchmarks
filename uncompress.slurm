#!/bin/bash
#SBATCH --job-name=uncompress-tensors
#SBATCH --output=./logs/tensors.out
#SBATCH --error=./logs/tensors.err
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=06:00:00
#SBATCH --mem=100G
#SBATCH --account=commit
#SBATCH --partition=lanka-v3
#SBATCH --qos=commit-main
#SBATCH --exclusive

cd tensors || exit 1
ls *.gz | xargs -n 1 gunzip
