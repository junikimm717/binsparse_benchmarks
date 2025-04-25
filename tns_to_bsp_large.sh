#!/usr/bin/env bash

DIR="$(realpath "$(dirname "$0")")"
cd $DIR || exit 1
for SLURM_ARRAY_TASK_ID in $(seq 22 22); do
	export SLURM_ARRAY_TASK_ID=$SLURM_ARRAY_TASK_ID
	bash ./tns_to_bsp_large.slurm
done
