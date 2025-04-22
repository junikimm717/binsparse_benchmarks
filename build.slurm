#!/bin/bash
#SBATCH --job-name=build-frostt-junickim
#SBATCH --output=./logs/build-script.out
#SBATCH --error=./logs/build-script.err
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=06:00:00
#SBATCH --mem=100G
#SBATCH --account=commit
#SBATCH --partition=lanka-v3
#SBATCH --qos=commit-main
#SBATCH --exclusive

mkdir -p logs
mkdir -p build/benchmark || exit 1
mkdir -p build/bin || exit 1
cd build || exit 1

test -d bsp_taco || git clone https://github.com/junikimm717/bsp_taco || exit 1

cd bsp_taco || exit 1
patch -p1 -R --batch --forward < ../../openmp.patch
patch -p1 --batch --forward < ../../openmp.patch

mkdir -p build && cd build || exit 1
cmake .. && cmake --build .

cd .. || exit 1

ln -s $(pwd)/build/benchmark/frostt_tns_bsp ../bin/frostt_tns_bsp

ln -s $(pwd)/build/benchmark/read_bsp_benchmark ../benchmark/read_bsp_benchmark
ln -s $(pwd)/build/benchmark/read_tns_benchmark ../benchmark/read_tns_benchmark
ln -s $(pwd)/build/benchmark/read_splatt_benchmark ../benchmark/read_splatt_benchmark
ln -s $(pwd)/benchmark/read_bsp_benchmark.jl ../benchmark/read_bsp_benchmark.jl

cd .. || exit 1

mkdir -p julia/pkgs && cd julia || exit 1
test -f julia-1.10.9-linux-x86_64.tar.gz || {
curl -LJO https://julialang-s3.julialang.org/bin/linux/x64/1.10/julia-1.10.9-linux-x86_64.tar.gz
tar -xzvf julia-1.10.9-linux-x86_64.tar.gz
}

cat <<EOF > ../bin/julia && chmod +x ../bin/julia || exit 1
#!/bin/sh

export JULIA_HOME_BASE="$(pwd)"
export JULIAUP_HOME="\$JULIA_HOME_BASE/juliaup"
export JULIA_DEPOT_PATH="\$JULIA_HOME_BASE/pkgs"
export JULIA_HISTORY="\$JULIA_HOME_BASE/logs/repl_history.jl"
$(pwd)/julia-1.10.9/bin/julia "\$@"
EOF
../bin/julia -e 'using Pkg; Pkg.add(["Preferences", "Finch", "HDF5", "TensorMarket", "JSON", "BenchmarkTools"]);' || exit 1
