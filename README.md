# Frostt Binsparse Benchmarking Repository

**Note**: All SLURM Jobs must be run from the root directory.

## Dependencies

You should be on an x86 system with glibc and the following **required** libraries/programs:

1. CMake and a working C++ compiler (building)
2. HDF5 (binsparse)
3. OpenBLAS (splatt benchmarking)
4. LAPACK (splatt benchmarking)

Some of the benchmarking scripts use julia, but this gets automatically
installed with the build script.

## Setup

You **must manually create** the `logs` directory before proceeding.

These jobs were intended for use on the COMMIT group's lanka cluster, but
should be configurable for use elsewhere.

In order to set up all experiments, you must run `./build.slurm`,
`download.slurm`, `uncompress.slurm`, and `tns_to_bsp_small.slurm`, all in
succession. As these are all bash scripts, there is no strict need to
use slurm.

## Relevant Experiment Jobs

Currently, we run experiments on all tensors except the three largest, as those
resulted in OOM issues when attempting to convert to binsparse.

```
coo_bsp_benchmark_small.slurm
coo_finch_benchmark_small.slurm
csf_bsp_benchmark_small.slurm
csf_finch_benchmark_small.slurm
splatt_benchmark_small.slurm
splatt_benchmark_large.slurm
```

In order to run these jobs without slurm, run the same files but replacing the
`slurm` extension with `sh`.
