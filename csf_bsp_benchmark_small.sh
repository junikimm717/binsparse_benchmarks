#!/usr/bin/env bash

DIR="$(realpath "$(dirname "$0")")"
cd $DIR || exit 1
for SLURM_ARRAY_TASK_ID in $(seq 1 21); do
	export SLURM_ARRAY_TASK_ID=$SLURM_ARRAY_TASK_ID
	bash ./csf_bsp_benchmark_small.slurm
done
