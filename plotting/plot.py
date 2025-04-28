#!/usr/bin/env python3

from pathlib import Path
import json
from pprint import pprint
import numpy as np
import os
import argparse
from matplotlib import pyplot as plt
from matplotlib.ticker import FuncFormatter

dr = Path(os.path.dirname(__file__))

parser = argparse.ArgumentParser(description="plotting script for binsparse paper")
parser.add_argument("results", help="Results File", type=Path)
parser.add_argument("--output", "-o", help="Output File", default=dr/"images"/"plot.png", type=Path)

args = parser.parse_args()

with open(dr / "size.json", "r") as r:
    sizes = json.load(r)
with open(args.results, "r") as r:
    resultjson = json.load(r)

results = {}
nnz = {}

for result in resultjson:
    operation, file = result["operation"], result["filename"]
    times = result["times"]

    if ".coo.bsp.h5" in file:
        operation += "_coo"
    elif ".csf.bsp.h5" in file:
        operation += "_csf"

    nnz[file] = result["nnz"]

    if operation not in results:
        results[operation] = {}
    if file not in results[operation]:
        results[operation][file] = []
    results[operation][file].extend(times[1:])

X, Y = {op: [] for op in results}, {op: [] for op in results}

for operation in results:
    for file, times in results[operation].items():
        X[operation].append(nnz[file])
        Y[operation].append(np.median(times))

def human_readable_bytes(x, _):
    if x >= 1e9:
        return f'{x/1e9:.1f} GB'
    elif x >= 1e6:
        return f'{x/1e6:.1f} MB'
    elif x >= 1e3:
        return f'{x/1e3:.1f} KB'
    else:
        return f'{x:.0f} B'

fig, ax = plt.subplots()
ax.set_xscale('log')
ax.set_yscale('log')
#ax.xaxis.set_major_formatter(FuncFormatter(human_readable_bytes))

ax.set_xlabel("nnz")
ax.set_ylabel("Read Times")
ax.set_title("Performance of various readers")

plt.style.use('tableau-colorblind10')

for operation in results:
    ax.plot(np.array(X[operation]), np.array(Y[operation]), 'o', label=operation)

ax.legend()

output: Path = args.output
os.makedirs(output.parent, exist_ok=True)

plt.savefig(output)
