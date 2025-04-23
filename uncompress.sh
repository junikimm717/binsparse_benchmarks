#!/usr/bin/env bash

DIR="$(realpath "$(dirname "$0")")"
cd $DIR || exit 1
bash ./uncompress.slurm
