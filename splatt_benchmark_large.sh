#!/usr/bin/env bash

DIR="$(realpath "$(dirname "$0")")"
cd $DIR || exit 1
for SLURM_ARRAY_TASK_ID in $(seq 22 24); do
	export SLURM_ARRAY_TASK_ID=$SLURM_ARRAY_TASK_ID
	bash ./splatt_benchmark_small.slurm
done
